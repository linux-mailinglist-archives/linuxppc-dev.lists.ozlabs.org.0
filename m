Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C8F47DBFE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Dec 2021 01:27:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JK9xn0fNwz3cYC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Dec 2021 11:27:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JXjp7ESG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=JXjp7ESG; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JK9x33Vfsz3cTX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Dec 2021 11:26:47 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BN0Bvao018808; 
 Thu, 23 Dec 2021 00:26:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=T0+sGLFLRScnS3wObS6zZBimCWSD9bbnq1jXaZO2V60=;
 b=JXjp7ESGpcatTML30RGrmp/SXhDtxoHPm93MarNx88CduSvDmfRrG+NOMsagzkUFv6jU
 H47dYdMrLqZkdGAc1ln0WFg2Q7iI4vmXEb/IkxyYIuIsKqhTUpBTb1rFSllnoDJXRhLa
 qrgCN9rpDAaWggtfo7d0/gjHUU/pAgGbqY2taNRJ5CmsRH/nvYPm0JpUZHu9jaluDNRW
 npkC/mbS4uEeM/zm9RbvVmLI9WVbQZL7HWwf5i5hp/4BUjiBfTYCA33a0oX4GnQnykKc
 nBoGieiwlo3oGUWRIRw1pRLyQSJ1GM5488ReA8RioBVwyLtyTLSb6rPsLZ2T8sxouOhX aA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d4ebsr5xv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Dec 2021 00:26:43 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BN0QgPn032596;
 Thu, 23 Dec 2021 00:26:42 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d4ebsr5xq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Dec 2021 00:26:42 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BN0DViI022177;
 Thu, 23 Dec 2021 00:26:41 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01wdc.us.ibm.com with ESMTP id 3d179b86m6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Dec 2021 00:26:41 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BN0QeTu12583432
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Dec 2021 00:26:40 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CFFDDBE05A;
 Thu, 23 Dec 2021 00:26:40 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E41DCBE051;
 Thu, 23 Dec 2021 00:26:39 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.90.83])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 23 Dec 2021 00:26:39 +0000 (GMT)
Message-ID: <56856b5860fd9191fb8fdb26f19852f7bbb28467.camel@linux.ibm.com>
Subject: [PATCH v2 03/10] powerpc/pseries/vas: Save LPID in
 pseries_vas_window struct
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Date: Wed, 22 Dec 2021 16:26:38 -0800
In-Reply-To: <9d1730d5e0daf39ef17196b4699294dc2ccf4a63.camel@linux.ibm.com>
References: <9d1730d5e0daf39ef17196b4699294dc2ccf4a63.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: tOY-BvbU9Hazal1t8gPUxm4Og5h01Vfe
X-Proofpoint-GUID: QSFbPe7OXbNMH8T-POgjjXE3O4tWq22y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-22_09,2021-12-22_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015
 lowpriorityscore=0 spamscore=0 suspectscore=0 mlxscore=0 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112220124
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

diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
index 04a6eee2301e..fb6e6a6261a5 100644
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
 
@@ -331,6 +330,8 @@ static struct vas_window *vas_allocate_window(int vas_id, u64 flags,
 		}
 	}
 
+	txwin->lpid = mfspr(SPRN_PID);
+
 	/*
 	 * Allocate / Deallocate window hcalls and setup / free IRQs
 	 * have to be protected with mutex.
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


