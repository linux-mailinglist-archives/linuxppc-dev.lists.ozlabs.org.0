Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0C1B2CD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 07:08:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44rf8X27lVzDq72
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 15:08:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=julietk@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44rNwy0W4DzDqX1
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Apr 2019 05:12:49 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3QJ8TRY029238
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Apr 2019 15:12:46 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2s467451vx-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Apr 2019 15:12:46 -0400
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <julietk@linux.ibm.com>;
 Fri, 26 Apr 2019 20:07:45 +0100
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 26 Apr 2019 20:07:43 +0100
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x3QJ6Rds16515146
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Apr 2019 19:06:27 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E0CEFAC064;
 Fri, 26 Apr 2019 19:06:26 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AF2F4AC06D;
 Fri, 26 Apr 2019 19:06:26 +0000 (GMT)
Received: from ltcalpine2-lp21.aus.stglabs.ibm.com (unknown [9.40.195.230])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 26 Apr 2019 19:06:26 +0000 (GMT)
Received: by ltcalpine2-lp21.aus.stglabs.ibm.com (Postfix, from userid 0)
 id 1F8DC10272B; Fri, 26 Apr 2019 15:06:26 -0400 (EDT)
Date: Fri, 26 Apr 2019 15:06:26 -0400
From: Juliet Kim<julietk@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH]powerpc/mobility: Serialize PRRN and LPM in device tree update
User-Agent: Heirloom mailx 12.5 7/5/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19042619-0040-0000-0000-000004E7B699
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011000; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000285; SDB=6.01194770; UDB=6.00626435; IPR=6.00975605; 
 MB=3.00026612; MTD=3.00000008; XFM=3.00000015; UTC=2019-04-26 19:07:43
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19042619-0041-0000-0000-000008F3B75B
Message-Id: <5cc356b2.U4B2o+r/yDreVzL0%julietk@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-26_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904260129
X-Mailman-Approved-At: Sat, 27 Apr 2019 15:04:36 +1000
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
Cc: nathanl@linux.ibm.com, mmc@linux.ibm.com, mwb@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fix extending start/stop topology update scope during LPM
Commit 65b9fdadfc4d ("powerpc/pseries/mobility: Extend start/stop
topology update scope") made the change to the duration that 
topology updates are suppressed during LPM to allow the complete 
device tree update which leaves the property update notifier
unregistered until device tree update completes. This prevents
topology update during LPM.  

Instead, use mutex_lock, which serializes LPM and PRRN operation 
in pseries_devicetree_update.

Signed-off-by: Juliet Kim <julietk@linux.ibm.com>

 arch/powerpc/platforms/pseries/mobility.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
index 88925f8ca8a0..3a79ded056fd 100644
--- a/arch/powerpc/platforms/pseries/mobility.c
+++ b/arch/powerpc/platforms/pseries/mobility.c
@@ -42,6 +42,8 @@ struct update_props_workarea {
 #define MIGRATION_SCOPE	(1)
 #define PRRN_SCOPE -2
 
+static DEFINE_MUTEX(dt_affinity_mutex);
+
 static int mobility_rtas_call(int token, char *buf, s32 scope)
 {
 	int rc;
@@ -270,13 +272,19 @@ int pseries_devicetree_update(s32 scope)
 	int update_nodes_token;
 	int rc;
 
+	mutex_lock(&dt_affinity_mutex);
+
 	update_nodes_token = rtas_token("ibm,update-nodes");
-	if (update_nodes_token == RTAS_UNKNOWN_SERVICE)
+	if (update_nodes_token == RTAS_UNKNOWN_SERVICE) {
+		mutex_unlock(&dt_affinity_mutex);
 		return -EINVAL;
+	}
 
 	rtas_buf = kzalloc(RTAS_DATA_BUF_SIZE, GFP_KERNEL);
-	if (!rtas_buf)
+	if (!rtas_buf) {
+		mutex_unlock(&dt_affinity_mutex);
 		return -ENOMEM;
+	}
 
 	do {
 		rc = mobility_rtas_call(update_nodes_token, rtas_buf, scope);
@@ -316,6 +324,7 @@ int pseries_devicetree_update(s32 scope)
 	} while (rc == 1);
 
 	kfree(rtas_buf);
+	mutex_unlock(&dt_affinity_mutex);
 	return rc;
 }
 
@@ -371,10 +380,10 @@ static ssize_t migration_store(struct class *class,
 	if (rc)
 		return rc;
 
-	post_mobility_fixup();
-
 	start_topology_update();
 
+	post_mobility_fixup();
+
 	return count;
 }
 
-- 
2.12.3

