Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9F26EDC18
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Apr 2023 09:04:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5Cfl1vphz3fRV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Apr 2023 17:04:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Y1RzoNpM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Y1RzoNpM;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5CY54dycz3cdX
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Apr 2023 16:59:37 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33P6usU2020821;
	Tue, 25 Apr 2023 06:59:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=8VtRj7JDA9bS/6WiNWdJd/bKBaAeS9yOmloWr2XNVxY=;
 b=Y1RzoNpMghSNJAB8gNyZRM/cck4GBEHu7pwrM8Bvxl9VAz2JLTRQRNvtZ550OHatbiiK
 RTLjPKzUuMJvyH7zfiFYgk2aeHfruEFOSLZKT6Ji4W34n60aPOOUxb8sIGCMA1LmqxG8
 vDN7s4yQRMOVHByPTxXXNnrfmfmzBJUsZgvZm12NDMALkgkStf0X+1M0p+Vddq6/ttLt
 wfpErn+pl0W8bkci2YZxQmsy5JuR61VyEk1uKf1IOAAGy7RrM0FZZBcwl/I+UibD8o5H
 GPB2Z/vuvA2Iak3ekTbxjFzgQ8iliX2MWlEZ10o9GdN/lxZOprUQxuPPooIP6fMcn7q+ MA== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q67wkm9yc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Apr 2023 06:59:18 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33P486js023094;
	Tue, 25 Apr 2023 06:59:16 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3q47771jg5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Apr 2023 06:59:16 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 33P6xERg63308246
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Apr 2023 06:59:14 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4F61220043;
	Tue, 25 Apr 2023 06:59:14 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1029A20040;
	Tue, 25 Apr 2023 06:59:12 +0000 (GMT)
Received: from [9.43.101.201] (unknown [9.43.101.201])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 25 Apr 2023 06:59:11 +0000 (GMT)
Message-ID: <7bb0dfb2-6dd7-0e2a-be75-76117b222d85@linux.ibm.com>
Date: Tue, 25 Apr 2023 12:29:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] powerpc/bpf: populate extable entries only during the
 last pass
Content-Language: en-US
To: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
        "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
References: <20230406073519.75059-1-hbathini@linux.ibm.com>
 <857125b9-90b3-fba1-beed-6ffda703f873@csgroup.eu>
 <0d136b2a-2db8-f2b1-418e-f245e95c921f@linux.ibm.com>
 <1682336435.n6cw11rdyx.naveen@linux.ibm.com>
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <1682336435.n6cw11rdyx.naveen@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: tXz5pUt-bVViyDYvafyPhTvHD7SZb8zb
X-Proofpoint-GUID: tXz5pUt-bVViyDYvafyPhTvHD7SZb8zb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-25_03,2023-04-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304250060
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
Cc: Song Liu <songliubraving@fb.com>, Andrii Nakryiko <andrii@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Naveen,

On 24/04/23 5:25 pm, Naveen N. Rao wrote:
> Hari Bathini wrote:
>> Hello Christophe,
>>
>> Thanks for the review.
>>
>> On 07/04/23 11:31 am, Christophe Leroy wrote:
>>>
>>>
>>> Le 06/04/2023 à 09:35, Hari Bathini a écrit :
>>>> Since commit 85e031154c7c ("powerpc/bpf: Perform complete extra passes
>>>> to update addresses"), two additional passes are performed to avoid
>>>> space and CPU time wastage on powerpc. But these extra passes led to
>>>> WARN_ON_ONCE() hits in bpf_add_extable_entry(). Fix it by not adding
>>>> extable entries during the extra pass.
>>>
>>> Are you sure this change is correct ?
>>
>> Actually, I was in two minds about that owing to commit 04c04205bc35
>> ("bpf powerpc: Remove extra_pass from bpf_jit_build_body()").
> 
> Right, but Christophe's series adding complete passes during the 
> extra_pass phase added 'extra_pass' parameter back to bpf_jit_build_body().
> 
>>
>>> During the extra pass the code can get shrinked or expanded (within the
>>> limits of the size of the preliminary pass). Shouldn't extable entries
>>> be populated during the last pass ?
>>
>> Unlikely, but the intention there was to eliminate a regression in case
>> extra_pass ends up being 'false' always in any subsequent change.
> 
> But, the current approach risks generating incorrect offsets in the 
> extable. The main motivation for the extra pass is to generate more 
> compact code, so there is a good chance that offsets are going to change 
> (especially with bpf subprogs).
> 
>>
>> - Hari
>>
>>>>
>>>> Fixes: 85e031154c7c ("powerpc/bpf: Perform complete extra passes to 
>>>> update addresses")
>>>> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
>>>> ---
>>>>    arch/powerpc/net/bpf_jit_comp32.c | 2 +-
>>>>    arch/powerpc/net/bpf_jit_comp64.c | 2 +-
>>>>    2 files changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/arch/powerpc/net/bpf_jit_comp32.c 
>>>> b/arch/powerpc/net/bpf_jit_comp32.c
>>>> index 7f91ea064c08..e788b1fbeee6 100644
>>>> --- a/arch/powerpc/net/bpf_jit_comp32.c
>>>> +++ b/arch/powerpc/net/bpf_jit_comp32.c
>>>> @@ -977,7 +977,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 
>>>> *image, struct codegen_context *
>>>>                if (size != BPF_DW && !fp->aux->verifier_zext)
>>>>                    EMIT(PPC_RAW_LI(dst_reg_h, 0));
>>>> -            if (BPF_MODE(code) == BPF_PROBE_MEM) {
>>>> +            if (BPF_MODE(code) == BPF_PROBE_MEM && !extra_pass) {
> 
> It is probably better to pass 'extra_pass' into bpf_add_extable_entry() 
> to keep all those checks together.
> 

Thanks for the review and also the suggestion (offline) to reset index
during extra pass, for my concern about possible regression. Posted v2.

- Hari
