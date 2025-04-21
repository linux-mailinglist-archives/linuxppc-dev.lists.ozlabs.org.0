Return-Path: <linuxppc-dev+bounces-7851-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F3DA94EDA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Apr 2025 11:42:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zh0l718pfz3c2l;
	Mon, 21 Apr 2025 19:42:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745228531;
	cv=none; b=aK15dNt6SSbHrA6T/onX64nKcfFvKsRd7wFS+gM8GkSSWXrXdSglhMNYhZoWQRH/n4IBR5dx+xhrPxBnW7djiFhNzYuJY7yXEeKWfRqBB9CJIsaq3Jves1fuawixmp+yeRboAB/SygRRH9itAAkFzR15/Uwk7RSyJILFpAeAzJwilPy2XQjowQXFVkKzamEpLRXzV568wzTXUdOzLRqRz6HSEahBrN2KUs1sMwyV4Odi4lXt+l+ysXGrcYmPqn5QQnHnfzsSR9jiCYGt/t5TOqQsVflUqTscBKjsAbKPJ5ax0hWXzs5q4rCY1VQgpkOiRVmwDKTAV7s8xlm9C8oquA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745228531; c=relaxed/relaxed;
	bh=ZbwJK0sX8EPH4utB4iySXESMuZgXQ4XK2/L2O0jMcSE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=USrfanfHgqhUJCRnNVyhbwtbcnYrhyssoZ/Mnz6UVYebRXBnAPk4wSYqmLsFkTgqDQ3DWtqZqzEeNtw/eyO3Z0VhCMM1T2sl7+PjKoN7ns1rRQDVDp1P8z4MmFsZPgJbjjGzPDskwr3YEJAvgN2VZDSLNqeD4/W9M9de7UVhyLwobpIOHxJO5pLCBoQ5Bjn1qBs1dQcMDLJfJLSXrQZWUVAxrBzgxkd6K80T5kfwIVTUQdWqU8lBsfSnDk2iEFUwHfqM0roj99ANLh/Y2Le89SEKrRAzcInLPLrwDUqWmOSlEVYlrhypuDMvRr+L6mdnKEzQHbgMZXN8x1i48kc2ww==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Dn315FqU; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Dn315FqU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zh0l62FhJz2ySJ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Apr 2025 19:42:10 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53KLhur2021650;
	Mon, 21 Apr 2025 09:41:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=ZbwJK0
	sX8EPH4utB4iySXESMuZgXQ4XK2/L2O0jMcSE=; b=Dn315FqURq3L6NWy664t8j
	V17V5K/cKbzN8bp9UiQhfaVwdfJa/ftrR6MJqHAIUuef9PrIZmG3QB3jYyWNrAqF
	ymZ9aYTWTXYg1bYs18gjhJ6VSiTHm5PUURtiea2PH9Bry/PzUuUwUBP9zUXc8Wi1
	xa7hxVT9Mv9MEufFdTmMSy486zTKs2j+Bkhn/O6p/CZ2wpvbBxlHUDxxCG+xzbBe
	L5mL/5sSmOvuV8IcSkdI4IbUpe7B1m6Sh75cXbQxLkJDSoC9dTziiKU1YAg2JPmy
	37Z3U8OYloGmHdynNiN3Xvej0/OhQZtsjXpK8eArP6Q7c3q9FKgq85iHYPEZp91Q
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46592va4pw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 09:41:56 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53L9fD1L028985;
	Mon, 21 Apr 2025 09:41:56 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46592va4pu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 09:41:56 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53L8iN42027743;
	Mon, 21 Apr 2025 09:41:55 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 464rv1wdmq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 09:41:55 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53L9frUa47382884
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 09:41:53 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D0AAC202EE;
	Mon, 21 Apr 2025 09:41:53 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0B6ED202D4;
	Mon, 21 Apr 2025 09:41:49 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.29.154])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 21 Apr 2025 09:41:48 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        paulus@ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: naveen@kernel.org, linuxppc-dev@lists.ozlabs.org,
        kernel test robot <lkp@intel.com>
Subject: Re: [RFC PATCH] powerpc: Add check to select PPC_RADIX_BROADCAST_TLBIE
Date: Mon, 21 Apr 2025 15:11:46 +0530
Message-ID: <174516637906.525631.13671868581882641091.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407084029.357710-1-maddy@linux.ibm.com>
References: <20250407084029.357710-1-maddy@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: _TTvpkW9uvr46WAtRddlW3EwLjYHT_j4
X-Authority-Analysis: v=2.4 cv=RorFLDmK c=1 sm=1 tr=0 ts=680612e4 cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=GKMZPHe1ApgckJ878fUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: GadkcUyihj6yppDBaNwPB8rv9ZqtBDMN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_04,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 bulkscore=0 mlxlogscore=561 lowpriorityscore=0 impostorscore=0
 suspectscore=0 spamscore=0 clxscore=1015 phishscore=0 malwarescore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210070
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 07 Apr 2025 14:10:29 +0530, Madhavan Srinivasan wrote:
> Commit 3d45a3d0d2e6 ("powerpc: Define config option for processors with broadcast TLBIE")
> added a config option PPC_RADIX_BROADCAST_TLBIE to support processors with
> broadcast TLBIE. Since this option is relevant only for RADIX_MMU, add
> a check as a dependency to enable PPC_RADIX_BROADCAST_TLBIE in both
> powernv and pseries configs. This fixes the unmet config dependency
> warning reported
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc: Add check to select PPC_RADIX_BROADCAST_TLBIE
      https://git.kernel.org/powerpc/c/3700976f2ae8dfec4c17433f8a16c9e6c334cf89

Thanks

