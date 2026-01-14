Return-Path: <linuxppc-dev+bounces-15673-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 96422D1C30F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jan 2026 04:04:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drWDX1J3Kz2yLg;
	Wed, 14 Jan 2026 14:04:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768359868;
	cv=none; b=Kib2riBEIBo9T18BwIyeND3pbnUWkYj5IntUc34X+tq7xmhBByDDHoLG2/m4zuWgP2pBqg1+IU0UzYu9PRKTdU+K92E2F7ovMoo727EhCeWCcqouje/oMbcn7fXo2uSUp9+0siKec51MmbV72p2CSmv7LnV1FuK1eNSCzGnzX3tVaTCR5RvgjGm7Lp7elM+70AC2JUFYqws6qIDXenm3K9RZBov88US8leHECTNcTzgwRY2EFJY1fBkIlztnkUu3W4BL+sdxbNeL3otmIbtiTbqlDeNOGGMntC71rruExOBphP1k1IgxxHzKpHSkOUR9x5zj/uFiBVbqzEmGulwMeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768359868; c=relaxed/relaxed;
	bh=FWoihjORaw/hZqzLDKhGDO9Eg9Gc6YIqfcbMvhsT/xI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mUuamU+o+PGmiwpr69kfo3R/+bnWfUmNi0QtkWO6N3S5pQJbJr0pUucSmRJ8kbp912c82DiFt2OZJnN0hsbulIWMnz0fF4qLP47RMPFpfw/vqb2ryZ3Otk1rOlZcJfKgbnB/W5zdf0RN9SrOMC9z3OKxcxM4ashOdhyha0bSseojmn6QUs6fND8N8oAJyoUi/qhZ3/JuK6APMQcJQm+2XZ/BGmUVp2Eu7rtT6A1X5JN21IJzmcJev0zgugkPSr7A30/aeGA4O0J6JABUsLukc/d+Mz3kO9cMNyX9/374JI/YA08lHpmGShSMZG8qhCdndBjmtYIGDvt8Mfl+1cilrQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SbVsgkci; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SbVsgkci;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drWDW2Whrz2yHD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 14:04:27 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60DK0Xc9020512;
	Wed, 14 Jan 2026 03:04:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=FWoihj
	ORaw/hZqzLDKhGDO9Eg9Gc6YIqfcbMvhsT/xI=; b=SbVsgkciyzkApjLBSV7eCl
	vWeygNS1V4qnqhwnZJDd4OdY2RQ1E26cCZ935T4PA97laxbR7vYiglnOVvs6R/ac
	hrViP8zJ4s5LxjsVHEV0Y90p1PAXfu7/5B28Rn2DZzTj5c/rxKGWHnmI4AlYSTsg
	58H1zxKm7WsTF/UYkn+FKs0sRCj58MkTSU3DzaypN1UvgUWFyah9zyMMuyD8+gl8
	n5IJRFK1xcgXsYBZQNZaBEuQmJKVMNEmCFqFs2UXUjKyZqZzDYHEcRmDfWAE/HOn
	JDlwqNGPiyXSKBB3Kt4wLT68txVEx8i0xw9J8K2wI2driaSENDx3ykK1bCJ+x1Qw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bkeepyg8w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Jan 2026 03:04:16 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60E34Gx1004820;
	Wed, 14 Jan 2026 03:04:16 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bkeepyg8t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Jan 2026 03:04:16 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60E2KQZe025809;
	Wed, 14 Jan 2026 03:04:15 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4bm2kkfvq7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Jan 2026 03:04:14 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60E34Dq227132400
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 Jan 2026 03:04:13 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E58982004B;
	Wed, 14 Jan 2026 03:04:12 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 643A420040;
	Wed, 14 Jan 2026 03:04:11 +0000 (GMT)
Received: from Linuxdev.ibmuc.com (unknown [9.124.217.241])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 14 Jan 2026 03:04:11 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v5 0/7] powerpc: Implement masked user access
Date: Wed, 14 Jan 2026 08:34:09 +0530
Message-ID: <176835971837.41689.5793831185458832406.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1766574657.git.chleroy@kernel.org>
References: <cover.1766574657.git.chleroy@kernel.org>
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
X-Authority-Analysis: v=2.4 cv=DI6CIiNb c=1 sm=1 tr=0 ts=696707b0 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=xORi9ZApr3aarQU-KHoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: AppDio2bNcfHmV-TN6VEBFuZi9DFQHZv
X-Proofpoint-ORIG-GUID: yIPEWhPRo6rHO12dZ-RQCV4EyitCVRwl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDAxOSBTYWx0ZWRfXxjENoMRhgAFI
 6KKX6CH7t+GSxG3UkKDHUtkVYltcGgJrg8reFwE7WcAyULx/7DPgMFfHAUNnFhbfg44KjlWaAXq
 3himxG4WsWxmD2bzp4dHB2AmTpHMdL8LxXcPHoTQPV+UoQgCuvP0bj6sDK+v2aZhad2U4drdxZW
 w26ybCQXvs1lO5aF38uw4tOG/dmX05XblmwWUxhkSILS5GLy1kmLoGSDF/9kye5JNtrHpFefvEp
 cilNSPciFXhbUcn2Wf7X3Tbm0GWpiDSWV+ai54YFXyC6pohe91jIjgqzWCqskbcX2An4UruWPZr
 WXkHc26Wa4lrsz+TwKs82zLbSoFYprKs3ze5pJzwNBBmz8xVZH/IvHPxGi2rOtmDbmhLSvBVXCJ
 B0O/LUHh9wQS4apsmU3iYXWyTaOW/08WxNenkxryiXE6jxLs56a6snkZQg15kHjvn+YFjpHm+0D
 5EUWUgX9ndk+cNHXXDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2512120000
 definitions=main-2601140019
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 24 Dec 2025 12:20:48 +0100, Christophe Leroy (CS GROUP) wrote:
> This is a rebase on top of v6.19-rc2
> 
> Masked user access avoids the address/size verification by access_ok().
> Allthough its main purpose is to skip the speculation in the
> verification of user address and size hence avoid the need of spec
> mitigation, it also has the advantage to reduce the amount of
> instructions needed so it also benefits to platforms that don't
> need speculation mitigation, especially when the size of the copy is
> not know at build time.
> 
> [...]

Applied to powerpc/next.

[1/7] powerpc/uaccess: Move barrier_nospec() out of allow_read_{from/write}_user()
      https://git.kernel.org/powerpc/c/5fbc09eb0b4f4b1a4b33abebacbeee0d29f195e9
[2/7] powerpc/uaccess: Remove unused size and from parameters from allow_access_user()
      https://git.kernel.org/powerpc/c/e3efbfbfaaaa739072b2756cfb76cd3de6d91c0f
[3/7] powerpc/uaccess: Remove {allow/prevent}_{read/write/read_write}_{from/to/}_user()
      https://git.kernel.org/powerpc/c/5458989a0e48c2bd51a7d37a04ff6ae489fe5458
[4/7] powerpc/uaccess: Refactor user_{read/write/}_access_begin()
      https://git.kernel.org/powerpc/c/704f4300315396af94e26ec0127ff0cd3fd309bf
[5/7] powerpc/32s: Fix segments setup when TASK_SIZE is not a multiple of 256M
      https://git.kernel.org/powerpc/c/fb7903771c107b0358584a359b8545060e23c530
[6/7] powerpc/32: Automatically adapt TASK_SIZE based on constraints
      https://git.kernel.org/powerpc/c/370d841929c3b863b7409047e8c84eabc4d0960f
[7/7] powerpc/uaccess: Implement masked user access
      https://git.kernel.org/powerpc/c/861574d51bbd7a06dbf07f658a9a8def012c2f74

cheers

