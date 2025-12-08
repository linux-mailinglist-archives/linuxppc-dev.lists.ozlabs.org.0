Return-Path: <linuxppc-dev+bounces-14682-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FA7CACE27
	for <lists+linuxppc-dev@lfdr.de>; Mon, 08 Dec 2025 11:32:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dPywz0d6yz2yNJ;
	Mon, 08 Dec 2025 21:32:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765189970;
	cv=none; b=Iia5rrKCfqR1IGDxAye4U3goVK/Tp2KDQJoicd2dHqHzzSXNvHeMe8fSjnvgM7EtU8ngqKqb8zhGnqDxpLyKOplPNy7KxhwmIH1N5YE1NApq3HBbeQdgr30PbsGfkTBvuItZhOyQ/RC/6u0LneKCSShhHoYt7NIURjGOowPFZtpaDpNb8a0Mz5GJttNrqukd7cBkl3l/3fq73h5603c+moGEW9ppvUfdkx9V4mkkBnpTEMP8MwqVhz8qS+jd9rkell87/y/dVkaH4B8jtmeWIAgmzDdBqBLpeokS2rS5pLwX2kKhdotghv1fb16+0HAwRjJn4wcJ0oZ+FLspdmX0lg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765189970; c=relaxed/relaxed;
	bh=Je9IIyqf3ckx1tk8Ni7hFzNEfi8CPmuUhAWbgT06pH4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DNeCo4iGMVV9BhcT7fzwt6ceOrX27V1v4dK4072E+9ASfuEIn9IkyqDiP6zzgX4nvICtvAHGchEWhEJTwWB8HXPF8hmW9A0jNeSsDRjiV7k+8a3TmNIa6wrMiPXHFxzavUHEICFx4ICEHo0dsyaIw0BE5LQCFRBwPCd2nZCiPLoDAyiisZ1y5OlceAg1lEc3drmBdog+++wR/AQP29KBhLAPhOFYA2z17KXmqbFxXcdtri9J884aXjro++VRV4dHKGADmNxW77ZZw4LbMYaapgpIrwrTU2gMtFw6YmIatkOvdX4vzo+TExe807dvBIKy+bBcdJsYYxIMFLgR6/sAoA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BfzC3Hxr; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=borntraeger@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BfzC3Hxr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=borntraeger@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dPywx11Flz2yKn
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Dec 2025 21:32:48 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5B86b963010256;
	Mon, 8 Dec 2025 10:32:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Je9IIy
	qf3ckx1tk8Ni7hFzNEfi8CPmuUhAWbgT06pH4=; b=BfzC3HxrPobuhS53ACWdZB
	PA9iEG/1aL4jT1TRuchKotrzCF9xodygooM1550WBnCL65pVF3xXiljw12UBVbLl
	lT+rak8kiOOioJ9cqZfrJ/ccy+UBPtvzp/8HFNZqWKthsUB1XFwvk4QBgX+oR4l2
	iEBYiqVoRUgRtZMs2uBsno0TintxSEi5vcwDUtb+JotU+Kwm1A/ocXKUSZWbktMh
	g4tOQ0bTghEU6cY1PLDtxzsPSxo1B5+CtrYCtPidOz0X79/QvKd91QLKbspeRwQw
	V9xQ4P1lQPcSB1CjW4dA4pcTwPESBW5+P72Bw0gAK7/ETwLMsX/bE32v4LqRlX8A
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4avc536st5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Dec 2025 10:32:35 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5B8ASQSK009105;
	Mon, 8 Dec 2025 10:32:34 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4avc536ssv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Dec 2025 10:32:34 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5B885xZo002034;
	Mon, 8 Dec 2025 10:32:33 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4aw11j4wwg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Dec 2025 10:32:33 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5B8AWU3o38535608
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Dec 2025 10:32:30 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0F3E72004B;
	Mon,  8 Dec 2025 10:32:30 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 73E4420040;
	Mon,  8 Dec 2025 10:32:28 +0000 (GMT)
Received: from [9.111.22.193] (unknown [9.111.22.193])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  8 Dec 2025 10:32:28 +0000 (GMT)
Message-ID: <8f1c1b9e-2743-4326-9a6f-754885ae90f4@linux.ibm.com>
Date: Mon, 8 Dec 2025 11:32:27 +0100
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
Subject: Re: [PATCH] KVM: Remove subtle "struct kvm_stats_desc" pseudo-overlay
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
        Oliver Upton <oupton@kernel.org>,
        Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Janosch Frank <frankja@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        kvm@vger.kernel.org, loongarch@lists.linux.dev,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        "Gustavo A . R . Silva" <gustavoars@kernel.org>
References: <20251205232655.445294-1-seanjc@google.com>
Content-Language: en-US
From: Christian Borntraeger <borntraeger@linux.ibm.com>
In-Reply-To: <20251205232655.445294-1-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDAyMCBTYWx0ZWRfX/ZkvryR9rikx
 RRIhLIzEwTDFULt3caOu8S6wy6ncgQsyLzn5JBuqe/16x7rRK7DPdjVge5xAJA2z7rL/tT1lyFd
 YMh3EQIfgG8q57vyiiYdkyOyNbLFDPTLaENaDyuoNnPQpGHKZMal2jpHafVG+bQkdZsWG8NW7UX
 AlT3nARl8qerz3haG9zUXE0cGXVKSMt5DkrhWZpn/VgzlCYydbpaoEhPc+m7bnrKQcjwj0amtRB
 p7RTydIUxj8YhOmJYvTpU5HYiUaYpnHgR9Ox+9r7ValcFQxCBW7NuzkHf4WykCwt+6kvFjjjGAe
 9Yp1mHPJC81eNRrbuDPcX0SwdooPdv90XQw8GuaCLPA48Ihvfn3NN+/xRxSX0h0xvHQNlMFWFsC
 kUNylzqzl1bbNR0XFFbgeDqefkUM1w==
X-Authority-Analysis: v=2.4 cv=S/DUAYsP c=1 sm=1 tr=0 ts=6936a943 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=VnNF1IyMAAAA:8 a=W9euR_DFE7q28BTGJBMA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: QQLrcpyWW-8FcouxCOIdxqAKliO-gZxO
X-Proofpoint-GUID: ADFjf-VsY2dJHYbJ59fyg02c4PSLuneX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1011 impostorscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2512060020
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Am 06.12.25 um 00:26 schrieb Sean Christopherson:
> Remove KVM's internal pseudo-overlay of kvm_stats_desc, which subtly
> aliases the flexible name[] in the uAPI definition with a fixed-size array
> of the same name.  The unusual embedded structure results in compiler
> warnings due to -Wflex-array-member-not-at-end, and also necessitates an
> extra level of dereferencing in KVM.  To avoid the "overlay", define the
> uAPI structure to have a fixed-size name when building for the kernel.
> 
> Opportunistically clean up the indentation for the stats macros, and
> replace spaces with tabs.
> 
> No functional change intended.
> 
> Reported-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> Closes: https://lore.kernel.org/all/aPfNKRpLfhmhYqfP@kspp
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Acked-by: Christian Borntraeger <borntraeger@linux.ibm.com>
[..]

> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -14,6 +14,10 @@
>   #include <linux/ioctl.h>
>   #include <asm/kvm.h>
>   
> +#ifdef __KERNEL__
> +#include <linux/kvm_types.h>
> +#endif
> +
>   #define KVM_API_VERSION 12
>   
>   /*
> @@ -1579,7 +1583,11 @@ struct kvm_stats_desc {
>   	__u16 size;
>   	__u32 offset;
>   	__u32 bucket_size;
> +#ifdef __KERNEL__
> +	char name[KVM_STATS_NAME_SIZE];
> +#else
>   	char name[];
> +#endif
>   };

Not sure if we need a comment here or not. Maybe git blame is good enough.

