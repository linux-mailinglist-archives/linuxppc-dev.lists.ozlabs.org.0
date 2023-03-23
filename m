Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4046C5DBA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 05:01:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Phs8d2TQHz3c7Q
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 15:01:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=q8OaTEp9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=q8OaTEp9;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Phs7c2tmsz3bhC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Mar 2023 15:00:28 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32N22QuC009616;
	Thu, 23 Mar 2023 04:00:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=8+ulKWc12LGOT1MlXARSAyMUCXuUnPG+tmHx05jVU/U=;
 b=q8OaTEp9bqKzD3U9wnAJ/Lk74RZRY/Sngbye9lyTg2U1dFbhQTiHS9AreH4C0282ThEy
 GACc6dyMD97GMiZYYqlklZmTrzKffi08+ccE35nwk9OJhQtgpIqeK3YUR4xzgPLC0IOs
 sfZ+XE794FRfsxs0xsIkbN/L+aDT6pbF2m2SoAAJLggtxnmag14QxqX1zLSLHkDAQbIQ
 MkkSp401IP20PKB4ZrBw7AvhPFJ7oA/tM4YYoPx3Jjp5cQwopbBWcIrXLQapyL01yRsv
 O+hoe0zBM2zhfThTNCCM9RK27KBKgUwvr4dMK27ZPC/9T07hf4qpDsU2yOfSFi5tcsWf RQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pg4hw7aqn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Mar 2023 04:00:19 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32N3imi1027525;
	Thu, 23 Mar 2023 04:00:18 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pg4hw7ank-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Mar 2023 04:00:18 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32MGuX3A022346;
	Thu, 23 Mar 2023 04:00:14 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3pd4x6espc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Mar 2023 04:00:14 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32N40C9027853348
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Mar 2023 04:00:12 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 515022004E;
	Thu, 23 Mar 2023 04:00:12 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C51A92004D;
	Thu, 23 Mar 2023 04:00:11 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 23 Mar 2023 04:00:11 +0000 (GMT)
Received: from [10.61.2.128] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 0DC9660217;
	Thu, 23 Mar 2023 15:00:10 +1100 (AEDT)
Message-ID: <67a5240df616de97f526049ef2aad8493cc3ab38.camel@linux.ibm.com>
Subject: Re: [PATCH 1/8] powerpc/rtas: ensure 8-byte alignment for struct
 rtas_args
From: Andrew Donnellan <ajd@linux.ibm.com>
To: nathanl@linux.ibm.com, Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas
	Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Date: Thu, 23 Mar 2023 15:00:09 +1100
In-Reply-To: <20230220-rtas-queue-for-6-4-v1-1-010e4416f13f@linux.ibm.com>
References: <20230220-rtas-queue-for-6-4-v1-0-010e4416f13f@linux.ibm.com>
	 <20230220-rtas-queue-for-6-4-v1-1-010e4416f13f@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -3gtlw1WNYh5vZIq7VEXCVDKXWLwvEGO
X-Proofpoint-GUID: ysTph4lEkoWkfi_iPeghfBqktMv6j--N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-22_21,2023-03-22_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 adultscore=0 mlxscore=0 mlxlogscore=999 impostorscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303230025
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, Scott Cheloha <cheloha@linux.ibm.com>, Laurent Dufour <ldufour@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Nick Child <nnac123@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2023-03-06 at 15:33 -0600, Nathan Lynch via B4 Relay wrote:
> > From: Nathan Lynch <nathanl@linux.ibm.com>
> >=20
> > CHRP and PAPR agree: "In order to make an RTAS call, the operating
> > system must construct an argument call buffer aligned on an eight
> > byte
> > boundary in physically contiguous real memory [...]." (7.2.7
> > Calling
> > Mechanism and Conventions).
> >=20
> > struct rtas_args is the type used for this argument call buffer.
> > The
> > unarchitected 'rets' member happens to produce 8-byte alignment for
> > the struct on 64-bit targets in practice. But without an alignment
> > directive the structure will have only 4-byte alignment on 32-bit
> > targets:
> >=20
> > =C2=A0 $ nm b/{before,after}/chrp32/vmlinux | grep rtas_args
> > =C2=A0 c096881c b rtas_args
> > =C2=A0 c0968820 b rtas_args
> >=20
> > Add an alignment directive to the struct rtas_args declaration so
> > all
> > instances have the alignment required by the specs. rtas-types.h no
> > longer refers to any spinlock types, so drop the spinlock_types.h
> > inclusion while we're here.
> >=20
> > Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>

Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>

> > ---
> > =C2=A0arch/powerpc/include/asm/rtas-types.h | 5 +++--
> > =C2=A01 file changed, 3 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/arch/powerpc/include/asm/rtas-types.h
> > b/arch/powerpc/include/asm/rtas-types.h
> > index f2ad4a96cbc5..861145c8a021 100644
> > --- a/arch/powerpc/include/asm/rtas-types.h
> > +++ b/arch/powerpc/include/asm/rtas-types.h
> > @@ -2,7 +2,8 @@
> > =C2=A0#ifndef _ASM_POWERPC_RTAS_TYPES_H
> > =C2=A0#define _ASM_POWERPC_RTAS_TYPES_H
> > =C2=A0
> > -#include <linux/spinlock_types.h>
> > +#include <linux/compiler_attributes.h>
> > +#include <linux/sizes.h>
> > =C2=A0
> > =C2=A0typedef __be32 rtas_arg_t;
> > =C2=A0
> > @@ -12,7 +13,7 @@ struct rtas_args {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0__be32 nret;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0rtas_arg_t args[16];
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0rtas_arg_t *rets;=C2=A0=
=C2=A0=C2=A0=C2=A0 /* Pointer to return values in
> > args[].
> > */
> > -};
> > +} __aligned(SZ_8);

Nowhere else in the kernel uses __aligned(SZ_8) over just __aligned(8),
which I suppose would also save an include, but I don't care either
way.

> > =C2=A0
> > =C2=A0struct rtas_t {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned long entry;=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* phy=
sical address pointer
> > */
> >=20

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

