Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E0850F0D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2019 16:49:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45XXHq2kNgzDqKK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 00:49:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45XXBQ6tJ8zDqKK;
 Tue, 25 Jun 2019 00:44:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45XXBP2K0pz9s6w;
 Tue, 25 Jun 2019 00:44:44 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: oss-security@lists.openwall.com
Subject: CVE-2019-12817: Linux kernel: powerpc: Unrelated processes may be
 able to read/write to each other's virtual memory
Date: Tue, 25 Jun 2019 00:44:31 +1000
Message-ID: <87lfxr82ls.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha256; protocol="application/pgp-signature"
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linuxppc-users@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--=-=-=
Content-Type: text/plain

The Linux kernel for powerpc since 4.17 has a bug where unrelated processes may
be able to read/write to each other's virtual memory under certain conditions.

This bug only affects machines using 64-bit CPUs with the hash page table MMU,
see below for more detail on affected CPUs.

To trigger the bug a process must allocate memory above 512TB. That only happens
if userspace explicitly requests it with mmap(). That process must then fork(),
at this point the child incorrectly inherits the "context id" of the parent
associated with the mapping above 512TB. It may then be possible for the
parent/child to write to each other's mappings above 512TB, which should not be
possible, and constitutes memory corruption.

If instead the child process exits, all its context ids are freed, including the
context id that is still in use by the parent for the mapping above 512TB. That
id can then be reallocated to a third process, that process can then read/write
to the parent's mapping above 512TB. Additionally if the freed id is used for
the third process's primary context id, then the parent is able to read/write to
the third process's mappings *below* 512TB.

If the parent and child both exit before another process is allocated the freed
context id, the kernel will notice the double free of the id and print a warning
such as:

  ida_free called for id=103 which is not allocated.
  WARNING: CPU: 8 PID: 7293 at lib/idr.c:520 ida_free_rc+0x1b4/0x1d0

The bug was introduced in commit:
  f384796c40dc ("powerpc/mm: Add support for handling > 512TB address in SLB miss")

Which was originally merged in v4.17.

Only machines using the hash page table (HPT) MMU are affected, eg. PowerPC 970
(G5), PA6T, Power5/6/7/8/9. By default Power9 bare metal machines (powernv) use
the Radix MMU and are not affected, unless the machine has been explicitly
booted in HPT mode (using disable_radix on the kernel command line). KVM guests
on Power9 may be affected if the host or guest is configured to use the HPT MMU.
LPARs under PowerVM on Power9 are affected as they always use the HPT MMU.
Kernels built with PAGE_SIZE=4K are not affected.

The upstream fix is here:

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ca72d88378b2f2444d3ec145dd442d449d3fefbc

There's also a kernel selftest to verify the fix:

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=16391bfc862342f285195013b73c1394fab28b97

Or a similar standalone version is included below.

cheers


cat > test.c <<EOF
#undef NDEBUG

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>

#ifndef MAP_FIXED_NOREPLACE
#define MAP_FIXED_NOREPLACE	MAP_FIXED	// "Should be safe" above 512TB
#endif

int main(void)
{
	int p2c[2], c2p[2], rc, status, c, *p;
	unsigned long page_size;
	pid_t pid;

	page_size = sysconf(_SC_PAGESIZE);
	if (page_size != 65536) {
		printf("Unsupported page size - not affected\n");
		return 1;
	}

	// Create a mapping at 512TB to allocate an extended_id
	p = mmap((void *)(512ul << 40), page_size, PROT_READ | PROT_WRITE,
		MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED_NOREPLACE, -1, 0);
	if (p == MAP_FAILED) {
		perror("mmap");
		printf("Error: couldn't mmap(), confirm kernel has 4TB support\n");
		return 1;
	}

	printf("parent writing %p = 1\n", p);
	*p = 1;

	assert(pipe(p2c) != -1 && pipe(c2p) != -1);

	pid = fork();
	if (pid == 0) {
		close(p2c[1]);
		close(c2p[0]);
		assert(read(p2c[0], &c, 1) == 1);

		pid = getpid();
		printf("child writing  %p = %d\n", p, pid);
		*p = pid;

		assert(write(c2p[1], &c, 1) == 1);
		assert(read(p2c[0], &c, 1) == 1);
		exit(0);
	}
	close(p2c[0]);
	close(c2p[1]);

	c = 0;
	assert(write(p2c[1], &c, 1) == 1);
	assert(read(c2p[0], &c, 1) == 1);

	// Prevent compiler optimisation
	asm volatile("" : : : "memory");

	rc = 0;
	printf("parent reading %p = %d\n", p, *p);
	if (*p != 1) {
		printf("Error: BUG! parent saw child's write! *p = %d\n", *p);
		rc = 1;
	}

	assert(write(p2c[1], &c, 1) == 1);
	assert(waitpid(pid, &status, 0) != -1);
	assert(WIFEXITED(status) && WEXITSTATUS(status) == 0);

	if (rc == 0)
		printf("success: test completed OK\n");

	return rc;
}
EOF

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAl0Q4c8ACgkQUevqPMjh
pYBBARAAqM95nzwHVCnSIMUqAqRSuLV3UOx4KxNylmdSu3ig42AgS75KeCYyBKuT
q8bXq4sSKS5mZAp42/YgaIQpBtv8nOGutMSivZEJmMNnL3riEd7bT63BOw8EnA20
ryhXsqf504anqzPXYv7P5xKeoQjEbK7MhuaN9d86erot/6cWh7tCcIF0SdiPGX3W
PLlPrptRMnPCm0QhKCZxlKPxd3qd+HPNr2RVP2bIbv+8x0fldVTR+N2+gD+a5i5p
rLsxERpaAsPvDbQNeXN/9Wck19wx+ZQMlCxStSY+VECM2jwsXty2f93hZmQ5Nm5E
HV+nE57IF7tI/7lrlQfQ3Xml5bhVnFXwxQhbdeZfxg5vKm8YDSB0Vu0FaA59TqK7
ANS2VLgGZV+F0VqCkWx3mVgmJsAAKfOrTjqsQAV0zH42siyYV9AvKZDdYYOxbbkf
ZZjol8VGh684uKxZRlHeGMBL0kztUE32FiNqrhioJfpCkNhBKPcTljfVgHdPYfzz
ULAd4QoIUcKa4RgNN5KQgMpxajXgaLxqk8K8R566dRz1KyZnpIn41v3Mq88ApBTv
0UQarN0AYEyWyO+YI7Q0ngFWxrrcVhA9nFMRXdIdfI581hBqtWPbvItEMFVy30fZ
3FXzj07zCVIqm7oy21QabFaLUPAEopARj7ByxutyPJT8efdhkRc=
=21oU
-----END PGP SIGNATURE-----
--=-=-=--
