Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D421F332B56
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 16:59:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dw0Jt5xVCz3f3d
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 02:59:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dw0JY0s8qz2xyB
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Mar 2021 02:59:22 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Dw0JM427nz9tyZL;
 Tue,  9 Mar 2021 16:59:15 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id LbsjBpuTUjHU; Tue,  9 Mar 2021 16:59:15 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Dw0JM2k5Gz9tyZK;
 Tue,  9 Mar 2021 16:59:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 00EEB8B810;
 Tue,  9 Mar 2021 16:59:16 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id E4E224d9ub0a; Tue,  9 Mar 2021 16:59:15 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5448B8B84C;
 Tue,  9 Mar 2021 16:59:10 +0100 (CET)
Subject: Re: [PATCH v3] powerpc/32: remove bogus ppc_select syscall
To: Arnd Bergmann <arnd@arndb.de>
References: <f08ef2b6f339ba19987cfef4307a4dd26b2faf97.1614933479.git.christophe.leroy@csgroup.eu>
 <CAK8P3a2b+u+8smkKWB-V2Non+nnZmNG4dNi6cGpM8weYuY5j6A@mail.gmail.com>
 <5811950d-ef14-d416-35e6-d694ef920a7d@csgroup.eu>
 <CAK8P3a34cnCk4=Xyxvib57JLN-ck4T0-FUZRAQT_L6MDKjE+-w@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <13737de5-0eb7-e881-9af0-163b0d29a1a0@csgroup.eu>
Date: Tue, 9 Mar 2021 16:59:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a34cnCk4=Xyxvib57JLN-ck4T0-FUZRAQT_L6MDKjE+-w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 05/03/2021 à 13:03, Arnd Bergmann a écrit :
> On Fri, Mar 5, 2021 at 11:15 AM Christophe Leroy
> <christophe.leroy@csgroup.eu> wrote:
>> Le 05/03/2021 à 11:06, Arnd Bergmann a écrit :
>>> On Fri, Mar 5, 2021 at 9:40 AM Christophe Leroy <christophe.leroy@csgroup.eu> wrote:
>>> - glibc support for ppc32 gets merged during the linux-2.5 days, supporting
>>>     only #142 with the new behavior.
> 
> It turns out to be older than I said. This was actually in glibc-1.94
> from 1997, so during
> the linux-2.1 days, not 2.5!
> 
>> Whaou, nice archeology, thanks. Do you mind if I copy the history you established ?
> 
> That's fine, please copy it.
> 
>> In your commit, you said 2.3.48. Here in the history you say 2.1.48. Which one is correct ?
> 
> 2.1.48 is correct.
> 
>> Regardless of whethere binaries are broken or not for other reason, is that worth expecting an
>> almost 25 yr old binary to run on future kernels ? If one is able to put the necessary effort to
>> port you hardware to the latest kernel, can't he really port the binary as well ?
> 
> I think the questions of supporting old hardware with new software and
> supporting old
> binaries on modern kernels are largely orthogonal. The policy we have
> is that we don't
> break existing user setups, and it really seems unlikely that anyone
> still uses pre-1997
> executables for anything that requires a modern kernel!
> 
> I now checked the oldest mklinux I could find (DR2.1 from 1997), and
> even has the
> modern glibc and linux-2.0.28 kernel patched to provide the modern semantics at
> syscall #142 for glibc, with the same (already unused) compatibility hack at #82
> that we still have for ppc32 today. This made mklinux DR2.1 binaries
> incompatible
> with mainline linux-2.0 kernels, but they might still work with modern kernels,
> regardless of whether we remove support for binaries that worked with mainline
> linux-2.0.


I had another look. In fact x86, arm and m68k still have the #82 syscall, but they don't have the 
hack we have on powerpc to "guess" that something is calling the old select with the arguments of 
the new select.

As part of my series of user accesses cleanup, I'll replace the open coded stuff by a call to 
sys_old_select(), see below.

Maybe at the end we should keep the #82 syscall, but do we need to keep the powerpc hack really ? 
Maybe the best is to drop ppc_select() function but mention sys_old_select() instead of ni_syscall 
for entry #82 in the syscall table ?

Christophe
---
diff --git a/arch/powerpc/include/asm/unistd.h b/arch/powerpc/include/asm/unistd.h
index 700fcdac2e3c..b541c690a31c 100644
--- a/arch/powerpc/include/asm/unistd.h
+++ b/arch/powerpc/include/asm/unistd.h
@@ -40,6 +40,7 @@
  #define __ARCH_WANT_SYS_SIGPROCMASK
  #ifdef CONFIG_PPC32
  #define __ARCH_WANT_OLD_STAT
+#define __ARCH_WANT_SYS_OLD_SELECT
  #endif
  #ifdef CONFIG_PPC64
  #define __ARCH_WANT_SYS_TIME
diff --git a/arch/powerpc/kernel/syscalls.c b/arch/powerpc/kernel/syscalls.c
index 078608ec2e92..a552c9e68d7e 100644
--- a/arch/powerpc/kernel/syscalls.c
+++ b/arch/powerpc/kernel/syscalls.c
@@ -82,16 +82,8 @@ int
  ppc_select(int n, fd_set __user *inp, fd_set __user *outp, fd_set __user *exp, struct 
__kernel_old_timeval __user *tvp)
  {
  	if ( (unsigned long)n >= 4096 )
-	{
-		unsigned long __user *buffer = (unsigned long __user *)n;
-		if (!access_ok(buffer, 5*sizeof(unsigned long))
-		    || __get_user(n, buffer)
-		    || __get_user(inp, ((fd_set __user * __user *)(buffer+1)))
-		    || __get_user(outp, ((fd_set  __user * __user *)(buffer+2)))
-		    || __get_user(exp, ((fd_set  __user * __user *)(buffer+3)))
-		    || __get_user(tvp, ((struct __kernel_old_timeval  __user * __user *)(buffer+4))))
-			return -EFAULT;
-	}
+		return sys_old_select((void __user *)n);
+
  	return sys_select(n, inp, outp, exp, tvp);
  }
  #endif
