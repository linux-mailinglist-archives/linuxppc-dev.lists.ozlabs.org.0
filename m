Return-Path: <linuxppc-dev+bounces-3072-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD4A9C2E96
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Nov 2024 17:54:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xm23S0Rhtz2yFK;
	Sun, 10 Nov 2024 03:54:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731171283;
	cv=none; b=SWGKcuWADxtSNiI0oDw0Vx8shSM97eXa5COpbHx16Fja5m0Fx+F211tHUGu0hU+zEl6sOd7ton+3gkE9nQ8xnvCEZcH7J6KqoUjgpmhgsqwEYxzB97XjJcHNUkDjEookeK3sDfNpuZCh9+q7HRcrqDpY7KHkUI4IWKfQ9yjnYqkj9fWMGqdDGBVX3KhjVC1dyeqFynhRIesmrw63Ish/s3ONT5ysORTebal8T4eUuWRh1hVnubLsu38qw1Np4vP7oKmv5paTHMPiHCgx8QruPNeC9hiPgNcPZhK77jOskFkDhWdS+wwZxyBviB58KWpXHtZbYzeUyeqJSA3YLG9t2w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731171283; c=relaxed/relaxed;
	bh=6AwOIuPNtA0KDgHntQ9tho2DJVWC64bcr/v/A/6VDJY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QsfLj/nz01gWGkb6ouG7C3ox9XYOZA7+505kFKTP186Qrt2OSPZhLN7RmFh6Z3TJztNvq8j72HepJcwwUS1jCwkxA6D1ZLrJRVGLPBaGaLdrPIf4eo60YOrtT0eyW68NAV+7TbTKlstNaoyLuE+gH+kP2VQ0uwwi3oYqLckBeDrZKBalfJTjLLLwFfkdJneBa1J5+swuO6lUyFPTbIEaztK2UnFeGnWCoGystOiGOYUK/xkZGBGd5lTucQyNh/vnsP5Hi3DrfkM2ZdwFOcarraTxl7oLnKhykZWQWo63lob+6hBaqNe/1BRk4Ca7c35WZL2HZS6FmantMGn+QpuMTg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kEhJM2d2; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kEhJM2d2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xm23R0WzDz2yF6
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Nov 2024 03:54:42 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A9FArSn011535;
	Sat, 9 Nov 2024 16:54:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=6AwOIu
	PNtA0KDgHntQ9tho2DJVWC64bcr/v/A/6VDJY=; b=kEhJM2d26+t8lJPoPQEKDS
	FUdc5BsPR/q30Kyj7wIZKMVdLfl4ILddYaaH5wgNUBQP1KUMbJ+2+fQtduw8i3QD
	nhtTmYXcRmmd72H1LdPPE0NqFBDSPgEcYVey+GNN/5TlA8V5HGWJgl2HnqHJ4rRp
	KCcMKKq5OK0OLK9gDVm628Fp+p9LI0Ni8TxKbgNojemYhNFSqXUT8K3PIgFUEvVy
	Gy8MHp9vQHnghOl8WepORGt/2D71EIAxo9jnjcelPLbj3hBauuezaWHROeKSsMUW
	2A4+YzBH+wTlNV+kAweLUyhcC8T3fvssgGfVrQrePP+sbrbdM6Qt0idY80jpmWgA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42ta4w89dq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 09 Nov 2024 16:54:08 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4A9Gs7cn002400;
	Sat, 9 Nov 2024 16:54:07 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42ta4w89dm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 09 Nov 2024 16:54:07 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4A9AjY8k012288;
	Sat, 9 Nov 2024 16:54:06 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 42p141456e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 09 Nov 2024 16:54:06 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4A9Gs59E34275944
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 9 Nov 2024 16:54:05 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ECBC720043;
	Sat,  9 Nov 2024 16:54:04 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 16E8520040;
	Sat,  9 Nov 2024 16:54:02 +0000 (GMT)
Received: from [9.39.24.130] (unknown [9.39.24.130])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  9 Nov 2024 16:54:01 +0000 (GMT)
Message-ID: <f8fe7182-d9e8-4323-a4ce-94fa0080365c@linux.ibm.com>
Date: Sat, 9 Nov 2024 22:24:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc: Add preempt lazy support
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        maddy@linux.ibm.com, christophe.leroy@csgroup.eu, peterz@infradead.org,
        bigeasy@linutronix.de
References: <20241108101853.277808-1-sshegde@linux.ibm.com>
 <87fro135qt.fsf@oracle.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <87fro135qt.fsf@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: eA6VuBr15aeFoL8Hx6vXdh20nTOw9uE9
X-Proofpoint-ORIG-GUID: SJmTaluB6y_0noNWgzGrTa-QYZzLqZYf
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
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
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 adultscore=0 phishscore=0 mlxlogscore=696 spamscore=0
 suspectscore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411090142
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 11/9/24 00:36, Ankur Arora wrote:
> 
> Shrikanth Hegde <sshegde@linux.ibm.com> writes:
> 
>> Define preempt lazy bit for Powerpc. Use bit 9 which is free and within
>> 16 bit range of NEED_RESCHED, so compiler can issue single andi.
>>
>> Since Powerpc doesn't use the generic entry/exit, add lazy check at exit
>> to user. CONFIG_PREEMPTION is defined for lazy/full/rt so use it for
>> return to kernel.
>>
>> Ran a few benchmarks and db workload on Power10. Performance is close to
>> preempt=none/voluntary. It is possible that some patterns would
>> differ in lazy[2]. More details of preempt lazy is here [1]
>>
>> Since Powerpc system can have large core count and large memory,
>> preempt lazy is going to be helpful in avoiding soft lockup issues.
>>
>> [1]: https://lore.kernel.org/lkml/20241007074609.447006177@infradead.org/
>> [2]: https://lore.kernel.org/all/1a973dda-c79e-4d95-935b-e4b93eb077b8@linux.ibm.com/
>>
>> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> 
> Looks good. Reviewed-by: <ankur.a.arora@oracle.com>

Thank you Ankur for taking a look and rwb tag.

> 
> However, I just checked and powerpc does not have
> CONFIG_KVM_XFER_TO_GUEST_WORK. Do you need this additional patch
> for handling the lazy bit at KVM guest entry?

will take a look. Thanks for the pointers.

> 
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index f14329989e9a..7bdf7015bb65 100644
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@ -84,7 +84,8 @@ int kvmppc_prepare_to_enter(struct kvm_vcpu *vcpu)
>          hard_irq_disable();
> 
>          while (true) {
> -               if (need_resched()) {
> +               unsigned long tf = read_thread_flags();
> +               if (tf & (_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY)) {
>                          local_irq_enable();
>                          cond_resched();
>                          hard_irq_disable();
> 
> 
> Ankur


