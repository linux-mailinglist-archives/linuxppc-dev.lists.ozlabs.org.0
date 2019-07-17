Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDAA6B4A4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jul 2019 04:41:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45pM323BXQzDqRJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jul 2019 12:41:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=dabbelt.com
 (client-ip=209.85.214.193; helo=mail-pl1-f193.google.com;
 envelope-from=palmer@dabbelt.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=sifive.com
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45pLPz0D5WzDq74
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jul 2019 12:12:35 +1000 (AEST)
Received: by mail-pl1-f193.google.com with SMTP id t14so11067125plr.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 19:12:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=XJLjYj+DtIYQb0AMLYtaQvMihTCm0rsvCGKlwMRh3LE=;
 b=FnOKldEgSh6gONEyJm2Qgzbewcq6lBiBfSLf52isY5aUlF50BDuVRjiQCnAryp5Aje
 oesBrsTXkmy5RYtWgkTkMr02h5J9naKE6AcRBJ9z4B24abykqfJbtkwjw3RrJQRWDwza
 3/y6OaeGMPzYx1LQEVTJ/HVy9xLdx6Y51gSZfMQthcF+mzlb8XIkwbuAqFNgmMQLl3SQ
 28SwMYu+Cd4rgtaKXgPNnPa/TiCLVnB3HFlmh46jolaHJpeXv8zFrwBg1La0hJy0/bol
 50XIecAH8ziDEPWJ0gS395nNDIoA172b1Tr/2tebOzljg3/d9ppen8Pbg8TLsizOj7at
 Lf4w==
X-Gm-Message-State: APjAAAVFD/jPq+QnAtlFrDE6GFcSr3W6tynjhVe2upUIEGvOPjZXaha/
 TxBuBwwKuT3O91PGh4YimJY=
X-Google-Smtp-Source: APXvYqw1pQN2mCJqE4LloipsyU+ky9ZyfrHyYjD9dGtOKrfKeU8jFTsCJcFJac6EgQIwz1mt6T4pwQ==
X-Received: by 2002:a17:902:8546:: with SMTP id
 d6mr38738719plo.207.1563329552353; 
 Tue, 16 Jul 2019 19:12:32 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id 196sm24393369pfy.167.2019.07.16.19.12.31
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 16 Jul 2019 19:12:31 -0700 (PDT)
Date: Tue, 16 Jul 2019 19:12:31 -0700 (PDT)
X-Google-Original-Date: Tue, 16 Jul 2019 19:12:29 PDT (-0700)
Subject: Re: [PATCH v2 2/4] Add fchmodat4(), a new syscall
In-Reply-To: <20190717014802.GS17978@ZenIV.linux.org.uk>
From: Palmer Dabbelt <palmer@sifive.com>
To: viro@zeniv.linux.org.uk
Message-ID: <mhng-07134298-232b-4472-ac6f-cf33862883c5@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 17 Jul 2019 12:39:48 +1000
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
Cc: dalias@libc.org, catalin.marinas@arm.com, linux-sh@vger.kernel.org,
 peterz@infradead.org, heiko.carstens@de.ibm.com, stefan@agner.ch,
 linux-mips@vger.kernel.org, James.Bottomley@hansenpartnership.com,
 namhyung@kernel.org, kim.phillips@arm.com, paulus@samba.org,
 deepa.kernel@gmail.com, hpa@zytor.com, sparclinux@vger.kernel.org,
 linux-ia64@vger.kernel.org, will@kernel.org, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, hare@suse.com, gor@linux.ibm.com,
 ysato@users.sourceforge.jp, deller@gmx.de, x86@kernel.org,
 linux@armlinux.org.uk, borntraeger@de.ibm.com, mingo@redhat.com,
 geert@linux-m68k.org, linux-arm-kernel@lists.infradead.org, jhogan@kernel.org,
 firoz.khan@linaro.org, mattst88@gmail.com, fenghua.yu@intel.com,
 Arnd Bergmann <arnd@arndb.de>, jolsa@redhat.com, tycho@tycho.ws,
 acme@kernel.org, schwidefsky@de.ibm.com, linux-m68k@lists.linux-m68k.org,
 ink@jurassic.park.msu.ru, luto@kernel.org, alexander.shishkin@linux.intel.com,
 tglx@linutronix.de, christian@brauner.io, rth@twiddle.net, axboe@kernel.dk,
 dhowells@redhat.com, monstr@monstr.eu, tony.luck@intel.com,
 linux-parisc@vger.kernel.org, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, ralf@linux-mips.org, paul.burton@mips.com,
 linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org, bp@alien8.de,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 16 Jul 2019 18:48:02 PDT (-0700), viro@zeniv.linux.org.uk wrote:
> On Tue, Jul 16, 2019 at 06:27:17PM -0700, Palmer Dabbelt wrote:
>
>> -int do_fchmodat(int dfd, const char __user *filename, umode_t mode)
>> +int do_fchmodat4(int dfd, const char __user *filename, umode_t mode, int flags)
>>  {
>>  	struct path path;
>>  	int error;
>> -	unsigned int lookup_flags = LOOKUP_FOLLOW;
>> +	unsigned int lookup_flags;
>> +
>> +	if (unlikely(flags & ~AT_SYMLINK_NOFOLLOW))
>> +		return -EINVAL;
>> +
>> +	lookup_flags = flags & AT_SYMLINK_NOFOLLOW ? 0 : LOOKUP_FOLLOW;
>> +
>
> 	Why not do that in sys_fchmodat4() itself, passing lookup_flags to
> do_fchmodat() and updating old callers to pass it 0 as extra argument?

Ya, that seems better -- passing LOOKUP_FOLLOW instead of 0, to keep the
behavior the same.  That way I could avoid the overhead of these checks for the
old syscalls, as we know they're not necessary.

I'll replace this patch with the following for a v3

    diff --git a/fs/open.c b/fs/open.c
    index b5b80469b93d..a5f99408af11 100644
    --- a/fs/open.c
    +++ b/fs/open.c
    @@ -569,11 +569,12 @@ SYSCALL_DEFINE2(fchmod, unsigned int, fd, umode_t, mode)
            return ksys_fchmod(fd, mode);
     }
    
    -int do_fchmodat(int dfd, const char __user *filename, umode_t mode)
    +int do_fchmodat4(int dfd, const char __user *filename, umode_t mode,
    +                int lookup_flags)
     {
            struct path path;
            int error;
    -       unsigned int lookup_flags = LOOKUP_FOLLOW;
    +
     retry:
            error = user_path_at(dfd, filename, lookup_flags, &path);
            if (!error) {
    @@ -587,15 +588,28 @@ int do_fchmodat(int dfd, const char __user *filename, umode_t mode)
            return error;
     }
    
    +SYSCALL_DEFINE4(fchmodat4, int, dfd, const char __user *, filename,
    +               umode_t, mode, int, flags)
    +{
    +       unsigned int lookup_flags;
    +
    +       if (unlikely(flags & ~AT_SYMLINK_NOFOLLOW))
    +               return -EINVAL;
    +
    +       lookup_flags = flags & AT_SYMLINK_NOFOLLOW ? 0 : LOOKUP_FOLLOW;
    +
    +       return do_fchmodat4(dfd, filename, mode, lookup_flags);
    +}
    +
     SYSCALL_DEFINE3(fchmodat, int, dfd, const char __user *, filename,
                    umode_t, mode)
     {
    -       return do_fchmodat(dfd, filename, mode);
    +       return do_fchmodat4(dfd, filename, mode, LOOKUP_FOLLOW);
     }
    
     SYSCALL_DEFINE2(chmod, const char __user *, filename, umode_t, mode)
     {
    -       return do_fchmodat(AT_FDCWD, filename, mode);
    +       return do_fchmodat4(AT_FDCWD, filename, mode, LOOKUP_FOLLOW);
     }
    
     static int chown_common(const struct path *path, uid_t user, gid_t group)
    diff --git a/include/linux/syscalls.h b/include/linux/syscalls.h
    index e1c20f1d0525..6676b1cc5485 100644
    --- a/include/linux/syscalls.h
    +++ b/include/linux/syscalls.h
    @@ -81,6 +81,7 @@ struct io_uring_params;
     #include <linux/quota.h>
     #include <linux/key.h>
     #include <linux/personality.h>
    +#include <linux/namei.h>
     #include <trace/syscall.h>
    
     #ifdef CONFIG_ARCH_HAS_SYSCALL_WRAPPER
    @@ -433,6 +434,8 @@ asmlinkage long sys_chroot(const char __user *filename);
     asmlinkage long sys_fchmod(unsigned int fd, umode_t mode);
     asmlinkage long sys_fchmodat(int dfd, const char __user *filename,
                                 umode_t mode);
    +asmlinkage long sys_fchmodat4(int dfd, const char __user *filename,
    +                            umode_t mode, int flags);
     asmlinkage long sys_fchownat(int dfd, const char __user *filename, uid_t user,
                                 gid_t group, int flag);
     asmlinkage long sys_fchown(unsigned int fd, uid_t user, gid_t group);
    @@ -1320,11 +1323,12 @@ static inline long ksys_link(const char __user *oldname,
            return do_linkat(AT_FDCWD, oldname, AT_FDCWD, newname, 0);
     }
    
    -extern int do_fchmodat(int dfd, const char __user *filename, umode_t mode);
    +extern int do_fchmodat4(int dfd, const char __user *filename, umode_t mode,
    +                       int flags);
    
     static inline int ksys_chmod(const char __user *filename, umode_t mode)
     {
    -       return do_fchmodat(AT_FDCWD, filename, mode);
    +       return do_fchmodat4(AT_FDCWD, filename, mode, LOOKUP_FOLLOW);
     }
    
     extern long do_faccessat(int dfd, const char __user *filename, int mode);
