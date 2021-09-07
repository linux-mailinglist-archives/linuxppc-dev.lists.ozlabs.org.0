Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E9A4024F0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Sep 2021 10:15:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H3dPc0bGLz2yNC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Sep 2021 18:15:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=izUYESbi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=schnelle@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=izUYESbi; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H3dNs5v3gz2xXS
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Sep 2021 18:15:09 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1878323B057385; Tue, 7 Sep 2021 04:15:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=NJlAWd2ZoDnMVS3u4vbcylYowczJek5eRBYRxN05iAY=;
 b=izUYESbiYUTeSN1Eep9hvZ7Ci4iYKjL6Ogb0ZuIqIgo0YsPoAF3UWqHea2yuq6R8omSp
 ETiMEfgcwP/XeYiToDLhmdqty7MwRBiDlA/4495mZWxjAhcxoaD71G9rQfp5IisjLdXi
 2jrmGSbMSiIBZIAASqRL3LRnq7gPY0QU4ulvLhXHkB99muEmWAQCFY1PRtI/v7zOTxH2
 l1avNB6b5YUfwodopnSF2V+d9ewKMTKzs0ABqPa+LIc1M6ThXdvvG8FhyymddJ9EEAeX
 JUJZp3ALb6fMZw0ZwxoQUI4jTtoPntV3f15OCSs4LP7wrvfteMgm/Yg6urcY2wnO4+Gm GQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ax0p3mqch-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Sep 2021 04:15:03 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18784Kic064280;
 Tue, 7 Sep 2021 04:15:02 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ax0p3mqbj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Sep 2021 04:15:02 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1878CEpF026961;
 Tue, 7 Sep 2021 08:15:00 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06fra.de.ibm.com with ESMTP id 3av02jb8cm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Sep 2021 08:15:00 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1878EtJR44040692
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Sep 2021 08:14:55 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4ED2F4C044;
 Tue,  7 Sep 2021 08:14:55 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ADCF74C05E;
 Tue,  7 Sep 2021 08:14:54 +0000 (GMT)
Received: from sig-9-145-36-222.uk.ibm.com (unknown [9.145.36.222])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  7 Sep 2021 08:14:54 +0000 (GMT)
Message-ID: <644a0e6f802f25e760e29b2047861b1141c32a6f.camel@linux.ibm.com>
Subject: Re: [PATCH 3/5] PCI: Move pci_dev_is/assign_added() to pci.h
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>, kernel test robot
 <lkp@intel.com>
Date: Tue, 07 Sep 2021 10:14:54 +0200
In-Reply-To: <CAHp75VeiWH0MoAchctDES7zLk4Q9NwODu=O2y-NYOsu3SBeimg@mail.gmail.com>
References: <20210906094927.524106-4-schnelle@linux.ibm.com>
 <202109070818.aHlo0OT9-lkp@intel.com>
 <CAHp75VeiWH0MoAchctDES7zLk4Q9NwODu=O2y-NYOsu3SBeimg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: f8PGt5Ha2Ilwpn9v2PDBQYDCRwE0apW4
X-Proofpoint-ORIG-GUID: 7XufGAcG5COEYj8eCR8GxJa5gc1nlLXA
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-07_02:2021-09-03,
 2021-09-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 malwarescore=0 priorityscore=1501
 mlxscore=0 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0
 adultscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2108310000 definitions=main-2109070053
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
Cc: linux-s390@vger.kernel.org, kbuild-all@lists.01.org,
 Pierre Morel <pmorel@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bjorn Helgaas <helgaas@kernel.org>, Oliver O'Halloran <oohall@gmail.com>,
 Linas Vepstas <linasvepstas@gmail.com>, "open list:LINUX FOR POWERPC PA SEMI
 PWRFICIENT" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2021-09-07 at 10:51 +0300, Andy Shevchenko wrote:
> On Tue, Sep 7, 2021 at 3:26 AM kernel test robot <lkp@intel.com> wrote:
> > Hi Niklas,
> > 
> > I love your patch! Yet something to improve:
> > 
> > [auto build test ERROR on s390/features]
> > [also build test ERROR on next-20210906]
> > [cannot apply to pci/next powerpc/next v5.14]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch]
> > 
> > url:    https://github.com/0day-ci/linux/commits/Niklas-Schnelle/s390-pci-automatic-error-recovery/20210906-175309
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git features
> > config: i386-allyesconfig (attached as .config)
> > compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> > reproduce (this is a W=1 build):
> >         # https://github.com/0day-ci/linux/commit/404ed8c00a612e7ae31c50557c80c6726c464863
> >         git remote add linux-review https://github.com/0day-ci/linux
> >         git fetch --no-tags linux-review Niklas-Schnelle/s390-pci-automatic-error-recovery/20210906-175309
> >         git checkout 404ed8c00a612e7ae31c50557c80c6726c464863
> >         # save the attached .config to linux build tree
> >         make W=1 ARCH=i386
> > 
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> > 
> > All errors (new ones prefixed by >>):
> 
> Obviously drivers/pci/pci.h is not only for the above.
> 
> When play with headers always do two test builds: allyesconfig and allmodconfig.

You're right and additionally have to built on some other architectures
as well because allyesconfig and allmodconfig both run through fine on
s390. 

I'll look into it but at first glance it looks like I was over reaching
removing the include from drivers/pci/hotplug/acpiphp_glue.c in
addition it's not even the same kind of awkward relative include from
drivers into arch code. Sorry about that.

> 

