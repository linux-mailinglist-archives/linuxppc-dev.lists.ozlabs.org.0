Return-Path: <linuxppc-dev+bounces-12050-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E3AB5413D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Sep 2025 05:56:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNLFS1vkdz3ccr;
	Fri, 12 Sep 2025 13:56:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757649372;
	cv=none; b=fBg0IB9IeaZi9gWudVEitsIEP7XjZpojovOJzhuFvzGP2H0oCu5XWDFAwE/2p8NYTzHetpD2ivXaB9eM9peE4/pb0d8HbYBvZuQeuD7QUS+eLWjcVkKOznEF77/Ke8FaurORghhGaakS7XlsSTFAPb2cWekxOkreRSBR+Nbmwvle++UO4fzYlBafu49v+Byn3HPisZyI8BHWYgV5rKLSaDAKejchTG/+dGXpqH5svhUf4GHeJQP2BQ4lP5eeb06Xoso93CyXFd45LDg0g0MMIeIyt57RbQRwsTh3FekstjXDqCOUjo8PKM6bF6z8hnGxKCmVf/XDuVNigRq+b6k2wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757649372; c=relaxed/relaxed;
	bh=B+lCbuIOH4KsblSKkytZGX2JEQmS896+Po7sLTH0XI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TwR0SReg4zMunHZoyDjYPs9P7W0HKN4MmmmH9x9MlGXF8zjPrENU4YTcGNAPFANnkiZoLgKJ2Rs7VSNjBBWAyV7q8TZRSlwq1F5a9KP4nlrwtbGN1AwfR7zDXP8gZBZIaKREVPhVDjaU47+OqOCj+qo43rhpfY4jK3Yb6iftPFM8P5ISxHhsfXs/v3o1Ey3s8jqZgDqm6Ozpje1VQzoe5b1JMtNPMpCcUFr58qLDkz/+mYD7/4Rmd2TTquLOA6uT9Mo50e142QQP1tnWIAS5baPK/TK4TEZSdaJUeRDA+W5b88BO2CjlJ3keSO07amwt+axSb7js7x5Gwseu4s7HGA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IKj7qR/+; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IKj7qR/+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNLFR38Wtz3cbt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 13:56:11 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BMtGwZ003803;
	Fri, 12 Sep 2025 03:55:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=B+lCbu
	IOH4KsblSKkytZGX2JEQmS896+Po7sLTH0XI4=; b=IKj7qR/+9PnVym71F0Yarn
	IK3sX2Fgr/XVwV60Ufe+qWtXiwEnWKWXuEEr4hAPG+MrOMcoE6zKzxK7Vri19hw2
	mG4diINJsTrXhsXKCGS/nHxYq+0+C53M8FofT/A+0eYREK1N9+8hporUizqrrN6v
	xzNdJD9SU/4z1y3d4BiVg17hHYJ/iupaRg27p8GMoUToJcRtOeB+SqFwSR39MdMy
	BAhEr07agpeVV11JQwxiskNCgi2geNCqPPJgCsswLK6YP1RzGjHOxYyaa3wwxOtG
	0WpiLGJ3LoHQvrwzYzWyTYspzBGR8MFA2Ot/R1bOlIs93jVgqy3vY9JZGz0JQ6xg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490bct7tp0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 03:55:55 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58C3tslb017546;
	Fri, 12 Sep 2025 03:55:54 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490bct7tnx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 03:55:54 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58C0Zfag011443;
	Fri, 12 Sep 2025 03:55:53 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 490y9us9d2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 03:55:53 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58C3tphO56230326
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 12 Sep 2025 03:55:52 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D63CE2004B;
	Fri, 12 Sep 2025 03:55:51 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E3B8120040;
	Fri, 12 Sep 2025 03:55:49 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.in.ibm.com (unknown [9.98.111.108])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 12 Sep 2025 03:55:49 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Naveen N Rao <naveen@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] arch/powerpc: Remove support for older GCC and binutils
Date: Fri, 12 Sep 2025 09:25:48 +0530
Message-ID: <175764920910.610338.3948689825494793519.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <b6b94cba7492c8581e8d5d25b15962e5ad7a37c2.1751366979.git.christophe.leroy@csgroup.eu>
References: <b6b94cba7492c8581e8d5d25b15962e5ad7a37c2.1751366979.git.christophe.leroy@csgroup.eu>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxMCBTYWx0ZWRfX9YXtZEPtVviO
 f0ybfuMGxsIZA87ieSVJhd5pMKSF2934GwUoGHG0YOL9dt33RqnquqhDfFtg7Kp4tNe8YJFipnJ
 uVkc4qND1+V1xH0GScdw/8DfkrNdnTDdpngeEvPiYrJipZkAgI6+wyGyYL3D9+PDYjCuUV7sAS9
 9/BXRXZx/4mdoFYkvEE1tV6kSDMox7fmeanjRD9iA9ovDFkpDM43RYj5qZwIU5DU0fSY/uQW2Tg
 iv8cA9pdf0NMhnJWZGOE0i1M/J+xjDJ1gllUA9ngRPVaGwPZwp454tuVR98slj/pkoPRA7xOxTP
 rkEedUo1emeqpQvGn2ufr4BGqKNdfsf5Jlr+Lghd5dYVcWN8WjIJ2ztInmEuDEr0SqwKwhEoqV4
 xsBl03kv
X-Authority-Analysis: v=2.4 cv=SKNCVPvH c=1 sm=1 tr=0 ts=68c399cb cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=fHqBPzmgJZrzYLskxAkA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 0ZoXueZfXDXnRpuCIoeXtI3rPt_gZCbT
X-Proofpoint-ORIG-GUID: Ta0TUSk7oKR3ObUglrYp_5jgqDuIYq1i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060010
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 01 Jul 2025 12:50:07 +0200, Christophe Leroy wrote:
> Commit 118c40b7b503 ("kbuild: require gcc-8 and binutils-2.30") raised
> minimum GCC_VERSION and LD_VERSION.
> 
> Simplify powerpc build accordingly.
> 
> 

Applied to powerpc/next.

[1/1] arch/powerpc: Remove support for older GCC and binutils
      https://git.kernel.org/powerpc/c/a41de5ccff85a0fe45ea1b4078230bf53faa7dc4

Thanks

