Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3497D612ABD
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Oct 2022 14:31:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N0cd73nJSz3cKn
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 00:31:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=EXOKBq30;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.51; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=EXOKBq30;
	dkim-atps=neutral
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N0cc908Wfz2yxd
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Oct 2022 00:30:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1667136618;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=zUD5/nikysLEGGeFGdfXT1DHuo6WsUq4EanqFmFFJL0=;
    b=EXOKBq30v78mUNlj9rGEmIgI9LscYA+lUJKRzXdXNyHuz8A1FUy68PnyGjJJGrsCuo
    +d5+kSyw5GVNK0CqvYUQ3R6d15bdj0mmsOVe7GqU1wfjDWi65s/XIs+FPkEx+aaBNdNk
    zWc9+7oCQzK0+TUSLtJ5SzDiYMRNxnrQgvFgpPpNK1WqpIn+fc165grnA+Y0rHrhlMG+
    plRZ+nQ2Uv/8yNgqUgB4uCJxdKtTUQYNDQbEA53/7bFaYXrpZVLHdGlVH97jlYYmK6h5
    yi7KzE3ZnOfIS/gDCWncTRnbc2L2Dzx7xuofZz4KUXgEza9K+b9YPEJmsjc2eQ6y1xuX
    jdEA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBfio0GngadwjdvwZnTEgQ417+J0BJqkWkgAfi"
X-RZG-CLASS-ID: mo00
Received: from [IPV6:2a02:8109:8980:4474:8fd:c1ee:6a22:d99a]
    by smtp.strato.de (RZmta 48.2.1 AUTH)
    with ESMTPSA id e28afdy9UDUGEBU
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sun, 30 Oct 2022 14:30:16 +0100 (CET)
Message-ID: <cdfd1d7e-f462-9b1b-f281-f227b44b2dee@xenosoft.de>
Date: Sun, 30 Oct 2022 14:30:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: Issues with the first PowerPC updates for the kernel 6.1
From: Christian Zigotzky <chzigotzky@xenosoft.de>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
References: <87y1tfl1pt.fsf@mpe.ellerman.id.au>
 <BCDB3B67-48A1-45E6-806D-2501C7EA6D8C@xenosoft.de>
 <fe06590f-6db6-f5cc-72ec-e635f66f3d3b@xenosoft.de>
In-Reply-To: <fe06590f-6db6-f5cc-72ec-e635f66f3d3b@xenosoft.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Darren Stevens <darren@stevens-zone.net>, Andrew Donnellan <ajd@linux.ibm.com>, npiggin@gmail.com, rmclure@linux.ibm.com, mad skateman <madskateman@gmail.com>, Olof Johansson <olof@lixom.net>, Trevor Dickinson <rtd2@xtra.co.nz>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 29 October 2022 at 01:44 pm, Christian Zigotzky wrote:
> On 17 October 2022 at 09:53 am, Christian Zigotzky wrote:
>>> On 17. Oct 2022, at 02:43, Michael Ellerman <mpe@ellerman.id.au> wrote:
>>> Previously BIG_ENDIAN && GENERIC_CPU would use -mcpu=power5, now it 
>>> uses
>>> -mcpu=power4.
>> Maybe this is the issue. We will wait and not release the RC1 for 
>> testing because it is a risk for our testers to test these new 
>> kernels because of this issue.
>>
>>>
>>> cheers
>>>
>>>
> I compiled the RC2 of kernel 6.1 today.
>
> After the first boot of the RC2, the file system was immediately to 
> 100% used.  This is the same issue we have seen with the git kernel 3 
> weeks ago.
>
> The Cyrus+ and Nemo boards are affected.
>
> I wrote 3 weeks ago:
>
> Hi All,
>
> I successfully compiled the latest git kernel with the first PowerPC 
> updates yesterday.
>
> Unfortunately this kernel is really dangerous. Many things for example 
> Network Manager and LightDM don't work anymore and produced several 
> gigabyte of config files till the partition has been filled.
>
> I deleted some files like the resolv.conf that had a size over 200 GB!
>
> Unfortunately, MintPPC was still damaged. For example LightDM doesn't 
> work anymore and the MATE desktop doesn't display any icons anymore 
> because Caja wasn't able to reserve memory anymore.
>
> In this case, bisecting isn't an option and I have to wait some weeks. 
> It is really difficult to find the issue if the userland will damaged 
> again and again.
>
> Cheers,
> Christian
>
> ---
>
> Maybe there is an issue in my kernel configs. Could you please check 
> the configs? Please find attached the configs. Could you please test 
> the RC2 on your FSL and pasemi machines?
>
> Thanks,
> Christian
>
Hi All,

I bisected today because Void PPC is recovering after a reboot. Memory 
space is released again. [1]

Result: c2e7a19827eec443a7cbe85e8d959052412d6dc3 (powerpc: Use generic 
fallocate compatibility syscall) is the first bad commit. [2]

I was able to create a patch for reverting this bad commit. [3]

I compiled the kernel with this patch. After that the kernel works 
without any problems.

Please check the first bad commit. [2]

Thanks,
Christian


[1] https://forum.hyperion-entertainment.com/viewtopic.php?p=56099#p56099
[2] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c2e7a19827eec443a7cbe85e8d959052412d6dc3
[3] syscall.patch:

diff -rupN a/arch/powerpc/include/asm/syscalls.h 
b/arch/powerpc/include/asm/syscalls.h
--- a/arch/powerpc/include/asm/syscalls.h       2022-10-30 
13:53:28.956001116 +0100
+++ b/arch/powerpc/include/asm/syscalls.h       2022-10-30 
13:55:39.166300756 +0100
@@ -15,6 +15,7 @@
  #include <asm/unistd.h>
  #include <asm/ucontext.h>

+long compat_sys_fallocate(int fd, int mode, u32 offset1, u32 offset2, 
u32 len1, u32 len2);
  #ifndef CONFIG_ARCH_HAS_SYSCALL_WRAPPER
  long sys_ni_syscall(void);
  #else
diff -rupN a/arch/powerpc/include/asm/unistd.h 
b/arch/powerpc/include/asm/unistd.h
--- a/arch/powerpc/include/asm/unistd.h 2022-10-30 13:53:28.957001103 +0100
+++ b/arch/powerpc/include/asm/unistd.h 2022-10-30 13:56:44.851441888 +0100
@@ -45,7 +45,6 @@
  #define __ARCH_WANT_SYS_UTIME
  #define __ARCH_WANT_SYS_NEWFSTATAT
  #define __ARCH_WANT_COMPAT_STAT
-#define __ARCH_WANT_COMPAT_FALLOCATE
  #define __ARCH_WANT_COMPAT_SYS_SENDFILE
  #endif
  #define __ARCH_WANT_SYS_FORK
diff -rupN a/arch/powerpc/kernel/sys_ppc32.c 
b/arch/powerpc/kernel/sys_ppc32.c
--- a/arch/powerpc/kernel/sys_ppc32.c   2022-10-30 13:53:28.967000972 +0100
+++ b/arch/powerpc/kernel/sys_ppc32.c   2022-10-30 13:58:28.993078689 +0100
@@ -97,6 +97,13 @@ PPC32_SYSCALL_DEFINE4(ppc_truncate64,
         return ksys_truncate(path, merge_64(len1, len2));
  }

+long compat_sys_fallocate(int fd, int mode, u32 offset1, u32 offset2,
+                                    u32 len1, u32 len2)
+{
+       return ksys_fallocate(fd, mode, merge_64(offset1, offset2),
+                            merge_64(len1, len2));
+}
+
  PPC32_SYSCALL_DEFINE4(ppc_ftruncate64,
                        unsigned int, fd, u32, reg4,
                        unsigned long, len1, unsigned long, len2)
