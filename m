Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E1B511453
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Apr 2022 11:38:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KpDFQ0Wmsz30FR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Apr 2022 19:38:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GBc/Ffkp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=GBc/Ffkp; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KpDCv64nXz2xsc
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Apr 2022 19:36:43 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23R6VCDW018516;
 Wed, 27 Apr 2022 09:36:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=wOYOBQTDmKHJ9iGvYwffbRu0unw8UKjjQnVlXqJp8/k=;
 b=GBc/FfkpBdOM3LQFUOi1wVsV0l4bv8W8SdM9yVhLNGff5q1JxYkZVoCPRa2lXQW/LTDF
 XDKc2/QrVVJEd2s7Z2PLBxPG/QigC1NWCgObvSx+e3xJXqURCI9fBWNfHZocG2u1q5JZ
 XC2wTxwHW1rrADXvcPwTR3l01h2JqaEA9Pt0LzPSbOgTDRU09aF0RsSsE8KdhLOjyUAH
 H1/wgSrcDIUMmi7oUtCvdaXiFEVp2HaDKX74Ez0jcwYEsn2ga8qo7En+/sqPH99tKelH
 Ac6s51b0pXOT7nqIoUO4bdW5Tqyh5aRco0jZnVJICiu6OuyoXjiL5j4MVXKBaJVHCFt/ xQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fpvpgevs1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Apr 2022 09:36:25 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 23R9NYYL011352;
 Wed, 27 Apr 2022 09:36:24 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fpvpgevr4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Apr 2022 09:36:24 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23R9SceU002254;
 Wed, 27 Apr 2022 09:36:22 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06fra.de.ibm.com with ESMTP id 3fm8qhmg34-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Apr 2022 09:36:22 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23R9aJYv31785448
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Apr 2022 09:36:19 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7ADC04C044;
 Wed, 27 Apr 2022 09:36:19 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 454574C040;
 Wed, 27 Apr 2022 09:36:17 +0000 (GMT)
Received: from li-NotSettable.ibm.com.com (unknown [9.43.116.196])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 27 Apr 2022 09:36:16 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH 0/2] ftrace/recordmcount: Handle object files without section
 symbols
Date: Wed, 27 Apr 2022 15:01:20 +0530
Message-Id: <cover.1651047542.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.27.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 0I5l914qw2sjcEy8vcTwnFx6QDGpb4Lt
X-Proofpoint-ORIG-GUID: ZqHIazna3rCWKJ56c0qlH5HWZkmHM3oS
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-27_03,2022-04-26_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 phishscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 spamscore=0 adultscore=0 clxscore=1011 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204270063
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
Cc: Nathan Chancellor <nathan@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This solves a build issue on powerpc with binutils v2.36 and newer [1].
Since commit d1bcae833b32f1 ("ELF: Don't generate unused section
symbols") [2], binutils started dropping section symbols that it thought
were unused. Due to this, in certain scenarios, recordmcount is unable 
to find a non-weak symbol to generate a relocation record against.

Clang integrated assembler is also aggressive in dropping section 
symbols [3].

In the past, there have been various workarounds to address this. See 
commits 55d5b7dd6451b5 ("initramfs: fix clang build failure") and 
6e7b64b9dd6d96 ("elfcore: fix building with clang") and a recent patch:
https://lore.kernel.org/linuxppc-dev/20220425174128.11455-1-naveen.n.rao@linux.vnet.ibm.com/T/#u

Fix this issue by using the weak symbol in the relocation record. This 
can result in duplicate locations in the mcount table if those weak 
functions are overridden, so have ftrace skip dupicate entries.

Objtool already follows this approach, so patch 2 updates recordmcount 
to do the same. Patch 1 updates ftrace to skip duplicate entries.

- Naveen


[1] https://github.com/linuxppc/issues/issues/388
[2] https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=d1bcae833b32f1
[3] https://github.com/ClangBuiltLinux/linux/issues/981


Naveen N. Rao (2):
  ftrace: Drop duplicate mcount locations
  recordmcount: Handle sections with no non-weak symbols

 kernel/trace/ftrace.c  | 13 ++++++-
 scripts/recordmcount.h | 86 +++++++++++++++++++++++++++++++++++-------
 2 files changed, 85 insertions(+), 14 deletions(-)


base-commit: 83d8a0d166119de813cad27ae7d61f54f9aea707
-- 
2.35.1

