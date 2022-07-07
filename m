Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DAC56ADF3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 23:48:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lf95W3wdMz3cFT
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Jul 2022 07:48:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=xnJ9jBf8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=martin.petersen@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=xnJ9jBf8;
	dkim-atps=neutral
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lf94p3LvJz3byT
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Jul 2022 07:47:48 +1000 (AEST)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 267KCRZY003652;
	Thu, 7 Jul 2022 21:47:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2021-07-09;
 bh=mYUReDqAAtD2Mc/Slejp/JsQFVi9e1ncghZX3Vavmh0=;
 b=xnJ9jBf8Ufq6J0JVjaiWi0JryS/PVZ3dV0d11TbTkdML8UPIRmyHYhNMlt6sUKGAbpGU
 k64Gx9anLLCmwum/I538ASOgU7UbRmo0/u29MVFnQku7yXhDpqdJGknQJgZIIC+7PFfP
 6qYda/BRPr3r6+vj493eF+dScvU9YM4s8t2JLgWLYQl/zXR8xZlQ8D3ZS3wKx1kMJb2F
 Wuvi0Du4suhANFR9tbfeGAiD3ULI9Pz2yiGidy2GDPuTmHeR5W5sEf3iPLZfq0hS05mS
 g2ODR6pqBet/WF8GYQOzJ13vdtCxaIsKTlR+/B8gSHDywC5rA0KruYY4lScx0RauYNvz yQ== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h4ubye73u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 07 Jul 2022 21:47:28 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 267LjM4l030275;
	Thu, 7 Jul 2022 21:47:27 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id 3h4ud7c5bw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 07 Jul 2022 21:47:27 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 267LlRsY033607;
	Thu, 7 Jul 2022 21:47:27 GMT
Received: from ca-mkp.mkp.ca.oracle.com (ca-mkp.ca.oracle.com [10.156.108.201])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id 3h4ud7c5ag-1;
	Thu, 07 Jul 2022 21:47:27 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: linux-scsi@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH v3 0/3] phase out CONFIG_VIRT_TO_BUS
Date: Thu,  7 Jul 2022 17:47:20 -0400
Message-Id: <165723020283.18731.6642678816129479253.b4-ty@oracle.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220624155226.2889613-1-arnd@kernel.org>
References: <20220624155226.2889613-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: HrfrZsc4HaH6Tm6et7M--Pti1gCHS_F-
X-Proofpoint-ORIG-GUID: HrfrZsc4HaH6Tm6et7M--Pti1gCHS_F-
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
Cc: linux-arch@vger.kernel.org, Miquel van Smoorenburg <mikevs@xs4all.net>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-parisc@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>, "Maciej W . Rozycki" <macro@orcam.me.uk>, linux-m68k@lists.linux-m68k.org, Denis Efremov <efremov@linux.com>, Mark Salyzyn <salyzyn@android.com>, Christoph Hellwig <hch@infradead.org>, iommu@lists.linux-foundation.org, Matt Wang <wwentao@vmware.com>, linux-alpha@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, linuxppc-dev@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>, Khalid Aziz <khalid@gonehiking.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 24 Jun 2022 17:52:23 +0200, Arnd Bergmann wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> The virt_to_bus/bus_to_virt interface has been deprecated for
> decades. After Jakub Kicinski put a lot of work into cleaning out the
> network drivers using them, there are only a couple of other drivers
> left, which can all be removed or otherwise cleaned up, to remove the
> old interface for good.
> 
> [...]

Applied to 5.20/scsi-queue, thanks!

[1/3] scsi: BusLogic remove bus_to_virt
      https://git.kernel.org/mkp/scsi/c/9f7c2232e131
[2/3] scsi: dpt_i2o: remove obsolete driver
      https://git.kernel.org/mkp/scsi/c/b04e75a4a8a8

-- 
Martin K. Petersen	Oracle Linux Engineering
