Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D9FB2CB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 07:06:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44rf5K2mcKzDqYV
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 15:05:57 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44rK100hCfzDqBt
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Apr 2019 02:16:03 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3QGEuXF108832
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Apr 2019 12:16:00 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2s45790gx5-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Apr 2019 12:15:59 -0400
Received: from localhost
 by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <julietk@linux.ibm.com>;
 Fri, 26 Apr 2019 17:15:58 +0100
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e14.ny.us.ibm.com (146.89.104.201) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 26 Apr 2019 17:15:55 +0100
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x3QGFs1F28967010
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Apr 2019 16:15:55 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B0B12112065
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Apr 2019 16:15:54 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 94AAF112067
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Apr 2019 16:15:54 +0000 (GMT)
Received: from localhost (unknown [9.40.193.65])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Apr 2019 16:15:54 +0000 (GMT)
Received: by localhost (Postfix, from userid 0)
 id 7734210B6; Thu, 25 Apr 2019 23:32:39 -0500 (CDT)
Date: Thu, 25 Apr 2019 23:32:39 -0500
From: Juilet Kim<julietk@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH]powerpc/mobility: Serialize PRRN and LPM in device tree update
User-Agent: Heirloom mailx 12.5 7/5/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19042616-0052-0000-0000-000003B380D8
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010999; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000285; SDB=6.01194713; UDB=6.00626401; IPR=6.00975548; 
 MB=3.00026611; MTD=3.00000008; XFM=3.00000015; UTC=2019-04-26 16:15:57
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19042616-0053-0000-0000-000060A7735F
Message-Id: <5cc289e7./UvbXbbxGU4X+/Y4%julietk@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-26_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904260111
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

