Return-Path: <linuxppc-dev+bounces-12499-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC61B8F088
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Sep 2025 07:44:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cVX9Q0CLNz3cYg;
	Mon, 22 Sep 2025 15:44:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758519849;
	cv=none; b=efZrDyqk6fraDEWBk1JciQfuomvkIAuxok29iw+wORibR+mcJiDQcP2p3U42nUYnLyt4aSQtAEd/do3A8P94YiHtuv2RRiKgbON0TYwTAV5IjTh+RVFNUVKcavDrO3RzaObwIV2pJ/MaNTGKf5ccC1BDvyS1HNRcEwoU61KUEq7ddTGv/6qTM2vjqCOfQe1uFubFQAgTOaKFGGeFLV8J06CXjtMuK9MCqwBnsrTSJfYHBEOF2N4VmAfkOD+rAqGofvkzT2MlBfqfnN4wzndeVa1sUu4am7beNE4mPAH7duzfagtEURpZa82PDGUm1ANeVE87hWu2XgIEHVIgsNoaUg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758519849; c=relaxed/relaxed;
	bh=enJx/Ac3humzk/ZKlgLiNAoXd9mGlNE20ad4VyCQsnI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hatOnt9X2L3e5Gl6/hp6sDj+oC3WncEPAewsSO+Zg6Oc+ef1oiX5OVQY5IJXS/gHje/yBCRzdh0EN54V4vdku9Uq+78p96KeXV62nOQkH+xKpRUf8GroBzM84Pkvc8vIR8aylNdhWUbDGnpPhc7NALYbbZ00YxunRCvzL6ZI8L6Ucn94hrZS7uIckRXE7+GwG/KtPV0vdDwIOkUvPP/LbYTGfuwOpqxm+18ICtWifKGPNJ3gxr6hzUEINUy3cZrQXxcODeLVbbKmhjOeNKlShBlfCb2jNSTSIooP4FYq219G/HbwoBUnfoptbwPktesdoc6RXG993MZBi/1EKpLXOw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WIF3Uh9k; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WIF3Uh9k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cVX9P2rdXz3cQx
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Sep 2025 15:44:09 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58LLnkqN015154;
	Mon, 22 Sep 2025 05:44:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=enJx/A
	c3humzk/ZKlgLiNAoXd9mGlNE20ad4VyCQsnI=; b=WIF3Uh9kDdk15u7lh0CFd7
	oWB0HDZblSz4P/TIHRPy7KmrhLINWNDG8ILJKymF+CxupdGAkFC7a4BwNvkfdDab
	3DPI1DXGNURaSXZ2klG8C6XoegWuqeq0rIBtZAJWd2rUdrXepfQR+X1iHrpof6qM
	pewu39DDaqiLBAy0oAnaYgERS77AxGzFlEWVlqh3cXQbje4GhukWf0aLJ7/ATSKn
	ECGMWqyQ1n/3fJf/xLnSNb+WeOYKaQsHpA1wvDcM+QzgXMTo4AzoKhTmQwUQTOMR
	4DBr6wfkJ8RndffNyoiu3hEUf2dnUigsOwyxdM0rTLq4NPc5HLSaY+rYc2iA+i4A
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 499ksbgu2n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Sep 2025 05:43:59 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58M5eGkA021784;
	Mon, 22 Sep 2025 05:43:59 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 499ksbgu2k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Sep 2025 05:43:59 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58M40BMS008284;
	Mon, 22 Sep 2025 05:43:58 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 49a6yxmqqf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Sep 2025 05:43:58 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58M5huMN47055192
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 22 Sep 2025 05:43:56 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1035820043;
	Mon, 22 Sep 2025 05:43:56 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 73E6620040;
	Mon, 22 Sep 2025 05:43:54 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.82.69])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 22 Sep 2025 05:43:54 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Erhard Furtner <erhard_f@mailbox.org>
Subject: Re: [PATCH v2] powerpc/32: Remove PAGE_KERNEL_TEXT to fix startup failure
Date: Mon, 22 Sep 2025 11:13:53 +0530
Message-ID: <175851974398.1538174.8962787308474262577.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <8e2d793abf87ae3efb8f6dce10f974ac0eda61b8.1757412205.git.christophe.leroy@csgroup.eu>
References: <8e2d793abf87ae3efb8f6dce10f974ac0eda61b8.1757412205.git.christophe.leroy@csgroup.eu>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: sd7LSJ5BqScI6yS5UOCJ3A1cQ6NaMYqw
X-Proofpoint-GUID: oMEvlbNrC22GIy-STSYlnVkD8KT2yXKA
X-Authority-Analysis: v=2.4 cv=SdH3duRu c=1 sm=1 tr=0 ts=68d0e21f cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=YSDXRy84u5p_4GsqoPcA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyMCBTYWx0ZWRfX8WJLDuJ4G68f
 TEOQDTqyTXGQCxRiV/NJJzgPMS5+WbUiqEFoBa2oGEOAv5Jf6hzFHX0ngyCjDbgvueOhLT4tajp
 a+xP41zBSifleb9CLP0kn3tNuvF/RjdRfmzg6QDhR/Mv15OEWm1Te237bxPRl55aU5gRgf7q3yg
 Bp4tLkyGxygWoTsY4k2VgKRXkKBrQ0cknPcXcm4iRD5bxwCgMIMtYLbjHPX/eK39aH0yQi5KQ46
 CQ2k4CKIYU3fLwQZK9JdO05pHft1p5yky1YBmMIyfAcxZQCX3JbVczKlZ4T4jxrSxBnukuIZKAn
 fHqEFVb2jdV64o34H5Z1grdFDAxW4sUZLkVrGuqhpzAbuzYseEnwWP2mlw8KNiZeyWF0B1ITmnc
 eSwGxXao
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-21_10,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200020
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 09 Sep 2025 12:03:49 +0200, Christophe Leroy wrote:
> PAGE_KERNEL_TEXT is an old macro that is used to tell kernel whether
> kernel text has to be mapped read-only or read-write based on build
> time options.
> 
> But nowadays, with functionnalities like jump_labels, static links,
> etc ... more only less all kernels need to be read-write at some
> point, and some combinations of configs failed to work due to
> innacurate setting of PAGE_KERNEL_TEXT. On the other hand, today
> we have CONFIG_STRICT_KERNEL_RWX which implements a more controlled
> access to kernel modifications.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/32: Remove PAGE_KERNEL_TEXT to fix startup failure
      https://git.kernel.org/powerpc/c/9316512b717f6f25c4649b3fdb0a905b6a318e9f

Thanks

