Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1265229FAA7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 02:37:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMlKj3KfyzDqyl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 12:37:13 +1100 (AEDT)
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
 header.s=pp1 header.b=r6M7F/5a; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMkvw0lQgzDqk8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 12:18:19 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09U12H0u023398
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 21:18:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=GDkHBYLhpq9akRfRuqWycU2kf3Ux9f9XNOjCcpiDgkQ=;
 b=r6M7F/5aNouweM97bT+PzsOC+34LYvzhD+v/Lz5bg38RBFdCTLsxQd61tJXfBw1Z2ei3
 QMfgGJRGTnMqoFKhcXRCxvaDuUujr93KeI+iVqYLOBb4111L5bRYHvZKzmH8z6GcRv/p
 tJnuq6UeSMhR8yRydzTo7/QBqiXqiCq2D2Zv02tru2lusk+scaLiBIKcl3XBbeIubb04
 dstlBCKck98so+aMeymnkZ0PmYZwbE9RIpftGBiSthN7BYmvgb5io9BwqouGfwxqu+5w
 7fgR0OmgmRtaTa/tILwB0/Cf2r5VfrYlzQkHBB1bN3nO6bKHKSPRnWHkAzI8ZZIA2muF iQ== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34fybcaqps-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 21:18:18 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09U1Ex5i026081
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 01:18:16 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02wdc.us.ibm.com with ESMTP id 34dy04nx93-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 01:18:16 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09U1IEon36176290
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Oct 2020 01:18:14 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 603E013605D;
 Fri, 30 Oct 2020 01:18:14 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2587B136053;
 Fri, 30 Oct 2020 01:18:14 +0000 (GMT)
Received: from localhost (unknown [9.65.225.148])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 30 Oct 2020 01:18:14 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 10/29] powerpc/pseries/mobility: error message improvements
Date: Thu, 29 Oct 2020 20:17:46 -0500
Message-Id: <20201030011805.1224603-11-nathanl@linux.ibm.com>
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
 spamscore=0 impostorscore=0 mlxscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=1 phishscore=0
 mlxlogscore=832 classifier=spam adjust=0 reason=mlx scancount=1
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

- Convert printk(KERN_ERR) to pr_err().
- Include errno in property update failure message.
- Remove reference to "Post-mobility" from device tree update message:
  with pr_err() it will have a "mobility:" prefix.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/mobility.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
index d85799b5464a..ef8f5641e700 100644
--- a/arch/powerpc/platforms/pseries/mobility.c
+++ b/arch/powerpc/platforms/pseries/mobility.c
@@ -208,8 +208,8 @@ static int update_dt_node(__be32 phandle, s32 scope)
 				rc = update_dt_property(dn, &prop, prop_name,
 							vd, prop_data);
 				if (rc) {
-					printk(KERN_ERR "Could not update %s"
-					       " property\n", prop_name);
+					pr_err("updating %s property failed: %d\n",
+					       prop_name, rc);
 				}
 
 				prop_data += vd;
@@ -343,8 +343,7 @@ void post_mobility_fixup(void)
 
 	rc = pseries_devicetree_update(MIGRATION_SCOPE);
 	if (rc)
-		printk(KERN_ERR "Post-mobility device tree update "
-			"failed: %d\n", rc);
+		pr_err("device tree update failed: %d\n", rc);
 
 	cacheinfo_rebuild();
 
-- 
2.25.4

