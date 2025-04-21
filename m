Return-Path: <linuxppc-dev+bounces-7850-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 165A3A94ED9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Apr 2025 11:42:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zh0kz68YSz3bnD;
	Mon, 21 Apr 2025 19:42:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745228523;
	cv=none; b=HxnR5dyBH6qlx3urWBAlDw3tfp8SioQPB4x/l/+bJK+MfGSXXmcCrFetgNRTEqzFSDfObW/ItSrxn6vDiiJBcaYzjn5Xa0GEEo4zlcy0euO91qNVuEqIgATrfUuoPp4V14S+cdmb8Cdj0+AdRfq+/FHBZWWyF+EC76NX6KRlG5ok5XbuTPyxSWD+WZTAYvqwg9QD6+r/YNh4rKSAjsx8AgnBxuyM+ZEKQQ1N4vznsRgoIDNCcGTR9U3ORKmxoajR795nc2dvz7139AEcwtPmOOV653obp27R7l6sctXsLwn2eLQ5TibGPJshO2occaQw4TY+ylxZk3VhF5dIeI+Wqg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745228523; c=relaxed/relaxed;
	bh=EZTCnEFSBu1zUn0avF7HfqWXpziQYKcOR9WFDDO/ZQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TFKOt1uPJqiDv/XGSbgEKSQ/mn2g//bb8bI358GBKPAu5aXLjZfERppsjCReNfeB71UiFGKqNat14nRNC1yx8lY9aEw6gd/Wz66VVOEQpuZKKO2iMao4xYNaxoTgZuLJPFiSFz8Wx6pST1+fqtAbfg8/uQJkz8ZbcrewaNpxM8z4P9qsgKyXNEiEF4kYv+Y8munXQOo7pzUzxLX3Dg+fI08S9R9tWi94p2vETXU/5qcODXeunWfebZ2FJdv2ErfGBAJijarhfbRpkKyYO9azjNtadKPGLmBPocDtXZfdiPGiWGLQnGUdJcXxIM0i0SnLCCRMw1xjFPYJeKBTE+cPsQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZxXazLnz; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZxXazLnz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zh0kz10JJz2ySJ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Apr 2025 19:42:02 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53KLeGiL028856;
	Mon, 21 Apr 2025 09:41:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=EZTCnE
	FSBu1zUn0avF7HfqWXpziQYKcOR9WFDDO/ZQ4=; b=ZxXazLnz0algohSn5f5q1u
	j0kp9i48Lu8uUwHgzO/VUvyuBMkeiQpeDpGXcDsSa2TUrGexWv9BWWFlRk8j7LPH
	gb/EqL5/D+NCqb8acq0jWoO/cgbTfwHJRMTvnf+Jp1XclcFQ4lWdRwdXe4cZS0tY
	vKDyaUt0q93kywN3akRVQaWdkbcRJMOfHy3b0VIjH0Gke4tUrU7CaAFhhjLANW65
	RSLIW0exMh5A77WnDpMCOgW7PsB8XN39zIuqYxm7Uu/EzQmRuHuJsmvqd3d7fkE9
	SI0nYXEuWSrOHzCIAOB6Gf1wjoNrM6SV49cYcKNdj0uaEHkIqEhMaFeDdOZVofRQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 465918a7p4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 09:41:51 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53L9WP42027653;
	Mon, 21 Apr 2025 09:41:50 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 465918a7p0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 09:41:50 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53L6JGMr012511;
	Mon, 21 Apr 2025 09:41:49 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 464p5swyab-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 09:41:49 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53L9fkwa39715282
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 09:41:46 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EA40D20192;
	Mon, 21 Apr 2025 09:41:45 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6F81820094;
	Mon, 21 Apr 2025 09:41:41 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.29.154])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 21 Apr 2025 09:41:30 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: naveen@kernel.org, linuxppc-dev@lists.ozlabs.org,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: Re: [PATCH] powerpc/boot: Check for ld-option support
Date: Mon, 21 Apr 2025 15:11:28 +0530
Message-ID: <174516637907.525631.6763647887992748989.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250401004218.24869-1-maddy@linux.ibm.com>
References: <20250401004218.24869-1-maddy@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: nSLDg58PJY5_Vv8CcYxwREC18m-Bnosm
X-Authority-Analysis: v=2.4 cv=Qt9e3Uyd c=1 sm=1 tr=0 ts=680612df cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=aRAxQ_2YecpyahwFiqUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 4eKbJaCoiAzMP0fG3RWntQKJpjNDl3S6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_04,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015 mlxlogscore=999
 suspectscore=0 priorityscore=1501 spamscore=0 malwarescore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210073
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 01 Apr 2025 06:12:18 +0530, Madhavan Srinivasan wrote:
> Commit 579aee9fc594 ("powerpc: suppress some linker warnings in recent linker versions")
> enabled support to add linker option "--no-warn-rwx-segments",
> if the version is greater than 2.39. Similar build warning were
> reported recently from linker version 2.35.2.
> 
> ld: warning: arch/powerpc/boot/zImage.epapr has a LOAD segment with RWX permissions
> ld: warning: arch/powerpc/boot/zImage.pseries has a LOAD segment with RWX permissions
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/boot: Check for ld-option support
      https://git.kernel.org/powerpc/c/b2accfe7ca5bc9f9af28e603b79bdd5ad8df5c0b

Thanks

