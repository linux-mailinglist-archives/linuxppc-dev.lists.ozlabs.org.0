Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E32238C010
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 08:53:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmckS3LQfz3bnZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 16:53:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MNUt86aE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=MNUt86aE; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fmcg02MKDz301X
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 16:50:04 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14L6XpL6067209; Fri, 21 May 2021 02:49:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=B6fKIfzATlOj+vGB437dzLALXkiJGp1xiTO+3WNacfU=;
 b=MNUt86aEsC4cu81ZKH9Ob3kyzQk+XdYVeKdOQBa1EJNIKfzaaPRao8PKVQNDW+nn/Ad7
 5KsVoPpYWd6fteeZr1hMV5XRIPg918dGwwq+zIUmq6rZ+rrMUQlndIw8e7VD/lBZ7aQP
 WUmgEJMMzR8kON9zGA1xeQTdCcC4WabDIYuuHez0VzsGaYoKPctSZmQ4XEJVOOjzPjZt
 8YH0EW1y0hyjXPtb/V8pqDTHcrdIogMVf/mgC24N5vZZIozxKiavEn9JdfC+LJrtXhGM
 Lfgw0j/+yctODj5Qw9RWRWXiwUth47HbnwWax6wD4fSB6eylPM10+eFm10FM3ATkRDDa ew== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38p4bfcr6u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 02:49:34 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14L6mPcs022242;
 Fri, 21 May 2021 06:49:31 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06fra.de.ibm.com with ESMTP id 38j5jh1nrg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 06:49:31 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14L6nSH134013520
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 May 2021 06:49:28 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C1C1C4203F;
 Fri, 21 May 2021 06:49:28 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CCF8442049;
 Fri, 21 May 2021 06:49:25 +0000 (GMT)
Received: from naverao1-tp.in.ibm.com (unknown [9.85.72.15])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 21 May 2021 06:49:25 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Steven Rostedt <rostedt@goodmis.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Michal Suchanek <msuchanek@suse.de>, Torsten Duwe <duwe@suse.de>
Subject: [RFC PATCH 6/6] powerpc/stacktrace: Include ftraced function in
 arch_stack_walk()
Date: Fri, 21 May 2021 12:18:41 +0530
Message-Id: <62004f1fa97ab48ca53f08addea531a25886f5f7.1621577151.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1621577151.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1621577151.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: deIiirdD9J-DWVX9ALFn90A0q2jR26fV
X-Proofpoint-GUID: deIiirdD9J-DWVX9ALFn90A0q2jR26fV
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-21_03:2021-05-20,
 2021-05-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 mlxscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2105210043
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
including the traced function in the stack trace.

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/kernel/stacktrace.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/kernel/stacktrace.c b/arch/powerpc/kernel/stacktrace.c
index 1e1be297c5d6c7..f884c5d21fa7e7 100644
--- a/arch/powerpc/kernel/stacktrace.c
+++ b/arch/powerpc/kernel/stacktrace.c
@@ -51,6 +51,10 @@ void arch_stack_walk(stack_trace_consume_fn consume_entry, void *cookie,
 		if (!consume_entry(cookie, ip))
 			return;
 
+		ip = ftrace_get_traced_func_if_no_stackframe(ip, stack);
+		if (ip && !consume_entry(cookie, ip))
+			return;
+
 		sp = newsp;
 	}
 }
-- 
2.30.2

