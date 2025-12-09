Return-Path: <linuxppc-dev+bounces-14695-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A21E2CAED64
	for <lists+linuxppc-dev@lfdr.de>; Tue, 09 Dec 2025 05:01:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dQQC24xkJz2xbQ;
	Tue, 09 Dec 2025 15:01:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765252894;
	cv=none; b=i1IftT/pqwZECmB/4rDWDxnNxtgxsXjofQjMKd7wcvzwyy2exXPI04rr1AK5dAin+ht6dLpgabYXVg1brekJIsfSx9VYcYjVrQ5J3RHlOjDTqGpdEBemW7mLgaqnEI2Ii5ka6qHZnPlh+T6B6qjmMA2q5iSKyCwR2kEXVsS4qePQo5UjqT6KpMD1BcVB9OOD+jAzDuZ9O+XiYDjl/dFtnhfVoUvyHGpQq1QcUZ5fB57CpuLB+ZoZ11rqo+c3e3ByIbzx0xiArIPhaUzp68GzUgUkVOUJtKfAO+H+U6dH3HNbKycUkTk7iCwEUf5ieChEqXANobfOWH2kv8tUZevpuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765252894; c=relaxed/relaxed;
	bh=YiGpflFKn35RiIwqyIeCZ2xGXgEtsdgTtU4fLngLVT8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dJxxH2hDnJMdMpedkFKO4CFIfj5bR5vSFNdMhZSEtt5CLaisLGT5IPqACLIPJOmoK1//XfiXR1Q7Qzkj4kDWW8n+Qom1FgNSNdCBY9mtzIB9VFTfFh+jaNqb3y1mTFGa/Ua0QMGFro4kaFBiVpb1sDco3G9GFPOyvY1Us8tX79FwiYUKITUzJkP6542hJ0LV2CzwHYodEP+6cgypFrjWvGN/6+wMQhERvi5toIQDUi0tL0DIdvMPp+RiG0a18kCy89PZNHNIKUZSb4hKMY1hlaV5Dzv8DfD/GwGL5HuxJkuKiUoJXmcO4F/p3L8gblBc7jYTFnZdU5ZgbMqY71kMiQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fbAL3Bd0; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fbAL3Bd0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dQQC06BH0z2xC3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Dec 2025 15:01:31 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5B8K95n2031236;
	Tue, 9 Dec 2025 04:01:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=YiGpfl
	FKn35RiIwqyIeCZ2xGXgEtsdgTtU4fLngLVT8=; b=fbAL3Bd0MJaK10viZJCKc1
	KharEngfqZ56/rWx7vzXmncPgsU/RLcgeI+Oac1hFmWi94XTGMo6rdsAL6Upi54r
	9bx/Nhk67awAwDVkE1rpSnX2uvLqFjn5pLiQhQ0A6U0o/VsRY8L9MTkeSw9M9iFQ
	4ppYACDiowJJ4r1YpWya38O6qYubVpv6RwaGfpGbvU7KJUunTzD/fWC8CVzbALPy
	yKNoqmMf6wJ4vR4GjjN7zVPw9r6NSbQ/yIxtxfsgE79i0/vVsry1KJus5KMWaVDO
	9jQ0zBnUhdoMTl+3C9IGfoiSnhY6s7c8reIBfwcbLSM9Um8/6W7J8UCE0Ro5+kEg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4avc61awpt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Dec 2025 04:01:18 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5B940iHs015998;
	Tue, 9 Dec 2025 04:01:18 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4avc61awpq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Dec 2025 04:01:17 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5B8NY2Jo026813;
	Tue, 9 Dec 2025 04:01:17 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4aw1h10pdd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Dec 2025 04:01:17 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5B941Gdq20644448
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 9 Dec 2025 04:01:16 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 104AC58056;
	Tue,  9 Dec 2025 04:01:16 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2458458062;
	Tue,  9 Dec 2025 04:01:13 +0000 (GMT)
Received: from [9.109.209.83] (unknown [9.109.209.83])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  9 Dec 2025 04:01:12 +0000 (GMT)
Message-ID: <d3e78669-409f-4041-b194-864019bdd7fc@linux.ibm.com>
Date: Tue, 9 Dec 2025 09:31:11 +0530
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
Subject: Re: [PATCH RESEND] powerpc/tools: drop `-o pipefail` in gcc check
 scripts
To: Naveen N Rao <naveen@kernel.org>, Jan Stancek <jstancek@redhat.com>,
        Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org,
        joe.lawrence@redhat.com
References: <cc6cdd116c3ad9d990df21f13c6d8e8a83815bbd.1758641374.git.jstancek@redhat.com>
 <caut6db7r6loimb2bk4zoqkqmfd3mhvzmv6ntsltf3tr4k4c2n@fbyhls233oys>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <caut6db7r6loimb2bk4zoqkqmfd3mhvzmv6ntsltf3tr4k4c2n@fbyhls233oys>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDAyMCBTYWx0ZWRfX9cuERRgAmfU0
 zISGX4pqNDQ9F7ySILBTB8QgpecL6XYEfB3ZWYLTBfQXUgcJM9By8xWXQmJje1j6/sEsbBGsP3i
 PFNMPvRsEZeEDQO4ETqvUgel7J/C3Yhj1Q6OnM1Aggu8djnhC090tcBS3ucRYluToRzLoOqGAdU
 IAcZTtnUWU1BIwGmyAb05NoQ7q2is+/gvLC+BPTplKYwC3rubwn3q8G9htHj6VLWldBuyjXzAmY
 nBVI6VVwms2/C7ketxTad8xxMKbnSnSDo0uPOE2N/sME5PFF6bmxzx3yPQByBRbwhhDUvNF+WMx
 Lh4t+mz8quJkdma4CYkWznbNelrm995EoL3tQL87+ijvGAatbLEIy7QCSI17PnLjPqQWkGAaiBx
 v595zuOtvN6zfMTwiWG52mZ+Zs/Tlg==
X-Proofpoint-GUID: Rnnv41Y2FQgSpEk93nUjnHUatOXp-nn-
X-Proofpoint-ORIG-GUID: 2QvLqTOLhgEq01cQl9ORv01mHttqBl8n
X-Authority-Analysis: v=2.4 cv=O/U0fR9W c=1 sm=1 tr=0 ts=69379f0e cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=20KFwNOVAAAA:8 a=VwQbUJbxAAAA:8 a=T1pRgM3dOS14jIq25YUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-08_07,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1011 phishscore=0
 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2512060020
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 12/3/25 9:29 AM, Naveen N Rao wrote:
> On Tue, Sep 23, 2025 at 05:32:16PM +0200, Jan Stancek wrote:
>> We've been observing rare non-deterministic kconfig failures during
>> olddefconfig, where ARCH_USING_PATCHABLE_FUNCTION_ENTRY was getting
>> disabled and with it number of other config options that depend on it.
>>
>> The reason is that gcc-check-fpatchable-function-entry.sh can fail
>> if `grep -q` (or scripts/dummy-tools/gcc) is fast enough to exit while
>> there is still someone writing on other side of pipe. `pipefail`
>> propagates that error up to kconfig.
>>
>> This can be seen for example with:
>>    # (set -e; set -o pipefail; yes | grep -q y); echo $?
>>    141
>>
>> or by running the actual check script in loop extensively:
>>    ----------------------------- 8< -------------------------------
>>    function kconfig()
>>    {
>>      for i in `seq 1 100`; do
>>        arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh \
>>          ./scripts/dummy-tools/gcc -mlittle-endian \
>>          || { echo "Oops"; exit 1; }
>>      done
>>    }
>>
>>    for ((i=0; i<$(nproc); i++)); do kconfig & done
>>    wait; echo "Done"
>>    ----------------------------- >8 -------------------------------
>>
>> Fixes: 0f71dcfb4aef ("powerpc/ftrace: Add support for -fpatchable-function-entry")
>> Fixes: b71c9ffb1405 ("powerpc: Add arch/powerpc/tools directory")
> The latter fixes tag should probably tag one of the below commits which
> actually introduced pipefail, or introduced it in Kconfig:
> Fixes: 8c50b72a3b4f ("powerpc/ftrace: Add Kconfig & Make glue for mprofile-kernel")
>    or:
> Fixes: abba759796f9 ("powerpc/kbuild: move -mprofile-kernel check to Kconfig")
>
>> Reported-by: Joe Lawrence <joe.lawrence@redhat.com>
>> Acked-by: Joe Lawrence <joe.lawrence@redhat.com>
>> Signed-off-by: Jan Stancek <jstancek@redhat.com>
>> ---
>>   arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh | 1 -
>>   arch/powerpc/tools/gcc-check-mprofile-kernel.sh           | 1 -
>>   2 files changed, 2 deletions(-)
> Other than that, thanks for fixing this. This LGTM.
> Reviewed-by: Naveen N Rao (AMD) <naveen@kernel.org>
>
> Maddy/Michael,
> Can you please pick this up?
Thanks naveen. Will put it in one of the -rc

Maddy
>
>
> Thanks,
> Naveen
>

