Return-Path: <linuxppc-dev+bounces-5149-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8A5A0B760
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 13:47:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWsTr5lvyz3c8H;
	Mon, 13 Jan 2025 23:47:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736772432;
	cv=none; b=UV1Wv/XJJqSQBWNWDbApEHCiT2JwHLypw7X3g+AccOHKu3+XMueGUHgQ/rcOW7z/F+y929gxBlhJFobPxl3JG0zjOQfrJNsPbrRbxz5etqlH2dLDF1JNVNatNRtfnDPGq1tFOxgMnLuELjPeBA1rMGV4v/KHMPPE4s6PzZQkfbe8XMygX6knIBOrOA0jAseU/kR+PCpWhkwh9dRfdG6GtJtdl7N5001HEZ/d1KNcsh04bZziKeDDHM4OiE1/my0dtFU+Ov03OPl2xQm6beVBK10hcxfTPgq3EKkVxhfS1D6xTJZIsUoou/vVoe5wxO0BpeEN69IrwMNe04dyS6mlmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736772432; c=relaxed/relaxed;
	bh=rD+Pv4ZUnvyfDgWLqx/MB1vvTBnvaYkc89h6tteUuUg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cn5/7j65UnmbdRNrL/+fBqEUcv3g6gsu4zPLHaFK6bnuSccllFvJ02E6yoioPOLR191H0AzwjuzT8eCeNBH7m9GHKM/2Ui1H4od1Tp6vwC2xDbWkeYROP9XlGSv2xOQhMQZtVCxe74VA1UlDASCnc+/qtWIi4sexih17lWKMi7CPYsEw1MtyH4CTNraS/o3AJZcfPIohMsbvx1axoaf7rcAlEQUDcUDnHzP76FqQwJeHGqqw2hLeHwtVU2IL0sW9/R5EF0sM1fAeQwBAcIoBa5VB+Hkax29f23HfQl9VpEQmdwC2uANJHMOh7L34dxCuXLfW14KmjIPxbKXhAuIQ5A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FhZmE2oO; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FhZmE2oO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YWsTq3m7pz3c85
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 23:47:10 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50D3qMiY031715;
	Mon, 13 Jan 2025 12:47:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=rD+Pv4
	ZUnvyfDgWLqx/MB1vvTBnvaYkc89h6tteUuUg=; b=FhZmE2oO6fQT3V+UftPn/g
	vVI47z46xlJjKfbw7L6E2d7V5RDNV1rDEx+uPg5nmSWKwAaEbZu64kFfTChITrYC
	yNbp4+SJK/Poplod3wikX9OTdslke3iSE2dbCq6c6ioI1q4hsfYnB8UyL+27mvrO
	QnIPa8Q7R3jgY0KlTifnguYakfHyEjv94LpsOlc2nRi9/LbhB8vEHTrp5sCqVZKT
	z5I6icBNZlA5642PqxIUAS3snFzwovo5N5Li1/q0gInd5EMGGXWaGkqXALPwKsHp
	YmZH0haG8BG+dfhPlArTfUWcvPhMXShWjUt5ZZ9P8mnI2bLTLMNNZoJ6zqBVYSiw
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 444uac1xvc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 12:47:00 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50D9iDCr001110;
	Mon, 13 Jan 2025 12:46:59 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 44456jnwhq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 12:46:59 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50DCku9E8585538
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2025 12:46:56 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4922F20043;
	Mon, 13 Jan 2025 12:46:56 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5242B20040;
	Mon, 13 Jan 2025 12:46:54 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.10.47])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 13 Jan 2025 12:46:53 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au, Gaurav Batra <gbatra@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/pseries/iommu: IOMMU incorrectly marks MMIO range in DDW
Date: Mon, 13 Jan 2025 18:16:51 +0530
Message-ID: <173677229439.52314.9450880288222574741.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241206210039.93172-1-gbatra@linux.ibm.com>
References: <20241206210039.93172-1-gbatra@linux.ibm.com>
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
X-Proofpoint-GUID: 5NNkfEcRYBjqheDdU3lroIWP3Rcm9XoF
X-Proofpoint-ORIG-GUID: 5NNkfEcRYBjqheDdU3lroIWP3Rcm9XoF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 mlxlogscore=654 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501130105
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, 06 Dec 2024 15:00:39 -0600, Gaurav Batra wrote:
> Power Hypervisor can possibily allocate MMIO window intersecting with
> Dynamic DMA Window (DDW) range, which is over 32-bit addressing.
> 
> These MMIO pages needs to be marked as reserved so that IOMMU doesn't map
> DMA buffers in this range.
> 
> The current code is not marking these pages correctly which is resulting
> in LPAR to OOPS while booting. The stack is at below
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/pseries/iommu: IOMMU incorrectly marks MMIO range in DDW
      https://git.kernel.org/powerpc/c/8f70caad82e9c088ed93b4fea48d941ab6441886

Thanks

