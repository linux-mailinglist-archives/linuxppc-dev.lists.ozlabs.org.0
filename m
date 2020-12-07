Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE6C2D1D49
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Dec 2020 23:27:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CqdGj5JxNzDqZ1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 09:27:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=CvSMUpcJ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CqcV84SBJzDqVb
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Dec 2020 08:52:16 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B7LXKWG101274
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 7 Dec 2020 16:52:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=VfSVtQnpkMbiV1SQzLlXT44z0QdzUH2cNNh71QYtdTQ=;
 b=CvSMUpcJEbbISs485+MZM4C9rSS36EVDvhASMTv5adBNKjDs6pPqU+I0bL/cTyjr4VyI
 n7ufeLKAfy59KD2CHVWefTc/s+kgeuq7+4H0zS9xlMUK9507Jto/AgN83IVEOTGdaBwL
 +/j3RDkdiIhKHnEo1pehn23d8rpE2KvGs4aKKhkWlJk2PU39Z1jlKeLFbj0rIiYcLE1o
 hK8xxq8p8aYYUZqoXl4JhGBd7STY/IYrS4NCVvscARIO8NGmCF+Ji9SC4cmDMgF7u1ah
 pCD4kY5lPujOy0qS1EvWK8CgaQ2hfzHqJGh68QAgxC03uKq+DLCYFP1xoxccRgdS06EU pA== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 359s0me1py-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Dec 2020 16:52:13 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B7LmI53024612
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 7 Dec 2020 21:52:13 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma03dal.us.ibm.com with ESMTP id 3581u8ymvu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Dec 2020 21:52:13 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B7LqC9962718388
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Dec 2020 21:52:12 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2C6C1AC059;
 Mon,  7 Dec 2020 21:52:12 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DBA2AAC05B;
 Mon,  7 Dec 2020 21:52:11 +0000 (GMT)
Received: from localhost (unknown [9.160.57.67])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  7 Dec 2020 21:52:11 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 15/28] powerpc/rtas: dispatch partition migration requests
 to pseries
Date: Mon,  7 Dec 2020 15:51:47 -0600
Message-Id: <20201207215200.1785968-16-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201207215200.1785968-1-nathanl@linux.ibm.com>
References: <20201207215200.1785968-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-07_16:2020-12-04,
 2020-12-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501 mlxlogscore=999
 clxscore=1015 malwarescore=0 impostorscore=0 suspectscore=1
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012070140
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
Cc: tyreld@linux.ibm.com, ajd@linux.ibm.com, mmc@linux.vnet.ibm.com,
 cforno12@linux.vnet.ibm.com, drt@linux.vnet.ibm.com, brking@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

sys_rtas() cannot call ibm,suspend-me directly in the same way it
handles other inputs. Instead it must dispatch the request to code
that can first perform the H_JOIN sequence before any call to
ibm,suspend-me can succeed. Over time kernel/rtas.c has accreted a fair
amount of platform-specific code to implement this.

Since a different, more robust implementation of the suspend sequence
is now in the pseries platform code, we want to dispatch the request
there.

Note that invoking ibm,suspend-me via the RTAS syscall is all but
deprecated; this change preserves ABI compatibility for old programs
while providing to them the benefit of the new partition suspend
implementation. This is a behavior change in that the kernel performs
the device tree update and firmware activation before returning, but
experimentation indicates this is tolerated fine by legacy user space.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/include/asm/rtas.h           | 5 +++++
 arch/powerpc/kernel/rtas.c                | 2 +-
 arch/powerpc/platforms/pseries/mobility.c | 5 +++++
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
index fdefe6a974eb..3b52d8574fcc 100644
--- a/arch/powerpc/include/asm/rtas.h
+++ b/arch/powerpc/include/asm/rtas.h
@@ -279,8 +279,13 @@ extern time64_t last_rtas_event;
 extern int clobbering_unread_rtas_event(void);
 extern int pseries_devicetree_update(s32 scope);
 extern void post_mobility_fixup(void);
+int rtas_syscall_dispatch_ibm_suspend_me(u64 handle);
 #else
 static inline int clobbering_unread_rtas_event(void) { return 0; }
+static inline int rtas_syscall_dispatch_ibm_suspend_me(u64 handle)
+{
+	return -EINVAL;
+}
 #endif
 
 #ifdef CONFIG_PPC_RTAS_DAEMON
diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 3a740ae933f8..d4b048571728 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -1272,7 +1272,7 @@ SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
 		int rc = 0;
 		u64 handle = ((u64)be32_to_cpu(args.args[0]) << 32)
 		              | be32_to_cpu(args.args[1]);
-		rc = rtas_ibm_suspend_me_unsafe(handle);
+		rc = rtas_syscall_dispatch_ibm_suspend_me(handle);
 		if (rc == -EAGAIN)
 			args.rets[0] = cpu_to_be32(RTAS_NOT_SUSPENDABLE);
 		else if (rc == -EIO)
diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
index fe7e35cdc9d5..e670180f311d 100644
--- a/arch/powerpc/platforms/pseries/mobility.c
+++ b/arch/powerpc/platforms/pseries/mobility.c
@@ -615,6 +615,11 @@ static int pseries_migrate_partition(u64 handle)
 	return ret;
 }
 
+int rtas_syscall_dispatch_ibm_suspend_me(u64 handle)
+{
+	return pseries_migrate_partition(handle);
+}
+
 static ssize_t migration_store(struct class *class,
 			       struct class_attribute *attr, const char *buf,
 			       size_t count)
-- 
2.28.0

