Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A4A1F97E1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 15:06:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49ls646FVnzDqMG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 23:06:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49lrdr0611zDqQM
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun 2020 22:45:19 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05FCHXdX030661; Mon, 15 Jun 2020 08:44:45 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31p8v5rrh6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jun 2020 08:44:45 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05FCXJFR075107;
 Mon, 15 Jun 2020 08:44:44 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31p8v5rrgh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jun 2020 08:44:44 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05FCfatk015348;
 Mon, 15 Jun 2020 12:44:43 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 31mpe7uk2g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jun 2020 12:44:43 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05FCieUT21430408
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Jun 2020 12:44:40 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3FDA942049;
 Mon, 15 Jun 2020 12:44:40 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E4BB74203F;
 Mon, 15 Jun 2020 12:44:36 +0000 (GMT)
Received: from vajain21-in-ibm-com (unknown [9.85.96.47])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 15 Jun 2020 12:44:36 +0000 (GMT)
Received: by vajain21-in-ibm-com (sSMTP sendmail emulation);
 Mon, 15 Jun 2020 18:14:35 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-nvdimm@lists.01.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v13 4/6] powerpc/papr_scm: Improve error logging and handling
 papr_scm_ndctl()
Date: Mon, 15 Jun 2020 18:14:05 +0530
Message-Id: <20200615124407.32596-5-vaibhav@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200615124407.32596-1-vaibhav@linux.ibm.com>
References: <20200615124407.32596-1-vaibhav@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-15_02:2020-06-15,
 2020-06-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 cotscore=-2147483648
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 clxscore=1015 mlxlogscore=999 spamscore=0 mlxscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006150098
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
Cc: Santosh Sivaraj <santosh@fossix.org>, Steven Rostedt <rostedt@goodmis.org>,
 Oliver O'Halloran <oohall@gmail.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Vaibhav Jain <vaibhav@linux.ibm.com>, Dan Williams <dan.j.williams@intel.com>,
 Ira Weiny <ira.weiny@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since papr_scm_ndctl() can be called from outside papr_scm, its
exposed to the possibility of receiving NULL as value of 'cmd_rc'
argument. This patch updates papr_scm_ndctl() to protect against such
possibility by assigning it pointer to a local variable in case cmd_rc
== NULL.

Finally the patch also updates the 'default' add a debug log unknown
'cmd' values.

Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Ira Weiny <ira.weiny@intel.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
---
Changelog:

v12..v13:
* None

v11..v12:
* Added ack from Ira

v10..v11:
* Instead of returning *cmd_rd just return '0' in case nd_cmd is
  handled. In case of unknown nd-cmd return -EINVAL
  [ Ira and Dan Williams ]
* Updated patch description.

v9..v10
* New patch in the series
---
 arch/powerpc/platforms/pseries/papr_scm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index 0c091622b15e..692ad3d79826 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -355,11 +355,16 @@ static int papr_scm_ndctl(struct nvdimm_bus_descriptor *nd_desc,
 {
 	struct nd_cmd_get_config_size *get_size_hdr;
 	struct papr_scm_priv *p;
+	int rc;
 
 	/* Only dimm-specific calls are supported atm */
 	if (!nvdimm)
 		return -EINVAL;
 
+	/* Use a local variable in case cmd_rc pointer is NULL */
+	if (!cmd_rc)
+		cmd_rc = &rc;
+
 	p = nvdimm_provider_data(nvdimm);
 
 	switch (cmd) {
@@ -381,6 +386,7 @@ static int papr_scm_ndctl(struct nvdimm_bus_descriptor *nd_desc,
 		break;
 
 	default:
+		dev_dbg(&p->pdev->dev, "Unknown command = %d\n", cmd);
 		return -EINVAL;
 	}
 
-- 
2.26.2

