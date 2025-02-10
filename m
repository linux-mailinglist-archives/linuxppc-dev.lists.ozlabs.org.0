Return-Path: <linuxppc-dev+bounces-6013-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC3CA2E2E1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2025 04:41:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yrr3l738Nz2xk7;
	Mon, 10 Feb 2025 14:41:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.177.32
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739158915;
	cv=none; b=OfsfTXkD2qaLqWHV/sbE5HZwnTvN1O032RZf+KXknYoxFyd0cuzzthkBIZFZTC5uiPPGeHlo4pdarprnMw/p4r+WxUAkwmQVBSaO/yhRICgBu7NRaRaq4xKcTXT7wclcgNwdyIiOf+t8jRoxuQIl7O2fnbHIFdk0t4u5bTw/RRwuqGHdpa7cxNPk3K5e/HL6rmqEwlTe+0K7LM8f/fUnvdkALlbIPmsbFnVTfcILxFMhMVag5zGUJaI24ldheqxyfHcqN/A1bWKDmsLgXV/aIzBgGrP/nkqx2RH+w6hFKrN0KyyMpQc6Zhd0FfKnKuB/Y8AYsOMDeyTkKR9vuMmsLg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739158915; c=relaxed/relaxed;
	bh=jgGa/LI7CFzUobEkkBBIyQidm/y39vrcJuona1N5w20=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CJELS4P/iHnG5k3vmlAvzk5ecj+Ur61zmgUX0lhEdmbQOQTP57Q+VqfxMeQecxvQOeVfs73f59S3OMpReLiH0EdPDjh5/NAYwJOX3gWvVnM7KAG9CBx+s95LZ9BRLQWcMbynMr4P9auZFiZFS+FDb1mrpgUD2HiwBLCG7cd4gPJvwhIygBRQbY1+8ADuDVkwY8xDC13jspY3jwD2y71w34SoitreU2dkSVhHRpAlkdTP8a43yKShm436XendMn0u2ZbOh4rWyu6jhHdgXOas0WxZXCoCbN0Q5xzT5Jx5Pgb9mDKaEdU4+RSTIUaEvfJ6wFL1RuBA7ALUovROe3solg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=mqD8ftBh; dkim-atps=neutral; spf=pass (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=martin.petersen@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=mqD8ftBh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=martin.petersen@oracle.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 2566 seconds by postgrey-1.37 at boromir; Mon, 10 Feb 2025 14:41:54 AEDT
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yrr3k5WBbz2xYg
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Feb 2025 14:41:53 +1100 (AEDT)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 519MPu93029995;
	Mon, 10 Feb 2025 02:59:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=jgGa/LI7CFzUobEkkBBIyQidm/y39vrcJuona1N5w20=; b=
	mqD8ftBhNYTKGfpq3Cy51KvfBPjLRMsxTXn/Gcnpn3VwzU8fPHq1jv1h82ksPHHQ
	llqISBjEuFsZ65XDO501foROg/s0kHzKhYteCc37J1gZveSAhpR+pC+YYdZkVTlm
	TQ/Wom3AezW/3PWs18uTd60sgxnZQMfBLTK2B+Rw2rtfbLmXQZm07QTVfhFc0sLT
	wMHTGPUG/Yp47nfy5jCcGLFvr36OFFkd7uzlxusCK1dHIZ7gt64HNIPQZZ2hUPWr
	ZMnL1t4L1am2HYWS0W4+AmJWsCVAIYnoLuhhLwOwLJA2jPNHNlIkSQ+SQeI3oaZC
	6Wslz/JSsu0oj64n866ZYQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44p0sq24wk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Feb 2025 02:59:03 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 51A23lP0012551;
	Mon, 10 Feb 2025 02:59:02 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44nwq6uad5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Feb 2025 02:59:02 +0000
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 51A2vwAX033952;
	Mon, 10 Feb 2025 02:59:02 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 44nwq6uacs-1;
	Mon, 10 Feb 2025 02:59:02 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: linuxppc-dev@lists.ozlabs.org, linux-scsi@vger.kernel.org,
        Andrew Donnellan <ajd@linux.ibm.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        linux-kernel@vger.kernel.org, fbarrat@linux.ibm.com,
        ukrishn@linux.ibm.com, clombard@linux.ibm.com, vaibhav@linux.ibm.com
Subject: Re: (subset) [PATCH v2 0/2] Remove cxl and cxlflash drivers
Date: Sun,  9 Feb 2025 21:58:23 -0500
Message-ID: <173915612139.10716.387713440778948780.b4-ty@oracle.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203072801.365551-1-ajd@linux.ibm.com>
References: <20250203072801.365551-1-ajd@linux.ibm.com>
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
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_02,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 mlxlogscore=744 mlxscore=0 spamscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2501170000 definitions=main-2502100023
X-Proofpoint-ORIG-GUID: BfpDD0j-Mm8NjPJHSBTyQeRaORrK113D
X-Proofpoint-GUID: BfpDD0j-Mm8NjPJHSBTyQeRaORrK113D
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, 03 Feb 2025 18:27:58 +1100, Andrew Donnellan wrote:

> This series removes the cxl and cxlflash drivers for IBM CAPI devices.
> 
> CAPI devices have been out of production for some time, and we're not
> aware of any remaining users who are likely to want a modern kernel.
> There's almost certainly some remaining driver bugs and we don't have much
> hardware available to properly test the drivers any more. Removing these
> drivers will also mean we can get rid of a non-trivial amount of support
> code in arch/powerpc.
> 
> [...]

Applied to 6.15/scsi-queue, thanks!

[1/2] cxlflash: Remove driver
      https://git.kernel.org/mkp/scsi/c/772ba9b5bd27

-- 
Martin K. Petersen	Oracle Linux Engineering

