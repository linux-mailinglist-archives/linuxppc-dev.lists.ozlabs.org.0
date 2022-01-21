Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A60496618
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 20:56:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JgVWN1wwlz3cCT
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jan 2022 06:56:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=o6T9JswH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=o6T9JswH; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JgVVb0rk0z3cSq
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jan 2022 06:55:50 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20LHBfAZ034223; 
 Fri, 21 Jan 2022 19:55:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=3y2UFvlYK/xgo83QCra735KsEZ33Q3tT1plYk1Nihoo=;
 b=o6T9JswHW2RMRoTLok0cvVIoQ+AkdHhzyralfgLeQsIvqnGn91jEjX0QJU37IhdVJqMg
 HOVFs8qnp0d6rUJYgYD8mSJvRYoMx8+XsXvnopMCDpJIQXVmEo7vdqPiH1GK4Hwp93bB
 3zwfX8mPi/pzCjtJH+7GSI87Ttj0+qLkhRWaShamFlaEpZth3n+J6k0AkzIRTRcWyLdF
 /HqgiTOi3u/Jv0qdYNJTFh82jkbX3NkojUEKYmIXTZ3eERxLhiTX1lggliBncScaDVZc
 mSbeas9QIFZd4sZu/e2rk4Ph9dRAUSgfA0qdP1JrfaIxeMQ/qCBCmZQ9cVTitcoFNUCX Eg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dr10xb57a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Jan 2022 19:55:46 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20LJUSrY011025;
 Fri, 21 Jan 2022 19:55:46 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dr10xb56v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Jan 2022 19:55:46 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20LJqUI6030368;
 Fri, 21 Jan 2022 19:55:45 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma02wdc.us.ibm.com with ESMTP id 3dqjay9vwp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Jan 2022 19:55:45 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20LJtia934537728
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Jan 2022 19:55:44 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1B7C5B206A;
 Fri, 21 Jan 2022 19:55:44 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AC527B205F;
 Fri, 21 Jan 2022 19:55:42 +0000 (GMT)
Received: from sig-9-77-130-163.ibm.com (unknown [9.77.130.163])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 21 Jan 2022 19:55:42 +0000 (GMT)
Message-ID: <df3c8452ec619744bdd5a0fde901645537c1b7b4.camel@linux.ibm.com>
Subject: [PATCH v3 03/10] powerpc/pseries/vas: Save LPID in
 pseries_vas_window struct
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Date: Fri, 21 Jan 2022 11:55:40 -0800
In-Reply-To: <7d175313528ea7aae20d9141f0efa2e57f44c9f4.camel@linux.ibm.com>
References: <7d175313528ea7aae20d9141f0efa2e57f44c9f4.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: tma_8jWA_E9TnANfC7BZMe-Go6F99PoZ
X-Proofpoint-GUID: 1GUhIoZeMVdsgAjDMG5Hz2KAewQNS_d1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-21_09,2022-01-21_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 impostorscore=0 mlxscore=0
 mlxlogscore=999 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2201210127
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
 arch/powerpc/platforms/pseries/vas.c | 7 ++++---
 arch/powerpc/platforms/pseries/vas.h | 1 +
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/vas.c
b/arch/powerpc/platforms/pseries/vas.c
index d2c8292bfb33..2ef56157634f 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -107,7 +107,6 @@ static int h_deallocate_vas_window(u64 winid)
 static int h_modify_vas_window(struct pseries_vas_window *win)
 {
 	long rc;
-	u32 lpid = mfspr(SPRN_PID);
 
 	/*
 	 * AMR value is not supported in Linux VAS implementation.
@@ -115,7 +114,7 @@ static int h_modify_vas_window(struct
pseries_vas_window *win)
 	 */
 	do {
 		rc = plpar_hcall_norets(H_MODIFY_VAS_WINDOW,
-					win->vas_win.winid, lpid, 0,
+					win->vas_win.winid, win->lpid,
0,
 					VAS_MOD_WIN_FLAGS, 0);
 
 		rc = hcall_return_busy_check(rc);
@@ -125,7 +124,7 @@ static int h_modify_vas_window(struct
pseries_vas_window *win)
 		return 0;
 
 	pr_err("H_MODIFY_VAS_WINDOW error: %ld, winid %u lpid %u\n",
-			rc, win->vas_win.winid, lpid);
+			rc, win->vas_win.winid, win->lpid);
 	return -EIO;
 }
 
@@ -338,6 +337,8 @@ static struct vas_window *vas_allocate_window(int
vas_id, u64 flags,
 		}
 	}
 
+	txwin->lpid = mfspr(SPRN_PID);
+
 	/*
 	 * Allocate / Deallocate window hcalls and setup / free IRQs
 	 * have to be protected with mutex.
diff --git a/arch/powerpc/platforms/pseries/vas.h
b/arch/powerpc/platforms/pseries/vas.h
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


