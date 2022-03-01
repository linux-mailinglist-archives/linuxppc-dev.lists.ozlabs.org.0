Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC0E4C803E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Mar 2022 02:16:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6zpz4Gcxz3dpr
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Mar 2022 12:16:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Celih2Hr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Celih2Hr; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6znZ5kR0z3cjL
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Mar 2022 12:15:14 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2211C5vj000927; 
 Tue, 1 Mar 2022 01:15:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=uLXan/TyH5Mg4e5vbbSUZnpYF8rmOvSa3OJHKqoeQhE=;
 b=Celih2Hrd/gHO0ozaK2PjN5YhbVfQ6h10mBD3T++xHgVebv89pZiHMtI00GOQvHePCn1
 gQeFqpMHV/d2g6YorQEzermX9snQ9Ck8wbAT/9PDWJW8wY2u0TxV/c4pEH2YT42PcUMW
 u+PITsXwH1hKJOIniRD8UGcJ0opdK1xHcNPW8Pe0BS7hmKIYS4uFb99tEZyLVCKxcdli
 9eGYmX4/8Vhdxa39PkCLGExtd5sryK/ns68Nh8h6BvwBsAafBzZHy0JqVMYm7vyW1DYL
 p6kUAfxYEjBDQFm+aUBR+yY6QVJLUSivuz2pWcJxNmWz60Oj5Q0NTcF81BxSRn/Hhgy/ kg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3eh9m0g1r3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 01:15:09 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 2211D453003564;
 Tue, 1 Mar 2022 01:15:09 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3eh9m0g1qw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 01:15:09 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2210vYhM001215;
 Tue, 1 Mar 2022 01:15:08 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma01wdc.us.ibm.com with ESMTP id 3efbu9gnnr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 01:15:08 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2211F71B39190936
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Mar 2022 01:15:07 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1D52028068;
 Tue,  1 Mar 2022 01:15:07 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E7D228064;
 Tue,  1 Mar 2022 01:15:06 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.161.44])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  1 Mar 2022 01:15:06 +0000 (GMT)
Message-ID: <d9f360e21355e6826142c81146acfa9b60bc7ecc.camel@linux.ibm.com>
Subject: [PATCH v6 7/9] powerpc/pseries/vas: Reopen windows with DLPAR core add
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
 nathanl@linux.ibm.com
Date: Mon, 28 Feb 2022 17:15:04 -0800
In-Reply-To: <3968502921a0ce3c332d7fe8da8545ae85fc09d0.camel@linux.ibm.com>
References: <3968502921a0ce3c332d7fe8da8545ae85fc09d0.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: fVtDXUXChpVIsOZr60oR8OSJervgCNLT
X-Proofpoint-GUID: K0xXxUIDXk67L2aK5zcWAFpw2TpyNIiI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-28_10,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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


