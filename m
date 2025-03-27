Return-Path: <linuxppc-dev+bounces-7354-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B55BA7339C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Mar 2025 14:52:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZNlTv1XPlz2yqy;
	Fri, 28 Mar 2025 00:52:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743083571;
	cv=none; b=BgideR/JdmzguFgqCeN9sDJPlCpMQ43p6GNTKWRyGFPEAWVi0fg5RT9/tQaovvI7oZCf8whaSFWdL/B9F0tnKksf5l/jh7LZ0SK2eTi5aOMbM0ZlfhKZKziC3yD2iDllsnHbO8uLUbn+BIJO0HXLOkMD/FR0abTpIVLMPC7v42WkBPYIqcrG/NmsQDBk/SlvlbxRu80csEqYXu0ebG/4lDMpguTfbPrIvRi4iOHiAdahgA95unFmsOTs8v/y3RjDhIFZq0ePBxWKy4ye/C5YDbkAVn/qYkl0zhSQRanswJKDXbWBi7uCW5SdlIUCD/zJVIbEKn/6p/eDtm60IA3JMw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743083571; c=relaxed/relaxed;
	bh=lR72a4GHZEB0fbhC/I4BrNu9OfR1V/1lS9yZ3KHUcrk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=oKpxwqlVQnHhVEcujIhqFqIP770NhE9mdO6gLLaros/BQpvDCnpl3+2ICAYuWFN4CcX7dVkaURuIRkm/N4jVwTvQ472g0GKnEvoxTXUgJNtaQ8uD63PjZExpVTQQRHfVsg3ezeTZpIDY7zbjxE9U4IuIhlrTe6j8GHBxrW3OIVuGC/1jMUByECpPXK9D5zSrIt3MRjV0kUDVN3vgxfqzDZlJK0/663Qy21zFB8Kj8v8+9S1hSxftUnbd8sPuaZqRgBSqFcLzxNhfqHKWA9VIH9Ct7TZGNGicPhAdIN9g/3CKrwjxnhbCMR3rodkFstK40mQq5VT0BNOqLylC5PToUg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ge6RIF8q; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ge6RIF8q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZNlTs5fVPz2yqn
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Mar 2025 00:52:49 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R94WTa011353;
	Thu, 27 Mar 2025 13:52:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=lR72a4
	GHZEB0fbhC/I4BrNu9OfR1V/1lS9yZ3KHUcrk=; b=Ge6RIF8qmYeUQYK8ghFBp/
	gNPMHqpMtuAgKm0ELozTKdhr85Uxa8Cy/9Ije6w3phbecwICxgqXxNMvPNmZcbNi
	fyV3Uj+4n2RtVYA1y44YOZj3+Woh33ttV+xjGwazq3sg2GWnAV0FZZwKGsFI/xAp
	JgWtIXNak+3yY1nixpYYMj0y9jmij6HVHTeomLpCvvxop1We5i2Ngv94eUP0j8E1
	S4jylpOW8hgSCDdcg/0GaRH4rpmZj1//P0dOY9L10nW0L+LGU7BeJXsOhqcwAuXQ
	McxAZftOO6XxXZpWyXwFkXeVxOgKS0VsJ08V/wsh49KyfuSaY8IPW/NMlku64iQQ
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45mrrq45ne-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 13:52:46 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52RCe9eU005791;
	Thu, 27 Mar 2025 13:52:45 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 45ja82na2d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 13:52:45 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52RDqi5v27853382
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Mar 2025 13:52:44 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B280E58057;
	Thu, 27 Mar 2025 13:52:44 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AB9105805D;
	Thu, 27 Mar 2025 13:52:42 +0000 (GMT)
Received: from [9.43.10.101] (unknown [9.43.10.101])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 27 Mar 2025 13:52:42 +0000 (GMT)
Message-ID: <8797a1c4-dc58-4a85-bc51-a3d4131e7930@linux.ibm.com>
Date: Thu, 27 Mar 2025 19:22:40 +0530
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
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <61cf556c-4947-4bd6-af63-892fc0966dad@linux.ibm.com>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <61cf556c-4947-4bd6-af63-892fc0966dad@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 80tlj-huWZxxHwB2nd5OSMmCBDts4fjr
X-Proofpoint-GUID: 80tlj-huWZxxHwB2nd5OSMmCBDts4fjr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_01,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 mlxscore=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502280000 definitions=main-2503270093
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 3/27/25 12:33 AM, Venkat Rao Bagalkote wrote:
> Greetings!!!
> 
> I see below build warnings while compiling mainline kernel on IBM Power9 system.
> 
> Repo Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/
> 
> Head Commit: f6e0150b2003fb2b9265028a618aa1732b3edc8f
> 
> Attached is the .config.
> 
> Machine: IBM Power9
> 
> gcc version 11.5.0

What is the ld version in your system.

Reason for asking is that currently with 

commit  579aee9fc594a ("powerpc: suppress some linker warnings in recent linker versions")

ld version greater than >2.39, this warning is being suppressed.

Maddy

> 
> 
> Warnings:
> 
> ld: warning: arch/powerpc/boot/zImage.epapr has a LOAD segment with RWX permissions
> ld: warning: arch/powerpc/boot/zImage.pseries has a LOAD segment with RWX permissions
> 
> 
> If you happen to fix this, please add below tag.
> 
> 
> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> 
> 
> Regards,
> 
> Venkat.


