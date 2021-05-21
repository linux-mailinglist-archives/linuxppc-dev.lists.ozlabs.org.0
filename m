Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AA138C00E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 08:52:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmcjV1Xkmz3bxV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 16:52:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gPm6bLhm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=gPm6bLhm; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fmcft0F7tz305q
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 16:49:57 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14L6X85L050861; Fri, 21 May 2021 02:49:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=+g2u3+5NUE8BDNyhzJz5iYyOx/oBY7BW9flkHMyT71w=;
 b=gPm6bLhmIyiS6YJRExw8eJfUBxZlZws9zLOHCvO4b6JZy4NLOdYzDdyITa5nsjTYOtjv
 bpM6YxywRkysTRhEy+gBf76XDdVykVvM+pGad0De6ThIqEmnMJHyNGXpGCvI16y7sdP5
 ESTdAGtJ40oYFYk4clKasV20IkzxUBe0Z3nTP7bUm4ABX75zgW2ajX0W+ixHSh4S/p/A
 rN5hao7i6daDKbFVlAIv2ADZzx9dMT8B4XaVYnBoQPUDK7vUkAF/gbn1tYkKy5gWOKLJ
 5bGMxl+kAkL9s5TbpmKmeXZVFFGXXRN4BFTHrn+60xvc/ZUGBc/uZBxt3jwoxDwRpmXj Wg== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38p74rs67m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 02:49:25 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14L6mlF0004790;
 Fri, 21 May 2021 06:49:24 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03fra.de.ibm.com with ESMTP id 38j5x89npc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 06:49:24 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14L6nMV730474604
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 May 2021 06:49:22 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E65AB4203F;
 Fri, 21 May 2021 06:49:21 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 63D7C42041;
 Fri, 21 May 2021 06:49:17 +0000 (GMT)
Received: from naverao1-tp.in.ibm.com (unknown [9.85.72.15])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 21 May 2021 06:49:16 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Steven Rostedt <rostedt@goodmis.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Michal Suchanek <msuchanek@suse.de>, Torsten Duwe <duwe@suse.de>
Subject: [RFC PATCH 4/6] powerpc/perf: Include traced function in the callchain
Date: Fri, 21 May 2021 12:18:39 +0530
Message-Id: <e46e02f48567299b1176040961fec883e181b6ce.1621577151.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1621577151.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1621577151.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: nlJdJMa2sLDyW1pkK2RIVEMrvBFun5xW
X-Proofpoint-ORIG-GUID: nlJdJMa2sLDyW1pkK2RIVEMrvBFun5xW
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-21_03:2021-05-20,
 2021-05-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105210043
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

With -mprofile-kernel and ppc32, the function tracer is invoked before a
function sets up its own stackframe. This results in the traced function
not appearing in stack traces. Fix this by checking for ftrace entry and
including the traced function in the perf callchain.

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/perf/callchain.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/powerpc/perf/callchain.c b/arch/powerpc/perf/callchain.c
index 6c028ee513c0d7..ed4dd4ab6621f6 100644
--- a/arch/powerpc/perf/callchain.c
+++ b/arch/powerpc/perf/callchain.c
@@ -93,6 +93,11 @@ perf_callchain_kernel(struct perf_callchain_entry_ctx *entry, struct pt_regs *re
 		}
 
 		perf_callchain_store(entry, next_ip);
+		if (level && next_ip) {
+			next_ip = ftrace_get_traced_func_if_no_stackframe(next_ip, fp);
+			if (next_ip)
+				perf_callchain_store(entry, next_ip);
+		}
 		if (!valid_next_sp(next_sp, sp))
 			return;
 		sp = next_sp;
-- 
2.30.2

