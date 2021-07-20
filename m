Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AED063CF6DE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jul 2021 11:32:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GTYR84Xn3z3bfW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jul 2021 19:32:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PuM+jJJx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=schnelle@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=PuM+jJJx; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GTYQd1PMhz2yNk
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jul 2021 19:32:24 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16K93FPa058999; Tue, 20 Jul 2021 05:32:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=VvqBj8kh2BXHff8p/+fiTepW+E6Td797KShKOyGEQlg=;
 b=PuM+jJJxzlqLTaIwUTUC0XopPSqh/izQ6u/8bhAgAwYTxIC/Rd9c7QMQnG66FKGnYSSJ
 8PP3beJfKrfTbsCZ4mCYjjzx2dhps92AlCiGu3ozNkee/Zjaw/oyq1YhHPfFNd7tnFYi
 qA5W/KgeRZO0Fe/NLvwxK315pdbuLXTpQ5R2aNR2Jvkeea2d8oWmybjd0uKo0nWjumJB
 NpqbnbT8p4Y4NaSrAewV0Xg48JVclqWyyAvxlknbk3bwW/NSvuWVdPzhuUYBZ5WLERzV
 esRAnyAkFNN47evfZw23dVVfO7JsDpJHwvtVj95U+duykiP3m2hcA3a7xx/+a4T9MlJ1 YA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39wsn8v54j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jul 2021 05:32:21 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16K93c3f060294;
 Tue, 20 Jul 2021 05:32:21 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39wsn8v537-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jul 2021 05:32:20 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16K9RtE3030872;
 Tue, 20 Jul 2021 09:32:18 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma05fra.de.ibm.com with ESMTP id 39upu88pfw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jul 2021 09:32:18 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 16K9TqGg21365156
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Jul 2021 09:29:52 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D0EE611C06C;
 Tue, 20 Jul 2021 09:32:15 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7C3D611C052;
 Tue, 20 Jul 2021 09:32:15 +0000 (GMT)
Received: from sig-9-145-150-42.de.ibm.com (unknown [9.145.150.42])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 20 Jul 2021 09:32:15 +0000 (GMT)
Message-ID: <b7f4c41abdc0f97fabb174a6b0ac9de253311a1e.camel@linux.ibm.com>
Subject: Re: [PATCH] PCI: Move pci_dev_is/assign_added() to pci.h
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Date: Tue, 20 Jul 2021 11:32:15 +0200
In-Reply-To: <bd731ed627344a3a2eaeffabff21d499c4e2c3fd.camel@linux.ibm.com>
References: <20210719121148.2403239-1-schnelle@linux.ibm.com>
 <bd731ed627344a3a2eaeffabff21d499c4e2c3fd.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: VK-TO0wgnO_aBqoPV1kWnO8BNJvNo9ju
X-Proofpoint-ORIG-GUID: X1Hc_WPK26WJLNfakubncAKG74zzrpmF
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-20_04:2021-07-19,
 2021-07-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 mlxlogscore=999
 mlxscore=0 phishscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107200055
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
Cc: linux-arch@vger.kernel.org, linux-pci@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-s390@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2021-07-20 at 10:34 +0200, Niklas Schnelle wrote:
> On Mon, 2021-07-19 at 14:11 +0200, Niklas Schnelle wrote:
> > The helper function pci_dev_is_added() from drivers/pci/pci.h is used in
> > PCI arch code of both s390 and powerpc leading to awkward relative
> > includes. Move it to the global include/linux/pci.h and get rid of these
> > includes just for that one function.
> > 
> > Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
> > ---
> > 
> ... snip ...
> >  
> >  static LIST_HEAD(bridge_list);
> > diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> > index 93dcdd431072..a159cd0f6f05 100644
> > --- a/drivers/pci/pci.h
> > +++ b/drivers/pci/pci.h
> > @@ -383,21 +383,6 @@ static inline bool pci_dev_is_disconnected(const struct pci_dev *dev)
> >  	return dev->error_state == pci_channel_io_perm_failure;
> >  }
> >  
> > -/* pci_dev priv_flags */
> > -#define PCI_DEV_ADDED 0
> > -#define PCI_DPC_RECOVERED 1
> > -#define PCI_DPC_RECOVERING 2
> 
> Sorry, the above two PCI_DPC_* lines should remain in drivers/pci/pci.h
> I messed this up on rebasing to v5.14-rc1 and it didn't lead to
> problems on either s390x defconfig, nor pp64_defconfig but breaks ppc
> allyesconfig. Will resend a fixed version.

Ok looking at this more closely, maybe it would also make sense to move
the PCI_DPC_* flags also to include/linux/pci.h that would also put
them in direct proximity of the priv_flags field decleration itself
which I think also improves maintainability.

> 
> 
> .. snip ..
> 

