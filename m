Return-Path: <linuxppc-dev+bounces-8290-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B589AA8E98
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 May 2025 10:54:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zrb195rknz2ym0;
	Mon,  5 May 2025 18:54:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746435245;
	cv=none; b=km7l4DEqG/hqAjT9+uEjyepA6t0oHJqYMkhnMKnOrjZk1cH01+95r7o9yHi4w9L7PoxwYz6tiWkOkybSquHVFdu6nM2dvEFmbqU9k/vslCWVIJcndq1wriFcn2tEIwcrjeAtT604JYejHZP5gbNgcD093OpUvI1yAj8uDjBZiGkIuJr62Vbk4XSwwtkXdcU+Q9ertuiQ511yIMfKYX/jJZbUd+25C0P8x95u/egP5egZtmafGKEddMr4CodbDXeSMTWX7mcHd41h1YEQSL6cedg4/9G9rRHy8YMOrRL+cq2EKO9G8IkgAriGdJ5KfA69Dtupn1zze/uKXQaYXDpFRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746435245; c=relaxed/relaxed;
	bh=mDsh/cex7pLJmBz95gSl/5MULX/UnuZ+IBYUPdNHRM4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MgWoGwlBKJkrlCxvRtKLXcHr7YM/VKwuRYg7YxITt5Wwq/yqSZMFgPtZgbAm52HhfR0UosCuzm7y9P7XFVHd6oekYsSMee94RgwNypOVP/gK9c9OW1dlJmwKMs8gOhj8zrf0mN6a4E7Hssswa+Jm9khgGB/Y+NCeW9fXdn5omUL7eX+Upek/kx4ZpbMlnqemVfEKTfvkNu2X35+QHcvV7fPEK6oI8iiUUEUMfQ8S2Ko11ud+WZJuD/7l7ydTTK0BUHPwqDxcozqW98odL/AAR0bWRhSMDj7UAZY/KuO8BDOiUIgcscga8VPpQWbbq0q7IWzPvKwdW8YL12asRJ1ePA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Og7HfvaJ; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Og7HfvaJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zrb1863z5z2yk3
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 May 2025 18:54:03 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544Lht5S009410;
	Mon, 5 May 2025 08:53:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=mDsh/cex7pLJmBz95gSl/5MULX/Unu
	Z+IBYUPdNHRM4=; b=Og7HfvaJwSQJPC2Wi1UeoFsa929JQoRb3NHp4pybH3SlyU
	i17sJ65KcJAvhezqg2pln65han2YfYMGOftZlwRFR0mpGhULWLYwQ86YORYbheSm
	Att01SuDOtu/cvNW2eT/iI/BH6cmzS2Hu3N8vVd/Br7k5ZNDhdYrBxLGQ7+drLsm
	NRZFAfam0G5pj+XEFTL8Xj0vDoFuS9u6H4CNCxDQYdeplHDoGYHdRIdh5/UUOoDv
	VdfoMeuiE8TKaBhUKl6XDUntLSWbl5KGjird10BsSqHYxMADJfTGQO6+l2qr0Kev
	kf8b67Avpyy89RPMok0t6XtuxEipCtELQLTzxiJA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46egcv1wyw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 08:53:52 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5458jGF2019896;
	Mon, 5 May 2025 08:53:51 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46egcv1wyu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 08:53:51 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 545723iC001313;
	Mon, 5 May 2025 08:53:50 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 46dwft5meu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 08:53:50 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5458rlMH7995660
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 May 2025 08:53:47 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 14B302004E;
	Mon,  5 May 2025 08:53:47 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2D34820049;
	Mon,  5 May 2025 08:53:43 +0000 (GMT)
Received: from vaibhav?linux.ibm.com (unknown [9.39.19.242])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with SMTP;
	Mon,  5 May 2025 08:53:42 +0000 (GMT)
Received: by vaibhav@linux.ibm.com (sSMTP sendmail emulation); Mon, 05 May 2025 14:23:42 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: Amit Machhiwal <amachhiw@linux.ibm.com>,
        Madhavan Srinivasan
 <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas
 Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Cc: Amit Machhiwal <amachhiw@linux.ibm.com>,
        Shivaprasad G Bhat
 <sbhat@linux.ibm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: PPC: Book3S HV: Fix IRQ map warnings with XICS on
 pSeries KVM Guest
In-Reply-To: <20250425185641.1611857-1-amachhiw@linux.ibm.com>
References: <20250425185641.1611857-1-amachhiw@linux.ibm.com>
Date: Mon, 05 May 2025 14:23:41 +0530
Message-ID: <87y0vba162.fsf@vajain21.in.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: uAx5RckqQtaDYrVHZoGmn2qNiC74thq3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDA4MSBTYWx0ZWRfXzp9OqCY1Qkj+ NW4h2de4llaxXZ4QbT3u+/5QB5hqP4eguy7U42T14A8r7Nubx7L7wMXYPm1OKuhLZp1yhsMDT5u 4lCnlMo1N+tHJnaeCyQUXDCc234OgjBAm73LjwMCpOGCuCVKxV6Oax01HIIOBy2NYSsklevuPIa
 MYDy1BQWT2F7C6jiKZ9ymuebgUxhLUSLMncRb+t2YE14RvvdaP/wqw8VggoX+yfDWkpms8G0+yU F4X+/5JmJFzm5jLjxKoO6kv+mXBoI2Kg8Qjt+tZkqqQCAAUbHAVZgB04vze0wHm/AUYydH1M8cS gMhAW7mcowy9lz8ghcbaO1eb33wwbatmpExQ5zH27mBiVE/u2cmjmpaaG1/BSLZGkFIUZOB34bv
 3IQN7+ZJAGuZJsFs1oZShnK0WvYYfLfZfXxHnWg0He0aeC4Rdj1gp/e21cf0UPcmx5OcOVKt
X-Authority-Analysis: v=2.4 cv=O7k5vA9W c=1 sm=1 tr=0 ts=68187ca0 cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=jj4iG2UgOQh9pn3OyKEA:9
X-Proofpoint-GUID: dmm0OWzrlfnJ_nARZtUwVJLvgm2Gy17A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_04,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 malwarescore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 mlxscore=0
 adultscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050081
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


Thanks Amit for the patch.

Amit Machhiwal <amachhiw@linux.ibm.com> writes:
> The commit 9576730d0e6e ("KVM: PPC: select IRQ_BYPASS_MANAGER") enabled
> IRQ_BYPASS_MANAGER when CONFIG_KVM was set. Subsequently, commit
> c57875f5f9be ("KVM: PPC: Book3S HV: Enable IRQ bypass") enabled IRQ
> bypass and added the necessary callbacks to create/remove the mappings
> between host real IRQ and the guest GSI.
>
> The availability of IRQ bypass is determined by the arch-specific
> function kvm_arch_has_irq_bypass(), which invokes
> kvmppc_irq_bypass_add_producer_hv(). This function, in turn, calls
> kvmppc_set_passthru_irq_hv() to create a mapping in the passthrough IRQ
> map, associating a host IRQ to a guest GSI.
>
> However, when a pSeries KVM guest (L2) is booted within an LPAR (L1)
> with the kernel boot parameter `xive=off`, it defaults to using emulated
> XICS controller. As an attempt to establish host IRQ to guest GSI
> mappings via kvmppc_set_passthru_irq() on a PCI device hotplug
> (passhthrough) operation fail, returning -ENOENT. This failure occurs
> because only interrupts with EOI operations handled through OPAL calls
> (verified via is_pnv_opal_msi()) are currently supported.
>
> These mapping failures lead to below repeated warnings in the L1 host:
>
>  [  509.220349] kvmppc_set_passthru_irq_hv: Could not assign IRQ map for (58,4970)
>  [  509.220368] kvmppc_set_passthru_irq (irq 58, gsi 4970) fails: -2
>  [  509.220376] vfio-pci 0015:01:00.0: irq bypass producer (token 0000000090bc635b) registration fails: -2
>  ...
>  [  509.291781] vfio-pci 0015:01:00.0: irq bypass producer (token 000000003822eed8) registration fails: -2
>
> Fix this by restricting IRQ bypass enablement on pSeries systems by
> making the IRQ bypass callbacks unavailable when running on pSeries
> platform.
>
> Signed-off-by: Amit Machhiwal <amachhiw@linux.ibm.com>

Reviewed-by: Vaibhav Jain <vaibhav@linux.ibm.com>

> ---
>  arch/powerpc/kvm/book3s_hv.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
>
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 19f4d298dd17..7667563fb9ff 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -6541,10 +6541,6 @@ static struct kvmppc_ops kvm_ops_hv = {
>  	.fast_vcpu_kick = kvmppc_fast_vcpu_kick_hv,
>  	.arch_vm_ioctl  = kvm_arch_vm_ioctl_hv,
>  	.hcall_implemented = kvmppc_hcall_impl_hv,
> -#ifdef CONFIG_KVM_XICS
> -	.irq_bypass_add_producer = kvmppc_irq_bypass_add_producer_hv,
> -	.irq_bypass_del_producer = kvmppc_irq_bypass_del_producer_hv,
> -#endif
>  	.configure_mmu = kvmhv_configure_mmu,
>  	.get_rmmu_info = kvmhv_get_rmmu_info,
>  	.set_smt_mode = kvmhv_set_smt_mode,
> @@ -6662,6 +6658,22 @@ static int kvmppc_book3s_init_hv(void)
>  		return r;
>  	}
>  
> +#if defined(CONFIG_KVM_XICS)
> +	/*
> +	 * IRQ bypass is supported only for interrupts whose EOI operations are
> +	 * handled via OPAL calls. Therefore, register IRQ bypass handlers
> +	 * exclusively for PowerNV KVM when booted with 'xive=off', indicating
> +	 * the use of the emulated XICS interrupt controller.
> +	 */
> +	if (!kvmhv_on_pseries()) {
> +		pr_info("KVM-HV: Enabling IRQ bypass\n");
> +		kvm_ops_hv.irq_bypass_add_producer =
> +			kvmppc_irq_bypass_add_producer_hv;
> +		kvm_ops_hv.irq_bypass_del_producer =
> +			kvmppc_irq_bypass_del_producer_hv;
> +	}
> +#endif
> +
>  	kvm_ops_hv.owner = THIS_MODULE;
>  	kvmppc_hv_ops = &kvm_ops_hv;
>  
>
> base-commit: 6e3597f12dce7d5041e604fec3602493e38c330a
> -- 
> 2.49.0
>

-- 
Cheers
~ Vaibhav

