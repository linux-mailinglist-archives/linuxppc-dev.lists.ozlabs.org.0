Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D74B74ED6B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 13:57:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0fW62bgkz3btn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 21:57:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=kernel.org (client-ip=207.211.30.44; helo=us-smtp-delivery-44.mimecast.com; envelope-from=legion@kernel.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 84 seconds by postgrey-1.37 at boromir; Tue, 11 Jul 2023 21:27:58 AEST
Received: from us-smtp-delivery-44.mimecast.com (unknown [207.211.30.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0dsB68kYz2ynt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 21:27:58 +1000 (AEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-417-EUMcl2VMMrinzt4tEM6SLg-1; Tue, 11 Jul 2023 07:26:15 -0400
X-MC-Unique: EUMcl2VMMrinzt4tEM6SLg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3AAD23815F71;
	Tue, 11 Jul 2023 11:26:13 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.45.225.44])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1B08863F3C;
	Tue, 11 Jul 2023 11:25:59 +0000 (UTC)
From: Alexey Gladkov <legion@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-api@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	viro@zeniv.linux.org.uk
Subject: [PATCH v3 0/5] Add a new fchmodat4() syscall
Date: Tue, 11 Jul 2023 13:25:41 +0200
Message-Id: <cover.1689074739.git.legion@kernel.org>
In-Reply-To: <87o8pscpny.fsf@oldenburg2.str.redhat.com>
References: <87o8pscpny.fsf@oldenburg2.str.redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252; x-default=true
X-Mailman-Approved-At: Tue, 11 Jul 2023 21:56:57 +1000
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, fenghua.yu@intel.com, alexander.shishkin@linux.intel.com, palmer@sifive.com, heiko.carstens@de.ibm.com, x86@kernel.org, stefan@agner.ch, ldv@altlinux.org, dhowells@redhat.com, kim.phillips@arm.com, paulus@samba.org, deepa.kernel@gmail.com, hpa@zytor.com, sparclinux@vger.kernel.org, will@kernel.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, hare@suse.com, ysato@users.sourceforge.jp, deller@gmx.de, linux-sh@vger.kernel.org, linux@armlinux.org.uk, borntraeger@de.ibm.com, mingo@redhat.com, geert@linux-m68k.org, linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, jhogan@kernel.org, firoz.khan@linaro.org, mattst88@gmail.com, fweimer@redhat.com, gor@linux.ibm.com, peterz@infradead.org, glebfm@altlinux.org, tycho@tycho.ws, acme@kernel.org, linux-m68k@lists.linux-m68k.org, bp@alien8.de, luto@kernel.org, namhyung@kernel.org, tglx@linutronix.de, christian@brauner.io, rth@twiddle.net, axboe@kernel.dk, James.Bottomley@Hanse
 nPartnership.com, monstr@monstr.eu, tony.luck@intel.com, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org, ralf@linux-mips.org, paul.burton@mips.com, linux-alpha@vger.kernel.org, schwidefsky@de.ibm.com, ink@jurassic.park.msu.ru, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch set adds fchmodat4(), a new syscall. The actual
implementation is super simple: essentially it's just the same as
fchmodat(), but LOOKUP_FOLLOW is conditionally set based on the flags.
I've attempted to make this match "man 2 fchmodat" as closely as
possible, which says EINVAL is returned for invalid flags (as opposed to
ENOTSUPP, which is currently returned by glibc for AT_SYMLINK_NOFOLLOW).
I have a sketch of a glibc patch that I haven't even compiled yet, but
seems fairly straight-forward:

    diff --git a/sysdeps/unix/sysv/linux/fchmodat.c b/sysdeps/unix/sysv/lin=
ux/fchmodat.c
    index 6d9cbc1ce9e0..b1beab76d56c 100644
    --- a/sysdeps/unix/sysv/linux/fchmodat.c
    +++ b/sysdeps/unix/sysv/linux/fchmodat.c
    @@ -29,12 +29,36 @@
     int
     fchmodat (int fd, const char *file, mode_t mode, int flag)
     {
    -  if (flag & ~AT_SYMLINK_NOFOLLOW)
    -    return INLINE_SYSCALL_ERROR_RETURN_VALUE (EINVAL);
    -#ifndef __NR_lchmod=09=09/* Linux so far has no lchmod syscall.  */
    +  /* There are four paths through this code:
    +      - The flags are zero.  In this case it's fine to call fchmodat.
    +      - The flags are non-zero and glibc doesn't have access to
    +=09__NR_fchmodat4.  In this case all we can do is emulate the error co=
des
    +=09defined by the glibc interface from userspace.
    +      - The flags are non-zero, glibc has __NR_fchmodat4, and the kern=
el has
    +=09fchmodat4.  This is the simplest case, as the fchmodat4 syscall exa=
ctly
    +=09matches glibc's library interface so it can be called directly.
    +      - The flags are non-zero, glibc has __NR_fchmodat4, but the kern=
el does
    +=09not.  In this case we must respect the error codes defined by the g=
libc
    +=09interface instead of returning ENOSYS.
    +    The intent here is to ensure that the kernel is called at most onc=
e per
    +    library call, and that the error types defined by glibc are always
    +    respected.  */
    +
    +#ifdef __NR_fchmodat4
    +  long result;
    +#endif
    +
    +  if (flag =3D=3D 0)
    +    return INLINE_SYSCALL (fchmodat, 3, fd, file, mode);
    +
    +#ifdef __NR_fchmodat4
    +  result =3D INLINE_SYSCALL (fchmodat4, 4, fd, file, mode, flag);
    +  if (result =3D=3D 0 || errno !=3D ENOSYS)
    +    return result;
    +#endif
    +
       if (flag & AT_SYMLINK_NOFOLLOW)
         return INLINE_SYSCALL_ERROR_RETURN_VALUE (ENOTSUP);
    -#endif

    -  return INLINE_SYSCALL (fchmodat, 3, fd, file, mode);
    +  return INLINE_SYSCALL_ERROR_RETURN_VALUE (EINVAL);
     }

I've never added a new syscall before so I'm not really sure what the
proper procedure to follow is.  Based on the feedback from my v1 patch
set it seems this is somewhat uncontroversial.  At this point I don't
think there's anything I'm missing, though note that I haven't gotten
around to testing it this time because the diff from v1 is trivial for
any platform I could reasonably test on.  The v1 patches suggest a
simple test case, but I didn't re-run it because I don't want to reboot
my laptop.

Changes since v2 [20190717012719.5524-1-palmer@sifive.com]:

* Rebased to master.
* The lookup_flags passed to sys_fchmodat4 as suggested by Al Viro.
* Selftest added.

Changes since v1 [20190531191204.4044-1-palmer@sifive.com]:

* All architectures are now supported, which support squashed into a
  single patch.
* The do_fchmodat() helper function has been removed, in favor of directly
  calling do_fchmodat4().
* The patches are based on 5.2 instead of 5.1.

---

Alexey Gladkov (1):
  selftests: add fchmodat4(2) selftest

Palmer Dabbelt (4):
  Non-functional cleanup of a "__user * filename"
  fs: Add fchmodat4()
  arch: Register fchmodat4, usually as syscall 451
  tools headers UAPI: Sync files changed by new fchmodat4 syscall

 arch/alpha/kernel/syscalls/syscall.tbl        |   1 +
 arch/arm/tools/syscall.tbl                    |   1 +
 arch/arm64/include/asm/unistd32.h             |   2 +
 arch/ia64/kernel/syscalls/syscall.tbl         |   1 +
 arch/m68k/kernel/syscalls/syscall.tbl         |   1 +
 arch/microblaze/kernel/syscalls/syscall.tbl   |   1 +
 arch/mips/kernel/syscalls/syscall_n32.tbl     |   1 +
 arch/mips/kernel/syscalls/syscall_n64.tbl     |   1 +
 arch/mips/kernel/syscalls/syscall_o32.tbl     |   1 +
 arch/parisc/kernel/syscalls/syscall.tbl       |   1 +
 arch/powerpc/kernel/syscalls/syscall.tbl      |   1 +
 arch/s390/kernel/syscalls/syscall.tbl         |   1 +
 arch/sh/kernel/syscalls/syscall.tbl           |   1 +
 arch/sparc/kernel/syscalls/syscall.tbl        |   1 +
 arch/x86/entry/syscalls/syscall_32.tbl        |   1 +
 arch/x86/entry/syscalls/syscall_64.tbl        |   1 +
 arch/xtensa/kernel/syscalls/syscall.tbl       |   1 +
 fs/open.c                                     |  18 ++-
 include/linux/syscalls.h                      |   4 +-
 include/uapi/asm-generic/unistd.h             |   5 +-
 tools/include/uapi/asm-generic/unistd.h       |   5 +-
 .../arch/mips/entry/syscalls/syscall_n64.tbl  |   1 +
 .../arch/powerpc/entry/syscalls/syscall.tbl   |   1 +
 .../perf/arch/s390/entry/syscalls/syscall.tbl |   1 +
 .../arch/x86/entry/syscalls/syscall_64.tbl    |   1 +
 tools/testing/selftests/Makefile              |   1 +
 tools/testing/selftests/fchmodat4/.gitignore  |   2 +
 tools/testing/selftests/fchmodat4/Makefile    |   6 +
 .../selftests/fchmodat4/fchmodat4_test.c      | 151 ++++++++++++++++++
 29 files changed, 207 insertions(+), 7 deletions(-)
 create mode 100644 tools/testing/selftests/fchmodat4/.gitignore
 create mode 100644 tools/testing/selftests/fchmodat4/Makefile
 create mode 100644 tools/testing/selftests/fchmodat4/fchmodat4_test.c

--=20
2.33.8

