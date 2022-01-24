Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 509F5499D48
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jan 2022 23:51:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JjQFr1khgz3bZ2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jan 2022 09:51:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pd5OIH8i;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=pd5OIH8i; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JjQF7660Vz3002
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jan 2022 09:50:51 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20OKWume013652
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jan 2022 22:50:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=FSU3ab3lcZnA6OyPGsD0s5zkLYI3WjHzzavfD8rih6Y=;
 b=pd5OIH8idzmpZ4Z+ycxMwTEaHBNEDMW08ExALlyfeJulPwLBB7z5PrCEh5CASJZDR2w6
 v3SsNe1ohMbM1TQay+l6SPCc/GjQmYlQB3hXdkM1YwQlsRMLa8lOWQ/2DJ7W8te7QZFo
 9fUQjRGEQvrDGW+MHEPWoW1OA9gxAg1QeqlPgkDm1wf0WEZZTczRrVPLkj3YK0W1xDpi
 7tzXvyIB/WG0miGDu6T3+VTGO1K5JyTjHo4oxJPxpFKt53aDvQlq4zbaJJufNP2BIrXB
 ij1Elr8cZA2PkPN223anJ9aQ+IZxwl0T5XwpjfYAFDVOXbaev0QhdTJV6ysnUZBgl8gl hA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dt09w6rws-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jan 2022 22:50:49 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20OMar1h015453
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jan 2022 22:50:48 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dt09w6rwp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jan 2022 22:50:48 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20OMb8Cp002655;
 Mon, 24 Jan 2022 22:50:48 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma04dal.us.ibm.com with ESMTP id 3dr9j9u5rm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jan 2022 22:50:48 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20OMok1Y30933446
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Jan 2022 22:50:47 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DDE19BE06A;
 Mon, 24 Jan 2022 22:50:46 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3CAD4BE051;
 Mon, 24 Jan 2022 22:50:46 +0000 (GMT)
Received: from localhost (unknown [9.163.24.67])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Mon, 24 Jan 2022 22:50:45 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/2] KVM: PPC: Book3S PR: Disallow AIL != 0
In-Reply-To: <20220124102417.3741427-3-npiggin@gmail.com>
References: <20220124102417.3741427-1-npiggin@gmail.com>
 <20220124102417.3741427-3-npiggin@gmail.com>
Date: Mon, 24 Jan 2022 19:50:44 -0300
Message-ID: <874k5seojf.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: KHkA4_PRxIyElPCANR-XTq2uQ553AxdL
X-Proofpoint-ORIG-GUID: kX4gMWMCUZhznQVw2AhfpIRDe44pK2hN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-24_09,2022-01-24_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=991
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 phishscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2201240145
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

> KVM PR does not implement address translation modes on interrupt, so it
> must not allow H_SET_MODE to succeed.
>
> This is not compatible with QEMU behaviour. The solution might be to
> have a cap-ail for this, but now it's broken either way so fix it in
> KVM to start with.
>
> This allows PR Linux guests that are using the SCV facility to boot and
> run, because Linux disables the use of SCV if AIL can not be set to 3.
> This isn't a real fix because Linux or another OS could implement real
> mode SCV vectors and try to enable it. The right solution is for KVM to
> emulate scv interrupts from the facility unavailable interrupt.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

>  arch/powerpc/kvm/book3s_pr_papr.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/arch/powerpc/kvm/book3s_pr_papr.c b/arch/powerpc/kvm/book3s_pr_papr.c
> index 1f10e7dfcdd0..dc4f51ac84bc 100644
> --- a/arch/powerpc/kvm/book3s_pr_papr.c
> +++ b/arch/powerpc/kvm/book3s_pr_papr.c
> @@ -281,6 +281,22 @@ static int kvmppc_h_pr_logical_ci_store(struct kvm_vcpu *vcpu)
>  	return EMULATE_DONE;
>  }
>
> +static int kvmppc_h_pr_set_mode(struct kvm_vcpu *vcpu)
> +{
> +	unsigned long mflags = kvmppc_get_gpr(vcpu, 4);
> +	unsigned long resource = kvmppc_get_gpr(vcpu, 5);
> +
> +	if (resource == H_SET_MODE_RESOURCE_ADDR_TRANS_MODE) {
> +		/* KVM PR does not provide AIL!=0 to guests */
> +		if (mflags == 0)
> +			kvmppc_set_gpr(vcpu, 3, H_SUCCESS);
> +		else
> +			kvmppc_set_gpr(vcpu, 3, H_UNSUPPORTED_FLAG_START - 63);
> +		return EMULATE_DONE;
> +	}
> +	return EMULATE_FAIL;
> +}
> +
>  #ifdef CONFIG_SPAPR_TCE_IOMMU
>  static int kvmppc_h_pr_put_tce(struct kvm_vcpu *vcpu)
>  {
> @@ -384,6 +400,8 @@ int kvmppc_h_pr(struct kvm_vcpu *vcpu, unsigned long cmd)
>  		return kvmppc_h_pr_logical_ci_load(vcpu);
>  	case H_LOGICAL_CI_STORE:
>  		return kvmppc_h_pr_logical_ci_store(vcpu);
> +	case H_SET_MODE:
> +		return kvmppc_h_pr_set_mode(vcpu);
>  	case H_XIRR:
>  	case H_CPPR:
>  	case H_EOI:
> @@ -421,6 +439,7 @@ int kvmppc_hcall_impl_pr(unsigned long cmd)
>  	case H_CEDE:
>  	case H_LOGICAL_CI_LOAD:
>  	case H_LOGICAL_CI_STORE:
> +	case H_SET_MODE:
>  #ifdef CONFIG_KVM_XICS
>  	case H_XIRR:
>  	case H_CPPR:
> @@ -447,6 +466,7 @@ static unsigned int default_hcall_list[] = {
>  	H_BULK_REMOVE,
>  	H_PUT_TCE,
>  	H_CEDE,
> +	H_SET_MODE,
>  #ifdef CONFIG_KVM_XICS
>  	H_XIRR,
>  	H_CPPR,
