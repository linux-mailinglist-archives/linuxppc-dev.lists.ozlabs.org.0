Return-Path: <linuxppc-dev+bounces-16876-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGJOFy/XkmnKywEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16876-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Feb 2026 09:37:03 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 891481419D4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Feb 2026 09:37:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fDx2x1ZNpz2ySS;
	Mon, 16 Feb 2026 19:36:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771231017;
	cv=none; b=EmLc+eeUnrIaTYsZc3dpNuP8VCfihuTdt/Ty3TlEwpc4/rmytfdKkULPxHaXIRtL4E6zvydl6CWGZa6M1rwNy8+UEjj7AO5NoEp58gZz77F2qcW7cWl9PKdBIidMpuDx11xbAESFGaFYkpJX84xLXhLbOpGqUH1R1uv9E3dOQrBtOeGNWvYt8oLOYGzt6YkAaP4KQPiavpNxCTfg9Sab+J0TlMwy/HszOh+bjRWPrUjw1z58vTjR5/xBiiMDF9824tfauPiVGWhakBNlsg4pCKbI0HXc6y+beK/v3lafyZ3ggPjC7Qkt0UwuPq/35r3MDTky1HiCKSrcbXxQ0ic78A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771231017; c=relaxed/relaxed;
	bh=5tIzcwStWLw/uFU3YPIthqSkGIkJLpNLF6IomNN25DE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mq+e+xFeDi/0cnqEaEeFe4l+6Z/7cYAVGzU0Mf8f9CvUxrTTWFpcpAm62z5ZgewJzPj6q7SIaObWAox8UWVPdzMJ4D9P3ILNvA/AmJWEY5WkA3i2ThO2wyHEfNKw6zuHJ0INn8qVavYi4sm3hPIlXpQ1Ya+KHNw2yT562UGgy6N2qfG8wi0GuAU8j0F0+aUYHmfUFCfvl1f91F8lu3Wgex8jpoM9lZ42hnJ1W2R1GNHMXwUy2+A7z1GE6E6OgSi1UJdn5Vctbspfu2oJn4ExyaobBOQFv8T1rBpvN+GrDBoYn/0ri8FqWJ5AFFDcIBNEjVO/rpE+0T8KvrKQwG4/hQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ALd2DyJq; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ALd2DyJq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fDx2v5GnVz2xN4
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Feb 2026 19:36:54 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61FJkM7i3310647;
	Mon, 16 Feb 2026 08:36:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=5tIzcw
	StWLw/uFU3YPIthqSkGIkJLpNLF6IomNN25DE=; b=ALd2DyJqlVtvuVGEGzhqJB
	TYeac51JMWryv2hAEesLu1z871X4DvnLbsmNBj9RBewlefXRiNq6KMdR4HrZrB+y
	J00zCUo20+ZIE8AY0fe6A/xkuuWmfxD+sq4Ir5dkFC3YITrd6SVY3AtFndbgRzi8
	jxiT5HPbzRGafFkI42idVezkjYTER3iYhM2RqXutw4kjyL0IcvfitsPTwwAYRY39
	WUEeVRP9tK63f4GrWbNX6/cloIW7yU6rp5TgUdf/iczx3SQur9/sGdVS7goi8f02
	Zb6KWb077lcYwxfYhUtMgyfTFNCqCds323c1m2AfN98DRo6Ns54RTLMtCRNWKtPg
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4caj4k6d02-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Feb 2026 08:36:30 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61G6k212004197;
	Mon, 16 Feb 2026 08:36:30 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4cb4cmvmq7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Feb 2026 08:36:30 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61G8aPgo20840962
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Feb 2026 08:36:26 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DDF9C2004D;
	Mon, 16 Feb 2026 08:36:25 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8B62920049;
	Mon, 16 Feb 2026 08:36:23 +0000 (GMT)
Received: from [9.78.106.17] (unknown [9.78.106.17])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 16 Feb 2026 08:36:23 +0000 (GMT)
Message-ID: <87b92f46-8b05-4061-949c-4c15afc55d29@linux.ibm.com>
Date: Mon, 16 Feb 2026 14:06:22 +0530
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
Subject: Re: [PATCH 5/5] powerpc64/bpf: fix handling of BPF stack in exception
 callback
To: bot+bpf-ci@kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: bpf@vger.kernel.org, ast@kernel.org, daniel@iogearbox.net,
        andrii@kernel.org, skb99@linux.ibm.com, adubey@linux.ibm.com,
        martin.lau@kernel.org, eddyz87@gmail.com, yonghong.song@linux.dev,
        clm@meta.com, ihor.solodrai@linux.dev
References: <20260216065639.1750181-6-hbathini@linux.ibm.com>
 <5f92f12e74b1c8d6fa54ec72590d5087a3c8b7ac2d7302309936db6bd196f5cc@mail.kernel.org>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <5f92f12e74b1c8d6fa54ec72590d5087a3c8b7ac2d7302309936db6bd196f5cc@mail.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA2NyBTYWx0ZWRfX77AkWTr2afRm
 gi64dMH77NNwHAYLooc7bGz9wmIR7SjtQhexbNyhQc5qgkJOX0Nh0NTXN2gNFjk6lucImhg/Vpx
 7f81RRrAeILeAOu06Z9dV07UXN7asbf4S476OQx2Dwl0yKWwxo8eAsypCjlLCbmgHNThYW4euR4
 7rFs1LWUgrBs46mp/jVevaoWIXgtWs3F44CT5noZjelmNGysL2K3juga+7LynVu4c9kBdWX0f47
 XwfjcPVT5VdwXKPvxCDMy10UgpxR583FYzbRTMxjdAN96Oxa8Xbvw65t/CitQGrfj9SyuO/NYH5
 vz1aGafiunUmBkeBXEs+s6+ziwt5Vagrxhp6cBm44zaZpW/fKxGF/RslP+KGtAkhKEazclblpzE
 5Q23D9y+qMsnFgZvyipqFuN6SV5kPn6XX9jKhUc0aqeiYHPo8AqiBeIZGRNBh5HGxt4/1rLbFsu
 mcjzuJ7DbQE9ke2uhsA==
X-Proofpoint-ORIG-GUID: dUEtbjr8eV1VnIqXfqevM8ijjJfpVQhl
X-Proofpoint-GUID: mCspMg7hfWqjXDzVlr07iz_OuCWjX2Wp
X-Authority-Analysis: v=2.4 cv=M7hA6iws c=1 sm=1 tr=0 ts=6992d70f cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=vP-F963z1u4rLPN7kLoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_03,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160067
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bot+bpf-ci@kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:bpf@vger.kernel.org,m:ast@kernel.org,m:daniel@iogearbox.net,m:andrii@kernel.org,m:skb99@linux.ibm.com,m:adubey@linux.ibm.com,m:martin.lau@kernel.org,m:eddyz87@gmail.com,m:yonghong.song@linux.dev,m:clm@meta.com,m:ihor.solodrai@linux.dev,m:bot@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-16876-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER(0.00)[hbathini@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,iogearbox.net,linux.ibm.com,gmail.com,linux.dev,meta.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hbathini@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_RCPT(0.00)[linuxppc-dev,bpf-ci];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 891481419D4
X-Rspamd-Action: no action



On 16/02/26 1:10 pm, bot+bpf-ci@kernel.org wrote:
>> diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
>> --- a/arch/powerpc/net/bpf_jit_comp64.c
>> +++ b/arch/powerpc/net/bpf_jit_comp64.c
> 
> [ ... ]
> 
>> @@ -287,6 +285,22 @@
>>   		 * program(main prog) as third arg
>>   		 */
>>   		EMIT(PPC_RAW_MR(_R1, _R5));
>> +		/*
>> +		 * Exception callback reuses the stack frame of exception boundary.
>> +		 * But BPF stack depth of exception callback and exception boundary
>> +		 * don't have to be same. If BPF stack depth is different, adjust the
>> +		 * stack frame size considering BPF stack depth of exception callback.
>> +		 * The non-volatile register save area remains unchanged. These non-
>> +		 * volatile registers are restored in exception callback's epilogue.
>> +		 */
>> +		EMIT(PPC_RAW_LD(bpf_to_ppc(TMP_REG_1), _R5, 0));
>> +		EMIT(PPC_RAW_SUB(bpf_to_ppc(TMP_REG_2), _R1, bpf_to_ppc(TMP_REG_1)));
> 
> Are the operands to PPC_RAW_SUB reversed here? At this point R1 holds
> boundary_sp (set by the MR above) and TMP_REG_1 holds prev_sp (loaded
> from [R5+0]). Since the stack grows downward, boundary_sp < prev_sp.
> 

> PPC_RAW_SUB(d, a, b) computes d = a - b, confirmed by how BPF_SUB is
> emitted in bpf_jit_build_body():
> 
>      case BPF_ALU64 | BPF_SUB | BPF_X: /* dst -= src */
>          EMIT(PPC_RAW_SUB(dst_reg, dst_reg, src_reg));

That was a good catch.
"subf Rx,Ry,Rz" vs "sub Rx,Rz,Ry" distinction on how the operation
is interpreted. Will respin.

- Hari

