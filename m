Return-Path: <linuxppc-dev+bounces-4552-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A397D9FF388
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jan 2025 10:08:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YNPCQ34pnz2ywC;
	Wed,  1 Jan 2025 20:08:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735722530;
	cv=none; b=EBEJ6Z65TyF/g1M/NkZjZ1xZSjXBfhqy7/1FJ6r34472pnGcxKNOFwMdaE9b0LRGfkreYXs1f9Bnw9Z5XQoyfRZFZIFjD/xWenpTzU9r0Sbj83sYtszgoA/sTPFeP1W7XYEWbdC+obe9309z8lVpdQJqFiaz4Q6H3H9gv94+F7BPLE7Vu0xqjTLOGuqNTSOxsOjvZznL1YhULQ/i1dd9boJHuHO4yvYZsb5UjM2OIbGQW2vvc9IWj548IQQfDPIACd4JkMvrEKP1X4k63HhlYz92I9p7/SmsrpLX8mHLAT7tTt0YAAPsg+0GMwwz+Dks5S398V3W6b7pAbGMSvgyQg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735722530; c=relaxed/relaxed;
	bh=WB2pDnAw4WYPdnxGhw9exiNrVxzysSpkqDgB+ODgp3k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hIVKjiMhTrzWbKRgfPYH4gAJB9zZPWf5YQarozTOx81nW7BKTX9h0WXVTBys4EB/qETYPw1yNj9XbUdKajs293Ozndx8fKwKnm77203MeQN+1DBHnmf3V9S8nUU6IduVK8pKYNU9CAObD30rpcqaGOWtUWK5eoy6M6GpwKNHDCksF6yJYqgGYlHsxAN4/KhPmICqM23WkhM09YQsNi8c2bucqj9FIUUXiTUbbrUAXZ8TYbwfOVgAzwmSjMbO2gQwi5KRJvhZXUptTueKmFNt1KTpl9fHV1hz2Ag0GZ2wL3SFTSHlARrI0PnO0UFPKYG3ZglvPy4b+OuRjfT/sftQNQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=i0+iDuAC; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=i0+iDuAC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YNPCN4y9rz2yVG
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jan 2025 20:08:48 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5013v6FS030497;
	Wed, 1 Jan 2025 09:08:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=WB2pDn
	Aw4WYPdnxGhw9exiNrVxzysSpkqDgB+ODgp3k=; b=i0+iDuACvwq15MLy4w0Qwv
	OlVbi9fReBHo7ZfeZCWGfyd/IE1rkA1Gn0io9hC6m48wr2YoodC515/lvGs9mLzl
	+C9BDxxqR7/S6PZeRIRjVvFu4ltLr2cmaNdKjDq5KB71opzSnW57Ow7viJi51dbr
	r3EhIjA3Sw/GY4brKL2TEgO9hRfDsBtuA6B/bNeVYJN75TSISnmNJSs2AuDiyZVj
	EXqFkVPkTI5M+8GKPVCNxMm2OOK1BRA9rd+IKVYLLNyoeXSj+mnMG/mudyibYI5Q
	MHehKPVk8k5luwfVwbDt6RkPVsIacv5xZpLIvlVVBJKA5P43kpaWUukvGlBVq4IQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43vtrhha4p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jan 2025 09:08:28 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50198SS1030493;
	Wed, 1 Jan 2025 09:08:28 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43vtrhha4m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jan 2025 09:08:28 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5015F1vV014615;
	Wed, 1 Jan 2025 09:08:27 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 43tunsntx8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jan 2025 09:08:27 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50198Pe165601900
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Jan 2025 09:08:25 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6655E20040;
	Wed,  1 Jan 2025 09:08:25 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E2D5020043;
	Wed,  1 Jan 2025 09:08:21 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.115.214])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  1 Jan 2025 09:08:21 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>
Subject: Re: [PATCH v2 1/1] powerpc/8xx: Drop legacy-of-mm-gpiochip.h header
Date: Wed,  1 Jan 2025 14:38:19 +0530
Message-ID: <173572211260.1875638.15792318186583364320.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241118123254.620519-1-andriy.shevchenko@linux.intel.com>
References: <20241118123254.620519-1-andriy.shevchenko@linux.intel.com>
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
X-Proofpoint-ORIG-GUID: 5dBRgleMK_9Hpd6mXF8aTYUJ4JMT7RlO
X-Proofpoint-GUID: 5ndbSDEcaL3SHkrJIlxz-wyG05VZjLWH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 mlxscore=0 clxscore=1015 adultscore=0 impostorscore=0 spamscore=0
 mlxlogscore=728 lowpriorityscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501010077
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, 18 Nov 2024 14:31:03 +0200, Andy Shevchenko wrote:
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

[1/1] powerpc/8xx: Drop legacy-of-mm-gpiochip.h header
      https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?h=next&id=34064c8267a61063d684408db6ae78b571a9999d 

Thanks

