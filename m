Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3107829FAAE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 02:44:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMlV93YVlzDr3h
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 12:44:33 +1100 (AEDT)
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
 header.s=pp1 header.b=RUy5LH7r; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMkw301fRzDqkR
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 12:18:26 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09U11pT9133814
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 21:18:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=o70iauJRV4ZU1eQqIPH7/DruyMtuAuc/7j96AG2G19E=;
 b=RUy5LH7rE6NSWTH+dnwGCcscTgTA1+KwNh1fu6zSRc7JnLsC1mjKAt2CJBYca1b08maB
 OyN1WV/8Ho/nSFgv6WZQPVLGaTsdIG46Uj2TBQxHwRs4zwmsIcQ3Pgv1DzQ9TYskoeFR
 xhqqXww/B3C9KC0H9CWwudunUxtKsOZ5zxvLs8UlpETwIz6ogLHZ0r2BBLr58oLC7UpV
 I1z6SQlbhEqfdoncZ7xig+RuT0z4woGRSX0cmsvgt9ihkNpXClk12oFFK4HDCHIaa1m9
 4FvPYX8hVDX3f/WlpVL0gV5CfJ667ytcIz7dwTWgaLQY9OwYfMRGUk01wrvtid7lfUHh iA== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34g6syb7dh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 21:18:24 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09U1F16k026092
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 01:18:23 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma02wdc.us.ibm.com with ESMTP id 34dy04nx9k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 01:18:23 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09U1IKBx32899508
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Oct 2020 01:18:20 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 68BD5124052;
 Fri, 30 Oct 2020 01:18:20 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 346F6124058;
 Fri, 30 Oct 2020 01:18:20 +0000 (GMT)
Received: from localhost (unknown [9.65.225.148])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 30 Oct 2020 01:18:20 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 16/29] powerpc/rtas: dispatch partition migration requests to
 pseries
Date: Thu, 29 Oct 2020 20:17:52 -0500
Message-Id: <20201030011805.1224603-17-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201030011805.1224603-1-nathanl@linux.ibm.com>
References: <20201030011805.1224603-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-29_12:2020-10-29,
 2020-10-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 mlxlogscore=999 clxscore=1015 malwarescore=0 suspectscore=1
 impostorscore=0 mlxscore=0 spamscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010300001
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
there while minimizing additional dependence on pseries.

Use a weak function that only pseries overrides. Note that invoking
ibm,suspend-me via the RTAS syscall is all but deprecated; this change
preserves ABI compatibility for old programs while providing to them
the benefit of the new partition suspend implementation. This is a
behavior change in that the kernel performs the device tree update and
firmware activation before returning, but experimentation indicates
this is tolerated fine by legacy user space.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/include/asm/rtas.h           | 1 +
 arch/powerpc/kernel/rtas.c                | 8 +++++++-
 arch/powerpc/platforms/pseries/mobility.c | 5 +++++
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
index fdefe6a974eb..be0fc2536673 100644
--- a/arch/powerpc/include/asm/rtas.h
+++ b/arch/powerpc/include/asm/rtas.h
@@ -260,6 +260,7 @@ extern int rtas_suspend_cpu(struct rtas_suspend_me_data *data);
 extern int rtas_suspend_last_cpu(struct rtas_suspend_me_data *data);
 int rtas_ibm_suspend_me_unsafe(u64 handle);
 int rtas_ibm_suspend_me(int *fw_status);
+int rtas_syscall_dispatch_ibm_suspend_me(u64 handle);
 
 struct rtc_time;
 extern time64_t rtas_get_boot_time(void);
diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 58bbd69a233f..52fb394f15d6 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -1221,6 +1221,12 @@ static bool block_rtas_call(int token, int nargs,
 
 #endif /* CONFIG_PPC_RTAS_FILTER */
 
+/* Only pseries should need to override this. */
+int __weak rtas_syscall_dispatch_ibm_suspend_me(u64 handle)
+{
+	return -EINVAL;
+}
+
 /* We assume to be passed big endian arguments */
 SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
 {
@@ -1271,7 +1277,7 @@ SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
 		int rc = 0;
 		u64 handle = ((u64)be32_to_cpu(args.args[0]) << 32)
 		              | be32_to_cpu(args.args[1]);
-		rc = rtas_ibm_suspend_me_unsafe(handle);
+		rc = rtas_syscall_dispatch_ibm_suspend_me(handle);
 		if (rc == -EAGAIN)
 			args.rets[0] = cpu_to_be32(RTAS_NOT_SUSPENDABLE);
 		else if (rc == -EIO)
diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
index e459cdb8286f..d6417c9db201 100644
--- a/arch/powerpc/platforms/pseries/mobility.c
+++ b/arch/powerpc/platforms/pseries/mobility.c
@@ -622,6 +622,11 @@ static int pseries_migrate_partition(u64 handle)
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
2.25.4

