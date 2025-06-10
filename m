Return-Path: <linuxppc-dev+bounces-9233-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E3910AD2BD5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jun 2025 04:13:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bGXPg4qC7z307K;
	Tue, 10 Jun 2025 12:12:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749521575;
	cv=none; b=O3BVQY51AaG6E+xB5TMhDiiVkUr5Dbo0rtSXu2Rb5FPeXKHGVig8FFwjNulbeNHAWDZENNWn2EbVDLqCWH0BLbDBOQHNNEX7X6utZa6trza5NUn6w32Kf+ROLTWzWCp+loA/iBUj8zziMHyF5HzTyVk3VmMPEk3dju7vESZc2w4ksYArcg5HT+ImLjfxboaVAKiYOCipT3BgOJ8A3zSJcKrCaeDNThwqorGO8vMFujFc/QHRx8XL9VDgZbBvPjkzj2XkIYVy4XHYNFrG7yOHBfHEgWWnOKd4AoAVm7T0tAJJSfZoHT622Eh8lRCybFwmCeX4gTLD01NLeAsiwyuZ+w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749521575; c=relaxed/relaxed;
	bh=kvlbxPDd5AJPJYaddN/94neRPsjyXxPPMSeo4YgdnG0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E/5n1JfOQAFQc1735MRwep5SwQPTEjC54Hn32GKqTCRaTOQyuu7hK9NRCcmiqZR9BL0MtxYAEPH1B10MY5dexGxThu3zpny9uffbtLHoAdrM3wI1V1Z8mrfkrF1fZZmGcZA9nRN2wQQNseTKuMAoa7+5IjJeqNQVK4cfxmRrrojQ7u8ncORGkXnqtlrCZKpu6A2dBtUKV7aAgiRovo8SEsiZm7axjf7kSgUezYjg0/OqZ9PojFjMNl43TZqEggi0YMTG4Wb9VtyvJrp5feYRgFte8iLDvKvbhLjax7OfOHS05aqgMr+Zx57LU7HdxlJQQy1rXbq5he3iizC3daZFJw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=esPfbOhf; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=esPfbOhf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bGXPg0jWWz2xGv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jun 2025 12:12:54 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A0ADPq001233;
	Tue, 10 Jun 2025 02:12:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=kvlbxPDd5AJPJYadd
	N/94neRPsjyXxPPMSeo4YgdnG0=; b=esPfbOhfpu4hHCQJc1Ygf8DuQOJZK5pLd
	0vaOgWB808uYq7sB1TWrsaF4HBMETaCe1uz/XG5FeRvoKKj1z6bisAQkqT/4MYAv
	9VCRjJmig1MQpkQDviZLF1+javOCRDR4lmmeCFc4OWm6h+IBI5NqtpFCXesTsBl5
	7MvOux99Bzwx1nVrqmugcVEFvUe+Az6UGkGGA+Wp4BCI5qAEVPMqG78gwQEnW7cj
	XN4qE7sHH2YSSxLpoM9G0CjwtcvQfGRQRbIUQaVyyExfm6XmzNPwd4UcbeSPJJfd
	4rIEfN7qnDc/JrEHK2ToHumUlbo2ay8lYQy3V2w4U3NDLX3ch1ZCg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4769wygbfu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 02:12:46 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55A2AYcR026774;
	Tue, 10 Jun 2025 02:12:46 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4769wygbfq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 02:12:45 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55A13GSi003329;
	Tue, 10 Jun 2025 02:12:45 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4751ykg4kv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 02:12:44 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55A2CfOp22217018
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Jun 2025 02:12:41 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 351D92004B;
	Tue, 10 Jun 2025 02:12:41 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BADAA20040;
	Tue, 10 Jun 2025 02:12:37 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.59.164])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 10 Jun 2025 02:12:37 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu
Cc: linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
        Jonathan Greental <yonatan02greental@gmail.com>,
        Haren Myneni <haren@linux.ibm.com>
Subject: [PATCH 2/2] powerpc/vas: Return -EINVAL if the offset is non-zero in mmap()
Date: Tue, 10 Jun 2025 07:42:27 +0530
Message-ID: <20250610021227.361980-2-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610021227.361980-1-maddy@linux.ibm.com>
References: <20250610021227.361980-1-maddy@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: -KjNaJqDg8F6rppj1O2Q2PrdlHHYZaSi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDAxMiBTYWx0ZWRfX2q5yYsclpOra TLZVpRRkB4sMzOktnUFOFdHHSFuuPjLLxjpYF9tCKHZSIh6TY6F/Tq3RAlRFc64DSKa+wu0FiNh 53RWxJTI/afrIY7KnUbPmxi+NXs9mBE1IGz0o3XgJBz2NnCTejOHJ9KeKomNcyb4sSKA4P3+puB
 5bccmLl/7YY2rlm95lwbfR8ieed1Jhdcnym49QGwhPLb+pks5rgijxP9Hpo7MuFU5CH0CDKJ9pV VzzGV0+oaVdayKRRU7VbY1n0++XPE1DC2pfphDt6OuP1eZMd59US8Jc4wwzS47M4EuGfKgk4gKi k9pPJBKA3FI2kLYRP4i+SBSD/gFUHhkVzc8kDQZ0WX9+9RpKynTAHfbT2qapIUu2d6pa6HZ1JO4
 ZXWCYGRefQBwl3ndBfD4mMfUsJRxiNlLBnWoZRCxBBCpc/zqA6fyx82R6mk8Wd6Vqb4hm18s
X-Authority-Analysis: v=2.4 cv=YKGfyQGx c=1 sm=1 tr=0 ts=6847949e cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=6IFa9wvqVegA:10 a=pGLkceISAAAA:8 a=VnNF1IyMAAAA:8 a=ekTlo6oP0HYXFxCQYqsA:9
X-Proofpoint-GUID: IVMHh0PUftoC1Gs5hmi45cTD-HdwDhE4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_01,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0 mlxscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 mlxlogscore=757
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506100012
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The user space calls mmap() to map VAS window paste address
and the kernel returns the complete mapped page for each
window. So return -EINVAL if non-zero is passed for offset
parameter to mmap().

See Documentation/arch/powerpc/vas-api.rst for mmap()
restrictions.

Co-developed-by: Jonathan Greental <yonatan02greental@gmail.com>
Signed-off-by: Jonathan Greental <yonatan02greental@gmail.com>
Reported-by: Jonathan Greental <yonatan02greental@gmail.com>
Fixes: dda44eb29c23 ("powerpc/vas: Add VAS user space API")
Signed-off-by: Haren Myneni <haren@linux.ibm.com>
Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
 arch/powerpc/platforms/book3s/vas-api.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/powerpc/platforms/book3s/vas-api.c b/arch/powerpc/platforms/book3s/vas-api.c
index 0b6365d85d11..dc6f75d3ac6e 100644
--- a/arch/powerpc/platforms/book3s/vas-api.c
+++ b/arch/powerpc/platforms/book3s/vas-api.c
@@ -521,6 +521,15 @@ static int coproc_mmap(struct file *fp, struct vm_area_struct *vma)
 		return -EINVAL;
 	}
 
+	/*
+	 * Map complete page to the paste address. So the user
+	 * space should pass 0ULL to the offset parameter.
+	 */
+	if (vma->vm_pgoff) {
+		pr_debug("Page offset unsupported to map paste address\n");
+		return -EINVAL;
+	}
+
 	/* Ensure instance has an open send window */
 	if (!txwin) {
 		pr_err("No send window open?\n");
-- 
2.46.0


