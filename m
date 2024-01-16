Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5A682FAC0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jan 2024 22:40:06 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pBCDyTAq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TF2V33s78z3c40
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jan 2024 08:39:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pBCDyTAq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TF2T82G3gz2xgp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jan 2024 08:39:07 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40GLbCeX011034;
	Tue, 16 Jan 2024 21:38:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=C34bD3H/UW2o8lGJiE4Kl6JTQHvAgZThBzA+i3EkQj4=;
 b=pBCDyTAqmIHQUh+WookDoNH+IaXDelj8E17v4vrqhzDtkWmm7/W79f09VlO9RLAGsyDQ
 5XpT7BzXBzTjat8kOoLEtQhpr9KxbD+064D4h/Kv3zpIGju3wjpHoQsaR04CV45RsRLy
 mwDHnngbbdsjZJ4GoMXL9UeYcBYBpvvlqNYzpes9ouanXZZFKZJLU+y4Zn4mjexMEeC+
 J+JXb79X5lSv/4+BxOa9PQ1axgPBcfkRayp9wEdkfHZwtntkgxQ7MPF8hm3dI4B22KDu
 v1d0B+0w3llpJDEop1ib9yzyU1dw11yK3m8mXS4fZ3V3FytdkvKZTAW6yspngS4k46S2 ug== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vp1vcg1jp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jan 2024 21:38:51 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40GLcDTF016360;
	Tue, 16 Jan 2024 21:38:51 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vp1vcg1hs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jan 2024 21:38:51 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 40GJ6ONT023421;
	Tue, 16 Jan 2024 21:38:49 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3vm6bkh59q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jan 2024 21:38:49 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 40GLcmas66912726
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Jan 2024 21:38:49 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A30145804B;
	Tue, 16 Jan 2024 21:38:48 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8250858055;
	Tue, 16 Jan 2024 21:38:47 +0000 (GMT)
Received: from [9.61.126.152] (unknown [9.61.126.152])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 16 Jan 2024 21:38:47 +0000 (GMT)
Message-ID: <92007644-72e3-4312-b9e9-e93e5142e090@linux.ibm.com>
Date: Tue, 16 Jan 2024 13:38:46 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 25/42] drivers/scsi/ibmvscsi: Convert snprintf to
 sysfs_emit
Content-Language: en-US
To: Li Zhijian <lizhijian@fujitsu.com>, linux-kernel@vger.kernel.org
References: <20240116041129.3937800-1-lizhijian@fujitsu.com>
 <20240116045151.3940401-1-lizhijian@fujitsu.com>
 <20240116045151.3940401-23-lizhijian@fujitsu.com>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
In-Reply-To: <20240116045151.3940401-23-lizhijian@fujitsu.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: T9F9F6QalnDwMMGJCSEfB4HU9ZM759gq
X-Proofpoint-ORIG-GUID: s4AnZKTFZA-kPfDCUxWgqMxp7_K2Rqb-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-16_12,2024-01-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 mlxlogscore=888 clxscore=1011 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401160170
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
Cc: linux-scsi@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/15/24 20:51, Li Zhijian wrote:
> Per filesystems/sysfs.rst, show() should only use sysfs_emit()
> or sysfs_emit_at() when formatting the value to be returned to user space.
> 
> coccinelle complains that there are still a couple of functions that use
> snprintf(). Convert them to sysfs_emit().
> 
>> ./drivers/scsi/ibmvscsi/ibmvfc.c:3483:8-16: WARNING: please use sysfs_emit
>> ./drivers/scsi/ibmvscsi/ibmvfc.c:3493:8-16: WARNING: please use sysfs_emit
>> ./drivers/scsi/ibmvscsi/ibmvfc.c:3503:8-16: WARNING: please use sysfs_emit
>> ./drivers/scsi/ibmvscsi/ibmvfc.c:3513:8-16: WARNING: please use sysfs_emit
>> ./drivers/scsi/ibmvscsi/ibmvfc.c:3522:8-16: WARNING: please use sysfs_emit
>> ./drivers/scsi/ibmvscsi/ibmvfc.c:3530:8-16: WARNING: please use sysfs_emit
> 
> No functional change intended
> 
> CC: Tyrel Datwyler <tyreld@linux.ibm.com>
> CC: Michael Ellerman <mpe@ellerman.id.au>
> CC: Nicholas Piggin <npiggin@gmail.com>
> CC: Christophe Leroy <christophe.leroy@csgroup.eu>
> CC: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
> CC: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
> CC: "James E.J. Bottomley" <jejb@linux.ibm.com>
> CC: "Martin K. Petersen" <martin.petersen@oracle.com>
> CC: linux-scsi@vger.kernel.org
> CC: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Li Zhijian <lizhijian@fujitsu.com>
> ---

Acked-by: Tyrel Datwyler <tyreld@linux.ibm.com>

