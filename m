Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 837AA5A4C2D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Aug 2022 14:45:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGVX93Rd3z3c6W
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Aug 2022 22:45:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WLHXn67k;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WLHXn67k;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGVWS2rYVz2xHL
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 22:44:35 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27TCf31X008952
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 12:44:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=LRPoQcQ3qh2VftveYwY8G5c0TRyS967pDiIyPglUmAk=;
 b=WLHXn67kJDGAEtqAyB4YCI2xh2jlNEAE1k2enm4vCFIYaQqnEkWqidNW2PGLkzRSuiKW
 gagsULFecTJ1aB9O7HNqxLY2I0iufKFDBwymuZO3QAabN16ZJ3hA+eRrYhNkYoL7G/tu
 DSxa4GohvIPnsPYrdnYBohQYSgWoleHKm3kHMOxpSwHSc5nh/5GbqzaJzL9zz/1ZyIAQ
 qbHPBycPI2QlqDBUu4wqQSQT2Km2GNKGoAxqPFnWSAHTMkLdupxKzZYofkADErCkNvbs
 ALzE8a/uJW1xWIAD6nIbfW4Ype6b9WTlanMUgAKtEO9BhVrrwSnVxcA+yqJ3TKgWX+7c 2w== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j8wg484xa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 12:44:32 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27TCZSeK009718
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 12:44:29 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma04ams.nl.ibm.com with ESMTP id 3j7aw8tam3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 12:44:29 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27TCfFJx43254080
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Aug 2022 12:41:15 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6375111C050;
	Mon, 29 Aug 2022 12:44:26 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9039511C04A;
	Mon, 29 Aug 2022 12:44:25 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.92.230])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 29 Aug 2022 12:44:25 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH] powerpc/pseries/mce: Avoid instrumentation in realmode
From: Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <65A5D2E6-96A7-44E8-8418-B4B5D566D676@linux.ibm.com>
Date: Mon, 29 Aug 2022 18:14:24 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <CEDCF8E6-AE84-4B34-82E1-A88B3C1871B0@linux.ibm.com>
References: <20220829074522.443439-1-ganeshgr@linux.ibm.com>
 <65A5D2E6-96A7-44E8-8418-B4B5D566D676@linux.ibm.com>
To: Ganesh Goudar <ganeshgr@linux.ibm.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 01k4dUro4JkOgIdzk-FUccIhLIVtd19Q
X-Proofpoint-ORIG-GUID: 01k4dUro4JkOgIdzk-FUccIhLIVtd19Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-29_07,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 spamscore=0 mlxscore=0 mlxlogscore=470
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208290058
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
Cc: linuxppc-dev@lists.ozlabs.org, mahesh@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 29-Aug-2022, at 5:02 PM, Sachin Sant <sachinp@linux.ibm.com> wrote:
>=20
>=20
>=20
>> On 29-Aug-2022, at 1:15 PM, Ganesh Goudar <ganeshgr@linux.ibm.com> =
wrote:
>>=20
>> Part of machine check error handling is done in realmode,
>> As of now instrumentation is not possible for any code that
>> runs in realmode.
>> When MCE is injected on KASAN enabled kernel, crash is
>> observed, Hence force inline or mark no instrumentation
>> for functions which can run in realmode to avoid KASAN
>> instrumentation.
>>=20
>> Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
>> ---
>> arch/powerpc/include/asm/interrupt.h | 2 +-
>> arch/powerpc/include/asm/rtas.h      | 4 ++--
>> arch/powerpc/kernel/rtas.c           | 4 ++--
>> 3 files changed, 5 insertions(+), 5 deletions(-)
>=20
> Thanks for the patch. I tested it on top of 6.0.0-rc3. It proceeds =
further but
> eventually crashes after arch_local_save_flags
>=20

Seems like following functions also should be marked as __always_inline

arch_local_save_flags
irq_soft_mask_return
irq_soft_mask_set_return
irq_soft_mask_set

With these additional changes the test successfully runs to completion.

- Sachin=
