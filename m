Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CC89F29FA7E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 02:23:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMl1H1TTzzDqc4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 12:22:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=slSddG9q; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMkvn4kBnzDqkB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 12:18:13 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09U0k6S9185051
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 21:18:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=m2WmM7p6zuWrSSsrRY4O6jRZ98DqYPr9qJ38wf5tlF8=;
 b=slSddG9qTi3vP9D3YAAdFVxjPkVA6azamrOqeF/gMwUgxkE+Z35fMuOpVL908o93DFI2
 Vy9jx+R3QkBaIk7j3OcV6yZKfxXiqt+mK+Rr6J7V8C37xmBO5rsMc0tdWO9k78b1MuVI
 DX/LU6Bg2pSWtrmofyazQWCqawTToaDH3RbpZd7Klg4G1z5HEaTfwAyomANevMxaays7
 qFRTfaAewq60JnmNu00Doh7sLV7pQanbTUrMyzpn1Ub/qQ1vwAXWi9igqavi/wgbsQ1A
 uOU9k3EBBDcibbjW11ym522tMR6IhiHjFs3T1F05UjAb9D0qQi0Qk62g1izNIMZno2CI qg== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34g31d27f3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 21:18:10 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09U1F1rn026095
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 01:18:09 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02wdc.us.ibm.com with ESMTP id 34dy04nx89-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 01:18:09 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09U1I06D61800846
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Oct 2020 01:18:00 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 13F15C6057;
 Fri, 30 Oct 2020 01:18:08 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C6DC3C6055;
 Fri, 30 Oct 2020 01:18:07 +0000 (GMT)
Received: from localhost (unknown [9.65.225.148])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 30 Oct 2020 01:18:07 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 02/29] powerpc/rtas: prevent suspend-related sys_rtas use on LE
Date: Thu, 29 Oct 2020 20:17:38 -0500
Message-Id: <20201030011805.1224603-3-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201030011805.1224603-1-nathanl@linux.ibm.com>
References: <20201030011805.1224603-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-29_12:2020-10-29,
 2020-10-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 clxscore=1015 suspectscore=1 adultscore=0 malwarescore=0
 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010300001
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: tyreld@linux.ibm.com, ajd@linux.ibm.com, mmc@linux.vnet.ibm.com,
 cforno12@linux.vnet.ibm.com, drt@linux.vnet.ibm.com, brking@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While drmgr has had work in some areas to make its RTAS syscall
interactions endian-neutral, its code for performing partition
migration via the syscall has never worked on LE. While it is able to
complete ibm,suspend-me successfully, it crashes when attempting the
subsequent ibm,update-nodes call.

drmgr is the only known (or plausible) user of these ibm,suspend-me,
ibm,update-nodes, and ibm,update-properties, so allow them only in
big-endian configurations.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/kernel/rtas.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index b40fc892138b..132b2ae39009 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -1049,9 +1049,11 @@ static struct rtas_filter rtas_filters[] __ro_after_init = {
 	{ "set-time-for-power-on", -1, -1, -1, -1, -1 },
 	{ "ibm,set-system-parameter", -1, 1, -1, -1, -1 },
 	{ "set-time-of-day", -1, -1, -1, -1, -1 },
+#ifdef CONFIG_CPU_BIG_ENDIAN
 	{ "ibm,suspend-me", -1, -1, -1, -1, -1 },
 	{ "ibm,update-nodes", -1, 0, -1, -1, -1, 4096 },
 	{ "ibm,update-properties", -1, 0, -1, -1, -1, 4096 },
+#endif
 	{ "ibm,physical-attestation", -1, 0, 1, -1, -1 },
 };
 
-- 
2.25.4

