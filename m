Return-Path: <linuxppc-dev+bounces-6253-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CB5A37C2B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2025 08:28:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YxDlw4fb6z308V;
	Mon, 17 Feb 2025 18:28:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739777308;
	cv=none; b=GqhIysSKohb+ngldGySTI2l4eD2D727Vypezniq4iLUe1YpLJd3jN+Hkinxu1hSJ/YpuX2YYFhSO85L7z71TfOdSgz/LpqBPe1+tqqk8xo39tatcurrdxZq+A0M4YBoLfrod1aycUroqdA2OVS5MRZtluEP3MfDoTy/iNa5D8pbfyqkqBodPgqNvtvtQ9OLmkIpeCbpurMkYLpoAMgkU5m2PPfysZJbda+nv7SkBIDDRBvXOJIwL6sbw1tNmgSdzMfu5HNh2Wk5adouY7TzsxGOJYU8icHHmGNUtEQ2oY51qi/Xwx9D82dI0aUv5+vahmseqoSeB7q5oKBnOpjptUw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739777308; c=relaxed/relaxed;
	bh=kMhnfCBhFNpJpvNv4R+waD1u9iuudptGoo1E88yGcFA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=npc1S8hVcPQAvCPe/vekAK5ypfeAgJbodfOmGLwQNZ35YF9xy/OErYXTlSwbSgp+vg1yfNa0qGngU6EaxkeLdYB017l5C1lNX+/PYyhjr0w2G11dlZMfqhjOtP/ojhmRyNwlqfwJgsnEVlXpPiKtoud65GV20jWOEV/5h654UF6CoCyEEdB5Lnw8LOrZca3HHMzL/nzsK5Ex3wgZ6zUifNIBt3GAGu0GzaoUKoqHIBf86ap0fQXPGh3HNCvdO5fTZwPHmMjbFtdp73DJ/qhx97xx/YeCeoR+pyHlSFaUfga97vAgcx4YDqssG7ePnWo0he56/12Cmi4IkZXf1n5RbQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iK+ifJnI; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iK+ifJnI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YxDlv5bJBz2xs7
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 18:28:27 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51GBa52A011335
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 07:28:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=kMhnfC
	BhFNpJpvNv4R+waD1u9iuudptGoo1E88yGcFA=; b=iK+ifJnIQGKWps220kYTYD
	tSk6Ei1WlH94qiS5LqJOqQMqmzbmAtH6mOWG47hDd5zrBaBkgdGbfazV8RtpGEmn
	JMQOnLNs6+UyVKCATBweeN9wizTc/AEqkN90bMcS9enMD/RVPy23GkBWZTDcBDzQ
	dhs92RMlddlxGWo7UlH9sXf8V9jUnzWNz2UA6CrcXsApoo9AmYGL0rS+hdExutpb
	eu9LqEYeumZgfaND0Cj4EWVWtRVC0HrSmBergsZDt7wehYnVLJ9mk0yIvGq2d2qg
	0PIBSeuIVFoqRJeOFXOVXrl6J55MucxktIyg7gtvqmfL2zo8IKS7qGFezuz33tpQ
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44ubqnv0g9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 07:28:25 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51H4KZ1g003957
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 07:28:24 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44u68nn0a5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 07:28:24 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51H7SL8e43843934
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Feb 2025 07:28:21 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F188420043;
	Mon, 17 Feb 2025 07:28:20 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2F57C20040;
	Mon, 17 Feb 2025 07:28:19 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.79.72])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 17 Feb 2025 07:28:18 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, Gaurav Batra <gbatra@linux.ibm.com>
Subject: Re: [PATCH] powerpc/pseries/iommu: create DDW for devices with DMA mask less than 64-bits
Date: Mon, 17 Feb 2025 12:58:16 +0530
Message-ID: <173977700764.476837.14874012204416329311.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250108164814.73250-1-gbatra@linux.ibm.com>
References: <20250108164814.73250-1-gbatra@linux.ibm.com>
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
X-Proofpoint-GUID: vem0KzKVeWrK5hHK7zPx3SFgWhHFlYGs
X-Proofpoint-ORIG-GUID: vem0KzKVeWrK5hHK7zPx3SFgWhHFlYGs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_03,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 mlxlogscore=817 bulkscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0
 impostorscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502170060
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, 08 Jan 2025 10:48:14 -0600, Gaurav Batra wrote:
> Starting with PAPR level 2.13, platform supports placing PHB in limited
> address mode. Devices that support DMA masks less that 64-bit but greater
> than 32-bits are placed in limited address mode. In this mode, the
> starting DMA address returned by the DDW is 4GB.
> 
> When the device driver calls dma_supported, with mask less then 64-bit, the
> PowerPC IOMMU driver places PHB in the Limited Addressing Mode before
> creating DDW.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/pseries/iommu: create DDW for devices with DMA mask less than 64-bits
      https://git.kernel.org/powerpc/c/67dfc11982f7e3c37f0977e74671da2391b29181

Thanks

