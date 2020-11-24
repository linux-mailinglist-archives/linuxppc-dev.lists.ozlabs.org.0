Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C9F2C1E00
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 07:14:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CgDHw55CWzDqSq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 17:14:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=156.151.31.86; helo=userp2130.oracle.com;
 envelope-from=martin.petersen@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=YKZDVTrk; 
 dkim-atps=neutral
X-Greylist: delayed 8032 seconds by postgrey-1.36 at bilbo;
 Tue, 24 Nov 2020 17:12:24 AEDT
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CgDFh6WkvzDqSF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Nov 2020 17:12:24 +1100 (AEDT)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AO3uT0w079281;
 Tue, 24 Nov 2020 03:58:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=bA7CzgRK1lXS7YiO5uGQArtgq38/15OaAjPlpfNXVa4=;
 b=YKZDVTrkPQ+QL6MsFQFXGg8gpsa52kXodr/P7BXImhEyc6s1pb3Nv7CBx2psctAESLAU
 B8Nq5DV8OVoBhOA5zrSXnFqxQ15vYZ7q5+HL4B1CoosrLs/KYP/ZdLFQL2YYzFErpc4E
 PrblC9K58c5IieniXQ9zKgO+I13U4ukUxSjMGC4zhEMA2cvVVLZqYK0LVkrUe2U3kgrK
 fEPWveN2iX5SKlpc5fnUG1tgpMUCH1UkifKmieMcxtCu5nub9ncG74VCa6CCtwh/s+ku
 ai46SI6qrJR2+Bfr8lHtGSpR4SQcg+GZ+NB1cetpKJxCTPx3OGcMrND0T9b9pH8sVbAD fA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 34xtaqkykx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 24 Nov 2020 03:58:23 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AO3ssEH115654;
 Tue, 24 Nov 2020 03:58:23 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 34yctvu0wk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 Nov 2020 03:58:23 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0AO3wLV0006685;
 Tue, 24 Nov 2020 03:58:21 GMT
Received: from ca-mkp.ca.oracle.com (/10.156.108.201)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 23 Nov 2020 19:58:20 -0800
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: james.bottomley@hansenpartnership.com,
 Tyrel Datwyler <tyreld@linux.ibm.com>
Subject: Re: [PATCH v3 0/6] ibmvfc: Protocol definition updates and new
 targetWWPN Support
Date: Mon, 23 Nov 2020 22:58:09 -0500
Message-Id: <160618683552.24173.5839850324071459334.b4-ty@oracle.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201118011104.296999-1-tyreld@linux.ibm.com>
References: <20201118011104.296999-1-tyreld@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9814
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0
 malwarescore=0 spamscore=0 phishscore=0 mlxlogscore=999 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011240021
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9814
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 phishscore=0
 mlxlogscore=999 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011240021
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
 linux-kernel@vger.kernel.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 17 Nov 2020 19:10:58 -0600, Tyrel Datwyler wrote:

> Several Management Datagrams (MADs) have been reversioned to add a targetWWPN
> field that is intended to better identify a target over in place of the scsi_id.
> This patchset adds the new protocol definitions and implements support for using
> the new targetWWPN field and exposing the capability to the VIOS. This
> targetWWPN support is a prerequisuite for upcoming channelization/MQ support.
> 
> changes in v3:
> * addressed field naming consistency in Patches 2 & 5 in response to [brking]
> * fixed commit log typos
> * fixed bad rebase of Patch 4 such that it now compiles
> 
> [...]

Applied to 5.11/scsi-queue, thanks!

[1/6] scsi: ibmvfc: Deduplicate common ibmvfc_cmd init code
      https://git.kernel.org/mkp/scsi/c/fad74a1be2db
[2/6] scsi: ibmvfc: Add new fields for version 2 of several MADs
      https://git.kernel.org/mkp/scsi/c/c16b8a6d8af1
[3/6] scsi: ibmvfc: Add helper for testing capability flags
      https://git.kernel.org/mkp/scsi/c/a318c2b71cce
[4/6] scsi: ibmvfc: Add FC payload retrieval routines for versioned vfcFrames
      https://git.kernel.org/mkp/scsi/c/5a9d16f71c26
[5/6] scsi: ibmvfc: Add support for target_wwpn field in v2 MADs and vfcFrame
      https://git.kernel.org/mkp/scsi/c/ebc7c74bd2dc
[6/6] scsi: ibmvfc: Advertise client support for targetWWPN using v2 commands
      https://git.kernel.org/mkp/scsi/c/e4af87b7079e

-- 
Martin K. Petersen	Oracle Linux Engineering
