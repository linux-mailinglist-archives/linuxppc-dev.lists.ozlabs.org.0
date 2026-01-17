Return-Path: <linuxppc-dev+bounces-15935-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5DBD38DB6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jan 2026 11:24:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dtXrG5fVTz309P;
	Sat, 17 Jan 2026 21:23:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768645438;
	cv=none; b=iQUuk+Txa2+w7JU/Hcd7XLKAadhkyCfSMMjnEydZfZT0pY3kPssgrHp8LlB/SqFfqhWHPCVQ245M0XN2amvNUxnrEAOg0etDIwmdZCfoyAbI8ucpCqzkn2XoX67Ouu6Lw/sHLeLt+eorpACA31evrvPGLGZqWne/2DQM8mPORM0qs4Dfp3J26kdzlplaxboivB/eRoIuxApkXRkTeENi+Wr6KzR5u/gwZG6OtSb8awBH0n4J9KljWIey4mL6ZNFJD8ZbPb+rW9iKobVhwqfYmP2yAlJhmyk5km9VA5P1JT3BvA9dDsjea/xAT8qQXcDjF/EJnFrT7Xb1PGUWMSHpnw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768645438; c=relaxed/relaxed;
	bh=CUSquBlRCbu+cnGUxuLnQwBFojySlmEz7lFaSiF3+sI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SW7UhkQkr0cqK4K3wFdt655zKkDzIHdkk+wLw1WmgSJlgKcpBBdBmcOp9zcbYUG2P3TS2CuETpXlpIrdKEBPSoQatLCdDAl+5b3TrpPC71yrWGA8aNW6M9h0KHPda4qY+5GpnjCjjMTz97Gv+3FvK/idCjw2CYWGJ03eOfuVbL0B4BQWV66dKLdwJhcor9sjj0LX1rkC8VZ1hRb3LagP6y8DEuYHrCdOJ7+ZU82eqv7kOT/tG0oanqDNrjzEe5qq/3t6fcjpYZW6IqCdBM7hKoa8vWEGdCYK1RZSvPvfAOYhNmTHVhZZC/HJye7kB6+m2XA09uopRmF4wyGGGFGl+g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XWY6bvHw; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XWY6bvHw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dtXrF6hk7z2xS2
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jan 2026 21:23:57 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60H9kX4h024330;
	Sat, 17 Jan 2026 10:23:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=CUSquB
	lRCbu+cnGUxuLnQwBFojySlmEz7lFaSiF3+sI=; b=XWY6bvHwR8gqHfVatgB4gh
	yGUu8CgRrY3cjjrXTBZZgrnAVUdwYAROXIBUfDC8iXAUOsh/QzaZ2obrnO3bhDD6
	euRKJxhA79uREXIaFTjY31QZgloyR67LouG3aP4fGRVR5rN8NZlHwQXZJGXAupW3
	AVAA9sD5cUqRkxoFEfBmW/lW6qMbfQvc408gq0M2LH9l7BEEuXkBBwe6wH/etFlj
	VVxb/h+WicdlT9aXqme+2L2sFkPueEJ+BAHfDLsyNydnT6eBp8FL6whfaVl5uMuC
	MA6YS3FBq/2h+aPCpYFIrEHJKLvo1OSfzNt0P7c0QOvMjr+eYwt9bRuwaY8g5OVg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4br23rgxnp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 17 Jan 2026 10:23:23 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60HANNhH020392;
	Sat, 17 Jan 2026 10:23:23 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4br23rgxnj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 17 Jan 2026 10:23:22 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60H5b6ps027820;
	Sat, 17 Jan 2026 10:23:21 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4bqv8wtk1j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 17 Jan 2026 10:23:21 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60HANHSh43975068
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 17 Jan 2026 10:23:17 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7DA1020043;
	Sat, 17 Jan 2026 10:23:17 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 89B1520040;
	Sat, 17 Jan 2026 10:23:11 +0000 (GMT)
Received: from [9.43.67.105] (unknown [9.43.67.105])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 17 Jan 2026 10:23:11 +0000 (GMT)
Message-ID: <4728530f-41c8-4a26-aa8a-30f53f1fe629@linux.ibm.com>
Date: Sat, 17 Jan 2026 15:53:10 +0530
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
Subject: Re: [PATCH v2 2/6] powerpc64/bpf: Support tailcalls with subprogs
To: adubey@linux.ibm.com, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: sachinpb@linux.ibm.com, venkat88@linux.ibm.com, andrii@kernel.org,
        eddyz87@gmail.com, mykolal@fb.com, ast@kernel.org,
        daniel@iogearbox.net, martin.lau@linux.dev, song@kernel.org,
        yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
        sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org,
        christophe.leroy@csgroup.eu, naveen@kernel.org, maddy@linux.ibm.com,
        mpe@ellerman.id.au, npiggin@gmail.com, memxor@gmail.com,
        iii@linux.ibm.com, shuah@kernel.org
References: <20260114114450.30405-1-adubey@linux.ibm.com>
 <20260114114450.30405-3-adubey@linux.ibm.com>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <20260114114450.30405-3-adubey@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ng6asMzW3uKJzarXjSutdbXzQzx0rxcL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE3MDA4NCBTYWx0ZWRfX8TmSMslTMghW
 Tk0jZXS1PaHbIBAXpZNs+FUzVQvGkIq2ZLVfsagAirL7PGd4fvTSuHkLausxtSVqNO1WZUEZ+v+
 gAIgRqIL6Tj7A/aJaZ4uiyNFG5YLKtGtDvsVpGGK9hPLXsVNvFe/MKIVcs87g3ICoITRlWXU1f1
 GvFN3pdDy0J41TOIE7qxbjslEA8twIDp99ELaW81MIQMjuhLOBj3gmcCb+r30jdVFCszAdhX7dP
 M27rxtxwnv9H75wpZzDxxpZRmnVTtDBx0tNLCOAmvb3AzEEBcORE+Nzcmhn28IRIuS0yB+aKFeG
 k16Qt5YBS4bwCp1VMLQX7oq9iOSYICH/uZoBcE/Mdi0bWtnBJEhST91vbBBf+mG9Hrb5Ra9DCRv
 HXWf7TJoihTbYzD1lVYQ0NkfMqvSTn6jDJhUeXYQm0dw24MNPyfxoQ4ht0VwXrEh1rrZfd9slM2
 TVweamg7XPo94YbcqKA==
X-Authority-Analysis: v=2.4 cv=J9SnLQnS c=1 sm=1 tr=0 ts=696b631b cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=ZXRHoZGWT0CIhGHxh5MA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: Ffd4gLHO7pbALdnPDjaTPn6owAgbrQ2o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_09,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2601150000 definitions=main-2601170084
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 14/01/26 5:14 pm, adubey@linux.ibm.com wrote:
> From: Abhishek Dubey<adubey@linux.ibm.com>
> 
> Enabling tailcalls with subprog combinations by referencing
> method. The actual tailcall count is always maintained in the
> tail_call_info variable present in the frame of main function
> (also called entry function). The tail_call_info variables in
> the frames of all other subprog contains reference to the
> tail_call_info present in frame of main function.

I would rephrase:

"The tail_call_info variables in the frames of all other subprog
contains reference to the tail_call_info present in frame of
main function."

to:

"The tail_call_info field in the stack frame of subprogs contains
reference to the tail_call_info field in the stack frame of main
BPF program."

- Hari

