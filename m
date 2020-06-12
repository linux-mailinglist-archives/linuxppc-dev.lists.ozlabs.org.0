Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8745D1F735F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jun 2020 07:17:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49jprp2vbVzDqvy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jun 2020 15:17:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49jpl55WNnzDqDd
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jun 2020 15:12:49 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05C53UfQ117003; Fri, 12 Jun 2020 01:12:43 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31ktp1c2s4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Jun 2020 01:12:43 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05C559NU121253;
 Fri, 12 Jun 2020 01:12:43 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31ktp1c2ru-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Jun 2020 01:12:43 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05C59MsN011062;
 Fri, 12 Jun 2020 05:12:42 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma03dal.us.ibm.com with ESMTP id 31hw1cftxf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Jun 2020 05:12:42 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05C5CfQG46792970
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Jun 2020 05:12:42 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D511B124052;
 Fri, 12 Jun 2020 05:12:41 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9CC4C124053;
 Fri, 12 Jun 2020 05:12:41 +0000 (GMT)
Received: from localhost (unknown [9.65.252.60])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 12 Jun 2020 05:12:41 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 03/18] powerpc/numa: remove ability to enable topology updates
Date: Fri, 12 Jun 2020 00:12:23 -0500
Message-Id: <20200612051238.1007764-4-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200612051238.1007764-1-nathanl@linux.ibm.com>
References: <20200612051238.1007764-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-11_23:2020-06-11,
 2020-06-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 mlxscore=0
 bulkscore=0 malwarescore=0 adultscore=0 cotscore=-2147483648 spamscore=0
 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=1
 priorityscore=1501 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006110174
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
Cc: tyreld@linux.ibm.com, srikar@linux.vnet.ibm.com, ego@linux.vnet.ibm.com,
 npiggin@gmail.com, svaidy@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Remove the /proc/powerpc/topology_updates interface and the
topology_updates=on/off command line argument. The internal
topology_updates_enabled flag remains for now, but always false.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/mm/numa.c | 71 +-----------------------------------------
 1 file changed, 1 insertion(+), 70 deletions(-)

diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index 9fcf2d195830..34d95de77bdd 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -984,27 +984,7 @@ static int __init early_numa(char *p)
 }
 early_param("numa", early_numa);
 
-/*
- * The platform can inform us through one of several mechanisms
- * (post-migration device tree updates, PRRN or VPHN) that the NUMA
- * assignment of a resource has changed. This controls whether we act
- * on that. Disabled by default.
- */
-static bool topology_updates_enabled;
-
-static int __init early_topology_updates(char *p)
-{
-	if (!p)
-		return 0;
-
-	if (!strcmp(p, "on")) {
-		pr_warn("Caution: enabling topology updates\n");
-		topology_updates_enabled = true;
-	}
-
-	return 0;
-}
-early_param("topology_updates", early_topology_updates);
+static const bool topology_updates_enabled;
 
 #ifdef CONFIG_MEMORY_HOTPLUG
 /*
@@ -1632,52 +1612,6 @@ int prrn_is_enabled(void)
 	return prrn_enabled;
 }
 
-static int topology_read(struct seq_file *file, void *v)
-{
-	if (vphn_enabled || prrn_enabled)
-		seq_puts(file, "on\n");
-	else
-		seq_puts(file, "off\n");
-
-	return 0;
-}
-
-static int topology_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, topology_read, NULL);
-}
-
-static ssize_t topology_write(struct file *file, const char __user *buf,
-			      size_t count, loff_t *off)
-{
-	char kbuf[4]; /* "on" or "off" plus null. */
-	int read_len;
-
-	read_len = count < 3 ? count : 3;
-	if (copy_from_user(kbuf, buf, read_len))
-		return -EINVAL;
-
-	kbuf[read_len] = '\0';
-
-	if (!strncmp(kbuf, "on", 2)) {
-		topology_updates_enabled = true;
-		start_topology_update();
-	} else if (!strncmp(kbuf, "off", 3)) {
-		stop_topology_update();
-		topology_updates_enabled = false;
-	} else
-		return -EINVAL;
-
-	return count;
-}
-
-static const struct proc_ops topology_proc_ops = {
-	.proc_read	= seq_read,
-	.proc_write	= topology_write,
-	.proc_open	= topology_open,
-	.proc_release	= single_release,
-};
-
 static int topology_update_init(void)
 {
 	start_topology_update();
@@ -1685,9 +1619,6 @@ static int topology_update_init(void)
 	if (vphn_enabled)
 		topology_schedule_update();
 
-	if (!proc_create("powerpc/topology_updates", 0644, NULL, &topology_proc_ops))
-		return -ENOMEM;
-
 	topology_inited = 1;
 	return 0;
 }
-- 
2.25.4

