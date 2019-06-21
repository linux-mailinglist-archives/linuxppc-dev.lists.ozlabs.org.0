Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7581C4E0D9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2019 09:08:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45VVBy5F8MzDqg5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2019 17:08:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=mahesh@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45VV9F167wzDqch
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2019 17:06:40 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5L760Ba103999
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2019 03:06:30 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2t8q34q05k-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2019 03:06:09 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <mahesh@linux.vnet.ibm.com>;
 Fri, 21 Jun 2019 08:05:15 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 21 Jun 2019 08:05:12 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x5L75BA636831642
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Jun 2019 07:05:11 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E683EA4064;
 Fri, 21 Jun 2019 07:05:10 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 59459A405C;
 Fri, 21 Jun 2019 07:05:09 +0000 (GMT)
Received: from [9.122.208.229] (unknown [9.122.208.229])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 21 Jun 2019 07:05:09 +0000 (GMT)
Subject: Re: [PATCH 05/13] powerpc/mce: Allow notifier callback to handle MCE
To: Santosh Sivaraj <santosh@fossix.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
References: <cover.1561020760.git.santosh@fossix.org>
 <196df6a74f259c041a4269e6cba026a1248ed4af.1561020760.git.santosh@fossix.org>
From: Mahesh Jagannath Salgaonkar <mahesh@linux.vnet.ibm.com>
Date: Fri, 21 Jun 2019 12:35:08 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <196df6a74f259c041a4269e6cba026a1248ed4af.1561020760.git.santosh@fossix.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19062107-0012-0000-0000-0000032B1A41
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062107-0013-0000-0000-0000216442E7
Message-Id: <d0a93aa6-be25-f0ed-21f5-f2929139a414@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-21_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=968 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906210058
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Chandan Rajendra <chandan@linux.vnet.ibm.com>,
 Reza Arbab <arbab@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/21/19 6:27 AM, Santosh Sivaraj wrote:
> From: Reza Arbab <arbab@linux.ibm.com>
> 
> If a notifier returns NOTIFY_STOP, consider the MCE handled, just as we
> do when machine_check_early() returns 1.
> 
> Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/asm-prototypes.h |  2 +-
>  arch/powerpc/kernel/exceptions-64s.S      |  3 +++
>  arch/powerpc/kernel/mce.c                 | 28 ++++++++++++++++-------
>  3 files changed, 24 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/asm-prototypes.h b/arch/powerpc/include/asm/asm-prototypes.h
> index f66f26ef3ce0..49ee8f08de2a 100644
> --- a/arch/powerpc/include/asm/asm-prototypes.h
> +++ b/arch/powerpc/include/asm/asm-prototypes.h
> @@ -72,7 +72,7 @@ void machine_check_exception(struct pt_regs *regs);
>  void emulation_assist_interrupt(struct pt_regs *regs);
>  long do_slb_fault(struct pt_regs *regs, unsigned long ea);
>  void do_bad_slb_fault(struct pt_regs *regs, unsigned long ea, long err);
> -void machine_check_notify(struct pt_regs *regs);
> +long machine_check_notify(struct pt_regs *regs);
>  
>  /* signals, syscalls and interrupts */
>  long sys_swapcontext(struct ucontext __user *old_ctx,
> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
> index 2e56014fca21..c83e38a403fd 100644
> --- a/arch/powerpc/kernel/exceptions-64s.S
> +++ b/arch/powerpc/kernel/exceptions-64s.S
> @@ -460,6 +460,9 @@ EXC_COMMON_BEGIN(machine_check_handle_early)
>  
>  	addi	r3,r1,STACK_FRAME_OVERHEAD
>  	bl	machine_check_notify
> +	ld	r11,RESULT(r1)
> +	or	r3,r3,r11
> +	std	r3,RESULT(r1)
>  
>  	ld	r12,_MSR(r1)
>  BEGIN_FTR_SECTION
> diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
> index 0ab171b41ede..912efe58e0b1 100644
> --- a/arch/powerpc/kernel/mce.c
> +++ b/arch/powerpc/kernel/mce.c
> @@ -647,16 +647,28 @@ long hmi_exception_realmode(struct pt_regs *regs)
>  	return 1;
>  }
>  
> -void machine_check_notify(struct pt_regs *regs)
> +long machine_check_notify(struct pt_regs *regs)
>  {
> -	struct machine_check_event evt;
> +	int index = __this_cpu_read(mce_nest_count) - 1;
> +	struct machine_check_event *evt;
> +	int rc;
>  
> -	if (!get_mce_event(&evt, MCE_EVENT_DONTRELEASE))
> -		return;
> +	if (index < 0 || index >= MAX_MC_EVT)
> +		return 0;
> +
> +	evt = this_cpu_ptr(&mce_event[index]);
>  
> -	blocking_notifier_call_chain(&mce_notifier_list, 0, &evt);
> +	rc = blocking_notifier_call_chain(&mce_notifier_list, 0, evt);
> +	if (rc & NOTIFY_STOP_MASK) {
> +		evt->disposition = MCE_DISPOSITION_RECOVERED;
> +		regs->msr |= MSR_RI;

What is the reason for setting MSR_RI ? I don't think this is a good
idea. MSR_RI = 0 means system got MCE interrupt when SRR0 and SRR1
contents were live and was overwritten by MCE interrupt. Hence this
interrupt is unrecoverable irrespective of whether machine check handler
recovers from it or not.

Thanks,
-Mahesh.

