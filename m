Return-Path: <linuxppc-dev+bounces-14400-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8A5C772D7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Nov 2025 04:43:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dCLfm01Yfz30Vs;
	Fri, 21 Nov 2025 14:43:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763696623;
	cv=none; b=oexX+Z53xoQXNnCw0FTELrggF2n0+rVw0SmJa/qlEbSNjc9sbC4Xaz7Wep87N6RECrTJoSoNrHrykir+wxG1MLG2G2kTacgsBFigTMVl0m/LWyYC5N0TIAgr8a4Jr+4jSYxfZRtmrnsQHA44KLcxCU248jirjVM/W+75G6Oj+UpUjFPnZsAzs25W4EuJGMiFQ5cgib8T4usEva2a0BuN/W1TakQhzIXFCEGBM360knglYFClOLLdl5iQdgZdbkK3LbqXuYJ+QI8ruQMANDfQ4IAL3WFpqUpaPxcSFI1xL3oJ74DlYPhhXo5D19VYlDYusxtqxFhPF32/jk9OfidXag==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763696623; c=relaxed/relaxed;
	bh=nyBgEDkW5aS3wctIGlFAC6b53ECw/DGW8zX7TgEEDlM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aPy6uBgk6h8qNkLywb13F225RpPM8scZop+mDWqLOYNuKlO5VaEJArGZ9y2g+5HuDyiaFKUe+gm4CDQMkQrwp0LiAy2uyxQyTCeEgkMnCbUmjQ0ZwERLxA2hrSBhuxpLYge7d2hTg5BfZWKgPjHxDkAUq+lzIHbbugz8Y59KCiFWvbqLUT+ZAn0AnNEX90RwFjl0asjFLMOUk6SBlg7g9OozXgomaAKC+SPyQh1IxvrMq9Fj6cbqOGodJZ/7hm2ate1Ymm8Sn6J5ovb8dHYFpyRWJoLC35bkKnclcc4uBoIq4AjNTJ9zXWl0ossDbZvp9/WTE9EK35MH4gvL0/KSqg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fVdcS8Iw; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fVdcS8Iw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dCLfl1bvJz2xqm
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Nov 2025 14:43:43 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AL0vD4Z007084;
	Fri, 21 Nov 2025 03:43:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=nyBgED
	kW5aS3wctIGlFAC6b53ECw/DGW8zX7TgEEDlM=; b=fVdcS8IwuLhV6XuNKJwq1o
	kvH+D1xgEYxDCiszkTP7F7o0c4UTCHxjReBbSgPq2bZPUUNgdJb/045ZFVRnIL3s
	bh7OIHu/75hVRVP0VeqHo5jmelnd2uwJCJcIFADJmXPt8zs4NfAlyNESWg034GFn
	vFzYiAXdVNgT/+BQ2Nq7pKxJfs9Os3wrRySiN7NtFD2yMMzXlM6p1SflK9JhbpLS
	3OmNQStZNnWpphCa/ZAyc0N0xeMS28jjQEPCvbxiNxR+ru4j/v9wW/M2FrCWFkT6
	8ZXyDJPtegIxcilDiaLAE00G1yiJL6t2VG46dxeguo/Z8OS4wx5+qtEDiwImaaXQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejmt0dh7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Nov 2025 03:43:22 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AL3hMEp029714;
	Fri, 21 Nov 2025 03:43:22 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejmt0dh5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Nov 2025 03:43:22 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AL0ZwUE017319;
	Fri, 21 Nov 2025 03:43:21 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4af6j21vn5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Nov 2025 03:43:21 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AL3hJEm27001380
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Nov 2025 03:43:19 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9DB35201A9;
	Fri, 21 Nov 2025 02:53:42 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AABC42019E;
	Fri, 21 Nov 2025 02:53:40 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.in.ibm.com (unknown [9.98.111.108])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 21 Nov 2025 02:53:40 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: christophe.leroy@csgroup.eu, mpe@ellerman.id.au, npiggin@gmail.com,
        aneesh.kumar@kernel.org, Naveen N Rao <naveen@kernel.org>,
        Kunwu Chan <chentao@kylinos.cn>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        Kunwu Chan <kunwu.chan@hotmail.com>
Subject: Re: [PATCH] powerpc/83xx: Add a null pointer check to mcu_gpiochip_add
Date: Fri, 21 Nov 2025 08:23:02 +0530
Message-ID: <176369324787.72695.1578554181887293249.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20240115094330.33014-1-chentao@kylinos.cn>
References: <20240115094330.33014-1-chentao@kylinos.cn>
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
X-Proofpoint-ORIG-GUID: c-hekCwavaTBJ3eai5TOG3XMx6_uAvoy
X-Authority-Analysis: v=2.4 cv=Rv3I7SmK c=1 sm=1 tr=0 ts=691fdfda cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=S3InkHi5bP_ujbdrD0EA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
X-Proofpoint-GUID: E0VyN9hLNJK1oSuD0L3PmuQCwWFSN3Pb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfXzVyzKANjW+2U
 dqcEjbeJ+jyf25KDu/+M3q3g7TvRGN1Ozn6b24odCC33w1C+zWHRCnZhJkxy8bXaglXJDlMHz4S
 Zo0y2vgx69afcYFECK26Eq39OH8BA5xIHfNFOmF0wFMCaa8M4yI8Xd1lSn+tb0QJmGYMiWJRYf/
 MR3aM8YS/oLTKE5hawKpCoqJ4WKa4SxfHH9l/FmgpMHkCea+0OwCtnUZEeTa5gXIr/gCUNdoRms
 SixwOqUCYdGZi8AQgkh6+XSIQnOrseyavo18rCOvStvrShQTJwGg2YbElKgtGVJBmtkbeyB+RIl
 +ipgZevetXr2+27utfeIEehpm18mx+kuCCTdhqfC9wyGmPtnKbvL/EJO1zgj28DqKlnhB+O8UAU
 10oCTW6s+7PgOua3995P0noUEZjYXA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_01,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1011 phishscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511150032
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 15 Jan 2024 17:43:30 +0800, Kunwu Chan wrote:
> kasprintf() returns a pointer to dynamically allocated memory
> which can be NULL upon failure. Ensure the allocation was successful
> by checking the pointer validity.
> 
> 

Applied to powerpc/next.

[1/1] powerpc/83xx: Add a null pointer check to mcu_gpiochip_add
      https://git.kernel.org/powerpc/c/2617bd81ae54128e63e764c48935e572e3dee501

Thanks

