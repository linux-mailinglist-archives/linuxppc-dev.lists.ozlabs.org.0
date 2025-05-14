Return-Path: <linuxppc-dev+bounces-8555-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C317CAB6166
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 May 2025 06:04:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zy08T4kqhz2yrP;
	Wed, 14 May 2025 14:04:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747195449;
	cv=none; b=WNIxhD+Mv4rFPfuYTkbO/C5fzOLLg2MjgjBsor0QiCpeDlJsvFAX7KKxsEti4hwbAHzGd3HFZdpu0KwcTEcikQ4PQ/G7uJLwH2hIq8rjkC6eOJxmVlGEKbZlGOHBr1jgqBV+8CHuNyUTgoZipyM8b0LA3ONnwD4OE3D9isAeKyKmyKe06r0HnpdsNcTEvanpVp+AVRCADDCyI2rSTCRNvSYbB0uzkiveYw3vM6PJmb0E0m7g7tC1lhmDm+IycktloT7udZxLRcFVAcl7AUHA/WjAHzp8/UUMdT5NWZfQJv+s3Wvt5AU16g9t/42wmavPA4PKDcvItjp4QyQ8vDsszw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747195449; c=relaxed/relaxed;
	bh=c6JdyFL+5iaP15aILY2xwumvyIIIMDAJ28MJwxBYXhI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aiTILYbFvmBVPz/jArUe56HGwAcWFJVvaPZYD8B5wHBYPTEIZYsn4pCPltIwGv7PHc5AfSGcBJRODbd2zzxZMkrZ18PIKUTpNEKEdMXFi+wZ9CNLFYbTfE5Ru/55Mg4kHp+gqLFtuS9cVbK8IiJzLbHvBcjVuj+0kV/9hxDID50Mn42WfpyP8j+nRbERXtluWQR+YY2i21jdlXhhUQD0KXcgBenD2RNzyU5g0OnOyZT8wejo2oCpjgDscOfFmRDZ19NY0rVdb0+zk2PqqNN71GO9KK/V5ty3CfUo/NEMOJmlm8wolyKL/rGkqcQzqdAiEp1aNL6i20qixc0jzG+J9Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=F40Bit3q; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=F40Bit3q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zy08S63p9z2ydj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 May 2025 14:04:08 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DIbL8q019726;
	Wed, 14 May 2025 04:03:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=c6JdyF
	L+5iaP15aILY2xwumvyIIIMDAJ28MJwxBYXhI=; b=F40Bit3qxi5bouyh7wwbGc
	9w6aedU+VLyZByYqz29sXFYrxLyCEwclFi+Gd/xBFFhOEUyiwkLfPNJ4LMDEtjNE
	PgAr6c4A1Pdg3yNrCSSXrYHi+wFp8KGr7W4RJ8VZBXUZ5dqLw8aCbJkd8cQ0bwrC
	K+zRN5ARVlWHEVUw8lTA2rgsGvWOBskXwOUuZsTMmHX5LdhE9/MzBYA+/E67xSLT
	gcbQkdlAmEMDSwBUyx7b/aECOeGEDlEvwcWBvlnXx9ozppH4CQnrkFJZ/bQbZH7G
	6b8watb5KqFQrIwZUP8FMQ9fSqeZFql9Z2i+DUUS32EqueuxfG/t+RCUO37sNLYw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46mbh7a17b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 04:03:48 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54E3qKuT017810;
	Wed, 14 May 2025 04:03:47 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46mbh7a178-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 04:03:47 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54E26dGW021786;
	Wed, 14 May 2025 04:03:47 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46mbfpj71n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 04:03:46 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54E43jM253281188
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 May 2025 04:03:45 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 02BC22007F;
	Wed, 14 May 2025 04:03:45 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A18112006A;
	Wed, 14 May 2025 04:03:42 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.in.ibm.com (unknown [9.204.206.207])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 14 May 2025 04:03:42 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Anatolij Gustschin <agust@denx.de>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 0/5] powerpc: convert board-file GPIO chips to using new value setters
Date: Wed, 14 May 2025 09:33:41 +0530
Message-ID: <174719490576.1067444.5838058716149030535.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250502-gpiochip-set-rv-powerpc-v2-0-488e43e325bf@linaro.org>
References: <20250502-gpiochip-set-rv-powerpc-v2-0-488e43e325bf@linaro.org>
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
X-Authority-Analysis: v=2.4 cv=YbW95xRf c=1 sm=1 tr=0 ts=68241624 cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=apvEF29HLGljTXJwJv4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: _no0KVR6N3SQ3aGhwUfGD6EKQ6mbVqv-
X-Proofpoint-ORIG-GUID: TSTl4_e1c1AkEQOoYk_vc4CpNj14QLad
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDAyOSBTYWx0ZWRfX3A01n4h/5by6 f04Tg7RrICKMHYgAXDOqgdKx+7f/2Mj2UrmrNwsSgGVs81ZealCEllLf+ErpfUjuFXX7i9uB69C VeD1OmgFAzOGCAacAbggTghaNGAE38WP6eAlByOQaZCEaaloHvLN0HViX0ooS7youynaO4PZ/2g
 6vbJCxjwJRpJS8IyqlIPQXRdO+NaSzQYRcxKN5SMDcs+UDur3nc3jGlOYqQ1LmI+AVo8eq8wQET f5tF3Qzzo8ACJziQ/Gy9vg4g/GuEIgcc1tZiaofHIYNEqtj04TMwjy8iNWfm8ust1uKO/XXu8RE YKJfLOwoqwj8cawL/iz7cxewx7kPs9yLzhRU4oLxJH0TsQyMYH/mR/c95DZju/ax4MQFviFJYuA
 t045uou7S9VrM3odY8Oi71z8Qrqs5o6BDMI/UJXTXy9Mp79xs7QoVESIqFR/JLTm/waCQ/fW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_01,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 adultscore=0 mlxlogscore=995 clxscore=1011 phishscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140029
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, 02 May 2025 10:59:46 +0200, Bartosz Golaszewski wrote:
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. This series converts
> all powerpc board-file level controllers.
> 
> 

Applied to powerpc/next.

[1/5] powerpc: sysdev/gpio: use new line value setter callbacks
      https://git.kernel.org/powerpc/c/54ac723320fcb0fe42aaa42ea800697450b75668
[2/5] powerpc: 83xx/gpio: use new line value setter callbacks
      https://git.kernel.org/powerpc/c/077f8733252dcfa738bcf0cfbf6820b26a7ba084
[3/5] powerpc: 44x/gpio: use new line value setter callbacks
      https://git.kernel.org/powerpc/c/5effda1c36f2338178c0582c0719cba58f24b0b3
[4/5] powerpc: 52xx/gpio: use new line value setter callbacks
      https://git.kernel.org/powerpc/c/c8fb184faaa0aefa3c1b1f8b3eba873c7ec4d840
[5/5] powerpc: 8xx/gpio: use new line value setter callbacks
      https://git.kernel.org/powerpc/c/5ea6a980b5da58a8dff550dbc2c2523ea492dd14

Thanks

