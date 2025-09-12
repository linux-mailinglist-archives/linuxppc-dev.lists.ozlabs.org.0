Return-Path: <linuxppc-dev+bounces-12052-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DA4B5413F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Sep 2025 05:56:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNLFY0kCCz3chJ;
	Fri, 12 Sep 2025 13:56:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757649377;
	cv=none; b=kcDrkJN9EVQERSw/9ESZ7QbIe9NXn5CArODUYVBHC6QIKeSrqgXy1c22nu9jcmltT4z9sdGVX1sj/dJxjmaXqaDMXxXvpI7fCAY9ag/fPd1ouiLUuK/p5yPp4IK0ocaEtY5XfLbi/PJ4voRCth1IxHqMAPDRlAvO7vVd7AuxginO2Nkc2V5yJfSdWxiOe6PMWvn/VNU58Z0mTPX2BFFVBs1OIDEEmrbSHER87sLw4eftpw8eeqGSmtBH+MPmmKT9gt6NdjVarkrmgSArmQGplaPGeK2fq9Uko3FvNaBe1aBMJADHgXWYV4CCBffiPaazHPEaZXYch8SnfT+Jxd1n1w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757649377; c=relaxed/relaxed;
	bh=I5vXjwjH8i1nZolZJv78QvaSU6frydNqBJWM31HcyjQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c2+XWCe8NE2D1vmXCbu2r46NjMb/03RT3PY4aMxYs8HFhWspU48d7xqE1NCJmam6yVZt33s5m7E28MXUAK+Uz0JXx8gM7tiO49+dSmiz9L6KUqXFlXEOi1SVMIfyMu2k4nl/6bZxoDuKS92OlcylXBR8tdsPRUemEZ7HSKXtQuFM5wRLBC1lbXsuaId8VOQTxishrXwk16EYKX+qRFpzm2OCp9fJfnfYaY6wren89Cm9s10bsoIgUyhW56RCc07xop14ysY7PNSY01l+UvP4wz8vWKRLkXgcISZrj1XksqfvvFqjhPNzhcGOUvtbHnszcKIWS8xLjJegyWPo/EyJ+A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sYwy0J/R; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sYwy0J/R;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNLFX24mmz3cbt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 13:56:16 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BI96fQ021177;
	Fri, 12 Sep 2025 03:56:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=I5vXjw
	jH8i1nZolZJv78QvaSU6frydNqBJWM31HcyjQ=; b=sYwy0J/R8boQ0J/ehGwutr
	nayPvlxR3YYpsmVVwTV6+rnCWaZ4bQfsNDhkHxDceYGoL4uy6ndAYK8DTI+Ijggb
	COmjfUBiCLRoGoUUh83oZS0zbKDJM+ecRQse5yY0bEy3Q/Cs7zEPatmPd17EtAdX
	N1vhwzpifoCqdOTZYUhQxMdbTpWsIDkiGfJ3foaJT0bqLj/lvIyqHG7FjiHdOd2d
	n8tUt30QXCsE9TkcLhnM+15Tcv3x8YX8JXoj9peNybzKLmXATiMcMo6iji/1YUIW
	XKtiTqYFoYMuKShVKJdwqb5FfvsPGAK7WNfow30o0EY44nCR5b4u7NYObU+junCQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490bct7tpy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 03:56:05 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58C3s51g013547;
	Fri, 12 Sep 2025 03:56:05 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490bct7tpv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 03:56:05 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58C2IJOH010613;
	Fri, 12 Sep 2025 03:56:04 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4910sn8ycf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 03:56:04 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58C3u2Y322544890
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 12 Sep 2025 03:56:02 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4FEE22004D;
	Fri, 12 Sep 2025 03:56:02 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 11F552004E;
	Fri, 12 Sep 2025 03:56:00 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.in.ibm.com (unknown [9.98.111.108])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 12 Sep 2025 03:55:59 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] powerpc/cpm2: Drop legacy-of-mm-gpiochip.h header
Date: Fri, 12 Sep 2025 09:25:59 +0530
Message-ID: <175764920911.610338.2762561793634068649.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <2662f24c539db393f11b27f0feae2dc14bb2f08f.1755518891.git.christophe.leroy@csgroup.eu>
References: <2662f24c539db393f11b27f0feae2dc14bb2f08f.1755518891.git.christophe.leroy@csgroup.eu>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxMCBTYWx0ZWRfX5k+F+zwgGQYS
 gAsAdTpFgHgLSy7cekFKgdsLVCpbBj6kHeTbVvha+Akn6S5KG5Xuk4gu/hD9z74OX/gBn0jEhdk
 gTaNnWgkdLIT3G61nrA0ZGIIIN9YUSMa5/macdyXyErxz/+f7HJOD3ltz6CxNUO4hRQCXShLvjQ
 ab3RjTmI8AT+vSU8KBNmnQUyqwzhQ1GPTXbuyKTBhA3b3LmubhFx5TnOpdMlOSo2xGhDNOlyiEY
 BX7GlZrzqxXXoX2L+YHfq2f2O5FHXK5fuVbb0wbNwv+XFpvd8qhaDI/tod5boy8kO87A2Jm83Tz
 oaW4FpeZSDL1teMyCoOOBTHD7JmF0taVkmfRXJCa75t8QgEJu17mp9CNBhLe18QCmxaxdbVGLCI
 wMuRLWpl
X-Authority-Analysis: v=2.4 cv=SKNCVPvH c=1 sm=1 tr=0 ts=68c399d5 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=Aed0_w8-hmYJHLjk3vgA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: qzXXkDVJV4_sdn_CYDFWKvnXRHWf1qWW
X-Proofpoint-ORIG-GUID: L0AqdZg9Qh6KuxfhZhC9w1Bz7o1STOKj
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

On Mon, 18 Aug 2025 14:14:36 +0200, Christophe Leroy wrote:
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

[1/1] powerpc/cpm2: Drop legacy-of-mm-gpiochip.h header
      https://git.kernel.org/powerpc/c/7f9bcf13069731fac48d8b44086fab179fbc04c9

Thanks

