Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 941914024B4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Sep 2021 09:50:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H3cqv3s43z2yX8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Sep 2021 17:50:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cAvh6O1j;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=schnelle@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=cAvh6O1j; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H3cq52Bxqz2xfP
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Sep 2021 17:49:20 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1877YDaJ150443; Tue, 7 Sep 2021 03:49:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=WJWyf84RAX/0ZkWwXIUGLHrz9cHuR/afqYqiTEBsuKA=;
 b=cAvh6O1jVkmxvWAt9LNPpQBui1Q1dXL4JRPbVLyUIt3rrT31sZ8BMoi3kBRWvXZnM4Q/
 jhEdtQTzNm+WvLV1/ewm8kwRii8DZF3oKs/L8p8iXSjThysX0me52Z5Iw3cCRk+Y7jF/
 T8AKlX3ifTKUv+MjaT7w3nUHTBHCapwN9cgJYxuYNGZAU0ePdqyTj0+5x6DBuTh0chyZ
 jc1hddbmoF2d6WVy4U2JYvSWguaQRDNp7UF/7PoFQa3U3z3n/X3U3WYoo7AcSc7beUHA
 SI5MLnT67xY71QkTQz/acDmkvWtuKg16wNEhgmNPtM8nefiWMP10EdsrHZnoAWwneo0u Fg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ax3qsrdgd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Sep 2021 03:49:15 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1877aw42158665;
 Tue, 7 Sep 2021 03:49:15 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ax3qsrdg3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Sep 2021 03:49:15 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1877ltNG019758;
 Tue, 7 Sep 2021 07:49:13 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma01fra.de.ibm.com with ESMTP id 3av0e9jx2f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Sep 2021 07:49:13 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1877nAUV44106174
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Sep 2021 07:49:10 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0143452050;
 Tue,  7 Sep 2021 07:49:10 +0000 (GMT)
Received: from sig-9-145-36-222.uk.ibm.com (unknown [9.145.36.222])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 89B9A52059;
 Tue,  7 Sep 2021 07:49:09 +0000 (GMT)
Message-ID: <bddf2d1867585427680cb093cb10d5d15d7aa8d3.camel@linux.ibm.com>
Subject: Re: [PATCH 0/5] s390/pci: automatic error recovery
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: linasvepstas@gmail.com
Date: Tue, 07 Sep 2021 09:49:09 +0200
In-Reply-To: <CAHrUA34TK6U4TB34FHejott9TdFvSgAedOpmro-Uj2ZwnvzecQ@mail.gmail.com>
References: <20210906094927.524106-1-schnelle@linux.ibm.com>
 <CAHrUA34TK6U4TB34FHejott9TdFvSgAedOpmro-Uj2ZwnvzecQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: C0aRTjjmQNKpk3SN8yudqLi9VZzVvfpX
X-Proofpoint-ORIG-GUID: pjkFZ4ivwDdWIA9TGUakMx88a4X8WhVD
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-07_02:2021-09-03,
 2021-09-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2108310000 definitions=main-2109070049
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
Cc: linux-s390@vger.kernel.org, Pierre Morel <pmorel@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2021-09-06 at 21:05 -0500, Linas Vepstas wrote:
> On Mon, Sep 6, 2021 at 4:49 AM Niklas Schnelle <schnelle@linux.ibm.com>
> wrote:
> 
> >  I believe we might be the first
> > implementation of PCI device recovery in a virtualized setting requiring
> > us to
> > coordinate the device reset with the hypervisor platform by issuing a
> > disable
> > and re-enable to the platform as well as starting the recovery following
> > a platform event.
> > 
> 
> I recall none of the details, but SRIOV is a standardized system for
> sharing a PCI device across multiple virtual machines. It has detailed info
> on what the hypervisor must do, and what the local OS instance must do to
> accomplish this.  

Yes and in fact on s390 we make heavy use of SR-IOV.

> It's part of the PCI standard, and its more than a decade
> old now, maybe two. Being a part of the PCI standard, it was interoperable
> with error recovery, to the best of my recollection. 

Maybe I worded things with a bit too much sensationalism and it might
even be that POWER supports error recovery also with virtualization,
though I'm not sure how far that goes.

I believe you are right in that SR-IOV supports the error recovery,
after all this patch set also has to work together with SRIOV enabled
devices. At least on s390 though until this patch set the error
recovery performed by the hypervisor stopped in the hypervisor.

The missing part added by this patch set is coordinating with device
drivers in Linux to determine where use of a recovered device can pick
up after the PCIe level error recovery is done.

As for virtualization this coordination of course needs to cross the
hypervisor/guest boundary and at least for KVM+QEMU I know for a fact
that reporting a PCI error to the guest is currently just a stub that
actually completely stops the guest, so you definitely don't get smooth
error recovery there yet.

> At the time it was
> introduced, it got pushed very aggressively.  The x86 hypervisor vendors
> were aiming at the heart of zseries, and were militant about it.

And yet we're still here, use SR-IOV ourselves and even support Linux +
KVM as a hypervisor you can use just the same on a mainframe, an x86,
POWER, or ARM system.

> 
> -- Linas
> 

