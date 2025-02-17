Return-Path: <linuxppc-dev+bounces-6255-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7D0A37C2D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2025 08:28:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YxDmH1DSBz30CM;
	Mon, 17 Feb 2025 18:28:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739777327;
	cv=none; b=efhnZtqdPqxtye7wd8oKr3FW0UWEouQu8ba7juEOYE0UdzpbCrc2kqBAEGsWtlXRNW87MLW9dERpeBobTvNL6QvbBvZIhoVdiFgep+Tv97Hv59xRCprzaDIjxeQxVPzpP9XmsgICBiugPmLCcxMYf2Mw9ubK//76hygL9RQbmhFo3ommsQjUslj9qRHIf9R7qfWt29gUXiU1AcdX0T860RaRHX9f6zhBRdCOO6pwAQRjAGLk6rrXBf3yzm3HKyks3yypsw/Lux/+xoSmAFIsEnNPyRiwAt6D3wl8mo5GUPIXRa0ow6e2wKFgFJAZEFSV9BEwIZZIBvz+rZrM6+nd3w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739777327; c=relaxed/relaxed;
	bh=BmuujJrlEtsa28iiVv2mkIJHMAJNx2VywnPp4P9PpDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LvDG+QwQ/wbLnLXRjb7Ao4mPQwD6s/6qNQFafEADoD7L8ETFWPrYTFrSnHJPR30ujQgyqq392YABhr+iy3gOx6OIPD99Nz3Q1H0qs5PlpeyzzAb5UYPWnGHDv1Kk7d3xUoPEA5BfK3DiW5jj+0hzeNz22wJwCXveI6YnJfm6H1NnRcdkYLOXZgE0uW8injARipmoOL8mQXJgC1PVFdqTydu62VWgpBbWhkH9mQLsKkNzrnKDssHaxks5EDBb1bIPV9YB6qfe9MyQT6Zy355n/EFKKbIegoxGwwiiPHIUelqVMjtLe6KcCpPPO/zVDIdgDHCEcP3/z6XxnmXt5f3eaw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iUa81xvy; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iUa81xvy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YxDmG2dmSz2xs7
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 18:28:46 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51H20g1r012535;
	Mon, 17 Feb 2025 07:28:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=BmuujJ
	rlEtsa28iiVv2mkIJHMAJNx2VywnPp4P9PpDw=; b=iUa81xvytRsYyjYxfDKkbf
	uapd/O+VKUJyGYypTQu4geF7NYFGyBbONc1gPorjEwEnhelaPgrrlm7ugxjk7cza
	Bvs61+NjhbVB4AF+3/++ZtQAhG8MXc5WXOxUyV+LXdzljPIZvTHhYma24gckt2zo
	YVhg4CeuyKbTNBkBTNnYm2XB5JEoG8CH8jPwFGGc9P7cLqHn+7bDpGLMuNpp4fz0
	ruGPa2QH7g6Afy536sJH+WG3dVxaYwNx2Zizelx3jrfsX9Mk6IiOqyPHqwCRgMqC
	VA8FwhUBgStMBGdJikaB2+rovyas3aX4+qs/OgfuuNYvAPuKY3DWyajtyIyw9b0g
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44uuy014gq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 07:28:37 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51H3YVMA001603;
	Mon, 17 Feb 2025 07:28:37 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44u5myn416-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 07:28:37 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51H7SXa344433724
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Feb 2025 07:28:33 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6910B20043;
	Mon, 17 Feb 2025 07:28:33 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 381102004B;
	Mon, 17 Feb 2025 07:28:29 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.79.72])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 17 Feb 2025 07:28:28 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: Avnish Chouhan <avnish@linux.ibm.com>, Brian King <brking@linux.ibm.com>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>
Subject: Re: [PATCH v3 0/4] powerpc: increase MIN RMA size for CAS negotiation
Date: Mon, 17 Feb 2025 12:58:26 +0530
Message-ID: <173977700762.476837.9019101116767050524.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250123114254.200527-1-sourabhjain@linux.ibm.com>
References: <20250123114254.200527-1-sourabhjain@linux.ibm.com>
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
X-Proofpoint-GUID: NE4Z8PdlDo1x0q_rrC0jKAKE6YTAXC-5
X-Proofpoint-ORIG-GUID: NE4Z8PdlDo1x0q_rrC0jKAKE6YTAXC-5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_03,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=558 spamscore=0
 adultscore=0 phishscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502170060
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, 23 Jan 2025 17:12:50 +0530, Sourabh Jain wrote:
> Change RMA size from 512 MB to 768 MB which will result
> in more RMA at boot time for PowerPC. When PowerPC LPAR use/uses vTPM,
> Secure Boot or FADump, the 512 MB RMA memory is not sufficient for
> booting. With this 512 MB RMA, GRUB2 run out of memory and unable to
> load the necessary. Sometimes even usage of CDROM which requires more
> memory for installation along with the options mentioned above troubles
> the boot memory and result in boot failures. Increasing the RMA size
> will resolves multiple out of memory issues observed in PowerPC.
> 
> [...]

Applied to powerpc/next.

[1/4] powerpc: export MIN RMA size
      https://git.kernel.org/powerpc/c/0bdd7ff5b830fadc18254399d6340cdaa4271527
[2/4] powerpc/fadump: fix additional param memory reservation for HASH MMU
      https://git.kernel.org/powerpc/c/b7bb460624570e8169eaaa55f7a410fda1bc0c2b
[3/4] powerpc: increase MIN RMA size for CAS negotiation
      https://git.kernel.org/powerpc/c/fdc44538d57caf4e96f57d5f0d0c89c4aa079f94
[4/4] Documentation/powerpc/fadump: add additional parameter feature details
      https://git.kernel.org/powerpc/c/61c403b5d000b46b8703595ea16533d0cb2a2911

Thanks

