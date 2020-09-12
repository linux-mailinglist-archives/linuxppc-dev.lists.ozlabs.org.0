Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC092678CC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Sep 2020 10:16:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BpQT05HvtzDqtp
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Sep 2020 18:16:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=EYTKmzKq; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BpQRC1jfFzDqdf
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Sep 2020 18:15:18 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08C7jFrB187606; Sat, 12 Sep 2020 04:15:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=PeV7QfoonoL0Oz0zSW5NYVUjkotzrs0sB2oTA+nrdQ0=;
 b=EYTKmzKqcFh60n+8AtrOt4nqUnl43O1vpn1cn8D1zyfPdtwIA8zxTkwiN+GeiHIECuOl
 2uYOmS0+14/TUiJoQL1mQCtboW9iQwNQZWnJTD4uDG4NkX/X+aG2Faek8PfmyBqUM8Dd
 ycCnVvjyVivNSBlh+ZWcdg8Rj3rJ+uNiTYkzAd9xMZJcE6KyUHPn9y7g34nBw5YZN78N
 sf2cP/a28K6rqd3E5OgYbDv7T/aAi51Uj/jA20w+256+dXAL10+PPCj7wAU0Nsu95bXr
 p6AJdABooy7sA/TKPibBOEa6i0xZD38DMLvej2BADlV7a0L1er4XEeZXPg04Hekf/Yyn 6g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33gt7dregy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 12 Sep 2020 04:15:04 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 08C7jpJI188501;
 Sat, 12 Sep 2020 04:15:03 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33gt7dregb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 12 Sep 2020 04:15:03 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08C8CRKI030011;
 Sat, 12 Sep 2020 08:15:01 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06fra.de.ibm.com with ESMTP id 33gnkgr3k7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 12 Sep 2020 08:15:01 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08C8Eweu24248654
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 12 Sep 2020 08:14:58 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AC2DC4C040;
 Sat, 12 Sep 2020 08:14:58 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 73E8C4C046;
 Sat, 12 Sep 2020 08:14:55 +0000 (GMT)
Received: from vajain21.in.ibm.com (unknown [9.79.218.102])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Sat, 12 Sep 2020 08:14:55 +0000 (GMT)
Received: by vajain21.in.ibm.com (sSMTP sendmail emulation);
 Sat, 12 Sep 2020 13:44:54 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-nvdimm@lists.01.org
Subject: [PATCH v2] powerpc/papr_scm: Fix warning triggered by
 perf_stats_show()
Date: Sat, 12 Sep 2020 13:44:51 +0530
Message-Id: <20200912081451.66225-1-vaibhav@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-12_02:2020-09-10,
 2020-09-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 suspectscore=2 mlxlogscore=999
 priorityscore=1501 clxscore=1015 bulkscore=0 adultscore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009120067
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
Cc: Santosh Sivaraj <santosh@fossix.org>, Oliver O'Halloran <oohall@gmail.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Vaibhav Jain <vaibhav@linux.ibm.com>, Dan Williams <dan.j.williams@intel.com>,
 Ira Weiny <ira.weiny@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A warning is reported by the kernel in case perf_stats_show() returns
an error code. The warning is of the form below:

 papr_scm ibm,persistent-memory:ibm,pmemory@44100001:
 	  Failed to query performance stats, Err:-10
 dev_attr_show: perf_stats_show+0x0/0x1c0 [papr_scm] returned bad count
 fill_read_buffer: dev_attr_show+0x0/0xb0 returned bad count

On investigation it looks like that the compiler is silently truncating the
return value of drc_pmem_query_stats() from 'long' to 'int', since the
variable used to store the return code 'rc' is an 'int'. This
truncated value is then returned back as a 'ssize_t' back from
perf_stats_show() to 'dev_attr_show()' which thinks of it as a large
unsigned number and triggers this warning..

To fix this we update the type of variable 'rc' from 'int' to
'ssize_t' that prevents the compiler from truncating the return value
of drc_pmem_query_stats() and returning correct signed value back from
perf_stats_show().

Fixes: 2d02bf835e573 ('powerpc/papr_scm: Fetch nvdimm performance
       stats from PHYP')
Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
---
Changelog:

v2: Added an explicit cast to the expression calling 'seq_buf_used()'
    and triggering this issue. [ Ira ]
---
 arch/powerpc/platforms/pseries/papr_scm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index a88a707a608aa..5493bc847bd08 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -785,7 +785,8 @@ static int papr_scm_ndctl(struct nvdimm_bus_descriptor *nd_desc,
 static ssize_t perf_stats_show(struct device *dev,
 			       struct device_attribute *attr, char *buf)
 {
-	int index, rc;
+	int index;
+	ssize_t rc;
 	struct seq_buf s;
 	struct papr_scm_perf_stat *stat;
 	struct papr_scm_perf_stats *stats;
@@ -820,7 +821,7 @@ static ssize_t perf_stats_show(struct device *dev,
 
 free_stats:
 	kfree(stats);
-	return rc ? rc : seq_buf_used(&s);
+	return rc ? rc : (ssize_t)seq_buf_used(&s);
 }
 DEVICE_ATTR_ADMIN_RO(perf_stats);
 
-- 
2.26.2

