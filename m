Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBF41E3569
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 May 2020 04:17:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Wvbt1CjwzDqMb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 May 2020 12:17:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=141.146.126.78; helo=aserp2120.oracle.com;
 envelope-from=martin.petersen@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=Eq7DojNk; 
 dkim-atps=neutral
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49WvZ05F81zDqMd
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 May 2020 12:15:36 +1000 (AEST)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04R2CG3B164773;
 Wed, 27 May 2020 02:15:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=MqULAj01s9YSmfQw1XZDibEVqDfuEjqW9z/5tdJLuPU=;
 b=Eq7DojNkqs6A1QHVKAmsdBvNn3rWfSjdWCFZAAk09KS0aGWl6MNMyjHrFyk5UG96YetE
 fVSB7quc2xf5FCksFKI6Xy2bUCQ4jLtiiQBSO3G6tlAGtaUbi0fAUv8+l4G6IIFE9ZqW
 HxLD0VbMJ2GpWg9exWPNOpFy2z1i3F17Qav6+mjCrngltULR+u1lDUp19EQBbIhQ6Vj1
 ++Gx1a/DW/2/hrMqGh3NKMeLiT2S2QlTpGP6/ccNFS3hYTNHXCh9FRdaOqi6imWnmO7H
 6WC1PruhUqB0yvQ/ncNwG1VLRyN83HmbSOt/0ji7EFbZ4ROHyv7oXN55eaxGJE4i0ik2 Eg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 318xe1cy10-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 27 May 2020 02:15:16 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04R27Yti189931;
 Wed, 27 May 2020 02:13:15 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 317dkthegk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 May 2020 02:13:15 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 04R2D7Ds020379;
 Wed, 27 May 2020 02:13:07 GMT
Received: from ca-mkp.ca.oracle.com (/10.156.108.201)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 26 May 2020 19:13:07 -0700
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: jejb@linux.ibm.com, Chen Tao <chentao107@huawei.com>
Subject: Re: [PATCH -next] scsi: ibmvscsi: Make some functions static
Date: Tue, 26 May 2020 22:12:53 -0400
Message-Id: <159054550935.12032.15244972147913175088.b4-ty@oracle.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200520091036.247286-1-chentao107@huawei.com>
References: <20200520091036.247286-1-chentao107@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9633
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0 bulkscore=0
 spamscore=0 suspectscore=0 mlxscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005270012
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9633
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999
 adultscore=0 cotscore=-2147483648 mlxscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1011 impostorscore=0 suspectscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005270013
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
Cc: tyreld@linux.ibm.com, "Martin K . Petersen" <martin.petersen@oracle.com>,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, paulus@samba.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 20 May 2020 17:10:36 +0800, Chen Tao wrote:

> Fix the following warning:
> 
> drivers/scsi/ibmvscsi/ibmvscsi.c:2387:12: warning: symbol
> 'ibmvscsi_module_init' was not declared. Should it be static?
> drivers/scsi/ibmvscsi/ibmvscsi.c:2409:13: warning: symbol
> 'ibmvscsi_module_exit' was not declared. Should it be static?

Applied to 5.8/scsi-queue, thanks!

[1/1] scsi: ibmvscsi: Make some functions static
      https://git.kernel.org/mkp/scsi/c/1f93ad177d24

-- 
Martin K. Petersen	Oracle Linux Engineering
