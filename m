Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 793F86208F1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Nov 2022 06:30:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N5xXC12Gsz3dtf
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Nov 2022 16:30:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=dWZgkYim;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=martin.petersen@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=dWZgkYim;
	dkim-atps=neutral
X-Greylist: delayed 5271 seconds by postgrey-1.36 at boromir; Tue, 08 Nov 2022 16:29:59 AEDT
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N5xWC2xdtz3byZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Nov 2022 16:29:57 +1100 (AEDT)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A80OPcn018481;
	Tue, 8 Nov 2022 04:02:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2022-7-12;
 bh=vhki7AWn4DB4TB80ppOU0xCmjR5k3ntJWa9wkDVW4xY=;
 b=dWZgkYimNTofNNddspjaV/WqbMbGN631/ujTMwoFM3Y3VCFbmMMist2wdXShecxCUxGr
 KEicZBPbvTHIX8xgNQ9lQEJO9+fJB2rDzYzuaCCpy1Bzc5Z/1nncokpYSPuyfgoHVyjE
 yATw+oEPJjv6Kzy5XGXEaErLIT74NsKhBlfAozwVxJ4BIh3xym2nqKbnZKv4SZF8sKdU
 llttSwRDchmNnbfmHbBAaB2s6ONG8qPc9W8vtSGgN6UBt8fz1MwrauG+N/c2QmVbQGGo
 8Z+i2LHXcY27rVMv5ejcnkxmZDge2+qYqNxLgE/1SSaJcQnTM24s6E66iIoupkeXULAY +w== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3kngk6e5jq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 08 Nov 2022 04:01:59 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 2A82jbvP025580;
	Tue, 8 Nov 2022 04:01:58 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3kpcqfh3sk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 08 Nov 2022 04:01:58 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A841vcg022774;
	Tue, 8 Nov 2022 04:01:58 GMT
Received: from ca-mkp.mkp.ca.oracle.com (ca-mkp.ca.oracle.com [10.156.108.201])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 3kpcqfh3s5-2;
	Tue, 08 Nov 2022 04:01:58 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: Brian King <brking@linux.vnet.ibm.com>, tyreld@linux.ibm.com
Subject: Re: [PATCH] ibmvfc: Avoid path failures during live migration
Date: Mon,  7 Nov 2022 23:01:49 -0500
Message-Id: <166787992422.644674.5896898503757774773.b4-ty@oracle.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221026181356.148517-1-brking@linux.vnet.ibm.com>
References: <20221026181356.148517-1-brking@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-07_11,2022-11-07_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=939 adultscore=0 mlxscore=0
 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211080020
X-Proofpoint-ORIG-GUID: ndflzHfDZ1a-tE8DwEItnpEFqd4oi3pT
X-Proofpoint-GUID: ndflzHfDZ1a-tE8DwEItnpEFqd4oi3pT
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-scsi@vger.kernel.org, "Martin K . Petersen" <martin.petersen@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 26 Oct 2022 13:13:56 -0500, Brian King wrote:

> This patch fixes an issue reported when performing a live
> migration when multipath is configured with a short fast
> fail timeout of 5 seconds and also to have no_path_retry
> set to fail. In this scenario, all paths would go into the
> devloss state while the ibmvfc driver went through discovery
> to log back in. On a loaded system, the discovery might
> take longer than 5 seconds, which was resulting in all paths
> being marked failed, which then resulted in a read only filesystem.
> 
> [...]

Applied to 6.1/scsi-fixes, thanks!

[1/1] ibmvfc: Avoid path failures during live migration
      https://git.kernel.org/mkp/scsi/c/62fa3ce05d5d

-- 
Martin K. Petersen	Oracle Linux Engineering
