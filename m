Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 834334B9F0B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Feb 2022 12:38:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JztBX6Qg5z3ccR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Feb 2022 22:38:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Wf+uoQeu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Wf+uoQeu; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jzt921QwRz2ybK
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Feb 2022 22:37:25 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21HBBctA009493; 
 Thu, 17 Feb 2022 11:36:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=lE0gbf8t2g/1fUkvXko9q/tsZdNjgF2I76WzkaK/Q54=;
 b=Wf+uoQeuOOAhK8frvNMvE4hEJfEQmGum1feKzx6djrFb+Vp+pdyJCxgknpcSrtIahmjT
 KEEQ0zKhRJo0PgLSAipV9bQUsjSQxrzgBtkB26oESavEq39dhfcX/TJHbbckB5tGesAh
 9W3LhxXVuGa0ZEN0da2FOIkqTdkw0c8CALsh/8V3XQWZD4NfLAewYL2jPG3JFjsHUGlW
 OANjpMeanDflHCRMajg01eHn3M0pWYCnVEhX5dR5wKp2cQ/H3FdDNT4e9Eppd7wln7cg
 zOzTSaqlfC8LUe6HZNC3vcAjOIRi6MtiPUvPCTcGYRXU1o5r/hAqRwGATPYELNywDLM3 pw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e9n988q15-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Feb 2022 11:36:55 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21HBD9ve011941;
 Thu, 17 Feb 2022 11:36:55 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e9n988pyx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Feb 2022 11:36:55 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21HBaFXH008709;
 Thu, 17 Feb 2022 11:36:52 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03fra.de.ibm.com with ESMTP id 3e64haf7va-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Feb 2022 11:36:52 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21HBanfZ37683588
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Feb 2022 11:36:50 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3B1E15205F;
 Thu, 17 Feb 2022 11:36:49 +0000 (GMT)
Received: from li-NotSettable.ibm.com.com (unknown [9.43.115.39])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id B892952054;
 Thu, 17 Feb 2022 11:36:46 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Steven Rostedt <rostedt@goodmis.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Masami Hiramatsu <mhiramat@kernel.org>
Subject: [PATCH 2/3] bpf/trampoline: Allow ftrace location to differ from
 trampoline attach address
Date: Thu, 17 Feb 2022 17:06:24 +0530
Message-Id: <2a32e4723f7e56c675ffd6aa0762789e56dce2e1.1645096227.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1645096227.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1645096227.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ghGzwae4IVWidNvEDMylB-Ua5zhta93P
X-Proofpoint-GUID: Htspvnek8-mkYMYkwZWwrrjnRyiAJE0M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-17_04,2022-02-17_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=770
 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202170051
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
Cc: bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On some architectures, ftrace location can include multiple
instructions, and does not necessarily match the function entry address
returned by kallsyms_lookup(). Drop the check in is_ftrace_location() to
accommodate the same.

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 kernel/bpf/trampoline.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/kernel/bpf/trampoline.c b/kernel/bpf/trampoline.c
index 4b6974a195c138..c47c80874bee3f 100644
--- a/kernel/bpf/trampoline.c
+++ b/kernel/bpf/trampoline.c
@@ -124,8 +124,6 @@ static int is_ftrace_location(void *ip)
 	addr = ftrace_location((long)ip);
 	if (!addr)
 		return 0;
-	if (WARN_ON_ONCE(addr != (long)ip))
-		return -EFAULT;
 	return 1;
 }
 
-- 
2.35.1

