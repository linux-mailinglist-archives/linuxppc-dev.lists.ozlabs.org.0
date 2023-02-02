Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F38D68764B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Feb 2023 08:16:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P6qp93QxHz3cj6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Feb 2023 18:16:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mQY5Ke86;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mQY5Ke86;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P6qnB2qy8z3cdr
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Feb 2023 18:15:25 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31260Gph014142;
	Thu, 2 Feb 2023 07:15:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=E17QNf+yNbHO7IakPpjGZM+MnNtXuwIKnTwAea79zuo=;
 b=mQY5Ke86zY/j06nR/FZYQBTK0b6+9og7Wcg+O4PXCKAILhfPgwCaOA9RtBNivhiiv0ad
 hUcFItM6zwDUiQz6dPog6S2xoqPYX3bTbsBkOqLG1d1Ijl5DjYjSFJqM+Iwl++A7QGWP
 s0kgyu4LjDCrbIpr5T96g6nTL1r9u2qiAx3lCbfIOFt/rZL4dMDbx6q2BQCNpaPgOzhh
 WMua5ozlERzkk6qGYCE7kEsqsKb4l0XATK7t+mxXOVj+AadasmqJWYTGNH75e2q7vmYx
 Y2GJKOl5hsVKH/ev3n6ziCNGdPJbQJF2r9RSbkTldV4NcsYi25FXQm2ZdXP7vLbO1qz8 Yw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ng7hbhe9a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Feb 2023 07:15:20 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3126xaWN025051;
	Thu, 2 Feb 2023 07:15:20 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ng7hbhe8c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Feb 2023 07:15:19 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 311JCYvj012873;
	Thu, 2 Feb 2023 07:15:18 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3ncvtydtrd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Feb 2023 07:15:18 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3127FFVJ18874994
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 Feb 2023 07:15:15 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B283B2004D;
	Thu,  2 Feb 2023 07:15:15 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 33AAD20040;
	Thu,  2 Feb 2023 07:15:15 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  2 Feb 2023 07:15:15 +0000 (GMT)
Received: from [10.61.2.128] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id E803C60112;
	Thu,  2 Feb 2023 18:15:09 +1100 (AEDT)
Message-ID: <a4783d1674642d398c7d922f1725c9473daf5652.camel@linux.ibm.com>
Subject: Re: [PATCH v2 4/4] powerpc/rtas: upgrade internal arch spinlocks
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Thu, 02 Feb 2023 18:15:09 +1100
In-Reply-To: <20230124140448.45938-5-nathanl@linux.ibm.com>
References: <20230124140448.45938-1-nathanl@linux.ibm.com>
	 <20230124140448.45938-5-nathanl@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: FvNQgrnUCNFbOko5gWd4M7soNdR6IM2M
X-Proofpoint-ORIG-GUID: -p4Aqnq5Fv00mWeSa2OuTCGDa4540msv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-01_15,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=804 suspectscore=0 mlxscore=0 spamscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 bulkscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302020066
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
Cc: ldufour@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2023-01-24 at 08:04 -0600, Nathan Lynch wrote:
> At the time commit f97bb36f705d ("powerpc/rtas: Turn rtas lock into a
> raw spinlock") was written, the spinlock lockup detection code called
> __delay(), which will not make progress if the timebase is not
> advancing. Since the interprocessor timebase synchronization sequence
> for chrp, cell, and some now-unsupported Power models can temporarily
> freeze the timebase through an RTAS function (freeze-time-base), the
> lock that serializes most RTAS calls was converted to arch_spinlock_t
> to prevent kernel hangs in the lockup detection code.
>=20
> However, commit bc88c10d7e69 ("locking/spinlock/debug: Remove
> spinlock
> lockup detection code") removed that inconvenient property from the
> lock debug code several years ago. So now it should be safe to
> reintroduce generic locks into the RTAS support code, primarily to
> increase lockdep coverage.
>=20
> Making rtas_lock a spinlock_t would violate lock type nesting rules
> because it can be acquired while holding raw locks, e.g. pci_lock and
> irq_desc->lock. So convert it to raw_spinlock_t. There's no apparent
> reason not to upgrade timebase_lock as well.
>=20
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>

I'm no locking expert but this looks reasonable from a quick read-
through.

Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited
