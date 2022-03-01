Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5349D4C8031
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Mar 2022 02:12:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6zkt2rDPz3bbG
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Mar 2022 12:12:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KwgSWeBo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=KwgSWeBo; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6zk7557Lz3bsQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Mar 2022 12:12:15 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22118TrZ002452; 
 Tue, 1 Mar 2022 01:12:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=y9cOgnBQqkUT2f8qiq2iafyknGoL2h7mFVMa/J/xQHE=;
 b=KwgSWeBoy8fI08p4c7ECn5LqE0+8C5dbxW4MPSW2BVN2o7T77wK2TlzqMVW4bPD2aKu7
 llIJ9HxQB0bkLepVzhSaK8mbbXvwjVUTqlUvRRkvkrz6+HTSiY1orVZet1t24onH11gI
 hr/pZ+I3kkstBAYiIhIXI1n8XhQT00+na7DPcbxUZI3de5YFYd2Ay0WUzYyvbr3TgJOf
 nHYXcyyVYKgheCjFuQWzWcq83TKuHMrCR7yiuCymwH6km2tLFwyS1vkwKaFscazA6Uc/
 4hsxm8Fs4bd1C5xzilNxGDKfN898SmWdNoLj1dp54DwdUBMKCVX19+RRF3rrAG9gGpbg tg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3eh32c0k2c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 01:12:11 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 2211A1CM004836;
 Tue, 1 Mar 2022 01:12:10 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3eh32c0k23-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 01:12:10 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2210vZt3023506;
 Tue, 1 Mar 2022 01:12:10 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02wdc.us.ibm.com with ESMTP id 3efbu9rqbh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 01:12:10 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2211C7H317105328
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Mar 2022 01:12:07 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 88652136060;
 Tue,  1 Mar 2022 01:12:07 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 68AC813605D;
 Tue,  1 Mar 2022 01:12:06 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.161.44])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  1 Mar 2022 01:12:06 +0000 (GMT)
Message-ID: <a57cbe6d292fe49ad55a0b49c5679d6a24d8fe73.camel@linux.ibm.com>
Subject: [PATCH v6 2/9] powerpc/pseries/vas: Save PID in pseries_vas_window
 struct
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
 nathanl@linux.ibm.com
Date: Mon, 28 Feb 2022 17:12:04 -0800
In-Reply-To: <3968502921a0ce3c332d7fe8da8545ae85fc09d0.camel@linux.ibm.com>
References: <3968502921a0ce3c332d7fe8da8545ae85fc09d0.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9VqTeB-YH_4VY_cx2ChG9GD1DSO2I-bu
X-Proofpoint-ORIG-GUID: LvaByLt8dhm_lVnQuFdtJqi2saL5NW6-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-28_10,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 priorityscore=1501 mlxscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203010004
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


The kernel sets the VAS window with PID when it is opened in
the hypervisor. During DLPAR operation, windows can be closed and
reopened in the hypervisor when the credit is available. So saves
this PID in pseries_vas_window struct when the window is opened
initially and reuse it later during DLPAR operation.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/platforms/pseries/vas.c | 9 +++++----
 arch/powerpc/platforms/pseries/vas.h | 1 +
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
index 18aae037ffe9..1035446f985b 100644
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
+					win->vas_win.winid, win->pid, 0,
 					VAS_MOD_WIN_FLAGS, 0);
 
 		rc = hcall_return_busy_check(rc);
@@ -124,8 +123,8 @@ static int h_modify_vas_window(struct pseries_vas_window *win)
 	if (rc == H_SUCCESS)
 		return 0;
 
-	pr_err("H_MODIFY_VAS_WINDOW error: %ld, winid %u lpid %u\n",
-			rc, win->vas_win.winid, lpid);
+	pr_err("H_MODIFY_VAS_WINDOW error: %ld, winid %u pid %u\n",
+			rc, win->vas_win.winid, win->pid);
 	return -EIO;
 }
 
@@ -338,6 +337,8 @@ static struct vas_window *vas_allocate_window(int vas_id, u64 flags,
 		}
 	}
 
+	txwin->pid = mfspr(SPRN_PID);
+
 	/*
 	 * Allocate / Deallocate window hcalls and setup / free IRQs
 	 * have to be protected with mutex.
diff --git a/arch/powerpc/platforms/pseries/vas.h b/arch/powerpc/platforms/pseries/vas.h
index d6ea8ab8b07a..2872532ed72a 100644
--- a/arch/powerpc/platforms/pseries/vas.h
+++ b/arch/powerpc/platforms/pseries/vas.h
@@ -114,6 +114,7 @@ struct pseries_vas_window {
 	u64 domain[6];		/* Associativity domain Ids */
 				/* this window is allocated */
 	u64 util;
+	u32 pid;		/* PID associated with this window */
 
 	/* List of windows opened which is used for LPM */
 	struct list_head win_list;
-- 
2.27.0


