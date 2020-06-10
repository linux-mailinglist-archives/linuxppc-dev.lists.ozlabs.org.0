Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8324C1F4B23
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jun 2020 04:04:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49hVfx2YpmzDqSk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jun 2020 12:04:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=156.151.31.85; helo=userp2120.oracle.com;
 envelope-from=martin.petersen@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=bXQ74eWf; 
 dkim-atps=neutral
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49hVdJ0cHwzDqBH
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jun 2020 12:03:15 +1000 (AEST)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05A231B8103024;
 Wed, 10 Jun 2020 02:03:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=1hWfOTBMKjqR4hWlWXWNcErcYpndu5PUKiMJ3p6ENqI=;
 b=bXQ74eWfn0jKqeZSo/jTHIlg/2e5qwwOMAQOtQt4ZTCYGNaGXRItECxOZXn7lYeX+9Ye
 JZw7H9+jN8FFwXeel4Z1YkE0TmdkAleSpFU1iKgNnnwotHRGV4rb6FapVC2KtYpKus/w
 tO3uQwQrobjyA/zcJuh6u+eJTF4fXR+haN/hFp3FzFXYxE26UDc2QZJQNtgwabMfu7Wh
 H94Mf+B1oShykjwcoGqx4T1fM5KAVr7MpMIQVOu6kfAbMvfO6t3Mu6jliowGc7ep9jox
 2agGcdC6wq/6UHgmV1ys1LEBbBsdrtYFfKpRKtYJTct/TDLympbu2pS7aETuEzB/4215 XQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 31g3smyr28-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 10 Jun 2020 02:03:01 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05A1wORo023499;
 Wed, 10 Jun 2020 02:03:00 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 31gn27gmuv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Jun 2020 02:03:00 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 05A22uHn018492;
 Wed, 10 Jun 2020 02:02:58 GMT
Received: from ca-mkp.ca.oracle.com (/10.156.108.201)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 09 Jun 2020 19:02:56 -0700
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: Tyrel Datwyler <tyreld@linux.ibm.com>,
 james.bottomley@hansenpartnership.com
Subject: Re: [PATCH] ibmvscsi: don't send host info in adapter info MAD after
 LPM
Date: Tue,  9 Jun 2020 22:02:49 -0400
Message-Id: <159175452258.16072.4922835884463672508.b4-ty@oracle.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200603203632.18426-1-tyreld@linux.ibm.com>
References: <20200603203632.18426-1-tyreld@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9647
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 mlxscore=0
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006100013
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9647
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 cotscore=-2147483648 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 phishscore=0 mlxscore=0
 mlxlogscore=999 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006100013
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
Cc: brking@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 linux-scsi@vger.kernel.org, "Martin K . Petersen" <martin.petersen@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 3 Jun 2020 15:36:32 -0500, Tyrel Datwyler wrote:

> The adatper info MAD is used to send the client info and receive the
> host info as a response. A peristent buffer is used and as such the
> client info is overwritten after the response. During the course of
> a normal adapter reset the client info is refreshed in the buffer in
> preparation for sending the adapter info MAD.
> 
> However, in the special case of LPM where we reenable the CRQ instead
> of a full CRQ teardown and reset we fail to refresh the client info in
> the adapter info buffer. As a result after Live Partition Migration
> (LPM) we erroneously report the hosts info as our own.

Applied to 5.8/scsi-queue, thanks!

[1/1] scsi: ibmvscsi: Don't send host info in adapter info MAD after LPM
      https://git.kernel.org/mkp/scsi/c/4919b33b63c8

-- 
Martin K. Petersen	Oracle Linux Engineering
