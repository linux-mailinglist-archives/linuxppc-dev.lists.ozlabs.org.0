Return-Path: <linuxppc-dev+bounces-7355-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAB2A733C4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Mar 2025 15:01:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZNlgV5CTXz2yr0;
	Fri, 28 Mar 2025 01:01:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743084070;
	cv=none; b=oo8yWVdlqPWKAwk/+vbqOy7tkKx6BxTIViFQ5hMc4XG9JUt61d7iruuWqxYR/kg5s0WTw7MrNKxgcjfE8ORJBilY2WZHYN6vxCu8obp1SmBpPPhzVhrRrK4Y8GR5K+N9AdVIppQjRjb/LHBHUBmq4KDPEHhh1j/i7ztd9vJZGMgNE4lfi5rIwSEhtkokgRzR79oNWbGWZ2DjdAZzr225xB9eolUyBEq3aQi1bUg8RR+n5NRbV+Upf3T4lEfSpcz338qrrnDaZWfs5z0mLi2ca0bRjYwe8x4i/So5P/8d9dhU0gG3aukNXC+UmFze3SDMzGYEsmKU4DZgyzaKb+zR6g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743084070; c=relaxed/relaxed;
	bh=zYoyA1bdvonavIjgx5TNt4AvZYhOriEJuhiO3ynUUps=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=AumUh0kFMCO/pxW4v7Pgbv1GdAAiTmsMyPHHxR/7OeRzX9uwrVLm337CSeva4i1bTzDg6WaJAoCCJLfm0Zn/YQS5DX1pTYUlmiNAs3Kl3rPYsWSduPzvm+vGV5Y4kcAVb43V+maMZrcYT/2NASI8Qh/otCtmsnNGUXa+1vKGarrP62S5hyZJWjx23++LwJsSkQ7ILOwAWa6oE8njJSlpgKxhuIfg5U6MRLR6wXA0ErnZBE36qZ9u3T8lXDVsElYL2Mq2iMpb4ExLdGdFVU8ZYvG5faZLsKkYEF3bj/67v1GYbdS/kz2rATtyheShbfHpUZgH0S1ZFETFaSguYRmuRA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VAaYU9Ct; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VAaYU9Ct;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZNlgT6QVYz2yqn
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Mar 2025 01:01:09 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5GuaJ019111;
	Thu, 27 Mar 2025 14:01:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=zYoyA1
	bdvonavIjgx5TNt4AvZYhOriEJuhiO3ynUUps=; b=VAaYU9Ct+XNYTA60/B60hk
	ZlLaI6lChAdvn9ltlF0Z3M7kkLWJsib98FyX9mG20rpHbKBmZ1hLiu0ywHJdrPg6
	LtW+eQNUfXM4itjbG5nNBtqY3xw9xCh9XzGjGiiNcJKLT3ohuriRb49NnyHNnxbX
	PlcJh+4xK1CYEnLUceS8yqCPml669QwpN8HM3wfrBlPZHu4LmujHcHViIc5VqhCZ
	zV5tCQtMMu/IkB41jFjxOuwpVqN+VmTr9LGjVVdV91tkBb+L2wfrLIRX14fF3hQc
	KIjPVwhsf32dwZfJ207WJkVVYYtAnFroxXCWiidyb/wm7GNnhpUaIbNx+yyH1M2g
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45mnrwn98t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 14:01:06 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52RAbvlx025463;
	Thu, 27 Mar 2025 14:01:06 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45j7x0ds7k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 14:01:06 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52RE15MH39715360
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Mar 2025 14:01:05 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 330315804B;
	Thu, 27 Mar 2025 14:01:05 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 04E4658059;
	Thu, 27 Mar 2025 14:01:04 +0000 (GMT)
Received: from [9.61.252.80] (unknown [9.61.252.80])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 27 Mar 2025 14:01:03 +0000 (GMT)
Message-ID: <b5713b0b-a278-424c-8ba3-3aec01454e94@linux.ibm.com>
Date: Thu, 27 Mar 2025 19:31:02 +0530
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
Subject: Re: [main-line]Build warnings on PowerPC system
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <61cf556c-4947-4bd6-af63-892fc0966dad@linux.ibm.com>
 <8797a1c4-dc58-4a85-bc51-a3d4131e7930@linux.ibm.com>
Content-Language: en-GB
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <8797a1c4-dc58-4a85-bc51-a3d4131e7930@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QvPS5J9NuHdx8l0MVc5qI9N-YqkQCKh9
X-Proofpoint-ORIG-GUID: QvPS5J9NuHdx8l0MVc5qI9N-YqkQCKh9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_01,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0
 mlxlogscore=999 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270096
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 27/03/25 7:22 pm, Madhavan Srinivasan wrote:
>
> On 3/27/25 12:33 AM, Venkat Rao Bagalkote wrote:
>> Greetings!!!
>>
>> I see below build warnings while compiling mainline kernel on IBM Power9 system.
>>
>> Repo Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/
>>
>> Head Commit: f6e0150b2003fb2b9265028a618aa1732b3edc8f
>>
>> Attached is the .config.
>>
>> Machine: IBM Power9
>>
>> gcc version 11.5.0
> What is the ld version in your system.

Please find the ld version below.

GNU ld version 2.35.2-59.el9


Regards,

Venkat.

>
> Reason for asking is that currently with
>
> commit  579aee9fc594a ("powerpc: suppress some linker warnings in recent linker versions")
>
> ld version greater than >2.39, this warning is being suppressed.
>
> Maddy
>
>>
>> Warnings:
>>
>> ld: warning: arch/powerpc/boot/zImage.epapr has a LOAD segment with RWX permissions
>> ld: warning: arch/powerpc/boot/zImage.pseries has a LOAD segment with RWX permissions
>>
>>
>> If you happen to fix this, please add below tag.
>>
>>
>> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
>>
>>
>> Regards,
>>
>> Venkat.

