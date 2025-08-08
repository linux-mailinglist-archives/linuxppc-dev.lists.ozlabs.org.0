Return-Path: <linuxppc-dev+bounces-10750-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D90B1E285
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Aug 2025 08:52:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4byvqV3FNjz3bmC;
	Fri,  8 Aug 2025 16:52:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754635974;
	cv=none; b=l7YvSM8q7ie6oHr85D2LXNlZFHDsHdRN1BIaKY1LsGuvcRZsVRal9XVBNEXUPgeWvTIaUHQN9PyvmN2duMPKvUW9mCdR5w0SaIddPuFvxlyYvNfNR9Bqz/ehvLAzEWbHAXrq7igchrHpdpv3XYPteqls6sJfWYwzkemUWfZ8dzOQGWZvZ7c7xwLDVTaqW2ZjNmSgN5kmyTS5TBI5+r+O1w8XXQ5izdSrK3P1fDC3ReEqDfZDnguEw52Jhw6XlRLIfd1mzn9H8IYuKgtLNSExupzMspoHXJKzwxazCReLcuWRPqlenLeCGo1GvT1ET0QaYmnov0rNowBymXx6FbGDEA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754635974; c=relaxed/relaxed;
	bh=e/fjeSaQRZNP3JdWMoihbTZAw78OQeDdx+AtxvK9958=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dRdMYxJNhUSCtFM1f39GEx+yL+5hK+nOZ8jgKazzRYkFt4AceZonTf6PuX7Se3LtzcnOegFAx30xBWNH4Tb6EiyImW5skM60ZhR74rsRO+0nHR9/RBwOiPbS6DinRx9UkFGF//gcY8xzc7RJuKJlXakSVWpOCrO5IHSduC/2jkswColMLDfGc1YnVf60wj0rVDHq1HHe2ZZQQKhq5rqIB/o/8z68bmzpeIIPYDOezr62ELQmgnj/OpN/42PxGnStlXj2mJ/NSQ0J3/CuZRLw5GIj9zqAB4o/EFAMm2yLJej7Vxxsok5xp8A/xB9Q+HHGEKf0gZFePBOMJG4oQ8kElQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ppHz0ecz; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=amachhiw@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ppHz0ecz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=amachhiw@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4byvqT32C8z2xcG
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Aug 2025 16:52:52 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5783OJPJ019470;
	Fri, 8 Aug 2025 06:52:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=e/fjeSaQRZNP3JdWMoihbTZAw78OQe
	Ddx+AtxvK9958=; b=ppHz0ecz2z5mDVkRDUFnY3yNQf6zFWoCjmQEwm+8p+D8bN
	0z1yCcpgHIBlAk/ByOK/0O+kUAW0kho9O4/ZZBjZph5JB2h7PR1Kjz6Nlha3NqN2
	rD0ixGED+SNOb+xHkfDKeED0BWmnATwneHS94d5FttfuMmizQFQmrf1UCcwnFooD
	DjWmuzgrRhjTHVZVibM940KhtxZsOqelrJxDucTHn3CG6jV89K7XD3oTWZpilQl4
	Pz91KZRyj4XTwxEJUD+Ki+LvDzoXYMeTnlM+TrwQRlb00Z098jXLGQhfnlLPZf0K
	zn5EekMGVmsLMV4xaEX90r5v+Z2GwoKYC6BLzYSA==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48c26u481f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Aug 2025 06:52:50 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5786FGm3020603;
	Fri, 8 Aug 2025 06:52:49 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48bpwn4f99-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Aug 2025 06:52:48 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5786qiMY41288106
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 8 Aug 2025 06:52:45 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E286420043;
	Fri,  8 Aug 2025 06:52:44 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E376420040;
	Fri,  8 Aug 2025 06:52:43 +0000 (GMT)
Received: from li-e7e2bd4c-2dae-11b2-a85c-bfd29497117c.ibm.com (unknown [9.124.217.7])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri,  8 Aug 2025 06:52:43 +0000 (GMT)
Date: Fri, 8 Aug 2025 12:22:41 +0530
From: Amit Machhiwal <amachhiw@linux.ibm.com>
To: Andrew Donnellan <ajd@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org
Subject: Re: [PATCH] KVM: PPC: Fix misleading interrupts comment in
 kvmppc_prepare_to_enter()
Message-ID: <20250808122131.834df8e0-6c-amachhiw@linux.ibm.com>
Mail-Followup-To: Andrew Donnellan <ajd@linux.ibm.com>, 
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org
References: <20250806055607.17081-1-ajd@linux.ibm.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250806055607.17081-1-ajd@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ctVdYfXKz-a7nubi8SMjZ2vAE0M499Gz
X-Authority-Analysis: v=2.4 cv=F/xXdrhN c=1 sm=1 tr=0 ts=68959ec2 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=T-Jo5Y6SYTEF9Fg7UwAA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: ctVdYfXKz-a7nubi8SMjZ2vAE0M499Gz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA4MDA1NSBTYWx0ZWRfX11YstKMHW7sA
 oSO3nir8LawsVvN8u035WmVjCXR2mrc2KkPYo8Y2RazWlnq+JH1+1rt7qEoC3fITE6iQVe+plup
 ekAlQSkYW+z9E5uIepJilW0S/dsaWpFwG0Yv7vCeRHgS89HNORoh0NHZL/wRALsEGL5FDcFW7cU
 5ET/IdzWAxglrpOMsoB9LmJo5SYzYFiLCAEV6ULJwbOdaa29PQq47EeGDfjM/G3uYZrZHCpBH2c
 G/5CoU7OXrIjnvTHlcYkbX6s7DmxFuTpKTifirYYucP6jbS8BlVoGr36JRZutRntP0t9APVmm6J
 fVlxPK4efUBNr1YOl4/XtWTfqVVZwwDEk7xprFJo07SFBSB6WPYVSK/vagUVn7lrm8FIRVAoa3g
 xL7/+Feul5k2t5l7OY/S/lYo78K3bGZ8odKNezAtIsW1Zo/u3RGUShn0uHPwvh6lS/x1xyF6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_spam_definite policy=outbound
 score=100 mlxscore=100 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 spamscore=100 bulkscore=0 adultscore=0 mlxlogscore=-999
 malwarescore=0 phishscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508080055
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025/08/06 03:56 PM, Andrew Donnellan wrote:
> Until commit 6c85f52b10fd ("kvm/ppc: IRQ disabling cleanup"),
> kvmppc_prepare_to_enter() was called with interrupts already disabled by
> the caller, which was documented in the comment above the function.
> 
> Post-cleanup, the function is now called with interrupts enabled, and
> disables interrupts itself.
> 
> Fix the comment to reflect the current behaviour.
> 
> Fixes: 6c85f52b10fd ("kvm/ppc: IRQ disabling cleanup")
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>

Thanks for catching and fixing this. Please feel free to add:

Reviewed-by: Amit Machhiwal <amachhiw@linux.ibm.com>

> ---
>  arch/powerpc/kvm/powerpc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index 153587741864..2ba057171ebe 100644
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@ -69,7 +69,7 @@ int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu)
>  
>  /*
>   * Common checks before entering the guest world.  Call with interrupts
> - * disabled.
> + * enabled.
>   *
>   * returns:
>   *
> -- 
> 2.50.1
> 

