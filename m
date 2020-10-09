Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AA228823D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Oct 2020 08:35:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6yy4094XzDqVF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Oct 2020 17:35:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=tfjQs89l; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6yw56FFSzDqSr
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Oct 2020 17:34:13 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0996VnRP064663; Fri, 9 Oct 2020 02:34:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=BH2/10a0AhqCTSUL5RolVXTokMre73V3j6BdRSAjKNc=;
 b=tfjQs89lF7tqcDFnLyQWsZng88hpeB0MjNtYPlu+xIe5+F2ymdsG96G39eF18Pz3ecP2
 yUi9eVsMLPLxsA4NMmL2K1QV199seyQAyX8r0PkYGT/615qXMqeDlWU70tTOl/+Cx2dm
 xUUrLA9swZh3RaqVnM26sr3NwbOKRjZhObl6WWXgUEOk+smfUmw32XyOBIgw84rDCAqF
 86OLBKI9FVkXXxhQ26qJhD3ROKlgDqYpChWIeSOjuYgGzw0uKRn3/Tfn3f39V5QlOVQK
 vkpkhvTHScGd3CRpR2BMXK6zDLxFNrZdrZOiekex13U1zTB5TNwmuFNF3POWhIVfaFrF +A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 342frfcajw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Oct 2020 02:34:06 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0996WAfY066241;
 Fri, 9 Oct 2020 02:34:06 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 342frfcaj1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Oct 2020 02:34:05 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0996TQl9007684;
 Fri, 9 Oct 2020 06:34:03 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04fra.de.ibm.com with ESMTP id 3429hs067g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Oct 2020 06:34:03 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0996Y1qq18874730
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 9 Oct 2020 06:34:01 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E4E754204C;
 Fri,  9 Oct 2020 06:34:00 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8D0A242049;
 Fri,  9 Oct 2020 06:33:59 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.89.116])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  9 Oct 2020 06:33:59 +0000 (GMT)
Subject: Re: [PATCH v3 1/2] powerpc/mce: remove nmi_enter/exit from real mode
 handler
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
References: <20201001175144.286189-1-ganeshgr@linux.ibm.com>
 <20201001175144.286189-2-ganeshgr@linux.ibm.com>
From: Ganesh <ganeshgr@linux.ibm.com>
Message-ID: <af9703e0-f92c-0e6f-9020-be60213b755c@linux.ibm.com>
Date: Fri, 9 Oct 2020 12:03:58 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201001175144.286189-2-ganeshgr@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-09_02:2020-10-09,
 2020-10-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 spamscore=0 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010090044
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
Cc: msuchanek@suse.de, keescook@chromium.org, npiggin@gmail.com,
 mahesh@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/1/20 11:21 PM, Ganesh Goudar wrote:

> Use of nmi_enter/exit in real mode handler causes the kernel to panic
> and reboot on injecting slb mutihit on pseries machine running in hash
> mmu mode, As these calls try to accesses memory outside RMO region in
> real mode handler where translation is disabled.
>
> Add check to not to use these calls on pseries machine running in hash
> mmu mode.
>
> Fixes: 116ac378bb3f ("powerpc/64s: machine check interrupt update NMI accounting")
> Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
> ---
>   arch/powerpc/kernel/mce.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
> index ada59f6c4298..3bf39dd5dd43 100644
> --- a/arch/powerpc/kernel/mce.c
> +++ b/arch/powerpc/kernel/mce.c
> @@ -591,12 +591,14 @@ EXPORT_SYMBOL_GPL(machine_check_print_event_info);
>   long notrace machine_check_early(struct pt_regs *regs)
>   {
>   	long handled = 0;
> -	bool nested = in_nmi();
> +	bool is_pseries_hpt_guest;
>   	u8 ftrace_enabled = this_cpu_get_ftrace_enabled();
>   
>   	this_cpu_set_ftrace_enabled(0);
> -
> -	if (!nested)
> +	is_pseries_hpt_guest = machine_is(pseries) &&
> +			       mmu_has_feature(MMU_FTR_HPTE_TABLE);
> +	/* Do not use nmi_enter/exit for pseries hpte guest */
> +	if (!is_pseries_hpt_guest)

In an offline discussion mpe suggested to use radix_enabled() to check if it is
radix or hash, as MMU_FTR_HPTE_TABLE may be true on radix machines also and use
of FW_FEATURE_LPAR better than machine_is(pseries), sending v4 with these changes.

>   		nmi_enter();
>   
>   	hv_nmi_check_nonrecoverable(regs);
> @@ -607,7 +609,7 @@ long notrace machine_check_early(struct pt_regs *regs)
>   	if (ppc_md.machine_check_early)
>   		handled = ppc_md.machine_check_early(regs);
>   
> -	if (!nested)
> +	if (!is_pseries_hpt_guest)
>   		nmi_exit();
>   
>   	this_cpu_set_ftrace_enabled(ftrace_enabled);
