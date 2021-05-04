Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D7F372498
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 05:05:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZ4T84Qdyz301C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 13:05:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qQrAouoa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=qQrAouoa; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZ4S71p4Gz2xfy
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 May 2021 13:04:06 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14433I0f173759; Mon, 3 May 2021 23:04:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=cgrtNwr82batY/zrHpi8JvxWhhhGQ4hKF+seRmK3CD8=;
 b=qQrAouoa6dKLpTJr7UsScuQyTgQlC1LcIgHKXp3rcLAsP+GzZOhb119hAA86IkMXf6+m
 hhjb1lmIaYFU21z+TZQeuPbI5M09TnNW3QhnHe3DPM0LUWpwDQad4CUVhgrfGFUtdZ1+
 fBDk6U6S0IFNpcmwQbALOHJJ/MksjMR9I7phdwDgCAxkZQQtOgNvRrVAaXSU2liJ+XTH
 L4Dz7pPEeYqpjJSAMxWMhQp/zwFARNd9VN+lUHeWV8QniFRupykkFoxD3xfrFrrts+FR
 Lvt23TFnGBg11ZOqV9Wdd4MWJOn2ZyjFHAv1ILLKUkhRQBf0PfUWQFdsAngRK6qX3beu fA== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38awr509ws-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 May 2021 23:04:02 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 1442va8a016838;
 Tue, 4 May 2021 03:04:01 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma04dal.us.ibm.com with ESMTP id 388xm9q1yr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 May 2021 03:04:01 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 144340Wa34079092
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 4 May 2021 03:04:01 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E4602AC05F;
 Tue,  4 May 2021 03:04:00 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A1DCAAC05E;
 Tue,  4 May 2021 03:04:00 +0000 (GMT)
Received: from localhost (unknown [9.211.126.236])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  4 May 2021 03:04:00 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC 02/10] powerpc/rtas: do not schedule in rtas_os_term()
Date: Mon,  3 May 2021 22:03:50 -0500
Message-Id: <20210504030358.1715034-3-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210504030358.1715034-1-nathanl@linux.ibm.com>
References: <20210504030358.1715034-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: sM8JqZQN5QdI4NZqZsf1shXh5MD220tF
X-Proofpoint-ORIG-GUID: sM8JqZQN5QdI4NZqZsf1shXh5MD220tF
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-04_01:2021-05-03,
 2021-05-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 impostorscore=0 spamscore=0 mlxlogscore=782 priorityscore=1501 bulkscore=0
 mlxscore=0 clxscore=1015 suspectscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2105040023
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
Cc: aik@ozlabs.ru, ajd@linux.ibm.com, tyreld@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

rtas_os_term() is called in the panic path and should immediately
re-call the RTAS ibm,os-term function as long as it returns a busy
status. It's not safe to use rtas_busy_delay() in this context, which
potentially can schedule away. Use rtas_spin_if_busy().

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/kernel/rtas.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 4a1dfbfa51ba..4177f7385ea2 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -960,7 +960,7 @@ void rtas_os_term(char *str)
 	do {
 		status = rtas_call(rtas_token("ibm,os-term"), 1, 1, NULL,
 				   __pa(rtas_os_term_buf));
-	} while (rtas_busy_delay(status));
+	} while (rtas_spin_if_busy(status));
 
 	if (status != 0)
 		printk(KERN_EMERG "ibm,os-term call failed %d\n", status);
-- 
2.30.2

