Return-Path: <linuxppc-dev+bounces-7338-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D651A7180E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Mar 2025 15:05:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZN7pJ1Tn2z2yqs;
	Thu, 27 Mar 2025 01:04:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742997896;
	cv=none; b=kXp4btqf/jF8H9R4V0UuJ75ILzX2mI9u/voHcn29ri53FSZQy3wux0xjnUVWzyFsWmYjv8SSKC1EPMeXdMfhZ8sjLg+CmycIgADr7GQWpuvSbLQxu0x6kGvJyqx/P5HQQZJnCgnbVnu4W9eWNsCrS3b/M0yapYaIpq5IInCZ1K9N+AY+FDpWmi51dw/7hJK76cSS0wTMos96BOv/fmg316RLLnDaxV3AZ3vxQIAd44cju4dhDGt8VGxoUvmUSXcSj72xzz9GQIp4ovuTuQDW6TYtNauZNfQ6HaxyLaIXluCoAUhKeNLbAJ5KdM2oDW5dn7wQ/CJ4MMhd9LARqDTLLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742997896; c=relaxed/relaxed;
	bh=rLUoDIgLEIMNKtQPUuBdHTqMji1aMxNbTKWy0xmu5Kk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lFHg8uVOqza3y9+zmnBeYxBXgVAYIN4DBeY7KZPaHsQcfV8bkv3HzTtnBt83aTfQ5YrcEosb8m7bLFHqNzVC/3rX3RYBi6DRJC5/9fxtSnEvwd/UdNlH2QWfthYGGoOX5ciA4PtH4FIzWNyRGDB7rxVVobRQ/bfqZfNFF3JAxsTKeQLLl/aRzlKsJFmVxjS0D+SI6Aszemvrh2Qo+k419/cpX3mQKcypXbhGAiwHaA/nCQgys4pV5K0sXSMZYsXVscQPnqSEcQt9hgRiUCQIyDFXSJEL9H4uh91jWiaIadRGH0h1Dggb04I+VHeICi/Mn60PT6cF79K1Mdkxo8/VgQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=E+MhRjrY; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=E+MhRjrY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZN7pG5NJCz2yqh
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Mar 2025 01:04:54 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52QAApOe027689;
	Wed, 26 Mar 2025 14:04:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=rLUoDI
	gLEIMNKtQPUuBdHTqMji1aMxNbTKWy0xmu5Kk=; b=E+MhRjrY0jN/wpDoFibz7b
	Dn801IOp07rk2Nkqs2xemWUkN/QoEhVMY/UXNGIkytZgTLU0xyfUnVtDJs4+sQ/5
	HwJHT7i6ymGNPdFc4/5jJQfwj/0M31CqIye5C1N5r/x74q2BJp4DXziO6SfKbPZ0
	RnQS3kvMkTtoMPm2L6lmEuqpr6kD6O6+SkxJgkSeLgNJXDXf82vlPrOE0tbfS63r
	2lj8pkpwQGVEotAvMR2bzJKQ4o8MCpoxu57PZqAia/2mpgaDWR8bCSwb9v3vfClO
	3w/vB6YEhA3p9MBob2AYJaDHYwLKmq50UmmXXC4bQR52Ad4dfH6NaQzLOc8vEsGA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45kbjx38hn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 14:04:31 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52QDqBnX010962;
	Wed, 26 Mar 2025 14:04:31 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45kbjx38hj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 14:04:31 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52QA1taf020029;
	Wed, 26 Mar 2025 14:04:30 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45j8hp0ks7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 14:04:30 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52QE4T3k20775614
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Mar 2025 14:04:29 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E1F8858053;
	Wed, 26 Mar 2025 14:04:28 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C003658043;
	Wed, 26 Mar 2025 14:04:12 +0000 (GMT)
Received: from [9.43.88.159] (unknown [9.43.88.159])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 26 Mar 2025 14:04:12 +0000 (GMT)
Message-ID: <1a130b61-bc34-4d9d-90b8-ebfb31946b05@linux.ibm.com>
Date: Wed, 26 Mar 2025 19:34:09 +0530
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
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.15-1 tag
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: adubey@linux.ibm.com, amachhiw@linux.ibm.com, arnd@arndb.de,
        atrajeev@linux.ibm.com, avnish@linux.ibm.com,
        christophe.leroy@csgroup.eu, gautam@linux.ibm.com,
        gbatra@linux.ibm.com, jk@ozlabs.org, kjain@linux.ibm.com,
        kuba@kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, naveen@kernel.org,
        npiggin@gmail.com, paulus@ozlabs.org, robh@kernel.org,
        schwab@linux-m68k.org, segher@kernel.crashing.org,
        sourabhjain@linux.ibm.com, tglx@linutronix.de,
        torvalds@linux-foundation.org, vaibhav@linux.ibm.com
References: <90872dd1a7f8844e313876afb74ec15aff7299b7.camel@physik.fu-berlin.de>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <90872dd1a7f8844e313876afb74ec15aff7299b7.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: xGOttpnaiOg7-yul-hD8T_cr07eqDgad
X-Proofpoint-ORIG-GUID: 2BrsVHCAoIGqKxBLj5zGH2CuIJzrlqta
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_07,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 spamscore=0
 clxscore=1011 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503260085
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 3/26/25 4:20 PM, John Paul Adrian Glaubitz wrote:
> Hello Madhavan,
> 
> does the removal of IBM Cell Blades affect the possibility to run Linux
> on the PlayStation 3 in any way? I assume there are still some hobbyists
> using it.

PS3 platform is still maintained. Only IBM Blade server platform 
is dropped.

> 
> There is at least one user within the Debian community using Linux on PS3.
> 

Glad to know we have users. :)

Maddy

> Thanks,
> Adrian
> 


