Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2695D4A47C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2019 16:51:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Srcr40tvzDqcw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 00:51:24 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45SrXd2sDxzDqYd
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 00:47:44 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5IEl9hI134356
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2019 10:47:42 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2t71p8s3n2-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2019 10:47:42 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Tue, 18 Jun 2019 15:47:40 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 18 Jun 2019 15:47:35 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5IElYrw52560094
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Jun 2019 14:47:34 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B4B7E11C04C;
 Tue, 18 Jun 2019 14:47:34 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CDC4A11C052;
 Tue, 18 Jun 2019 14:47:32 +0000 (GMT)
Received: from naverao1-tp.ibmuc.com (unknown [9.85.74.6])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 18 Jun 2019 14:47:32 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH 0/7] powerpc/ftrace: Patch out -mprofile-kernel instructions
Date: Tue, 18 Jun 2019 20:16:59 +0530
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19061814-0008-0000-0000-000002F4CECD
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061814-0009-0000-0000-00002261E6AA
Message-Id: <cover.1560868106.git.naveen.n.rao@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-18_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=545 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906180119
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

Changes since RFC:
- Patches 1 and 2: No changes
- Patch 3: rename function to ftrace_replace_code_rec() to signify that 
  it acts on a ftrace record.
- Patch 4: numerous small changes, including those suggested by Nick 
  Piggin.
- Patch 4: additionally handle scenario where __ftrace_make_call() can 
  be invoked without having called __ftrace_make_call_prep(), when a 
  kernel module is loaded while function tracing is active.
- Patch 5 to 7: new, to have ftrace claim ownership of two instructions, 
  and to have kprobes work properly with this.


--
On powerpc64, -mprofile-kernel results in two instructions being 
emitted: 'mflr r0' and 'bl _mcount'. So far, we were only nop'ing out 
the branch to _mcount(). This series implements an approach to also nop 
out the preceding mflr.


- Naveen


Naveen N. Rao (7):
  ftrace: Expose flags used for ftrace_replace_code()
  x86/ftrace: Fix use of flags in ftrace_replace_code()
  ftrace: Expose __ftrace_replace_code()
  powerpc/ftrace: Additionally nop out the preceding mflr with
    -mprofile-kernel
  powerpc/ftrace: Update ftrace_location() for powerpc -mprofile-kernel
  kprobes/ftrace: Use ftrace_location() when [dis]arming probes
  powerpc/kprobes: Allow probing on any ftrace address

 arch/powerpc/kernel/kprobes-ftrace.c |  30 +++
 arch/powerpc/kernel/trace/ftrace.c   | 272 ++++++++++++++++++++++++---
 arch/x86/kernel/ftrace.c             |   3 +-
 include/linux/ftrace.h               |   7 +
 kernel/kprobes.c                     |  10 +-
 kernel/trace/ftrace.c                |  17 +-
 6 files changed, 300 insertions(+), 39 deletions(-)

-- 
2.22.0

