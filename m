Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EA66CB575
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 06:37:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PlxkW2q53z3fTB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 15:37:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gqTvjsla;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kconsul@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gqTvjsla;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PlxjW2TfSz3c6f
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 15:37:02 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32S2JvZU011172;
	Tue, 28 Mar 2023 04:36:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=f/GGiibzFAst8WDrjrqppUBq/DzdfPCoARNRlndY0Ps=;
 b=gqTvjsla7gUrg2OdC3o9OTDkNuLWc2Ti/pBE+i9q3JT7aY6+hhVFUhE9TgGwxdtB1Hgh
 epyMPV64plDxbbDBXY+FPkatNcbORmJTK8/VlzmIl4ogaPOI7bB+bROFAQe4nLUpd5+C
 NSnMH8OLLpxvMjCbtud3NcXcKXQUx+cG+jSQqSRHo9GqKl0ck1ZLbt59t04RQKZI8ekB
 uewfUxq6gB9qofTBy/mnaojzhFh013bodKL0Nm2qX7AYvk0okOHOnNHUZGTy7mjEPZK7
 P90i+A1pa5Cr+BBrEv9+9mWCdFl+bd+J/HujbWd0X05QU0p9/2mzL90CVPSJ6kp6JetR uA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pkqc2acjv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Mar 2023 04:36:52 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32S4BKgd029454;
	Tue, 28 Mar 2023 04:36:52 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pkqc2acj6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Mar 2023 04:36:51 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32RG4Xlh028455;
	Tue, 28 Mar 2023 04:36:49 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3phrk6k0y5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Mar 2023 04:36:49 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32S4akY428967626
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Mar 2023 04:36:47 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E48E020043;
	Tue, 28 Mar 2023 04:36:46 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D66EF20040;
	Tue, 28 Mar 2023 04:36:44 +0000 (GMT)
Received: from li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com (unknown [9.43.75.27])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 28 Mar 2023 04:36:44 +0000 (GMT)
Date: Tue, 28 Mar 2023 10:06:41 +0530
From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH] arch/powerpc/kvm: kvmppc_core_vcpu_create_hv: check for
 kzalloc failure
Message-ID: <ZCJu2WN9W5wQm1x2@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
References: <20230323074718.2810914-1-kconsul@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230323074718.2810914-1-kconsul@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Zzrrn-edlQ8TMXHks40ZrqgXvfU5aIMG
X-Proofpoint-GUID: G_PLbGZk7nTbL1elO8MIhidKNiz2Pyj9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-27_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303280036
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,
On 2023-03-23 03:47:18, Kautuk Consul wrote:
> kvmppc_vcore_create() might not be able to allocate memory through
> kzalloc. In that case the kvm->arch.online_vcores shouldn't be
> incremented.
> Add a check for kzalloc failure and return with -ENOMEM from
> kvmppc_core_vcpu_create_hv().
Anyone wants to review this ?
Its been a few days of silence.
By the way, I anyway have to post a v2 as I now know that
the commit description needs to be different. But I'll wait
for review comments on the code before I do so.
> 
> Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
> ---
>  arch/powerpc/kvm/book3s_hv.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 6ba68dd6190b..e29ee755c920 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -2968,13 +2968,17 @@ static int kvmppc_core_vcpu_create_hv(struct kvm_vcpu *vcpu)
>  			pr_devel("KVM: collision on id %u", id);
>  			vcore = NULL;
>  		} else if (!vcore) {
> +			vcore = kvmppc_vcore_create(kvm,
> +					id & ~(kvm->arch.smt_mode - 1));
> +			if (unlikely(!vcore)) {
> +				mutex_unlock(&kvm->lock);
> +				return -ENOMEM;
> +			}
> +
>  			/*
>  			 * Take mmu_setup_lock for mutual exclusion
>  			 * with kvmppc_update_lpcr().
>  			 */
> -			err = -ENOMEM;
> -			vcore = kvmppc_vcore_create(kvm,
> -					id & ~(kvm->arch.smt_mode - 1));
>  			mutex_lock(&kvm->arch.mmu_setup_lock);
>  			kvm->arch.vcores[core] = vcore;
>  			kvm->arch.online_vcores++;
> -- 
> 2.39.2
> 
