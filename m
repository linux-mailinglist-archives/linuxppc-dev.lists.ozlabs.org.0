Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5675AA1AA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 23:47:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJZQt1bncz3c6r
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 07:47:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PdF4Z3hE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PdF4Z3hE;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJZPR70hxz2xmw
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 07:46:35 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 281LTPb3015061;
	Thu, 1 Sep 2022 21:46:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ivPRXb7MUIgXesDTP+qM9+vzzMajKW58yMhYgJF00cY=;
 b=PdF4Z3hEKBl11+XdMk71Ia0v9GASf5vB8GY3BmGSuqkjCvYK3j5oEGqmEETve2t/F7eY
 5DezE2u8gqwDtesECQXGftxMmKhRqmdgqPmI8cLEX5qNCfVYhyLGiKrz+kmEdO/phk8a
 5eL7t0gqdSClTRm+xkd8fH2MFoCR9MBOFRrGp9gE3dyc+FdJWxzafsKwLVzWiSEvR1rL
 BEZkMVxDRWt5WrJQJveC86BCsVsVoINOot0q1nU5npjUfxJXNzG2ClNbaltUiaapOkT8
 UXb3Chu8b9pcPHGwpUHpOr4Yod9v8/Vd9yVj1CUDiU14Wl1bAP8Ok5ZT+c1xE7Jrqfdu Gw== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jb4pvgh6c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Sep 2022 21:46:23 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
	by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 281LaZcW025668;
	Thu, 1 Sep 2022 21:46:23 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
	by ppma02wdc.us.ibm.com with ESMTP id 3j7aw9uyju-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Sep 2022 21:46:23 +0000
Received: from b03ledav006.gho.boulder.ibm.com (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
	by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 281LkMvh11207388
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 1 Sep 2022 21:46:22 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AC354C6057;
	Thu,  1 Sep 2022 21:46:21 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 07838C6055;
	Thu,  1 Sep 2022 21:46:21 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
	by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
	Thu,  1 Sep 2022 21:46:20 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: kexec@lists.infradead.org, devicetree@vger.kernel.org,
        linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v8 1/4] drivers: of: kexec ima: Support 32-bit platforms
Date: Thu,  1 Sep 2022 17:46:07 -0400
Message-Id: <20220901214610.768645-2-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220901214610.768645-1-stefanb@linux.ibm.com>
References: <20220901214610.768645-1-stefanb@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8_AY4_LUh8XsWeAb8J7UbTW7yPih9Ueh
X-Proofpoint-ORIG-GUID: 8_AY4_LUh8XsWeAb8J7UbTW7yPih9Ueh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-01_12,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 mlxscore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2209010094
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
Cc: Rob Herring <robh@kernel.org>, nayna@linux.ibm.com, Mimi Zohar <zohar@linux.ibm.com>, nasastry@in.ibm.com, Palmer Dabbelt <palmer@rivosinc.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Palmer Dabbelt <palmer@rivosinc.com>

RISC-V recently added kexec_file() support, which uses enables kexec
IMA.  We're the first 32-bit platform to support this, so we found a
build bug.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
---
 drivers/of/kexec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/of/kexec.c b/drivers/of/kexec.c
index e6c01db393f9..548dd5b1b5c1 100644
--- a/drivers/of/kexec.c
+++ b/drivers/of/kexec.c
@@ -250,8 +250,8 @@ static int setup_ima_buffer(const struct kimage *image, void *fdt,
 	if (ret)
 		return -EINVAL;
 
-	pr_debug("IMA buffer at 0x%llx, size = 0x%zx\n",
-		 image->ima_buffer_addr, image->ima_buffer_size);
+	pr_debug("IMA buffer at 0x%pa, size = 0x%zx\n",
+		 &image->ima_buffer_addr, image->ima_buffer_size);
 
 	return 0;
 }
-- 
2.35.1

