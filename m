Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE1C499D22
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jan 2022 23:16:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JjPV14SW7z3clT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jan 2022 09:16:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AWBJU1Q1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=AWBJU1Q1; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JjPSB4WBZz3cQC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jan 2022 09:15:22 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20OK2JBN017421
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jan 2022 22:15:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=itktSqAQkq9yD4/z1IYTkj2DAw2gC8rQGifTjRuH39o=;
 b=AWBJU1Q1HrMuFijnSzKGxoKgh/DfG0PxHFkY1aNu7G8t48OQle8JPJKS98JM5kUsRT2a
 +dRUGzWubKPDhFofBxCqOLZaFdRLF9x3n8nSts3dw808x0uMvG5MuZ8nP9g8SV/kODAy
 O8uvlZYDej5EZ7MTO2tsyzJXonA+tgBikqIY0zmhpfYvkJOZkTpeWGPtxDJdToL2+upn
 EIrPrygk0+gTKPrfsgt9aNkgMDIOPjHL0EJWxDW5R6qsbc52uWRFTn6VH2ef5Bd+cX6f
 sEHSc6NZBZ8MLUZz1ueAPcRr2t1ujYT8EutaFXJoOe8obCxyGzxUSMRi/J05UnvzxMtv mQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dt09w65p2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jan 2022 22:15:20 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20OMCLY4028956
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jan 2022 22:15:19 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dt09w65nu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jan 2022 22:15:19 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20OM7Zuv023337;
 Mon, 24 Jan 2022 22:15:19 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma05wdc.us.ibm.com with ESMTP id 3dr9j9r1x7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jan 2022 22:15:19 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20OMFI9828180908
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Jan 2022 22:15:18 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5D01CBE05F;
 Mon, 24 Jan 2022 22:15:18 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 88261BE056;
 Mon, 24 Jan 2022 22:15:17 +0000 (GMT)
Received: from localhost (unknown [9.163.24.67])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Mon, 24 Jan 2022 22:15:17 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 6/6] KVM: PPC: Book3S HV: Remove KVMPPC_NR_LPIDS
In-Reply-To: <20220123120043.3586018-7-npiggin@gmail.com>
References: <20220123120043.3586018-1-npiggin@gmail.com>
 <20220123120043.3586018-7-npiggin@gmail.com>
Date: Mon, 24 Jan 2022 19:15:15 -0300
Message-ID: <87a6fkeq6k.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: W7HL1Tdov0-pNMnIrvuefA2emClOqWUa
X-Proofpoint-ORIG-GUID: Gb9HlmoebLiSG3KPE8cxBhd4TDGq2nPF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-24_09,2022-01-24_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 phishscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2201240143
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:

> KVMPPC_NR_LPIDS no longer represents any size restriction on the
> LPID space and can be removed. A CPU with more than 12 LPID bits
> implemented will now be able to create more than 4095 guests.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

> ---
>  arch/powerpc/include/asm/kvm_book3s_asm.h | 3 ---
>  arch/powerpc/kvm/book3s_64_mmu_hv.c       | 3 ---
>  2 files changed, 6 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/kvm_book3s_asm.h b/arch/powerpc/include/asm/kvm_book3s_asm.h
> index e6bda70b1d93..c8882d9b86c2 100644
> --- a/arch/powerpc/include/asm/kvm_book3s_asm.h
> +++ b/arch/powerpc/include/asm/kvm_book3s_asm.h
> @@ -14,9 +14,6 @@
>  #define XICS_MFRR		0xc
>  #define XICS_IPI		2	/* interrupt source # for IPIs */
>
> -/* LPIDs we support with this build -- runtime limit may be lower */
> -#define KVMPPC_NR_LPIDS			(1UL << 12)
> -
>  /* Maximum number of threads per physical core */
>  #define MAX_SMT_THREADS		8
>
> diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3s_64_mmu_hv.c
> index f983fb36cbf2..aafd2a74304c 100644
> --- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
> +++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
> @@ -269,9 +269,6 @@ int kvmppc_mmu_hv_init(void)
>  		nr_lpids = 1UL << KVM_MAX_NESTED_GUESTS_SHIFT;
>  	}
>
> -	if (nr_lpids > KVMPPC_NR_LPIDS)
> -		nr_lpids = KVMPPC_NR_LPIDS;
> -
>  	if (!cpu_has_feature(CPU_FTR_ARCH_300)) {
>  		/* POWER7 has 10-bit LPIDs, POWER8 has 12-bit LPIDs */
>  		if (cpu_has_feature(CPU_FTR_ARCH_207S))
