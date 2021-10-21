Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B66343592B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 05:44:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZYHh0wV3z3c67
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 14:44:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=JnMFKpHL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=205.220.165.32;
 helo=mx0a-00069f02.pphosted.com; envelope-from=martin.petersen@oracle.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2021-07-09 header.b=JnMFKpHL; 
 dkim-atps=neutral
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZYGy58QKz2y8P
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 14:43:20 +1100 (AEDT)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19L2DQrE019148; 
 Thu, 21 Oct 2021 03:43:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2021-07-09;
 bh=JIag/1EVROHvvkjVOHL8l+9sTbbjakPfIoreQcn+KZE=;
 b=JnMFKpHLxkHPP6DT78m6Pni74sSuF01LVkzZOcGO1EERPA41pT6WYpZ/FuA1BjoFg5fG
 4EcpM8ZWlbiP34G2PLz+65AHqWPzg58hilnLDohnBo+UC5g4Id3pIFLTHnRMshD6oSDs
 JlqDzulEX+uAmNeVv3nqncbGGeCfaW1rvAchNiTfATzLCYgvbC87Mk17MChnewRTZAVY
 rOAg80aVS+7a+SiBFV82jkGbkrdx7jCMdZ8BctCe7D5jfHRja2A7LtwBX+ctaoOtutmm
 wRvxYJ2pungJXfAYhzoh7k+A734+d6WRhadRJLm/2uIPXzwewHEZggL5NrHAdlvBTfqy Fg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3btqypjhuq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Oct 2021 03:43:15 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19L3esRn078107;
 Thu, 21 Oct 2021 03:43:14 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3030.oracle.com with ESMTP id 3bqmshemah-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Oct 2021 03:43:14 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 19L3gu8O082116;
 Thu, 21 Oct 2021 03:43:14 GMT
Received: from ca-mkp.mkp.ca.oracle.com (ca-mkp.ca.oracle.com [10.156.108.201])
 by aserp3030.oracle.com with ESMTP id 3bqmshekyd-20;
 Thu, 21 Oct 2021 03:43:14 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: james.bottomley@hansenpartnership.com,
 Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
Subject: Re: [PATCH] ibmvscsi: use GFP_KERNEL with dma_alloc_coherent in
 initialize_event_pool
Date: Wed, 20 Oct 2021 23:42:51 -0400
Message-Id: <163478764103.7011.14545287284915195720.b4-ty@oracle.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <1547089149-20577-1-git-send-email-tyreld@linux.vnet.ibm.com>
References: <1547089149-20577-1-git-send-email-tyreld@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: jQ9mMRTUFKSCzcUdde-rNFPZVc6wKMCQ
X-Proofpoint-GUID: jQ9mMRTUFKSCzcUdde-rNFPZVc6wKMCQ
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
Cc: brking@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 linux-scsi@vger.kernel.org, "Martin K . Petersen" <martin.petersen@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 9 Jan 2019 18:59:09 -0800, Tyrel Datwyler wrote:

> During driver probe we allocate a dma region for our event pool.
> Currently, zero is passed for the gfp_flags parameter. Driver probe
> callbacks run in process context and we hold no locks so we can sleep
> here if necessary.
> 
> Fix by passing GFP_KERNEL explicitly to dma_alloc_coherent().
> 
> [...]

Applied to 5.16/scsi-queue, thanks!

[1/1] ibmvscsi: use GFP_KERNEL with dma_alloc_coherent in initialize_event_pool
      https://git.kernel.org/mkp/scsi/c/3319a8ba82b9

-- 
Martin K. Petersen	Oracle Linux Engineering
