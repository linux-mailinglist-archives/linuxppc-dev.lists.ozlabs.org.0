Return-Path: <linuxppc-dev+bounces-17147-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CAuCWqVnmmwWQQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17147-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 07:23:38 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B51192504
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 07:23:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fLPfs5Jvqz3dLg;
	Wed, 25 Feb 2026 17:23:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772000613;
	cv=none; b=gEQZynFY3gl0LeYE1jqLZw6HgWVH8rV9Spgb5ttHuzV1gTKzTpPfRwwm9XwtlLXnW775FbcCSVkIOoAAv6eMbyJwuQuYe7+h5+NpKfqj/kLQi4lShJ5U5N5pXqBBtOI8X4pAWL2Jn/b9xQZBxRP9ufO5eh9r9LsvWytcx94FHkD1lnPH4eQhWXBx2E9aNNyvwA5UI1Hpek4TBDU/OMEYxkhmx7T/u/bcA39v05Shp0re/D1TF5xw4JKZFFp8JLCgtbgAU3u7hwtoel2GZ3WrssqoyR9kq2WhReoyelUq3IylT99dIIIrgs7OPpc8bVux7Xl2kDaN8V+y6wY59nzw6A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772000613; c=relaxed/relaxed;
	bh=g/JL4sQx/07/9EoXNw/9QqykJ1mD5cx1QcJgZnmOa7E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JIp64wLqqhWBJtSZ65YGqIkz5QTx/wGyakwKSoDZuqdW01n+ncu98CJTcgVN7LssdrROD1FN2PESFsaECnQNmX2f0W2sgdHt+oe3OJblK8yN1/YmrIYEEslGLFw1Vejl/QB3fT1pRUJhauiRX1YXpTK5OtvA+83EJJpxdgT5A/HgAWFIjn4Kn8l5xQXy2nIhdrhBt0pfiFvM6GyooSIR51SGfJ+yPZ12c0cX9sVnbpOKSpzQd8nH4EabG4F67YuUbJGI7QZdw34wVE2/6Ws+Zwv+qGcpLRJzQaHIJhn225ujQNR9M3MK4+okmRPUEePs0/6m9g8I4Efr6oFqJoV0zw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sa9ygoKT; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sa9ygoKT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fLPfr6CCfz3dLS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 17:23:32 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OJK9Ls2347259;
	Wed, 25 Feb 2026 06:23:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=g/JL4s
	Qx/07/9EoXNw/9QqykJ1mD5cx1QcJgZnmOa7E=; b=sa9ygoKTPlmbCteJAeNBt/
	jAZn/5EfQBq+E57SZvgu73P/CEs7cVUmKgjQri0ZAfxzQvgj0s1fmswR2R0DNszo
	C3MlEG9hIRJaZgYT40b3NsBfA9Y/ZmFV+6W81qjSGMVWIdmOtl/+MXxmqb2ESBdn
	nSVKyQZtEjhEHBhv5+ASOpL0ccUIlyI6VMwXJkweC/7RNsC5a2iT/LtNAnzYBbUl
	7UbHZiVXUbOVa+EB1bXMemipb7KnW8TaMFwBrmeKYUpwU1f411zTwMZiSRdTElMc
	DKz9XCPDjvDnM4MEkC2bfiTD3fERcHfUMdGIFU6mfq4gXf9UpWT73JET+A3MoBUQ
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ch858mbub-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Feb 2026 06:23:29 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61P3jTkQ003386;
	Wed, 25 Feb 2026 06:23:28 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4cfs8juxwb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Feb 2026 06:23:28 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61P6NQeT49283526
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Feb 2026 06:23:27 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DA21920043;
	Wed, 25 Feb 2026 06:23:26 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5FAE020040;
	Wed, 25 Feb 2026 06:23:25 +0000 (GMT)
Received: from [9.124.223.55] (unknown [9.124.223.55])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 25 Feb 2026 06:23:25 +0000 (GMT)
Message-ID: <4cd8aeab-615a-4066-a573-5e50e7e7aad5@linux.ibm.com>
Date: Wed, 25 Feb 2026 11:53:24 +0530
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
User-Agent: Mozilla Thunderbird
Subject: Re: [Linux PPC] Disable PREEMPT
To: Christian Zigotzky <chzigotzky@xenosoft.de>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        "kvm-ppc@vger.kernel.org" <kvm-ppc@vger.kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: "R.T.Dickinson" <rtd2@xtra.co.nz>, hypexed@yahoo.com.au,
        mad skateman <madskateman@gmail.com>,
        Christian Zigotzky <info@xenosoft.de>
References: <b897b0fd-90f2-4215-bcd4-3714e497d773@xenosoft.de>
 <185d7a42-f7b4-44e1-a129-f5989d211c74@linux.ibm.com>
 <40154f6a-39da-959d-e039-5ab9ff62db3c@xenosoft.de>
 <709b864f-9daa-4a48-b3d6-39baedce63b2@linux.ibm.com>
 <dbbb7998-5245-170f-626b-81bc75a32591@xenosoft.de>
 <843b7c60-23f1-47d0-b4e8-2147c3e40c23@linux.ibm.com>
 <2a27e6fc-7eb4-41a5-ba88-58f6a22625b5@xenosoft.de>
 <1d79ec6f-ce7f-4432-80e0-a54fa1668642@linux.ibm.com>
 <e425cd24-e19a-3860-aad2-11e91af8323f@xenosoft.de>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <e425cd24-e19a-3860-aad2-11e91af8323f@xenosoft.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDA1OCBTYWx0ZWRfX/FiBYf0VfyDt
 j/ez3PsUjVfE//GU5Y38P7UY/Xv8GQ5h5/Vs1d1qAdBkOa0Zqp1MswZcV91el/BZ+78J1aJ2eIF
 57y6EMIma0qTkLbaSydK81fnQ46/eJpoH4ANHvJoiwAos4I7XYN4V8koY4IoXjus3HRLCXdJc2x
 A2+BeBAK+cfok0qxr4Fmy+IdEtuNM3n/UK/vuHFEkQZ8ZfHrClhWELmKbgughiMGE4aGSz60dEM
 uf7o7/kGQ7jDwPP3dYjAjQ4h6emla6V8iKectELn1Y/0qtFSK/AqIk/6co0SMzaQ3Lb5ST9o/1p
 vUt10JpTlDMQDxAt3S+qQd/3xrWfOKkmWdMARolXMTzY4VsnyFXTvaWBcy85eadJ3fRWHG9LCg0
 1tVzEpClgu81HPdFUypWA4eMyNsVAzD4GDOZrH5Gban1TYAA1PwX0QrIylnUU/zBTFI8Rkl1WWa
 3jpIFxIYQkQhVpx0aNQ==
X-Proofpoint-GUID: H1IgheFQlH1nrsn8jSF2o-AR3vHPY419
X-Authority-Analysis: v=2.4 cv=S4HUAYsP c=1 sm=1 tr=0 ts=699e9561 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=Gia0Ey7e-h8-FFRVDj8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 6cCOW-X_0sV-zOhRO8-5d8oHgQ20VIPc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 bulkscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602250058
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17147-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[xtra.co.nz,yahoo.com.au,gmail.com,xenosoft.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[sshegde@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chzigotzky@xenosoft.de,m:linuxppc-dev@lists.ozlabs.org,m:kvm-ppc@vger.kernel.org,m:maddy@linux.ibm.com,m:rtd2@xtra.co.nz,m:hypexed@yahoo.com.au,m:madskateman@gmail.com,m:info@xenosoft.de,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[ibm.com:+];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[sshegde@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 85B51192504
X-Rspamd-Action: no action

Hi Christian.


Is this sent as a patch or just a reply to the thread?

If it is sent as patch, Please follow these guidelines.
https://docs.kernel.org/process/submitting-patches.html

On 2/25/26 11:24 AM, Christian Zigotzky wrote:
> Hello,
> 
> We were previously able to disable PREEMPT in the kernel configuration, 
> but the latest kernels now enable it by default and it is no longer 
> possible to disable it.
> 
> Is it possible to let us decide whether to activate PREEMPT or not?
> 
> Currently we use the following revert patch for our non-preempt kernels.
> 
> --- a/kernel/Kconfig.preempt    2026-02-14 10:06:32.000000000 +0000
> +++ b/kernel/Kconfig.preempt    2026-02-08 21:03:27.000000000 +0000
> @@ -16,13 +16,11 @@ config ARCH_HAS_PREEMPT_LAZY
> 
>   choice
>       prompt "Preemption Model"
> -    default PREEMPT_LAZY if ARCH_HAS_PREEMPT_LAZY
>       default PREEMPT_NONE
> 
>   config PREEMPT_NONE
>       bool "No Forced Preemption (Server)"
>       depends on !PREEMPT_RT
> -    depends on ARCH_NO_PREEMPT
>       select PREEMPT_NONE_BUILD if !PREEMPT_DYNAMIC
>       help
>         This is the traditional Linux preemption model, geared towards
> @@ -37,7 +35,6 @@ config PREEMPT_NONE
> 
>   config PREEMPT_VOLUNTARY
>       bool "Voluntary Kernel Preemption (Desktop)"
> -    depends on !ARCH_HAS_PREEMPT_LAZY
>       depends on !ARCH_NO_PREEMPT
>       depends on !PREEMPT_RT
>       select PREEMPT_VOLUNTARY_BUILD if !PREEMPT_DYNAMIC
> 

I would instead fix any issue we have in PREEMPT FULL/LAZY rather than falling back to
old methods.

btw, did the previous patch sent, which you said helps you to boot, can you confirm
it did help you? If yes, i can send it as patch, since cond_resched if called from boot cpu
might be stuck in the loop forever.

IIRC, after boot, you had some driver causing crash. If so, share backtrace of the crash?
If you don't use that driver, is the guest stable?

