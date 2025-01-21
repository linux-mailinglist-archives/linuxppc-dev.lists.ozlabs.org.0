Return-Path: <linuxppc-dev+bounces-5436-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F4BA17891
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2025 08:26:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ycdzg33KQz2yHL;
	Tue, 21 Jan 2025 18:26:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737444367;
	cv=none; b=lkcoW7AKB4cViqRD+IR+HD2zb88djtUo6RNC1myK4AxmmdObnTimkj/SHo9Rvxv9vjHkQCSAgv4XikuvSgicboYpvWtQW/vbhpthWGdWiMXHQgZpPAQfk5CRvUpxMczs4N2VdiKoth1EIXXUeuoHHin0cRYjvYHD6hvMzrzgYfj/os3HXz9IbHHpI7TbO42BBKVjxTXyJ0STxQxxUwSXdHLnu2LAS1qF37fBISV+E+VwwZigo+vf/woPE44/JavNdkRqTHXW1rge1Ol29vKN8KjSYwUyzWJTG8iCrpeftR6e+b0+hz2VIq3yq0DXo2BJ69GOruJWo7hWcs5KAkOz0w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737444367; c=relaxed/relaxed;
	bh=AzndozJTjkLVxy0qduiZn2CUNFaoxEeg43gazZF1GGw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AabWYpaXc9wfuNuLSif5emCvYahMUtp2PjcHa4r339f3eVXEBD+NaesEEX+EM8cT6dpgAubykulSnxxZB3cjqvtztAHfDIsNElgLffTKs5CTj2Jecvp3BKxC4hQ7o096l61BpzZJzx9EP8+YiswbjOum1ujUU9oYHYPJkUMDynkGmUokf7FH6hQTAZMU9SzbqxWd3fpVLsMq4ZuqmkkUz/aE+/9p8YwicYdnt5f6VrnYo+2mXGkuuqlfgRas77S4520iu77kxxRDihnAt4yw1cfXIhw/tLqIgccFjqO9waL1YJQXZII1Uo2RgtHg15uSHNJue3N4IXWEbqq7LmYM0w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iyafctot; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iyafctot;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ycdzd4wCyz2yFB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2025 18:26:05 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50L18dAZ021870;
	Tue, 21 Jan 2025 07:25:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Azndoz
	JTjkLVxy0qduiZn2CUNFaoxEeg43gazZF1GGw=; b=iyafctotc+U/hZKzpFsrkh
	/VfBkEMu3Nt5b2Z5HCu2tGigwCiMe3pdfLYl4O/aAJq5tnGQY9qr2zq0FMgiaEFS
	jNxyeyr8TFvZhzUik1pL1C4upCHbv2iqtSssassTsu9P4b6TCCFNjiQ412enDYs0
	NheQdHpNi21VZsVpotVF5ByYQDGrwAzIZ4hTxVyzm+u007lnfTYrqH0Ii2mP0lWc
	f/VbA9RiCcxpzGKee/14kIixDSigi43Tbq4yH5I2Dgoh30qnDzD/j/Y9GcXH6sYL
	ulCJRY6U3ahE7gucc21ztLveESddEvPEuBuSbW06j9w8zwy4dI8Poa2UWfJXESuA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44a1n9997b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 07:25:51 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50L79a4I025235;
	Tue, 21 Jan 2025 07:25:50 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44a1n99977-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 07:25:50 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50L6MP7V022378;
	Tue, 21 Jan 2025 07:25:49 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 448r4k1v4t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 07:25:49 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50L7PlI850004248
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Jan 2025 07:25:47 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 642B220040;
	Tue, 21 Jan 2025 07:25:47 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ADF7E20043;
	Tue, 21 Jan 2025 07:25:45 +0000 (GMT)
Received: from [9.39.27.2] (unknown [9.39.27.2])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 21 Jan 2025 07:25:45 +0000 (GMT)
Message-ID: <cd1087ab-d160-4ba5-aa1d-78e3dfe0a3b3@linux.ibm.com>
Date: Tue, 21 Jan 2025 12:55:44 +0530
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
Subject: Re: [PATCH v3 0/1] powerpc: Enable dynamic preemption
To: mpe@ellerman.id.au, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: npiggin@gmail.com, christophe.leroy@csgroup.eu,
        linux-kernel@vger.kernel.org,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Ankur Arora <ankur.a.arora@oracle.com>
References: <20250106051919.55020-1-sshegde@linux.ibm.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20250106051919.55020-1-sshegde@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: zjFgmHztCo8orL7MXRQe3T-IVSEa6jVN
X-Proofpoint-GUID: BKl-3A4jdPS4HCMikxF_9UR7t3LQEKEF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_03,2025-01-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=437
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501210056
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 1/6/25 10:49, Shrikanth Hegde wrote:
> Now that preempt=lazy patches[1] are in powerpc-next tree, sending out the
> patch to support dynamic preemption based on DYNAMIC_KEY.
> 
> base: powerpc-next
> 

+ankur, sebastian; sorry for not cc'ing earlier.

> Once the arch supports static inline calls, it would be needed to
> evaluate to see if that gives better performance.
> 
> v2->v3:
> - fixed a build error reported by linux test robot by including jump
>    label header.
> 
> v1->v2:
> - Instead of copying asm-generic preempt.h content include it in
>    arch/asm preempt.h. (Christophe Leroy)
> - Merge the patches into one patch (Christophe Leroy)
> 
> v1: https://lore.kernel.org/all/20241125042212.1522315-1-sshegde@linux.ibm.com/
> v2: https://lore.kernel.org/all/20250102191856.499424-1-sshegde@linux.ibm.com/
> [1]: https://lore.kernel.org/all/173572211264.1875638.9927288574435880962.b4-ty@linux.ibm.com/
> 
> Shrikanth Hegde (1):
>    powerpc: Enable dynamic preemption
> 
>   arch/powerpc/Kconfig               |  1 +
>   arch/powerpc/include/asm/preempt.h | 12 ++++++++++++
>   arch/powerpc/kernel/interrupt.c    |  6 +++++-
>   arch/powerpc/kernel/traps.c        |  6 +++++-
>   arch/powerpc/lib/vmx-helper.c      |  2 +-
>   5 files changed, 24 insertions(+), 3 deletions(-)
>   create mode 100644 arch/powerpc/include/asm/preempt.h
> 

Hi maddy, mpe, christophe.

Now that preempt=lazy is merged upstream, is would be start to enable 
dynamic preemption to make use of all preemption models at runtime.

Are there any concerns with this patch?

Thanks.

