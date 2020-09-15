Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AC126AE94
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Sep 2020 22:18:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BrZL43rcNzDqTq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Sep 2020 06:18:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=141.146.126.78; helo=aserp2120.oracle.com;
 envelope-from=martin.petersen@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=S0rAsk6M; 
 dkim-atps=neutral
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BrZJT3xL4zDqJ8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Sep 2020 06:16:57 +1000 (AEST)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08FK8pvU130516;
 Tue, 15 Sep 2020 20:16:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=4VJNpmxVNDN5wjzmgpUrkHttEoFQWByhbcWmaEr2E9E=;
 b=S0rAsk6MkQvpLvqZxDZGDGBVyHZxZ45MQGqC3ZL3NXbg2qmS5IMcTc/Se+gtKsTxfyE3
 /rIuvO4FzN35VcbZH/Ab9dsGTxvZxw1dHCQnpYdXYoMoRpUKRIj4ZdnCpihOGYgm1Ilx
 uJgK9qQqzIm3ro5bTAp6Gr0CYefHLoYD2p/32YNTakw7EaQFsFyFroAIBLSfrQOqapDm
 XdWayKcwS5GLxQNLUsQ9vnHWnXTfcxI0kJNyV8/a6Tl+Jw4fGSWHOw1913q4WmTzHH5g
 xGfw/opDC3myVjp1H67NfphvwuykmCcxhWpr6i02mcwl9WrQat4HbJTxGKf/RZzgwSpR Kw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 33gp9m7crg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 15 Sep 2020 20:16:44 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08FKFvZW127285;
 Tue, 15 Sep 2020 20:16:44 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 33h7wppqgw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Sep 2020 20:16:44 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 08FKGe65006678;
 Tue, 15 Sep 2020 20:16:42 GMT
Received: from ca-mkp.ca.oracle.com (/10.156.108.201)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 15 Sep 2020 20:16:40 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: mpe@ellerman.id.au, benh@kernel.crashing.org,
 Jing Xiangfeng <jingxiangfeng@huawei.com>, jejb@linux.ibm.com,
 paulus@samba.org, tyreld@linux.ibm.com
Subject: Re: [PATCH] scsi: ibmvfc: Fix error return in ibmvfc_probe()
Date: Tue, 15 Sep 2020 16:16:25 -0400
Message-Id: <160020074003.8134.8833608146338864897.b4-ty@oracle.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200907083949.154251-1-jingxiangfeng@huawei.com>
References: <20200907083949.154251-1-jingxiangfeng@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9745
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 adultscore=0 bulkscore=0 phishscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009150158
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9745
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999
 adultscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009150157
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 7 Sep 2020 16:39:49 +0800, Jing Xiangfeng wrote:

> Fix to return error code PTR_ERR() from the error handling case instead
> of 0.

Applied to 5.10/scsi-queue, thanks!

[1/1] scsi: ibmvfc: Fix error return in ibmvfc_probe()
      https://git.kernel.org/mkp/scsi/c/5e48a084f4e8

-- 
Martin K. Petersen	Oracle Linux Engineering
