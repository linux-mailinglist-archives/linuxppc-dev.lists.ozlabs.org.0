Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A46F54FA2C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 17:25:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPjXl2dcHz3cgm
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jun 2022 01:25:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hQ1umyq5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=muriloo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hQ1umyq5;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LPjX45k8Nz3bl3
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jun 2022 01:24:51 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25HEGZrm007365;
	Fri, 17 Jun 2022 15:24:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : reply-to :
 in-reply-to : content-type : content-transfer-encoding; s=pp1;
 bh=XTDfjLhBxVckUXs3Szup29kMQMX5FY93+KiVrLPiFn4=;
 b=hQ1umyq5ZppeUdvVMGdtJezNM/TAS57RtrcEpi0kZzUyU6J4Llfexk8c3htcESezLSpG
 JcL3wdfbAuXsRpzC4bSHKSmyrVtLUXtY4gnfqCKvJtxDroYxeNuyGnTk7XtBZjqR0kKD
 Jr1kSDY5hkKEYqD8IhKmPl0xFRolrcflVrWTf7ybOgWVEzFhP7BQCtYda7nq1IIwdRGP
 h37zmjPLyIeXKGsI//QoxHrL9UNlOJ1AjMCQqPPcDdOHk8akxPH0XtWzp3n0THpCItGr
 2R92mSJdI3MpWdP+YDkK/Q3Pedpc3qQKc0M8VWfYJr6S70kFgSZnWFdmXkWu2aPSOWxs IA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3grtv7adys-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jun 2022 15:24:48 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25HFM4M0023540;
	Fri, 17 Jun 2022 15:24:48 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3grtv7ady6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jun 2022 15:24:48 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
	by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25HFL3TZ019011;
	Fri, 17 Jun 2022 15:24:46 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com [9.57.198.26])
	by ppma03wdc.us.ibm.com with ESMTP id 3gmjpa13dd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jun 2022 15:24:46 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com [9.57.199.110])
	by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25HFOkts3736460
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Jun 2022 15:24:46 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 665EFAE05F;
	Fri, 17 Jun 2022 15:24:46 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5C807AE05C;
	Fri, 17 Jun 2022 15:24:45 +0000 (GMT)
Received: from [9.163.26.91] (unknown [9.163.26.91])
	by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
	Fri, 17 Jun 2022 15:24:45 +0000 (GMT)
Message-ID: <a2378b90-a465-b60c-cc92-616b9c13daea@linux.ibm.com>
Date: Fri, 17 Jun 2022 12:24:43 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [PATCH] KVM: PPC: Align pt_regs in kvm_vcpu_arch structure
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20220525124944.2613333-1-farosas@linux.ibm.com>
From: =?UTF-8?Q?Murilo_Opsfelder_Ara=c3=bajo?= <muriloo@linux.ibm.com>
Organization: IBM
In-Reply-To: <20220525124944.2613333-1-farosas@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _R_-gaHzvFzN5ye1drkMhWqA6ZDiv-Xu
X-Proofpoint-ORIG-GUID: NnFCRvfU1eKex2TE8HntQ0-ZAhZw5VYU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-17_10,2022-06-17_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 impostorscore=0 spamscore=0 suspectscore=0 clxscore=1011 phishscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206170065
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
Reply-To: muriloo@linux.ibm.com
Cc: kvm-ppc@vger.kernel.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi, Fabiano.

On 5/25/22 09:49, Fabiano Rosas wrote:
> The H_ENTER_NESTED hypercall receives as second parameter the address
> of a region of memory containing the values for the nested guest
> privileged registers. We currently use the pt_regs structure contained
> within kvm_vcpu_arch for that end.
> 
> Most hypercalls that receive a memory address expect that region to
> not cross a 4k page boundary. We would want H_ENTER_NESTED to follow
> the same pattern so this patch ensures the pt_regs structure sits
> within a page.
> 
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Is it necessary to explain in the commit message that even though the second
parameter needs to be 4k-aligned, we're aligning pt_regs to 512 bytes so it can
be placed within a 4k boundary because its size is below 512 bytes?

The natural thinking would be aligning it to 4k bytes, which would punch a huge
hole in kvm_vcpu_arch. I think having the explanation of why 512 vs. 4k is
worthwhile mentioning.

> ---
>   arch/powerpc/include/asm/kvm_host.h | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
> index faf301d0dec0..87eba60f2920 100644
> --- a/arch/powerpc/include/asm/kvm_host.h
> +++ b/arch/powerpc/include/asm/kvm_host.h
> @@ -519,7 +519,11 @@ struct kvm_vcpu_arch {
>   	struct kvmppc_book3s_shadow_vcpu *shadow_vcpu;
>   #endif
>   
> -	struct pt_regs regs;
> +	/*
> +	 * This is passed along to the HV via H_ENTER_NESTED. Align to
> +	 * prevent it crossing a real 4K page.
> +	 */
> +	struct pt_regs regs __aligned(512);
>   
>   	struct thread_fp_state fp;
>   


-- 
Murilo
