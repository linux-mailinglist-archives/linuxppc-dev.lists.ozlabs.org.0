Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 252403555C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2019 04:41:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45JY2N4V2JzDqVL
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2019 12:41:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=oracle.com
 (client-ip=156.151.31.85; helo=userp2120.oracle.com;
 envelope-from=martin.petersen@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.b="l/5PCHpN"; 
 dkim-atps=neutral
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45JY0c4FTFzDq6B
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jun 2019 12:39:44 +1000 (AEST)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x552XZTP048759;
 Wed, 5 Jun 2019 02:39:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=to : cc : subject :
 from : references : date : in-reply-to : message-id : mime-version :
 content-type; s=corp-2018-07-02;
 bh=z/la0Iaw8QvvEtAdeZ/2XourCSKmrS+ERTV018zk7cI=;
 b=l/5PCHpNUqUOkOl1KntQONU3PjFaETgfVfGLnBhy2cbt8wcY4T7Kl0nXn3uAorPiiSUO
 E0vga1hS/A1bmyi7LS3gePe/QahKsvyCnZAKp6BZbWejVqyiRm5hkCS2//YGNsBAvD3/
 LeRw+su+tsvRP+FnYyVwIBsYdktkBT/cG06q+wW0bO8lU8y+AHmmW4EdLbBeN5xdgryM
 LBxOUYSOP2yguCUAW/wkOPYY/4/xJqC+UzBMBaIi7pqAkWCTJsI1SzDV6Pxv1RMuK200
 QrSZ+5X2oAh7LoBWGy6lsKmtv23yvQeezAZTiyvwWum8eeTbms7/OpT0kHjx1ymEGgmK eQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 2suj0qg94t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 05 Jun 2019 02:39:26 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x552c2SX145348;
 Wed, 5 Jun 2019 02:39:25 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 2swnghp1kn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 05 Jun 2019 02:39:25 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x552dM0N020688;
 Wed, 5 Jun 2019 02:39:22 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 04 Jun 2019 19:39:22 -0700
To: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH v3] scsi: ibmvscsi: Don't use rc uninitialized in
 ibmvscsi_do_work
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
References: <20190603221941.65432-1-natechancellor@gmail.com>
 <20190603234405.29600-1-natechancellor@gmail.com>
Date: Tue, 04 Jun 2019 22:39:19 -0400
In-Reply-To: <20190603234405.29600-1-natechancellor@gmail.com> (Nathan
 Chancellor's message of "Mon, 3 Jun 2019 16:44:06 -0700")
Message-ID: <yq1ef48rc14.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.92 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9278
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=773
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906050014
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9278
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=814 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906050014
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Nathan,

> clang warns:
>
> drivers/scsi/ibmvscsi/ibmvscsi.c:2126:7: warning: variable 'rc' is used
> uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
>         case IBMVSCSI_HOST_ACTION_NONE:
>              ^~~~~~~~~~~~~~~~~~~~~~~~~

Applied to 5.3/scsi-queue, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
