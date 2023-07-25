Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C217604BD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 03:34:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XWp7JrEJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R902K4D8yz3bX1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 11:34:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XWp7JrEJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8zFy6kM9z309c
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 10:59:50 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36P0DnG3003884
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 00:59:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=igjFpJPSYfm1KViy4nwyJUFsASmMgm/LWHsH4NJ8lL4=;
 b=XWp7JrEJBQ55FnyKfJfwKz1ZaRtUpHFYccogMuqNB1+dBkSTTdJtGl0ioZSov1G54grn
 /ioZIEYbAhbepGBCkV7b/LGgGizbOwqXBVBEN2A0vO4J0xdsOIzDoO/DxsoZ4/3R0Lax
 mjJ7nZzXEfaoFzFhAy/HclmDYIw2PhO4UEAZWwQrFLW9l7+vonmzF03QhCrKJA5qSJEI
 SGYAIhrpxqQWl4gPjLt0kF/u3DYU38rb57oi6R9jfvgwx3XMAYMCgxX7Se7jBEWq1T9/
 d7R3uMP0V+9lLC6KLsbSoY3+HBZJtXN9lQHsm1JmIIctCn9NpCc/mqaA/ZIge28wKkG9 /A== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s21vqjvu4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 00:59:47 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36ONDWQ6002639
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 00:59:46 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3s0txjqk83-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 00:59:46 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36P0xite60359140
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 00:59:44 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6740C20043
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 00:59:44 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DD41F20040
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 00:59:43 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 00:59:43 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 311316038D;
	Tue, 25 Jul 2023 10:59:41 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v1 1/4] Documentation/powerpc: Fix ptrace request names
Date: Tue, 25 Jul 2023 10:58:38 +1000
Message-ID: <20230725005841.28854-2-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230725005841.28854-1-bgray@linux.ibm.com>
References: <20230725005841.28854-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: jBZFFNJ6P0i0XxP_FUcSHiLmuNBk9LOm
X-Proofpoint-GUID: jBZFFNJ6P0i0XxP_FUcSHiLmuNBk9LOm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-24_18,2023-07-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 mlxlogscore=942
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307250003
X-Mailman-Approved-At: Tue, 25 Jul 2023 11:33:14 +1000
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
Cc: Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The documented ptrace request names are currently wrong/incomplete.
Fix this to improve correctness and searchability.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 Documentation/powerpc/ptrace.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/powerpc/ptrace.rst b/Documentation/powerpc/ptrace.rst
index 77725d69eb4a..5629edf4d56e 100644
--- a/Documentation/powerpc/ptrace.rst
+++ b/Documentation/powerpc/ptrace.rst
@@ -15,7 +15,7 @@ that's extendable and that covers both BookE and server processors, so
 that GDB doesn't need to special-case each of them. We added the
 following 3 new ptrace requests.
 
-1. PTRACE_PPC_GETHWDEBUGINFO
+1. PPC_PTRACE_GETHWDBGINFO
 ============================
 
 Query for GDB to discover the hardware debug features. The main info to
@@ -48,7 +48,7 @@ features will have bits indicating whether there is support for::
   #define PPC_DEBUG_FEATURE_DATA_BP_DAWR		0x10
   #define PPC_DEBUG_FEATURE_DATA_BP_ARCH_31		0x20
 
-2. PTRACE_SETHWDEBUG
+2. PPC_PTRACE_SETHWDEBUG
 
 Sets a hardware breakpoint or watchpoint, according to the provided structure::
 
@@ -88,7 +88,7 @@ that the BookE supports. COMEFROM breakpoints available in server processors
 are not contemplated, but that is out of the scope of this work.
 
 ptrace will return an integer (handle) uniquely identifying the breakpoint or
-watchpoint just created. This integer will be used in the PTRACE_DELHWDEBUG
+watchpoint just created. This integer will be used in the PPC_PTRACE_DELHWDEBUG
 request to ask for its removal. Return -ENOSPC if the requested breakpoint
 can't be allocated on the registers.
 
@@ -150,7 +150,7 @@ Some examples of using the structure to:
     p.addr2           = (uint64_t) end_range;
     p.condition_value = 0;
 
-3. PTRACE_DELHWDEBUG
+3. PPC_PTRACE_DELHWDEBUG
 
 Takes an integer which identifies an existing breakpoint or watchpoint
 (i.e., the value returned from PTRACE_SETHWDEBUG), and deletes the
-- 
2.41.0

