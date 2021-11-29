Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39148461CFC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 18:49:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2tBl0F8Kz3cWk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 04:49:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=njy1nqcs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=njy1nqcs; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2t9z4qjTz2x9D
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 04:48:23 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1ATHLsjV001135; 
 Mon, 29 Nov 2021 17:48:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=LwZY66SL1B3cKKjmY5eZpmeVGR/tdJ4OBfmnHB+jSK8=;
 b=njy1nqcsHiHGGJcLtuBU6BBVENkju4b3lMFOilpa9U1QpaMtsSy5s37Gd4jf9rQVj61H
 kLc8xrQG+7lHto7fokswAcjzoCApnqW7H6/gTzu/UqPfk/wveJwI74tjyBqTDbyBgiPn
 w5JWsbk3dnbOMbIvpYJXn759YvEBoF7S/czbgxN71HoSD9GdP4fVkkwAc0hQSezi3Jby
 XikipZLJ4Xj3sGlQ79jL7UVyrrEY1OmJp+qZTsUie6zhb+FKviJKeicUJGXNb2QYvbDM
 Un0gi3K0WNsqmNnM+b9AuA6qI1rlUOsAoJC5xgTDttRwXoN8mYHATEEcuFxBBI5wfMfG WQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cn36t8kan-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 17:48:18 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1ATHMt7k004595;
 Mon, 29 Nov 2021 17:48:17 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cn36t8ka9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 17:48:17 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1ATHhtkR007519;
 Mon, 29 Nov 2021 17:48:16 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma04dal.us.ibm.com with ESMTP id 3ckcab1my5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 17:48:16 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1ATHmFXH39911810
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Nov 2021 17:48:15 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3BE18AE05C;
 Mon, 29 Nov 2021 17:48:15 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 169C8AE067;
 Mon, 29 Nov 2021 17:48:14 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.7.253])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 29 Nov 2021 17:48:13 +0000 (GMT)
Message-ID: <a1b4ffd8f392101be193cd1920f241440d1667fa.camel@linux.ibm.com>
Subject: [PATCH 03/10] powerpc/pseries/vas: Save LPID in pseries_vas_window
 struct
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Date: Mon, 29 Nov 2021 09:48:11 -0800
In-Reply-To: <a2187018b4e030fe6c7e408b3a73c37c85472e10.camel@linux.ibm.com>
References: <a2187018b4e030fe6c7e408b3a73c37c85472e10.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: iYDtqJNu1KtIs3BRueHlRHztfnlHoYRZ
X-Proofpoint-GUID: RltynfheBe7O3L5QWByBd2umQyZXRVKd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-29_10,2021-11-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=999 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111290082
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


The kernel sets the VAS window with partition PID when is opened in
the hypervisor. During DLPAR operation, windows can be closed and
reopened in the hypervisor when the credit is available. So saves
this PID in pseries_vas_window struct when the window is opened
initially and reuse it later during DLPAR operation.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/vas.c | 6 +++---
 arch/powerpc/platforms/pseries/vas.h | 1 +
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
index 04a6eee2301e..6b35f67d5175 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -107,7 +107,6 @@ static int h_deallocate_vas_window(u64 winid)
 static int h_modify_vas_window(struct pseries_vas_window *win)
 {
 	long rc;
-	u32 lpid = mfspr(SPRN_PID);
 
 	/*
 	 * AMR value is not supported in Linux VAS implementation.
@@ -115,7 +114,7 @@ static int h_modify_vas_window(struct pseries_vas_window *win)
 	 */
 	do {
 		rc = plpar_hcall_norets(H_MODIFY_VAS_WINDOW,
-					win->vas_win.winid, lpid, 0,
+					win->vas_win.winid, win->lpid, 0,
 					VAS_MOD_WIN_FLAGS, 0);
 
 		rc = hcall_return_busy_check(rc);
@@ -125,7 +124,7 @@ static int h_modify_vas_window(struct pseries_vas_window *win)
 		return 0;
 
 	pr_err("H_MODIFY_VAS_WINDOW error: %ld, winid %u lpid %u\n",
-			rc, win->vas_win.winid, lpid);
+			rc, win->vas_win.winid, win->lpid);
 	return -EIO;
 }
 
@@ -353,6 +352,7 @@ static struct vas_window *vas_allocate_window(int vas_id, u64 flags,
 	if (rc)
 		goto out;
 
+	txwin->lpid = mfspr(SPRN_PID);
 	/*
 	 * Modify window and it is ready to use.
 	 */
diff --git a/arch/powerpc/platforms/pseries/vas.h b/arch/powerpc/platforms/pseries/vas.h
index fa7ce74f1e49..0538760d13be 100644
--- a/arch/powerpc/platforms/pseries/vas.h
+++ b/arch/powerpc/platforms/pseries/vas.h
@@ -115,6 +115,7 @@ struct pseries_vas_window {
 	u64 domain[6];		/* Associativity domain Ids */
 				/* this window is allocated */
 	u64 util;
+	u32 lpid;
 
 	/* List of windows opened which is used for LPM */
 	struct list_head win_list;
-- 
2.27.0


