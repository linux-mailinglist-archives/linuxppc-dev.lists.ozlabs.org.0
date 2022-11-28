Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 784FA63B147
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 19:27:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NLYqK27MSz3dv6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 05:27:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=T4gPvLGw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=T4gPvLGw;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NLYpK4ZFPz3cH9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Nov 2022 05:26:49 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2ASILAPv017464
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Nov 2022 18:26:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=PgrWFw6ccOP234QXA/o/FyjNpKEJ+2zPq+CEjmB3PiU=;
 b=T4gPvLGww2iHULXFWL4pagBdVkVkt6OI/9b5fdPhLXsGzJ/+XY7G6gKC0QUe7yc60uLr
 d/MkF6by/gujRt2J6eWjdMrrKgymzc6u1f/kBYRi8IXOu9ojnmWkvenYWcvHvPsc7XDq
 4c6XXsK9wDod0oyrFiaV+f2r2XJ89Z75FdqS2gqAv8hf8pb8X6hWVtfk//t5C5wzFhMY
 /PVfrgVdAN5iIHd061RPb+3C1fu7VNbao85+lMxx8ZFWH4DZNzbgRxrKTwoZVMeOnyqv
 CSdP9B5y2+VGTgvLO5+O9712JZ48QPc/LM/GLnmFb0qaMsH8K11voCcbod4b7eybkSd/ gA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m3vn7fytm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Nov 2022 18:26:46 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2ASGwSgP016383
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Nov 2022 18:26:45 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m3vn7fytc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Nov 2022 18:26:45 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
	by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2ASILE9k008930;
	Mon, 28 Nov 2022 18:26:45 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
	by ppma04wdc.us.ibm.com with ESMTP id 3m3ae9f91k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Nov 2022 18:26:45 +0000
Received: from smtpav02.wdc07v.mail.ibm.com ([9.208.128.114])
	by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2ASIQh3X40305386
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Nov 2022 18:26:44 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6E6CE5805F;
	Mon, 28 Nov 2022 18:26:43 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 415DE58073;
	Mon, 28 Nov 2022 18:26:43 +0000 (GMT)
Received: from localhost (unknown [9.211.69.164])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 28 Nov 2022 18:26:43 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 03/13] powerpc/rtas: avoid device tree lookups in
 rtas_os_term()
In-Reply-To: <CONKPQU112NE.1K5YZVFHQ7XU9@bobo>
References: <20221118150751.469393-1-nathanl@linux.ibm.com>
 <20221118150751.469393-4-nathanl@linux.ibm.com>
 <CONKPQU112NE.1K5YZVFHQ7XU9@bobo>
Date: Mon, 28 Nov 2022 12:26:42 -0600
Message-ID: <875yez9bq5.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: p7IAK6C5NUYMe3UmhbZdUsxUh_xX29JS
X-Proofpoint-ORIG-GUID: WTosY1k95NlXZ1Agl-5s8CEpyl4Ogxzr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-28_15,2022-11-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 mlxlogscore=602 phishscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211280132
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
Cc: tyreld@linux.ibm.com, nnac123@linux.ibm.com, ldufour@linux.ibm.com, ajd@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Nicholas Piggin" <npiggin@gmail.com> writes:
> On Sat Nov 19, 2022 at 1:07 AM AEST, Nathan Lynch wrote:
>> rtas_os_term() is called during panic. Its behavior depends on a
>> couple of conditions in the /rtas node of the device tree, the
>> traversal of which entails locking and local IRQ state changes. If the
>> kernel panics while devtree_lock is held, rtas_os_term() as currently
>> written could hang.
>
> Nice.
>
>>
>> Instead of discovering the relevant characteristics at panic time,
>> cache them in file-static variables at boot. Note the lookup for
>> "ibm,extended-os-term" is converted to of_property_read_bool() since
>> it is a boolean property, not a RTAS function token.
>
> Small nit, but you could do that at the query site unless you
> were going to start using ibm,os-term without the extended
> capability.

I'm unsure that this is what you're suggesting, but we don't want to use
of_property_read_bool() in this context either, because it has the same
undesirable qualities as rtas_token().

> Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

Thanks!
