Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 527818E052
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 00:06:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4683ZT6Gm5zDr0R
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 08:06:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=oracle.com
 (client-ip=141.146.126.78; helo=aserp2120.oracle.com;
 envelope-from=dan.carpenter@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.b="ZbWpJN7E"; 
 dkim-atps=neutral
X-Greylist: delayed 27858 seconds by postgrey-1.36 at bilbo;
 Thu, 15 Aug 2019 08:04:21 AEST
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4683X560yVzDr0v
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2019 08:04:20 +1000 (AEST)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7EEIxcr121624;
 Wed, 14 Aug 2019 14:19:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=ae+YYtL1vgPhLbM0a9S2evjC1FwIggJXIW0M4o4SGyI=;
 b=ZbWpJN7E57uCEuErcNfUc/phFeBdGWKv4R9ZxHVmqM6esvnxsn1TTTYyIXbCGZ+UnITA
 lZNbN5WXD70uPPgZ3Se2Jg16w9RBCLxrn+Z2YAKvcKzjzub3eSA11LJ36a2Ge300CEi7
 liCLfQteJP1THCVbkud2T3KHezjXzPGF/zFA/i38egZ6bDSAUWlCjaZSlOCzzmfIgUGi
 Uuad4CyK1W65wQLKuxCrulgv/lIeXK7K0sI77vAg7w73VnCcOHHP5kSlv7QcZv9702gX
 21BlI8Ufv6eM9yuC4/nxwquR+08X8+1Y72CXFfHI9uy9A3tWV1s8mSx734U3CCACUMhW 6w== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 2u9nvpd85d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Aug 2019 14:19:50 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7EEIiq3168890;
 Wed, 14 Aug 2019 14:19:50 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 2ubwcy2m7h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Aug 2019 14:19:50 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x7EEJhcB022563;
 Wed, 14 Aug 2019 14:19:48 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 14 Aug 2019 07:19:43 -0700
Date: Wed, 14 Aug 2019 17:19:38 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: anton@samba.org
Subject: [bug report] powerpc/iommu: Implement IOMMU pools to improve
 multiqueue adapter performance
Message-ID: <20190814141938.GA587@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9348
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=632
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908140149
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9348
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=682 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908140149
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[ Ancient code.  The warning is correct but the bug seems harmless.
  -- dan ]

Hello Anton Blanchard,

The patch b4c3a8729ae5: "powerpc/iommu: Implement IOMMU pools to
improve multiqueue adapter performance" from Jun 7, 2012, leads to
the following static checker warning:

	arch/powerpc/kernel/iommu.c:377 get_pool()
	warn: array off by one? '*tbl->pools + pool_nr'

arch/powerpc/kernel/iommu.c
   364  static struct iommu_pool *get_pool(struct iommu_table *tbl,
   365                                     unsigned long entry)
   366  {
   367          struct iommu_pool *p;
   368          unsigned long largepool_start = tbl->large_pool.start;
   369  
   370          /* The large pool is the last pool at the top of the table */
   371          if (entry >= largepool_start) {
   372                  p = &tbl->large_pool;
   373          } else {
   374                  unsigned int pool_nr = entry / tbl->poolsize;
   375  
   376                  BUG_ON(pool_nr > tbl->nr_pools);
                                       ^
This should be ">=".  The tbl->nr_pools value is either 1 or
IOMMU_NR_POOLS and the tbl->pools[] array has IOMMU_NR_POOLS elements.

   377                  p = &tbl->pools[pool_nr];
   378          }
   379  
   380          return p;
   381  }

regards,
dan carpenter
