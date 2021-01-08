Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9232EEC6E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Jan 2021 05:22:42 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DBqhH5CCnzDqMw
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Jan 2021 15:22:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=156.151.31.86; helo=userp2130.oracle.com;
 envelope-from=martin.petersen@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=mUALdhUi; 
 dkim-atps=neutral
X-Greylist: delayed 2346 seconds by postgrey-1.36 at bilbo;
 Fri, 08 Jan 2021 15:20:10 AEDT
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DBqdQ73hxzDqqW
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Jan 2021 15:20:10 +1100 (AEDT)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1084A72P106543;
 Fri, 8 Jan 2021 04:20:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=D8QYOeQGXSvAjNKY8pJROHJxHIla8RMRGjNlXk1LD30=;
 b=mUALdhUikHSxGR4nrlgP8mr/ZuYXmE12KLJG1OC+eT0h6RuhDjh5O89REmI9cu/1zeI0
 x2LOeAUBwK8FostLfmv+Achp66ewhKwpoH12RNE9nDZbnSIqHRIVH8FJscOOoNVi8naX
 yKDtP7BpyUAXt993WRIQXT5smtNNaVdUlyoNwo3f7VH02s+EG9p5/N6iS+DH2Gn+H69h
 QCN97WkX2V9wQ+WOG+3isMQhHlIUSZH0pj0buptXDfTJmQyLZ48CkMrxDy2v9I+diY1M
 /RnqL6mxeUkZqeUcCgRHXHwkcoesxR2pO4O23Q2hiHZr1JJsIKpwWAEcKcsCRrMhRO8+ GQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 35wftxeyte-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 08 Jan 2021 04:20:02 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10849SPe170611;
 Fri, 8 Jan 2021 04:20:01 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 35w3g3r4rg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 08 Jan 2021 04:20:01 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 1084Jv6I031018;
 Fri, 8 Jan 2021 04:20:00 GMT
Received: from ca-mkp.ca.oracle.com (/10.156.108.201)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 07 Jan 2021 20:19:56 -0800
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: Tyrel Datwyler <tyreld@linux.ibm.com>,
 james.bottomley@hansenpartnership.com
Subject: Re: [PATCH] ibmvfc: fix missing cast of ibmvfc_event pointer to u64
 handle
Date: Thu,  7 Jan 2021 23:19:41 -0500
Message-Id: <161007949340.9892.9443484467279726588.b4-ty@oracle.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210106203721.1054693-1-tyreld@linux.ibm.com>
References: <20210106203721.1054693-1-tyreld@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9857
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101080021
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9857
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 suspectscore=0 mlxscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101080021
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
Cc: kernel test robot <lkp@intel.com>, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>, brking@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 6 Jan 2021 14:37:21 -0600, Tyrel Datwyler wrote:

> Commit 2aa0102c6688 ("scsi: ibmvfc: Use correlation token to tag
> commands") sets the vfcFrame correlation token to the pointer handle of
> the associated ibmvfc_event. However, that commit failed to cast the
> pointer to an appropriate type which in this case is a u64. As such
> sparse warnings are generated for both correlation token assignments.
> 
>  ibmvfc.c:2375:36: sparse: incorrect type in argument 1 (different base types)
>  ibmvfc.c:2375:36: sparse: expected unsigned long long [usertype] val
>  ibmvfc.c:2375:36: sparse: got struct ibmvfc_event *[assigned] evt
> 
> [...]

Applied to 5.11/scsi-fixes, thanks!

[1/1] ibmvfc: fix missing cast of ibmvfc_event pointer to u64 handle
      https://git.kernel.org/mkp/scsi/c/901d01c8e50c

-- 
Martin K. Petersen	Oracle Linux Engineering
