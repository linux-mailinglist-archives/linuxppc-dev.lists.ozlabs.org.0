Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E718C1882E6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 13:06:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hX2r29CZzDqdb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 23:06:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=cCQpZUj0; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hVtY0TnjzDqJY
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 22:14:29 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48hVtQ5ppyz9v0xK;
 Tue, 17 Mar 2020 12:14:22 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=cCQpZUj0; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Rz4HNBhm-l3C; Tue, 17 Mar 2020 12:14:22 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48hVtQ3lwhz9v0xF;
 Tue, 17 Mar 2020 12:14:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1584443662; bh=BZ0LYBWWFO9urZQIr4mGJkiXKv895B7QODHRrvOV2AU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=cCQpZUj0Sk/tvj0qZdyMJ/s5V8UQYcITTFhrQyV+46r4pDhdwWfE5E9owV2m4s4ey
 78Zs9E7G+xi2BcM0YhflUcW5Uw3BLZpXBSqJJx943v0W9lyZsBX4LFLu/756PEtxK+
 J3yCNF6OSmTIF5c3lLrHUW/Te6vDVy3K8cJSRD2E=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 330C88B785;
 Tue, 17 Mar 2020 12:14:23 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id AfLjiEvarbtM; Tue, 17 Mar 2020 12:14:22 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E1B088B787;
 Tue, 17 Mar 2020 12:14:17 +0100 (CET)
Subject: Re: [PATCH 15/15] powerpc/watchpoint/xmon: Support 2nd dawr
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, mpe@ellerman.id.au,
 mikey@neuling.org
References: <20200309085806.155823-1-ravi.bangoria@linux.ibm.com>
 <20200309085806.155823-16-ravi.bangoria@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <dabb2823-783a-6a3f-4f04-f3200a1086fc@c-s.fr>
Date: Tue, 17 Mar 2020 12:14:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200309085806.155823-16-ravi.bangoria@linux.ibm.com>
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
Cc: apopple@linux.ibm.com, peterz@infradead.org, fweisbec@gmail.com,
 oleg@redhat.com, npiggin@gmail.com, linux-kernel@vger.kernel.org,
 paulus@samba.org, jolsa@kernel.org, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 09/03/2020 à 09:58, Ravi Bangoria a écrit :
> Add support for 2nd DAWR in xmon. With this, we can have two
> simultaneous breakpoints from xmon.
> 
> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
> ---
>   arch/powerpc/xmon/xmon.c | 101 ++++++++++++++++++++++++++-------------
>   1 file changed, 69 insertions(+), 32 deletions(-)
> 
> diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> index ac18fe3e4295..20adc83404c8 100644
> --- a/arch/powerpc/xmon/xmon.c
> +++ b/arch/powerpc/xmon/xmon.c
> @@ -110,7 +110,7 @@ struct bpt {
>   
>   #define NBPTS	256
>   static struct bpt bpts[NBPTS];
> -static struct bpt dabr;
> +static struct bpt dabr[HBP_NUM_MAX];
>   static struct bpt *iabr;
>   static unsigned bpinstr = 0x7fe00008;	/* trap */
>   
> @@ -786,10 +786,17 @@ static int xmon_sstep(struct pt_regs *regs)
>   
>   static int xmon_break_match(struct pt_regs *regs)
>   {
> +	int i;
> +
>   	if ((regs->msr & (MSR_IR|MSR_PR|MSR_64BIT)) != (MSR_IR|MSR_64BIT))
>   		return 0;
> -	if (dabr.enabled == 0)
> -		return 0;
> +	for (i = 0; i < nr_wp_slots(); i++) {
> +		if (dabr[i].enabled)
> +			goto found;
> +	}
> +	return 0;
> +
> +found:
>   	xmon_core(regs, 0);
>   	return 1;
>   }
> @@ -928,13 +935,16 @@ static void insert_bpts(void)
>   
>   static void insert_cpu_bpts(void)
>   {
> +	int i;
>   	struct arch_hw_breakpoint brk;
>   
> -	if (dabr.enabled) {
> -		brk.address = dabr.address;
> -		brk.type = (dabr.enabled & HW_BRK_TYPE_DABR) | HW_BRK_TYPE_PRIV_ALL;
> -		brk.len = DABR_MAX_LEN;
> -		__set_breakpoint(&brk, 0);
> +	for (i = 0; i < nr_wp_slots(); i++) {
> +		if (dabr[i].enabled) {
> +			brk.address = dabr[i].address;
> +			brk.type = (dabr[i].enabled & HW_BRK_TYPE_DABR) | HW_BRK_TYPE_PRIV_ALL;
> +			brk.len = 8;
> +			__set_breakpoint(&brk, i);
> +		}
>   	}
>   
>   	if (iabr)
> @@ -1348,6 +1358,35 @@ static long check_bp_loc(unsigned long addr)
>   	return 1;
>   }
>   
> +static int free_data_bpt(void)

This names suggests the function frees a breakpoint.
I guess it should be find_free_data_bpt()

> +{
> +	int i;
> +
> +	for (i = 0; i < nr_wp_slots(); i++) {
> +		if (!dabr[i].enabled)
> +			return i;
> +	}
> +	printf("Couldn't find free breakpoint register\n");
> +	return -1;
> +}
> +
> +static void print_data_bpts(void)
> +{
> +	int i;
> +
> +	for (i = 0; i < nr_wp_slots(); i++) {
> +		if (!dabr[i].enabled)
> +			continue;
> +
> +		printf("   data   "REG"  [", dabr[i].address);
> +		if (dabr[i].enabled & 1)
> +			printf("r");
> +		if (dabr[i].enabled & 2)
> +			printf("w");
> +		printf("]\n");
> +	}
> +}
> +
>   static char *breakpoint_help_string =
>       "Breakpoint command usage:\n"
>       "b                show breakpoints\n"
> @@ -1381,10 +1420,9 @@ bpt_cmds(void)
>   			printf("Hardware data breakpoint not supported on this cpu\n");
>   			break;
>   		}
> -		if (dabr.enabled) {
> -			printf("Couldn't find free breakpoint register\n");
> +		i = free_data_bpt();
> +		if (i < 0)
>   			break;
> -		}
>   		mode = 7;
>   		cmd = inchar();
>   		if (cmd == 'r')
> @@ -1393,15 +1431,15 @@ bpt_cmds(void)
>   			mode = 6;
>   		else
>   			termch = cmd;
> -		dabr.address = 0;
> -		dabr.enabled = 0;
> -		if (scanhex(&dabr.address)) {
> -			if (!is_kernel_addr(dabr.address)) {
> +		dabr[i].address = 0;
> +		dabr[i].enabled = 0;
> +		if (scanhex(&dabr[i].address)) {
> +			if (!is_kernel_addr(dabr[i].address)) {
>   				printf(badaddr);
>   				break;
>   			}
> -			dabr.address &= ~HW_BRK_TYPE_DABR;
> -			dabr.enabled = mode | BP_DABR;
> +			dabr[i].address &= ~HW_BRK_TYPE_DABR;
> +			dabr[i].enabled = mode | BP_DABR;
>   		}
>   
>   		force_enable_xmon();
> @@ -1440,7 +1478,9 @@ bpt_cmds(void)
>   			for (i = 0; i < NBPTS; ++i)
>   				bpts[i].enabled = 0;
>   			iabr = NULL;
> -			dabr.enabled = 0;
> +			for (i = 0; i < nr_wp_slots(); i++)
> +				dabr[i].enabled = 0;
> +
>   			printf("All breakpoints cleared\n");
>   			break;
>   		}
> @@ -1474,14 +1514,7 @@ bpt_cmds(void)
>   		if (xmon_is_ro || !scanhex(&a)) {
>   			/* print all breakpoints */
>   			printf("   type            address\n");
> -			if (dabr.enabled) {
> -				printf("   data   "REG"  [", dabr.address);
> -				if (dabr.enabled & 1)
> -					printf("r");
> -				if (dabr.enabled & 2)
> -					printf("w");
> -				printf("]\n");
> -			}
> +			print_data_bpts();
>   			for (bp = bpts; bp < &bpts[NBPTS]; ++bp) {
>   				if (!bp->enabled)
>   					continue;
> @@ -1941,8 +1974,13 @@ static void dump_207_sprs(void)
>   
>   	printf("hfscr  = %.16lx  dhdes = %.16lx rpr    = %.16lx\n",
>   		mfspr(SPRN_HFSCR), mfspr(SPRN_DHDES), mfspr(SPRN_RPR));
> -	printf("dawr   = %.16lx  dawrx = %.16lx ciabr  = %.16lx\n",
> -		mfspr(SPRN_DAWR0), mfspr(SPRN_DAWRX0), mfspr(SPRN_CIABR));
> +	printf("dawr0  = %.16lx dawrx0 = %.16lx\n",
> +		mfspr(SPRN_DAWR0), mfspr(SPRN_DAWRX0));
> +	if (nr_wp_slots() > 1) {
> +		printf("dawr1  = %.16lx dawrx1 = %.16lx\n",
> +			mfspr(SPRN_DAWR1), mfspr(SPRN_DAWRX1));
> +	}
> +	printf("ciabr  = %.16lx\n", mfspr(SPRN_CIABR));
>   #endif
>   }
>   
> @@ -3862,10 +3900,9 @@ static void clear_all_bpt(void)
>   		bpts[i].enabled = 0;
>   
>   	/* Clear any data or iabr breakpoints */
> -	if (iabr || dabr.enabled) {
> -		iabr = NULL;
> -		dabr.enabled = 0;
> -	}
> +	iabr = NULL;
> +	for (i = 0; i < nr_wp_slots(); i++)
> +		dabr[i].enabled = 0;
>   }
>   
>   #ifdef CONFIG_DEBUG_FS
> 

Christophe
