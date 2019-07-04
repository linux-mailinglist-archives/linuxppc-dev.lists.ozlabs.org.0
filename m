Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFB85FA36
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2019 16:41:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45fgf54flnzDqc8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jul 2019 00:41:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=naveen.n.rao@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45fgVd4zVqzDqQ4
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Jul 2019 00:35:05 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x64EPQEQ121458
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 4 Jul 2019 10:35:02 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2thh3pcygr-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Jul 2019 10:35:01 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Thu, 4 Jul 2019 15:34:58 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 4 Jul 2019 15:34:56 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x64EYtVg45547656
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 4 Jul 2019 14:34:55 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3BD11AE053;
 Thu,  4 Jul 2019 14:34:55 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C5843AE04D;
 Thu,  4 Jul 2019 14:34:53 +0000 (GMT)
Received: from naverao1-tp.ibmuc.com (unknown [9.85.70.183])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  4 Jul 2019 14:34:53 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH 1/2] ftrace: Fix NULL pointer dereference in t_probe_next()
Date: Thu,  4 Jul 2019 20:04:41 +0530
X-Mailer: git-send-email 2.22.0
In-Reply-To: <cover.1562249521.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1562249521.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19070414-0016-0000-0000-0000028F3BAE
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19070414-0017-0000-0000-000032ECDB16
Message-Id: <05e021f757625cbbb006fad41380323dbe4e3b43.1562249521.git.naveen.n.rao@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-04_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907040181
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

LTP testsuite on powerpc results in the below crash:

  Unable to handle kernel paging request for data at address 0x00000000
  Faulting instruction address: 0xc00000000029d800
  Oops: Kernel access of bad area, sig: 11 [#1]
  LE SMP NR_CPUS=2048 NUMA PowerNV
  ...
  CPU: 68 PID: 96584 Comm: cat Kdump: loaded Tainted: G        W
  NIP:  c00000000029d800 LR: c00000000029dac4 CTR: c0000000001e6ad0
  REGS: c0002017fae8ba10 TRAP: 0300   Tainted: G        W
  MSR:  9000000000009033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 28022422  XER: 20040000
  CFAR: c00000000029d90c DAR: 0000000000000000 DSISR: 40000000 IRQMASK: 0
  ...
  NIP [c00000000029d800] t_probe_next+0x60/0x180
  LR [c00000000029dac4] t_mod_start+0x1a4/0x1f0
  Call Trace:
  [c0002017fae8bc90] [c000000000cdbc40] _cond_resched+0x10/0xb0 (unreliable)
  [c0002017fae8bce0] [c0000000002a15b0] t_start+0xf0/0x1c0
  [c0002017fae8bd30] [c0000000004ec2b4] seq_read+0x184/0x640
  [c0002017fae8bdd0] [c0000000004a57bc] sys_read+0x10c/0x300
  [c0002017fae8be30] [c00000000000b388] system_call+0x5c/0x70

The test (ftrace_set_ftrace_filter.sh) is part of ftrace stress tests
and the crash happens when the test does 'cat
$TRACING_PATH/set_ftrace_filter'.

The address points to the second line below, in t_probe_next(), where
filter_hash is dereferenced:
  hash = iter->probe->ops.func_hash->filter_hash;
  size = 1 << hash->size_bits;

This happens due to a race with register_ftrace_function_probe(). A new
ftrace_func_probe is created and added into the func_probes list in
trace_array under ftrace_lock. However, before initializing the filter,
we drop ftrace_lock, and re-acquire it after acquiring regex_lock. If
another process is trying to read set_ftrace_filter, it will be able to
acquire ftrace_lock during this window and it will end up seeing a NULL
filter_hash.

Fix this by just checking for a NULL filter_hash in t_probe_next(). If
the filter_hash is NULL, then this probe is just being added and we can
simply return from here.

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 kernel/trace/ftrace.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 7b037295a1f1..0791eafb693d 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -3093,6 +3093,10 @@ t_probe_next(struct seq_file *m, loff_t *pos)
 		hnd = &iter->probe_entry->hlist;
 
 	hash = iter->probe->ops.func_hash->filter_hash;
+
+	if (!hash)
+		return NULL;
+
 	size = 1 << hash->size_bits;
 
  retry:
-- 
2.22.0

