Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 408474035E8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Sep 2021 10:10:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H4FDj0Q0qz2yfm
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Sep 2021 18:10:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kNVxlkbD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=schnelle@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=kNVxlkbD; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H4FCv6Jscz2yHD
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Sep 2021 18:09:31 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 188839ae025462; Wed, 8 Sep 2021 04:09:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=+AkS1tHO2xb+Q7+y879BlIe5c4v+6pGuu55sSeuCijI=;
 b=kNVxlkbDSc9Iz7sx1hVT6rAb8SdLASngVlpVspAKIj+DoS2gHa+BK6KVYalYTgyGSxK2
 JpMkbU4V00B03OwVeZYYdfvyIJ1+twhiNK6rCEFfsmS6vi9bOF941tq182b0boNdKkG/
 WBLGJFJeGLaeR44CSJoivsmaKovdo738/XGffkr0lhf3VNlGVek1FYfv8ScPFVyckJ4q
 Hrx3uqymc35u6vCqMdqwB+cqEXpwL6RglUGuHaoe1U0LdzsvGjCp7mLGbseWtH+abSgK
 2JlqQ0uhZpDS9Rg8gqL1SeSNBMd+yX1LkrLAdbG0O1xUArBPDMsL9GM+OTvRKJTQQqdN hQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3axrd49pcv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Sep 2021 04:09:28 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18883Guf025805;
 Wed, 8 Sep 2021 04:09:27 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3axrd49pcj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Sep 2021 04:09:27 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18883NJ8009759;
 Wed, 8 Sep 2021 08:09:26 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 3axcnp5t40-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Sep 2021 08:09:26 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18889MAp56623584
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Sep 2021 08:09:22 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 30DB952054;
 Wed,  8 Sep 2021 08:09:22 +0000 (GMT)
Received: from sig-9-145-80-246.uk.ibm.com (unknown [9.145.80.246])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 9602652057;
 Wed,  8 Sep 2021 08:09:21 +0000 (GMT)
Message-ID: <4a250dadbf8124980b4912389745c9546e2ec431.camel@linux.ibm.com>
Subject: Re: [PATCH 0/5] s390/pci: automatic error recovery
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: "Oliver O'Halloran" <oohall@gmail.com>
Date: Wed, 08 Sep 2021 10:09:21 +0200
In-Reply-To: <CAOSf1CH2T-R44qx1mGpJQ8WgD0upxG8sQNud_5L3SHYZJm9LRA@mail.gmail.com>
References: <20210906094927.524106-1-schnelle@linux.ibm.com>
 <CAOSf1CFyuf9FaeSNparj+7W0mKTPvtcM8vxjHDSFsNDC6k_7xQ@mail.gmail.com>
 <e739c2919f97e277849a1bc1324a20df6a7d59eb.camel@linux.ibm.com>
 <0c9326c943c0e6aa572cc132ee2deb952bf41c7f.camel@linux.ibm.com>
 <CAOSf1CH2T-R44qx1mGpJQ8WgD0upxG8sQNud_5L3SHYZJm9LRA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 1kZhKCXcjOljT9eToHI8NNV7WIpx97bH
X-Proofpoint-ORIG-GUID: uF62vMTNa9WMWmKt-L20QaI7kxqyBpE7
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-08_02:2021-09-07,
 2021-09-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=999
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109080047
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Linas Vepstas <linasvepstas@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2021-09-08 at 11:37 +1000, Oliver O'Halloran wrote:
> On Tue, Sep 7, 2021 at 10:21 PM Niklas Schnelle <schnelle@linux.ibm.com> wrote:
> > On Tue, 2021-09-07 at 10:45 +0200, Niklas Schnelle wrote:
> > > On Tue, 2021-09-07 at 12:04 +1000, Oliver O'Halloran wrote:
> > > > On Mon, Sep 6, 2021 at 7:49 PM Niklas Schnelle <schnelle@linux.ibm.com> wrote:
> > > > > Patch 3 I already sent separately resulting in the discussion below but without
> > > > > a final conclusion.
> > > > > 
> > > > > https://lore.kernel.org/lkml/20210720150145.640727-1-schnelle@linux.ibm.com/
> > > > > 
> > > > > I believe even though there were some doubts about the use of
> > > > > pci_dev_is_added() by arch code the existing uses as well as the use in the
> > > > > final patch of this series warrant this export.
> > > > 
> > > > The use of pci_dev_is_added() in arch/powerpc was because in the past
> > > > pci_bus_add_device() could be called before pci_device_add(). That was
> > > > fixed a while ago so It should be safe to remove those calls now.
> > > 
> > > Hmm, ok that confirms Bjorns suspicion and explains how it came to be.
> > > I can certainly sent a patch for that. This would then leave only the
> > > existing use in s390 which I added because of a dead lock prevention
> > > and explained here:
> > > https://lore.kernel.org/lkml/87d15d5eead35c9eaa667958d057cf4a81a8bf13.camel@linux.ibm.com/
> > > 
> > > Plus the need to use it in the recovery code of this series. I think in
> > > the EEH code the need for a similar check is alleviated by the checks
> > > in the beginning of
> > > arch/powerpc/kernel/eeh_driver.c:eeh_handle_normal_event() especially
> > > eeh_slot_presence_check() which checks presence via the hotplug slot.
> > > I guess we could use our own state tracking in a similar way but felt
> > > like pci_dev_is_added() is the more logical choice.
> 
> The slot check is mainly there to prevent attempts to "recover"
> devices that have been surprise removed (i.e NVMe hot-unplug). The
> actual recovery process operates off the eeh_pe tree which is frozen
> in place when an error is detected. If a pci_dev is added or removed
> it's not really a problem since those are only ever looked at when
> notifying drivers which is done with the rescan_remove lock held. 

Thanks for the explanation.

> That
> said, I wouldn't really encourage anyone to follow the EEH model since
> it's pretty byzantine.
> 
> > Looking into this again, I think we actually can't easily track this
> > state ourselves outside struct pci_dev. The reason for this is that
> > when e.g. arch/s390/pci/pci_sysfs.c:recover_store() removes the struct
> > pci_dev and scans it again the new struct pci_dev re-uses the same
> > struct zpci_dev because from a platform point of view the PCI device
> > was never removed but only disabled and re-enabled. Thus we can only
> > distinguish the stale struct pci_dev by looking at things stored in
> > struct pci_dev itself.
> 
> IMO the real problem is removing and re-adding the pci_dev. I think
> it's something that's done largely because the PCI core doesn't really
> provide any better mechanism for getting a device back into a
> known-good state so it's abused to implement error recovery. This is
> something that's always annoyed me since it conflates recovery with
> hotplug. After a hot-(un)plug we might have a different device or no
> device. In the recovery case we expect to start and end with the same
> device. Why not apply the same logic to the pci_dev?

For us there are two cases. First The existing
/sys/bus/pci/devices/<dev>/recover attribute. This does the pci_dev
remove and re-add that you mention and thus we end up with a ne pci_dev
afterwards and I agree that is kind of a dumb way to recover which
(too?) closely resembles unplug/re-plug.

Secondly the automatic error recovery added in this series. Here we
only attempt recovery if we have a driver bound that supports the error
callbacks thus always keeping the same pci_dev. If there is no driver
we give up automatic recovery and are back at the situation without
this series.

> 
> Something I was tinkering with before I left IBM was re-working the
> way EEH handles recovering devices that don't have a driver with error
> handling callbacks to something like:
> 
> 1. unbind the driver
> 2. pci_save_state()
> 3. do the reset
> 4. pci_restore_state()
> 5. re-bind the driver
> 
> That would allow keeping the pci_dev around and let me delete a pile
> of confusing code which handles binding the eeh_dev to the new
> pci_dev.

This sounds like an interesting future approach for us too. Thankfully
our binding of the zpci_dev to the new pci_dev is pretty simple by now.
The main trouble with removing and re-adding a pci_dev is then that
upper layers like block devices are also re-created which really only
happens if we have a driver bound.

>  The obvious problem with that approach is the assumption the
> device is functional enough to allow saving the config space, but I
> don't think that's a deal breaker. We could stash a copy of the device
> state before we allow drivers to attach and use that to restore the
> device after the reset. The end result would be the same known-good
> state that we'd get after a re-scan.
> 
> > That said, I think for the recovery case we might be able to drop the
> > pci_dev_is_added() and rely on pdev->driver != NULL which we check
> > anyway and that should catch any PCI device that was already removed.
> 
> Would that work if there was an error on a device without a driver
> bound? 

For the automatic recovery flow introduced by this series we only
recover if such a driver is bound anyway so that is already a
requirement. Luckily all physical PCI devices we support on our
platform have drivers with that support.

> If you're just trying to stop races between recovery and device
> removal then pci_dev_is_added() is probably the right tool for the
> job. Trying to substitute it with a proxy seems like a bad idea.

Yes I believe at least for the existing recover attribute that does not
require a bound driver we still need pci_dev_is_added().

For the automatic recovery flow I think it would be okay to rely on the
fact that removed devices don't have a driver bound since the recovery
requires a bound driver anyway but yes an explicit pci_dev_is_added()
check as in this patch does feel more clean.



