Return-Path: <linuxppc-dev+bounces-11450-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD27B3AE19
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Aug 2025 01:09:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cCcXj4sqBz2yrm;
	Fri, 29 Aug 2025 09:09:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756422549;
	cv=none; b=nooB3ijlX2PlghbxzdmnPUCtl7tp1VbAm+wbrOcKTEPTvGDLYR7Rhk2onoII2mhtnaV7Vi4FHCP+v+1eCqYyAXsTAdn+z87EKd36i/gEUFMPI8FBt/kbsqRSK3XZsbgoRNjh6ea2XcyuuNywIPbkgVDSUTBPbHDxn8kfY0neqj0dv2ngXThMefLMf5HU0//8lOMFIdEOPd5rF4pyIQ/wljmfsW7eR46sqcqSzNxf6H1i4FbYbX8S8tGbs6zSlzLpGR1bcvYoSjg3fSVxYHFkkUFRilz6f6R2GiwrsrBabm1N3Pqs9FZS2zuZ4o/Z7Jao1ZzPfrO48ydnPuZvkkJNqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756422549; c=relaxed/relaxed;
	bh=xfi/csTIhg6HCdpHWOCzRpvePUDTXMbSIgUS29Gm+BE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oD+k+vtiP0sNB/4RSYlXew1AigG1SVschqcHNLMfXj9zHF32aaJSVDXOUrZy47V4/+9e3XpvG8SNWxJ68xtlvISvwkAdEt8g6iXaGiaWIViLUrhIfdcgPtPCG9qrYrfv9a+Sf2Ni9zK0JTLtc3a0X9sbvP5Va3PXaHhHStrdcZfb1lz0xzpNWMM1Xv8Pm0z/+v3rtQXioErlO0BaG9AilThAzpR+9zgzhavH0HXBtA5WfuUFvaLX9qWyxBiuK3axAd7fW7kq8+cbUJB2O/Y+nRkCdsYuv3xTpD4XGFpO0slNjREZdr7pu8Bi5WDFjVbh7aMP2nu5oLKIKrgE71JO6Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ojM8JZ2i; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ojM8JZ2i;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cCcXj0HSTz2yrR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Aug 2025 09:09:08 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SHDH1e002052;
	Thu, 28 Aug 2025 23:09:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=xfi/csTIhg6HCdpHW
	OCzRpvePUDTXMbSIgUS29Gm+BE=; b=ojM8JZ2i/wT6yoPsa/nDJBFB2yFDH/eF/
	SWbhLLG7JQbeK319XWEQeyaKZfsCr1NPlQDZbrK2Svt9epjbrcZLkwS52/Ar1ZUD
	U98F+HWM+onCsenFXbFgugRxETvnWQgigd1Dx8BAbMplMBjyndh5W43Rav7Xp5br
	dtzcZD5eKPio7d2WfNjR56ggXz+/M0Mrk7AgdAFYE6r9X4YbBVK6ufA2NT+NEkUJ
	HN/hUgriRFcTSLwBYeel2jg5n2kw6TR+KKu4vYpUeGxMVEozxFB4BROMDqVWycRR
	9vNTnqFdtO0VJRaf5JezWYFJeCL6rFXw7HzEuiGFqz6iJQ1YdL35Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48tuaj1bvd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 23:09:01 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57SN91gt020339;
	Thu, 28 Aug 2025 23:09:01 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48tuaj1bvb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 23:09:01 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57SMt4wD017974;
	Thu, 28 Aug 2025 23:09:00 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 48qtp3pxq7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 23:09:00 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57SN8wR965733012
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 28 Aug 2025 23:08:58 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4033C58061;
	Thu, 28 Aug 2025 23:08:58 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6D3C25806A;
	Thu, 28 Aug 2025 23:08:57 +0000 (GMT)
Received: from li-4c4c4544-0038-3410-8038-c4c04f423534.ibm.com (unknown [9.61.165.221])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 28 Aug 2025 23:08:57 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com, haren@linux.ibm.com, shashank.gowda@in.ibm.com,
        bjking1@linux.ibm.com
Subject: [PATCH v3 6/9] powerpc/pseries: Wakeup hvpipe FD when the payload is pending
Date: Thu, 28 Aug 2025 16:08:40 -0700
Message-ID: <20250828230845.2291249-7-haren@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250828230845.2291249-1-haren@linux.ibm.com>
References: <20250828230845.2291249-1-haren@linux.ibm.com>
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
X-Proofpoint-GUID: i7vfqtnh-QBTiWg3Hu5xUa8gZuvEoxok
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI4MDE0MCBTYWx0ZWRfX5VxPxhvijNoj
 FUcJeAeavrKiIN8KsB1OwcGXyuvUI6zPY0NDdsahH1xFSJnv8mLGQfbXggscdHxsFTgdiCxZcG4
 w9VdDkF0N25/wovOapTSNaZkcA/t18ZNPEdBVwCx+6+K2WMz+DiHZt8AC3QTAsUfpy+PUG44ut+
 sIJWf5ZUHm/fU7n2/dqDgnaN9HV8TXrPCH8OEqQkU/Gm87jU4tazUl4bjh7myyLBHSwZgSnBPq4
 TAW6/Se7s659h7uJ6HNLbmFhdI/udPC+cM/5FORlCSmL4vwTo5iZPdss+YhICAsptFw9y8WwU1s
 K9Hnn7QD+oR5E59IyoLgxfK4uy0wx2tWyzE0VLnwIVDv34A9MS1dTfTFj7Kmj7YqP/hXwz9IH7V
 aWL+Yk5g
X-Authority-Analysis: v=2.4 cv=YfW95xRf c=1 sm=1 tr=0 ts=68b0e18d cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=cOkRu7kXP2xU_tVQ87kA:9
X-Proofpoint-ORIG-GUID: kuRaLHIhvZBiuYkDwUA9nVqzPSNCA2Ak
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508280140
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
Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Tested-by: Shashank MS <shashank.gowda@in.ibm.com>
---
 arch/powerpc/platforms/pseries/papr-hvpipe.c | 28 +++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/papr-hvpipe.c b/arch/powerpc/platforms/pseries/papr-hvpipe.c
index eb1b5f1f976e..1e7636c0b275 100644
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
2.50.1


