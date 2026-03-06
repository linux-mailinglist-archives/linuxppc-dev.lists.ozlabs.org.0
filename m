Return-Path: <linuxppc-dev+bounces-17788-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULFaMPRRqmlNPQEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17788-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 05:03:00 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC93021B5CD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 05:02:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fRt6R4h7Jz3c8x;
	Fri, 06 Mar 2026 15:02:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772769775;
	cv=none; b=RC0OQ6A1qPED6KSGIRge+rRJjXoqEnuFlw4YN5W88uarX6d0xzJQSCbJTB/kLHAMVrTIlFeaOOCtpQaLCq2HVN+JN5ihMvC7NQqY76QIvHFm4SkHQ51jg+Ncfi/aARhqzirq+yBLZdZasYEFHvwrQ4p0W/RsBAgCfn3sTSkP3VJTVRQhGXHe7ah3Cv78N4+r3upTrKq3VybFWDAg5W+v7sL7PTVKR8imY3fZQ2QhHIXzD0NzWNYx9JfX03drfGukX6Dce7DZEk9o38Pw5ZV3PYXuSU39/ozq4htSAG5NFhBhd2d3PAZbDb5+eSd6r+ddxtvJpwYmVCLV+8TgXFY6hg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772769775; c=relaxed/relaxed;
	bh=UtUNkw0MUz2/AtsXvYufy1POqUwRsR6hIlEgXa74mBc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WqIB52mE4WP8WHtk7oHJ0F+2MSqotEGjQFaIt0Hif1ryr/4+Pxo+1e9IYbbgknUcKZghE4ePdLqTa2AL6a6n78H1LQuV65P8FatEFDhTtgTEHSba5v4tC6iDIHxNq/3XFRTlSOEis9Ajn65P6budimcCQPuJg2ST+0R0hbBmcSsP1pIhc+kvybvSsfDLwm/3HJGFUpzx6y0uc5HgOifL750HrEk09iwbQmtChVIDk5BeYxTChW+O9DAI9iCTzXgdIH5ah1jJcLngaZJbpl7jThZr05V1iX6BjPGvm+iCidj+hMy0xsazJyU1Y3g6+ua4mXwI/7PJZhEIcjYZpTMblQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=G90NKqhI; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=G90NKqhI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fRt6Q2S5cz3bfV
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Mar 2026 15:02:53 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625HmObr1924065;
	Fri, 6 Mar 2026 04:02:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=UtUNkw
	0MUz2/AtsXvYufy1POqUwRsR6hIlEgXa74mBc=; b=G90NKqhIChlSJJ+/crnnEj
	h0Ps2O9yGtDnnpgCwhfbXUJpkY+AWv84sZZlKCmIYOTKD3R/87leilKxveTU75Ko
	zYK+YY5gqPMwe36diSg+TB0RCGYPPut9U8RbF1G47fr4N2ucLQwW50kwVc4XXRk6
	7EEL9a8jpV9wN4t4NGAo/cxHI52axctBolgOoPGi3EJ0z9Mez7X0J0luHnyhgkh5
	pHlHzboM4KYONvlSkQ8H7iMCXd1MgcFkiDMwDXmseVJ2v4vqyATdbwa1OzYfJ1uO
	1Kw3PhRqRQjF7eOCIa2S0qDcjZMrTy1gSSuzriL466cfdUdnbbHxauGoPBGk+Vrg
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cksjdpr7v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Mar 2026 04:02:48 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 62600ARw027662;
	Fri, 6 Mar 2026 04:02:47 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4cmcwjp2bc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Mar 2026 04:02:47 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 62642OB664684450
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Mar 2026 04:02:25 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A0C2E58062;
	Fri,  6 Mar 2026 04:02:46 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3A3C658057;
	Fri,  6 Mar 2026 04:02:44 +0000 (GMT)
Received: from [9.109.209.83] (unknown [9.109.209.83])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  6 Mar 2026 04:02:43 +0000 (GMT)
Message-ID: <06e74ae1-f2ad-44b9-943e-d81f6e9a638f@linux.ibm.com>
Date: Fri, 6 Mar 2026 09:32:42 +0530
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
Subject: Re: [PATCH 0/2] KVM: PPC: e500: Fix build error due to crappy KVM
 code
To: Sean Christopherson <seanjc@google.com>
Cc: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>
References: <20260303190339.974325-1-seanjc@google.com>
 <177272543796.1535167.14939828079649935273.b4-ty@google.com>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <177272543796.1535167.14939828079649935273.b4-ty@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=M9BA6iws c=1 sm=1 tr=0 ts=69aa51e8 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=NEAV23lmAAAA:8
 a=jQXK01wa9qvNmsbPlo4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 0Az0gzEXROmdiPSJ5PQfQiwjWwAlhAIz
X-Proofpoint-GUID: xz7hjrzrD_28MSnVOOToB6SC6GibOsrh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDAzMiBTYWx0ZWRfX38kdr00v9uZu
 /VWvHSkAgYHvsILWCR+Z5RbssF6Fi5ym7yEa3kBx6rE2zDAjCQzagfi42Vn6MKvbreW8EGF4x+j
 DtHTu5TsI3hHNNlVkFX8eNMBBmEZ8Xc9548S/M7qCMMDza3zp6iyUbgxfVnk9PoXGoRkWB6bGGG
 68vkFHArZhW1RI+DJybrd8qRnOKZTjkDpld1F4ZjYHYVlzdHjzhwVIIuih983pjyW+p2LzWGKi5
 m6TFCqA2JWQpKF7LppTaCUQ2zcL4r6WA8hjzyTIwo4xIHmr/TxINRFw22Q2fRgVHrzgtpXbjKEh
 NnWKDTi+mu71zuIZ9AZRwduXlqUj1L1LMWsx9aeU6IroTb7PLrTb+3+zqx0MYSP1yCXz/d88tOH
 cuxMgXFdeY0g7LYZpAvR3IN1KxW7/h/vt630hgeeCoJm0kxfaT0dm+pyOoYCHHSDlr8igamild5
 LxjujnVAVM+LlPUXNOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_01,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060032
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: DC93021B5CD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:seanjc@google.com,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kees@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[maddy@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-17788-lists,linuxppc-dev=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maddy@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[ibm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action


On 3/5/26 10:37 PM, Sean Christopherson wrote:
> On Tue, 03 Mar 2026 11:03:37 -0800, Sean Christopherson wrote:
>> Fix an e500 build error that was introduced by the recent kmalloc_obj()
>> conversion, but in reality is due to crappy KVM code that has existed for
>> ~13 years.
>>
>> I'm taking this through kvm-x86 fixes, because it's breaking my testing setup,
>> and obviously no one cares about KVM e500 since PPC_WERROR is default 'y' and
>> needs to be explicitly disabled via PPC_DISABLE_WERROR.
>>
>> [...]
> Applied to kvm-x86 fixes, thanks!
>
> [1/2] KVM: PPC: e500: Fix build error due to using kmalloc_obj() with wrong type
>        https://github.com/kvm-x86/linux/commit/a223ccf0af6e
> [2/2] KVM: PPC: e500: Rip out "struct tlbe_ref"
>        https://github.com/kvm-x86/linux/commit/3271085a7f10
I added this to my fixes-test, will pull it since you are taking it.

Maddy

> --
> https://github.com/kvm-x86/linux/tree/next

