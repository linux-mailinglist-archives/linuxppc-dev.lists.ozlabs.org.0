Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 274455510DD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jun 2022 09:02:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LRLFJ12jpz3cjF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jun 2022 17:02:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dQioFICB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LRLCx4FPTz3bqx
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jun 2022 17:01:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dQioFICB;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4LRLCx45dHz4xZ0
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jun 2022 17:01:33 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4LRLCx4372z4xZZ; Mon, 20 Jun 2022 17:01:33 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dQioFICB;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4LRLCx15xRz4xZ0
	for <linuxppc-dev@ozlabs.org>; Mon, 20 Jun 2022 17:01:32 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25K4xx8U016865;
	Mon, 20 Jun 2022 07:01:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=l2BXL8Ux5CSCQHgi0bRfPfX3/58R+yewBUVWgFr1e/c=;
 b=dQioFICBKBW+yFOnGqFzI7QYPJxFxmiz7d6V9Q/vufkhf8cuYKf82Pmj4gjMcg/lLwCv
 OHzuRzbTprKUTjtrbq/pDdMfUqwfRgQWxCIwTYDsDNyh68QYOGsQjZ1djS1oeIQTF8Fk
 737SRmYElwwfy8nB9XzNGrZO4sg4TF2j3oD5gaJYAkYlzj7YIo89X+jZkQhWOgjBersU
 +o1T86OvpQl6/m3mLGkYW5HROX+XtDAyn1wkTKcBa823ZAxgIZhZH4kkM2UWkvptk5sC
 4lJRIgXx5l0rT7AhVwV62NEa8+JySY2EhY5sJvd775mYI9bxNgo1Wcb8xBuhqVoRyV4w ZQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gsrqt0f4j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jun 2022 07:01:22 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25K6sqQ0002262;
	Mon, 20 Jun 2022 07:01:21 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gsrqt0f3s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jun 2022 07:01:21 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25K6otjX001990;
	Mon, 20 Jun 2022 07:01:20 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma06ams.nl.ibm.com with ESMTP id 3gs5yhj2b8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jun 2022 07:01:20 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25K70ZJI22610290
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 20 Jun 2022 07:00:35 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2F6F0A4057;
	Mon, 20 Jun 2022 07:01:17 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AB0E6A4040;
	Mon, 20 Jun 2022 07:01:14 +0000 (GMT)
Received: from sjain014.ibmuc.com (unknown [9.43.109.136])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 20 Jun 2022 07:01:14 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v5 2/5] powerpc/crash hp: update kimage_arch struct
Date: Mon, 20 Jun 2022 12:31:03 +0530
Message-Id: <20220620070106.93141-3-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220620070106.93141-1-sourabhjain@linux.ibm.com>
References: <20220620070106.93141-1-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: CAoFq7ZhlDrl8F98oeso47NhDCdoUmIh
X-Proofpoint-ORIG-GUID: 8bPl2ogcXGbVDcIwE15e_vwyFgsVRkj1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-20_04,2022-06-17_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 mlxscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206200030
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
Cc: eric.devolder@oracle.com, bhe@redhat.com, mahesh@linux.vnet.ibm.com, kexec@lists.infradead.org, ldufour@linux.ibm.com, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Once the kimage is prepared the only way to identify which kexec segment
holds FDT is by looping through all kexec segments. To avoid this a new
member "fdt_index" is added to kimage_arch struct. The new member holds
the index of FDT segment in the kexec segment array which gives direct
access to FDT segment.

The fdt_index will be populated during kexec load for both kexec_load
and kexec_file_load case.

Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 arch/powerpc/include/asm/kexec.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
index c8040c93b15a..9489e5ca93fb 100644
--- a/arch/powerpc/include/asm/kexec.h
+++ b/arch/powerpc/include/asm/kexec.h
@@ -106,6 +106,9 @@ extern const struct kexec_file_ops kexec_elf64_ops;
 struct kimage_arch {
 	struct crash_mem *exclude_ranges;
 
+#if defined(CONFIG_HOTPLUG_CPU)
+	int fdt_index;
+#endif
 	unsigned long backup_start;
 	void *backup_buf;
 	void *fdt;
-- 
2.36.1

