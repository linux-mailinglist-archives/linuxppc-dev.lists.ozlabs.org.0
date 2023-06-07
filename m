Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9DF725BBE
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jun 2023 12:43:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QbkTV03XTz3dwL
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jun 2023 20:43:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=a0IIZMyx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=a0IIZMyx;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QbkSZ3Hlrz3brK
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Jun 2023 20:42:38 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 357AgY71011563
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 7 Jun 2023 10:42:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=Ixp2UG4NVcjJLv129PkHIBNOBcj2+i7tNuUA1ZplUdc=;
 b=a0IIZMyxI+kwcdEWI3+6/dCYNf4Oh6ObDlq52t7+UAQocgZP95Meyyp54Rg8+FvWC+5p
 nZiO1yqT0S2RRDLXfqndd3A3lEO+8XXJNuKnW/dCX14B2s6jZmrKutmU9mFju3dun5E4
 ibKVC8SLU8TzEdlzjbrJ1Y8bEXPDy1lcjrwB/WvlusXVA3xOpagstAstlbntAL7aCjdi
 EjWconWsIR41i6wrUGqvkjaJkIrm/qo2LQSl3I/goyqyc8qS4IcdBtU1a+8J400ArD4K
 MdcFvcXBBnL6RyFn6pxKtAre9sloZIKabv8A0tcIR5Gd3tWPEjJJHU7U7ZZdtz8OUMO4 GQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r2rccg01q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jun 2023 10:42:35 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 357AgZfQ011584
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 7 Jun 2023 10:42:35 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r2rccg016-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Jun 2023 10:42:35 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3578UMVB001589;
	Wed, 7 Jun 2023 10:42:32 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3r2a798938-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Jun 2023 10:42:32 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 357AgTRi44499254
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 7 Jun 2023 10:42:29 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 199D120067;
	Wed,  7 Jun 2023 10:42:29 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6F61120043;
	Wed,  7 Jun 2023 10:42:28 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.109.241.192])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  7 Jun 2023 10:42:28 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.600.7\))
Subject: Re: [PATCH] powerpc/64s: Fix VAS mm use after free
From: Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <20230607101024.14559-1-npiggin@gmail.com>
Date: Wed, 7 Jun 2023 16:12:17 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <4808683A-2BDD-441D-9A9F-D02A58520B7D@linux.ibm.com>
References: <20230607101024.14559-1-npiggin@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>
X-Mailer: Apple Mail (2.3731.600.7)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: mceaNl1mJqkT8-t-6TZYsLoZLt4JFrfr
X-Proofpoint-ORIG-GUID: 3CdrISkK_exHezwIslb-Sj6iRAuhqNdO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-07_06,2023-06-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=963 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306070086
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
Cc: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 07-Jun-2023, at 3:40 PM, Nicholas Piggin <npiggin@gmail.com> wrote:
>=20
> The refcount on mm is dropped before the coprocessor is detached.
>=20
> Reported-by: Sachin Sant <sachinp@linux.ibm.com>
> Fixes: 7bc6f71bdff5f ("powerpc/vas: Define and use common vas_window =
struct")
> Fixes: b22f2d88e435c ("powerpc/pseries/vas: Integrate API with =
open/close windows")
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
> How's this for fixing your vas_deallocate_window warning at
> radix_tlb.c:991 ?
>=20
> I added a few new warnings in the TLB flush code recently which is
> why these new warns are showing up.
>=20

Thanks Nick. This fixes the reported warning.
Nx-gzip as well as mce error inject tests completed successfully.

Tested-by: Sachin Sant <sachinp@linux.ibm.com>

- Sachin
