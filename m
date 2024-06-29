Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8F291CE65
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jun 2024 19:47:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=b8xR+POH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WBKWZ0LR3z3cV9
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Jun 2024 03:47:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=b8xR+POH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WBKVq3dhmz30WJ
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Jun 2024 03:46:41 +1000 (AEST)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1f4a5344ec7so12085915ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jun 2024 10:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719683195; x=1720287995; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xJTuEAT8kFn/N38NgReiBC7u1W13u19d45QTb6wSxDI=;
        b=b8xR+POHPqLMKgy32CtQ+WWbz+AZoTf1uNKKijvhntYb5dT6mqMaSd5TOASCQKcu/X
         uMmhbHIo1ScXAWkLhJxSivrm1CBYeFKr7fu50qfJbPxwkfKkgGVZG9zsnqdb23t7tAzr
         5iNgo0g462Yt6l2Sz08zaxtyRE857C/07WkwuOKX6831Jb7Amr9gDGTqD1Le3qJgJsZ/
         4273h8HznkLD3V2nS0LolujFDM/YkBM+l8kUxGPQRstaCmAmLacRxxKUdsOvjTjC1vgz
         klDgPZymgMcv0TWk+Em4nXmkc6cqAX0sH3OV+pG9RMIryJGhO63oPZcokeVijDpLE25Z
         ohtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719683195; x=1720287995;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xJTuEAT8kFn/N38NgReiBC7u1W13u19d45QTb6wSxDI=;
        b=wCtT3n1shDuYcC/PlWis7IVSw/PfOl0LhQ9u4gmiDFXH37bKlJi+OL5v9n7WtnBvMt
         qxzSeP9LBCubK9jXhqwk8alrethU5N88Pj4Is1UHTV2d4vbURUnmlSfyDBUw89noi2XU
         29Qts8zsnFi/lzDUd7idLZmfayfRN43EqND6YBLEG7uKzM9T/FJm2giqpGARiap0ryg1
         4JPX8h7jrbiyMD5FBFSn5rJByuZBbIjBftg5IckugqvS79Aqq3fg2DRLzCTpp44AuMpv
         JGgv9DUP+3hVxBFI/podn3an7p5dgbFhWDMdMjBviE/Ngwk7Y69Ts+bWsxvfdkJq4Nr+
         Xqpg==
X-Forwarded-Encrypted: i=1; AJvYcCUQp0XWuHA2/Q6PqqFK94OYhC+P3nFG51pngOoEzyk8xeq9TzDsxUG568eRPwecFafEQkr92pNov01Pmg7sznR2b3SNWNr1/ykoqHvyUg==
X-Gm-Message-State: AOJu0YwC4VCeus8RhyzOvEwVgKZTEuH2Gp1T119422WG5CIJ7GfvyVd3
	84NuiYBlg9Ld/6i8GPQNyAjwPmMHbHSM3rJYTn4fiw4O9mvDvMyG
X-Google-Smtp-Source: AGHT+IGXRwOTNfWOpdGXl+28hO8NMkh0znjd2CrkAf/HqJ5kuBn+8boNjwtHpyuWIrNeZ3XB7V/gSQ==
X-Received: by 2002:a17:902:ea0b:b0:1f6:3580:65c9 with SMTP id d9443c01a7336-1fadb4afc15mr29069525ad.26.1719683195282;
        Sat, 29 Jun 2024 10:46:35 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac159a286sm34552615ad.282.2024.06.29.10.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jun 2024 10:46:34 -0700 (PDT)
Date: Sat, 29 Jun 2024 10:46:33 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH v2 06/13] parisc: use generic sys_fanotify_mark
 implementation
Message-ID: <a913c77e-1abb-409f-86b9-8805c1451988@roeck-us.net>
References: <20240624163707.299494-1-arnd@kernel.org>
 <20240624163707.299494-7-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240624163707.299494-7-arnd@kernel.org>
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
Cc: Rich Felker <dalias@libc.org>, Andreas Larsson <andreas@gaisler.com>, linux-mips@vger.kernel.org, Guo Ren <guoren@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, linux-sh@vger.kernel.org, linux-csky@vger.kernel.org, "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>, musl@lists.openwall.com, Nicholas Piggin <npiggin@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Brian Cain <bcain@quicinc.com>, Christian Brauner <brauner@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, libc-alpha@sourceware.org, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, Adhemerval Zanella <adhemerval.zanella@linaro.org>, linux-hexagon@vger.kernel.org, linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 24, 2024 at 06:37:04PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The sys_fanotify_mark() syscall on parisc uses the reverse word order
> for the two halves of the 64-bit argument compared to all syscalls on
> all 32-bit architectures. As far as I can tell, the problem is that
> the function arguments on parisc are sorted backwards (26, 25, 24, 23,
> ...) compared to everyone else, so the calling conventions of using an
> even/odd register pair in native word order result in the lower word
> coming first in function arguments, matching the expected behavior
> on little-endian architectures. The system call conventions however
> ended up matching what the other 32-bit architectures do.
> 
> A glibc cleanup in 2020 changed the userspace behavior in a way that
> handles all architectures consistently, but this inadvertently broke
> parisc32 by changing to the same method as everyone else.
> 
> The change made it into glibc-2.35 and subsequently into debian 12
> (bookworm), which is the latest stable release. This means we
> need to choose between reverting the glibc change or changing the
> kernel to match it again, but either hange will leave some systems
> broken.
> 
> Pick the option that is more likely to help current and future
> users and change the kernel to match current glibc. This also
> means the behavior is now consistent across architectures, but
> it breaks running new kernels with old glibc builds before 2.35.
> 
> Link: https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=d150181d73d9
> Link: https://git.kernel.org/pub/scm/linux/kernel/git/history/history.git/commit/arch/parisc/kernel/sys_parisc.c?h=57b1dfbd5b4a39d
> Cc: Adhemerval Zanella <adhemerval.zanella@linaro.org>
> Tested-by: Helge Deller <deller@gmx.de>
> Acked-by: Helge Deller <deller@gmx.de>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> I found this through code inspection, please double-check to make
> sure I got the bug and the fix right.
> 

Building parisc:allmodconfig ... failed
--------------
Error log:
In file included from fs/notify/fanotify/fanotify_user.c:14:
include/linux/syscalls.h:248:25: error: conflicting types for 'sys_fanotify_mark'; have 'long int(int,  unsigned int,  u32,  u32,  int,  const char *)' {aka 'long int(int,  unsigned int,  unsigned int,  unsigned int,  int,  const char *)'}
  248 |         asmlinkage long sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))       \
      |                         ^~~
include/linux/syscalls.h:234:9: note: in expansion of macro '__SYSCALL_DEFINEx'
  234 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
      |         ^~~~~~~~~~~~~~~~~
include/linux/syscalls.h:228:36: note: in expansion of macro 'SYSCALL_DEFINEx'
  228 | #define SYSCALL_DEFINE6(name, ...) SYSCALL_DEFINEx(6, _##name, __VA_ARGS__)
      |                                    ^~~~~~~~~~~~~~~
include/linux/syscalls.h:287:27: note: in expansion of macro 'SYSCALL_DEFINE6'
  287 | #define SYSCALL32_DEFINE6 SYSCALL_DEFINE6
      |                           ^~~~~~~~~~~~~~~
fs/notify/fanotify/fanotify_user.c:1924:1: note: in expansion of macro 'SYSCALL32_DEFINE6'
 1924 | SYSCALL32_DEFINE6(fanotify_mark,
      | ^~~~~~~~~~~~~~~~~
include/linux/syscalls.h:862:17: note: previous declaration of 'sys_fanotify_mark' with type 'long int(int,  unsigned int,  u64,  int,  const char *)' {aka 'long int(int,  unsigned int,  long long unsigned int,  int,  const char *)'}
  862 | asmlinkage long sys_fanotify_mark(int fanotify_fd, unsigned int flags,
      |                 ^~~~~~~~~~~~~~~~~
make[6]: [scripts/Makefile.build:244: fs/notify/fanotify/fanotify_user.o] Error 1 (ignored)

Guenter
