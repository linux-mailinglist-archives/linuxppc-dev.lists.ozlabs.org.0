Return-Path: <linuxppc-dev+bounces-1409-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 907F997A44E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Sep 2024 16:40:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X6ndw728Dz2xdR;
	Tue, 17 Sep 2024 00:40:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726497652;
	cv=none; b=L7jq1HwxvAwNW7K9NaAWOrlVvadQ9YoxsygzbVaCLFuQsMLgoOND6h0PwYJ+uXWZ1aRpALasNzlqbWVGc/OiBy75NsSBFqFCA8Pl3U0pp4c2C+Vlju8Z1AxDSVbVH+vKzoanE9Kf/Fa/wom5YGPumTYjktL23/Uc2ALoew+mSd/pm3O9eSqlHFzSIuZOK0KyhV/qxRtWZ4gb6bxOE4zybwWjGDHiNI6fHuM5N5xOhiQKjN0D+6vTKT7IELZ1kb5Hymnc2KsOhxFYOAC0wHbffrZ5AAVFrVTtUo9scj9XGSaP4rspV4cLjxpAekI8WcaPOPwXcwzGfnp7qi5Xko/2Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726497652; c=relaxed/relaxed;
	bh=0+LfZKsnxa1uPbMa6VF6ZtYTzNeMhfwoldMW/TwADvc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FbXll1TxKteJ1gl+Xh4OiYrrCibWZd784CbJznTWirCYt5gfgs5rtY3hCn7D/sP74UJzw7aJKER7gz2TEkFdAhKFNcgQ6xD1n456lamR4+G7hQVL31tWdfjzive3SVXzPU4k095qvGCtsPw9C26t7RNWnRa9y3FSwaY+FcqRLPQBQCulqPmomIjNtdIRtFZ+hT9AFowzsnN98sfN47av10BPZtNhsb++OrxcHRv0+nGScviRK9pKUgGOLNJ7oxmEAW8fJ9vrWZKqwyxWqTiDE2UCg+KUCdJCPrc03PZhDAs/ZOYlhG6sYIichUD8K42/XCYZYG+hax8HbsYpiYCVzA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Agr/oit0; dkim-atps=neutral; spf=none (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Agr/oit0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X6ndw2zh2z2xPf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Sep 2024 00:40:51 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48GCb3Eg031030;
	Mon, 16 Sep 2024 14:40:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=pp1; bh=0
	+LfZKsnxa1uPbMa6VF6ZtYTzNeMhfwoldMW/TwADvc=; b=Agr/oit0rObVmdh4A
	7Dp7ELC39MqQL8y8BZDrvasA/znyRbQImtkioB8ajOnKllDdMza9aa0sW96GEvKf
	ScyXBDhVA0TUmeJ5U03pvzPz4CC8HmdHZau/syo/2ieCUH4MQkD/GaxNhDvuHZT9
	cX7XYtBM70BdNLAH29X0LIpaSuxkMAyq8w7u8PUognYfSSEOk2u+og7VRMwXHFyi
	lLV1bHxO+fad+2R1blRFI346ORiQ9QIoqZ3gvjXhCRe7YlSbR3xu48biMkNsDxzp
	7rJTUqB9jWPWu32UVV0ttNOPWVI4tGyBhBaaB1F+z6a2yf3Nb03k0mWvC/GbKg6C
	oYvBQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41n3uj2m0f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Sep 2024 14:40:39 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 48GEed49017778;
	Mon, 16 Sep 2024 14:40:39 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41n3uj2m0c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Sep 2024 14:40:39 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 48GC9ajr024637;
	Mon, 16 Sep 2024 14:40:38 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 41nq1mqqj5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Sep 2024 14:40:38 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 48GEebMv14156366
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Sep 2024 14:40:37 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BC3615805A;
	Mon, 16 Sep 2024 14:40:37 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E829058052;
	Mon, 16 Sep 2024 14:40:35 +0000 (GMT)
Received: from [9.61.251.169] (unknown [9.61.251.169])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 16 Sep 2024 14:40:35 +0000 (GMT)
Message-ID: <f4cc885a-33af-4af5-85b2-72142fe83c87@linux.vnet.ibm.com>
Date: Mon, 16 Sep 2024 20:10:34 +0530
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
Subject: Re: [PowerPC][Linux-next][6.11.0-rc4-next-20240820] OOPs while
 running LTP FS Stress
Content-Language: en-GB
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        vschneid@redhat.com, mingo@kernel.org, sfr@canb.auug.org.au
References: <82b9c434-a0fd-4488-95be-a45b8cd4b6e6@linux.vnet.ibm.com>
 <20240916113030.GZ4723@noisy.programming.kicks-ass.net>
From: Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>
In-Reply-To: <20240916113030.GZ4723@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: GM2-HkX9HUnakcrXoUa9fjOaJNwzyoSy
X-Proofpoint-GUID: 4qxLe0pjbSlgDfJTDO_3AjSrdeYW7n-w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-16_11,2024-09-13_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=860 adultscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 mlxscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409160094

Yes, Issue is still seen. Latest seen was on 6.11.0-rc7-next-20240910.

I am re-attempting Git Bisect. Will update the results, once I am done.

On 16/09/24 5:00 pm, Peter Zijlstra wrote:
> On Mon, Sep 16, 2024 at 12:00:52PM +0530, Venkat Rao Bagalkote wrote:
>
>> I am seeing below kernel crash from 6.11.0-rc4-next-20240820.
> 0820 is almost a month old by now, did you verify if the same happens on
> a recent kernel? We did fix a bunch of issues around this.
>

