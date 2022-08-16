Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C5C5951DC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Aug 2022 07:18:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M6KDr2k31z3bl3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Aug 2022 15:18:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Adp+eeAB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Adp+eeAB;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M6KD92gWNz30LS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Aug 2022 15:18:00 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27G4wuC6009712;
	Tue, 16 Aug 2022 05:17:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=ujMeBPdIiiOGaYtNRHshhyCIwj5DfQvHrD5Hgl87Bf4=;
 b=Adp+eeABetlqr+mlLw/uwvYjcrSGA7whe/KAiO1Po6xReDZDIIbkYbSkGFOhAecrsP/P
 ITL+8UpTh30p5g/T6Flq5kyfQid30GgnfDQCH+6SOsGWifNwph+hsFu1npW21wve1y3I
 Qz0YmGx6Jahe/kn6063Ux/u0tjFQQnXRT4Jlmr/GXQAXPyuM9LSonx9je1fBsVENHu3W
 WF+ni3NtrWP016oQj5t2X2/zxm+Q/WPmqatn6o4y3agCQ1XTWroZBDAGpetmH8/DCXA6
 4b2bQ2SNwajbepNxMJuDjy/ifft0vb8FeaQ6xNflrK+Zt8SuWAVCCmUWphWgb4UtJ6Ni rw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j04pkgf1t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Aug 2022 05:17:58 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27G4xhI2012780;
	Tue, 16 Aug 2022 05:17:58 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j04pkgf1c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Aug 2022 05:17:57 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27G4oJv2018878;
	Tue, 16 Aug 2022 05:17:55 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma03ams.nl.ibm.com with ESMTP id 3hx3k8tqqs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Aug 2022 05:17:55 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27G5HrWN19005792
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Aug 2022 05:17:53 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 548B542041;
	Tue, 16 Aug 2022 05:17:53 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A6BD54203F;
	Tue, 16 Aug 2022 05:17:52 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 16 Aug 2022 05:17:52 +0000 (GMT)
Received: from intelligence.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id EA217600F5;
	Tue, 16 Aug 2022 15:17:43 +1000 (AEST)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] gcc-plugins: Undefine LATENT_ENTROPY_PLUGIN when plugin disabled for a file
Date: Tue, 16 Aug 2022 15:17:20 +1000
Message-Id: <20220816051720.44108-1-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.30.2
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7LsidicgVpa5nZ9ncX1TAHQLb5o1XKkq
X-Proofpoint-ORIG-GUID: Wc95z271RWwNa3ElKEg9LApaeT7WBAtT
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-16_03,2022-08-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 adultscore=0 clxscore=1011 bulkscore=0 mlxlogscore=999 impostorscore=0
 lowpriorityscore=0 mlxscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208160019
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
Cc: Erhard Furtner <erhard_f@mailbox.org>, Emese Revfy <re.emese@gmail.com>, Yury Norov <yury.norov@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 36d4b36b6959 ("lib/nodemask: inline next_node_in() and
node_random()") refactored some code by moving node_random() from
lib/nodemask.c to include/linux/nodemask.h, thus requiring nodemask.h to
include random.h, which conditionally defines add_latent_entropy()
depending on whether the macro LATENT_ENTROPY_PLUGIN is defined.

This broke the build on powerpc, where nodemask.h is indirectly included
in arch/powerpc/kernel/prom_init.c, part of the early boot machinery that
is excluded from the latent entropy plugin using
DISABLE_LATENT_ENTROPY_PLUGIN. It turns out that while we add a gcc flag
to disable the actual plugin, we don't undefine LATENT_ENTROPY_PLUGIN.

This leads to the following:

    CC      arch/powerpc/kernel/prom_init.o
  In file included from ./include/linux/nodemask.h:97,
                   from ./include/linux/mmzone.h:17,
                   from ./include/linux/gfp.h:7,
                   from ./include/linux/xarray.h:15,
                   from ./include/linux/radix-tree.h:21,
                   from ./include/linux/idr.h:15,
                   from ./include/linux/kernfs.h:12,
                   from ./include/linux/sysfs.h:16,
                   from ./include/linux/kobject.h:20,
                   from ./include/linux/pci.h:35,
                   from arch/powerpc/kernel/prom_init.c:24:
  ./include/linux/random.h: In function 'add_latent_entropy':
  ./include/linux/random.h:25:46: error: 'latent_entropy' undeclared (first use in this function); did you mean 'add_latent_entropy'?
     25 |         add_device_randomness((const void *)&latent_entropy, sizeof(latent_entropy));
        |                                              ^~~~~~~~~~~~~~
        |                                              add_latent_entropy
  ./include/linux/random.h:25:46: note: each undeclared identifier is reported only once for each function it appears in
  make[2]: *** [scripts/Makefile.build:249: arch/powerpc/kernel/prom_init.o] Fehler 1
  make[1]: *** [scripts/Makefile.build:465: arch/powerpc/kernel] Fehler 2
  make: *** [Makefile:1855: arch/powerpc] Error 2

Change the DISABLE_LATENT_ENTROPY_PLUGIN flags to undefine
LATENT_ENTROPY_PLUGIN for files where the plugin is disabled.

Cc: Yury Norov <yury.norov@gmail.com>
Cc: Emese Revfy <re.emese@gmail.com>
Fixes: 36d4b36b6959 ("lib/nodemask: inline next_node_in() and node_random()")
Link: https://bugzilla.kernel.org/show_bug.cgi?id=216367
Link: https://lore.kernel.org/linuxppc-dev/alpine.DEB.2.22.394.2208152006320.289321@ramsan.of.borg/
Reported-by: Erhard Furtner <erhard_f@mailbox.org>
Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
---
 scripts/Makefile.gcc-plugins | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.gcc-plugins b/scripts/Makefile.gcc-plugins
index 692d64a70542..e4deaf5fa571 100644
--- a/scripts/Makefile.gcc-plugins
+++ b/scripts/Makefile.gcc-plugins
@@ -4,7 +4,7 @@ gcc-plugin-$(CONFIG_GCC_PLUGIN_LATENT_ENTROPY)	+= latent_entropy_plugin.so
 gcc-plugin-cflags-$(CONFIG_GCC_PLUGIN_LATENT_ENTROPY)		\
 		+= -DLATENT_ENTROPY_PLUGIN
 ifdef CONFIG_GCC_PLUGIN_LATENT_ENTROPY
-    DISABLE_LATENT_ENTROPY_PLUGIN += -fplugin-arg-latent_entropy_plugin-disable
+    DISABLE_LATENT_ENTROPY_PLUGIN += -fplugin-arg-latent_entropy_plugin-disable -ULATENT_ENTROPY_PLUGIN
 endif
 export DISABLE_LATENT_ENTROPY_PLUGIN
 
-- 
2.30.2

