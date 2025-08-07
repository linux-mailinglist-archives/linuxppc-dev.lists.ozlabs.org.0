Return-Path: <linuxppc-dev+bounces-10721-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF58B1D7CC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Aug 2025 14:23:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4byRCm6W0nz3cQs;
	Thu,  7 Aug 2025 22:23:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754569428;
	cv=none; b=LC4zj1vD1Zf9/ian9vZA9H8PmcmRG3sklGUJsRnKKCD+ZSaX8VVJFcL35X/NL+FXTe+fIDKMXPkYoiVhpI1CztNC9goFtiPli2jwgyZcbjcqosldoM4UJXf+ptl2iIXTp5Elz6Jn8Yt+54Za11Qo40q3FeJS8hRyVkNDC47jYcDdtjjBbWba/txShk+M4zlq8+XWictwE+DInQtYGmlt6ORXYGk5Y+B29IVsdMhqZSO53ziCNEY4QTn+aWL5e2yYbAU3OrHBJ8wiFJ11q9uMSKc+eJBl1ivXZK6iv204ANVW7/7P6r5NkPf8F8wmX7op8KZV52L3xZTP8fbPik1Ptg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754569428; c=relaxed/relaxed;
	bh=7cvhc2n6Alx46S4I49BYrgerwP0OHDrJPDXqoNg5sY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HUk5WZ7RsQhECDt33IVdsZWj+S9vknLOJoVXssDr3E3vIM/YWoQrYaNBLVlXL0G0xcuwVNjnwmWZW+gmAkro5Yh0n2IkBu8G5Vnhh3wt/Cax3SqW9vTeODoQxLiS1ti5WtmnSO7ur6/i7e1QogF3z6JgZ8DiN3PJCqplZWh1JK9Z3ZCxrCQhMHKVFoAV7DLca6X/eSzyBXuog/+S3QewBucrDUKYgoXA0Oj1oW/Lwzu34Su5UHzfDdpIZaqfzV+BmtpMY47i+MmaIoFt8zrK791mg/xkkE1FBg0LQRavONF8moE/GOufDEh1KlQeI1EOtCb+OqR/Pg+PhuDPGdF4OQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=okyG7YYo; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=okyG7YYo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4byRCl5CZWz3cQr
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Aug 2025 22:23:47 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5774x6Gq029224;
	Thu, 7 Aug 2025 12:23:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=7cvhc2n6Alx46S4I49BYrgerwP0OHD
	rJPDXqoNg5sY8=; b=okyG7YYoE9g+vKwtOwWd4wOgZYsKc+5O0PblUVbhc+dJui
	XFB66No08Sek3fb1QEBE7LkYTpO1aLJh3B8RVUsPPZveorWbkDjoV1L5SSABqg2b
	Od0ltPtoF95c6uyxWDOgRd9gdWF+731q4nODr4awdgfg0KazYz9oFNqdPvdTMZ+a
	N84qcDEXlcqPk9ITw7DGlx6LnGgPGd66xPymvjAMqpce7PzLs60Sdj5WRlAuXkEl
	/8k6XsRxB51oKqiuJet/Er8cmrevhVpiFE9F0xWXRDkLxehY6YJV39C1TA/EEL4L
	VIh9L/RuLumueqV4tnoPZgx3A/iV8qehQD5YBsVw==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48bq61249k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Aug 2025 12:23:44 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5779QRBp020616;
	Thu, 7 Aug 2025 12:23:43 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48bpwn0gyk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Aug 2025 12:23:43 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 577CNdPk51708386
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 7 Aug 2025 12:23:39 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 63F0120043;
	Thu,  7 Aug 2025 12:23:39 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 769CC20040;
	Thu,  7 Aug 2025 12:23:38 +0000 (GMT)
Received: from li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.ibm.com (unknown [9.204.207.58])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu,  7 Aug 2025 12:23:38 +0000 (GMT)
Date: Thu, 7 Aug 2025 17:53:13 +0530
From: Gautam Menghani <gautam@linux.ibm.com>
To: Andrew Donnellan <ajd@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org
Subject: Re: [PATCH] KVM: PPC: Fix misleading interrupts comment in
 kvmppc_prepare_to_enter()
Message-ID: <aJSasSXIz19k6hCM@li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.ibm.com>
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
X-Proofpoint-GUID: 06EAVvl4PHnjptIkK1PdGjr93hknL5eX
X-Proofpoint-ORIG-GUID: 06EAVvl4PHnjptIkK1PdGjr93hknL5eX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA3MDA5OSBTYWx0ZWRfX96pEbhvEIrmG
 BWKrw1NdaLR4enGpV4jbAS+7SgnznjsmBeuy0kh7N00u2Z4QvYOQsH4yGkdsR92g43IkFeuoMFb
 DqX9mdjiQRYEsW9bUF2NDSBTlEEctS+G7BekHOgq7hNHaEXZMRGVevdIS3xPRpygdEQuLKksrsV
 uCih2OFKCpH+GTiOYYHl5Fu8MqG/cOToYTL5MaoknkDXin4Yr1YpdIcz17/jAMGajlcA5vUSdqw
 qoU1jb09YRKOfVk8drYFlVhDlBAXjHEcDbqIXQPiimrLsJ5Du7VdcUYxKM1iCyrUBH0WNIijWFH
 YYPQYyLZbqL3fa9dppMO1PBfH+rvrraibS3ZWqAVWtLzuFeK5vIh/XmIL3Wzz/AB0hZ1E08lyyd
 HmMAg196PwGVsCXUZKJhQeoWx9dWAQXqybc8Cq4dLLrYdErpZDn+cGFlsiPqDxlzfRsRR3HX
X-Authority-Analysis: v=2.4 cv=TayWtQQh c=1 sm=1 tr=0 ts=68949ad0 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=T-Jo5Y6SYTEF9Fg7UwAA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 mlxlogscore=747 bulkscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2507300000
 definitions=main-2508070099
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Aug 06, 2025 at 03:56:07PM +1000, Andrew Donnellan wrote:
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
> 


Good catch
Reviewed-by: Gautam Menghani <gautam@linux.ibm.com>

Thanks,
Gautam

