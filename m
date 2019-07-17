Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFC16B447
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jul 2019 04:04:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45pLDm1b9PzDqD1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jul 2019 12:04:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=sifive.com
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=palmer@sifive.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=sifive.com header.i=@sifive.com header.b="EWeObjoF"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45pKRy1CdjzDqXC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jul 2019 11:29:14 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id f25so10292743pgv.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 18:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=lCAdtmytrwTdW3zlJMsL7BH9HcOHIdUFUev907eAt/A=;
 b=EWeObjoFmWq4Omx3n/Vk5ieecW6ME7Q+UElx0hnCrcAOTTwfJ8WA/Sx8n3WY/vKhA0
 w6DxbQo2seu7BVmNL69pGIK8MrLb9SGxQw0ZhHDA/oLivg3XTYry1Jl/HOn/8ds0c/xl
 O9ThCZWa11yjixEiKl5hzy4Eccujt0+y1RLNUSrPKnvavkdRx+ydohJ0NNiQpiV3Ozvx
 aK7noJb1AfREOkm/Jo45bQYJsqD5CIa30MNowi++lgOE2CEfnJvHQKtzGzh+WEvqD0ri
 qekgiFl3gec+0sTohyesxiSbunkhOiFPrtSd5l3tnJD2fwW7uxBVPSQs3Dbrtim5XVys
 eqYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=lCAdtmytrwTdW3zlJMsL7BH9HcOHIdUFUev907eAt/A=;
 b=PwiJ5kwOEwI6Fhd3sRXN/ACIT5pZSB5bNLTNRqveW1UoPuIvYRCXHHMCzGrolweGyj
 z/c0g76s//zB9WzhvMdo7XDqNYwCDMx6ZogzEaKIGFoymcIF9dtPfN8weVv/916h4MNG
 VmLL5YIrZBVgKoqQi+69bD/BPiuq8Fqlh2oikR7DPiu0kRFMxzR87tpSQXNzj0FVu9bW
 epiLEbyOwgtOf05UN/jyIR9UMxiF8jzY9oMxB6G7OTKheGMNXev9vxbFtXcShF/PyduT
 QmHPQzxs9nxjkki1X6CydX+6nOtrTR2XXm9PsSCsADya+m4cRpC86c/2mYeE1X/O0h8D
 8dhQ==
X-Gm-Message-State: APjAAAXyeA4ai6P50jDx0I2xItz+Mqvj2+vRxG9GICNat/GLC/WGOrMc
 bWt6XZznxc3BFzkftynUXYYNfw==
X-Google-Smtp-Source: APXvYqxD+A8D1A0efvs/gHSpa51lIoBZYiXr5jNYG6C1/J/dqptdfkqKaxchYfNokKm4TbgakH+Oxw==
X-Received: by 2002:a17:90a:fa18:: with SMTP id
 cm24mr39334563pjb.120.1563326951272; 
 Tue, 16 Jul 2019 18:29:11 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id r61sm32564152pjb.7.2019.07.16.18.29.09
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 16 Jul 2019 18:29:10 -0700 (PDT)
Subject: Add a new fchmodat4() syscall, v2
Date: Tue, 16 Jul 2019 18:27:15 -0700
Message-Id: <20190717012719.5524-1-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Palmer Dabbelt <palmer@sifive.com>
To: viro@zeniv.linux.org.uk, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>
X-Mailman-Approved-At: Wed, 17 Jul 2019 11:58:47 +1000
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 peterz@infradead.org, Palmer Dabbelt <palmer@sifive.com>,
 heiko.carstens@de.ibm.com, stefan@agner.ch,
 James.Bottomley@HansenPartnership.com, namhyung@kernel.org,
 kim.phillips@arm.com, paulus@samba.org, deepa.kernel@gmail.com, hpa@zytor.com,
 sparclinux@vger.kernel.org, will@kernel.org, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, hare@suse.com, Arnd Bergmann <arnd@arndb.de>,
 ysato@users.sourceforge.jp, deller@gmx.de, x86@kernel.org,
 linux@armlinux.org.uk, borntraeger@de.ibm.com, mingo@redhat.com,
 geert@linux-m68k.org, linux-arm-kernel@lists.infradead.org,
 catalin.marinas@arm.com, jhogan@kernel.org, firoz.khan@linaro.org,
 mattst88@gmail.com, fenghua.yu@intel.com, gor@linux.ibm.com, jolsa@redhat.com,
 tycho@tycho.ws, acme@kernel.org, linux-m68k@lists.linux-m68k.org,
 ink@jurassic.park.msu.ru, luto@kernel.org, alexander.shishkin@linux.intel.com,
 tglx@linutronix.de, christian@brauner.io, rth@twiddle.net, axboe@kernel.dk,
 dhowells@redhat.com, monstr@monstr.eu, tony.luck@intel.com,
 linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org, ralf@linux-mips.org,
 paul.burton@mips.com, linux-alpha@vger.kernel.org, schwidefsky@de.ibm.com,
 bp@alien8.de, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch set adds fchmodat4(), a new syscall. The actual
implementation is super simple: essentially it's just the same as
fchmodat(), but LOOKUP_FOLLOW is conditionally set based on the flags.
I've attempted to make this match "man 2 fchmodat" as closely as
possible, which says EINVAL is returned for invalid flags (as opposed to
ENOTSUPP, which is currently returned by glibc for AT_SYMLINK_NOFOLLOW).
I have a sketch of a glibc patch that I haven't even compiled yet, but
seems fairly straight-forward:

    diff --git a/sysdeps/unix/sysv/linux/fchmodat.c b/sysdeps/unix/sysv/linux/fchmodat.c
    index 6d9cbc1ce9e0..b1beab76d56c 100644
    --- a/sysdeps/unix/sysv/linux/fchmodat.c
    +++ b/sysdeps/unix/sysv/linux/fchmodat.c
    @@ -29,12 +29,36 @@
     int
     fchmodat (int fd, const char *file, mode_t mode, int flag)
     {
    -  if (flag & ~AT_SYMLINK_NOFOLLOW)
    -    return INLINE_SYSCALL_ERROR_RETURN_VALUE (EINVAL);
    -#ifndef __NR_lchmod		/* Linux so far has no lchmod syscall.  */
    +  /* There are four paths through this code:
    +      - The flags are zero.  In this case it's fine to call fchmodat.
    +      - The flags are non-zero and glibc doesn't have access to
    +	__NR_fchmodat4.  In this case all we can do is emulate the error codes
    +	defined by the glibc interface from userspace.
    +      - The flags are non-zero, glibc has __NR_fchmodat4, and the kernel has
    +	fchmodat4.  This is the simplest case, as the fchmodat4 syscall exactly
    +	matches glibc's library interface so it can be called directly.
    +      - The flags are non-zero, glibc has __NR_fchmodat4, but the kernel does
    +	not.  In this case we must respect the error codes defined by the glibc
    +	interface instead of returning ENOSYS.
    +    The intent here is to ensure that the kernel is called at most once per
    +    library call, and that the error types defined by glibc are always
    +    respected.  */
    +
    +#ifdef __NR_fchmodat4
    +  long result;
    +#endif
    +
    +  if (flag == 0)
    +    return INLINE_SYSCALL (fchmodat, 3, fd, file, mode);
    +
    +#ifdef __NR_fchmodat4
    +  result = INLINE_SYSCALL (fchmodat4, 4, fd, file, mode, flag);
    +  if (result == 0 || errno != ENOSYS)
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

    $ touch test-file
    $ ln -s test-file test-link
    $ cat > test.c
    #include <fcntl.h>
    #include <stdio.h>
    #include <unistd.h>

    int main(int argc, char **argv)
    {
            long out;

            out = syscall(434, AT_FDCWD, "test-file", 0x888, AT_SYMLINK_NOFOLLOW);
            printf("fchmodat4(AT_FDCWD, \"test-file\", 0x888, AT_SYMLINK_NOFOLLOW): %ld\n", out);

            out = syscall(434, AT_FDCWD, "test-file", 0x888, 0);
            printf("fchmodat4(AT_FDCWD, \"test-file\", 0x888, 0): %ld\n", out);

            out = syscall(268, AT_FDCWD, "test-file", 0x888);
            printf("fchmodat(AT_FDCWD, \"test-file\", 0x888): %ld\n", out);

            out = syscall(434, AT_FDCWD, "test-link", 0x888, AT_SYMLINK_NOFOLLOW);
            printf("fchmodat4(AT_FDCWD, \"test-link\", 0x888, AT_SYMLINK_NOFOLLOW): %ld\n", out);

            out = syscall(434, AT_FDCWD, "test-link", 0x888, 0);
            printf("fchmodat4(AT_FDCWD, \"test-link\", 0x888, 0): %ld\n", out);

            out = syscall(268, AT_FDCWD, "test-link", 0x888);
            printf("fchmodat(AT_FDCWD, \"test-link\", 0x888): %ld\n", out);

            return 0;
    }
    $ gcc test.c -o test
    $ ./test
    fchmodat4(AT_FDCWD, "test-file", 0x888, AT_SYMLINK_NOFOLLOW): 0
    fchmodat4(AT_FDCWD, "test-file", 0x888, 0): 0
    fchmodat(AT_FDCWD, "test-file", 0x888): 0
    fchmodat4(AT_FDCWD, "test-link", 0x888, AT_SYMLINK_NOFOLLOW): -1
    fchmodat4(AT_FDCWD, "test-link", 0x888, 0): 0
    fchmodat(AT_FDCWD, "test-link", 0x888): 0

I've only built this on 64-bit x86.

Changes since v1 [20190531191204.4044-1-palmer@sifive.com]:

* All architectures are now supported, which support squashed into a
  single patch.
* The do_fchmodat() helper function has been removed, in favor of directly
  calling do_fchmodat4().
* The patches are based on 5.2 instead of 5.1.

