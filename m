Return-Path: <linuxppc-dev+bounces-17127-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MXjA8IFnmmhTAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17127-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Feb 2026 21:10:42 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2764218C4DB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Feb 2026 21:10:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fL83M1Y0jz3dHc;
	Wed, 25 Feb 2026 07:10:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771963823;
	cv=none; b=hGX0MaL8HyUVSDqtMVpPWyU+MykCGQkMQAuToMPkzpdJXRC54RjvYsJ/xkuEvJROxxv9FwkMH2suuP6AmCkOFHlyO8mX6PHiDDUXIVQRjIf9jtgK4icf3J9Q3uMc66K2UgJbfG+HHBVWFgxTDyH0dXgORKeRVAeIqzbksde30Kuqo0zZ1YQ5Gnp6jrzF3RpRm6gjAqxFPBVKgT9/Q/5b39tPhhlafOMCF4LC9B9I8aCYTSN+74DPbaMooxk7bWu2U5arXixnbQsYeLCwDPFiSgKKs5LbrOEzr24P9q/WSNA9iArlEFPQY2fKomYkVa0xK+ysomLFHmO3TJtNhmb+/g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771963823; c=relaxed/relaxed;
	bh=tcsQQAWxA3aNGBdZqI58IE+fXC4naEzp2MFfxjUJ08s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EacraWpWefS8f1qG7WJNrDukcjftIZ9jbl1LFH5E+URye2MMIesTpb0Fn+n+GBYRwoLVmhW9kGuhJCoGZoyaF+BCkjBqODewZZpsv3VmINJ60LNFJfpp+jpYT18GJoRNpmp+x0vtPa/i3HGCvZUyIunhQ6D1R3GlkLv0EoLo7ShsCz5zlo8cR4M9pac4b3deCGuCzqTHDSp4NoGyeildSjrbY4G5XfXRvMeaLOb+T02CL6r4rJoJYqV6Xr/DduBC0NvAVloBBVa9jzVvCK9bPgOlBEwcXTU8/P2MWmTM6MEIMdw1rVK1hYHfkHnM6BZd8D4IdxYH3UvieS1ee594+g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Rif28DY+; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Rif28DY+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fL83L3R7Rz3cbt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 07:10:22 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OAsAp32654887;
	Tue, 24 Feb 2026 20:10:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=tcsQQAWxA3aNGBdZq
	I58IE+fXC4naEzp2MFfxjUJ08s=; b=Rif28DY+Wtl4T8rihgrK7cUnzA0eOxR83
	vCwZ0XnSwPN9sfUIPoxUwXDgqucnB7rxQJEbnKHpiNmUUl11n9ZDM6+PcDxXaEps
	iDnawRIPIac3D9Iyz1KOYun0kkjeuW3ad8IzFCkTXy9sGTaMzDz6cafxrOhDwQfr
	gv3I8Obrn6nlKX4fOqSt/Z1BLgztsE44JRq+2majozE961XS0wn6MLwecC2t7+jp
	cLkuzXpSPuqxZga3Uj/iDvenwVn75eGfb9MqNF1iOf5joMXdSdIz4aRym/n8BLZk
	GKMD8KUQ8KyJ5+uhaN0UVjgE2NvnfXBI8uc/SQ64ZycPSbP+AMyDw==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cf4cqwbq1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Feb 2026 20:10:06 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61OGUrDc013478;
	Tue, 24 Feb 2026 20:10:05 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4cfqdy2je5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Feb 2026 20:10:05 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61OKA1je33947904
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Feb 2026 20:10:01 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 62CB620043;
	Tue, 24 Feb 2026 20:10:01 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CE83B20040;
	Tue, 24 Feb 2026 20:09:59 +0000 (GMT)
Received: from ltcrain4-lp15.ltc.tadn.ibm.com (unknown [9.5.7.39])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 24 Feb 2026 20:09:59 +0000 (GMT)
From: adubey@linux.ibm.com
To: linuxppc-dev@lists.ozlabs.org
Cc: bpf@vger.kernel.org, hbathini@linux.ibm.com, ast@kernel.org,
        daniel@iogearbox.net, andrii@kernel.org, maddy@linux.ibm.com,
        Abhishek Dubey <adubey@linux.ibm.com>
Subject: [PATCH 4/4] selftest/bpf: Enable gotox tests for powerpc64
Date: Tue, 24 Feb 2026 20:09:32 -0500
Message-ID: <20260225010950.20218-5-adubey@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260225010950.20218-1-adubey@linux.ibm.com>
References: <20260225010950.20218-1-adubey@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 96_P54RKxdpNo7PPm1Cfdo1pp4Neh5xi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDE3MyBTYWx0ZWRfX38YKUJMml4HA
 ZlnbBK4U2mZPhBel4vRI5a6tjbOKRJUBanPAbTNvx7iJftU/aryZOTDGxY94UXeMTlUtSSDms9e
 cf/GnLuE9XAZ9ob4QIuLa488mo1a8orQyQSGxYzYrOE/KS8kspa2gfOie2WgvSx4Uj1J9FzM+VR
 V2jjJizaNus61jZlB6quQ0hrYt52tvpRCeTRTZT4NXAMLluSSX2zsANteB1k8arJM6DJnJixIpe
 u9CnKC7W5QQmNZnwA6CT1RbhGgsGZmFZbvdGmo4dJ72XtHjiVS3GsUkMB/qf+LLxD3tYP8voiug
 PNPt6g2MzR2OCKY+pZs2OWgR0ZStIvHbRtJMBcLzA6cQhB5sjZU9vdnnCA3iRQ8IUx6QUfdRpdz
 N9RVUhDww9bNlHZbXKzXQ7grIB/cUSuPnCGbW7qfhaPeGkcWhBP02nYsZhJ0c0aToIBq81EOCWX
 rCV3fko5T1WCaAwmA4A==
X-Proofpoint-GUID: 96_P54RKxdpNo7PPm1Cfdo1pp4Neh5xi
X-Authority-Analysis: v=2.4 cv=bbBmkePB c=1 sm=1 tr=0 ts=699e059e cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VnNF1IyMAAAA:8 a=XIkr_taID0MGvadLvJ0A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_02,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602240173
X-Spam-Status: No, score=1.7 required=3.0 tests=DATE_IN_FUTURE_03_06,
	DKIM_SIGNED,DKIM_VALID,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.29 / 15.00];
	DATE_IN_FUTURE(4.00)[4];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17127-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ibm.com:+];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FROM_NO_DN(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid];
	FROM_NEQ_ENVFROM(0.00)[adubey@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 2764218C4DB
X-Rspamd-Action: no action

From: Abhishek Dubey <adubey@linux.ibm.com>

With gotox instruction and jumptable now supported,
enable corresponding bpf selftest on powerpc.

Signed-off-by: Abhishek Dubey <adubey@linux.ibm.com>
---
 tools/testing/selftests/bpf/progs/verifier_gotox.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/progs/verifier_gotox.c b/tools/testing/selftests/bpf/progs/verifier_gotox.c
index 607dad058ca1..c1e5b8529add 100644
--- a/tools/testing/selftests/bpf/progs/verifier_gotox.c
+++ b/tools/testing/selftests/bpf/progs/verifier_gotox.c
@@ -6,7 +6,7 @@
 #include "bpf_misc.h"
 #include "../../../include/linux/filter.h"
 
-#if defined(__TARGET_ARCH_x86) || defined(__TARGET_ARCH_arm64)
+#if defined(__TARGET_ARCH_x86) || defined(__TARGET_ARCH_arm64) || defined(__TARGET_ARCH_powerpc)
 
 #define DEFINE_SIMPLE_JUMP_TABLE_PROG(NAME, SRC_REG, OFF, IMM, OUTCOME)	\
 									\
-- 
2.52.0


