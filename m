Return-Path: <linuxppc-dev+bounces-17405-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BYlOezRoWlFwgQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17405-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 18:18:36 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 796A71BB577
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 18:18:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMw5b4D7Bz2xYw;
	Sat, 28 Feb 2026 04:18:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772212707;
	cv=none; b=MUXJ0P+ZJ/AnD4z9BWdVkcJn7Yd3q15EdiE6U5giNnAcsZdjxW2raUnCBiM7kuca8jhG3t2YyX+n1DfTnbd1mzW/1JzsL5F6mulL1J0eLp/zK09/UCmSoa5BGBgpZCwqPgeeXyg2hgrpn6ul4LzdE09tR6lrym+4zdMtmIbKe2I0OYYvGejUMwiA37itLTxx3QsFoJwG/AnWuAxk/K1PqvxBu9XOguKYIjTVXl5nPB84jZg63fIYn1wnQ0vtbSZm6Y9FtonNODi4G3A7HcnQDyK4kN8R4WqU22ZLLMi2ylIlJgxDCopJNvF32BhdBo9ZcQ2Ok5U+I389H/r75+0AMw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772212707; c=relaxed/relaxed;
	bh=6gheSBiXkF87syMd72xi8Q8Bw/02uMWT3yhhBB3eeBo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QW79d1kvHZtWxoCxok6EjgbVB87w2f1b0y0Hn5To6KSkcxWV5N52U7Tpz9t9RH35u7z9DzKicYVIwgmBWd1FT9O/UpGStJiSRyBy2oXQ1qTEXpfPyPWz9dMUPFy3ry1KPBlrOc1myqaC/G5WScpThvetlX3gpFEVV1zsDoGkkGieGYHMoyza5WeE4uAc2+9M5p1ixioSvQw5ily2XLxjrnx9ZJ9HCjUWanusSGtHw/HLb5KoX1LN0Mr8gFJGUEvJ61pCInDi6JqwpJcbCAz3DCD+Vcw4Vp8Cq/ZWX/uWm8VFXJEoRNM5z2CpidUbVLtwdc13ZuyM1+qWif0AxeujvA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=O2nWbXQW; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=O2nWbXQW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMw5Z4cqmz2xLv
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Feb 2026 04:18:25 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61RBKTCc3315819;
	Fri, 27 Feb 2026 17:18:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=6gheSBiXkF87syMd72xi8Q8Bw/02uMWT3yhhBB3ee
	Bo=; b=O2nWbXQWe89MzVrnKmLWuTmmvhxlRHr1Et84htY/94FJYwQlrVPlrk5bM
	lqD/fY+MqjxuCuJiI5ARVnM1EXmp2MzGQzqF+Rzjb1vjZu39K/Jp+R0KutwJ3fEl
	fEvksCZ44fmUfukUZkDc8qUIcsBeM5N0PJCYbqoxjABeGlWt104ZglGFil2jMWdc
	syuAzQH8YIbQqfRvUDFI9XwYsDw0Tj8fsEabQXuxd3pF8Ar2308+adouJdXHH1Vp
	xAPsn5exQ/RU79rTlJsI7hL77TmYmeW5AAa/9i2g7NRhYb3UY0Di16MuNOpWF7aE
	X8Bf8W7bpJMzo0TQT3jxT3P5CLnfg==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cf472dxdh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Feb 2026 17:18:16 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61RE3g6a013478;
	Fri, 27 Feb 2026 17:18:15 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4cfqdykcdj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Feb 2026 17:18:15 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61RHIBIC45416802
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Feb 2026 17:18:11 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9BA6E20043;
	Fri, 27 Feb 2026 17:18:11 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2A0DB20040;
	Fri, 27 Feb 2026 17:18:09 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.com (unknown [9.124.211.61])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 27 Feb 2026 17:18:08 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Shivang Upadhyay <shivangu@linux.ibm.com>,
        Hari Bathini <hbathini@linux.ibm.com>
Subject: [PATCH v2] powerpc/crash: adjust the elfcorehdr size
Date: Fri, 27 Feb 2026 22:48:01 +0530
Message-ID: <20260227171801.2238847-1-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
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
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: vb0glSvIQq_fx56LDI29Y8W1uIye6zG5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDE1MyBTYWx0ZWRfX/RIKudOjnRAl
 ZY74qb5LEOjVmi3/lVIGo499wezef9b9Wlr+HMcp1yD0amMIB+dfDUxAk+k+oShjFVzeXnWgSvc
 fTuhYuxJWEPjw0lQ2bdLPSdItWQ1jPetz878W5RiIKN1UqyeozrayUvam9Unos4c2wuTFuXkW4S
 xFm8OpCQ3HdudRCeov8XnFsSBfof2jD//7h4fTCL+wfBL/dnyrHH4IlpiL8aqMbKCMQwNFprQmo
 r3vD/PxUIvIMZxaAHqySXmcBVxaSkvR1g781rZ4/oW1DiYJK+GgWGuAbzI+beLCbpZE1H989y1n
 nHLH50hobgg0cDYjJPEluBaXtPSW9OQe8Vysy5StEUbP4sC7Y+4cBsjbXnOhCmo/iYoA/pXFx2I
 EVmM2/KFQB0GLsOefK53Joz7iId5wCMrvAtRxBZCbYXXiAhy4j9SuKfppcymZ5uuv8VNAal+mwt
 EKeDAfcFQTwEYG8HNkw==
X-Authority-Analysis: v=2.4 cv=R7wO2NRX c=1 sm=1 tr=0 ts=69a1d1d9 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=pGLkceISAAAA:8
 a=vcnXBeTVwP-GbbQqWxsA:9
X-Proofpoint-GUID: pWkyJmDoXMZidsslkPHR4d9oQUhqzm5M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_03,2026-02-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602270153
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17405-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[linux.ibm.com,ellerman.id.au,gmail.com];
	DKIM_TRACE(0.00)[ibm.com:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ellerman.id.au:email];
	FROM_NEQ_ENVFROM(0.00)[sourabhjain@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 796A71BB577
X-Rspamd-Action: no action

With crash hotplug support enabled, additional memory is allocated to
the elfcorehdr kexec segment to accommodate resources added during
memory hotplug events. However, the kdump FDT is not updated with the
same size, which can result in elfcorehdr corruption in the kdump
kernel.

Update elf_headers_sz (the kimage member representing the size of the
elfcorehdr kexec segment) to reflect the total memory allocated for the
elfcorehdr segment instead of the elfcorehdr buffer size at the time of
kdump load. This allows of_kexec_alloc_and_setup_fdt() to reserve the
full elfcorehdr memory in the kdump FDT and prevents elfcorehdr
corruption.

Fixes: 849599b702ef8 ("powerpc/crash: add crash memory hotplug support")
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Cc: Shivang Upadhyay <shivangu@linux.ibm.com>
Reviewed-by: Hari Bathini <hbathini@linux.ibm.com>
Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
Changelog:

v1:
https://lore.kernel.org/all/20260218050105.391285-1-sourabhjain@linux.ibm.com/

v2:
 - Add a comment explaining why elf_headers_sz is initialized
   with memsz instead of headers_sz.
---
 arch/powerpc/kexec/file_load_64.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index e7ef8b2a2554..5f6d50e4c3d4 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -450,6 +450,11 @@ static int load_elfcorehdr_segment(struct kimage *image, struct kexec_buf *kbuf)
 	kbuf->buffer = headers;
 	kbuf->mem = KEXEC_BUF_MEM_UNKNOWN;
 	kbuf->bufsz = headers_sz;
+
+	/*
+	 * Account for extra space required to accommodate additional memory
+	 * ranges in elfcorehdr due to memory hotplug events.
+	 */
 	kbuf->memsz = headers_sz + kdump_extra_elfcorehdr_size(cmem);
 	kbuf->top_down = false;
 
@@ -460,7 +465,14 @@ static int load_elfcorehdr_segment(struct kimage *image, struct kexec_buf *kbuf)
 	}
 
 	image->elf_load_addr = kbuf->mem;
-	image->elf_headers_sz = headers_sz;
+
+	/*
+	 * If CONFIG_CRASH_HOTPLUG is enabled, the elfcorehdr kexec segment
+	 * memsz can be larger than bufsz. Always initialize elf_headers_sz
+	 * with memsz. This ensures the correct size is reserved for elfcorehdr
+	 * memory in the FDT prepared for kdump.
+	 */
+	image->elf_headers_sz = kbuf->memsz;
 	image->elf_headers = headers;
 out:
 	kfree(cmem);
-- 
2.52.0


