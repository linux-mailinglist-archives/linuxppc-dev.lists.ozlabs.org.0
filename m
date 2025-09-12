Return-Path: <linuxppc-dev+bounces-12051-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4A8B5413E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Sep 2025 05:56:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNLFW1PV4z3cfg;
	Fri, 12 Sep 2025 13:56:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757649375;
	cv=none; b=IbyDNjqrOe9JFbHQd3Zk3Skem1rpd/D+356S7cXaa4C88lG3m3yk/nazehW9xrf4b0ZUHiDSU2GhMmGeNTbdosQKkFt1iZQuNGDVFwws5fiS94jqI7EXjpWLKsf7yTvyCH15GAjyoR43HqntJ67haOblD6+8hcS2NwOOGs4CIP237NG1Ck9dl+1g48php6yyuA5ksRZgJHxmxDxg04++GZf7YeJHnQh/MjQm+8lNiTTEnQTVU5unj/XgUN4wZASF4yiL/7B1/uHSFSMiqDJUVUev/FGd9lT4ELzBs6wVXoGhrR1oR/6+cO7JtWiVst7mHtPiFEbOOJly9qunQcqGRA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757649375; c=relaxed/relaxed;
	bh=ivlsIQ1Z4vfpgTJiSdPajQcE5iwfgbsGPxnOVQmyfKc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dFE7tEZ2vQZ7vGOOtRDDnkAnAnihRsIqc7yDFGSsljEuFDoYskDQmsSK/bBOZlZPGU3VAkfZYP6YKHsqgtj0phaFeKZi/LvzmvrvBpza5ln2SrB5d0wx5nqdOwWmUCpSsERlKmYkj4ywDfUOO5iphSJl+S01I2lblFS47d9b1fzRgeoxqY7wDZ1Y+ExZQBQ3YrbmyWvt53hidN+Xq9BXuUU3OsaI/igoNzE30y10T1LmGRvjTeubQw/QlmGHGUXlPzSvh3TQ9SEci9dpKa5qExC2NHnWehplHyQf2yDfS7KuvHUYMLFcv3AFUSQ/FrC3J1dhmXw1gO0FbOHHDbRByQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MHhrxQTm; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MHhrxQTm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNLFV3Ykqz3cbt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 13:56:14 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BKCd14021524;
	Fri, 12 Sep 2025 03:56:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=ivlsIQ
	1Z4vfpgTJiSdPajQcE5iwfgbsGPxnOVQmyfKc=; b=MHhrxQTmFu3Sb4p1NSOcyK
	BHeahIXs3MFgT79qmmuLYE6GxQIefc+gKFSX6/LY05rgsPmFWIYWqEEOJOnx38Fg
	sI0ZEztFkPdFCN+pF/CfFG3rgMjA57XfnfR0x/JsY8MLfLVV+pMFXziVVxuFNZFN
	2MYKJ9IPbJSv6ORr/AcJQqPYGsXPSoNYr2rJku3eE3MaKmjPaESf7E7UIb/qe5v6
	v8ABIf45lKpmGRO710+GJZo2T0IQftTRsV9Bon/ep8ObNiCZOwv/WUfm8nsu8Vdq
	6qNM9Q8Kg553+tTCH1xI5/oEjDAaI0imEgDcMQ3/LP4U52K+U/Uthvg+EPMVIcew
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490ukew7bd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 03:56:01 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58C3sbmx023873;
	Fri, 12 Sep 2025 03:56:01 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490ukew7bb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 03:56:01 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58C0j4Y4020458;
	Fri, 12 Sep 2025 03:56:00 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 490yp195w5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 03:56:00 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58C3twnb50397494
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 12 Sep 2025 03:55:58 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B441520049;
	Fri, 12 Sep 2025 03:55:58 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C1EE22004B;
	Fri, 12 Sep 2025 03:55:56 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.in.ibm.com (unknown [9.98.111.108])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 12 Sep 2025 03:55:56 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Naveen N Rao <naveen@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/8xx: Remove offset in SPRN_M_TWB
Date: Fri, 12 Sep 2025 09:25:55 +0530
Message-ID: <175764920911.610338.14934659683671395907.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <9710d960b512996e64beebfd368cfeaadb28b3ba.1755509047.git.christophe.leroy@csgroup.eu>
References: <9710d960b512996e64beebfd368cfeaadb28b3ba.1755509047.git.christophe.leroy@csgroup.eu>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDE5NSBTYWx0ZWRfX0d18NKxZs+Bn
 mvG3HKzGxeuba2qbx8fNReMBZfoRcwvUdnnnQuHjERYAtpfVOctqPEYIpfxelXRs37oQPKK7WP5
 XFOZOZLmPRoT9EH09QealyNNVVq8qVvx3HjoR+iQn89SBQkYblAG4Z5QeXDwPIbOxG6jPLIV0/f
 DM8wxaWUlvnvn4mnXvUd5PsPhQJbbjAQPsKDt+08hEmhV5eXCtw/PIZzSA9yRX7puRLV7AkzrB8
 iCYbSHWiicfgmPJlOp+XpZBUlf36xMjzVdPeIeX+xyPF+n/JbytMp2wvseYNkgiIzxVvw6AZmGy
 6a8axByT2YvTsH4eYkSYOr9YeoZguZPZIl0uJsWdXnCuIeX77r+82WFZ8w8W9S8ZG56E0QTBTN5
 BEEFHvlV
X-Proofpoint-ORIG-GUID: 9Ll-EFkyq9jFXR4K5q64doOE6k7gQwFQ
X-Proofpoint-GUID: L5l0zWZkTlmCejP1dxM3lMC4woylLocu
X-Authority-Analysis: v=2.4 cv=StCQ6OO0 c=1 sm=1 tr=0 ts=68c399d1 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=ycHeTDA2rj_D5xsyEtIA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060195
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 18 Aug 2025 11:24:22 +0200, Christophe Leroy wrote:
> SPRN_M_TWB contains the address of task PGD minus an offset which
> compensates the offset required when accessing the kernel PGDIR.
> However, since commit ac9f97ff8b32 ("powerpc/8xx: Inconditionally use
> task PGDIR in DTLB misses") and commit 33c527522f39 ("powerpc/8xx:
> Inconditionally use task PGDIR in ITLB misses") kernel PGDIR is not
> used anymore in hot pathes.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/8xx: Remove offset in SPRN_M_TWB
      https://git.kernel.org/powerpc/c/96c79fef228157baddae6574555353535772f109

Thanks

