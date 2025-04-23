Return-Path: <linuxppc-dev+bounces-7936-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE27A985C6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Apr 2025 11:38:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZjDZ40F9lz2yKr;
	Wed, 23 Apr 2025 19:38:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745401115;
	cv=none; b=i4jZ3J9/Lq5W+3emRQGadFp8r7YI6i81AP0+X/7MT2TT2GOGiPfLOr0s/rWl3mOwbnKnz7FMrKsXzq68pXPM+Ijy8/pdHjEw3g3ZtJB3CYNO8lnRpj8ct+tnTtI/b9qNYNKkRTHgOJxmaZxj0ILX+0nICgeOs7MWmG/Hpn3uWH33xBBWDxiyHuUF66PC/jf8IhDRMk5SCfUwr8LuMG/9ySx6q6jIlFXwFYLZGkIwFbiEoXUtt9ZPSpr3FyfuAVo5fIdinBhR+5/1UGOpytiyTuNztGVt/6E0GlQlgbSPGnHcGvxJ1EzDWZO0xNenzZcbFso1YXziTuW542IyT79T6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745401115; c=relaxed/relaxed;
	bh=RTxwEkTpzNJ32r28cWajfkk3PS39VSQR/ZaddpH/nmU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=BInBi3OtETbFBZ0jPamNPr6Sbqx6l+WtVgo2AZgmVIvwYV1JEKeIs8AGntCt9GjCDEcYmPZUlj3SbtLi4dykEFYSO5RnreG+e6nj0pS217rPl8OeTUTKrjC6CfdysTixbIyi4pFsLnnioZLv02jFjjiZCrGcYMqAAek29vG8BOC4SiI9smixLDATZqXS8bFZNU87k3D0/h3HcLl3wUz6Imuh9xu7Oz42PPOFkGiwh1AI/31iT/lbVEJfQ4YU1mlNfpQ9Sa2NP13l1nvH8fZI9aomkHz9RUxPXP6HH40Vm9ts5Q3OouOMhRcVYMntkSqjWu4kr4dR4FyLIngiuD+38g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TgIyFv++; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TgIyFv++;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZjDZ2736pz2yGY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Apr 2025 19:38:34 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N6fh6t019876
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Apr 2025 09:38:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=RTxwEk
	TpzNJ32r28cWajfkk3PS39VSQR/ZaddpH/nmU=; b=TgIyFv++9sp/pr/upeEDqQ
	CJwLCh7fNKitXkU/fpn8zqY8CT8jncE80hKgTUhwxbMYOkjH96lQxXPS2x8SQ/GD
	Y0ptLEnqjht7qIPGLLl21JzpFCR4m5UVa8WgRlNBU46R5NQu04avEQKnvLJkU6Ld
	HLG0AfBV/9HhUDc3BdlKvl/M4T7nDW8pNXSeRMAvnqOhQZt/Pn3d38jJRuXPUFLk
	08GJ78cVuvt3kJ+TgxLQZ7AkKSg3F6bhbLCoXLkMcSI1b3TyP+fR8VnHMHw0XkY6
	iE7m0AWoz7HCfyaKODDIRQsq9oboKtWBDPWchhy9YKBoOay7lehs9I1kGRxhzK2w
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 466jp3tj3u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Apr 2025 09:38:31 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53N6V4wA005844
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Apr 2025 09:38:30 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 466jfxad0d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Apr 2025 09:38:30 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53N9cUXs31523496
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Apr 2025 09:38:30 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ED4FE5805D
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Apr 2025 09:38:29 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 651CA58043
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Apr 2025 09:38:29 +0000 (GMT)
Received: from [9.204.204.179] (unknown [9.204.204.179])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Apr 2025 09:38:29 +0000 (GMT)
Message-ID: <73ad47ba-4c47-4698-9f15-eab16542a8c7@linux.ibm.com>
Date: Wed, 23 Apr 2025 15:08:28 +0530
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] powerpc/boot: Fix dash warning
Content-Language: en-GB
To: linuxppc-dev@lists.ozlabs.org
References: <20250423082154.30625-1-maddy@linux.ibm.com>
 <20250423185315.6732741f@canb.auug.org.au>
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <20250423185315.6732741f@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: LOZSOoxqgpclS9-CkGXLZHk5hSX6-lLj
X-Proofpoint-ORIG-GUID: LOZSOoxqgpclS9-CkGXLZHk5hSX6-lLj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA2NSBTYWx0ZWRfXw14lF+ORvp/a sHrdcAK/ltEKrNCfysvi+7Vn/+iNkCkK70uq3iSVywcymcqUporieTvIps0hh8R0+C2s9iWg37U 1NBXY/uIATo8OPB3NcVWDsaUwcNFG2nFwEtN/qZraizvBg/E5RTxBB+GSpc/1FByas8wOkefyGC
 Q7mB0GTrOQc0H+SUNF5d4+lYm3fCSD4QZvGxBXiXsMJJa6VeVCD3lr5ooYGqgPcw6siB2Gl5tdh 8DBXFXx3R9650nUzR7xn9s2/8vd2RAe49Zklc9FAxVd32ZrTryOY1Q2ZCuXSYvMVSSMkOLGqNeX 6BtX2fIJVH4Kp6Hmnvbz3kbjrQb6q6HG+EGbcpQds5wWrU9h3jrErC5/5C+JCkkx5S8HRV2ca6F
 DLL72EkgWoVR0EbJgGrY24LtvslGjTgnbjRfMGemG5D7kaf0Bb7e4OTGqXjc7CggzNwpaphR
X-Authority-Analysis: v=2.4 cv=N9wpF39B c=1 sm=1 tr=0 ts=6808b517 cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VnNF1IyMAAAA:8 a=rOUgymgbAAAA:8 a=1vJyUseoyQAnf17jsl4A:9
 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=QEXdDO2ut3YA:10 a=MP9ZtiD8KjrkvI0BhSjB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_06,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230065
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 23/04/25 2:23 pm, Stephen Rothwell wrote:
> Hi Madhavan,
>
> On Wed, 23 Apr 2025 13:51:54 +0530 Madhavan Srinivasan <maddy@linux.ibm.com> wrote:
>> Commit b2accfe7ca5b '("powerpc/boot: Check for ld-option support")' suppressed
>> linker warnings, but the expressed used did not go well with POSIX shell (dash)
>> resulting with this warning
>>
>> arch/powerpc/boot/wrapper: 237: [: 0: unexpected operator
>> ld: warning: arch/powerpc/boot/zImage.epapr has a LOAD segment with RWX permissions
>>
>> Fix the check to handle the reported warning. Patch also fixes
>> couple of shellcheck reported errors for the same line.
>>
>> In arch/powerpc/boot/wrapper line 237:
>> if [ $(${CROSS}ld -v --no-warn-rwx-segments &>/dev/null; echo $?) -eq 0 ]; then
>>       ^-- SC2046 (warning): Quote this to prevent word splitting.
>>         ^------^ SC2086 (info): Double quote to prevent globbing and word splitting.
>>                                              ^---------^ SC3020 (warning): In POSIX sh, &> is undefined.
>>
>> Fixes: b2accfe7ca5b '("powerpc/boot: Check for ld-option support")'
>> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
>> Suggested-by: Stephen Rothwell <sfr@canb.auug.org.au>
>> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
>> ---
>> Changelog v1:
>> - modified the check to use the command exit
>>    state instead explicit checking with exit code
>>    
>> Patch applies on top of powerpc/fixes
>>
>>   arch/powerpc/boot/wrapper | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/boot/wrapper b/arch/powerpc/boot/wrapper
>> index 267ca6d4d9b3..3d8dc822282a 100755
>> --- a/arch/powerpc/boot/wrapper
>> +++ b/arch/powerpc/boot/wrapper
>> @@ -234,7 +234,7 @@ fi
>>   
>>   # suppress some warnings in recent ld versions
>>   nowarn="-z noexecstack"
>> -if [ $(${CROSS}ld -v --no-warn-rwx-segments &>/dev/null; echo $?) -eq 0 ]; then
>> +if "${CROSS}ld" -v --no-warn-rwx-segments >/dev/null 2>&1; then
>>   	nowarn="$nowarn --no-warn-rwx-segments"
>>   fi
> Looks good to me.
>
> Reviewed-by: Stephen Rothwell <sfr@canb.auug.org.au>
>
Tested this patch by applying on base: 
b2accfe7ca5bc9f9af28e603b79bdd5ad8df5c0b and it fixes the issue. Hence,

Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>


Regards,

Venkat.


