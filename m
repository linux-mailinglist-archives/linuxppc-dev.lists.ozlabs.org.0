Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA12632805
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 07:37:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45HP2S40fczDqQR
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 15:37:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45HP1K65vDzDqN0
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jun 2019 15:36:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45HP1K5V1jz8svb
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jun 2019 15:36:21 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45HP1K5BTgz9s7h; Mon,  3 Jun 2019 15:36:21 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45HP1K1Y1Pz9s4V
 for <linuxppc-dev@ozlabs.org>; Mon,  3 Jun 2019 15:36:20 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x535RMn8050886
 for <linuxppc-dev@ozlabs.org>; Mon, 3 Jun 2019 01:36:17 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2svnj6ngx4-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Mon, 03 Jun 2019 01:36:17 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <ajd@linux.ibm.com>;
 Mon, 3 Jun 2019 06:36:14 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 3 Jun 2019 06:36:11 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x535aA8443319492
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 Jun 2019 05:36:10 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0D7D1A4069;
 Mon,  3 Jun 2019 05:36:10 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 752CFA4040;
 Mon,  3 Jun 2019 05:36:09 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  3 Jun 2019 05:36:09 +0000 (GMT)
Received: from [10.61.2.125] (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 44B81A0130;
 Mon,  3 Jun 2019 15:36:08 +1000 (AEST)
Subject: Re: [RFC PATCH v2] powerpc/xmon: restrict when kernel is locked down
To: "Christopher M. Riedl" <cmr@informatik.wtf>, linuxppc-dev@ozlabs.org,
 kernel-hardening@lists.openwall.com
References: <20190524123816.1773-1-cmr@informatik.wtf>
From: Andrew Donnellan <ajd@linux.ibm.com>
Date: Mon, 3 Jun 2019 15:36:05 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190524123816.1773-1-cmr@informatik.wtf>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-AU
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19060305-0028-0000-0000-000003742A98
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19060305-0029-0000-0000-00002433FBBD
Message-Id: <81549d40-e477-6552-9a12-7200933279af@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-03_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906030039
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
Cc: mjg59@google.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 24/5/19 10:38 pm, Christopher M. Riedl wrote:
> Xmon should be either fully or partially disabled depending on the
> kernel lockdown state.
> 
> Put xmon into read-only mode for lockdown=integrity and completely
> disable xmon when lockdown=confidentiality. Xmon checks the lockdown
> state and takes appropriate action:
> 
>   (1) during xmon_setup to prevent early xmon'ing
> 
>   (2) when triggered via sysrq
> 
>   (3) when toggled via debugfs
> 
>   (4) when triggered via a previously enabled breakpoint
> 
> The following lockdown state transitions are handled:
> 
>   (1) lockdown=none -> lockdown=integrity
>       clear all breakpoints, set xmon read-only mode
> 
>   (2) lockdown=none -> lockdown=confidentiality
>       clear all breakpoints, prevent re-entry into xmon
> 
>   (3) lockdown=integrity -> lockdown=confidentiality
>       prevent re-entry into xmon
> 
> Suggested-by: Andrew Donnellan <ajd@linux.ibm.com>
> Signed-off-by: Christopher M. Riedl <cmr@informatik.wtf>
> ---
> 
> Applies on top of this series:
> 	https://patchwork.kernel.org/cover/10884631/
> 
> I've done some limited testing of the scenarios mentioned in the commit
> message on a single CPU QEMU config.
> 
> v1->v2:
> 	Fix subject line
> 	Submit to linuxppc-dev and kernel-hardening
> 
>   arch/powerpc/xmon/xmon.c | 56 +++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 55 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> index 3e7be19aa208..8c4a5a0c28f0 100644
> --- a/arch/powerpc/xmon/xmon.c
> +++ b/arch/powerpc/xmon/xmon.c
> @@ -191,6 +191,9 @@ static void dump_tlb_44x(void);
>   static void dump_tlb_book3e(void);
>   #endif
>   
> +static void clear_all_bpt(void);
> +static void xmon_init(int);
> +
>   #ifdef CONFIG_PPC64
>   #define REG		"%.16lx"
>   #else
> @@ -291,6 +294,39 @@ Commands:\n\
>     zh	halt\n"
>   ;
>   
> +#ifdef CONFIG_LOCK_DOWN_KERNEL
> +static bool xmon_check_lockdown(void)
> +{
> +	static bool lockdown = false;
> +
> +	if (!lockdown) {
> +		lockdown = kernel_is_locked_down("Using xmon",
> +						 LOCKDOWN_CONFIDENTIALITY);
> +		if (lockdown) {
> +			printf("xmon: Disabled by strict kernel lockdown\n");
> +			xmon_on = 0;
> +			xmon_init(0);
> +		}
> +	}
> +
> +	if (!xmon_is_ro) {
> +		xmon_is_ro = kernel_is_locked_down("Using xmon write-access",
> +						   LOCKDOWN_INTEGRITY);
> +		if (xmon_is_ro) {
> +			printf("xmon: Read-only due to kernel lockdown\n");
> +			clear_all_bpt();

Remind me again why we need to clear breakpoints in integrity mode?


Andrew


> +		}
> +	}
> +
> +	return lockdown;
> +}
> +#else
> +inline static bool xmon_check_lockdown(void)
> +{
> +	return false;
> +}
> +#endif /* CONFIG_LOCK_DOWN_KERNEL */
> +
>   static struct pt_regs *xmon_regs;
>   
>   static inline void sync(void)
> @@ -708,6 +744,9 @@ static int xmon_bpt(struct pt_regs *regs)
>   	struct bpt *bp;
>   	unsigned long offset;
>   
> +	if (xmon_check_lockdown())
> +		return 0;
> +
>   	if ((regs->msr & (MSR_IR|MSR_PR|MSR_64BIT)) != (MSR_IR|MSR_64BIT))
>   		return 0;
>   
> @@ -739,6 +778,9 @@ static int xmon_sstep(struct pt_regs *regs)
>   
>   static int xmon_break_match(struct pt_regs *regs)
>   {
> +	if (xmon_check_lockdown())
> +		return 0;
> +
>   	if ((regs->msr & (MSR_IR|MSR_PR|MSR_64BIT)) != (MSR_IR|MSR_64BIT))
>   		return 0;
>   	if (dabr.enabled == 0)
> @@ -749,6 +791,9 @@ static int xmon_break_match(struct pt_regs *regs)
>   
>   static int xmon_iabr_match(struct pt_regs *regs)
>   {
> +	if (xmon_check_lockdown())
> +		return 0;
> +
>   	if ((regs->msr & (MSR_IR|MSR_PR|MSR_64BIT)) != (MSR_IR|MSR_64BIT))
>   		return 0;
>   	if (iabr == NULL)
> @@ -3742,6 +3787,9 @@ static void xmon_init(int enable)
>   #ifdef CONFIG_MAGIC_SYSRQ
>   static void sysrq_handle_xmon(int key)
>   {
> +	if (xmon_check_lockdown())
> +		return;
> +
>   	/* ensure xmon is enabled */
>   	xmon_init(1);
>   	debugger(get_irq_regs());
> @@ -3763,7 +3811,6 @@ static int __init setup_xmon_sysrq(void)
>   device_initcall(setup_xmon_sysrq);
>   #endif /* CONFIG_MAGIC_SYSRQ */
>   
> -#ifdef CONFIG_DEBUG_FS
>   static void clear_all_bpt(void)
>   {
>   	int i;
> @@ -3785,8 +3832,12 @@ static void clear_all_bpt(void)
>   	printf("xmon: All breakpoints cleared\n");
>   }
>   
> +#ifdef CONFIG_DEBUG_FS
>   static int xmon_dbgfs_set(void *data, u64 val)
>   {
> +	if (xmon_check_lockdown())
> +		return 0;
> +
>   	xmon_on = !!val;
>   	xmon_init(xmon_on);
>   
> @@ -3845,6 +3896,9 @@ early_param("xmon", early_parse_xmon);
>   
>   void __init xmon_setup(void)
>   {
> +	if (xmon_check_lockdown())
> +		return;
> +
>   	if (xmon_on)
>   		xmon_init(1);
>   	if (xmon_early)
> 

-- 
Andrew Donnellan              OzLabs, ADL Canberra
ajd@linux.ibm.com             IBM Australia Limited

