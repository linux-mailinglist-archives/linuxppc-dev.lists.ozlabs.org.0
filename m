Return-Path: <linuxppc-dev+bounces-176-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3278395695D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2024 13:34:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnVqd5btVz2xxy;
	Mon, 19 Aug 2024 21:34:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HL2ztUyN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=amachhiw@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WnVqd0sN2z2xvR
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2024 21:34:20 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47JA19qd027356;
	Mon, 19 Aug 2024 11:34:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date
	:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=pp1; bh=UsqDIMpxDyemRi4fPPsg3jRzMi1
	OTL9ET/Uu1vaJCGc=; b=HL2ztUyNsMroxcQqGesnYXyjwOaobOAHrRdJdhWS0Vc
	cIDdfOs7afU1fMD292vRj4tee3vSeer/2UbUegXnDwWZnl0ghVcQ5D1Yc0cpwc3t
	MzmjstUQm/v734SWkhsyvAr0P8XVnkBoRvLLnYTXhIoytzDxfI55ssT0M0PBuYJK
	tLwcQzTAj05qrgFR9utA6QP9jJ85US6zRcgvR63aTfJt8RCToDljYTXSJjkdW6BN
	QGx/m7mEE1gok/j2OWbECQ/Lzoax1ejPZr9dxF4T0TgWG5tMIgWHloiNFvRf1PfR
	n2mMXqJZNOVa5RSge2hua7auyjBaYBEw8Tf76Qe4Kkw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 412mc4g26v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Aug 2024 11:34:00 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 47JBXxq2006657;
	Mon, 19 Aug 2024 11:33:59 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 412mc4g26p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Aug 2024 11:33:59 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 47JA0j1g030060;
	Mon, 19 Aug 2024 11:33:58 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4138dm5n4y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Aug 2024 11:33:58 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 47JBXr8a43647404
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Aug 2024 11:33:55 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3B8CF20040;
	Mon, 19 Aug 2024 11:33:53 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CA5F320049;
	Mon, 19 Aug 2024 11:33:47 +0000 (GMT)
Received: from li-e7e2bd4c-2dae-11b2-a85c-bfd29497117c.ibm.com (unknown [9.195.39.27])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 19 Aug 2024 11:33:47 +0000 (GMT)
Date: Mon, 19 Aug 2024 17:03:42 +0530
From: Amit Machhiwal <amachhiw@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Rob Herring <robh@kernel.org>,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        kvm-ppc@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
        Lizhi Hou <lizhi.hou@amd.com>, Saravana Kannan <saravanak@google.com>,
        Vaibhav Jain <vaibhav@linux.ibm.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        Vaidyanathan Srinivasan <svaidy@linux.ibm.com>,
        Kowshik Jois B S <kowsjois@linux.ibm.com>,
        Lukas Wunner <lukas@wunner.de>, kernel-team@lists.ubuntu.com,
        Stefan Bader <stefan.bader@canonical.com>
Subject: Re: [PATCH v3] PCI: Fix crash during pci_dev hot-unplug on pseries
 KVM guest
Message-ID: <20240819165310.cab26333-b8-amachhiw@linux.ibm.com>
Mail-Followup-To: Michael Ellerman <mpe@ellerman.id.au>, 
	Bjorn Helgaas <helgaas@kernel.org>, Rob Herring <robh@kernel.org>, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-ppc@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, 
	Lizhi Hou <lizhi.hou@amd.com>, Saravana Kannan <saravanak@google.com>, 
	Vaibhav Jain <vaibhav@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Vaidyanathan Srinivasan <svaidy@linux.ibm.com>, Kowshik Jois B S <kowsjois@linux.ibm.com>, 
	Lukas Wunner <lukas@wunner.de>, kernel-team@lists.ubuntu.com, 
	Stefan Bader <stefan.bader@canonical.com>
References: <20240806200059.GA74866@bhelgaas>
 <87h6bm1ngo.fsf@mail.lhotse>
 <20240816180441.81f4d694-3b-amachhiw@linux.ibm.com>
 <87o75s2hxa.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o75s2hxa.fsf@mail.lhotse>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: R8VUjQv28xiQn-SzJOjpJVh2xfSErgDy
X-Proofpoint-GUID: Fexqrs0yQr5cj37s8xkX5FhhOebrt9J9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_10,2024-08-19_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_spam_definite policy=outbound score=100 bulkscore=0
 mlxscore=100 clxscore=1015 priorityscore=1501 mlxlogscore=-999
 adultscore=0 phishscore=0 impostorscore=0 suspectscore=0 spamscore=100
 lowpriorityscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2408190077

Hi Michael,

On 2024/08/17 08:59 AM, Michael Ellerman wrote:
> Amit Machhiwal <amachhiw@linux.ibm.com> writes:
> > On 2024/08/15 01:20 PM, Michael Ellerman wrote:
> >> Bjorn Helgaas <helgaas@kernel.org> writes:
> >> > On Sat, Aug 03, 2024 at 12:03:25AM +0530, Amit Machhiwal wrote:
> >> >> With CONFIG_PCI_DYNAMIC_OF_NODES [1], a hot-plug and hot-unplug sequence
> >> >> of a PCI device attached to a PCI-bridge causes following kernel Oops on
> >> >> a pseries KVM guest:
> >> >
> >> > What is unique about pseries here?  There's nothing specific to
> >> > pseries in the patch, so I would expect this to be a generic problem
> >> > on any arch.
> >> >
> >> >>  RTAS: event: 2, Type: Hotplug Event (229), Severity: 1
> >> >>  Kernel attempted to read user page (10ec00000048) - exploit attempt? (uid: 0)
> >> >>  BUG: Unable to handle kernel data access on read at 0x10ec00000048
> >> >
> >> > Weird address.  I would expect NULL or something.  Where did this
> >> > non-NULL pointer come from?
> >> 
> >> It originally comes from np->data, which is supposed to be an
> >> of_changeset.
> >> 
> >> The powerpc code also uses np->data for the struct pci_dn pointer, see
> >> pci_add_device_node_info().
> >> 
> >> I wonder if that's why it's non-NULL?
> >
> > I'm also looking into the code to figure out where's that value coming from. I
> > will update as soon as I get there.
> 
> Thanks.
>  
> >> Amit, do we have exact steps to reproduce this? I poked around a bit but
> >> couldn't get it to trigger.
> >
> > Sure, below are the steps:
> >
> > 1. Set CONFIG_PCI_DYNAMIC_OF_NODES=y in the kernel config and compile (Fedora
> >    has it disabled in it's distro config, Ubuntu has it enabled but will have it
> >    disabled in the next update)
> >
> > 2. If you are using Fedora cloud images, make sure you've these packages
> >    installed:
> >     $ rpm -qa | grep -e 'ppc64-diag\|powerpc-utils'
> >     powerpc-utils-core-1.3.11-6.fc40.ppc64le
> >     powerpc-utils-1.3.11-6.fc40.ppc64le
> >     ppc64-diag-rtas-2.7.9-6.fc40.ppc64le
> >     ppc64-diag-2.7.9-6.fc40.ppc64le
> >
> > 3. Hotplug a pci device as follows:
> >     virsh attach-interface <domain_name> bridge --source virbr0
> 
> I don't use virsh :)

No worries. Fortunately, we do have a way to do it with qemu monitor.

> 
> Any idea how to do it with just qemu monitor commands?
> 

1. Boot the guest with the below included in the qemu cmdline:

    -netdev bridge,id=<net_name>,br=virbr0,helper=/usr/libexec/qemu-bridge-helper

2. Once the guest boots, run the below command on qemu monitor to hot-plug a pci
   device:

    device_add rtl8139,netdev=<net_name>,mac=52:54:00:88:31:28,id=<net_id>

    dmesg
    =====
    [  116.968210] pci 0000:00:01.0: [10ec:8139] type 00 class 0x020000 conventional PCI endpoint
    [  116.969260] pci 0000:00:01.0: BAR 0 [io  0x10000-0x100ff]
    [  116.969904] pci 0000:00:01.0: BAR 1 [mem 0x00000000-0x000000ff]
    [  116.970745] pci 0000:00:01.0: ROM [mem 0x00000000-0x0003ffff pref]
    [  116.971456] pci 0000:00:01.0: No hypervisor support for SR-IOV on this device, IOV BARs disabled.
    [  116.972583] pci 0000:00:01.0: Adding to iommu group 0
    [  116.978466] pci 0000:00:01.0: ROM [mem 0x200080080000-0x2000800bffff pref]: assigned
    [  116.979347] pci 0000:00:01.0: BAR 0 [io  0x10400-0x104ff]: assigned
    [  116.980063] pci 0000:00:01.0: BAR 1 [mem 0x200080001000-0x2000800010ff]: assigned
    [  117.017187] 8139cp: 8139cp: 10/100 PCI Ethernet driver v1.3 (Mar 22, 2004)
    [  117.018577] 8139cp 0000:00:01.0: enabling device (0000 -> 0003)
    [  117.025414] 8139cp 0000:00:01.0 eth1: RTL-8139C+ at 0x00000000fbf09e59, 52:54:00:88:31:28, IRQ 26
    [  117.051028] 8139too: 8139too Fast Ethernet driver 0.9.28
    [  117.076577] 8139cp 0000:00:01.0 eth1: link up, 100Mbps, full-duplex, lpa 0x05E1

3. Try hot-unplug of the device to recreate the kernel Oops.

    device_del <net_id>

Thanks,
Amit

> cheers

