Return-Path: <linuxppc-dev+bounces-1276-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 541969763DB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2024 10:03:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X491n0Lmmz2yGf;
	Thu, 12 Sep 2024 18:03:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726128237;
	cv=none; b=i22CI7oI6zjTYpe9cbi3QMlanmDlX3gE7mwKpM9OlHJ3qfCkLsV5ObBPqt83sanPZ683lyAQCXMX1yXEwFINvlPPufw1MYjyswhJqyj9ALOwPY0INvWuSWjXAjYC1OQsTpp8yaf7I8jlftgPPmhInAyPRDZzIc5rMA5T8tlXLedKaIzoRjnJn5fseAPAEiXIZMc4vhXJfffqfdnjk3D7lAuF1/6iX6Nf0ecQRTAOG60XifzJIw2nzqfZN6v2hxYByq5RNhnV/fw3qYAQXoJckBewEw6q1Q420anTyK5Dy/8UQ+88y9aUdvaX4H9I1Hk/qZul6AuIoMp8w2a7LoAKuw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726128237; c=relaxed/relaxed;
	bh=oYpDSObymtP5trr0Dg3dxQpCaFYppzt85CDjuduwHw4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gkO2m7LcNGbdKwOfbVRxTYQcYPOLnxUjCa0+ZTM0/1OglwM0p3PfxGxRFTzfLZxXbKFF4jQfLj1vMaHbfpxZBmCD2rAqBcsgrQppNmY5EdHf4j+4DCCU3+lc0P2hcqjukb1KfXjSovCbypzsLDPXSIiFN+8+AOh4qihb5KVQv02rz5n+AubSmOFFpKTWiuTD+WSArc2Yw2qDmSyUlwwqV0c3micKj9lJt1h3jYKxz1D9QP0z2A6+6BayHrDoDsIJYh/Fn8xhY7fB6gLSYp4eqvQP59MZlL6zd8J6+gym5vOPhhNj4Wgfsu+OGIXDh6BanWUFX0yD4xapjF10s2dlQQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WMj64vR/; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WMj64vR/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X491m2nzsz2yG9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2024 18:03:55 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48BMdOZb025206;
	Thu, 12 Sep 2024 08:03:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=pp1; bh=
	oYpDSObymtP5trr0Dg3dxQpCaFYppzt85CDjuduwHw4=; b=WMj64vR/seYiXMx8
	nXRJ085pVG5oNXnL+JMhlh/DUT4v/J1X8uk2AjD/ylvQz0heepRoK4QwibbmaFYw
	RNuqMwvu0Tk9s1NQoHR3jYNwc20WwtaKXmO7h8aNK7Yp8lXGc3fg3SxtnsXf9u85
	ZlW2/xJ4ldWDtCPlS6dLx5ghAzidnKEsLdCaJInbYleJIppYlJU3ERLjO0VDpfa7
	fUyXBg3lD/pf1hnUAlFthQf+c5lwtu+sUjFZYyo3IRq0jspQXIp+SKzYVkNhaZlw
	F2hA1JUhN6oy5DKaM3kngv+ADL7pwDKU2aUFsrT+PXd+kR1oqfPTrzpG8rti5ChU
	rW/Abw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41gefyt16t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Sep 2024 08:03:41 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 48C83eC9025017;
	Thu, 12 Sep 2024 08:03:40 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41gefyt16p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Sep 2024 08:03:40 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 48C5jH8K003122;
	Thu, 12 Sep 2024 08:03:40 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 41h15u6rhg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Sep 2024 08:03:40 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 48C83cX18651188
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Sep 2024 08:03:38 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 74D4A20043;
	Thu, 12 Sep 2024 08:03:38 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D26562004B;
	Thu, 12 Sep 2024 08:03:33 +0000 (GMT)
Received: from [9.43.115.177] (unknown [9.43.115.177])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 12 Sep 2024 08:03:33 +0000 (GMT)
Message-ID: <f4dcb6b4-2da8-4355-9d89-8b41af30214d@linux.ibm.com>
Date: Thu, 12 Sep 2024 13:33:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2] kexec/crash: no crash update when kexec in
 progress
To: Baoquan He <bhe@redhat.com>
Cc: akpm@linux-foundation.org, Hari Bathini <hbathini@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>, kexec@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        x86@kernel.org, Sachin P Bappalige <sachinpb@linux.vnet.ibm.com>
References: <20240911112111.108056-1-sourabhjain@linux.ibm.com>
 <ZuGnH5R+FOC481V3@MiWiFi-R3L-srv>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <ZuGnH5R+FOC481V3@MiWiFi-R3L-srv>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: tq5vb7peLAjR_5_8qxwGwQdcYnON-O-e
X-Proofpoint-ORIG-GUID: Gdw-KrRH0ymkfw_x-UoPGfWRmIMBalgj
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-11_02,2024-09-09_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501
 adultscore=0 clxscore=1011 spamscore=0 bulkscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409120055

Hello Baoquan,

On 11/09/24 19:50, Baoquan He wrote:
> On 09/11/24 at 04:51pm, Sourabh Jain wrote:
>> The following errors are observed when kexec is done with SMT=off on
>> powerpc.
>>
>> [  358.458385] Removing IBM Power 842 compression device
>> [  374.795734] kexec_core: Starting new kernel
>> [  374.795748] kexec: Waking offline cpu 1.
>> [  374.875695] crash hp: kexec_trylock() failed, elfcorehdr may be inaccurate
>> [  374.935833] kexec: Waking offline cpu 2.
>> [  375.015664] crash hp: kexec_trylock() failed, elfcorehdr may be inaccurate
>> snip..
>> [  375.515823] kexec: Waking offline cpu 6.
>> [  375.635667] crash hp: kexec_trylock() failed, elfcorehdr may be inaccurate
>> [  375.695836] kexec: Waking offline cpu 7.
>>
>> To avoid kexec kernel boot failure on PowerPC, all the present CPUs that
>> are offline are brought online during kexec. For more information, refer
>> to commit e8e5c2155b00 ("powerpc/kexec: Fix orphaned offline CPUs across
>> kexec"). Bringing the CPUs online triggers the crash hotplug handler,
>> crash_handle_hotplug_event(), to update the kdump image. Since the
>> system is on the kexec kernel boot path and the kexec lock is held, the
>> crash_handle_hotplug_event() function fails to acquire the same lock to
>> update the kdump image, resulting in the error messages mentioned above.
>>
>> To fix this, return from crash_handle_hotplug_event() without printing
>> the error message if kexec is in progress.
>>
>> The same applies to the crash_check_hotplug_support() function. Return
>> 0 if kexec is in progress because kernel is not in a position to update
>> the kdump image.
> LGTM, thanks.
>
> Acked-by: Baoquan he <bhe@redhat.com>

Thank you for the Ack!

My understanding is that this patch will go upstream via the linux-next 
tree, as it is based on 
https://lore.kernel.org/all/20240902034708.88EC1C4CEC2@smtp.kernel.org/ 
which is already part of the linux-next master branch. - Sourabh Jain

