Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B31AF29FAB4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 02:49:18 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMlbb4nFwzDr0R
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 12:49:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=svn0HCat; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMkw325kXzDql0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 12:18:27 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09U12qQ5099829
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 21:18:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=UbzIqQHEEEWx7EWDJagYg1d1sgAII5Ft87uMehQ9qko=;
 b=svn0HCat0t+olwTWQZMl2SPzwy32P+uFd4SYBDBa1B3QajX8NSOSSgl4D9BhPlRCZgCd
 G+07aAVjdlOgscMCH9P4HL1cT1+85z8LbmfQ+tGHjrhVkK2PM7PxvoL2u1sSJ8Svm9OE
 kMn3w1Z/iXFcExtEx1Pze4W4atfx+zIg5cOC7BAGiFpMLdJtBJnUywmaCeMQvnbpus5k
 q1DoC8TohaOZz6HPsL8YPrB2yW3VcqaS6r6v7Hrms0Xl+ntFbPxrUQ5Kr5iO976Yltmt
 YTO6AfcJYeJ5ej6uIJKfMMohK/4NddHfghWSPAl6PgdbtWzxH9XeNq34bYd9Jhw0bDZA sA== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34fyx99bns-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 21:18:22 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09U1HE7q000700
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 01:18:22 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma02dal.us.ibm.com with ESMTP id 34e1gpc5cg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 01:18:22 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09U1ILOf45023524
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Oct 2020 01:18:21 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 24893B2066;
 Fri, 30 Oct 2020 01:18:21 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D7EDDB205F;
 Fri, 30 Oct 2020 01:18:20 +0000 (GMT)
Received: from localhost (unknown [9.65.225.148])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 30 Oct 2020 01:18:20 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 17/29] powerpc/rtas: remove rtas_ibm_suspend_me_unsafe()
Date: Thu, 29 Oct 2020 20:17:53 -0500
Message-Id: <20201030011805.1224603-18-nathanl@linux.ibm.com>
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
 adultscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 clxscore=1015 suspectscore=1 impostorscore=0 spamscore=0 malwarescore=0
 mlxlogscore=997 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

rtas_ibm_suspend_me_unsafe() is now unused; remove it and
rtas_percpu_suspend_me() which becomes unused as a result.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/include/asm/rtas.h |  1 -
 arch/powerpc/kernel/rtas.c      | 64 ---------------------------------
 2 files changed, 65 deletions(-)

diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
index be0fc2536673..1e695e553a36 100644
--- a/arch/powerpc/include/asm/rtas.h
+++ b/arch/powerpc/include/asm/rtas.h
@@ -258,7 +258,6 @@ extern int rtas_set_indicator_fast(int indicator, int index, int new_value);
 extern void rtas_progress(char *s, unsigned short hex);
 extern int rtas_suspend_cpu(struct rtas_suspend_me_data *data);
 extern int rtas_suspend_last_cpu(struct rtas_suspend_me_data *data);
-int rtas_ibm_suspend_me_unsafe(u64 handle);
 int rtas_ibm_suspend_me(int *fw_status);
 int rtas_syscall_dispatch_ibm_suspend_me(u64 handle);
 
diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 52fb394f15d6..6fde38b488f7 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -895,70 +895,6 @@ int rtas_suspend_cpu(struct rtas_suspend_me_data *data)
 	return __rtas_suspend_cpu(data, 0);
 }
 
-static void rtas_percpu_suspend_me(void *info)
-{
-	__rtas_suspend_cpu((struct rtas_suspend_me_data *)info, 1);
-}
-
-int rtas_ibm_suspend_me_unsafe(u64 handle)
-{
-	long state;
-	long rc;
-	unsigned long retbuf[PLPAR_HCALL_BUFSIZE];
-	struct rtas_suspend_me_data data;
-	DECLARE_COMPLETION_ONSTACK(done);
-
-	if (!rtas_service_present("ibm,suspend-me"))
-		return -ENOSYS;
-
-	/* Make sure the state is valid */
-	rc = plpar_hcall(H_VASI_STATE, retbuf, handle);
-
-	state = retbuf[0];
-
-	if (rc) {
-		printk(KERN_ERR "rtas_ibm_suspend_me: vasi_state returned %ld\n",rc);
-		return rc;
-	} else if (state == H_VASI_ENABLED) {
-		return -EAGAIN;
-	} else if (state != H_VASI_SUSPENDING) {
-		printk(KERN_ERR "rtas_ibm_suspend_me: vasi_state returned state %ld\n",
-		       state);
-		return -EIO;
-	}
-
-	atomic_set(&data.working, 0);
-	atomic_set(&data.done, 0);
-	atomic_set(&data.error, 0);
-	data.token = rtas_token("ibm,suspend-me");
-	data.complete = &done;
-
-	lock_device_hotplug();
-
-	cpu_hotplug_disable();
-
-	/* Call function on all CPUs.  One of us will make the
-	 * rtas call
-	 */
-	on_each_cpu(rtas_percpu_suspend_me, &data, 0);
-
-	wait_for_completion(&done);
-
-	if (atomic_read(&data.error) != 0)
-		printk(KERN_ERR "Error doing global join\n");
-
-
-	cpu_hotplug_enable();
-
-	unlock_device_hotplug();
-
-	return atomic_read(&data.error);
-}
-#else /* CONFIG_PPC_PSERIES */
-int rtas_ibm_suspend_me_unsafe(u64 handle)
-{
-	return -ENOSYS;
-}
 #endif
 
 /**
-- 
2.25.4

