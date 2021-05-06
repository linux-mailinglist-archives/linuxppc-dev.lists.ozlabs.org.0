Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D000374E9F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 06:38:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FbLS24JCWz3c77
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 14:38:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=J6vU4bot;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=cmr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=J6vU4bot; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FbLNN1CFVz300P
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 May 2021 14:35:14 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1464XX3c081163; Thu, 6 May 2021 00:35:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=lvQXdUSE1LGilnSeXVxBlpw+DjF1L2POABaCFKcobx4=;
 b=J6vU4botMSUR6YDXtjvdu1ccOZ9+bXyq/toX9j7vN0ADH8wBJnHcpAp6TCg2ZQ+H9vY6
 aQ1Ck40b9VlQoM/zFNI87sRMTEss0Gl72CqyICY8C3bq7F/tvrHWrROZmhErhfzMI00+
 oSggksunyFUG2dEBpMwmyrRD2NdvcJGCwrVrPJlhb8Fm377I8AUD6yA6ov/fNLpmE2pI
 iH9DovNu0dmJ16AncpUVvaY4sAI+18pXsWoqu4RQxh7JCX3971ouCBCAXqFDUM+puK/L
 qTfzwXk0a+iV20lZZcXV9gvz7tMLgfx5teQLX9EdSVrveuIGj3C/wj9XAt+kQ+a4LmY2 iQ== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38c78aapf6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 May 2021 00:35:00 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 1464Y9F4023806;
 Thu, 6 May 2021 04:34:59 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma05wdc.us.ibm.com with ESMTP id 38bedwh64g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 May 2021 04:34:59 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1464YwS918743738
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 May 2021 04:34:58 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8576D13605E;
 Thu,  6 May 2021 04:34:58 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CD8D2136053;
 Thu,  6 May 2021 04:34:57 +0000 (GMT)
Received: from oc8246131445.ibm.com (unknown [9.160.168.222])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with SMTP;
 Thu,  6 May 2021 04:34:57 +0000 (GMT)
Received: from oc8246131445.ibm.com (localhost.localdomain [127.0.0.1])
 by oc8246131445.ibm.com (Postfix) with ESMTP id 959C9BC0FBC;
 Wed,  5 May 2021 23:34:53 -0500 (CDT)
From: "Christopher M. Riedl" <cmr@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RESEND PATCH v4 04/11] lkdtm/x86_64: Add test to hijack a patch
 mapping
Date: Wed,  5 May 2021 23:34:45 -0500
Message-Id: <20210506043452.9674-5-cmr@linux.ibm.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210506043452.9674-1-cmr@linux.ibm.com>
References: <20210506043452.9674-1-cmr@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: W2-M-Q6YDZkyJ_6oGJCAeAdG6Tdlbsx9
X-Proofpoint-ORIG-GUID: W2-M-Q6YDZkyJ_6oGJCAeAdG6Tdlbsx9
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-06_03:2021-05-05,
 2021-05-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 phishscore=0 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2105060029
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
Cc: tglx@linutronix.de, x86@kernel.org, linux-hardening@vger.kernel.org,
 keescook@chromium.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A previous commit implemented an LKDTM test on powerpc to exploit the
temporary mapping established when patching code with STRICT_KERNEL_RWX
enabled. Extend the test to work on x86_64 as well.

Signed-off-by: Christopher M. Riedl <cmr@linux.ibm.com>
---
 drivers/misc/lkdtm/perms.c | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/misc/lkdtm/perms.c b/drivers/misc/lkdtm/perms.c
index c6f96ebffccfd..55c3bec6d3b72 100644
--- a/drivers/misc/lkdtm/perms.c
+++ b/drivers/misc/lkdtm/perms.c
@@ -224,7 +224,7 @@ void lkdtm_ACCESS_NULL(void)
 }
=20
 #if (IS_BUILTIN(CONFIG_LKDTM) && defined(CONFIG_STRICT_KERNEL_RWX) && \
-	defined(CONFIG_PPC))
+	(defined(CONFIG_PPC) || defined(CONFIG_X86_64)))
 /*
  * This is just a dummy location to patch-over.
  */
@@ -233,28 +233,51 @@ static void patching_target(void)
 	return;
 }
=20
+#ifdef CONFIG_PPC
 #include <asm/code-patching.h>
 struct ppc_inst * const patch_site =3D (struct ppc_inst *)&patching_targ=
et;
+#endif
+
+#ifdef CONFIG_X86_64
+#include <asm/text-patching.h>
+u32 * const patch_site =3D (u32 *)&patching_target;
+#endif
=20
 static inline int lkdtm_do_patch(u32 data)
 {
+#ifdef CONFIG_PPC
 	return patch_instruction(patch_site, ppc_inst(data));
+#endif
+#ifdef CONFIG_X86_64
+	text_poke(patch_site, &data, sizeof(u32));
+	return 0;
+#endif
 }
=20
 static inline u32 lkdtm_read_patch_site(void)
 {
+#ifdef CONFIG_PPC
 	struct ppc_inst inst =3D READ_ONCE(*patch_site);
 	return ppc_inst_val(ppc_inst_read(&inst));
+#endif
+#ifdef CONFIG_X86_64
+	return READ_ONCE(*patch_site);
+#endif
 }
=20
 /* Returns True if the write succeeds */
 static inline bool lkdtm_try_write(u32 data, u32 *addr)
 {
+#ifdef CONFIG_PPC
 	__put_kernel_nofault(addr, &data, u32, err);
 	return true;
=20
 err:
 	return false;
+#endif
+#ifdef CONFIG_X86_64
+	return !__put_user(data, addr);
+#endif
 }
=20
 static int lkdtm_patching_cpu(void *data)
@@ -347,8 +370,8 @@ void lkdtm_HIJACK_PATCH(void)
=20
 void lkdtm_HIJACK_PATCH(void)
 {
-	if (!IS_ENABLED(CONFIG_PPC))
-		pr_err("XFAIL: this test only runs on powerpc\n");
+	if (!IS_ENABLED(CONFIG_PPC) && !IS_ENABLED(CONFIG_X86_64))
+		pr_err("XFAIL: this test only runs on powerpc and x86_64\n");
 	if (!IS_ENABLED(CONFIG_STRICT_KERNEL_RWX))
 		pr_err("XFAIL: this test requires CONFIG_STRICT_KERNEL_RWX\n");
 	if (!IS_BUILTIN(CONFIG_LKDTM))
--=20
2.26.1

