Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9028D1DA0FB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 21:27:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49RQrM2QVdzDqhT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 05:27:31 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49RQH56XMgzDqWX
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 05:02:09 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04JIhNqx180189; Tue, 19 May 2020 15:01:20 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31293vcss0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 May 2020 15:01:20 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04JIwNKd024674;
 Tue, 19 May 2020 15:01:20 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31293vcsre-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 May 2020 15:01:20 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 04JJ17iM004547;
 Tue, 19 May 2020 19:01:18 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma05fra.de.ibm.com with ESMTP id 313x4xgw34-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 May 2020 19:01:18 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04JJ1FkM59703546
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 May 2020 19:01:15 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6B4DA5204E;
 Tue, 19 May 2020 19:01:15 +0000 (GMT)
Received: from vajain21-in-ibm-com (unknown [9.85.89.230])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 9991752050;
 Tue, 19 May 2020 19:01:11 +0000 (GMT)
Received: by vajain21-in-ibm-com (sSMTP sendmail emulation);
 Wed, 20 May 2020 00:31:10 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-nvdimm@lists.01.org,
 linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v7 2/5] seq_buf: Export seq_buf_printf() to external
 modules
Date: Wed, 20 May 2020 00:30:55 +0530
Message-Id: <20200519190058.257981-3-vaibhav@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200519190058.257981-1-vaibhav@linux.ibm.com>
References: <20200519190058.257981-1-vaibhav@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-19_06:2020-05-19,
 2020-05-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 lowpriorityscore=0
 cotscore=-2147483648 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2005190153
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
Cc: Santosh Sivaraj <santosh@fossix.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Piotr Maziarz <piotrx.maziarz@linux.intel.com>,
 Steven Rostedt <rostedt@goodmis.org>, Oliver O'Halloran <oohall@gmail.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Vaibhav Jain <vaibhav@linux.ibm.com>,
 Dan Williams <dan.j.williams@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

'seq_buf' provides a very useful abstraction for writing to a string
buffer without needing to worry about it over-flowing. However even
though the API has been stable for couple of years now its stills not
exported to external modules limiting its usage.

Hence this patch proposes update to 'seq_buf.c' to mark
seq_buf_printf() which is part of the seq_buf API to be exported to
external GPL modules. This symbol will be used in later parts of this
patchset to simplify content creation for a sysfs attribute.

Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Piotr Maziarz <piotrx.maziarz@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Borislav Petkov <bp@alien8.de>
Acked-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
---
Changelog:

Resend:
* Added ack from Steven Rostedt

v6..v7:
* New patch in the series
---
 lib/seq_buf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/seq_buf.c b/lib/seq_buf.c
index 4e865d42ab03..707453f5d58e 100644
--- a/lib/seq_buf.c
+++ b/lib/seq_buf.c
@@ -91,6 +91,7 @@ int seq_buf_printf(struct seq_buf *s, const char *fmt, ...)
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(seq_buf_printf);
 
 #ifdef CONFIG_BINARY_PRINTF
 /**
-- 
2.26.2

