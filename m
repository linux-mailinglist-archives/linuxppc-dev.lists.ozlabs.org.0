Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25ED24C6431
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Feb 2022 08:58:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6Xmr1VLDz3bq6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Feb 2022 18:58:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hYHJj9ew;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=hYHJj9ew; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6Xlq4Tzsz2ybK
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Feb 2022 18:57:11 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21S7cOgr018309; 
 Mon, 28 Feb 2022 07:57:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=uLXan/TyH5Mg4e5vbbSUZnpYF8rmOvSa3OJHKqoeQhE=;
 b=hYHJj9ewVBXBqW6ZzV1iSaNR1v/pHauiUHC1hfCQtNKFapoE6R79smcfWqeQ7FzKm7H9
 SPX6en7j2/0Qh/9WyR/yNKntFejICtpiQsSt650WClTIOHV8C+WEdrZtRFtHRDgLmwuy
 yb8PAgQXEvANdSi80D7wYlcb8+T24kVgoNj/aZaUGzu49WCObskUwXHH4k4lfAWE96MR
 YklHLGWYX/Kt4JwTZp4ijyUIsu1aTxTwN80RE9Z7QJatq5ekXfRFwAUylMAcYvTTzb8O
 ufKd0+womigELUD75De8pROoT7aJwycaiN5AsQNXZEMlyQGJrYB0B6DbBjBkfYcQndDA EQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3egrgjjtt4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 07:57:08 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21S7kInV008869;
 Mon, 28 Feb 2022 07:57:08 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3egrgjjtm3-23
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 07:57:07 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21S7bMEX016688;
 Mon, 28 Feb 2022 07:43:35 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02dal.us.ibm.com with ESMTP id 3efbu9xcg6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 07:43:35 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21S7hWwU29032884
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Feb 2022 07:43:33 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DF959C6059;
 Mon, 28 Feb 2022 07:43:32 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CB234C605A;
 Mon, 28 Feb 2022 07:43:31 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.161.44])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 28 Feb 2022 07:43:31 +0000 (GMT)
Message-ID: <28845e4563f570404c32dbb2b3b7583d084e7def.camel@linux.ibm.com>
Subject: [PATCH v5 7/9] powerpc/pseries/vas: Reopen windows with DLPAR core add
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
 nathanl@linux.ibm.com
Date: Sun, 27 Feb 2022 23:43:30 -0800
In-Reply-To: <ccd9c0f85005c56b4d011d5c2384444ae71bda69.camel@linux.ibm.com>
References: <ccd9c0f85005c56b4d011d5c2384444ae71bda69.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: O58M94DKImIa36Vukw9Xrj_o19ONg5v5
X-Proofpoint-ORIG-GUID: 8bHKxL2Hz8-HgWEyqm1Kjvg2cDg_W9ER
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-28_02,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202280043
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


VAS windows can be closed in the hypervisor due to lost credits
when the core is removed and the kernel gets fault for NX
requests on these inactive windows. If the NX requests are
issued on these inactive windows, OS gets page faults and the
paste failure will be returned to the user space. If the lost
credits are available later with core add, reopen these windows
and set them active. Later when the OS sees page faults on these
active windows, it creates mapping on the new paste address.
Then the user space can continue to use these windows and send
HW compression requests to NX successfully.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/vas.c | 91 +++++++++++++++++++++++++++-
 1 file changed, 90 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
index a297720bcdae..96178dd58adf 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -565,6 +565,88 @@ static int __init get_vas_capabilities(u8 feat, enum vas_cop_feat_type type,
 	return 0;
 }
 
+/*
+ * VAS windows can be closed due to lost credits when the core is
+ * removed. So reopen them if credits are available due to DLPAR
+ * core add and set the window active status. When NX sees the page
+ * fault on the unmapped paste address, the kernel handles the fault
+ * by setting the remapping to new paste address if the window is
+ * active.
+ */
+static int reconfig_open_windows(struct vas_caps *vcaps, int creds)
+{
+	long domain[PLPAR_HCALL9_BUFSIZE] = {VAS_DEFAULT_DOMAIN_ID};
+	struct vas_cop_feat_caps *caps = &vcaps->caps;
+	struct pseries_vas_window *win = NULL, *tmp;
+	int rc, mv_ents = 0;
+
+	/*
+	 * Nothing to do if there are no closed windows.
+	 */
+	if (!vcaps->nr_close_wins)
+		return 0;
+
+	/*
+	 * For the core removal, the hypervisor reduces the credits
+	 * assigned to the LPAR and the kernel closes VAS windows
+	 * in the hypervisor depends on reduced credits. The kernel
+	 * uses LIFO (the last windows that are opened will be closed
+	 * first) and expects to open in the same order when credits
+	 * are available.
+	 * For example, 40 windows are closed when the LPAR lost 2 cores
+	 * (dedicated). If 1 core is added, this LPAR can have 20 more
+	 * credits. It means the kernel can reopen 20 windows. So move
+	 * 20 entries in the VAS windows lost and reopen next 20 windows.
+	 */
+	if (vcaps->nr_close_wins > creds)
+		mv_ents = vcaps->nr_close_wins - creds;
+
+	list_for_each_entry_safe(win, tmp, &vcaps->list, win_list) {
+		if (!mv_ents)
+			break;
+
+		mv_ents--;
+	}
+
+	list_for_each_entry_safe_from(win, tmp, &vcaps->list, win_list) {
+		/*
+		 * Nothing to do on this window if it is not closed
+		 * with VAS_WIN_NO_CRED_CLOSE
+		 */
+		if (!(win->vas_win.status & VAS_WIN_NO_CRED_CLOSE))
+			continue;
+
+		rc = allocate_setup_window(win, (u64 *)&domain[0],
+					   caps->win_type);
+		if (rc)
+			return rc;
+
+		rc = h_modify_vas_window(win);
+		if (rc)
+			goto out;
+
+		mutex_lock(&win->vas_win.task_ref.mmap_mutex);
+		/*
+		 * Set window status to active
+		 */
+		win->vas_win.status &= ~VAS_WIN_NO_CRED_CLOSE;
+		mutex_unlock(&win->vas_win.task_ref.mmap_mutex);
+		win->win_type = caps->win_type;
+		if (!--vcaps->nr_close_wins)
+			break;
+	}
+
+	return 0;
+out:
+	/*
+	 * Window modify HCALL failed. So close the window to the
+	 * hypervisor and return.
+	 */
+	free_irq_setup(win);
+	h_deallocate_vas_window(win->vas_win.winid);
+	return rc;
+}
+
 /*
  * The hypervisor reduces the available credits if the LPAR lost core. It
  * means the excessive windows should not be active and the user space
@@ -673,7 +755,14 @@ static int vas_reconfig_capabilties(u8 type)
 	 * closed / reopened. Hold the vas_pseries_mutex so that the
 	 * the user space can not open new windows.
 	 */
-	if (old_nr_creds >  new_nr_creds) {
+	if (old_nr_creds <  new_nr_creds) {
+		/*
+		 * If the existing target credits is less than the new
+		 * target, reopen windows if they are closed due to
+		 * the previous DLPAR (core removal).
+		 */
+		rc = reconfig_open_windows(vcaps, new_nr_creds - old_nr_creds);
+	} else {
 		/*
 		 * # active windows is more than new LPAR available
 		 * credits. So close the excessive windows.
-- 
2.27.0


