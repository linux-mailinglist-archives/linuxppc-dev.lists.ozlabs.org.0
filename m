Return-Path: <linuxppc-dev+bounces-7029-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A312FA607E1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Mar 2025 04:47:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDVgB2g8Vz3cWd;
	Fri, 14 Mar 2025 14:47:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741924038;
	cv=none; b=kCufjsPHrTrBK4CJkehc5P03hP7rAjJm+bDVH8Y+CH1e2Ajt8tMg6Qb4oPdAi9onqfbAXklCnxg/AX0DJH5N4vsI4Ha8tYGB9NbWNR3WU+BtNWQKZA3k8If9Ovkh17QYMNqgNgqiY2uJN89xANYvXwYumdSjmf6W4z2couKXw6hg5zf0VLsagrxEe2tQopbDWoJ7PSHx5wRgL1/DUAxytaLGthnfgwMymQW18pKCMGfovZhJjuFvnlHnPDI73OqsrHzgkaE5grfh8EMKucKGUVARDXVlVuOZYbXix2XHghu45noaTiZ6A9DPmqXW2Tkhe0dr9EGaVe59JPurbmuZSg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741924038; c=relaxed/relaxed;
	bh=/qvyeYYYxIm9T87HGra/YtOB/c7AxJJYhqzkfAbhCfo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fVsa9+g721OMuMtLuhV8GE1ucf3jBjyFUvVauUYvTxSynpaHfdm56XXnO9STIV5zAPr8Pzq6I1F11AXi5KgK43I4cRV0dm3jqMojZXVhgAEI7SOV1YA6et6lBnO3x+WNNE3muX1hmEueB346ClidTVqaZZ6SmvnEZVXre9ALB8F1t55evlM7Ubko5rYnz/gKSIztPOgij2UDp+hzRsndNP+tubLLoHUqRnzO0DX4m8xnIcs/gDv8GYUnFkMPiXw8ach9V7ZCuf37x4IS6WIvAzzqbAkL8V0flnM1zgrqC3SJtorM/Wl+IgqEtW0USaoPa+nRBws2LltpaFWk28Wuug==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bwNI0XW3; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bwNI0XW3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZDVg91bYRz3cW2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 14:47:17 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DNOwXX018106;
	Fri, 14 Mar 2025 03:47:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=/qvyeY
	YYxIm9T87HGra/YtOB/c7AxJJYhqzkfAbhCfo=; b=bwNI0XW3UoxChqJEpLS3B/
	35k2rIieWnCo02ba1H290RUsvTEVxdeaAth6is9yBRnUcaBH8uSMpqJN0GTOhhcP
	9/JjcngT0rCZqKpME3cBJ5Fz6iibKyXq9R7ivmeRVaq7KwrEldAaaJNAQ3RYYvaO
	WJuyfQUEPVQCmWUEZ3R3YHIrPQGzUL5kaSGg3OrPtAZFZkn3Gvg2BGCzy9zq8vnb
	fQrq1iwmh9+wNC5eIPxsKsidpY8Kionr+YWRW4PsahQZ1XbkLKzcw/ah/saQr7BJ
	O+MVfcEulw+VoXF2pN4FdVVO0UnEu8/fdsY6LaZdQb/8C9T3Rszm8u3LDmziIaOQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45c0srbfuy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 03:47:06 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52E3iIi9030125;
	Fri, 14 Mar 2025 03:47:05 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45c0srbfuv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 03:47:05 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52E04Np0007490;
	Fri, 14 Mar 2025 03:47:04 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45atsrd1wa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 03:47:04 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52E3l2BT18022904
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Mar 2025 03:47:02 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5B66520040;
	Fri, 14 Mar 2025 03:47:02 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 80D3B20043;
	Fri, 14 Mar 2025 03:47:00 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.in.ibm.com (unknown [9.204.206.207])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 14 Mar 2025 03:47:00 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, Andreas Schwab <schwab@linux-m68k.org>
Cc: robh@kernel.org, saravanak@google.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/prom_init: Fixup missing #size-cells on PowerBook6,7
Date: Fri, 14 Mar 2025 09:16:59 +0530
Message-ID: <174192385434.14370.13614517118508707143.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <875xmizl6a.fsf@igel.home>
References: <875xmizl6a.fsf@igel.home>
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
X-Proofpoint-ORIG-GUID: F4a78_1Bf75BdXRZPmX8d6tNl8qAogCC
X-Proofpoint-GUID: JtZRzv744qTWLYqtAJmCWHTS9f7OHq-5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_01,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1011 bulkscore=0
 malwarescore=0 phishscore=0 mlxlogscore=730 mlxscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503140026
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, 13 Jan 2025 18:19:09 +0100, Andreas Schwab wrote:
> Similar to the PowerMac3,1, the PowerBook6,7 is missing the #size-cells
> property on the i2s node.
> 
> 

Applied to powerpc/next.

[1/1] powerpc/prom_init: Fixup missing #size-cells on PowerBook6,7
      https://git.kernel.org/powerpc/c/7e67ef889c9ab7246547db73d524459f47403a77

Thanks

