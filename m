Return-Path: <linuxppc-dev+bounces-17838-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHVPLAP+qmlcZQEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17838-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 17:17:07 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E53224ADB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 17:17:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fSBPX4163z3cBd;
	Sat, 07 Mar 2026 03:17:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772813824;
	cv=none; b=FqB5aWwrXK+XivR6Eq1aLfg2umuziateweTOjh0YYoWRCyupFXbTCixyu5lheFEkhsFjHIOew9lwbXuGLEcHPKHsYR6jeOEZgXFb0HN1qzg3pxkU8IrI3GZdYWwgF848+WEbK+05SA6bj8kUhoGYy24Xu/ut6R42v//eZiZ8t+k0/5rGu8mkDhjNZSDJzs0w1Aw9IQpMR96xNrdSHvl4C880Xt8Gzgg30jZhPZSAsqJL0ABCwRV+MU3zmlK585UVYVj0SJcuHx7UTPA7X47cdVB3fVfpp2WSxYJIKj48oCwq5rw9m9kkSTJlF83g9RMn7TptgkWwJLBPHcSZEUrP1A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772813824; c=relaxed/relaxed;
	bh=VLTBtbUx77gzumExkwQ+UsZaY5sqhpu/Y8wOE2jbbEc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oeSlb/KyPALaFN5vCMjQYZ18pZXCmBQoE7q50nG9de4xPeYNorvlefQRbnr6rtBzkC4ZgJo3lGNGRH/P/AGEjbA8aC1gqyufuyilIYzS1bDOUND58EjzijxbYnNeOpYmsKXssLg4hLNtClXtKL9qiZ5qMVJ8dzqzpr05ucNIR9xvlDFOTEgWzR4v/1kP9AYB5C5Pygphwxe6qEXnKJ2KXV/CwjiW17xjlDZw6WcoIwu8YnSfbK/wTd58V7WkH3HZpiLZ7yXCJ6ilAfWlqR1xKLocylF4XXXVViiW/rGT6ymRZP7vD6PgOwtrmbpeNGCpjCkQXYrHdqX32RSoz+z8gg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WBTmsmxv; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WBTmsmxv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fSBPW4j27z2ySS
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 07 Mar 2026 03:17:03 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6267lN2m2100389;
	Fri, 6 Mar 2026 16:16:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=VLTBtbUx77gzumExk
	wQ+UsZaY5sqhpu/Y8wOE2jbbEc=; b=WBTmsmxvk8iyjPHSdlTpr2YTLvS6K+CA0
	PrOilBrKGR9EZ3Yw5wwcGokyjRG4tLnjQm74rXetTcvfcUU4Nbe4VKIKwDxqWLr2
	gI00c0nDm5OGDM528Xw4QPFRYuEUIV4jqBK9N6Ogf5lgO82ft7eUxQWfKHduln1o
	aLPCMRzzqs86GoMc+Ad6nDE2eefM0+Porj3yL1NSPX1PRkLFIBsTRAt8rZktcSjU
	Ch0Iz0PlCHpmW82MKLKQZmLSEJS2pfdkxbnsjhX+nOwYlvdlO9/5YXydeAjac2Lv
	Z8Z+JB7UtbhsEFvvPRYmckfaNYhlu5gyaSYB6a13pxND7D7MD870g==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cksk48udd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Mar 2026 16:16:37 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 626EMNp8027692;
	Fri, 6 Mar 2026 16:16:37 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4cmcwjraae-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Mar 2026 16:16:36 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 626GGXVH10354974
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Mar 2026 16:16:33 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 653FA2004D;
	Fri,  6 Mar 2026 16:16:33 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 36A9C20043;
	Fri,  6 Mar 2026 16:16:33 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.87.85.9])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with SMTP;
	Fri,  6 Mar 2026 16:16:33 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 55669)
	id 1EF1CE078F; Fri, 06 Mar 2026 17:16:33 +0100 (CET)
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
Subject: [PATCH v2 4/4] s390: Enable page table check for debug_defconfig
Date: Fri,  6 Mar 2026 17:16:33 +0100
Message-ID: <975007c27f8563e46d66a1fbb4b14ae6a4147edd.1772812343.git.agordeev@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1772812343.git.agordeev@linux.ibm.com>
References: <cover.1772812343.git.agordeev@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: eToHDjTYiyMz7a2sBJeb72YZHB1UF-lQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE1MyBTYWx0ZWRfX25ilnaqkZ1mG
 395rxazo4o/xlOSP7O01w3hOCD2fwuHn/hc8XRx+Hh6uLMLfIsh1YZODI6BGMqB4yqnh7PNfATx
 sYO9Epo62gqmbtyYvpE12E2pUTnTzKY0REnmDUodQ/lkC+QdUjoEsTz85lJtj0bSa/7JWbHwUKw
 S4OzB3YkLOzoK5vG4y1AU3bx6TkPZISueCuc3B4/Y/PZwoAecmg8ZTwZRgn94PCGqfaaiP2+tSE
 gYsNd2oE1FXqB1stqpYj+ol8oVQ4VUYvjOAduAEbIWT5wbxteDBUiuoCMtK7Ry6mu4lNeWzjQBr
 F4pediMuqFgritMq+U4u6HQTpEGvzfw/NCtbei3QFKsPK0U1j8OSqRD6YfzdY6nUDV9RcBco5b3
 ufL3p6bKaEkmzi1BhrbNw6cErKGR1CsSps7IhNSzL7vEA0USc818VxE93Z3mKst7K5ghD14yFLh
 e709UMA8iEzOm0G+9sA==
X-Authority-Analysis: v=2.4 cv=csCWUl4i c=1 sm=1 tr=0 ts=69aafde6 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8 a=ll0qgXPPjJRHf6HrCsAA:9
X-Proofpoint-GUID: eToHDjTYiyMz7a2sBJeb72YZHB1UF-lQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060153
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: F2E53224ADB
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
	TAGGED_FROM(0.00)[bounces-17838-lists,linuxppc-dev=lfdr.de];
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

Reviewed-by: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
---
 arch/s390/configs/debug_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/s390/configs/debug_defconfig b/arch/s390/configs/debug_=
defconfig
index 98fd0a2f51c6..12cdaaefb6db 100644
--- a/arch/s390/configs/debug_defconfig
+++ b/arch/s390/configs/debug_defconfig
@@ -929,3 +929,5 @@ CONFIG_PERCPU_TEST=3Dm
 CONFIG_ATOMIC64_SELFTEST=3Dy
 CONFIG_TEST_BITOPS=3Dm
 CONFIG_TEST_BPF=3Dm
+CONFIG_PAGE_TABLE_CHECK=3Dy
+CONFIG_PAGE_TABLE_CHECK_ENFORCED=3Dy
--=20
2.51.0


