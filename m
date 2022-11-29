Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCAA63B933
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 05:50:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NLqf45zswz3fC6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 15:50:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oCoXxXgP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oCoXxXgP;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NLqW42NmLz3cMv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Nov 2022 15:44:32 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AT2bFbe012194;
	Tue, 29 Nov 2022 04:44:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=H5CQ1KB1lxLnncLzoU/Lvd/3ISgz1+DTntjHohyegPA=;
 b=oCoXxXgPcydztqv4SgFd77fClzGVTTzkVVzu1kfKha9dxq/aJLBsgySQM853xmMgekRc
 nz2NCBtuZPor2b1A2S0ks7sw/1kFc9I8IXFVGUMzdAsZAZUkSLOywuqrSSyVzH4hHU3k
 1y9AE57Iz68yBOKD7PGQJ4TDnH5VTlW6o+w422akP5ow0EIjj6VGT5kNKhBxfWbsfTN8
 GmfgZOIFEWsPdlrcJsn12uir2EmwCy8q5ctQWjTDKluUmdoOjEW636w/UDz0PImIfxu3
 z9PwWGyd7PRuDGEYYOAz8kJZc0f1wTiXWhWDwEehl2st6xKAIGIL38ZoInwWd2L8LwDt LQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m5303k8v9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Nov 2022 04:44:28 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AT4dHxi014229;
	Tue, 29 Nov 2022 04:44:28 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m5303k8uw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Nov 2022 04:44:27 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AT4b1rB025017;
	Tue, 29 Nov 2022 04:44:25 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma03ams.nl.ibm.com with ESMTP id 3m3ae9bf9m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Nov 2022 04:44:25 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AT4iNgZ39780778
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Nov 2022 04:44:23 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 653BE5204E;
	Tue, 29 Nov 2022 04:44:23 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 0E81652051;
	Tue, 29 Nov 2022 04:44:23 +0000 (GMT)
Received: from civic.. (unknown [9.177.66.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id CBC72600A5;
	Tue, 29 Nov 2022 15:44:19 +1100 (AEDT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 7/7] powerpc/64: Sanitise user registers on interrupt in pseries, POWERNV
Date: Tue, 29 Nov 2022 15:43:54 +1100
Message-Id: <20221129044354.1836018-7-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221129044354.1836018-1-rmclure@linux.ibm.com>
References: <20221129044354.1836018-1-rmclure@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: QLUlrXpt5neJRMZoRJSjltxBIT1ShBVM
X-Proofpoint-GUID: fXJ72A2pANCa822GukRTobYU3mCuSZmx
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-29_03,2022-11-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 impostorscore=0 phishscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=563 mlxscore=0 adultscore=0
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211290029
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
Cc: Rohan McLure <rmclure@linux.ibm.com>, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Cause pseries and POWERNV platforms to default to zeroising all potentially
user-defined registers when entering the kernel by means of any interrupt
source, reducing user-influence of the kernel and the likelihood or
producing speculation gadgets.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
Resubmitting patches as their own series after v6 partially merged:
Link: https://lore.kernel.org/all/166488988686.779920.13794870102696416283.b4-ty@ellerman.id.au/t/
v4: Default on POWERNV as well.
---
 arch/powerpc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 280c797e0f30..2ab114a02f62 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -534,7 +534,7 @@ config HOTPLUG_CPU
 config INTERRUPT_SANITIZE_REGISTERS
 	bool "Clear gprs on interrupt arrival"
 	depends on PPC64 && ARCH_HAS_SYSCALL_WRAPPER
-	default PPC_BOOK3E_64
+	default PPC_BOOK3E_64 || PPC_PSERIES || PPC_POWERNV
 	help
 	  Reduce the influence of user register state on interrupt handlers and
 	  syscalls through clearing user state from registers before handling
-- 
2.37.2

