Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 060F389A853
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Apr 2024 04:00:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=b63C3zjQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VBJTV635xz3vbf
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Apr 2024 13:00:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=b63C3zjQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=martin.petersen@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VBJSm4rD0z3cRc
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Apr 2024 12:59:34 +1100 (AEDT)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 4361PGr9029826;
	Sat, 6 Apr 2024 01:59:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2023-11-20;
 bh=Ymt66t5+YIavFVv0FGiiBYsKSl9/10gOmRtAWtzKMyE=;
 b=b63C3zjQrQRovzPL7PwlvrUh1+OjEgWop3dtkvor+1TRNM+FnUhgTs9zHUcSJjG/Dj6d
 CQIKra1dAW3SbaHriBFuWMjc0/v2kGjlRwQgszcl8fvZtyn79PBo6I4Xrw4tAVNuayqZ
 49VLEQlqKsZ139V6Nx0/XfnSn/N8WM8zT3FWbmbEDhAp+1psj5H3oQLDaqmwt7295+J7
 nqXay+1Zg9meQHmvytz5lnw+VFs5sAVLGyFri8BalR1pBaKrAbZ1bPxHmmsWlv9+MDd1
 nyFySHEFVhJq49vUaVRnpnZHpNJ5o8ISEapNfNld9JcYOXvN6GnUalN3lB+3oVSUBDDN MA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3x9f8pcjgw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 06 Apr 2024 01:59:03 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 4361XVc7032539;
	Sat, 6 Apr 2024 01:58:53 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3xavu3req8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 06 Apr 2024 01:58:52 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4361wqvX000912;
	Sat, 6 Apr 2024 01:58:52 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 3xavu3repx-1;
	Sat, 06 Apr 2024 01:58:52 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: dgilbert@interlog.com, Alexander Wetzel <Alexander@wetzel-home.de>
Subject: Re: [PATCH v3] scsi: sg: Avoid race in error handling & drop bogus warn
Date: Fri,  5 Apr 2024 21:58:31 -0400
Message-ID: <171236847468.2627662.5342437444989311589.b4-ty@oracle.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240401191038.18359-1-Alexander@wetzel-home.de>
References: <81266270-42F4-48F9-9139-8F0C3F0A6553@linux.ibm.com> <20240401191038.18359-1-Alexander@wetzel-home.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-06_01,2024-04-05_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=0
 bulkscore=0 mlxlogscore=910 mlxscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404060013
X-Proofpoint-GUID: WOkGEMOPl6xZ0LzTGvGh84Dz-bTeT92j
X-Proofpoint-ORIG-GUID: WOkGEMOPl6xZ0LzTGvGh84Dz-bTeT92j
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
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, gregkh@linuxfoundation.org, stable@vger.kernel.org, sachinp@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, bvanassche@acm.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 01 Apr 2024 21:10:38 +0200, Alexander Wetzel wrote:

> commit 27f58c04a8f4 ("scsi: sg: Avoid sg device teardown race")
> introduced an incorrect WARN_ON_ONCE() and missed a sequence where
> sg_device_destroy() was used after scsi_device_put().
> 
> sg_device_destroy() is accessing the parent scsi_device request_queue which
> will already be set to NULL when the preceding call to scsi_device_put()
> removed the last reference to the parent scsi_device.
> 
> [...]

Applied to 6.9/scsi-fixes, thanks!

[1/1] scsi: sg: Avoid race in error handling & drop bogus warn
      https://git.kernel.org/mkp/scsi/c/d4e655c49f47

-- 
Martin K. Petersen	Oracle Linux Engineering
