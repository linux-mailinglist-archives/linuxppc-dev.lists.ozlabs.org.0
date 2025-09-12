Return-Path: <linuxppc-dev+bounces-12049-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27157B54139
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Sep 2025 05:56:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNLFQ6rwGz3cYR;
	Fri, 12 Sep 2025 13:56:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757649370;
	cv=none; b=DS+jmfm5J+GLHHQVQuJXNiYQ6wVYTJ9jeljG4F/REPePXnBNhPkRJhereYfQ+OlPgmVfnvjpgI8vVeaAu1kIwZjH/f8YeLszVT7CagNI48n5hHamZrt7dABGkW9dfMZ+RqJ4E7MsJa4YdkkTtn5NjtkqYwE2BdO3FPRRMElWM0F+W8WkHZprRy2P3Vdw3uStY9sKiEDqS3wOWXqV+my7mWr43YU+ZkHmWumVIJognYiHSZumhMizX1rcUQU4y+bVotli0lLTw/6HljfYtJo7HePovg7URGvejVNCmFw0iSb7ssf+dtuzC4hdaCMrOE6NM+fjtLVC103Jh04s/sgO6A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757649370; c=relaxed/relaxed;
	bh=DMgfogWaR7ECDsvkaNEbogcZjgaT432gIYbWJ+YBhQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Cw7PJSUPAbEgQ86EARc0FMm9NXQao2f+8JtMgKHYP8ZfLCKbd67d9WaJYfHa4bUtg0EMHKFzRToIwo/cqCYK87596IGyqdNTn4U7pPOl8UKH3yAVPh7z0DC3mNfwg8R4gLU3rXpeD2o5TEizkVAnrRDJdqu2YUpJHOF/ilWQtgRLPggc102ByNtlpkKgwrQiraA73gd+XggnC3zsMdtCTgkVPWvoLa56C/8RacyIQaPAJjuSXi7Chh8Mv6tgwit/VvrQXfdPIqOG1m5kW+HNBgL8EACvv9666UIJLrxEICea7Fn/z1anklZ47oudIUAD/4GIwToj/ihaanO68tW9Pw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SyhsmY4N; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SyhsmY4N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNLFQ0DgXz30N8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 13:56:09 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C22Tnc031661;
	Fri, 12 Sep 2025 03:55:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=DMgfog
	WaR7ECDsvkaNEbogcZjgaT432gIYbWJ+YBhQw=; b=SyhsmY4NVKd6QuMgQGd9IV
	+i8Aw1OaYytrG+HyUjawZ2EYigxPr6PaiOKcWs79C3/EEUDyQF8FilZbNBChJFQe
	mzFpkscCsJnezHtKgnwdFeszRY1O6/SR5YzMbeP6CRlOCjUasFVMwnKPc8IHlue+
	BdCnCAl1wJdWXnoJr395U9XXzOmbxkQgwqrLb+cDdnwtL8qEIRz4AAQr2j6D5Td5
	aPXdw+RFck+3S3PmEg5hipgTDJOKa4wLivcoqP+Q3rjO14QfVkECiLf65TITEaGA
	1r9nSaoI4d/65N1wZcyZzJaD6FTRtKRAWbGkFQhmbwhghy2ih1/TZEuvUDC3Pfcg
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490acrfwey-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 03:55:58 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58C1vpw2010618;
	Fri, 12 Sep 2025 03:55:57 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4910sn8ybt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 03:55:57 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58C3ttAD25494158
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 12 Sep 2025 03:55:55 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 48DF42004E;
	Fri, 12 Sep 2025 03:55:55 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4CF2320043;
	Fri, 12 Sep 2025 03:55:53 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.in.ibm.com (unknown [9.98.111.108])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 12 Sep 2025 03:55:52 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Anatolij Gustschin <agust@denx.de>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] gpio: mpc5200: Drop legacy-of-mm-gpiochip.h header
Date: Fri, 12 Sep 2025 09:25:52 +0530
Message-ID: <175764920912.610338.13254301742963097094.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <9652736ef05b94d9113ea5ce7899734ef82343d1.1755520794.git.christophe.leroy@csgroup.eu>
References: <9652736ef05b94d9113ea5ce7899734ef82343d1.1755520794.git.christophe.leroy@csgroup.eu>
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
X-Proofpoint-GUID: beHP3LA_vYPGRcb4LRNmEu-Po4o1Cdrj
X-Authority-Analysis: v=2.4 cv=Mp1S63ae c=1 sm=1 tr=0 ts=68c399ce cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=Aed0_w8-hmYJHLjk3vgA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: beHP3LA_vYPGRcb4LRNmEu-Po4o1Cdrj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfX0sXKcZ4Tq3pq
 9NKsl0cJUm99Wd6leJ3o0yGx+hu7i1UBl/d3Gy4IthtNjPD3Sg/Lzx876di89oycKw3/3fAKmNU
 RumV9uibbQEoCObngwE75DEr68zvGbuDBkUspNu2YiUinyVjTeRmKDrmEEwNTrgwjM+x3t0j9NW
 GglaSI0stzwbZG2aJ4bLs4uJLsYeEimPA4ArN/hF3MiPW2hRqfZrdQFhBiRgcJntrN9ZVK2pkFn
 fLDFl3mzLxV17xky37pio0mHOIYp86/lXnXpNxVAPJrcHYsCegXiGQ48OyVh6MGSW28RM8fSiQa
 vy6F4lF1Kf8+QhlYP5eYUsh5zCOQY37CHAWrYM7biMgDjBIpE4AW6zdzz9+kOtd7D2MHJuH6kLl
 TtKwavmz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1011 phishscore=0 spamscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060000
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 18 Aug 2025 14:42:24 +0200, Christophe Leroy wrote:
> Remove legacy-of-mm-gpiochip.h header file. The above mentioned
> file provides an OF API that's deprecated. There is no agnostic
> alternatives to it and we have to open code the logic which was
> hidden behind of_mm_gpiochip_add_data(). Note, most of the GPIO
> drivers are using their own labeling schemas and resource retrieval
> that only a few may gain of the code deduplication, so whenever
> alternative is appear we can move drivers again to use that one.
> 
> [...]

Applied to powerpc/next.

[1/1] gpio: mpc5200: Drop legacy-of-mm-gpiochip.h header
      https://git.kernel.org/powerpc/c/e7a6475cc0c32213e87ec190d90b8f1440ff05ae

Thanks

