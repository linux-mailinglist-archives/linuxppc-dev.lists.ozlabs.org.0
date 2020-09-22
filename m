Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4592739E9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Sep 2020 06:42:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwTDz2642zDqxf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Sep 2020 14:42:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=141.146.126.79; helo=aserp2130.oracle.com;
 envelope-from=martin.petersen@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=0XuuFojM; 
 dkim-atps=neutral
X-Greylist: delayed 2564 seconds by postgrey-1.36 at bilbo;
 Tue, 22 Sep 2020 14:40:03 AEST
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BwTBD0Y9MzDqwb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Sep 2020 14:40:03 +1000 (AEST)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08M3pMeX150450;
 Tue, 22 Sep 2020 03:57:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=rkCUICwTiCLmYuB8pRnMzz0BfQUpVvjjkbOHd/S2IxE=;
 b=0XuuFojM+iTfAEOci9KYKk3WDUAAAPXT0qXcM2u6gZAuEgm2y6vl4PEcCtH4gv0Mv/oj
 HbbgIBVacdecPNGLtvXbM3mcej6Wz6tG4dWwiLurkr0eoWRzRILcC66QgJIyLClUz3RC
 /qvq5Txjsp63pa+zNzDRYL514cnJJcWTW/FoHnuxIdcrm1HavW83qBpsyjwrbkXwm9Ud
 Q49MXLEaqOnGbR/IG/E5a2wvzq+zXYp18h06x+4+GBQFpgE9YIQSOlIC+GEMGYGbqbvS
 mkZ336+NernARDXqyS17ViMgNpmh2NIq9vuOi0psKAUGycv6yj0qr2R4NQ8DSKfWaWXP OA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 33n7gad5su-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 22 Sep 2020 03:57:15 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08M3uIqG149722;
 Tue, 22 Sep 2020 03:57:15 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 33nujmm8nc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Sep 2020 03:57:15 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 08M3vEZV009427;
 Tue, 22 Sep 2020 03:57:14 GMT
Received: from ca-mkp.ca.oracle.com (/10.156.108.201)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 21 Sep 2020 20:57:14 -0700
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: linux-scsi@vger.kernel.org, Brian King <brking@linux.vnet.ibm.com>
Subject: Re: [PATCH] ibmvfc: Avoid link down on FS9100 canister reboot
Date: Mon, 21 Sep 2020 23:56:46 -0400
Message-Id: <160074695010.411.14254291995056487409.b4-ty@oracle.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <1599859706-8505-1-git-send-email-brking@linux.vnet.ibm.com>
References: <1599859706-8505-1-git-send-email-brking@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9751
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0
 mlxlogscore=999 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009220031
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9751
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 bulkscore=0
 mlxscore=0 suspectscore=0 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 adultscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009220030
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
Cc: tyreld@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 11 Sep 2020 16:28:26 -0500, Brian King wrote:

> When a canister on a FS9100, or similar storage, running in NPIV mode,
> is rebooted, its WWPNs will fail over to another canister. When this
> occurs, we see a WWPN going away from the fabric at one N-Port ID,
> and, a short time later, the same WWPN appears at a different N-Port ID.
> When the canister is fully operational again, the WWPNs fail back to
> the original canister. If there is any I/O outstanding to the target
> when this occurs, it will result in the implicit logout the ibmvfc driver
> issues before removing the rport to fail. When the WWPN then shows up at a
> different N-Port ID, and we issue a PLOGI to it, the VIOS will
> see that it still has a login for this WWPN at the old N-Port ID,
> which results in the VIOS simulating a link down / link up sequence
> to the client, in order to get the VIOS and client LPAR in sync.
> 
> [...]

Applied to 5.10/scsi-queue, thanks!

[1/1] scsi: ibmvfc: Avoid link down on FS9100 canister reboot
      https://git.kernel.org/mkp/scsi/c/4b29cb6197d9

-- 
Martin K. Petersen	Oracle Linux Engineering
