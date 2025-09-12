Return-Path: <linuxppc-dev+bounces-12048-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D4BB54138
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Sep 2025 05:56:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNLFQ1jd7z30RK;
	Fri, 12 Sep 2025 13:56:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757649370;
	cv=none; b=ULXlnacGVsMpOmHbe/z0YbMhH7LKjhhax4w/eTuxnYYcMhReIYmBWL8v3HCosQyLkUUc8kWgRn73ifdp4WqtOQfT/FoWvCPUg02Q0ggjovJmHzcrTpTX3LcPp8w81PYbFMF5CVPdnSaa/RWh85PEu7GU5sBzaD52tBUbRouNYb71ZYd1ffvsDJffuaaGDHFtHA/4xcFKBufPR1hOy4qc/hAdYCiy9LMoI0Re8x2cpQjQp81xmmsbF+gKCfrjW8HVtXTNcu8rLlFKZjep1QblHyTtriNYdGqGKEyqamXIOOrz1ix8APJQlI0pqldHZap5eeWuqEvKz2zkW65oH8oTjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757649370; c=relaxed/relaxed;
	bh=GmiaxdkrNLO96B9FCYuP76PBc7174iLV9hIUuWXDB0M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HY+FiTd69/3eGzWzoLgmXz1p9ACY5SjLPL48xpCMIEDndteYhH6Uj76YbWZJm4rWwyY8xMygBFiIKHRi5qRgnqHrUqE0bnK3lUrghGKtho6uHKnsgYpXETPhh0sB0j0fFNSxyVOg+GGB3slzHXaVFvxWemDHg/TcVi+tvbRMetsYX9BkSf50ivkylPgNuWwyCWMSlHL0D3d+NK4Ojxhq0aD7QxyNAwfXK9lpV5fcH/SVXonjC2qYb7UHXFwceAWrI8b9CCbzzfcb9n5U0K22kLOuaPMFvn8LSyW3hv51AfQeuNJwJwix7QfgG8P140ziLAD00zjZUVvbI4kKSxOjzw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Th13rJvs; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Th13rJvs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNLFK4R6Xz2yvv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 13:56:05 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BIwF5l006469;
	Fri, 12 Sep 2025 03:55:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Gmiaxd
	krNLO96B9FCYuP76PBc7174iLV9hIUuWXDB0M=; b=Th13rJvsHBt7Wc53Mg2k20
	E6/V6HyYJ/eaQYJFDbPmgK1y1eGSFsIUw86ToMpu5S40BrDQce6bheIbzDb0fPg+
	fUHUsLEQmbOwQ3KWw3FfGexB4K6dA0tFwX2ffZ+jXhpB0sl5DMhaKSBpdX44fPrP
	rnBPY6R0po4QpZyWlZadhw5G8FEp7U5BCbIQXN5ThZmZiDASXoM8MbqNpiE1tqvP
	+x/yyjcjc/gnm8Zr+yDCFExHl0Gdn1Y4+qdaryeJt6R1kCXPG/1BrwD8BYI+1BNJ
	7jQBjFrqXrX00rHCbEP6UDaj+SuHfdl9aeprD1Mmyg4Zlst2W3jjoNEspmKpR4IA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490cmx8yxs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 03:55:51 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58C3npEk012567;
	Fri, 12 Sep 2025 03:55:51 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490cmx8yxp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 03:55:51 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58C2OnVO017227;
	Fri, 12 Sep 2025 03:55:50 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4911gmru3b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 03:55:50 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58C3tmjP42860986
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 12 Sep 2025 03:55:48 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 81C922004B;
	Fri, 12 Sep 2025 03:55:48 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 547A020043;
	Fri, 12 Sep 2025 03:55:46 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.in.ibm.com (unknown [9.98.111.108])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 12 Sep 2025 03:55:46 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] powerpc/44x: Change GPIO driver to a proper platform driver
Date: Fri, 12 Sep 2025 09:25:45 +0530
Message-ID: <175764920912.610338.16301114402472105584.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <29d89aa43536714b193d9710301341f838fcb5b7.1755519343.git.christophe.leroy@csgroup.eu>
References: <29d89aa43536714b193d9710301341f838fcb5b7.1755519343.git.christophe.leroy@csgroup.eu>
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
X-Proofpoint-GUID: nIDoz3lwf_jFhPnXxuGf6H96HZfnXf00
X-Proofpoint-ORIG-GUID: 1kK3ZoQ90CPl4A6q6eoA1y9aVRlHnN2S
X-Authority-Analysis: v=2.4 cv=J52q7BnS c=1 sm=1 tr=0 ts=68c399c7 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=1CWnjDJCROFCZy2uP2wA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNSBTYWx0ZWRfX1bsrrXJ2oTlu
 XIHgn21Gp5Nua96EoNYCNubVLS0Vo5gP0j8QIiqDFlca0wJCbT7RzPm4yUrkH7MY4AHkTJVQSzm
 kYXDFp1fFkhkxJoGpdcmPoC850YEVTWF2YOy6vc1j/e18XA8rvtEk74wy52b3kTFZXw9obiHoqY
 xlqpRuZ+pSXGUTU953ysTEavk/0KowHQhdsq9NZc9FKIRf1Gc6riH8FzckO6N+leKvuiWF8D15J
 Ae/ja6zVGTWOFw/U+mCJJ81Bqix9W9QAnk9ox0bmuSbnZOSkXXP952JNOGwFDHvxNa4+Qessu39
 yCDlq5jbtqArL6yDe/uXB7UEFiRWrUmzd+PeskCPxjyUk1NyTJO1h8bXz60g+sPmtc03rofeO5e
 U/UnB+BM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011 suspectscore=0 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060025
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 18 Aug 2025 14:17:34 +0200, Christophe Leroy wrote:
> In order to drop legacy-of-mm-gpiochip dependency, first change the
> 44x GPIO driver to a proper platform driver.
> 
> 

Applied to powerpc/next.

[1/2] powerpc/44x: Change GPIO driver to a proper platform driver
      https://git.kernel.org/powerpc/c/1044dbaf2a77c9e1143753a620d830943da6a193
[2/2] powerpc/44x: Drop legacy-of-mm-gpiochip.h header
      https://git.kernel.org/powerpc/c/d2ad26e7b67e5a3d73221daf8207e848dd819bd4

Thanks

