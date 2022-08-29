Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9795A42A7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Aug 2022 07:53:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGKPF2JPrz3c6r
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Aug 2022 15:53:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gqiLlBZr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=sv@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gqiLlBZr;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGKNd4gmJz2yxF
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 15:53:04 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27T4rPaq022584;
	Mon, 29 Aug 2022 05:52:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=RQ6bXMYHYnj5dj/RloCzYHO9/+o994XB/xM12MpzG+U=;
 b=gqiLlBZr2JooE8EjkiCszjLn+HpiSSb8FeJ6Z2ASrskyxllbIfdftn0VDj7ovbt977Gh
 0U0ixVYcB0LhaWp4B3rYMpdcpT73yx+nP1C9Y/Yxhn9/LYfDZJcErMIRTiwTyYhs6IcI
 9fCa+3kZ1uuAUXg9vwCIsScZKTvml4QimCCDNPSn4XPsvS7hFpNtVpjO5lP/YVNV4bNk
 zHBIGx53z16vgCeUHGsGkGrwpR6J95T52fTrI3RzbeKagqG6FCuhIssBkksjkCOQaydT
 oQNVijoxJHNDXAl42oJJJgnxd+IQn+0oTOxIbz41pfehHshhxfQGAIFCbwI9COxMB97c sw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3j8pu09a1t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Aug 2022 05:52:47 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27T5RDNu022052;
	Mon, 29 Aug 2022 05:52:47 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3j8pu09a0y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Aug 2022 05:52:46 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27T5pje7007506;
	Mon, 29 Aug 2022 05:52:45 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma03ams.nl.ibm.com with ESMTP id 3j7aw91uyt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Aug 2022 05:52:44 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27T5qgg742009080
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Aug 2022 05:52:42 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6DABD4C044;
	Mon, 29 Aug 2022 05:52:42 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8A5364C040;
	Mon, 29 Aug 2022 05:52:38 +0000 (GMT)
Received: from li-c3569c4c-1ef8-11b2-a85c-ee139cda3133.ibm.com.com (unknown [9.43.67.34])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 29 Aug 2022 05:52:38 +0000 (GMT)
From: Sathvika Vasireddy <sv@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 02/16] powerpc: override __ALIGN() and __ALIGN_STR() macros
Date: Mon, 29 Aug 2022 11:22:09 +0530
Message-Id: <20220829055223.24767-3-sv@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220829055223.24767-1-sv@linux.ibm.com>
References: <20220829055223.24767-1-sv@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: UMmFibJJebpLD1B24Q82BRXflOSQvEon
X-Proofpoint-ORIG-GUID: 4OjaF8CsXE2a9N5wZFJST--63Hqt8ly9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-29_02,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 impostorscore=0 spamscore=0 bulkscore=0 mlxscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2207270000 definitions=main-2208290026
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
Cc: peterz@infradead.org, npiggin@gmail.com, linux-kernel@vger.kernel.org, aik@ozlabs.ru, mingo@redhat.com, sv@linux.ibm.com, rostedt@goodmis.org, jpoimboe@redhat.com, naveen.n.rao@linux.vnet.ibm.com, mbenes@suse.cz, chenzhongjin@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Powerpc instructions must be word-aligned. Currently,
there is an alignment of 16 bytes (by default), and it is
much more than what is required for powerpc (4 bytes).

The default expansion of __ALIGN() macro is:
#define __ALIGN       .align 4,0x90

Since Powerpc Linux does not require a 16 byte alignment,
override __ALIGN() and __ALIGN_STR() macros to use required
4 byte alignment.

Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
---
 arch/powerpc/include/asm/linkage.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/include/asm/linkage.h b/arch/powerpc/include/asm/linkage.h
index b71b9582e754..8df88fe61438 100644
--- a/arch/powerpc/include/asm/linkage.h
+++ b/arch/powerpc/include/asm/linkage.h
@@ -2,8 +2,12 @@
 #ifndef _ASM_POWERPC_LINKAGE_H
 #define _ASM_POWERPC_LINKAGE_H
 
+#include <linux/stringify.h>
 #include <asm/types.h>
 
+#define __ALIGN			.align 2
+#define __ALIGN_STR		__stringify(__ALIGN)
+
 #ifdef CONFIG_PPC64_ELF_ABI_V1
 #define cond_syscall(x) \
 	asm ("\t.weak " #x "\n\t.set " #x ", sys_ni_syscall\n"		\
-- 
2.31.1

