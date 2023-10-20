Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC447D11A4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Oct 2023 16:34:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hqFY4lL4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SBnCP2Dfnz3vXq
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Oct 2023 01:34:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hqFY4lL4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SBnBV5Z33z3cVy
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Oct 2023 01:33:22 +1100 (AEDT)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39KEQfGR023891;
	Fri, 20 Oct 2023 14:33:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=tzac3AS0oG8TDUzllI2/wCYY+QbYk9wa+uGXRR0SFvg=;
 b=hqFY4lL4igdzMQ2SVO5FBNfR/w+oAg9tp6AKKbde04BPndnCt0jA7YpDq9QFiT+RNLve
 HcTbIDTsWlJR+fCoefrB6Rgnmvw3h2sd0KYcMfLHqa5qX5IJUgn7bIQM3dmuIuf2n3gz
 Xi4nm9Gj+j7+YH7VPjsUcqm/Gte0OWeTOyF4ABfFO5rYQr6dQqEDD6SIgUI/xRMWmIfw
 fueNN1ECfzssQQJvS5yIxKcxOve2q/0/9T8Ibce9IEJenmQm0Oa6px3e35mcaxcwLwtx
 zbEPQOEoXJ67qd+yfg3TVTMeIEOB2QD1rz1f0UVvgEKfKJr3JTl1bz7thDivQRXi50CL UQ== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tuu68rjhb-12
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Oct 2023 14:32:59 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39KC5J5m002779;
	Fri, 20 Oct 2023 14:15:30 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tuc44d1gv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Oct 2023 14:15:30 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39KEFSd521496458
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Oct 2023 14:15:28 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4CEA72004F;
	Fri, 20 Oct 2023 14:15:28 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EBB392004B;
	Fri, 20 Oct 2023 14:15:25 +0000 (GMT)
Received: from [9.43.18.181] (unknown [9.43.18.181])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 20 Oct 2023 14:15:25 +0000 (GMT)
Message-ID: <6588d1ed-4df0-5344-9c4a-0dfc10e160d1@linux.ibm.com>
Date: Fri, 20 Oct 2023 19:45:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 5/5] powerpc/bpf: use
 bpf_jit_binary_pack_[alloc|finalize|free]
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bpf@vger.kernel.org
References: <20231012200310.235137-1-hbathini@linux.ibm.com>
 <20231012200310.235137-6-hbathini@linux.ibm.com> <87jzrj5efp.fsf@mail.lhotse>
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <87jzrj5efp.fsf@mail.lhotse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: p60soyVVQlsJEkpkQcdBrFP2yX8M4YwP
X-Proofpoint-GUID: p60soyVVQlsJEkpkQcdBrFP2yX8M4YwP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-20_10,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxlogscore=855 clxscore=1015 lowpriorityscore=0
 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310170001 definitions=main-2310200119
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
Cc: Song Liu <songliubraving@fb.com>, Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, Song Liu <song@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 19/10/23 11:41 am, Michael Ellerman wrote:
> Hari Bathini <hbathini@linux.ibm.com> writes:
>> Use bpf_jit_binary_pack_alloc in powerpc jit. The jit engine first
>> writes the program to the rw buffer. When the jit is done, the program
>> is copied to the final location with bpf_jit_binary_pack_finalize.
>> With multiple jit_subprogs, bpf_jit_free is called on some subprograms
>> that haven't got bpf_jit_binary_pack_finalize() yet. Implement custom
>> bpf_jit_free() like in commit 1d5f82d9dd47 ("bpf, x86: fix freeing of
>> not-finalized bpf_prog_pack") to call bpf_jit_binary_pack_finalize(),
>> if necessary. As bpf_flush_icache() is not needed anymore, remove it.
>>
>> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
>> Acked-by: Song Liu <song@kernel.org>
>> ---
>>   arch/powerpc/net/bpf_jit.h        |  18 ++---
>>   arch/powerpc/net/bpf_jit_comp.c   | 106 ++++++++++++++++++++++--------
>>   arch/powerpc/net/bpf_jit_comp32.c |  13 ++--
>>   arch/powerpc/net/bpf_jit_comp64.c |  10 +--
>>   4 files changed, 96 insertions(+), 51 deletions(-)
> 
> This causes a crash at boot on my Power7 box:

Thanks, Michael.
Posted v7.

- Hari
