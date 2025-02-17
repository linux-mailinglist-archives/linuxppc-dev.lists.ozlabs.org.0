Return-Path: <linuxppc-dev+bounces-6251-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A50DEA37C29
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2025 08:28:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YxDlk3bNLz306x;
	Mon, 17 Feb 2025 18:28:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739777298;
	cv=none; b=a8/XfI9ch1N59bzvHZL7x/wpr/IZsKJq9tTfP12nBMb/+7QCf/dKka5NGQi0IoWXBfudXD+0Xb4+K91lWdpHK4Rzz9z3zIC+D92AYCds2d8mRjtOZ4sJmsk65zDiGPgE1DnQy4JUYniaUocUspjk+U4XsPlKCzrFdzticpsO8KBszhzudk+P5UEWmHgs5hsNRhpefZvayEHNP1/iBFGw6y9h1t337yOXHfre0S68/iiQwfGtk9pEN0ooixyEHeGEXDwjpHjIuqUkT2KcG6P8NUZWwbD7iQ/6zJjSs5S6u+4Lalwh4Xs/tmGZrNDjb7DA3iYnRouLuLFd8AcK1Sh2+w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739777298; c=relaxed/relaxed;
	bh=AUQ4ZT0ezdf1y1BTYbOrpPMtzu4KmXhJDB/UkGqe44Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XkqZWSJzyoD4AFxhp2DbjLy9WXO9L0FqQm1htsZujWhWhSJEjRUJGvVZBeFT1QG9WAWe1ESX9nNgNUouUX8gktNeYv6TRRx0VSZ6MvIKDr9B2QeWvhYczdaOiXAAlNQgbXsFaJZjJFZwoNEl/xRvyQo44qEmXPVB5JddTOF6xNeCJORrvUGh0E+8Ej4pImyW4qoProeBAtYgxRmQCO8hDg1QwBL33rxxrecXCMbOUXR3C7xb5jYTzsSl1a7vTWsczMSWP7U2Q3g847qvpiG/2qsEQRVUCoJ2rKubDfFi70oicK/NFcmgqIz8PVZgu1jkHrePpRextMYNRbvm9HpMgQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QFaKzDuE; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QFaKzDuE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YxDlj5dNZz2xs7
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 18:28:17 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51H5OIts031818
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 07:28:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=AUQ4ZT
	0ezdf1y1BTYbOrpPMtzu4KmXhJDB/UkGqe44Q=; b=QFaKzDuEM90CiAKu8E+yt6
	oM5QAKHj02mwUV37pGpZWCtcS6zlXMlOmyMzrAQrDeb3IEY1wLcQZJiSYGmmoYw0
	RKLhYCujCKT4AUZ6aXTksH7lSG3m4ZskkXYqfsjujI+tVcXr/MgJOjGCCJ7mwXYt
	iMwHf8SCE/ipBkFw7kixE1dzlhSv5a42jD6nRFeYE+pp5+AWYzG7j9aY1N7mqTx2
	Pnw7ZABKdt3faePciZkbG0lHE4gCTauKnEB1Lw4hxSKmH1tAmCSkEbZAg06mhaMn
	0u9PpeZ/QcgdEXwzAZF++GYjUOBecXc091ppb19T582N9tkRBJwfmknM3aWQlh6A
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44uxx7rgcy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 07:28:15 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51H41EdI003990
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 07:28:14 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44u68nn09c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 07:28:14 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51H7SAVN47251860
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Feb 2025 07:28:10 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8F66920063;
	Mon, 17 Feb 2025 07:28:10 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AC8C420043;
	Mon, 17 Feb 2025 07:28:07 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.79.72])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 17 Feb 2025 07:28:07 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, hbathini@linux.ibm.com
Cc: kjain@linux.ibm.com, disgoel@linux.vnet.ibm.com
Subject: Re: [PATCH V2 1/5] tools/testing/selftests/powerpc: Enable pmu selftests for power11
Date: Mon, 17 Feb 2025 12:58:05 +0530
Message-ID: <173977700763.476837.6578168086877759464.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250113075858.45137-1-atrajeev@linux.vnet.ibm.com>
References: <20250113075858.45137-1-atrajeev@linux.vnet.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 1dB8e_5u8YdcA8PVhzWrakM1KWhzIx9c
X-Proofpoint-ORIG-GUID: 1dB8e_5u8YdcA8PVhzWrakM1KWhzIx9c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_03,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0 mlxlogscore=553
 lowpriorityscore=0 malwarescore=0 mlxscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502170060
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, 13 Jan 2025 13:28:54 +0530, Athira Rajeev wrote:
> Add check for power11 pvr in the selftest utility
> functions. Selftests uses pvr value to check for platform
> support inorder to run the tests. pvr is also used to
> send the extended mask value to capture sampling registers.
> 
> Update some of the utility functions to use hwcap2 inorder
> to return platform specific bits from sampling registers.
> 
> [...]

Applied to powerpc/next.

[1/5] tools/testing/selftests/powerpc: Enable pmu selftests for power11
      https://git.kernel.org/powerpc/c/fd4d2f325192a11b0bff8bf6226285a821bf38db
[2/5] tools/testing/selftests/powerpc: Add check for power11 pvr for pmu selfests
      https://git.kernel.org/powerpc/c/520ee327c59d37c5520b177404f57c974cc098cc
[3/5] tools/testing/selftests/powerpc/pmu: Update comment description to mention ISA v3.1 for power10 and above
      https://git.kernel.org/powerpc/c/43751c3ce276afc475fea769ae2abf690d5f4b91
[4/5] selftests/powerpc/pmu: Add interface test for extended reg support
      https://git.kernel.org/powerpc/c/9785def2593c7c62fa3271d740eef0e1d1874ef4
[5/5] selftests/powerpc/pmu: Update comment with details to understand auxv_generic_compat_pmu() utility function
      https://git.kernel.org/powerpc/c/c96b1402cc8fe818b0aaaee280221a5e7b6b2242

Thanks

