Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A777654EF32
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 04:21:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPN7s4nHvz3cDb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 12:21:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=Mvkwvafx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=martin.petersen@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=Mvkwvafx;
	dkim-atps=neutral
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LPN782xw5z3bl5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jun 2022 12:20:30 +1000 (AEST)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25GNmtGY026652;
	Fri, 17 Jun 2022 02:20:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2021-07-09;
 bh=46rOZ/wy2QC/SFSw6K3GXEKJrcwnyZZKW/7s1adV2nc=;
 b=MvkwvafxEMVDCyLIsz6OrlBizHz21zmaqPz6x378oG+VSjgwTxJRI8hk+NWvLQA9R3Hw
 RX3hMvE83wJHpsAiOQ2I4YmOGwIVCXT0HndK+rnIDctAe6ME8yT+TvQAwXx8/d633z2J
 LH2kyY8Yk5B0foVU9a7Uo/2TTv2Zl9/y1vRr7rrM3TFBc0L/k2e5pSgbVNupFR1txux0
 AuvbmW2STqk6i5eInX8kOgSo+AbQS4mdFJa4M0I7usFSEDjQtzfXFNT1Vw04dZEHlTvv
 qk4q3flv58mys4dUgaSMIWNBm2EmBc6n3jPoaVPf/i2nzLPtaXHwgfm0C1XMoE+Cyvlq Dg== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmhn0mt29-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Jun 2022 02:20:26 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 25H2GGrF038459;
	Fri, 17 Jun 2022 02:20:26 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id 3gpqq327fn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Jun 2022 02:20:26 +0000
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 25H2KMSe006844;
	Fri, 17 Jun 2022 02:20:25 GMT
Received: from ca-mkp.mkp.ca.oracle.com (ca-mkp.ca.oracle.com [10.156.108.201])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id 3gpqq327d4-3;
	Fri, 17 Jun 2022 02:20:25 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: Tyrel Datwyler <tyreld@linux.ibm.com>,
        james.bottomley@hansenpartnership.com
Subject: Re: [PATCH] ibmvfc: multiqueue bug fixes
Date: Thu, 16 Jun 2022 22:20:20 -0400
Message-Id: <165543238454.26073.9657501808078382036.b4-ty@oracle.com>
X-Mailer: git-send-email 2.35.2
In-Reply-To: <20220616191126.1281259-1-tyreld@linux.ibm.com>
References: <20220616191126.1281259-1-tyreld@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: FWL63DJf5ixlJBt2S8RfBBQ72Y2_qn9K
X-Proofpoint-ORIG-GUID: FWL63DJf5ixlJBt2S8RfBBQ72Y2_qn9K
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
Cc: brking@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, linux-scsi@vger.kernel.org, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 16 Jun 2022 12:11:24 -0700, Tyrel Datwyler wrote:

> Fixes for a couple observed crashes of the ibmvfc driver when in MQ mode.
> 
> Tyrel Datwyler (2):
>   ibmvfc: store vhost pointer during subcrq allocation
>   ibmvfc: alloc/free queue resource only during probe/remove
> 
> drivers/scsi/ibmvscsi/ibmvfc.c | 82 ++++++++++++++++++++++++++--------
>  drivers/scsi/ibmvscsi/ibmvfc.h |  2 +-
>  2 files changed, 65 insertions(+), 19 deletions(-)
> 
> [...]

Applied to 5.19/scsi-fixes, thanks!

[1/1] ibmvfc: store vhost pointer during subcrq allocation
      https://git.kernel.org/mkp/scsi/c/aeaadcde1a60

-- 
Martin K. Petersen	Oracle Linux Engineering
