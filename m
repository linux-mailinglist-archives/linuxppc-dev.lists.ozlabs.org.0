Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE9158D147
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Aug 2022 02:16:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M1tsT6Bbhz3bpW
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Aug 2022 10:16:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Bixvy6SZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Bixvy6SZ;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M1trj3cCrz2xHH
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Aug 2022 10:15:48 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2790EIAb022147;
	Tue, 9 Aug 2022 00:15:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=LQMQ8gLGcAPHuHclNQJxodSdscGpgrSIJRmqvc3L1VQ=;
 b=Bixvy6SZ0wuunxQNvplpc4QAKOU623MmUpd9EqlUJufs1VdXWaD8EItlNK7aeoDrc8wR
 y4ALBR+gkc4yBY0dHiJv7lRR9eq/d0p77vNbsXAGjwfdSfatU1jnwrWpeuirjBSG2Xij
 DVA6SWghWD5aggLb4NBbL7A4N5IUtV+STOmrV/sDcGadgrQlx2YgbPs061VqHngdXvdi
 24GPLVgAuYE24LHwfjtM3wmz8aliN16dFETFHXkq4WIxujFNNON1qt8833J4VPCGFyGp
 BZ1DhtRhvC3sNZIMksSywqmo+KquS3gmNJzbMR4KaFveUJzK6DuEwmtju/IOqYqutdjC pA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hucutg0tb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Aug 2022 00:15:38 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2790FcRH028160;
	Tue, 9 Aug 2022 00:15:38 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hucutg0sd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Aug 2022 00:15:38 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27907BZ9023315;
	Tue, 9 Aug 2022 00:15:36 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma04ams.nl.ibm.com with ESMTP id 3hsfx8trh2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Aug 2022 00:15:36 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2790FXA131261082
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 9 Aug 2022 00:15:33 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 95A7CA4060;
	Tue,  9 Aug 2022 00:15:33 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3F8A8A405C;
	Tue,  9 Aug 2022 00:15:33 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue,  9 Aug 2022 00:15:33 +0000 (GMT)
Received: from smtpclient.apple (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 0A491600EE;
	Tue,  9 Aug 2022 10:15:30 +1000 (AEST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH v2 01/14] powerpc: Adopt SYSCALL_DEFINE for arch-specific
 syscall handlers
From: Rohan McLure <rmclure@linux.ibm.com>
In-Reply-To: <83ed398f-ce1b-029f-2788-a4e74af5ffa5@csgroup.eu>
Date: Tue, 9 Aug 2022 10:15:29 +1000
Content-Transfer-Encoding: quoted-printable
Message-Id: <F42133C5-EB83-499B-9D0F-FB974669EDE9@linux.ibm.com>
References: <20220725062420.118013-1-rmclure@linux.ibm.com>
 <34538d4b-2c44-a527-66c8-5049f0176877@csgroup.eu>
 <59FC80E2-27E0-43AD-854E-4F351E13E9E2@linux.ibm.com>
 <83ed398f-ce1b-029f-2788-a4e74af5ffa5@csgroup.eu>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: dpvLeozKkbw6Wq4yt0gBSdqvvUJH31_U
X-Proofpoint-ORIG-GUID: jDKV7q0lVWKqRE-YqdINZELsEXLpGWRS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-08_13,2022-08-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208080105
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "npiggin@gmail.com" <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> Well, of course we need the patch build, so SYSCALL_DEFINE and=20
> COMPAT_SYSCALL_DEFINE have to go with the name changes, that's =
obvious.
>=20
> My comment was more related to changes like the renaming of=20
> ppc64_personality() to do_ppc64_personality() and the creation of=20
> sys_ppc64_personality() and compat_....
> That could be a patch by itself.
>=20
> Also patch 4 could go up front in order to avoid renaming a function =
you=20
> are removing in a follow-up patch.
>=20
> So as a summary, do all preparation up front of patch 1, in order to=20=

> keep it as minimal.

Thanks. I=E2=80=99ll split up this commit accordingly.=
