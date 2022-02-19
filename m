Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A37F74BCA8B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Feb 2022 21:02:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K1KGL10Rpz3dhN
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Feb 2022 07:02:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KvkW+bPq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=KvkW+bPq; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K1KFS68zZz3cnl
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Feb 2022 07:01:16 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21JJb8W5012430; 
 Sat, 19 Feb 2022 20:01:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=5VnO48B9sm3EORkcPuZoLrz+7KBeeqDuyHYewCEODNk=;
 b=KvkW+bPqp9ELkClg2rZbecS+kS+OZ0rVBU3zXRrkhfYNka+lfU1Vwr3rQNJDwVnvAoLO
 Rs0oi+im72axIKjVElVSyiPUtpgkc98Spq/Q8mUYMCt04bC2v1BOF1TQuk9K1cO0Qe3i
 FopayYIJ8Au8cuzaJKqAewpzEp+mXP7Y0NGUG4/9Vy/m2bgayW8uIHQwUk8nWcdhA7l2
 9S6mtP5HiUmYC0+LhmrwvqwGMHF3ECm/5dbZskyoMxk7i5K/SIz+AMdnc6hRDZ3KSWHl
 8oxbqjFIFDwL+w8kf3jnfaHixwdAolSBzlMNB6mOfq+lYebuVKsme1/bwpfTqAGu4qjV hg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eb64m8qwx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Feb 2022 20:01:13 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21JK04Ya007434;
 Sat, 19 Feb 2022 20:01:12 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eb64m8qwn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Feb 2022 20:01:12 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21JJwEFg009708;
 Sat, 19 Feb 2022 20:01:11 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma02dal.us.ibm.com with ESMTP id 3ear68ymvd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Feb 2022 20:01:11 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21JK18qR32047452
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 19 Feb 2022 20:01:08 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 80E79AE068;
 Sat, 19 Feb 2022 20:01:08 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C62DCAE060;
 Sat, 19 Feb 2022 20:01:07 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.92.72])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Sat, 19 Feb 2022 20:01:07 +0000 (GMT)
Message-ID: <a54ce2973c12602a73468446076115746fe71cf3.camel@linux.ibm.com>
Subject: [PATCH v4 7/9] powerpc/pseries/vas: Reopen windows with DLPAR core add
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
 nathanl@linux.ibm.com
Date: Sat, 19 Feb 2022 12:01:06 -0800
In-Reply-To: <94434bf320affdde36090c72eeb1372f1d9978ae.camel@linux.ibm.com>
References: <94434bf320affdde36090c72eeb1372f1d9978ae.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: j-FthFDkvge80kI3mVf-suhW-0r6VdSX
X-Proofpoint-ORIG-GUID: FUtcFBWN1oyGaBuPl9wTDylgJyNj70CL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-19_04,2022-02-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0 mlxlogscore=997
 spamscore=0 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202190130
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
requests on these in-active windows. If these credits are
available later for core add, reopen these windows and set them
active. When the OS sees page faults on these active windows,
it creates mapping on the new paste address. Then the user space
can continue to use these windows and send HW compression
requests to NX successfully.

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


