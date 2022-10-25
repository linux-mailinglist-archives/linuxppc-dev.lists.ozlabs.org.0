Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BABDB60C2BE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Oct 2022 06:45:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MxKBJ2GfWz3cD6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Oct 2022 15:45:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZDUqiWjG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZDUqiWjG;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MxK9M0ksnz2xZV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Oct 2022 15:44:38 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29P4DnQa038393;
	Tue, 25 Oct 2022 04:44:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=qo+HhzfQTLLkM4MYeeGPmgxFCvA4lgBs1LC8s6i0pNI=;
 b=ZDUqiWjGgDfdSM75Obq9ak5Eabdqbr0jhgeVctBx2kKwS5zvbBZEdt+uAEPzODLcONPd
 V4jsgcFidCW38rl/YyTUiPL9fYO7AAd1g2dHYYNUtB9zwHcC04iLCZF3K1Z43pZPCoki
 DI5B0N1FQ/ZLqULrHfj7Dl1yMBzleiPyBytjUKIZAFCZDXzOpfQHQvW7c80bK6If0ePZ
 zdyXifdljZh/G948/NH7pqmJYMx55Iyk/eE8WVNQJqHo/EPcF5/W9tALYhqh+9Ns0ZPb
 8nRkxfw/dE5wS1ckfAQI0M3xsoWGbeiW3ETDxdgNE2ngIu+z+eOtjLiygr4M3K6LSQXQ Lg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ke8k6grhe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Oct 2022 04:44:28 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29P4Dsh7038757;
	Tue, 25 Oct 2022 04:44:27 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ke8k6grh2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Oct 2022 04:44:27 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29P4KS92016595;
	Tue, 25 Oct 2022 04:44:25 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma03fra.de.ibm.com with ESMTP id 3kdv5fgbwm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Oct 2022 04:44:25 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29P4dBZ339715312
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Oct 2022 04:39:11 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6CF1FAE04D;
	Tue, 25 Oct 2022 04:44:23 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 16656AE045;
	Tue, 25 Oct 2022 04:44:23 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 25 Oct 2022 04:44:23 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 4D47660807;
	Tue, 25 Oct 2022 15:44:21 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v9 3/7] powerpc/code-patching: Use WARN_ON and fix check in poking_init
Date: Tue, 25 Oct 2022 15:44:05 +1100
Message-Id: <20221025044409.448755-4-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221025044409.448755-1-bgray@linux.ibm.com>
References: <20221025044409.448755-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: NPowKcivTjjsaJwPj3lvooEqcdMTWyG5
X-Proofpoint-GUID: yoFCxoj5krI175lTs9KQ4arHvCu3hLKy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-24_09,2022-10-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 mlxscore=0 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 spamscore=0 clxscore=1015 mlxlogscore=999 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210250024
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
Cc: ajd@linux.ibm.com, jniethe5@gmail.com, Benjamin Gray <bgray@linux.ibm.com>, npiggin@gmail.com, cmr@bluescreens.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

BUG_ON() when failing to initialise the code patching window is
excessive, as most critical patching happens during boot before strict
RWX control is enabled. Failure to patch after boot is not inherently
fatal, so aborting the kernel is better determined by the caller.

The return value of cpuhp_setup_state() is also >= 0 on success,
so check for < 0.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
Reviewed-by: Russell Currey <ruscur@russell.cc>
---
v9:	* Reword commit message to explain why init failure is not fatal
---
 arch/powerpc/lib/code-patching.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index 54e145247643..3b3b09d5d2e1 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -82,16 +82,13 @@ static int text_area_cpu_down(unsigned int cpu)
 
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(poking_init_done);
 
-/*
- * Although BUG_ON() is rude, in this case it should only happen if ENOMEM, and
- * we judge it as being preferable to a kernel that will crash later when
- * someone tries to use patch_instruction().
- */
 void __init poking_init(void)
 {
-	BUG_ON(!cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
-		"powerpc/text_poke:online", text_area_cpu_up,
-		text_area_cpu_down));
+	WARN_ON(cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
+				  "powerpc/text_poke:online",
+				  text_area_cpu_up,
+				  text_area_cpu_down) < 0);
+
 	static_branch_enable(&poking_init_done);
 }
 
-- 
2.37.3

