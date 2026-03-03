Return-Path: <linuxppc-dev+bounces-17556-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eK55HultpmkaPwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17556-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 06:13:13 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6311E9239
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 06:13:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQ3pr1D3qz30Lw;
	Tue, 03 Mar 2026 16:13:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772514788;
	cv=none; b=ikOv1aI48qLmiAVQAjCOetQP6w5auE3hO7s9rXqJF6eUZJP4rFVrlRPueVsAdPP6pqUVfJqW4WpzOXBrw/v5fwJ9N6BOHZkD/9+3Pf4g2dPRbI5HmVpeu+c5A7yeMsipIaUGe1V7QJO9gJhjTV/NG8WvId67rVUobG+Iyqf7qAU0qZ2i5mAkIeHDikPr9aLmQ95WLnLydH4kCf3956Xl8jqQB2XkNE29g3ub7LoDMgCHelulkQJI1KkiQVrXp/NIihxirk5glD2jfV/WxZHx2b6c56/WCjTLA0dmMMqGZRJrJ8cuy/WWT4RqRi+XIbHdihuANbCEqRcOUGKPCNss7A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772514788; c=relaxed/relaxed;
	bh=UKjz2sZuAPt8Ct2OqzfG8dM5JV8WxLLFGUO1trZhkIY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Vd89oZytaWS8QRSw5WAbEVKz0UddabT8xQjjFBwOCc5THdccaPNHGYd21xDDc/cA0jcIEQs1bW4w7dG9sE4mzanTm38rDv8MjwzJpi8p0bv2fdQq8swzx/GY3eA+erSEUBbvr6sa1LQwjWWVq+srUIkG5GX0ggTW1JMIZQGKGl7nCLYiKABMeXrf0wMvA3douIqgK+JGpOe354O3Zp+HWlD+HGZF/Hv0e19KwEhoPfuu8COalAADa5fj2qYtz9OwAyHjR7N/bEVe1syubZUNkCUlXKUcu48vGib1oAc8QzEldGDNKd0ElLs+uB/ck4pF8EZgxLCukMM6c6C2uW039A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=L7XfrGs2; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=L7XfrGs2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQ3pp668Zz2xpk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Mar 2026 16:13:06 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622JOjAG573073;
	Tue, 3 Mar 2026 05:12:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=UKjz2s
	ZuAPt8Ct2OqzfG8dM5JV8WxLLFGUO1trZhkIY=; b=L7XfrGs2NfbBGbyv2tQ1LZ
	q4X6guHTAt+jtH66huqTSwC+MLLB7+DSq8qOni8XBy3jC7c+wjvS5T9vEtyRSQN4
	LQGWC4AhtTOd1Is4jZkJHv2O7tR0QVUNxvj44WGD9NTZVIj11v2o58Zmf+YA2hrW
	a0Il1ckd2/HlinuNakWUI/05R+D9QMCfb3g6rmKX0jScLH0JSG9PrSq8A7j/tFoH
	zoS1bFs0RFD1V5mtadt8QhwAhBdJTAhFZ4WPu1B9V3w+1hkod7K0HooUxus9pnGJ
	Qywr3d5/IrsMAXBNXNosL92znhQ8NCuWaoiej7a67H0pagjJmkdQIF8YpJ/XXkSA
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cksjd9mpc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Mar 2026 05:12:50 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 6230nuOb027710;
	Tue, 3 Mar 2026 05:12:49 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4cmcwj8p10-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Mar 2026 05:12:49 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6235Cm2M21037778
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 3 Mar 2026 05:12:48 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3DB7558063;
	Tue,  3 Mar 2026 05:12:48 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 748AA58043;
	Tue,  3 Mar 2026 05:12:44 +0000 (GMT)
Received: from [9.61.244.206] (unknown [9.61.244.206])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  3 Mar 2026 05:12:44 +0000 (GMT)
Message-ID: <879f600f-7c1e-4b54-a317-535412192371@linux.ibm.com>
Date: Tue, 3 Mar 2026 10:42:42 +0530
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
Subject: Re: [PATCH v2 0/4] powerpc64/bpf: Add support for instruction array
 and indirect jump
Content-Language: en-GB
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
To: adubey@linux.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org, bpf@vger.kernel.org, hbathini@linux.ibm.com,
        ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
        maddy@linux.ibm.com
References: <20260227014315.39980-1-adubey@linux.ibm.com>
 <72C902E6-BE4E-4C47-9F4A-D8095E7BEDE2@linux.ibm.com>
In-Reply-To: <72C902E6-BE4E-4C47-9F4A-D8095E7BEDE2@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=M9BA6iws c=1 sm=1 tr=0 ts=69a66dd2 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=zdu5mjj0_Ug8kxfXQYwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: ezhZlunt8Sw3LniPf81er-MOWZqVTsSP
X-Proofpoint-GUID: ezhZlunt8Sw3LniPf81er-MOWZqVTsSP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDAzMyBTYWx0ZWRfXxDmKrDNQMlLP
 6+lT9Gn6SxeMum4c5etX3ZVAQaMWpOgAilPyXHIsVgTp07F0QLhr74rGq2g7CyeFxM80UlXcmr7
 rABiuA7JoRh/m/EAO/HOliaOEHxwERJ/y55xqLGA6cIbQdyYIXkT0xfHMuI6lvWVsgQK2zUni3F
 TP0vkX3YcLxNaouLK3d2pZukEf3r47fa/uihbSVjq7yp+Q1vZio9j68HQhQZE/GQZWiJh3fBV21
 hm+Za779gKuaVoHBobXjJtinGUwLESTP0997BCMrkk1ivS9XUy/IpSecjCC2twG15osUox4rBi0
 p1QHcfnNdSAZHaQK118ypkDsP2v/qmhh+U1hkrLiIOjErSXotprNtbVNjYILzxxtK7f5+SNVEy4
 XpwrwTsc+NEqeQKTTpAkAJjCvVEofVTdlnuESreHeK9uMeduwHAoKC4DJGH71EfVWpc/p6m3HKl
 g1STPt5TUpghHvapVaA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030033
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 8F6311E9239
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DKIM_TRACE(0.00)[ibm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[venkat88@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:adubey@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:bpf@vger.kernel.org,m:hbathini@linux.ibm.com,m:ast@kernel.org,m:daniel@iogearbox.net,m:andrii@kernel.org,m:maddy@linux.ibm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17556-lists,linuxppc-dev=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[venkat88@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action


On 27/02/26 8:58 pm, Venkat wrote:
>
>> On 27 Feb 2026, at 7:13 AM, adubey@linux.ibm.com wrote:
>>
>> From: Abhishek Dubey <adubey@linux.ibm.com>
>>
>> The first 2 patch enable support for instruction array. Now, the
>> instruction offset map maintain the mapping:
>> original inst -> xlated inst -> jited inst
>>
>> The last two patch enable support for indirect jump. Any eligile
>> register can store jump target address for control flow to jump.
>>
>> The features will be enabled on ppc32 in a separate series.
>>
>> The patch series is rebased over:
>> https://lore.kernel.org/bpf/20260226031324.17352-1-adubey@linux.ibm.com
>>
>> All selftest related to instruction array and indirect jump
>> are passing.
>>
>> ./test_progs-cpuv4 -n 20
>> #21/1Â Â Â  bpf_insn_array/one2one:OK
>> #21/2Â Â Â  bpf_insn_array/simple:OK
>> #21/3Â Â Â  bpf_insn_array/deletions:OK
>> #21/4Â Â Â  bpf_insn_array/deletions-with-functions:OK
>> #21/5Â Â Â  bpf_insn_array/blindness:OK
>> #21/6Â Â Â  bpf_insn_array/incorrect-index:OK
>> #21/7Â Â Â  bpf_insn_array/load-unfrozen-map:OK
>> #21/8Â Â Â  bpf_insn_array/no-map-reuse:OK
>> #21/9Â Â Â  bpf_insn_array/bpf-side-ops:OK
>> #21Â Â Â Â Â  bpf_insn_array:OK
>> Summary: 1/9 PASSED, 0 SKIPPED, 0 FAILED
>>
>> ./test_progs-cpuv4 -n 21
>> #20/1Â Â Â  bpf_gotox/one-switch:OK
>> #20/2Â Â Â  bpf_gotox/one-switch-non-zero-sec-offset:OK
>> #20/3Â Â Â  bpf_gotox/two-switches:OK
>> #20/4Â Â Â  bpf_gotox/big-jump-table:OK
>> #20/5Â Â Â  bpf_gotox/static-global:OK
>> #20/6Â Â Â  bpf_gotox/nonstatic-global:OK
>> #20/7Â Â Â  bpf_gotox/other-sec:OK
>> #20/8Â Â Â  bpf_gotox/static-global-other-sec:OK
>> #20/9Â Â Â  bpf_gotox/nonstatic-global-other-sec:OK
>> #20/10Â Â  bpf_gotox/one-jump-two-maps:OK
>> #20/11Â Â  bpf_gotox/one-map-two-jumps:OK
>> #20Â Â Â Â Â  bpf_gotox:OK
>> Summary: 1/11 PASSED, 0 SKIPPED, 0 FAILED
>>
>> v1->v2:
>> Handle image offset for ABIv1
>>
>> [v1]: https://lore.kernel.org/bpf/20260225010950.20218-1-adubey@linux.ibm.com
>>
>> Abhishek Dubey (4):
>> powerpc64/bpf: Add support for instruction array
>> selftest/bpf: Enable instruction array test for powerpc64
>> powerpc64/bpf: Add support for indirect jump
>> selftest/bpf: Enable gotox tests for powerpc64
>>
>> arch/powerpc/net/bpf_jit_comp.c                        | 10 ++++++++++
>> arch/powerpc/net/bpf_jit_comp64.c                      |  8 ++++++++
>> .../testing/selftests/bpf/prog_tests/bpf_insn_array.c  |  2 +-
>> tools/testing/selftests/bpf/progs/verifier_gotox.c     |  4 ++--
>> 4 files changed, 21 insertions(+), 3 deletions(-)
>>
>> -- 
>> 2.52.0


Please ignore my last results. Refer the below.


# ./test_progs-cpuv4 -n 21
#21/1    bpf_insn_array/one2one:OK
#21/2    bpf_insn_array/simple:OK
#21/3    bpf_insn_array/deletions:OK
#21/4    bpf_insn_array/deletions-with-functions:OK
#21/5    bpf_insn_array/blindness:OK
#21/6    bpf_insn_array/incorrect-index:OK
#21/7    bpf_insn_array/load-unfrozen-map:OK
#21/8    bpf_insn_array/no-map-reuse:OK
#21/9    bpf_insn_array/bpf-side-ops:OK
#21      bpf_insn_array:OK
Summary: 1/9 PASSED, 0 SKIPPED, 0 FAILED


# ./test_progs-cpuv4 -n 20
#20/1    bpf_gotox/one-switch:OK
#20/2    bpf_gotox/one-switch-non-zero-sec-offset:OK
#20/3    bpf_gotox/two-switches:OK
#20/4    bpf_gotox/big-jump-table:OK
#20/5    bpf_gotox/static-global:OK
#20/6    bpf_gotox/nonstatic-global:OK
#20/7    bpf_gotox/other-sec:OK
#20/8    bpf_gotox/static-global-other-sec:OK
#20/9    bpf_gotox/nonstatic-global-other-sec:OK
#20/10   bpf_gotox/one-jump-two-maps:OK
#20/11   bpf_gotox/one-map-two-jumps:OK
#20/12   bpf_gotox/check-ldimm64-off:OK
#20/13   bpf_gotox/check-ldimm64-off-gotox:OK
#20      bpf_gotox:OK
Summary: 1/13 PASSED, 0 SKIPPED, 0 FAILED


Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>


Regards,

Venkat.


> Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
>
> Tested this series and below are the results.
>
> ./test_progs-cpuv4 -n 21
> #21/1    bpf_insn_array/one2one:OK
> #21/2    bpf_insn_array/simple:OK
> #21/3    bpf_insn_array/deletions:OK
> #21/4    bpf_insn_array/deletions-with-functions:OK
> #21/5    bpf_insn_array/blindness:OK
> #21/6    bpf_insn_array/incorrect-index:OK
> #21/7    bpf_insn_array/load-unfrozen-map:OK
> #21/8    bpf_insn_array/no-map-reuse:OK
> #21/9    bpf_insn_array/bpf-side-ops:OK
> #21      bpf_insn_array:OK
> Summary: 1/9 PASSED, 0 SKIPPED, 0 FAILED
>
>
> ./test_progs-cpuv4 -n 20
> #20/1    bpf_gotox/one-switch:SKIP
> #20/2    bpf_gotox/one-switch-non-zero-sec-offset:SKIP
> #20/3    bpf_gotox/two-switches:SKIP
> #20/4    bpf_gotox/big-jump-table:SKIP
> #20/5    bpf_gotox/static-global:SKIP
> #20/6    bpf_gotox/nonstatic-global:SKIP
> #20/7    bpf_gotox/other-sec:SKIP
> #20/8    bpf_gotox/static-global-other-sec:SKIP
> #20/9    bpf_gotox/nonstatic-global-other-sec:SKIP
> #20/10   bpf_gotox/one-jump-two-maps:SKIP
> #20/11   bpf_gotox/one-map-two-jumps:SKIP
> #20/12   bpf_gotox/check-ldimm64-off:SKIP
> #20/13   bpf_gotox/check-ldimm64-off-gotox:SKIP
> #20      bpf_gotox:SKIP
> Summary: 1/0 PASSED, 13 SKIPPED, 0 FAILED
>
> Regards,
> Venkat.
>
>

