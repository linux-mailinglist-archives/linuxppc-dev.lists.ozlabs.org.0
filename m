Return-Path: <linuxppc-dev+bounces-124-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0BA954902
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2024 14:44:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=127.0.0.1
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dn77U71m;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WlhWh3VYcz2yhr;
	Fri, 16 Aug 2024 22:44:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dn77U71m;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=amachhiw@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WlhWg5fNlz2y8W
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2024 22:44:14 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47GCJUIX011993;
	Fri, 16 Aug 2024 12:44:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date
	:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=pp1; bh=FxG5AO0a05E65VCYddzaEdcy3rX
	c9OnstfLvnE4yiAA=; b=dn77U71m4WAYrJk3pY3P+Cny23MgaPO5XsRB94tZafY
	pQnZN9aAxhrqxJnt+aqlQtQIbsRV4KMVWECNqfGfPDq7+yYuRVN+HDv53/JIAGxL
	r9kVL/5IHw6DRnDFc7D3dIi7Ffw8XJzJGDp/VGQynDKvmvVlVyy3xQAXtycFkyTJ
	5ExeNbcTD0Nn9hsegil/8mTxbP8y5+W/Ikdt4QtLLW9IjGYYWtHJF5Bq0Ebh0eF2
	abrnBizk/qgm3Pw7qv1bs9cQue+mpRCFAdxmafzMgOe7EmcA/+HImoXD4AjMXPhm
	hP13NfHDF9TueeSuHwicMh2LbcQGyzR7fvduptLiu7Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4111d6gkdp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 12:44:02 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 47GCi1i5003772;
	Fri, 16 Aug 2024 12:44:01 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4111d6gkdg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 12:44:01 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 47G9mPvi010088;
	Fri, 16 Aug 2024 12:43:59 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 40xjx13t8k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 12:43:59 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 47GChrkj35193230
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Aug 2024 12:43:56 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DAEA320043;
	Fri, 16 Aug 2024 12:43:53 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C383C20040;
	Fri, 16 Aug 2024 12:43:49 +0000 (GMT)
Received: from li-e7e2bd4c-2dae-11b2-a85c-bfd29497117c.ibm.com (unknown [9.124.218.83])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 16 Aug 2024 12:43:49 +0000 (GMT)
Date: Fri, 16 Aug 2024 18:13:40 +0530
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
Message-ID: <20240816180441.81f4d694-3b-amachhiw@linux.ibm.com>
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
In-Reply-To: <87h6bm1ngo.fsf@mail.lhotse>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: fjxpXS4-C-n-T_sJtPF7tEjSYLYcNVMQ
X-Proofpoint-ORIG-GUID: iFlwX-ZVYmO-todBMlQrqiZ-aMe-_LZD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-16_03,2024-08-16_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_spam_definite policy=outbound score=100 mlxlogscore=-999
 phishscore=0 spamscore=100 malwarescore=0 priorityscore=1501
 impostorscore=0 adultscore=0 bulkscore=0 mlxscore=100 lowpriorityscore=0
 suspectscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2408160091

Hi Michael,

On 2024/08/15 01:20 PM, Michael Ellerman wrote:
> Bjorn Helgaas <helgaas@kernel.org> writes:
> > On Sat, Aug 03, 2024 at 12:03:25AM +0530, Amit Machhiwal wrote:
> >> With CONFIG_PCI_DYNAMIC_OF_NODES [1], a hot-plug and hot-unplug sequence
> >> of a PCI device attached to a PCI-bridge causes following kernel Oops on
> >> a pseries KVM guest:
> >
> > What is unique about pseries here?  There's nothing specific to
> > pseries in the patch, so I would expect this to be a generic problem
> > on any arch.
> >
> >>  RTAS: event: 2, Type: Hotplug Event (229), Severity: 1
> >>  Kernel attempted to read user page (10ec00000048) - exploit attempt? (uid: 0)
> >>  BUG: Unable to handle kernel data access on read at 0x10ec00000048
> >
> > Weird address.  I would expect NULL or something.  Where did this
> > non-NULL pointer come from?
> 
> It originally comes from np->data, which is supposed to be an
> of_changeset.
> 
> The powerpc code also uses np->data for the struct pci_dn pointer, see
> pci_add_device_node_info().
> 
> I wonder if that's why it's non-NULL?

I'm also looking into the code to figure out where's that value coming from. I
will update as soon as I get there.

> 
> Amit, do we have exact steps to reproduce this? I poked around a bit but
> couldn't get it to trigger.

Sure, below are the steps:

1. Set CONFIG_PCI_DYNAMIC_OF_NODES=y in the kernel config and compile (Fedora
   has it disabled in it's distro config, Ubuntu has it enabled but will have it
   disabled in the next update)

2. If you are using Fedora cloud images, make sure you've these packages
   installed:
    $ rpm -qa | grep -e 'ppc64-diag\|powerpc-utils'
    powerpc-utils-core-1.3.11-6.fc40.ppc64le
    powerpc-utils-1.3.11-6.fc40.ppc64le
    ppc64-diag-rtas-2.7.9-6.fc40.ppc64le
    ppc64-diag-2.7.9-6.fc40.ppc64le

3. Hotplug a pci device as follows:
    virsh attach-interface <domain_name> bridge --source virbr0

4. Check if the pci device was added by running `ip a s`

5. Try hot-unplug of that device by supplying the MAC, which should trigger the
   Oops
    virsh detach-interface <domain_name> bridge <mac_addr>

Thanks,
Amit

> cheers

