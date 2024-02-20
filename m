Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3CF85C114
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Feb 2024 17:21:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VAgJr6of;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TfPmq0fLBz3dWr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 03:21:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VAgJr6of;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TfPlJ156tz2ykC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Feb 2024 03:20:27 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41KErf19024224;
	Tue, 20 Feb 2024 16:20:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=Un5Aqgjm5ui8gh7lB2UW5GIJ30ycqFJYVWwQeiUaLTk=;
 b=VAgJr6of1Kh+aZBMFjzHgL2+r3/w4DNUMDz6rr8R2jKgwrOLzeaWbBQoGrrYjd5nC6y+
 8t5Djh8QJNP/pBx+OMwrTaYRuUFf12OfGbJIgQeQPPyy3NzehTwJUqUqI8NTwZVfeDCh
 wovGYLJ9GayOHsohMf8v1yUPMYGZO98sS23H8wfYAR30P3SI4pd3cjzv3dpxemGjqarL
 f1xILAxD0ofv9JnIkfpAwnRfu5dsR8K3JjI1rHfpfguy8EMrzp7WWVwxDiCztwZNLuwD
 lc4O6R1sh1QMpQxWWCsl0wIwFCMh1objcmZ9MqgTWma9sEuxrkmuvQsst4lptpTwf0CH Nw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wcw7jcs23-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Feb 2024 16:20:21 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 41KFpHBA020623;
	Tue, 20 Feb 2024 16:20:20 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wcw7jcs1t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Feb 2024 16:20:20 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41KEpFsr009547;
	Tue, 20 Feb 2024 16:20:20 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3wb84p96tg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Feb 2024 16:20:20 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41KGKGTq60817668
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 Feb 2024 16:20:19 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9145258068;
	Tue, 20 Feb 2024 16:20:14 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 85F9B58061;
	Tue, 20 Feb 2024 16:20:14 +0000 (GMT)
Received: from localhost (unknown [9.41.178.242])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 20 Feb 2024 16:20:14 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin
 <npiggin@gmail.com>,
        "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
        "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
        Brian King
 <brking@linux.ibm.com>
Subject: Re: [PATCH RFC] powerpc/pseries: exploit H_PAGE_SET_UNUSED for
 partition migration
In-Reply-To: <87edd7baa4.fsf@mail.lhotse>
References: <20240111-h_page_set_unused-for-lpm-v1-1-cd56184ad608@linux.ibm.com>
 <87edd7baa4.fsf@mail.lhotse>
Date: Tue, 20 Feb 2024 10:20:14 -0600
Message-ID: <874je3hzup.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7Weg-VqTuw_JEHy3c_oS9tUgvtoWgZ8e
X-Proofpoint-ORIG-GUID: Xn6UHn-xHzpcjnoBvWiJ0gdoorbANTe6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-20_06,2024-02-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 mlxlogscore=999 adultscore=0 spamscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402200116
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:
> Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
> writes:
>> From: Nathan Lynch <nathanl@linux.ibm.com>
>>
>> Although the H_PAGE_INIT hcall's H_PAGE_SET_UNUSED historically has
>> been tied to the cooperative memory overcommit (CMO) platform feature,
>> the flag also is treated by the PowerVM hypervisor as a hint that the
>> page contents need not be copied to the destination during a live
>> partition migration.
>>
>> Use the "ibm,migratable-partition" root node property to determine
>> whether this partition/guest can be migrated. Mark freed pages unused
>> if so (or if CMO is in use, as before).
>>
>> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
>> ---
>> Several things yet to improve here:
>>
>> * powerpc's arch_free_page()/HAVE_ARCH_FREE_PAGE should be decoupled
>>   from CONFIG_PPC_SMLPAR.
>>
>> * powerpc's arch_free_page() could be made to use a static key if
>>   justified.
>>
>> * I have not yet measured the overhead this introduces, nor have I
>>   measured the benefit to a live migration.
>>
>> To date, I have smoke tested it by doing a live migration and
>> performing a build on a kernel with the change, to ensure it doesn't
>> introduce obvious memory corruption or anything. It hasn't blown up
>> yet :-)
>>
>> This will be a possibly significant behavior change in that we will be
>> flagging pages unused where we typically did not before. Until now,
>> having CMO enabled was the only way to do this, and I don't think that
>> feature is used all that much?
>
> Yeah AFAIK it has to be explicitly configured and enabled via the HMC,
> so doesn't get much testing or usage.
>
>> Posting this as RFC to see if there are any major concerns.
>  
> My worry is that this will add overhead for everyone in normal usage, an
> hcall per freed set of pages, whereas the benefit is only seen when a
> migration happens.
>
> But that does depend on how often arch_free_page() gets called in normal
> usage, which I don't know offhand.

Yes, and as I said in my followup yesterday:

>> for this to be safe, powerpc/pseries needs to implement
>> arch_alloc_page() to undo setting the "unused" flag.

So, perhaps more significantly, we'd also incur an hcall per
arch_alloc_page() with the most straightforward implementation that
doesn't eat data (unlike this version!).

Nevertheless I'll plan on doing that for the next iteration to see if I
can measure the overhead and benefit, with the expectation that we'll
ultimately need a more sophisticated design.
