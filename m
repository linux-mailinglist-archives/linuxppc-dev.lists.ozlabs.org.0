Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0BB83885A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jan 2024 08:55:48 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sZDQqx5I;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TJzss0PHZz3cSQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jan 2024 18:55:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sZDQqx5I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gautam.menghani@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TJzs11t9Gz30fD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jan 2024 18:55:01 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40N6LJfO019564;
	Tue, 23 Jan 2024 07:54:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=ny7R+kElPrm261ozh2Fn0CGVqgiQor3Hw3T/bLpZKzw=;
 b=sZDQqx5IsNuEyj1XzrNPIMcjCPqW8/42kckY6tThr98FgOTQsO5WxouxdloHa/L6O8LH
 TtiYnrLLJUIg9a4Xb3cj95CRJiouQFNX5b+ePQV8O83mERwuKUkUY7YsRZk4IjpO2HD0
 hWYqyPm1hqdD/5j54KBajz2KWX02NbDuHo3wA973aCIj7I3JhoL26CuoCv/5FHOfl2+Q
 MjrX8YItAjBhHNh9rVrhlW97aO6CNaKjChi/S12fSf7AJYWk+2clFjExxXtVTmW3S7SH
 57Dnj1jgZWsfH9UOl04vDA8YcNou/Hsj+0gaDBHpsUtgEI/R82b4g4YH3VRmnxrbbWw5 3w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vt7aub94k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Jan 2024 07:54:49 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40N7M1U3028447;
	Tue, 23 Jan 2024 07:54:49 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vt7aub944-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Jan 2024 07:54:48 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 40N6wmba025253;
	Tue, 23 Jan 2024 07:54:48 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3vrtqk5evf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Jan 2024 07:54:48 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 40N7sjcB63832410
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 23 Jan 2024 07:54:45 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3C53D20040;
	Tue, 23 Jan 2024 07:54:45 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5F28920049;
	Tue, 23 Jan 2024 07:54:40 +0000 (GMT)
Received: from li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.ibm.com (unknown [9.43.74.138])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 23 Jan 2024 07:54:40 +0000 (GMT)
Date: Tue, 23 Jan 2024 13:24:36 +0530
From: Gautam Menghani <Gautam.Menghani@linux.ibm.com>
To: Amit Machhiwal <amachhiw@linux.ibm.com>
Subject: Re: [PATCH] KVM: PPC: Book3S HV: Fix L2 guest reboot failure due to
 empty 'arch_compat'
Message-ID: <ml6sjj7wxq2jah4skqbsrujwfytga7ignd56sgz6z6g3zcnysk@in7tt3hwjvxw>
References: <20240118095653.2588129-1-amachhiw@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240118095653.2588129-1-amachhiw@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: qYoXp4ZVQhYlQLgKQZkNuyYOQnQScGkJ
X-Proofpoint-GUID: 0Er9RsKa2iXAgt7hgYAq1EIEBGKEdHc5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-23_02,2024-01-23_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 clxscore=1011 adultscore=0 mlxscore=0 mlxlogscore=858 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401230056
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
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org, Vaidyanathan Srinivasan <svaidy@linux.ibm.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Amit Machhiwal <amit.machhiwal@ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Jordan Niethe <jniethe5@gmail.com>, "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>, Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 18, 2024 at 03:26:53PM +0530, Amit Machhiwal wrote:
> Currently, rebooting a pseries nested qemu-kvm guest (L2) results in
> below error as L1 qemu sends PVR value 'arch_compat' == 0 via
> ppc_set_compat ioctl. This triggers a condition failure in
> kvmppc_set_arch_compat() resulting in an EINVAL.
> 
> qemu-system-ppc64: Unable to set CPU compatibility mode in KVM: Invalid
> 
> This patch updates kvmppc_set_arch_compat() to use the host PVR value if
> 'compat_pvr' == 0 indicating that qemu doesn't want to enforce any
> specific PVR compat mode.
> 
> Signed-off-by: Amit Machhiwal <amachhiw@linux.ibm.com>
> ---
>  arch/powerpc/kvm/book3s_hv.c          |  2 +-
>  arch/powerpc/kvm/book3s_hv_nestedv2.c | 12 ++++++++++--
>  2 files changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 1ed6ec140701..9573d7f4764a 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -439,7 +439,7 @@ static int kvmppc_set_arch_compat(struct kvm_vcpu *vcpu, u32 arch_compat)
>  	if (guest_pcr_bit > host_pcr_bit)
>  		return -EINVAL;
>  
> -	if (kvmhv_on_pseries() && kvmhv_is_nestedv2()) {
> +	if (kvmhv_on_pseries() && kvmhv_is_nestedv2() && arch_compat) {
>  		if (!(cap & nested_capabilities))
>  			return -EINVAL;
>  	}
> diff --git a/arch/powerpc/kvm/book3s_hv_nestedv2.c b/arch/powerpc/kvm/book3s_hv_nestedv2.c
> index fd3c4f2d9480..069a1fcfd782 100644
> --- a/arch/powerpc/kvm/book3s_hv_nestedv2.c
> +++ b/arch/powerpc/kvm/book3s_hv_nestedv2.c
> @@ -138,6 +138,7 @@ static int gs_msg_ops_vcpu_fill_info(struct kvmppc_gs_buff *gsb,
>  	vector128 v;
>  	int rc, i;
>  	u16 iden;
> +	u32 arch_compat = 0;
>  
>  	vcpu = gsm->data;
>  
> @@ -347,8 +348,15 @@ static int gs_msg_ops_vcpu_fill_info(struct kvmppc_gs_buff *gsb,
>  			break;
>  		}
>  		case KVMPPC_GSID_LOGICAL_PVR:
> -			rc = kvmppc_gse_put_u32(gsb, iden,
> -						vcpu->arch.vcore->arch_compat);
> +			if (!vcpu->arch.vcore->arch_compat) {
> +				if (cpu_has_feature(CPU_FTR_ARCH_31))
> +					arch_compat = PVR_ARCH_31;
> +				else if (cpu_has_feature(CPU_FTR_ARCH_300))
> +					arch_compat = PVR_ARCH_300;
> +			} else {
> +				arch_compat = vcpu->arch.vcore->arch_compat;
> +			}
> +			rc = kvmppc_gse_put_u32(gsb, iden, arch_compat);
>  			break;
>  		}
>  
> -- 
> 2.43.0
> 

I tested this patch on pseries Power 10  machine with KVM support : 
Without this patch, with the latest mainline as host,the kvm guest on 
pseries/powervm fails to reboot and with this patch, reboot works fine.

Tested-by: Gautam Menghani <gautam@linux.ibm.com>
