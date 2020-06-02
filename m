Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 234F71EB4F0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 07:12:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49bgCT3YKWzDqNV
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 15:12:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49bg9h5FDgzDqDK
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jun 2020 15:11:01 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49bg9X1GFkz9v6fV;
 Tue,  2 Jun 2020 07:10:56 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 3ldYUwlK1F5r; Tue,  2 Jun 2020 07:10:56 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49bg9W6c28z9v6fT;
 Tue,  2 Jun 2020 07:10:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EFB0B8B789;
 Tue,  2 Jun 2020 07:10:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id asvamB4ZYI96; Tue,  2 Jun 2020 07:10:56 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4B2548B77C;
 Tue,  2 Jun 2020 07:10:56 +0200 (CEST)
Subject: Re: [PATCH] hw_breakpoint: Fix build warnings with clang
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, mpe@ellerman.id.au
References: <20200602041208.128913-1-ravi.bangoria@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <0217bbaf-a831-8aea-3ecd-fa217fca1669@csgroup.eu>
Date: Tue, 2 Jun 2020 07:10:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200602041208.128913-1-ravi.bangoria@linux.ibm.com>
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
Cc: christophe.leroy@c-s.fr, apopple@linux.ibm.com, mikey@neuling.org,
 linux-kernel@vger.kernel.org, npiggin@gmail.com, paulus@samba.org,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 02/06/2020 à 06:12, Ravi Bangoria a écrit :
> kbuild test robot reported few build warnings with hw_breakpoint code
> when compiled with clang[1]. Fix those.
> 
> [1]: https://lore.kernel.org/linuxppc-dev/202005192233.oi9CjRtA%25lkp@intel.com/
> 
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
> ---
> Note: Prepared on top of powerpc/next.
> 
>   arch/powerpc/include/asm/hw_breakpoint.h | 3 ---
>   include/linux/hw_breakpoint.h            | 4 ++++
>   2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/hw_breakpoint.h b/arch/powerpc/include/asm/hw_breakpoint.h
> index f42a55eb77d2..cb424799da0d 100644
> --- a/arch/powerpc/include/asm/hw_breakpoint.h
> +++ b/arch/powerpc/include/asm/hw_breakpoint.h
> @@ -70,9 +70,6 @@ extern int hw_breakpoint_exceptions_notify(struct notifier_block *unused,
>   						unsigned long val, void *data);
>   int arch_install_hw_breakpoint(struct perf_event *bp);
>   void arch_uninstall_hw_breakpoint(struct perf_event *bp);
> -int arch_reserve_bp_slot(struct perf_event *bp);
> -void arch_release_bp_slot(struct perf_event *bp);
> -void arch_unregister_hw_breakpoint(struct perf_event *bp);
>   void hw_breakpoint_pmu_read(struct perf_event *bp);
>   extern void flush_ptrace_hw_breakpoint(struct task_struct *tsk);
>   
> diff --git a/include/linux/hw_breakpoint.h b/include/linux/hw_breakpoint.h
> index 6058c3844a76..521481f0d320 100644
> --- a/include/linux/hw_breakpoint.h
> +++ b/include/linux/hw_breakpoint.h
> @@ -80,6 +80,10 @@ extern int dbg_reserve_bp_slot(struct perf_event *bp);
>   extern int dbg_release_bp_slot(struct perf_event *bp);
>   extern int reserve_bp_slot(struct perf_event *bp);
>   extern void release_bp_slot(struct perf_event *bp);
> +extern int hw_breakpoint_weight(struct perf_event *bp);
> +extern int arch_reserve_bp_slot(struct perf_event *bp);
> +extern void arch_release_bp_slot(struct perf_event *bp);
> +extern void arch_unregister_hw_breakpoint(struct perf_event *bp);

Please no new 'extern'. In the old days 'extern' keyword was used, but 
new code shall not introduce new unnecessary usage of 'extern' keyword. 
See report from Checkpatch below:

WARNING:COMMIT_LOG_LONG_LINE: Possible unwrapped commit description 
(prefer a maximum 75 chars per line)
#9:
[1]: 
https://lore.kernel.org/linuxppc-dev/202005192233.oi9CjRtA%25lkp@intel.com/

CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
#40: FILE: include/linux/hw_breakpoint.h:83:
+extern int hw_breakpoint_weight(struct perf_event *bp);

CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
#41: FILE: include/linux/hw_breakpoint.h:84:
+extern int arch_reserve_bp_slot(struct perf_event *bp);

CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
#42: FILE: include/linux/hw_breakpoint.h:85:
+extern void arch_release_bp_slot(struct perf_event *bp);

CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
#43: FILE: include/linux/hw_breakpoint.h:86:
+extern void arch_unregister_hw_breakpoint(struct perf_event *bp);

total: 0 errors, 1 warnings, 4 checks, 19 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
       mechanically convert to the typical style using --fix or 
--fix-inplace.

the.patch has style problems, please review.

NOTE: Ignored message types: ARCH_INCLUDE_LINUX BIT_MACRO 
COMPARISON_TO_NULL DT_SPLIT_BINDING_PATCH EMAIL_SUBJECT 
FILE_PATH_CHANGES GLOBAL_INITIALISERS LINE_SPACING MULTIPLE_ASSIGNMENTS

NOTE: If any of the errors are false positives, please report
       them to the maintainer, see CHECKPATCH in MAINTAINERS.

Christophe
