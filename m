Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F40CE3230C
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Jun 2019 13:06:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45GwNX3243zDqSl
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Jun 2019 21:06:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45GwMF2L0LzDqPS
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Jun 2019 21:05:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45GwMD4zdSz9s00;
 Sun,  2 Jun 2019 21:05:12 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.2-3 tag
Date: Sun, 02 Jun 2019 21:05:12 +1000
Message-ID: <878suknt7b.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: ravi.bangoria@linux.ibm.com, anju@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi Linus,

Please pull some more powerpc fixes for 5.2:

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.2-3

for you to fetch changes up to 8b909e3548706cbebc0a676067b81aadda57f47e:

  powerpc/kexec: Fix loading of kernel + initramfs with kexec_file_load() (2019-05-23 14:00:32 +1000)

- ------------------------------------------------------------------
powerpc fixes for 5.2 #3

A minor fix to our IMC PMU code to print a less confusing error message when the
driver can't initialise properly.

A fix for a bug where a user requesting an unsupported branch sampling filter
can corrupt PMU state, preventing the PMU from counting properly.

And finally a fix for a bug in our support for kexec_file_load(), which
prevented loading a kernel and initramfs. Most versions of kexec don't yet use
kexec_file_load().

Thanks to:
  Anju T Sudhakar, Dave Young, Madhavan Srinivasan, Ravi Bangoria, Thiago Jung
  Bauermann.

- ------------------------------------------------------------------
Anju T Sudhakar (1):
      powerpc/powernv: Return for invalid IMC domain

Ravi Bangoria (1):
      powerpc/perf: Fix MMCRA corruption by bhrb_filter

Thiago Jung Bauermann (1):
      powerpc/kexec: Fix loading of kernel + initramfs with kexec_file_load()


 arch/powerpc/kernel/kexec_elf_64.c        | 6 +++++-
 arch/powerpc/perf/core-book3s.c           | 6 ++++--
 arch/powerpc/perf/power8-pmu.c            | 3 +++
 arch/powerpc/perf/power9-pmu.c            | 3 +++
 arch/powerpc/platforms/powernv/opal-imc.c | 4 ++++
 5 files changed, 19 insertions(+), 3 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJc860sAAoJEFHr6jzI4aWAgk0QAJ7e67M/DrigLDIi5LdnwDQQ
AtQW+QzeoBHWiSgWfibqv5NjC9XCdOtvbOkD44TAlF99YMe5k8wShLLwiPSCIYEu
7r83+NHPp7jpeoO8fmE4dTJsmp4Ez+cJfOKpAF6h2w+1yJ5gL2AP5wNLUBi6Cliw
lUIRb73JgWj2hwu0HMNAxbE+mlyIpi8fXRk8TeUXVB+IEInOQxU0x/RkxqN4cCtG
f0hzAnZPywdDvRBuU6roPU3zrII7nVgrLUPXjgin/v58sdqR7zFnWnsm+ou0jkuy
K5zMcCuqZ6lrYjoak+OiqOt8CcalBtqju9ZANQkDIe5hMhXn4Maex1YbFE0i1UYm
Ljbm6Dp4dSTxQcx7GV1xMzHGNHEMQFKSABX+jF9l/KOVl4aVZAEz5F6DNKZO4lo+
EVX9HPBb6ZPyvwntLei8zn9C9LiSVWP5zsAW2zFam4isi498Ca1YpAyoSd58NrRn
WXVcDwMIp9c8uiQllbICNWdHzJhJWhUu/lW2idKFy05zG5+g6dg80StVpYlaEZwK
jggKwkD1H9VWrOZjoIHceOWPUxfjJ6wrvkovGqQqx6l9CkpEYfn1EG0p4s7CwXZ/
wEq0wVsfVaHPkEDSHSwg8mI9ZaEwoY6WMXE63WbVPNMWN26yw5vLJJx4o91Gk/wq
1F4UgNfF5XuQu8m5NWyU
=qxoS
-----END PGP SIGNATURE-----
