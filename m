Return-Path: <linuxppc-dev+bounces-7849-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C852A94ED7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Apr 2025 11:41:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zh0kM1Sh7z3bn9;
	Mon, 21 Apr 2025 19:41:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745228491;
	cv=none; b=b8l9uhlnBZKEOrbxtMn4LcE2qZl0abTHa7CBTHHqWRj3wHPwpwIVw47k1bKuMG9yJ3+x+W2gCJWfgSHAFkGUmX3nClVkfL0NUdGEwLoUrJcHV/RTEYAZMtuscI5RU0euitEk3XEpiWKAkHRdtyjim8iBzkJB6LqqvgknI2+EuYcmothq7/EKwQfhAUuUtsZWlWvvcuXUeClc1igDlQ+Bwjwv/zvTiifBedl6RnN2bwR8fbzDs/7B7FX0GwFZHQyE0ro7bS1SPXmbMEDd6Qr4gv/REoAsGrhwlsOsVnUbbSjSkdkvqG74AZAkI/hq1SokNEAW2OjiBAvNV0u65Sxunw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745228491; c=relaxed/relaxed;
	bh=ZM/Vh+Q8fAqwssrrkeeTgcVyCQuwd+1HH02zH4Dgn4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=knYEn9G5acjpbRva2/peBGl4723VChOTfGKztyFOJ9J12ArWS+JhCfN+0mLETZsDl/vgJXe9JS5yTrDL0Uf+3mp7ekHCRF1J9SQywql/oofAASVvc0KMTmydO8ST1VfQsT8j8jZw8PQer6K7QvA9kQg2lhWwVAZ6AeT3oGZ2kIlkNc/GYKvC3bd32rKNVC/9nEUnxDc2y+p318h16AebgABy9+4FLIeTmtH9qQwRG9nvpk5ZrShxNsNihbC6PC5vAWNnsfPQ7tWe6NSBxNTEcuUForqW5VcM+4aRLCUwWsGwD4qo1O7r28cAaiOxabRv3VTHd/XeyjX+sErhzTpEIg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eNLrVgkk; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eNLrVgkk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zh0kL147fz2ySJ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Apr 2025 19:41:29 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53KKj4J0023900;
	Mon, 21 Apr 2025 09:41:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=ZM/Vh+
	Q8fAqwssrrkeeTgcVyCQuwd+1HH02zH4Dgn4g=; b=eNLrVgkkl2mmBl0kxo8tha
	Z3ShciAV2kM0So19TgJeo4HU+Kloy/QEej3HSUBJd8kTPQwYWDIpyegacnu1+2ol
	HbZ/sohb8HPgPqGyibpUV5E9qzejttBm/X99DeGO6dFWXRRqmGNDiexpdDCNYaeq
	5sa9aFNyGWoZEhaR62EVpvm6uX/TVYDntPSRpUkgtGhffLR8+Kal1/cw8/wpZku9
	3lQO3Hopcp4H3cXGkaVoyUEL2SuWRorvANelxuDTYy4PvSvYAEphjbIgvFrt4mhy
	dmGLKHX/Guh4L0ezMflVcuu0ASBrFXA8xOGFiLbX/ydf13ckaXiTg3BdFcUc63Zw
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 464ycrkjne-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 09:41:24 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53L8mAAC028109;
	Mon, 21 Apr 2025 09:41:23 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 464rv1wdkm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 09:41:23 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53L9fMFO45023630
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 09:41:22 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2A3EB2035B;
	Mon, 21 Apr 2025 09:41:22 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E945D20352;
	Mon, 21 Apr 2025 09:41:08 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.29.154])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 21 Apr 2025 09:41:08 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, Anthony Iliopoulos <ailiop@suse.com>
Cc: linux-kernel@vger.kernel.org, Naveen N Rao <naveen@kernel.org>
Subject: Re: [PATCH] powerpc64/ftrace: fix module loading without patchable function entries
Date: Mon, 21 Apr 2025 15:11:05 +0530
Message-ID: <174516637905.525631.8856999917576384417.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250204231821.39140-1-ailiop@suse.com>
References: <20250204231821.39140-1-ailiop@suse.com>
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
X-Authority-Analysis: v=2.4 cv=Jp7xrN4C c=1 sm=1 tr=0 ts=680612c4 cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=X3jz0Fj359h8prLIXbUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: WEC61si-qoKmDNKnOHVL0ow40nl3lrfn
X-Proofpoint-ORIG-GUID: WEC61si-qoKmDNKnOHVL0ow40nl3lrfn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_04,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=645 impostorscore=0 phishscore=0 spamscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210073
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 05 Feb 2025 00:18:21 +0100, Anthony Iliopoulos wrote:
> get_stubs_size assumes that there must always be at least one patchable
> function entry, which is not always the case (modules that export data
> but no code), otherwise it returns -ENOEXEC and thus the section header
> sh_size is set to that value. During module_memory_alloc() the size is
> passed to execmem_alloc() after being page-aligned and thus set to zero
> which will cause it to fail the allocation (and thus module loading) as
> __vmalloc_node_range() checks for zero-sized allocs and returns null:
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc64/ftrace: fix module loading without patchable function entries
      https://git.kernel.org/powerpc/c/534f5a8ba27863141e29766467a3e1f61bcb47ac

Thanks

