Return-Path: <linuxppc-dev+bounces-10061-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AC1AF64EA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jul 2025 00:16:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bXZ2n5BsVz30Wn;
	Thu,  3 Jul 2025 08:15:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751494511;
	cv=none; b=WKIJ5oSVXnhHOQMqVQLTBNFpNh5xVrfoEnkE4QvB/1FtE8y1GRgzKB7R15nuaOR4USa058Af3zVXEIqKtqvVCTNXeGoO5cQudDWvIpAupezBYUdTQIi7kxBMmyf0UbNwfgxOPWC0KjUPmu89HA9eVLYMIkq1vB+aTooSt2DrnikXp6nAyHoUmjiNlzCeDVtJrQIMWJCfo+MRp6OC5xpz2e4OUVF27HIyOCEOSFWWr7mL2Q3T57OJev8DtJMs3Rb4Vco0rnoK4sx5IFP6NXHtnyvUYrLtUctm5tIsNNfhoMWgHGgGJyVL4xdjyBnOvLpuklgWTOlHP+4opXlYAz+TcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751494511; c=relaxed/relaxed;
	bh=eNTCZqo+M90bOZyKLyiC6JWSK0j7fm+yGroGg31tFGA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OsTYOdcKuWTqr3GqNSZXftv3RoFK+DRuWnfCmEcdCep3UpLPYDHbRY6Zn8Q1t/YRHhaTTmo1KaUfi8LC8MmHLJqX3OUg8YKslhaYEXBW2qs1nTUl8XuqVNxV7CdthzuP3oZMH8K+4mtwOco298E9g/toEAYSuEY73U9wlWAQgFiMnPwRGVjxpjQrKF5pIB+0zJ/XU8T1m+7ih5KZeHDAh9ZQBXCBPcOYP4T2S3AAVIuOwm4dWIRxaPdVm0eteyhXt6XLmUIi7uB6K/ByFdyyZRgScsHeSC21NbxTWFe3n40NaP5ZjeL8VRWoPS6i9qytVeYDQD0usuXkOQQEIuZaRg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JZUozOrN; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JZUozOrN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bXZ2j0TM0z2yf3
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Jul 2025 08:15:08 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562I8n0m000747;
	Wed, 2 Jul 2025 22:15:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=eNTCZqo+M90bOZyKL
	yiC6JWSK0j7fm+yGroGg31tFGA=; b=JZUozOrNJChJYZBQ0SzcBtzTpeNYzYKft
	pbAmlEYav9vitUvyMNMw1uwTnKm/qqvs5u3qxG6N8OFuOGHSH5ClfNKzYYOTOdrl
	EXGH2fa6i2ugomHnVdJPVF2ZQwHd1EMptnyMZ4AVU5NqJCjjVo9h8j2Iva9pZTTL
	Wb02wV8x5i0xySogps6ApSt7ij6Km4sEmGDdmTUUTIQb1oH2iQrBTBudwuyGmVL/
	kuNtQ/hW1MRm0lC+5m4KXJrxoqLMcDxhevkwISLwhGoL0OvtufwtCbPtCp0lxMZG
	aV4uvKpxiCqKrzBnkaGWZQM1R0uS+39Ui4TmG5rh24wLJ6nEijGaw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47j84dg9d3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 22:15:01 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 562M6UCu007143;
	Wed, 2 Jul 2025 22:15:00 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47j84dg9d1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 22:15:00 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 562KhqUR032320;
	Wed, 2 Jul 2025 22:14:59 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47ju40sx9m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 22:14:59 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 562MEuBU2687734
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 2 Jul 2025 22:14:56 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A7FB658056;
	Wed,  2 Jul 2025 22:14:56 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0422B5803F;
	Wed,  2 Jul 2025 22:14:56 +0000 (GMT)
Received: from li-4910aacc-2eed-11b2-a85c-d93b702d4d28.ibm.com.com (unknown [9.61.17.45])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  2 Jul 2025 22:14:55 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com, haren@linux.ibm.com
Subject: [PATCH RFC 6/9] powerpc/pseries: Wakeup hvpipe FD when the payload is pending
Date: Wed,  2 Jul 2025 15:14:40 -0700
Message-ID: <20250702221444.879256-7-haren@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250702221444.879256-1-haren@linux.ibm.com>
References: <20250702221444.879256-1-haren@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: W-QizlWQo6VnB3eisskl_-VB28S-7CnD
X-Proofpoint-GUID: ldSASPFoDqMmQdINk_tcjV3_qAN-bnzT
X-Authority-Analysis: v=2.4 cv=Ib6HWXqa c=1 sm=1 tr=0 ts=6865af65 cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=Wb1JkmetP80A:10 a=VnNF1IyMAAAA:8 a=cOkRu7kXP2xU_tVQ87kA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDE3NiBTYWx0ZWRfX6AVjAZMRLvXl oCH+YqlrV3T2LOkRuoDi5QYufNXG/1KnS3xCqho4pBBex1Ngup6JGyTAqSsWLJq8suT+WGwZFOJ SGFaeACDTiqR63ILFL0pFCn4WlNjuKWJYMlSbjfTQDVGTTsPJi09puYCULFcJKWsF2T8a7LGF18
 Gtt7XSqJuVVpuoBtGclIKxZEaYBiPHzTzNKWYgSlL8oAmwu2Z4I3cvLoTbVGeHImmKUbZvm3c+U Q3r9ky+vjheaBIL+MR+YReEOFQFMBg6XxDlmnNnjxR891SK6zKtZMmLDJPyE4xmwgXaPDPy1tG/ wluyV6Yu7j7lV4DK7JGax9GF0uDg5Wy8JdIt8W83N1hkJ7o0RDEjr6Z1srLnIDXkos4PK4ez9ww
 6wJ+eT9hYmPGr1Q1vOItKlfnn4LOY425nlxRjdDbkF+vM1xolgtOz5ZLGn34t2aBb+AcHMJZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=1 phishscore=0 suspectscore=0
 clxscore=1015 mlxlogscore=218 lowpriorityscore=0 impostorscore=0
 mlxscore=1 malwarescore=0 spamscore=1 priorityscore=1501 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020176
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The user space polls on the wait_queue for the payload from the
specific source. The hypervisor interrupts the OS when the pipe
status for the specific source is changed such as payload is
available for the partition or pipe to the source is closed. The
OS retrieves the HVPIPE event message with check-exception RTAS
and event message contains the source ID and the pipe status.
Then wakes up all FDs waiting on the wait_queue so that the user
space can read the payload or close the FD if the pipe to source
in the hypervisor is closed.

The hypervisor assigns one pipe per partition for all sources.
Hence issue  ibm,receive-hvpipe-msg() to read the pending
payload during release() before closing FD so that pipe to the
partition will not be blocked.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/papr-hvpipe.c | 28 +++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/papr-hvpipe.c b/arch/powerpc/platforms/pseries/papr-hvpipe.c
index 21483ea09489..b283837dcefc 100644
--- a/arch/powerpc/platforms/pseries/papr-hvpipe.c
+++ b/arch/powerpc/platforms/pseries/papr-hvpipe.c
@@ -398,6 +398,21 @@ static unsigned int papr_hvpipe_handle_poll(struct file *filp,
 	if (!src_info)
 		return -EIO;
 
+	/*
+	 * If hvpipe already has pending payload, return so that
+	 * the user space can issue read().
+	 */
+	if (src_info->hvpipe_status)
+		return POLLIN | POLLRDNORM;
+
+	/*
+	 * Wait for the message event
+	 * hvpipe_event_interrupt() wakes up this wait_queue
+	 */
+	poll_wait(filp, &src_info->recv_wqh, wait);
+	if (src_info->hvpipe_status)
+		return POLLIN | POLLRDNORM;
+
 	return 0;
 }
 
@@ -415,7 +430,18 @@ static int papr_hvpipe_handle_release(struct inode *inode,
 	src_info = file->private_data;
 	list_del(&src_info->list);
 	file->private_data = NULL;
-	spin_unlock(&hvpipe_src_list_lock);
+	/*
+	 * If the pipe for this specific source has any pending
+	 * payload, issue recv HVPIPE RTAS so that pipe will not
+	 * be blocked.
+	 */
+	if (src_info->hvpipe_status & HVPIPE_MSG_AVAILABLE) {
+		src_info->hvpipe_status = 0;
+		spin_unlock(&hvpipe_src_list_lock);
+		hvpipe_rtas_recv_msg(NULL, 0);
+	} else
+		spin_unlock(&hvpipe_src_list_lock);
+
 	kfree(src_info);
 	return 0;
 }
-- 
2.43.5


