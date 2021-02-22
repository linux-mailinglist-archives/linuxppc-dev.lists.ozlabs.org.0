Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1AF32221C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Feb 2021 23:23:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DkxXT4dBBz3cQd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Feb 2021 09:23:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KA7YTcZa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=KA7YTcZa; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DkxX11mKzz30QW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Feb 2021 09:22:56 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11MM2ge1025831; Mon, 22 Feb 2021 17:22:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=npttp2gG7HHATJ70ejbjmSpDXmZvm92FsgewdeP0das=;
 b=KA7YTcZaxV8ExVgUWuF0+lrl/6WsIu6KFdg7eHHs/f9k+MY9T99bqEEL9ZnnXIS9j8E6
 mEziqgjM4bfg0N1wbfvKJZ5MEDyMesJH6DZzzlBnoFJJk5mCCAmOplnm/Ygaf25E0hT1
 Vvo/ooqGl27bGbvVnBsOtwDhfm1cGzlRvQAstlpAlYeOYzmcsHE5cvYpn9mTbecoijDR
 EhwDm1abOxr5gHfRXPAd1+T6JEMorOEaMG3uyAhg6oE/WYUuyWW4gYHcZ6mj/TpMbq97
 B4oLodZA3+i8fjk+uIeGmdaUf1ukcOZkmTIJt7ScuzbMudtBqJ/w74zQ9xCFvR8ncCH2 HQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36vkehvc9c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Feb 2021 17:22:54 -0500
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 11MMEn9D095756;
 Mon, 22 Feb 2021 17:22:54 -0500
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36vkehvc98-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Feb 2021 17:22:54 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11MMHGme030401;
 Mon, 22 Feb 2021 22:22:53 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma02wdc.us.ibm.com with ESMTP id 36tt28t6rp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Feb 2021 22:22:53 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11MMMrYa23003580
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Feb 2021 22:22:53 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6405AAE05F;
 Mon, 22 Feb 2021 22:22:53 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C2325AE05C;
 Mon, 22 Feb 2021 22:22:52 +0000 (GMT)
Received: from localhost (unknown [9.160.141.72])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Mon, 22 Feb 2021 22:22:52 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
Subject: Re: [PATCH 02/13] powerpc/64s: remove KVM SKIP test from
 instruction breakpoint handler
In-Reply-To: <20210219063542.1425130-3-npiggin@gmail.com>
References: <20210219063542.1425130-1-npiggin@gmail.com>
 <20210219063542.1425130-3-npiggin@gmail.com>
Date: Mon, 22 Feb 2021 19:22:51 -0300
Message-ID: <87k0qzyc78.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-22_07:2021-02-22,
 2021-02-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102220190
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:

> The code being executed in KVM_GUEST_MODE_SKIP is hypervisor code with
> MSR[IR]=0, so the faults of concern are the d-side ones caused by access
> to guest context by the hypervisor.
>
> Instruction breakpoint interrupts are not a concern here. It's unlikely
> any good would come of causing breaks in this code, but skipping the
> instruction that caused it won't help matters (e.g., skip the mtmsr that
> sets MSR[DR]=0 or clears KVM_GUEST_MODE_SKIP).
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

> ---
>  arch/powerpc/kernel/exceptions-64s.S | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
> index 5d0ad3b38e90..5bc689a546ae 100644
> --- a/arch/powerpc/kernel/exceptions-64s.S
> +++ b/arch/powerpc/kernel/exceptions-64s.S
> @@ -2597,7 +2597,6 @@ EXC_VIRT_NONE(0x5200, 0x100)
>  INT_DEFINE_BEGIN(instruction_breakpoint)
>  	IVEC=0x1300
>  #ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
> -	IKVM_SKIP=1
>  	IKVM_REAL=1
>  #endif
>  INT_DEFINE_END(instruction_breakpoint)
