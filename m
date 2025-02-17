Return-Path: <linuxppc-dev+bounces-6254-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 198B5A37C2C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2025 08:28:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YxDm13n6Zz30Ff;
	Mon, 17 Feb 2025 18:28:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739777313;
	cv=none; b=fbPKfcgioIDcWOkOZyUYmXHktxIHTzE4oulfKpioX9JJ5oOwwOVTKmiPoMhvWdMHXv386gQwSUf2VFPeGS8PJWk6Pjgf5GaflIoFbGOJavqW9vRFrEY5vrff5DHHjYvovfGCF1SZJrDC42SlwFCQOVGuk2dRgiX3D5y5RXpX4HoBdCiAAAExHkeHQWfmxA0Ngq/kB9aXR6dcq2C/nM6FAigiNSc5IqoYJ2s6N0uJ1dX1AKsJ1ecOVTh0plD6TJcG+Hlw3CRgaR5T82Z0RtCHWSslu8FVwg9wyK/7lKfUgfKhC0vJNR2KKUpX7gQr6ZV/qZrpY4FX/noLwmi08dTpbA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739777313; c=relaxed/relaxed;
	bh=3WkqmTOk6DOB6WJhFlYNo0B40RxSvef8rqO/IrbnX0w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SwKWK6WlM69aKQRr1iAhMYPRTwa62H1FCX1wwnDtupJI8r1besKzsoq/eWAx/ocrEUQwdtoVdbZeVvOnA/mH8Xw6r4wyp6p0LY/S+Mpx/hkcvQnKvBagEgqjixvBr0fnoilAhJGHNE68b4lIGRZ9ex4VhZaZ5bPsEYBjgmbn1Ft0ItRqO8bzk67YOk+ua3dj0C61J93t4urMjHXksD4e/rPS2Nj0pkZob2A1pe+Xuoo/IPiRBKsW9jLbM5ne784ENN58CwsrJRLyXHcBvNYxQBop/5OjVCKdIltIIhT3zVu2mw6P/orTtxMhRFe3cwCSuSZJAheJW9TLOxxzSeZ10w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EbVLVsyW; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EbVLVsyW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YxDm05sYFz2xs7
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 18:28:32 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51H18nAg015205
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 07:28:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=3WkqmT
	Ok6DOB6WJhFlYNo0B40RxSvef8rqO/IrbnX0w=; b=EbVLVsyWi3Z//UvAUxr9Wb
	I7RbhUSqRIyqgioi6uebAsbBKA51YTzKlLGMTbhFjSiyOJGuFMUYh1brKv8NlU0j
	saOrY/MCCxPowsxsr7vqClpDio3ySwrkuZwMQCRhiEdmmBHSPGSRK9rkxJyzUUPE
	LIOEAiFaUfeRiloBZf8BwB36Pk8BkDsUrC0eeuj8/3PEwuzFzfzBizBmzM9FP0yt
	SjoIOMLButkJ+a4Se/xvTKoZEEaed8xoJqarRXhOC3FzutJH4NIucWQkPNECTVBz
	wM7OGtcjLTCXmHxfDD6ylYvoow2B/JMagdUnaOj9VZ0hySdzwJ5geG8Vg+FY9d2Q
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44uu699bg6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 07:28:30 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51H3Ar3s008133
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 07:28:29 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 44u58td5x8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 07:28:29 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51H7SQRW41746786
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Feb 2025 07:28:26 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4013920043;
	Mon, 17 Feb 2025 07:28:26 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C990D2004B;
	Mon, 17 Feb 2025 07:28:23 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.79.72])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 17 Feb 2025 07:28:23 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, Gaurav Batra <gbatra@linux.ibm.com>
Cc: donettom@linux.ibm.com
Subject: Re: [PATCH] powerpc/pseries/iommu: memory notifier incorrectly adds TCEs for pmemory
Date: Mon, 17 Feb 2025 12:58:21 +0530
Message-ID: <173977700764.476837.15340390127207709957.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250130183854.92258-1-gbatra@linux.ibm.com>
References: <20250130183854.92258-1-gbatra@linux.ibm.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: MXOlXxeFSrDaqT6iZM-3xRrZgOS6Qswg
X-Proofpoint-ORIG-GUID: MXOlXxeFSrDaqT6iZM-3xRrZgOS6Qswg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_03,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 mlxscore=0 mlxlogscore=569
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502170060
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, 30 Jan 2025 12:38:54 -0600, Gaurav Batra wrote:
> iommu_mem_notifier() is invoked when RAM is dynamically added/removed. This
> notifier call is responsible to add/remove TCEs from the Dynamic DMA Window
> (DDW) when TCEs are pre-mapped. TCEs are pre-mapped only for RAM and not
> for persistent memory (pmemory). For DMA buffers in pmemory, TCEs are
> dynamically mapped when the device driver instructs to do so.
> 
> The issue is 'daxctl' command is capable of adding pmemory as "System RAM"
> after LPAR boot. The command to do so is -
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/pseries/iommu: memory notifier incorrectly adds TCEs for pmemory
      https://git.kernel.org/powerpc/c/6aa989ab2bd0d37540c812b4270006ff794662e7

Thanks

