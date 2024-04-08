Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3400689CDDC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Apr 2024 23:54:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Hh11yg9T;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VD2tF721mz3vgN
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Apr 2024 07:54:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Hh11yg9T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nrb@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VCvFb75L9z3d2n
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Apr 2024 02:10:27 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 438FtSQ9031182;
	Mon, 8 Apr 2024 16:10:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : content-transfer-encoding : in-reply-to : references : cc :
 to : from : subject : message-id : date; s=pp1;
 bh=t2oqjx5y/bBLhaRIy5Vdy9J7ShKMCKJHfkQkT+d6L4Y=;
 b=Hh11yg9TuKe3E8XnAing+WIuw2cM+LaBVSaaTqIAOzfi4P9Vl8VSFGcXAaVOz8omcawi
 rbP6hQAEuvDLEMowVta9QLm+XmUSHPc+l72fpk1HxF9kjozLmvTc++iURJAbdND+r7A+
 3oH+cJ6pxVxNpcTsO8g7W3aT5G6BExqL1WSMO4wUW1MXTJ1MWZgn8QvUx6gvUyQZC3B1
 E9IREybAFBMF7hxqqWEM/vUSIabu2jzJd2HcfM/ldL14UKzkpfnZ6U46DUO+UGDT/RNI
 p5K5T9bkqwsYZqXajKRVQzwL6/6s+vEpsOrFhT/yocneioAnEPSHsh4VIZRoDLqq/SuQ GA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xck8082s4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Apr 2024 16:10:22 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 438G8iQx020506;
	Mon, 8 Apr 2024 16:10:22 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xck8082s0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Apr 2024 16:10:22 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 438EZj9w013550;
	Mon, 8 Apr 2024 16:10:21 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xbgqt98y5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Apr 2024 16:10:21 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 438GAH0O34734746
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Apr 2024 16:10:19 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 85D4420040;
	Mon,  8 Apr 2024 16:10:17 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5F0832004B;
	Mon,  8 Apr 2024 16:10:17 +0000 (GMT)
Received: from t14-nrb (unknown [9.171.39.74])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  8 Apr 2024 16:10:17 +0000 (GMT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240405083539.374995-14-npiggin@gmail.com>
References: <20240405083539.374995-1-npiggin@gmail.com> <20240405083539.374995-14-npiggin@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>, Thomas Huth <thuth@redhat.com>
From: Nico Boehr <nrb@linux.ibm.com>
Subject: Re: [kvm-unit-tests PATCH v8 13/35] doc: start documentation directory with unittests.cfg doc
Message-ID: <171259261691.48513.14896006668285709723@t14-nrb>
User-Agent: alot/0.8.1
Date: Mon, 08 Apr 2024 18:10:16 +0200
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: LagbMeRnhD-pqaI5ovZSd4tYgMaYyJis
X-Proofpoint-GUID: wSiV3cAFIYsX_S7sme6Z-MALI3DUO7vi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-08_14,2024-04-05_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 mlxlogscore=875 priorityscore=1501 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404080124
X-Mailman-Approved-At: Tue, 09 Apr 2024 07:52:16 +1000
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
Cc: Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Quoting Nicholas Piggin (2024-04-05 10:35:14)
> Consolidate unittests.cfg documentation in one place.
>=20
> Suggested-by: Andrew Jones <andrew.jones@linux.dev>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arm/unittests.cfg     | 26 ++-----------
>  docs/unittests.txt    | 89 +++++++++++++++++++++++++++++++++++++++++++
>  powerpc/unittests.cfg | 25 ++----------
>  riscv/unittests.cfg   | 26 ++-----------
>  s390x/unittests.cfg   | 18 ++-------
>  x86/unittests.cfg     | 26 ++-----------
>  6 files changed, 107 insertions(+), 103 deletions(-)
>  create mode 100644 docs/unittests.txt

This is a nice improvement, thanks!

Reviewed-by: Nico Boehr <nrb@linux.ibm.com>
