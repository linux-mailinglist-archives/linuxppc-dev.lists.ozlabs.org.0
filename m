Return-Path: <linuxppc-dev+bounces-9223-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3CFAD2079
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jun 2025 16:04:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bGDFC1Nnmz2xHv;
	Tue, 10 Jun 2025 00:04:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749477871;
	cv=none; b=P02JYa0sEFpp5To6kMbeOOGMNkasHbyHMh+Vmqqr46347VQH7WJ6fxPGqn82OECWxb7A+RZUG2yTg9Ke37v4cA4Utz0ln3hotlnOesRHsyEPvYzvGDiX1IhI5IDsddmtXzhFWkyGh4xMbWUeZLMiklsal2sh1IvnR49jmKg9neye4vpjRUHXDqRyB21NUjcGJUzAz563h94wRmrRvGHL+lqN5UJ1fNTZRHbGKdSzNG+yObKYMeMZ6ZGTpgFFCUuHev9AwPqXiYd+OblY+kXbFVcuy374uT1HJ6ZE2C7l8p4g1gPvEUDCfoelERHeYNUc+z3SPy70awzvphsVGYFI9A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749477871; c=relaxed/relaxed;
	bh=w91YJqRUeCne22dMlXunltlLMzFks6D3Wo0q7++GxmA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ip7Y6FCY531TCYWdBFEFG7uCn2vxDSkHplNghlAITg7M2HaNNpezNi/B5A/wWjL5xT4ugpXsknqY/Lka386gK+zeg8tYqzs51ORVcbE+sjATKux1SnwQRl2eG2bjyboZRy+1XUR/ZB8kR2TKF5uhrQE9R0A9bHIFLOKhBD+q7KZEqGvi1tKkB/bWbMhLQ2KbXVMiB88kGB7oHyRtjNh5Ac5dHjuuvx4d5N0h20MI+odju2yAKkxmaI5fDy5dmpRqbxCJ4jF+w8Cf5zxzPz3S8sLeR35KeIjeoC2esLOKr9U3DYIMhF+cnCeeVw4JxPWP+m4yFeN8TFre4jzEFYptiA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Sb+fEnVd; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Sb+fEnVd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bGDFB0Kj9z2xCd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jun 2025 00:04:29 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55996RWm031658;
	Mon, 9 Jun 2025 14:04:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=w91YJqRUeCne22dMl
	XunltlLMzFks6D3Wo0q7++GxmA=; b=Sb+fEnVdTCZpVo812bliFxJZxDVXYFvYS
	QCODoe0wvDcMSBslIRd+Vgf7I3RQtQuv5zBuMucbPkOVrIqGZbbbfMwzsrcCUhUB
	kalp+7jBWWqAvNHIPhHiU18acwb7KJ8SFtFwFbOaeH7jE44bWcnx++4lRwstgRqW
	r3EC6Mh7va7btx14r+FSqLEmLIRQIsus1j4fyClYq6Ief+UlmaMSXsKkNO+ktxhu
	aAIcsqCzJAIMdw2sgfhTm9xgek8DRANSNJn10289KWmV1DwMQ8hGM0hgVflFGFq2
	GSIkOt8VTeTQH/sxPpG8YdK6A+91J8DfBdYLs12qjEOOfbzA3rOEQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 474x4kx4hv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Jun 2025 14:04:05 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 559DxIIB015400;
	Mon, 9 Jun 2025 14:04:05 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 474x4kx4hs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Jun 2025 14:04:05 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 559BLv3A003371;
	Mon, 9 Jun 2025 14:04:04 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4751ykdss8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Jun 2025 14:04:04 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 559E40D946596418
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 9 Jun 2025 14:04:00 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2210D20043;
	Mon,  9 Jun 2025 14:04:00 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 468BA2004D;
	Mon,  9 Jun 2025 14:03:57 +0000 (GMT)
Received: from ltczz402-lp1.aus.stglabs.ibm.com (unknown [9.40.194.31])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  9 Jun 2025 14:03:57 +0000 (GMT)
From: Donet Tom <donettom@linux.ibm.com>
To: donettom@linux.ibm.com
Cc: Jonathan.Cameron@huawei.com, akpm@linux-foundation.org,
        alison.schofield@intel.com, dakr@kernel.org, dave.jiang@intel.com,
        david@redhat.com, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com,
        nilay@linux.ibm.com, osalvador@suse.de, rafael@kernel.org,
        ritesh.list@gmail.com, rppt@kernel.org, yury.norov@gmail.com,
        ziy@nvidia.com
Subject: [Fixup PATCH] drivers/base/node: Restored the removed extra line
Date: Mon,  9 Jun 2025 09:03:54 -0500
Message-ID: <20250609140354.467908-1-donettom@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <2a0a05c2dffc62a742bf1dd030098be4ce99be28.1748452241.git.donettom@linux.ibm.com>
References: <2a0a05c2dffc62a742bf1dd030098be4ce99be28.1748452241.git.donettom@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=Y4X4sgeN c=1 sm=1 tr=0 ts=6846e9d5 cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=6IFa9wvqVegA:10 a=VnNF1IyMAAAA:8 a=7H9vA5QQWFz24hj3CacA:9
X-Proofpoint-GUID: 2eaR4vvhR2OwARGCBM4klXR7o4FJUpEl
X-Proofpoint-ORIG-GUID: pN7bQ2aj2OUbLITVeMJx7fOjXCbASb4r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDEwMSBTYWx0ZWRfX6JWqtE0ocMCx KmSiJ7AHwJxL2jGIH++Phlt073rh/Wy5CE+SFEJLY39smjZB81zPV8ovu5TkwijuVxR6/xXfTw/ sO8t7vcElY9yMXekKa8Y0DL0g/eo1hFSiOHP0Ensn1uO7y1rDdZZ9c7OkNT4qLB3OjGE4FfsevP
 ltxgBAvuJ6s9hirmFZL9/7ZipEZ0tUpacPVsK25zQyrk+5nHV6OzlAAE/Gj5mYnz6qOYpuPWkH0 gUJ5eZKl5IfgSxpWgsgzKrArG6zgjv4wp0YE42ZC9UYI6nCST/Owmgpu07pRThsUb6z6l+kzFOe ZTSqbCSDtUey6fxG16KK2e9q1/0oxOXFTzxRvAIaDtt2UoOosBunYboV/Vd0w+diwKOdw16hLg5
 dVLq+lpPsOW9g1Mo9S84VxSMdL5DPUV8SKNee+B26CofNfzVGPhYm8z3+sJrCLI5u1XpDBHo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0
 impostorscore=0 suspectscore=0 phishscore=0 mlxscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506090101
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Re-added the extra blank line at the end of the memory.h that was
removed by the commit
'commit d61861e3bb35 ("drivers/base/node: optimize memory block
registration to reduce boot time")'

Signed-off-by: Donet Tom <donettom@linux.ibm.com>
---
 include/linux/memory.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/memory.h b/include/linux/memory.h
index c39ad931713d..bd4440bc4a57 100644
--- a/include/linux/memory.h
+++ b/include/linux/memory.h
@@ -216,4 +216,5 @@ unsigned long memory_block_advised_max_size(void);
  * can sleep.
  */
 extern struct mutex text_mutex;
+
 #endif /* _LINUX_MEMORY_H_ */
-- 
2.43.5


