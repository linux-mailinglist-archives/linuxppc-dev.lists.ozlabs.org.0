Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8369592703
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Aug 2022 02:00:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M5ZCj4PBcz3c6P
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Aug 2022 10:00:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tHbIvVV6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tHbIvVV6;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M5ZBy4MYYz2ypC
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Aug 2022 09:59:21 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27ELgp3i009571;
	Sun, 14 Aug 2022 23:59:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=c3bNm4Y8pbpFteWBh8CmSIraoSrg0qqIHfqidAg5pK8=;
 b=tHbIvVV6GUCGwbi/tnkK7JYJx8L2C7dIbhv9L76sJ4OWYD/oRkMq5n2YmyvIyiuDud/f
 HkaaFaVIAdXZJE4nujO6e+og0UPnAohF48XUwCJi9bgZXLEP5vvada1M05TX0DCog+yp
 VlzTPxoVZd87wbyRTInbKEwZDzhd6j8OeYjdRAioaCpk9+SHDrzJoWkje3lSWQDOgaF5
 Q4+6nSkX5VkhrGGM8U/iOg1TiiMYNkD+4iLrh4FO7UP+GcAFooxLYxjDAh4qREeSt+k/
 tvenKRAQf+GvCsW7q5h9a9UTLywo0TPu+O7M0LUvYdMhsh0BrS400VWY2RntkbUf/Pjb UQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hy972a11m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 14 Aug 2022 23:59:12 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27ENfhhH016302;
	Sun, 14 Aug 2022 23:59:12 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hy972a111-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 14 Aug 2022 23:59:12 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27ENpHDQ003821;
	Sun, 14 Aug 2022 23:59:09 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma04fra.de.ibm.com with ESMTP id 3hx3k8s2er-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 14 Aug 2022 23:59:09 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27ENuRZj32178634
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 14 Aug 2022 23:56:27 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 35A6D5204F;
	Sun, 14 Aug 2022 23:59:07 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id D38D95204E;
	Sun, 14 Aug 2022 23:59:06 +0000 (GMT)
Received: from smtpclient.apple (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id CBA35600A8;
	Mon, 15 Aug 2022 09:59:01 +1000 (AEST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH v2 11/14] powerpc/64s: Clear/restore caller gprs in
 syscall interrupt/return
From: Rohan McLure <rmclure@linux.ibm.com>
In-Reply-To: <20220811154751.GG25951@gate.crashing.org>
Date: Mon, 15 Aug 2022 09:59:01 +1000
Content-Transfer-Encoding: quoted-printable
Message-Id: <D85E8A64-456B-4334-9C97-29A56936E22A@linux.ibm.com>
References: <20220725063111.120926-1-rmclure@linux.ibm.com>
 <20220811151302.GF25951@gate.crashing.org>
 <cd3f5a35-dfda-ef2e-dd13-93d5c4011f16@csgroup.eu>
 <20220811154751.GG25951@gate.crashing.org>
To: Segher Boessenkool <segher@kernel.crashing.org>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: v7kpAWt-Sg9f8vI63YXBsYtAaSXUMJ17
X-Proofpoint-GUID: PCqyZyClRJaIf7V2jOI95rZjBDcGZs_S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-14_15,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2207270000 definitions=main-2208140101
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

>>> "Nullify" means "invalidate", which is not what this does or is for =
:-(
>>=20
>> Would "Zeroise" be more appropriate ?
>=20
> That is probably a good compromise, yes.  It obviously is a verb, its
> meaning is clear and unamiguous, and there is precedent for it even =
:-)

Zeroise it is. The =E2=80=98zeroize=E2=80=99 spelling exists already in =
the kernel so I=E2=80=99ll use that.

Rohan=
