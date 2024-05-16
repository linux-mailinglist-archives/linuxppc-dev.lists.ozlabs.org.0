Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 049A98C755A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2024 13:39:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mXh1tGMi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vg7RK3yL5z3fmg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2024 21:39:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mXh1tGMi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=dtsen@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vg7QZ1jqsz3cXL
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2024 21:38:45 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44GApt4M025339;
	Thu, 16 May 2024 11:38:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=5bRqxCdtmzjaCx8M5vJhcH031+uvoifMt9dAk8qBbUo=;
 b=mXh1tGMi5ccz6MZb/tYx0Jij+0wATn10hXfo5D5bQWBtRms4r45NWHhFo/4kZN5OzNDh
 3E6S3SzfT9Mi+wG5csm7nEJKQP/bAgL6oDp02dN83qVflMdRtOttptuR1icegGKxVmCm
 x7xp3pdY5fCACSz3JfI0oaoStlv9q2DXOa+2kClkr2V0Ufg6gbKDnbC4fx65859idzq0
 NrBqueTBU3AI6QhCJw7vKp/FZj3TcMVhPEtbdsKThNhVNORCJVxYMUBYzRZgMAiFbvmt
 NdKr3fo0/ppZ/Y8gfnwGkGdlOaKkdPaoecEyEAaU/st0QRoPY7I8GL7DSQCiCcT6Y5GW lg== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y5gjbg45m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 11:38:30 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44GASP97020349;
	Thu, 16 May 2024 11:38:29 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3y2kd09u8v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 11:38:29 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44GBcQrC9110100
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 May 2024 11:38:28 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6B7B75805E;
	Thu, 16 May 2024 11:38:26 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5511058051;
	Thu, 16 May 2024 11:38:25 +0000 (GMT)
Received: from [9.67.138.125] (unknown [9.67.138.125])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 16 May 2024 11:38:25 +0000 (GMT)
Message-ID: <db79ddf3-cf4d-4b05-b787-3e92e1236e81@linux.ibm.com>
Date: Thu, 16 May 2024 06:38:24 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] crypto: X25519 low-level primitives for ppc64le.
To: Michael Ellerman <mpe@ellerman.id.au>, linux-crypto@vger.kernel.org
References: <20240514173835.4814-1-dtsen@linux.ibm.com>
 <20240514173835.4814-2-dtsen@linux.ibm.com> <87a5kqwe59.fsf@mail.lhotse>
Content-Language: en-US
From: Danny Tsen <dtsen@linux.ibm.com>
In-Reply-To: <87a5kqwe59.fsf@mail.lhotse>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: RTapjZgpmvATb9mGScqoR56rvIfAqjqj
X-Proofpoint-ORIG-GUID: RTapjZgpmvATb9mGScqoR56rvIfAqjqj
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_05,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 adultscore=0 mlxlogscore=999 lowpriorityscore=0
 suspectscore=0 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405160082
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
Cc: herbert@gondor.apana.org.au, dtsen@us.ibm.com, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, appro@cryptogams.org, ltcgcw@linux.vnet.ibm.com, leitao@debian.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 5/15/24 11:53 PM, Michael Ellerman wrote:
> Hi Danny,
>
> Danny Tsen <dtsen@linux.ibm.com> writes:
>> Use the perl output of x25519-ppc64.pl from CRYPTOGAMs and added three
>> supporting functions, x25519_fe51_sqr_times, x25519_fe51_frombytes
>> and x25519_fe51_tobytes.
> For other algorithms we have checked-in the perl script and generated
> the code at runtime. Is there a reason you've done it differently this time?

Hi Michael,

It's easier for me to read and use just assembly not mixed with perl and 
it's easier for me to debug and testing also I copied some code and made 
some modification.

>> Signed-off-by: Danny Tsen <dtsen@linux.ibm.com>
>> ---
>>   arch/powerpc/crypto/curve25519-ppc64le_asm.S | 648 +++++++++++++++++++
>>   1 file changed, 648 insertions(+)
>>   create mode 100644 arch/powerpc/crypto/curve25519-ppc64le_asm.S
>>
>> diff --git a/arch/powerpc/crypto/curve25519-ppc64le_asm.S b/arch/powerpc/crypto/curve25519-ppc64le_asm.S
>> new file mode 100644
>> index 000000000000..8a018104838a
>> --- /dev/null
>> +++ b/arch/powerpc/crypto/curve25519-ppc64le_asm.S
>> @@ -0,0 +1,648 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +#
>> +# Copyright 2024- IBM Corp.  All Rights Reserved.
>   
> I'm not a lawyer, but AFAIK "All Rights Reserved" is not required and
> can be confusing - because we are not reserving all rights, we are
> granting some rights under the GPL.
>
> I also think the IBM copyright should be down below where your
> modifications are described.
Will change that.
>> +# This code is taken from CRYPTOGAMs[1] and is included here using the option
>> +# in the license to distribute the code under the GPL. Therefore this program
>> +# is free software; you can redistribute it and/or modify it under the terms of
>> +# the GNU General Public License version 2 as published by the Free Software
>> +# Foundation.
>> +#
>> +# [1] https://www.openssl.org/~appro/cryptogams/
>> +
>> +# Copyright (c) 2006-2017, CRYPTOGAMS by <appro@openssl.org>
>> +# All rights reserved.
>> +#
>> +# Redistribution and use in source and binary forms, with or without
>> +# modification, are permitted provided that the following conditions
>> +# are met:
>> +#
>> +#       * Redistributions of source code must retain copyright notices,
>> +#         this list of conditions and the following disclaimer.
>> +#
>> +#       * Redistributions in binary form must reproduce the above
>> +#         copyright notice, this list of conditions and the following
>> +#         disclaimer in the documentation and/or other materials
>> +#         provided with the distribution.
>> +#
>> +#       * Neither the name of the CRYPTOGAMS nor the names of its
>> +#         copyright holder and contributors may be used to endorse or
>> +#         promote products derived from this software without specific
>> +#         prior written permission.
>> +#
>> +# ALTERNATIVELY, provided that this notice is retained in full, this
>> +# product may be distributed under the terms of the GNU General Public
>> +# License (GPL), in which case the provisions of the GPL apply INSTEAD OF
>> +# those given above.
>> +#
>> +# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDER AND CONTRIBUTORS
>> +# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
>> +# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
>> +# A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
>> +# OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
>> +# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
>> +# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
>> +# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
>> +# THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
>> +# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
>> +# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
>> +
>> +# ====================================================================
>> +# Written by Andy Polyakov <appro@openssl.org> for the OpenSSL
>> +# project. The module is, however, dual licensed under OpenSSL and
>> +# CRYPTOGAMS licenses depending on where you obtain it. For further
>> +# details see https://www.openssl.org/~appro/cryptogams/.
>> +# ====================================================================
>> +
>> +#
>> +# ====================================================================
>> +# Written and Modified by Danny Tsen <dtsen@us.ibm.com>
>> +# - Added x25519_fe51_sqr_times, x25519_fe51_frombytes, x25519_fe51_tobytes
> ie. here.
>
>> +# X25519 lower-level primitives for PPC64.
>> +#
>> +
>> +#include <linux/linkage.h>
>> +
>> +.machine "any"
>   
> Please don't add new .machine directives unless they are required.
>
>> +.abiversion	2
> I'd prefer that was left to the compiler flags.

Ok.

Thanks.

-Danny

>
> cheers
>
