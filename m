Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D49F74D8FD9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Mar 2022 23:49:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KHWvN5Kbpz3bbF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Mar 2022 09:49:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iqP/rZww;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KHWs63Bd4z2xTp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Mar 2022 09:47:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=iqP/rZww; dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KHWs62n41z4xvf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Mar 2022 09:47:54 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4KHWs62jhpz4xLS; Tue, 15 Mar 2022 09:47:54 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=iqP/rZww; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4KHWs60TYGz4xvf
 for <linuxppc-dev@ozlabs.org>; Tue, 15 Mar 2022 09:47:53 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22EJlW3X022051; 
 Mon, 14 Mar 2022 22:47:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=asWui9FZsbgfIWqexuAf9gbBRQOWYbdSFutOQ/HcCng=;
 b=iqP/rZwwaBoFWME+XF8ACNVvTSL8d5oOFqbcpHKXpkYv+ebNLiK4dIV3ppH7VI/0+jJX
 /K0qYkJyse/bQOw0K5H2O90sR4wP659WHAvaEj2BCTmOIIrH4hT8GkkjbTh8tPIPbEPF
 xAH57YqckbK7KmktrfkgqXt1iQzrbPh6ndjU9iZqrQOwjttTsIzPX4xYZ9w3hOCcGGxw
 G1YD/YZhCDI/Wug7pnUL6M+KvdGxzQ7nId8/8Fu6eblgGsdpKvMimM7QO0EQBObGfyMZ
 NCXFYXVMbeJ0K89RUDB9GtLqVVsHWhIKzapeOTbquSZR2UYGalItmUD3JAiAgwsFfjpW gw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3et6a73s7k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 22:47:47 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22EMlk4w008119;
 Mon, 14 Mar 2022 22:47:46 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3et6a73s70-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 22:47:46 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22EMliBf005158;
 Mon, 14 Mar 2022 22:47:44 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 3erjshn5kv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 22:47:44 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22EMlfnn33554758
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Mar 2022 22:47:42 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8DAC7420D8;
 Mon, 14 Mar 2022 22:47:41 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 74F3042091;
 Mon, 14 Mar 2022 22:47:39 +0000 (GMT)
Received: from sjain014.ibmuc.com (unknown [9.43.126.2])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 14 Mar 2022 22:47:39 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, mpe@ellerman.id.au
Subject: [RFC v2 PATCH 3/5] powrepc/crash hp: update kimage struct
Date: Tue, 15 Mar 2022 04:17:26 +0530
Message-Id: <20220314224728.79990-4-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220314224728.79990-1-sourabhjain@linux.ibm.com>
References: <20220314224728.79990-1-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: LgwzPeekH-qeG1F9fhnva2j1qjzpLOD5
X-Proofpoint-ORIG-GUID: FIdZrCe1tQDj8PgtIz9HH_CxCYZq3wGo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-14_14,2022-03-14_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 malwarescore=0 phishscore=0 bulkscore=0 mlxscore=0 adultscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203140128
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
Cc: mahesh@linux.vnet.ibm.com, eric.devolder@oracle.com,
 kexec@lists.infradead.org, bhe@redhat.com, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Two new members fdt_index and fdt_index_valid are added in kimage struct
to track the FDT kexec segment. These new members of kimage struct will
help the crash hotplug handler to easily access the FDT segment from the
kexec segment array. Otherwise, we have to loop through all kexec segments
to find the FDT segments.

Note: It is possible that we might need to update multiple kexec segments
for a hotplug event then tracking each segment with an individual variable
in kimage struct is not efficient. How about an array to track all the
hotplug kexec segments?

struct hp_segment{
	int index;
	bool is_valid;
}

Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 include/linux/kexec.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/kexec.h b/include/linux/kexec.h
index e00c373c4095..e9038f2c75ee 100644
--- a/include/linux/kexec.h
+++ b/include/linux/kexec.h
@@ -306,6 +306,8 @@ struct kimage {
 	int offlinecpu;
 	bool elf_index_valid;
 	int elf_index;
+	int fdt_index;
+	bool fdt_index_valid;
 #endif
 #endif
 
-- 
2.35.1

