Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E4392FFA7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2024 19:20:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pTa1Lz4N;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WLJJH5tb8z3cgB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jul 2024 03:20:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pTa1Lz4N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=amachhiw@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WLJHc3c8Jz3bvP
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Jul 2024 03:19:39 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46CFvUvD014723;
	Fri, 12 Jul 2024 17:19:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date
	:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-transfer-encoding:in-reply-to; s=pp1; bh=P
	KLdN+4HvBPUBpPcjX23XjukBoXJmaIgK0lpyBVPehs=; b=pTa1Lz4N4kcksyH25
	aui4MTWaA6mHQS9axVcYmtR4CBTepfVSa+CDXN08hm71FdZWdUzen3OUGhrdtSMy
	KKcxBbHxTvq/BuJL5oUxwSyWJY3KUTgAfNtwXAVqljrFIAzwoYwa8CE8DjCjkKpp
	kZvILS7XC4SrDquKE74oSMAiWzFg9EEdpPBHxVy/kBLRD46zvQgTeCLBRorfnuOP
	lY/zTAeShcR3CYb1lDL+auybtsERiSyTyNwy5jQ5Q6CvWuTQOVZIsLTpmt4HHdIY
	A2HEbvtsLP/kjIJcMy716uBLOourR9ebkT9VaoV/42BuCbQ7DN/7gkwWnbKpNIxQ
	9+/mA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40b4y7gmbv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Jul 2024 17:19:26 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 46CHJPgM023228;
	Fri, 12 Jul 2024 17:19:25 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40b4y7gmbs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Jul 2024 17:19:25 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 46CE1mO1024583;
	Fri, 12 Jul 2024 17:19:25 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 407hrn7k5n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Jul 2024 17:19:24 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 46CHJJua34996642
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 12 Jul 2024 17:19:21 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5171520043;
	Fri, 12 Jul 2024 17:19:19 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5C46E20040;
	Fri, 12 Jul 2024 17:19:16 +0000 (GMT)
Received: from li-e7e2bd4c-2dae-11b2-a85c-bfd29497117c.ibm.com (unknown [9.195.45.199])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 12 Jul 2024 17:19:16 +0000 (GMT)
Date: Fri, 12 Jul 2024 22:49:10 +0530
From: Amit Machhiwal <amachhiw@linux.ibm.com>
To: Lizhi Hou <lizhi.hou@amd.com>
Subject: Re: [PATCH] PCI: Fix crash during pci_dev hot-unplug on pseries KVM
 guest
Message-ID: <parclvdotds2m44iphcy7qlhnxg6ugdtk7ad7wxodtktj6m5zj@wpuwa7xc6ve4>
Mail-Followup-To: Lizhi Hou <lizhi.hou@amd.com>, 
	Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, 
	Rob Herring <robh@kernel.org>, Vaibhav Jain <vaibhav@linux.ibm.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Vaidyanathan Srinivasan <svaidy@linux.ibm.com>, Kowshik Jois B S <kowsjois@linux.ibm.com>, 
	Lukas Wunner <lukas@wunner.de>
References: <20240705192034.GA73447@bhelgaas>
 <2359de90-1712-903e-c3c9-1f1f694718db@amd.com>
 <k5h7tto6kdwcgtxoeglqncojjwact6xxqnin4inffol74jdows@fj5ujezqwb24>
 <f1c2125e-c87e-d816-c92b-db814f501134@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f1c2125e-c87e-d816-c92b-db814f501134@amd.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: sEAC1-5TYDh5GqKpo8s93-VQZKLYqtNZ
X-Proofpoint-ORIG-GUID: qmakTHWV9aEhnRW0UZq7bentTl0ZwFwN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-12_13,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2407120116
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
Cc: Rob Herring <robh@kernel.org>, Kowshik Jois B S <kowsjois@linux.ibm.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org, Vaidyanathan Srinivasan <svaidy@linux.ibm.com>, Lukas Wunner <lukas@wunner.de>, Bjorn Helgaas <helgaas@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Lizhi,

On 2024/07/11 02:18 PM, Lizhi Hou wrote:
> 
> On 7/11/24 11:48, Amit Machhiwal wrote:
> > On 2024/07/10 09:48 PM, Lizhi Hou wrote:
> > > On 7/5/24 12:20, Bjorn Helgaas wrote:
> > > > [+cc Lukas, FYI]
> > > > 
> > > > On Wed, Jul 03, 2024 at 07:46:34PM +0530, Amit Machhiwal wrote:
> > > > > With CONFIG_PCI_DYNAMIC_OF_NODES [1], a hot-plug and hot-unplug sequence
> > > > > of a PCI device attached to a PCI-bridge causes following kernel Oops on
> > > > > a pseries KVM guest:
> > > > > 
> > > > >    RTAS: event: 2, Type: Hotplug Event (229), Severity: 1
> > > > >    Kernel attempted to read user page (10ec00000048) - exploit attempt? (uid: 0)
> > > > >    BUG: Unable to handle kernel data access on read at 0x10ec00000048
> > > > >    Faulting instruction address: 0xc0000000012d8728
> > > > >    Oops: Kernel access of bad area, sig: 11 [#1]
> > > > >    LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries
> > > > > <snip>
> > > > >    NIP [c0000000012d8728] __of_changeset_entry_invert+0x10/0x1ac
> > > > >    LR [c0000000012da7f0] __of_changeset_revert_entries+0x98/0x180
> > > > >    Call Trace:
> > > > >    [c00000000bcc3970] [c0000000012daa60] of_changeset_revert+0x58/0xd8
> > > > >    [c00000000bcc39c0] [c000000000d0ed78] of_pci_remove_node+0x74/0xb0
> > > > >    [c00000000bcc39f0] [c000000000cdcfe0] pci_stop_bus_device+0xf4/0x138
> > > > >    [c00000000bcc3a30] [c000000000cdd140] pci_stop_and_remove_bus_device_locked+0x34/0x64
> > > > >    [c00000000bcc3a60] [c000000000cf3780] remove_store+0xf0/0x108
> > > > >    [c00000000bcc3ab0] [c000000000e89e04] dev_attr_store+0x34/0x78
> > > > >    [c00000000bcc3ad0] [c0000000007f8dd4] sysfs_kf_write+0x70/0xa4
> > > > >    [c00000000bcc3af0] [c0000000007f7248] kernfs_fop_write_iter+0x1d0/0x2e0
> > > > >    [c00000000bcc3b40] [c0000000006c9b08] vfs_write+0x27c/0x558
> > > > >    [c00000000bcc3bf0] [c0000000006ca168] ksys_write+0x90/0x170
> > > > >    [c00000000bcc3c40] [c000000000033248] system_call_exception+0xf8/0x290
> > > > >    [c00000000bcc3e50] [c00000000000d05c] system_call_vectored_common+0x15c/0x2ec
> > > > > <snip>
> > > > > 
> > > > > A git bisect pointed this regression to be introduced via [1] that added
> > > > > a mechanism to create device tree nodes for parent PCI bridges when a
> > > > > PCI device is hot-plugged.
> > > > > 
> > > > > The Oops is caused when `pci_stop_dev()` tries to remove a non-existing
> > > > > device-tree node associated with the pci_dev that was earlier
> > > > > hot-plugged and was attached under a pci-bridge. The PCI dev header
> > > > > `dev->hdr_type` being 0, results a conditional check done with
> > > > > `pci_is_bridge()` into false. Consequently, a call to
> > > > > `of_pci_make_dev_node()` to create a device node is never made. When at
> > > > > a later point in time, in the device node removal path, a memcpy is
> > > > > attempted in `__of_changeset_entry_invert()`; since the device node was
> > > > > never created, results in an Oops due to kernel read access to a bad
> > > > > address.
> > > > > 
> > > > > To fix this issue the patch updates `pci_stop_dev()` to ensure that a
> > > > > call to `of_pci_remove_node()` is only made for pci-bridge devices.
> > > > > 
> > > > > [1] commit 407d1a51921e ("PCI: Create device tree node for bridge")
> > > > > 
> > > > > Fixes: 407d1a51921e ("PCI: Create device tree node for bridge")
> > > > > Reported-by: Kowshik Jois B S <kowsjois@linux.ibm.com>
> > > > > Tested-by: Kowshik Jois B S <kowsjois@linux.ibm.com>
> > > > > Signed-off-by: Amit Machhiwal <amachhiw@linux.ibm.com>
> > > > Thanks for the patch and testing!  Would like a reviewed-by from
> > > > Lizhi.
> > > of_pci_make_dev_node() will create of nodes for some endpoint devices (not a
> > > bridge) as well. And actually this is the main purpose.
> > > 
> > > Maybe the patch as below would resolve the Oops?
> > Thanks for the patch, Lizhi! I tried out this patch and don't see the issue with
> > the same. The hot-plug and hot-unplug of PCI device seem to work fine as
> > expected.
> 
> Cool! Thanks for trying it. Will you re-spin the patch or you would like me
> to create a patch?

Sure, I'll re-spin and send the V2 of the patch.

~ Amit

> 
> Lizhi
> 
> > 
> > ~ Amit
> > 
> > > diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
> > > index dda6092e6d3a..3c693b091ecf 100644
> > > --- a/drivers/of/dynamic.c
> > > +++ b/drivers/of/dynamic.c
> > > @@ -492,21 +492,29 @@ struct device_node *__of_node_dup(const struct
> > > device_node *np,
> > >    * a given changeset.
> > >    *
> > >    * @ocs: Pointer to changeset
> > > + * @np: Pointer to device node. If it is not null, init it directly instead
> > > of
> > > + *      allocate a new node.
> > >    * @parent: Pointer to parent device node
> > >    * @full_name: Node full name
> > >    *
> > >    * Return: Pointer to the created device node or NULL in case of an error.
> > >    */
> > >   struct device_node *of_changeset_create_node(struct of_changeset *ocs,
> > > +                                            struct device_node *np,
> > >                                               struct device_node *parent,
> > >                                               const char *full_name)
> > >   {
> > > -       struct device_node *np;
> > >          int ret;
> > > 
> > > -       np = __of_node_dup(NULL, full_name);
> > > -       if (!np)
> > > -               return NULL;
> > > +       if (!np) {
> > > +               np = __of_node_dup(NULL, full_name);
> > > +               if (!np)
> > > +                       return NULL;
> > > +       } else {
> > > +               of_node_set_flag(np, OF_DYNAMIC);
> > > +               of_node_set_flag(np, OF_DETACHED);
> > > +       }
> > > +
> > >          np->parent = parent;
> > > 
> > >          ret = of_changeset_attach_node(ocs, np);
> > > diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
> > > index 445ad13dab98..087de26852cc 100644
> > > --- a/drivers/of/unittest.c
> > > +++ b/drivers/of/unittest.c
> > > @@ -871,7 +871,7 @@ static void __init of_unittest_changeset(void)
> > >          unittest(!of_changeset_add_property(&chgset, parent, ppadd), "fail
> > > add prop prop-add\n");
> > >          unittest(!of_changeset_update_property(&chgset, parent, ppupdate),
> > > "fail update prop\n");
> > >          unittest(!of_changeset_remove_property(&chgset, parent, ppremove),
> > > "fail remove prop\n");
> > > -       n22 = of_changeset_create_node(&chgset, n2, "n22");
> > > +       n22 = of_changeset_create_node(&chgset, NULL, n2, "n22");
> > >          unittest(n22, "fail create n22\n");
> > >          unittest(!of_changeset_add_prop_string(&chgset, n22, "prop-str",
> > > "abcd"),
> > >                   "fail add prop prop-str");
> > > diff --git a/drivers/pci/of.c b/drivers/pci/of.c
> > > index 51e3dd0ea5ab..92c079b2e570 100644
> > > --- a/drivers/pci/of.c
> > > +++ b/drivers/pci/of.c
> > > @@ -608,18 +608,28 @@ int devm_of_pci_bridge_init(struct device *dev, struct
> > > pci_host_bridge *bridge)
> > > 
> > >   #ifdef CONFIG_PCI_DYNAMIC_OF_NODES
> > > 
> > > +void of_pci_free_node(struct device_node *np)
> > > +{
> > > +       struct of_changeset *cset;
> > > +
> > > +       cset = (struct of_changeset *)(np + 1);
> > > +
> > > +       np->data = NULL;
> > > +       of_changeset_revert(cset);
> > > +       of_changeset_destroy(cset);
> > > +       of_node_put(np);
> > > +}
> > > +
> > >   void of_pci_remove_node(struct pci_dev *pdev)
> > >   {
> > >          struct device_node *np;
> > > 
> > >          np = pci_device_to_OF_node(pdev);
> > > -       if (!np || !of_node_check_flag(np, OF_DYNAMIC))
> > > +       if (!np || np->data != of_pci_free_node)
> > >                  return;
> > >          pdev->dev.of_node = NULL;
> > > 
> > > -       of_changeset_revert(np->data);
> > > -       of_changeset_destroy(np->data);
> > > -       of_node_put(np);
> > > +       of_pci_free_node(np);
> > >   }
> > > 
> > >   void of_pci_make_dev_node(struct pci_dev *pdev)
> > > @@ -655,14 +665,18 @@ void of_pci_make_dev_node(struct pci_dev *pdev)
> > >          if (!name)
> > >                  return;
> > > 
> > > -       cset = kmalloc(sizeof(*cset), GFP_KERNEL);
> > > -       if (!cset)
> > > +       np = kzalloc(sizeof(*np) + sizeof(*cset), GFP_KERNEL);
> > > +       if (!np)
> > >                  goto out_free_name;
> > > +       np->full_name = name;
> > > +       of_node_init(np);
> > > +
> > > +       cset = (struct of_changeset *)(np + 1);
> > >          of_changeset_init(cset);
> > > 
> > > -       np = of_changeset_create_node(cset, ppnode, name);
> > > +       np = of_changeset_create_node(cset, np, ppnode, NULL);
> > >          if (!np)
> > > -               goto out_destroy_cset;
> > > +               goto out_free_node;
> > > 
> > >          ret = of_pci_add_properties(pdev, cset, np);
> > >          if (ret)
> > > @@ -672,9 +686,8 @@ void of_pci_make_dev_node(struct pci_dev *pdev)
> > >          if (ret)
> > >                  goto out_free_node;
> > > 
> > > -       np->data = cset;
> > > +       np->data = of_pci_free_node;
> > >          pdev->dev.of_node = np;
> > > -       kfree(name);
> > > 
> > >          return;
> > > 
> > > diff --git a/include/linux/of.h b/include/linux/of.h
> > > index a0bedd038a05..f774459d0d84 100644
> > > --- a/include/linux/of.h
> > > +++ b/include/linux/of.h
> > > @@ -1631,6 +1631,7 @@ static inline int of_changeset_update_property(struct
> > > of_changeset *ocs,
> > >   }
> > > 
> > >   struct device_node *of_changeset_create_node(struct of_changeset *ocs,
> > > +                                            struct device_node *np,
> > >                                               struct device_node *parent,
> > >                                               const char *full_name);
> > >   int of_changeset_add_prop_string(struct of_changeset *ocs,
> > > 
> > > Thanks,
> > > 
> > > Lizhi
> > > 
> > > > > ---
> > > > >    drivers/pci/remove.c | 3 ++-
> > > > >    1 file changed, 2 insertions(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/drivers/pci/remove.c b/drivers/pci/remove.c
> > > > > index d749ea8250d6..4e51c64af416 100644
> > > > > --- a/drivers/pci/remove.c
> > > > > +++ b/drivers/pci/remove.c
> > > > > @@ -22,7 +22,8 @@ static void pci_stop_dev(struct pci_dev *dev)
> > > > >    		device_release_driver(&dev->dev);
> > > > >    		pci_proc_detach_device(dev);
> > > > >    		pci_remove_sysfs_dev_files(dev);
> > > > > -		of_pci_remove_node(dev);
> > > > > +		if (pci_is_bridge(dev))
> > > > > +			of_pci_remove_node(dev);
> > > > IIUC, this basically undoes the work that was done by
> > > > of_pci_make_dev_node().
> > > > 
> > > > The call of of_pci_make_dev_node() from pci_bus_add_device() was added
> > > > by 407d1a51921e and is conditional on pci_is_bridge(), so it makes
> > > > sense to me that the remove needs a similar condition.
> > > > 
> > > > >    		pci_dev_assign_added(dev, false);
> > > > >    	}
> > > > > 
> > > > > base-commit: e9d22f7a6655941fc8b2b942ed354ec780936b3e
> > > > > -- 
> > > > > 2.45.2
> > > > > 
