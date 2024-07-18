Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A169346FA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2024 05:52:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IWwzCIAI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WPf571lstz3dJs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2024 13:52:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IWwzCIAI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WPf4R0hc0z3cFw
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2024 13:51:34 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46I3QB0Z025697;
	Thu, 18 Jul 2024 03:51:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=pp1; bh=8
	NbKhRYi5LieM0LCaj65EY/Do3XbJKVEjkqjluqRAvk=; b=IWwzCIAIjIXdJmAT+
	VoowT3XnbhO0XTTOVwEosK7VLf2W/KiNJ14T3qA8HsuMOFlmT2kH/UfXhfa1RhH9
	iy/SaSug1SPYGrtKTE2tPKfxOCw6ZO46rgTJTEpvtN7BWtgl3PQg9+zFZAVCq0f1
	LwhLQGWwzpDwMQx8Ttk3wQ/vse9l/H19RECkv4fYbgVUOJYhwCNYBhHLvUN2Isys
	6LarrILIc90P2EIGdT+/tkEPndUq6lTitblbU7up/hAdlkRdVvQj5SB97nMArmFu
	vLaAiBoKOyhx/OxTrFeYsRbL4mzXxULwIl4h8/ymNeyBxgxL4KBkhrpOmRSFjxrF
	7MOWA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40esuw05td-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jul 2024 03:51:22 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 46I3pM9f031376;
	Thu, 18 Jul 2024 03:51:22 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40esuw05tb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jul 2024 03:51:22 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 46I16IjA000509;
	Thu, 18 Jul 2024 03:51:21 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 40dwkk7muw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jul 2024 03:51:21 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 46I3pIIP3211898
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 18 Jul 2024 03:51:20 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 118A258062;
	Thu, 18 Jul 2024 03:51:18 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 141465803F;
	Thu, 18 Jul 2024 03:51:15 +0000 (GMT)
Received: from [9.204.206.229] (unknown [9.204.206.229])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 18 Jul 2024 03:51:14 +0000 (GMT)
Message-ID: <d6edb26f-f19e-4296-8fea-07961ce24960@linux.ibm.com>
Date: Thu, 18 Jul 2024 09:21:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] KVM: PPC: Book3S HV: Refactor HFSCR emulation for KVM
 guests
To: Gautam Menghani <gautam@linux.ibm.com>, mpe@ellerman.id.au,
        npiggin@gmail.com, christophe.leroy@csgroup.eu,
        naveen.n.rao@linux.ibm.com
References: <20240716115206.70210-1-gautam@linux.ibm.com>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <20240716115206.70210-1-gautam@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: l9RXJRyHS54SPijNIe1NeuLBWqfK12ms
X-Proofpoint-ORIG-GUID: wndIF21AupoinKr27uYuMGpXkcDVNJT3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-17_19,2024-07-17_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1011
 spamscore=0 bulkscore=0 adultscore=0 mlxscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407180020
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 7/16/24 5:22 PM, Gautam Menghani wrote:
> Refactor HFSCR emulation for KVM guests when they exit out with
> H_FAC_UNAVAIL to use a switch case instead of checking all "cause"
> values, since the "cause" values are mutually exclusive; and this is
> better expressed with a switch case.
>
> Signed-off-by: Gautam Menghani <gautam@linux.ibm.com>
> ---
> V1 -> V2:
> 1. Reword changelog to point out mutual exclusivity of HFSCR bits.
> 2. Reword commit message to match other commits in book3s_hv.c


Minor: I guess you mean "Reword the subject line"

Reviewed-by: Madhavan Srinivasan <maddy@linux.ibm.com>



>
>   arch/powerpc/kvm/book3s_hv.c | 16 ++++++++++++----
>   1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index daaf7faf21a5..50797b0611a2 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -1922,14 +1922,22 @@ static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
>   
>   		r = EMULATE_FAIL;
>   		if (cpu_has_feature(CPU_FTR_ARCH_300)) {
> -			if (cause == FSCR_MSGP_LG)
> +			switch (cause) {
> +			case FSCR_MSGP_LG:
>   				r = kvmppc_emulate_doorbell_instr(vcpu);
> -			if (cause == FSCR_PM_LG)
> +				break;
> +			case FSCR_PM_LG:
>   				r = kvmppc_pmu_unavailable(vcpu);
> -			if (cause == FSCR_EBB_LG)
> +				break;
> +			case FSCR_EBB_LG:
>   				r = kvmppc_ebb_unavailable(vcpu);
> -			if (cause == FSCR_TM_LG)
> +				break;
> +			case FSCR_TM_LG:
>   				r = kvmppc_tm_unavailable(vcpu);
> +				break;
> +			default:
> +				break;
> +			}
>   		}
>   		if (r == EMULATE_FAIL) {
>   			kvmppc_core_queue_program(vcpu, SRR1_PROGILL |
