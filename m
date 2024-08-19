Return-Path: <linuxppc-dev+bounces-163-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F18956280
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2024 06:16:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnK655DNmz2xmk;
	Mon, 19 Aug 2024 14:16:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OxaHkZKC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WnK652hcQz2xjv
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2024 14:16:13 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47J3X8T1023559;
	Mon, 19 Aug 2024 04:16:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:mime-version:subject:from:to:cc:references
	:in-reply-to:content-type:content-transfer-encoding; s=pp1; bh=o
	2sTkt1iXiirRrY/2diJQwQvSmFwGnGarq5JCuO5sjM=; b=OxaHkZKCoiBJB6Phj
	FeTpU8GyzpzaFFgqj9RRmJuxbZjoP6q7caWDCHTTTB/szh35G8sIwRrP2GlcQtM0
	q2hVn1GIIsFLGxp37KH75bsSwmH0fQHnntbhFdU+kAmIrRwerRIEsdKJis8jscjO
	BAu0rxXaPz3qNM2Dh6Ud5vGmdCGG2NETbpEeBnYDvMz1dvmFvUtWr4OAJCEwesjQ
	76TJpyZ+x33FYKjn+FuC+VswvY/A4TOgD82MmsX/QoBGAvw30cjUfSLD3gg1ZaLK
	FbotKWKHTRU5K5TUc7Comvg6uf4k9obojC02woCzAXziibjaeS1tPXmjHZfJsEjv
	r5jxg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 412mc5xvda-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Aug 2024 04:16:03 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 47J4G2wh022758;
	Mon, 19 Aug 2024 04:16:02 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 412mc5xvd8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Aug 2024 04:16:02 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 47J2pneU013107;
	Mon, 19 Aug 2024 04:16:01 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 41366tvq0r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Aug 2024 04:16:01 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 47J4FwAC27984422
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Aug 2024 04:16:00 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 030F120043;
	Mon, 19 Aug 2024 04:15:58 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2906420040;
	Mon, 19 Aug 2024 04:15:56 +0000 (GMT)
Received: from [9.109.204.94] (unknown [9.109.204.94])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 19 Aug 2024 04:15:55 +0000 (GMT)
Message-ID: <355b58b1-6c51-4c42-b6ea-dcd6b1617a18@linux.ibm.com>
Date: Mon, 19 Aug 2024 09:45:55 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kexec/crash: no crash update when kexec in progress
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, bhe@redhat.com
Cc: Hari Bathini <hbathini@linux.ibm.com>, kexec@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        x86@kernel.org, Sachin P Bappalige <sachinpb@linux.vnet.ibm.com>
References: <20240731152738.194893-1-sourabhjain@linux.ibm.com>
 <87v80lnf8d.fsf@mail.lhotse>
 <10c666ae-d528-4f49-82e9-8e0fee7099e0@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <10c666ae-d528-4f49-82e9-8e0fee7099e0@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: dkC9HdUkU1ndMyUpgCEV6AyZ0aEUDBK7
X-Proofpoint-ORIG-GUID: 9BpC5g6i3iCIjSgQoI-_tfZlERenEVta
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_01,2024-08-16_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408190029

Hello Michael and Boaquan

On 01/08/24 12:21, Sourabh Jain wrote:
> Hello Michael,
>
> On 01/08/24 08:04, Michael Ellerman wrote:
>> Sourabh Jain <sourabhjain@linux.ibm.com> writes:
>>> The following errors are observed when kexec is done with SMT=off on
>>> powerpc.
>>>
>>> [  358.458385] Removing IBM Power 842 compression device
>>> [  374.795734] kexec_core: Starting new kernel
>>> [  374.795748] kexec: Waking offline cpu 1.
>>> [  374.875695] crash hp: kexec_trylock() failed, elfcorehdr may be 
>>> inaccurate
>>> [  374.935833] kexec: Waking offline cpu 2.
>>> [  375.015664] crash hp: kexec_trylock() failed, elfcorehdr may be 
>>> inaccurate
>>> snip..
>>> [  375.515823] kexec: Waking offline cpu 6.
>>> [  375.635667] crash hp: kexec_trylock() failed, elfcorehdr may be 
>>> inaccurate
>>> [  375.695836] kexec: Waking offline cpu 7.
>> Are they actually errors though? Do they block the actual kexec from
>> happening? Or are they just warnings in dmesg?
>
> The kexec kernel boots fine.
>
> This warning appears regardless of whether the kdump kernel is loaded.
>
> However, when the kdump kernel is loaded, we will not be able to 
> update the kdump image (FDT).
> I think this should be fine given that kexec is in progress.
>
> Please let me know your opinion.
>
>> Because the fix looks like it could be racy.
>
> It seems like it is racy, but given that kexec takes the lock first 
> and then
> brings the CPU up, which triggers the kdump image, which always fails to
> update the kdump image because it could not take the same lock.
>
> Note: the kexec lock is not released unless kexec boot fails.

Any comments or suggestions on this fix?

Thanks,
Sourabh Jain


