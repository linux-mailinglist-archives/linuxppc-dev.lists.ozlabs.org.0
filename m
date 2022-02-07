Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFE44ACBE3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Feb 2022 23:13:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jt0lZ494fz3bcl
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Feb 2022 09:13:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=T+sMqFAO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=T+sMqFAO; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jt0kt57YNz2yNv
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Feb 2022 09:12:53 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 217L9j7A020135
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 7 Feb 2022 22:12:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=HFNnOkgTqM0IszAz9YUV4Yd1RNNtHqaAThjdDhCY3u4=;
 b=T+sMqFAO9FvVpwSPhNs+lyzjH5WfP+pXe7zTiwaj6SOFV4iYJkO1ZqC/1zIIvnmnAr7U
 C9abN3ON9IjueWZtyb/CxwvhWYrqqES+FKHkWRP6TApgyEQZfZrvRgdCfK7sty08y+50
 6OU+utMYLVoWHT1hU31fOOXki9yObdXyI3d11++cyFADl8cjtVsvbvHGqAhbdBPtHPaM
 15fUPdRySMDYNuExKa5E5m61CSL3R9AX/1GW5p2+tSjLcg0Fu1qj+WupwErdvxnMFIXn
 zvvBRQ8xQyRwK5b/skreBKA+YVT3anV+fH2OKk/heCU7tRWUJ8xJKJX4S80+90yB9Aoj eg== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e22q18p49-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Feb 2022 22:12:50 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 217M3jS4021233
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 7 Feb 2022 22:12:49 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma05wdc.us.ibm.com with ESMTP id 3e1gvafvpv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Feb 2022 22:12:49 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 217MCm2k34734474
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 7 Feb 2022 22:12:48 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8A847B2064
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Feb 2022 22:12:48 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3188DB2067
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Feb 2022 22:12:48 +0000 (GMT)
Received: from localhost (unknown [9.211.103.251])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Feb 2022 22:12:47 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/pseries: make pseries_devicetree_update() static
Date: Mon,  7 Feb 2022 16:12:47 -0600
Message-Id: <20220207221247.354454-1-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: LPsHe5kI02EX7yyvOQl_JRfBv9h4vzAf
X-Proofpoint-ORIG-GUID: LPsHe5kI02EX7yyvOQl_JRfBv9h4vzAf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-07_07,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 mlxlogscore=896
 clxscore=1011 adultscore=0 bulkscore=0 mlxscore=0 spamscore=0
 impostorscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2202070124
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

pseries_devicetree_update() has only one call site, in the same file in
which it is defined. Make it static.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/include/asm/rtas.h           | 1 -
 arch/powerpc/platforms/pseries/mobility.c | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
index 82e5b055fa2a..00531af17ce0 100644
--- a/arch/powerpc/include/asm/rtas.h
+++ b/arch/powerpc/include/asm/rtas.h
@@ -274,7 +274,6 @@ extern void pSeries_log_error(char *buf, unsigned int err_type, int fatal);
 #ifdef CONFIG_PPC_PSERIES
 extern time64_t last_rtas_event;
 extern int clobbering_unread_rtas_event(void);
-extern int pseries_devicetree_update(s32 scope);
 extern void post_mobility_fixup(void);
 int rtas_syscall_dispatch_ibm_suspend_me(u64 handle);
 #else
diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
index 85033f392c78..94077fa91959 100644
--- a/arch/powerpc/platforms/pseries/mobility.c
+++ b/arch/powerpc/platforms/pseries/mobility.c
@@ -265,7 +265,7 @@ static int add_dt_node(struct device_node *parent_dn, __be32 drc_index)
 	return rc;
 }
 
-int pseries_devicetree_update(s32 scope)
+static int pseries_devicetree_update(s32 scope)
 {
 	char *rtas_buf;
 	__be32 *data;
-- 
2.34.1

