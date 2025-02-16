Return-Path: <linuxppc-dev+bounces-6223-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF9AA37637
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Feb 2025 18:13:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ywsn20Jntz2yl1;
	Mon, 17 Feb 2025 04:13:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739725990;
	cv=none; b=Mf9jz0KxgqWJBDgFhnk8GVWSQhlnhtSQvQ1E4GPIbXuspuI0SfjquRf6Xjd4O1HMStRUFjyqsg500DG8a8iGm/4hCxasClmbhnEFW3n6R7ZnxfVGJsidXRtzYSAodEn02VBsmvdbdYBq/+mvqBSXWakpkd9qo6uq00yszOdyFwBz2FYUqkiVtCCCqSoqtrt3G0vLtsElaL9c/OIYaPap/ckRDDD5fauEwPjboPqNQXaoyINEeMWEWeW4Dr6t2NI1L5qgxf7f4CmiQhNk3AbR7W+p7oUOgCw0ADcNzlR3qwyCVXEtuJZNoXY/BQ80D61KgViyRzWcVl0dGY9SK4UDgA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739725990; c=relaxed/relaxed;
	bh=90CoObBLZsv3roY2ud6VxoEUz9FDMG9EmCX+Qs3xKlY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kM7uXokEIqYLseQ6ZQiutf/4o+1SRx1XXRAAQbrB0X/BQTtkXvTXhCDrfT5mXO1gh+CIpIh/a6cLNw3pHcjrOFaf1uu3tT3HWDqZdTiLlcsO9oKr1tqhYfmM9pMVbClxi6DY8mYpks8XHZlXSX2fxE5eezMnpLzVwoIYacxrwQfURhQOQ7I10eibs6y40V7SHa6lr6IpNv49/0OoIEX7nikkudrHemv6bv7iooQNqNkAdWxbxj0tVycF7lGeWEEb9Jfr/opUP1z0WOlDh+g3Zqd7xJRjWAqgY5USbSn5zTImGwKVZ9bY75/7z+wM9OAzLrwDmsX2m/cP3EEwelIsmg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jPybvyBf; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jPybvyBf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ywsn13105z2yDr
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 04:13:09 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51GFeOxH032446;
	Sun, 16 Feb 2025 17:12:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=90CoObBLZsv3roY2u
	d6VxoEUz9FDMG9EmCX+Qs3xKlY=; b=jPybvyBffWb+SEf8mvPESLcjmtQxndzxO
	R0fL2BavmpxuzAiK9uWwIe6tEBZWf8dcibiYBrkcHjo4yt1ZsP9lf5262UQ/1GOL
	eJlq/YTk8Sl9RuiysBYYaf1uZAX/calcKKUPJFuyctAW12QVjbcPy7CaK2rwd197
	PGPTquvX7sSXHCELsBOfnN54+sbWblXyZLaG4jcb1OdFquMiVqBbXMUa5MjCRUX7
	8KfBxLNIV0nahRM1JgDVV1SlZf1wA/+ImHcOZ5XxyMH2eXnP1wT3d3vjXuWO4ASS
	2V0OVxvlsYUdxCfgt4JBs8+GG300bMYWR4n79R1mGYoJIM5hGDkvA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44ujutg7a7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 16 Feb 2025 17:12:59 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51GHCx6v015280;
	Sun, 16 Feb 2025 17:12:59 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44ujutg7a5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 16 Feb 2025 17:12:59 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51GDlBcY013298;
	Sun, 16 Feb 2025 17:12:58 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 44u7fka9vj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 16 Feb 2025 17:12:58 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51GHCtGS40173844
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 16 Feb 2025 17:12:55 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EEC0720049;
	Sun, 16 Feb 2025 17:12:54 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D95E820040;
	Sun, 16 Feb 2025 17:12:50 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.47.251])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 16 Feb 2025 17:12:50 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu
Cc: naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [PATCH 3/4] powerpc/perf/hv-gpci: Avoid loading hv-gpci pmu during dump kernel
Date: Sun, 16 Feb 2025 22:42:25 +0530
Message-ID: <20250216171226.432906-3-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250216171226.432906-1-maddy@linux.ibm.com>
References: <20250216171226.432906-1-maddy@linux.ibm.com>
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
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: v1dcjgNZ9smDDuP70LyjbQD9qYHJdNRq
X-Proofpoint-GUID: GyeziXSbw2VYk9VIMCI3THUSDCTwm0fK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-16_05,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 mlxlogscore=999
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502160154
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

hv-gpci pmu driver is intended to get powervm hypervisor
system-wide metrics and this may not be used during the
dump kernel, avoid loading it

Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
 arch/powerpc/perf/hv-gpci.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/perf/hv-gpci.c b/arch/powerpc/perf/hv-gpci.c
index 241551d1282f..e0c3df0a048f 100644
--- a/arch/powerpc/perf/hv-gpci.c
+++ b/arch/powerpc/perf/hv-gpci.c
@@ -989,6 +989,9 @@ static int hv_gpci_init(void)
 	struct hv_perf_caps caps;
 	struct hv_gpci_request_buffer *arg;
 
+	if (is_kdump_kernel() || is_fadump_active())
+		return 0;
+
 	hv_gpci_assert_offsets_correct();
 
 	if (!firmware_has_feature(FW_FEATURE_LPAR)) {
-- 
2.47.0


