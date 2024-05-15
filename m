Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BF58C66D5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2024 15:05:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WSAgRBnB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VfYNX0rj5z3cYH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2024 23:05:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WSAgRBnB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=dtsen@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VfYMp3QLlz30VP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2024 23:04:22 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44FCxiQd023495;
	Wed, 15 May 2024 13:04:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ukmz9/zkyZaW6AiPM2qsUMqAdqSkOsXVQ3brcJOi5FM=;
 b=WSAgRBnBW7Con8Hrsplh8PAjRRKOLM56i3bly0NvxypJP+d3x36uirEJ615A+uF7yTmU
 qQ29zG6kBx+ePL48kqJ3L8q5BVm04rx/rrY5CBvARObON4RAgl0cD6D9ant95S1/vYLU
 UX9fiWWkC/4+32/Y3uamcuN+TRUdYJ1RPAyShgN+hU8MM0Sul9edx+ez8gOEmwO0Jk9A
 UjKVEnW72Orx8cF3ulLlZU4B3X8IIcCQesjQMWFu01Fkw7B6nPQ2C6/t9HoaxBONa13p
 IsM9jOVnmhF2QVz3UkwweyfGpsafF5CpKw8EkqR1rfr6UjmZpSbLm87wyXiqbtBiZCP1 Rg== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y4vn705dm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 May 2024 13:04:09 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44FCMK8s005986;
	Wed, 15 May 2024 13:04:09 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3y2mgmkmpe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 May 2024 13:04:09 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44FD45FV15663622
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 May 2024 13:04:07 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6FFCB5805C;
	Wed, 15 May 2024 13:04:05 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2B1D85806D;
	Wed, 15 May 2024 13:04:04 +0000 (GMT)
Received: from [9.67.88.41] (unknown [9.67.88.41])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 15 May 2024 13:04:04 +0000 (GMT)
Message-ID: <db1e4dfc-04db-4f75-afc1-962d69fe39a8@linux.ibm.com>
Date: Wed, 15 May 2024 08:04:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] crypto: X25519 low-level primitives for ppc64le.
To: Andy Polyakov <appro@cryptogams.org>, linux-crypto@vger.kernel.org
References: <20240514173835.4814-1-dtsen@linux.ibm.com>
 <20240514173835.4814-2-dtsen@linux.ibm.com>
 <db513fd8-4723-4b4c-bc14-7da7222617b3@cryptogams.org>
Content-Language: en-US
From: Danny Tsen <dtsen@linux.ibm.com>
In-Reply-To: <db513fd8-4723-4b4c-bc14-7da7222617b3@cryptogams.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: JFmpnHQoMDSLCzgcPJgxv6_JHlWo-5Br
X-Proofpoint-ORIG-GUID: JFmpnHQoMDSLCzgcPJgxv6_JHlWo-5Br
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-15_06,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 phishscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999 suspectscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405150091
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
Cc: herbert@gondor.apana.org.au, dtsen@us.ibm.com, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, ltcgcw@linux.vnet.ibm.com, leitao@debian.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

See inline.

On 5/15/24 4:06 AM, Andy Polyakov wrote:
> Hi,
>
>> +SYM_FUNC_START(x25519_fe51_sqr_times)
>> ...
>> +
>> +.Lsqr_times_loop:
>> ...
>> +
>> +    std    9,16(3)
>> +    std    10,24(3)
>> +    std    11,32(3)
>> +    std    7,0(3)
>> +    std    8,8(3)
>> +    bdnz    .Lsqr_times_loop
>
> I see no reason for why the stores can't be moved outside the loop in 
> question.
>
Yeah.  I'll fix it.


>> +SYM_FUNC_START(x25519_fe51_frombytes)
>> +.align    5
>> +
>> +    li    12, -1
>> +    srdi    12, 12, 13    # 0x7ffffffffffff
>> +
>> +    ld    5, 0(4)
>> +    ld    6, 8(4)
>> +    ld    7, 16(4)
>> +    ld    8, 24(4)
>
> Is there actual guarantee that the byte input is 64-bit aligned? While 
> it is true that processor is obliged to handle misaligned loads and 
> stores by the ISA specification, them being inefficient doesn't go 
> against it. Most notably inefficiency is likely to be noted at the 
> page boundaries. What I'm trying to say is that it would be more 
> appropriate to avoid the unaligned loads (and stores).

Good point.  Maybe I can handle it with 64-bit aligned for the input.

Thanks.


>
> Cheers.
>
