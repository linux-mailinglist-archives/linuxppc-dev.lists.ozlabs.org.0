Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC4B7E613
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 00:55:08 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4605Gd2j3nzDqbt
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 08:55:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=leonardo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4605Dt1jBWzDqdh
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 08:53:30 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x71MpwXY141437
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 1 Aug 2019 18:53:27 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2u48wn8ked-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Aug 2019 18:53:27 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <leonardo@linux.ibm.com>;
 Thu, 1 Aug 2019 23:53:26 +0100
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 1 Aug 2019 23:53:22 +0100
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x71MrLxn63504856
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 1 Aug 2019 22:53:21 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5461A78060;
 Thu,  1 Aug 2019 22:53:21 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 64CDD7805E;
 Thu,  1 Aug 2019 22:53:18 +0000 (GMT)
Received: from LeoBras.aus.stglabs.ibm.com (unknown [9.18.235.147])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  1 Aug 2019 22:53:18 +0000 (GMT)
From: Leonardo Bras <leonardo@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] pseries/hotplug-memory.c: Replace nested ifs by
 switch-case
Date: Thu,  1 Aug 2019 19:52:51 -0300
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19080122-0016-0000-0000-000009D75A7B
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011535; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000287; SDB=6.01240739; UDB=6.00654298; IPR=6.01022164; 
 MB=3.00028000; MTD=3.00000008; XFM=3.00000015; UTC=2019-08-01 22:53:26
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19080122-0017-0000-0000-000044428B7C
Message-Id: <20190801225251.17864-1-leonardo@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-01_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=768 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908010241
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Pavel Tatashin <pavel.tatashin@microsoft.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 David Hildenbrand <david@redhat.com>, YueHaibing <yuehaibing@huawei.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Paul Mackerras <paulus@samba.org>, Nathan Fontenot <nfont@linux.vnet.ibm.com>,
 Leonardo Bras <leonardo@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Rob Herring <robh@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I noticed these nested ifs can be easily replaced by switch-cases,
which can improve readability.

Signed-off-by: Leonardo Bras <leonardo@linux.ibm.com>
---
 .../platforms/pseries/hotplug-memory.c        | 26 +++++++++++++------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
index 46d0d35b9ca4..8e700390f3d6 100644
--- a/arch/powerpc/platforms/pseries/hotplug-memory.c
+++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
@@ -880,34 +880,44 @@ int dlpar_memory(struct pseries_hp_errorlog *hp_elog)
 
 	switch (hp_elog->action) {
 	case PSERIES_HP_ELOG_ACTION_ADD:
-		if (hp_elog->id_type == PSERIES_HP_ELOG_ID_DRC_COUNT) {
+		switch (hp_elog->id_type) {
+		case PSERIES_HP_ELOG_ID_DRC_COUNT:
 			count = hp_elog->_drc_u.drc_count;
 			rc = dlpar_memory_add_by_count(count);
-		} else if (hp_elog->id_type == PSERIES_HP_ELOG_ID_DRC_INDEX) {
+			break;
+		case PSERIES_HP_ELOG_ID_DRC_INDEX:
 			drc_index = hp_elog->_drc_u.drc_index;
 			rc = dlpar_memory_add_by_index(drc_index);
-		} else if (hp_elog->id_type == PSERIES_HP_ELOG_ID_DRC_IC) {
+			break;
+		case PSERIES_HP_ELOG_ID_DRC_IC:
 			count = hp_elog->_drc_u.ic.count;
 			drc_index = hp_elog->_drc_u.ic.index;
 			rc = dlpar_memory_add_by_ic(count, drc_index);
-		} else {
+			break;
+		default:
 			rc = -EINVAL;
+			break;
 		}
 
 		break;
 	case PSERIES_HP_ELOG_ACTION_REMOVE:
-		if (hp_elog->id_type == PSERIES_HP_ELOG_ID_DRC_COUNT) {
+		switch (hp_elog->id_type) {
+		case PSERIES_HP_ELOG_ID_DRC_COUNT:
 			count = hp_elog->_drc_u.drc_count;
 			rc = dlpar_memory_remove_by_count(count);
-		} else if (hp_elog->id_type == PSERIES_HP_ELOG_ID_DRC_INDEX) {
+			break;
+		case PSERIES_HP_ELOG_ID_DRC_INDEX:
 			drc_index = hp_elog->_drc_u.drc_index;
 			rc = dlpar_memory_remove_by_index(drc_index);
-		} else if (hp_elog->id_type == PSERIES_HP_ELOG_ID_DRC_IC) {
+			break;
+		case PSERIES_HP_ELOG_ID_DRC_IC:
 			count = hp_elog->_drc_u.ic.count;
 			drc_index = hp_elog->_drc_u.ic.index;
 			rc = dlpar_memory_remove_by_ic(count, drc_index);
-		} else {
+			break;
+		default:
 			rc = -EINVAL;
+			break;
 		}
 
 		break;
-- 
2.20.1

