Return-Path: <linuxppc-dev+bounces-15763-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03560D22816
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 07:13:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsCNc445fz2xrC;
	Thu, 15 Jan 2026 17:13:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768457632;
	cv=none; b=VubGW9O1j+XbW/ZfszuSFnZSnXT2L1cIBhjA/RPv/0fu82YaVrsMLKsgp33a4rNGYwUjlhMHa4GyKIJKfNoJfe2S+3bWnEJkQWVo+QGON4F1Rs5F60Ek50vW6Tol44m8Hm8HCytPLj2/DkH+9ZohrrGFh9zgeRGn18vSoa4NsiPgmF5+cytPe6YMTjwnvXZvP9ghOk3MWXPX7NmQTV5ijkPcSOR4pn3iJf04EArso7diTKQLbA4MCFq2cW8EG+EhFZNc87mX30D5DkMdAMSJ7gkoIxtH6dXgxdkU9cA6bU+gesTOtn2A0EkKZZ1VoYb0i2S6dNHvaVanSFoAB5Leyg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768457632; c=relaxed/relaxed;
	bh=gFjWdO1Kr7nTH1rvXfR75t9SJ08y/Dca1mE8vULWp3A=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IOpRLV/6Ugj2SjqUR80pPI7OCFlb29BB5ZTHfT3Jpr4BxlC9U1w+JQBuuTjUSM6H2sG4izIynsSvj7XHe8o/z+Zf8gdJWoMjBrmuBwGcvCxUb1rhP9FBtulhZfUjSDsBMiUvdPGBEkH2KtYcL6YslKL2EuxNEaNnnyEjwabzWLeqPFYp5xQsgy+pL2Yer89ECv8TcxkLIRNLMyZYtGcpy4ZHjKp1rl/oB4RF8t38dVQIXdbIcY8qi8B0qgV6kvKc//wnSiSiz/nvBetqF2ynrFevHnRubm+b8MeuAcDmLY9iIzKvCBmDbn0YIkzPa+3+9pjRmnvr+CbJfaqRLgCUFQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ifeEmi/X; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ifeEmi/X;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsCNb2KxMz2xHW
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 17:13:50 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60F0GKV4004876;
	Thu, 15 Jan 2026 06:13:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=gFjWdO
	1Kr7nTH1rvXfR75t9SJ08y/Dca1mE8vULWp3A=; b=ifeEmi/XL7ojfXZkMHcjw5
	2XT3BUZIK+ze+KC6Dgtm0PFYhYa5rdZNPSG5rlppZoKqAcfp/tzCSuq5nD5bsr15
	vekI1/9vh208hoezzbOp+AnDzJ85eFOzAsWDkO/GLz2W070bQ5sL1XsfaQfVMPcm
	uyyQSEY8nJiGP4A2kvfsJ293a0IThT44VrmuFMdPhJkX/UJbQ/JPIc6MuptSHm3o
	8wuioXgC1oe0K+rDQi4HP4CW1QbR8Itc1HnfWeI3s4kM8yryz8OtjekqyCl9yOQS
	yPhckJj60F+C+R44/GrM1TeqYYAm1Sdgo6xtwsVZOwfZTtbIaRwuuGJenKr+DvsQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bkedt4mck-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Jan 2026 06:13:36 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60F64Wro029529;
	Thu, 15 Jan 2026 06:13:36 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bkedt4mcg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Jan 2026 06:13:35 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60F4icPp030146;
	Thu, 15 Jan 2026 06:13:35 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4bm3ajx75t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Jan 2026 06:13:35 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60F6DF1Y11207328
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Jan 2026 06:13:15 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3DAA15805A;
	Thu, 15 Jan 2026 06:13:33 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EDC9E5803F;
	Thu, 15 Jan 2026 06:13:27 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (unknown [9.90.171.232])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 15 Jan 2026 06:13:27 +0000 (GMT)
Message-ID: <cc97397d3c75d796ee71081cc842c867a62ce39a.camel@linux.ibm.com>
Subject: Re: [PATCH v18 00/12] Support page table check on PowerPC
From: Andrew Donnellan <ajd@linux.ibm.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Pasha Tatashin
	 <pasha.tatashin@soleen.com>
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
        Andrew Morton	
 <akpm@linux-foundation.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Nicholas Piggin <npiggin@gmail.com>, Rohan McLure <rmclure@nvidia.com>,
        Alexandre Ghiti <alex@ghiti.fr>, x86@kernel.org,
        Nicholas Miehlbradt
 <nicholas@linux.ibm.com>,
        Sweet Tea Dorminy	 <sweettea-kernel@dorminy.me>,
        Andrew Donnellan <andrew+kernel@donnellan.id.au>,
        Srish Srinivasan
 <ssrish@linux.ibm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
Date: Thu, 15 Jan 2026 17:13:26 +1100
In-Reply-To: <b6c39059-faed-41a8-80b2-addaa229c143@kernel.org>
References: 
	<20251219-pgtable_check_v18rebase-v18-0-755bc151a50b@linux.ibm.com>
	 <CA+CK2bBjoQmheEstv1MacGev_srdx=m5v=hwxdyfAKogbpG3FA@mail.gmail.com>
	 <bf0def77b07a34c00928cedb46030ea17be4fceb.camel@linux.ibm.com>
	 <b6c39059-faed-41a8-80b2-addaa229c143@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
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
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDAzNSBTYWx0ZWRfX53I7DiMu6h3z
 raXZ/+frnSM8CMCW6s6EycApm3s6hEGJYKo4nVxjhzW2dpvC/SLuvXwOt2bFBxnDU2o8HyeArEP
 KgqH3dyQwLP6m+aU6EMMPgT7xOMlk4XQygjZ3zRSFtE5O3/2hzrHiyzeLjD6xCJngU5YVP1Y2DT
 M4oOYAvD+GbWzvH+yn69QZZex6VaPw03MenupSF6+0KKMyiJMfTGamOtrUz5U5OeL4yE7ACOpax
 1V8Bm9LBMmtQsGTbCTGGGhgIOoJlbp/8o+p+pCMkCtiFQ4KW0rqOTgOdVYjIRjzAS2GCYw4Xb2T
 dYscTh1Jr06MtPwi5UgOTV/7Za1UdB4jl0ciUkhgXmHH2jej+be2xLWsydOaEreH/y8qTjgm1Hd
 6XW+9NYpu5bD/aXhf59z6H/VZnDjoETDJhvhkp2Y6kFxg5AC1B5HfLqjKMyh6ewlpPtTA2XNRZp
 JF93iBCdf7rwfjpdlhg==
X-Proofpoint-GUID: fME1BWB4YoztfUCI-TzSeij8lia_ZbwX
X-Authority-Analysis: v=2.4 cv=WLJyn3sR c=1 sm=1 tr=0 ts=69688590 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=U6BpzXCMtsgkVx3qoqkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: e7mbieSo6rWsEOFCa9zukzvR3P93ImOy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_01,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 phishscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2512120000
 definitions=main-2601150035
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 2026-01-14 at 10:34 +0100, Christophe Leroy (CS GROUP) wrote:
> What is the merge plan ? I see all powerpc commits are acked by Maddy,=
=20
> will the series be merged by Andrew into the mm tree ?

This is what I was expecting - this revision is rebased on mm-new as it sto=
od
around when I sent it.

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

