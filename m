Return-Path: <linuxppc-dev+bounces-5740-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F285A23D33
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2025 12:39:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ykv6z5Zfgz30Vd;
	Fri, 31 Jan 2025 22:39:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738323547;
	cv=none; b=aFDUpa1q7mjzONzVlL+k+b+wUIxT0XFlKlsw/VkCP2dUx7KlbKfPfSxquZS+ljd46X/O8jj/DkDkSMRqGumYwt2hWmbqVsJJMDNV6rj88NBAmKzOken9Ngf9x3EHEt8jbI2uE59d2zboYo8aX0NHectqG2UpvzAcYpw9yJEsvXlbNO0llQRUc40yAwLCYA9eptZ9riT64K+3mLtVfZ3TwF+B/GXL6qAmwqL9VrUsqgw10U/Lj88ziMw36iM5HGn8ZitJ9CBf0ViCfBcU6zL2s7VAZ//Pfv1YLcCHkpAZSFtDoZjePc7JJ+f3Lr5an6O7HKVlhSwJO1IMnDQRM3eaYg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738323547; c=relaxed/relaxed;
	bh=sRPw8EikbB6hNm82Kwvptzvv0MyQS1J/WqpM4E2FbYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PMbQhAommnvK3USwAn7YhuDEZE+Wr0YGuJr90mFmFKknwO+oGxYZdtnR3NN1p4AIb9ltz4k8bCgR6gronkAxthPmquDEFkWvmmvyIZyBJddKI8Z6VG+LqUfix8sN5kXeAfpBSGKBibvNk/fquYWJdamjZ3Y3XnXhB/xKs0grVioxmPRP0i/vsZCPfBcIim4IJAeto2K9/6Ops2M/hSblfELmNQYTabKwmNMkUy6M4YSNXMQc/+VYDX26fDeBUJIwo0zm6wwykB65riVar4ig6icMnZIBOyy1Jb4O77VH+v55lzu/7YmvF3kOmGmdUFLgChVpIFMaTQ/zJ9wrGtQbpg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SF2XRTvB; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SF2XRTvB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ykv6x2GKRz30MM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jan 2025 22:39:04 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50V2OZ3j030769;
	Fri, 31 Jan 2025 11:38:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=sRPw8EikbB6hNm82K
	wvptzvv0MyQS1J/WqpM4E2FbYQ=; b=SF2XRTvBQrACH84/+sKr9pjKsxR4gWyeW
	JRavQ1iLeDVaFSIEgerJpVToqSfyiirlJqw+3f0Xj6iSR2NbLPcaWA6dH5nYdwvF
	xReUPV6iO8sKwpIL6nzvCRxWdp9jhjYarKJV4IYR+mIYInBoMeFz1xnqoXFgxNEQ
	kX8UGKmY/5O/+pTeHYKewdMAymAFTp5n1dr2Z5SvaywnZ+U5E+CvlKQz5nnlDCB7
	Z4tEvAs9QM+gcjyq96xGm7WeizBolrWl9eky6zvQbnzwTLe820U0oLzPahTMItO2
	4Peo3nWgOpr8MgTsSkXzDPufGqXSZvPjsmnI3fio13sm+kX/7MFaQ==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44gfn5ba8v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Jan 2025 11:38:51 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50V8Ejtn013896;
	Fri, 31 Jan 2025 11:38:50 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 44gf93bb2v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Jan 2025 11:38:50 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50VBckI960424624
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Jan 2025 11:38:47 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D4B80200FD;
	Fri, 31 Jan 2025 11:38:46 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 38C50200F9;
	Fri, 31 Jan 2025 11:38:43 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.com (unknown [9.43.16.21])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 31 Jan 2025 11:38:42 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>, kexec@lists.infradead.org,
        linux-kernel@vger.kernel.org, Hari Bathini <hbathini@linux.ibm.com>,
        Baoquan He <bhe@redhat.com>
Subject: [PATCH v3 1/7] kexec: Initialize ELF lowest address to ULONG_MAX
Date: Fri, 31 Jan 2025 17:08:24 +0530
Message-ID: <20250131113830.925179-2-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250131113830.925179-1-sourabhjain@linux.ibm.com>
References: <20250131113830.925179-1-sourabhjain@linux.ibm.com>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ieB63_zMsBoY1bOPmlpBdsX9Y-n-S2AS
X-Proofpoint-GUID: ieB63_zMsBoY1bOPmlpBdsX9Y-n-S2AS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_04,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 mlxscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 adultscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2501310087
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

kexec_elf_load() loads an ELF executable and sets the address of the
lowest PT_LOAD section to the address held by the lowest_load_addr
function argument.

To determine the lowest PT_LOAD address, a local variable lowest_addr
(type unsigned long) is initialized to UINT_MAX. After loading each
PT_LOAD, its address is compared to lowest_addr. If a loaded PT_LOAD
address is lower, lowest_addr is updated. However, setting lowest_addr
to UINT_MAX won't work when the kernel image is loaded above 4G, as the
returned lowest PT_LOAD address would be invalid. This is resolved by
initializing lowest_addr to ULONG_MAX instead.

This issue was discovered while implementing crashkernel high/low
reservation on the PowerPC architecture.

Fixes: a0458284f062 ("powerpc: Add support code for kexec_file_load()")
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: kexec@lists.infradead.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org
Acked-by: Hari Bathini <hbathini@linux.ibm.com>
Acked-by: Baoquan He <bhe@redhat.com>
Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 kernel/kexec_elf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/kexec_elf.c b/kernel/kexec_elf.c
index d3689632e8b9..3a5c25b2adc9 100644
--- a/kernel/kexec_elf.c
+++ b/kernel/kexec_elf.c
@@ -390,7 +390,7 @@ int kexec_elf_load(struct kimage *image, struct elfhdr *ehdr,
 			 struct kexec_buf *kbuf,
 			 unsigned long *lowest_load_addr)
 {
-	unsigned long lowest_addr = UINT_MAX;
+	unsigned long lowest_addr = ULONG_MAX;
 	int ret;
 	size_t i;
 
-- 
2.48.1


