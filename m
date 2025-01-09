Return-Path: <linuxppc-dev+bounces-4886-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDB4A06C7F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2025 04:48:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YT9kC18mWz30Vw;
	Thu,  9 Jan 2025 14:48:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736394515;
	cv=none; b=OGDSHKCurnxH2DB1c6dRDzQR29YXj1h41oC0kJ5YNJlD4O2uLHtPjkXRkuKFooE8zUWV0xO0wurzjdKw9HhrVoF52IU2OnzPouUltCNZhXRBx9AaB90oPBGjCwGbDtmEIIki3sHLiQ6LcrxDVFTEgRuKTRsI6gHa634ZtWLh8FkixMaQzBypKM3t8FfjQGmqigSZ3zGV9uG+64/ocoZFgoDn2e/ZWOaH8piFz8ypS/SHVPA+rlGOc2lzojnYQk2sImBDegH0rybzG6f2s00J54ZdsNF1zaT4rUQ1CgZtslW16nAQADq/eXzm/5jgt2hgNhv2BU0ClxfjbaKwlv8cQA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736394515; c=relaxed/relaxed;
	bh=cZ7QVyUSfzkXf6/dDxrqwaFOVS5wAKlpuMDrvnkvETM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m0ONzewmRGo2cGUrcjN95oLHqRVlch4gTCNmftPwazHTYVoxl622oXI8Qz3sU0Bcoyx2yGUFh7/Y2ZYQlnFVw1Mt5njLeFKiQulUxm0/ynYXrykE1EOc2VR9RIV+0uAX2uuynWJG122UiMozBmlc1ss6j9s1IoHtoomKuB2xBA+ZCq0QDK8jtO6mtVLePECjOEaj3wAQ7dZbzGqv4wOTXAmyIy2EE3Kowwz4oHeJaLRpc5KBxBoVq8oUHy3z6DXu0zOa0XYoOMAiY8PJnqcCHpmXm9IcJyb8S862pSXi1KPqP9Ld7pRvSruux1ttGjtXAOLRSeuHhJDJ/xVKyk8+dQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=o58isptt; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=o58isptt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YT9k96Y4Zz305v
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2025 14:48:33 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508IbopB022507;
	Thu, 9 Jan 2025 03:48:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=cZ7QVy
	USfzkXf6/dDxrqwaFOVS5wAKlpuMDrvnkvETM=; b=o58ispttm/sU5niYuHi0rK
	coNmhMOORJCdiZXtBWGiQjQCxZzlqcJ1bGVwmvT2Ygt/c5s+iijpuRwiwpnomucY
	wOvJAVEuIlKfjM+1Dw2+Zq9DmtcAYTZgjo+ReigSrFrrasQUqr6C1TtM9NhpraXK
	rTYdS5PqjJfvfzOlW7pLHaFBf2eKnDVs6atudVECDwsLfCWLk2/5Qu/5CzuRhkqx
	EsWlh01aoQrM7eI92CRyaX79PNRXHG8cNDmw4Rnn550upKzYDyoq27M3ef+qCIoJ
	wq+OHcU8ZD14lfX1DnJMsU00NzVSKggXG7UNIDNEDZksa1rXUHMVjIHAJar6iLDA
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 441nj3cnmd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 03:48:22 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50926I3d026195;
	Thu, 9 Jan 2025 03:48:21 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 43yj12awtd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 03:48:21 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5093mIcx65536282
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 Jan 2025 03:48:18 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EFC4A2004B;
	Thu,  9 Jan 2025 03:48:17 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 57C5C20040;
	Thu,  9 Jan 2025 03:48:15 +0000 (GMT)
Received: from [9.43.18.121] (unknown [9.43.18.121])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  9 Jan 2025 03:48:15 +0000 (GMT)
Message-ID: <32441306-ea5e-44e6-8a8a-7d05d97addce@linux.ibm.com>
Date: Thu, 9 Jan 2025 09:18:14 +0530
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
Subject: Re: [PATCH RESEND v1 1/5] crash: remove an unused argument from
 reserve_crashkernel_generic()
To: Baoquan he <bhe@redhat.com>
Cc: linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>, kexec@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250108101458.406806-1-sourabhjain@linux.ibm.com>
 <20250108101458.406806-2-sourabhjain@linux.ibm.com>
 <Z35eja7aQdnY6ZPS@MiWiFi-R3L-srv>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <Z35eja7aQdnY6ZPS@MiWiFi-R3L-srv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 5b2N8j7YWtCXoSBmBRUWtsbI-t-SERZi
X-Proofpoint-GUID: 5b2N8j7YWtCXoSBmBRUWtsbI-t-SERZi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 impostorscore=0 mlxlogscore=691 phishscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090026
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello Baoquan,


On 08/01/25 16:46, Baoquan he wrote:
> On 01/08/25 at 03:44pm, Sourabh Jain wrote:
>> cmdline argument is not used in reserve_crashkernel_generic() so remove
>> it. Correspondingly, all the callers have been updated as well.
>>
>> No functional change intended.
>>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: Baoquan he <bhe@redhat.com>
>> Cc: Hari Bathini <hbathini@linux.ibm.com>
>> CC: Madhavan Srinivasan <maddy@linux.ibm.com>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: kexec@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> ---
>>   arch/arm64/mm/init.c          |  6 ++----
>>   arch/loongarch/kernel/setup.c |  5 ++---
>>   arch/riscv/mm/init.c          |  6 ++----
>>   arch/x86/kernel/setup.c       |  6 ++----
>>   include/linux/crash_reserve.h | 11 +++++------
>>   kernel/crash_reserve.c        |  9 ++++-----
>>   6 files changed, 17 insertions(+), 26 deletions(-)
> Acked-by: Baoquan He <bhe@redhat.com>
Thanks for the Ack!

- Sourabh Jain

