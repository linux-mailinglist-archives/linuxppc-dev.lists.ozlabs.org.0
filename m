Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0D689CDDD
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Apr 2024 23:54:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FyCzFWBN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VD2v303YTz3vhs
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Apr 2024 07:54:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FyCzFWBN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nrb@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VCvQs4m4rz2xQ7
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Apr 2024 02:18:29 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 438FrtPX032330;
	Mon, 8 Apr 2024 16:18:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : content-transfer-encoding : in-reply-to : references : cc :
 to : from : subject : message-id : date; s=pp1;
 bh=HJL/TRvUEDOOlP2eNNp4Hgfo9olRWi1uem16/74jwmo=;
 b=FyCzFWBN7hK43f5D/vi+g45SNsKHlTM4R5sDlCOhpoOnvH+k79XdwKFrCODWNCuLpENl
 suvkyLv6d9bKeqFAy5dkz+SEGck0t6pnyIA8OGdrUZew9JGI9Gsqpv7zCdR4idGOb5AJ
 rfszBYh3mjBSgQA669W4LCwSPkn2bUjmt6ifZy4TNm1MscOd4oUzDGx+WKaUrLx10gfa
 BtTlA/HqyMYzCwmjMwr9pmeTL/IN4BpMy/UrEipn2pu6AlU2J4FW3h9LcrrHQIs3Rn9g
 3iNbvHDNqND2lKGZ98s0yH40DwSZNe2pAhTTgc/bVuLHHIneSHOWvzK6xEDOsXC1vs7F Jg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xcjt685dr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Apr 2024 16:18:18 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 438GEsax030993;
	Mon, 8 Apr 2024 16:18:18 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xcjt685dd-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Apr 2024 16:18:18 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 438FLBtF022587;
	Mon, 8 Apr 2024 16:06:36 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xbhqns0dp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Apr 2024 16:06:36 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 438G6WlW40370560
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Apr 2024 16:06:34 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C94D72004B;
	Mon,  8 Apr 2024 16:06:32 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A375920043;
	Mon,  8 Apr 2024 16:06:32 +0000 (GMT)
Received: from t14-nrb (unknown [9.171.39.74])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  8 Apr 2024 16:06:32 +0000 (GMT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240405083539.374995-7-npiggin@gmail.com>
References: <20240405083539.374995-1-npiggin@gmail.com> <20240405083539.374995-7-npiggin@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>, Thomas Huth <thuth@redhat.com>
From: Nico Boehr <nrb@linux.ibm.com>
Subject: Re: [kvm-unit-tests PATCH v8 06/35] gitlab-ci: Run migration selftest on s390x and powerpc
Message-ID: <171259239221.48513.3205716585028068515@t14-nrb>
User-Agent: alot/0.8.1
Date: Mon, 08 Apr 2024 18:06:32 +0200
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ZaoFmt7ntYkgeBnqU6_u_iHaeyqwty-m
X-Proofpoint-ORIG-GUID: QlQdmXWPyUmtL4R66NXoTtrIqQduudxU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-08_14,2024-04-05_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 clxscore=1015 mlxlogscore=999 phishscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404080126
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

Quoting Nicholas Piggin (2024-04-05 10:35:07)
> The migration harness is complicated and easy to break so CI will
> be helpful.
>=20
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  .gitlab-ci.yml      | 32 +++++++++++++++++++++++---------
>  s390x/unittests.cfg |  8 ++++++++
>  2 files changed, 31 insertions(+), 9 deletions(-)
>=20
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index ff34b1f50..60b3cdfd2 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
[...]
> @@ -135,7 +147,7 @@ build-riscv64:
>  build-s390x:
>   extends: .outoftree_template
>   script:
> - - dnf install -y qemu-system-s390x gcc-s390x-linux-gnu
> + - dnf install -y qemu-system-s390x gcc-s390x-linux-gnu nmap-ncat
>   - mkdir build
>   - cd build
>   - ../configure --arch=3Ds390x --cross-prefix=3Ds390x-linux-gnu-
> @@ -161,6 +173,8 @@ build-s390x:
>        sclp-1g
>        sclp-3g
>        selftest-setup
> +      selftest-migration-kvm

We're running under TCG in the Gitlab CI. I'm a little bit confused why
we're running a KVM-only test here.
