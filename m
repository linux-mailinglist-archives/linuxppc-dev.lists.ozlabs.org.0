Return-Path: <linuxppc-dev+bounces-6481-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA378A454A2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2025 05:46:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z2hlB11V8z30YZ;
	Wed, 26 Feb 2025 15:46:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740545206;
	cv=none; b=ExhN3dCfqUoDF3OD90VAAYtTOufqaXoE5dejr6CRH1RzZW9i+iWKoyzyfxoXe65G/iB8MXMWVuqCETkvfer1LIoAZ3R0U9sffWr6nNrLJpN/IwVRnezrb6Yyv7FV1KfhOyUoo1suRPSAr45YXfoefvcsIeMEPPKWfd0IXOhTn6m8cKGUbIK5W4pzY3hzolnEJjr+w8mIEYY3HcNJ23EE5isbgJg7lwSwtYW7fN/dSenaHZcvLmOaSElh4wPUEsBusl7IGTErRufvF7+XE6uRiSBcAZI5q6Y6PVk2khejkiaeKivF+RH5hEWDJ27lZDUMXduniPBh8W9ir8xf1/p1Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740545206; c=relaxed/relaxed;
	bh=2PQG475yC/sNQ5D71AsWdf11Hg9Z+xdWTuGGN/tr9wI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EPTBaY5ffWp5tVXriP1HD0dKxum1zsJThoXO2S/OPYP31Eti6T0kkF3FMjydp6vHkT+S8PHDm+rRddty5TtBeE9QwppQxi2dsKDhU+qDWoDLoMaZm4k4qKxAmRUZg4yqDrubGlhRjiYXuF1ESMHiymK/XzoP6LzFXwoxndAnyOhatXl+L1WkAcmaDq61iGQvML5Pi2gkZIPjk208TS99KrMUU/ZD7tRaEO5fe/2glTmoMSP8gVGhwDe4a7dvT+EwSyPIlalqZvuvKPAXfkQOF3+1KOhQ1IeIxgbPmlk6hxhu7pjPr53vu5FIRQiyvRKJVe6jP+c5m2yd3XFhEZzaCw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IDVkSo88; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IDVkSo88;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z2hl91Rg1z30WY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2025 15:46:44 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51Q1kt30027841;
	Wed, 26 Feb 2025 04:46:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=2PQG47
	5yC/sNQ5D71AsWdf11Hg9Z+xdWTuGGN/tr9wI=; b=IDVkSo880mGUY86AnMCUGe
	2hHyxr/ng1aSzCZNoQDmupoKBX8Dx44I0TeAuJDXVKXdiYRmLiBpQTQHIzUWuDz8
	Mj5stGJAvCoMSUfBVKV6du8Uy4iAIN4r5P3wGfM/RE+N88cubTL2UM1D4OCETmRX
	lI5eR/1lktV1r5Q3kJJ5FVw5jbCVfEWP5w/8823lzgYOyHSF9ub18s8aLyQbWKJJ
	95sBGQRksyJNqc1Rfx7QtDhbfB3/pE67oS8vNy8zilT7cHE4+nn5VxU6ZrNfY16A
	ZUfDSpcIPuQi6LNR1DjIMBUJh8Ap9/r2Va85tql47OP1Y6LPsweggqgrAile0oJg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 451q5j95ds-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 04:46:28 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51Q4kSS5024583;
	Wed, 26 Feb 2025 04:46:28 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 451q5j95dq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 04:46:28 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51Q3FPW5012735;
	Wed, 26 Feb 2025 04:46:27 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 44yrwss1qv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 04:46:27 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51Q4kPMb47710678
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Feb 2025 04:46:25 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7D75720040;
	Wed, 26 Feb 2025 04:46:25 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3270220043;
	Wed, 26 Feb 2025 04:46:21 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.65.188])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 26 Feb 2025 04:46:20 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Naveen N Rao <naveen@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Arvind Sankar <nivedita@alum.mit.edu>, Kees Cook <kees@kernel.org>
Subject: Re: [PATCH] powerpc/32: Stop printing Kernel virtual memory layout
Date: Wed, 26 Feb 2025 10:16:17 +0530
Message-ID: <174054508252.1386382.4908751676238614813.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <430bc8c1f2ff2eb9224b04450e22db472b0b9fa9.1736361630.git.christophe.leroy@csgroup.eu>
References: <430bc8c1f2ff2eb9224b04450e22db472b0b9fa9.1736361630.git.christophe.leroy@csgroup.eu>
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
X-Proofpoint-GUID: A3dTPOtgoGpxdu-3h4zf3qYjKQjPhVMr
X-Proofpoint-ORIG-GUID: 9ey-h9MHxJXGFQKVRL03BX0DuPwfAAoU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_08,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 mlxlogscore=667 phishscore=0 adultscore=0 clxscore=1011 bulkscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502260033
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, 08 Jan 2025 19:40:38 +0100, Christophe Leroy wrote:
> Printing of Kernel virtual memory layout was added for debug purpose
> by commit f637a49e507c ("powerpc: Minor cleanups of kernel virt
> address space definitions")
> 
> For security reasons, don't display the kernel's virtual memory layout.
> 
> Other architectures have removed it through following commits.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/32: Stop printing Kernel virtual memory layout
      https://git.kernel.org/powerpc/c/2bf3caa7cc3b725eb671fb7e186daf685089eb86

Thanks

