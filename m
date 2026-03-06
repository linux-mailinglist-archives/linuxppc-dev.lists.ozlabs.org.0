Return-Path: <linuxppc-dev+bounces-17837-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2JBFLvz9qmkIZQEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17837-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 17:17:00 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC0B224ACA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 17:16:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fSBPP0YGQz3bfV;
	Sat, 07 Mar 2026 03:16:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772813816;
	cv=none; b=H7Ux/jOYA1dIUIYpWo+kdCejvB2lvRvxsLrgoO0eJY6eZG1XpWjg5zZdJaKkr8QYqpLU9WfMMVajb+XVo2hmtzJiScxU1sW4k9j75c5a6Yx4uAPKSpW7KFXmpiVlgpHpz6maTtF8vmlMK5DptNkGDSuSoEUADYxYXfNOJcWWnXXhXsOMudaU+sHSyffLhJl9nV3Gfq0dGcqCA7eTdyP7L2mM9WumPmlOEYnNICVsaT/+vQsLYwrc6DmwTw89usfFQ0Mpa4a9cKuwlEWOaSWq6ofbJn1BnmwLKdeqLbyqfpfitZgC+jIxDmocrLmjzOPG/XU17lXLQLmiDBDReXbXrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772813816; c=relaxed/relaxed;
	bh=+G8YAzU9aZ4wHaSHLLYbGlbpJK697IOJOmxNBpIK2i4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WgaadsjuWt0qe/YKrv+FefcrCU2Xbgj7G6kbNGxuaNovA7fbYujPsltLwtobcp9pJo18nf5upmgbc/BTu6ZPZvufaYhyuTf9RAoSut7H3WzVC26rHG6DTjsz0v6EVWYVtNkswgzNifflxuggDFcZ71RLnox3F7OGaJYjoDN9Q379+jcHy63zFAP2nMScRyXxTXyLO+NKoKDNoxQko1ajcXXuIOoGEi2vS9aSiZIfIlFl4+wMu1sdI57P4Wg1j5iK+QLPMEy+eCXUMHQDAmTk6WhjkI5WGHzyssRm+B5r/ZS8gWSqYWxcXnhzIVjGjvTLWtzOrF17lsch/BFXtuYTpQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MWKA3yLd; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MWKA3yLd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fSBPM2TDXz2ySS
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 07 Mar 2026 03:16:55 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6263HxfH1457437;
	Fri, 6 Mar 2026 16:16:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=+G8YAzU9aZ4wHaSHLLYbGlbpJK697IOJOmxNBpIK2
	i4=; b=MWKA3yLdHbUL0Z+CCDv1QCB4T3rbF9uIaHW3wDIXi9GwyeLJa05dtLG6m
	D/XWX4VadkaCcjr/VFcgC8BYJgVFTHrnCQlGWBKZpsp+bZqdPe8HWCKGu5XZOee/
	XyFoSiCGUncOrzAp3PC0iteD+QCIkssWQNsSdimkARZF1Qk5IWtnyiNGm3+ZVTIT
	94FB+vyrdv/teO72Enezf+CKOBVfh8MWVL+q6Rfcfu3diZC4HhDEv2pUxFRXdDMM
	rkOIkl/wHCwEHtAJAMDveQUgLSIQQfyJDfsVg0b37VpbE4eEwtdoK53mlWdfVzBS
	0zPzdC+XfyW8voVjdHKjDs3cFI/7w==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cksrjhg6r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Mar 2026 16:16:38 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 626ETQ4X010327;
	Fri, 6 Mar 2026 16:16:37 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4cmc6kgfvx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Mar 2026 16:16:37 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 626GGXVv22086118
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Mar 2026 16:16:33 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5B7692004B;
	Fri,  6 Mar 2026 16:16:33 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2CEB620040;
	Fri,  6 Mar 2026 16:16:33 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.87.85.9])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with SMTP;
	Fri,  6 Mar 2026 16:16:33 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 55669)
	id 13D53E077D; Fri, 06 Mar 2026 17:16:33 +0100 (CET)
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Pasha Tatashin <pasha.tatashin@soleen.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>
Cc: linux-s390@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        x86@kernel.org
Subject: mm/pgtable: Support for page table check on s390
Date: Fri,  6 Mar 2026 17:16:29 +0100
Message-ID: <cover.1772812343.git.agordeev@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
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
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=Rp/I7SmK c=1 sm=1 tr=0 ts=69aafde6 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=iQ6ETzBq9ecOQQE5vZCe:22 a=WsTHFn69kSnc_5uNAH0A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE1MyBTYWx0ZWRfXz7XFdJ/VpJJm
 opiQLgcTw3l/dib7koF+ZwarAMZuXE76kXtrZUVa+Pf/c9GCVeg9EO4Lg/eT2AsuLtH/MHzpsGh
 9kSejWQNGueM4b6u4kPv0D21crlPSIPKL5/yszro+QzKd1Phh9jjRo5phDJRgQcebwFNLQfDxPN
 G0gjKxm2EOEiLlM/ZIcyKO2hLIafG7r17rRi10wih2qg3TAseSQ1K2kK6wnmZHsBCjpbBLu9SM1
 d1vpGY257ZVm/u3Hl1Uat779TQCm5c9Yo4KDanQS7qVkunnOtc+iUGEc93EaxQomCr/WB5dVcpd
 x4J8LI2eJpWyMiFuAeJggXqy4xo9so8AcepmuGK6fKgFj2v0X89F+316Ujonxr3Ft4Uf4P90L37
 w+gfcnnveoypMrWN2lj6kx0JLYL67mnB192pj30rqSi3N7I8S+RZUpvEGvZLl7T6PNbl3VZ8YJ9
 MKs7N0dUuyHTDkmBitw==
X-Proofpoint-GUID: WWK__Q3nr7cGNKzcN7KeoYhaVB95iFrP
X-Proofpoint-ORIG-GUID: WWK__Q3nr7cGNKzcN7KeoYhaVB95iFrP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060153
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: CCC0B224ACA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-17837-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER(0.00)[agordeev@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:pasha.tatashin@soleen.com,m:akpm@linux-foundation.org,m:gor@linux.ibm.com,m:hca@linux.ibm.com,m:linux-s390@vger.kernel.org,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:x86@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo];
	FROM_NEQ_ENVFROM(0.00)[agordeev@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Action: no action

Hi All,

In v7.0-rc1 page table check support for PPC was added, which
conflicted with this series v1. Thus the only change in v2 is
PPC headers update, which still is NOP for non-s390.

I only did compile test for PPC.

Thanks!

Alexander Gordeev (2):
  s390/pgtable: Use set_pmd_bit() to invalidate PMD entry
  s390: Enable page table check for debug_defconfig

Tobias Huschle (2):
  mm/page_table_check: Pass mm_struct to pxx_user_accessible_page()
  s390/pgtable: Add s390 support for page table check

 arch/arm64/include/asm/pgtable.h             |  6 +-
 arch/powerpc/include/asm/book3s/32/pgtable.h |  2 +-
 arch/powerpc/include/asm/book3s/64/pgtable.h | 10 ++--
 arch/powerpc/include/asm/nohash/pgtable.h    |  2 +-
 arch/powerpc/include/asm/pgtable.h           |  4 +-
 arch/riscv/include/asm/pgtable.h             |  6 +-
 arch/s390/Kconfig                            |  1 +
 arch/s390/configs/debug_defconfig            |  2 +
 arch/s390/include/asm/pgtable.h              | 60 +++++++++++++++++---
 arch/x86/include/asm/pgtable.h               |  6 +-
 mm/page_table_check.c                        | 15 ++---
 11 files changed, 80 insertions(+), 34 deletions(-)

--=20
2.51.0


