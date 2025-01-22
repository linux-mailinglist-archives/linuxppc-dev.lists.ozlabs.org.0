Return-Path: <linuxppc-dev+bounces-5479-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B7EA191A2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jan 2025 13:44:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YdP0L64hzz2yy9;
	Wed, 22 Jan 2025 23:44:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737549858;
	cv=none; b=DgTZlZkHjtYsBrJmbT/ed9Q5ssvygA4Cex1oyTBiI+ktYdpLrh3a0PP+OBPu0zKLGirA6LyV3QI4CqXFu11Qr1s1LBr9CGrrx238vNwkHisBTDMLydwfS98aj7GqPcKmtEC4ehlDynHxTZQiRM/QliHMejKDUwy01Vdu8IFGdoUgGWdbipY1fIn701uSS/wZ7hYRxMy9H5lamlMexxYZpF66rD951umwPu/jHfprqjyllKyJtTnWQh6rv8Jv7eXxjJXyDPCfhfJoFrdFX7LF4R+RFUjO98FpYjxbdAsViWWkZKt3X5FmhLr1FVZ5as2NhhjBt2Pc+VP6Ji6nvj5B3g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737549858; c=relaxed/relaxed;
	bh=N4+vfo6RvLX3tvVxY96IHe7MqDaFFU4R0Tj0aS2l2Y4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SATCqI7ZbLkiBrJ31nlW08uTqO4SE6wn3ICsI96iZ2Jxyrg/7Jc2OYWkSHaHdMHS7xu58W+hpyPlCI32q+pG7rVCyXyIyfVCfsYLAi62bnhe4BMu1BwYI1h1tVT95gXBAkJ7jHtb90a89LEZiKSXiAUOjoOQKwQJ/FPhuM1WgBD7CAUWJJ1qEVYtDu80giphmskSnMNyc3bH9nd9MisCCOm/6BXtP3+5BO6nwpfFfXrAc4S+BVX2PEHrHsQTJXGshLjxMoo+F0tRtmMuCBuZLtERvlPbDBgfdGKKrFb+khm9YlYrfr6l3L5+Bu0wtH9YRAwz1bUzIFrSCrPdL7p+NQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TRmryvZN; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TRmryvZN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YdP0L0GtSz2ytm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jan 2025 23:44:17 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50M7XFgA013536;
	Wed, 22 Jan 2025 12:44:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=N4+vfo
	6RvLX3tvVxY96IHe7MqDaFFU4R0Tj0aS2l2Y4=; b=TRmryvZNSjcEt/4UcaCq/X
	F0WGwkt+PEBiFIIngly3KSS9kH7mYQI5Kl2MwWTChBcCv7CDaxB5kg4TA0KLWBqN
	uPbj1DePw5ibBD0vRl9bxg3ARYtdK4P0xEoXR/3HKpLi3wnkGBq7qHj6aeutCu+W
	4DlYJ+Rv9ENoXj2yAbqejU4nNQVJPDQWHAbBpH8/avxwG0Kx1lIXEit04x+Jhdet
	Cl0VHEQsgVp04ettmPhLr9owF7ApMv46C3GEIBBERyVkFxyu57cPi2XEJ4dGb7PY
	XmISt2wJWAEBZtN4n2YclPTY+eW8yFpgQZmY4zFxco5BYS3R9U5vxy0EfZ9rJATg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44avcp1ajf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 12:44:01 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50MCOJGl025885;
	Wed, 22 Jan 2025 12:44:01 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44avcp1ajc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 12:44:01 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50M9Sf2M024231;
	Wed, 22 Jan 2025 12:44:00 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 448q0y8jrs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 12:44:00 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50MChu9352887982
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Jan 2025 12:43:56 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A93E520043;
	Wed, 22 Jan 2025 12:43:56 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 395F520040;
	Wed, 22 Jan 2025 12:43:50 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.99.85])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 22 Jan 2025 12:43:49 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
        linux-kernel@vger.kernel.org,
        Narayana Murty N <nnmlinux@linux.ibm.com>
Cc: stable@vger.kernel.org, mahesh@linux.ibm.com, oohall@gmail.com,
        npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org,
        vaibhav@linux.ibm.com, ganeshgr@linux.ibm.com, sbhat@linux.ibm.com,
        ritesh.list@gmail.com
Subject: Re: [PATCH v4 RESEND] powerpc/pseries/eeh: Fix get PE state translation
Date: Wed, 22 Jan 2025 18:13:48 +0530
Message-ID: <173754932978.1094869.2082514395132243482.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250116103954.17324-1-nnmlinux@linux.ibm.com>
References: <20250116103954.17324-1-nnmlinux@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: mASYt3iwEHNCoh5m-cWb2INsCygynD2I
X-Proofpoint-GUID: acV33627Db4gdQoa2sXkv6fAzcBnizjr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_05,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 bulkscore=0 mlxlogscore=700 spamscore=0 phishscore=0 mlxscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1011
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501220093
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, 16 Jan 2025 04:39:54 -0600, Narayana Murty N wrote:
> The PE Reset State "0" returned by RTAS calls
> "ibm_read_slot_reset_[state|state2]" indicates that the reset is
> deactivated and the PE is in a state where MMIO and DMA are allowed.
> However, the current implementation of "pseries_eeh_get_state()" does
> not reflect this, causing drivers to incorrectly assume that MMIO and
> DMA operations cannot be resumed.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/pseries/eeh: Fix get PE state translation
      https://git.kernel.org/powerpc/c/11b93559000c686ad7e5ab0547e76f21cc143844

Thanks

