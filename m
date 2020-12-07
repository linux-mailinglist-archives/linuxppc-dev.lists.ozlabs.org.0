Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D46462D1D4B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Dec 2020 23:29:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CqdJW70SvzDqQS
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 09:28:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=tW1y2Kn4; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CqcV86cl1zDqTJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Dec 2020 08:52:16 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B7LRlCO158266
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 7 Dec 2020 16:52:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=0ik+rkloRuXaOJqFcoCiX7EijKc2m8H5OEeLQ/fqhQ4=;
 b=tW1y2Kn4oKVTv+MWiKn6UqprbUq6JytUdYoOeMxDx2E5ZCVNa0eBzg/87WEgtPYeD0Ze
 Ofic2ntaAz55va39r/WucYsa3hZ3LOnL73qPtgKroqNhv4032PlUSk+oSfWEFt67/Vcl
 yvXoJhjjvgJeoROnUCyTkRFHFXcTNxE5Qa9J707p2taRyiE2FMvIjDqHVw3DGwv6IC6y
 i3d3Yxrgci0UVfD5asovffswDcnFEgijrS2KE3oCxNqy/JPqYeMpLNDF+NHLqPEo2POq
 sIGeC6Ks0PFmzqZsVYPNlXQOD3oqVO0K7mbuQThe/8PYglBroMuaTbbWmKSFQeSmP/LC /g== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 359qrfs7mx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Dec 2020 16:52:14 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B7LltuE002566
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 7 Dec 2020 21:52:13 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma01dal.us.ibm.com with ESMTP id 3581u8yqay-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Dec 2020 21:52:13 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B7LqCLg62718394
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Dec 2020 21:52:13 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DC214AC05F;
 Mon,  7 Dec 2020 21:52:12 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9B0A8AC059;
 Mon,  7 Dec 2020 21:52:12 +0000 (GMT)
Received: from localhost (unknown [9.160.57.67])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  7 Dec 2020 21:52:12 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 16/28] powerpc/rtas: remove rtas_ibm_suspend_me_unsafe()
Date: Mon,  7 Dec 2020 15:51:48 -0600
Message-Id: <20201207215200.1785968-17-nathanl@linux.ibm.com>
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
 phishscore=0 mlxlogscore=999
 suspectscore=1 adultscore=0 mlxscore=0 impostorscore=0 spamscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012070132
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
 arch/powerpc/kernel/rtas.c      | 67 +--------------------------------
 2 files changed, 1 insertion(+), 67 deletions(-)

diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
index 3b52d8574fcc..9a6107ffe378 100644
--- a/arch/powerpc/include/asm/rtas.h
+++ b/arch/powerpc/include/asm/rtas.h
@@ -258,7 +258,6 @@ extern int rtas_set_indicator_fast(int indicator, int index, int new_value);
 extern void rtas_progress(char *s, unsigned short hex);
 extern int rtas_suspend_cpu(struct rtas_suspend_me_data *data);
 extern int rtas_suspend_last_cpu(struct rtas_suspend_me_data *data);
-int rtas_ibm_suspend_me_unsafe(u64 handle);
 int rtas_ibm_suspend_me(int *fw_status);
 
 struct rtc_time;
diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index d4b048571728..7e6024f570da 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -925,66 +925,6 @@ int rtas_suspend_cpu(struct rtas_suspend_me_data *data)
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
-
 /**
  * rtas_call_reentrant() - Used for reentrant rtas calls
  * @token:	Token for desired reentrant RTAS call
@@ -1035,12 +975,7 @@ int rtas_call_reentrant(int token, int nargs, int nret, int *outputs, ...)
 	return ret;
 }
 
-#else /* CONFIG_PPC_PSERIES */
-int rtas_ibm_suspend_me_unsafe(u64 handle)
-{
-	return -ENOSYS;
-}
-#endif
+#endif /* CONFIG_PPC_PSERIES */
 
 /**
  * Find a specific pseries error log in an RTAS extended event log.
-- 
2.28.0

