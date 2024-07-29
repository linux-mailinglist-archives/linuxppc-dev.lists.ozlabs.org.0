Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DECA093FBEB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2024 18:56:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=q/L/+Tor;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WXkz15wc8z3cdZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 02:56:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=q/L/+Tor;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=amachhiw@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WXkyJ1w2jz3cSH
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 02:55:51 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46TGTfEt025061;
	Mon, 29 Jul 2024 16:55:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date
	:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-transfer-encoding:in-reply-to; s=pp1; bh=r
	P7XGHo7glYOi1uyLM/8GrOjl/KJ3E+Se5g0xynW93M=; b=q/L/+Tor8gpPxGYCU
	sx2wOiY9pezsvaCFFgrWpZ7Xb/w9iv/ibSvCKxizx2micTQmrdWYx2S1k+9V5koE
	N7gO+ln3w9+mqZPnNfoDv1+AFKPov5rGDEvGO+Mfl24qZ/27C3E7sUR881Of0Nka
	uXZ6fIYW1U775EhE3/5OyYEM8ZG0+LZrx4Lzo8mPWQESiIUkQ6iarvHm7ALZ8y4U
	o3PsIh03FnYa7Yc314RIq+/qjYhUKch74uiK5pkupRLMqmu08vaLUnmb5smoPrHW
	qPhN5phRn1glh5pA77tU2GLl6qcXkBUVwQgvFeFW493G90jCYoT/MA23B/dCQKsF
	E6s0Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40pemu81g7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 16:55:43 +0000 (GMT)
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 46TGtgkL003055;
	Mon, 29 Jul 2024 16:55:42 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40pemu81g1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 16:55:42 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 46TGUFWW007457;
	Mon, 29 Jul 2024 16:55:41 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 40nb7tyyvm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 16:55:41 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 46TGtabm7733654
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Jul 2024 16:55:38 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E6AEC20043;
	Mon, 29 Jul 2024 16:55:35 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EC6E720040;
	Mon, 29 Jul 2024 16:55:32 +0000 (GMT)
Received: from li-e7e2bd4c-2dae-11b2-a85c-bfd29497117c.ibm.com (unknown [9.195.41.40])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 29 Jul 2024 16:55:32 +0000 (GMT)
Date: Mon, 29 Jul 2024 22:25:28 +0530
From: Amit Machhiwal <amachhiw@linux.ibm.com>
To: Lizhi Hou <lizhi.hou@amd.com>
Subject: Re: [PATCH v2] PCI: Fix crash during pci_dev hot-unplug on pseries
 KVM guest
Message-ID: <vctizrpvsuy4ebrvmub756sxs2bridn6gkav55ehlz5gjlc44b@jyzymbydkut2>
Mail-Followup-To: Lizhi Hou <lizhi.hou@amd.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	Saravana Kannan <saravanak@google.com>, Kowshik Jois B S <kowsjois@linux.ibm.com>, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org, 
	Vaidyanathan Srinivasan <svaidy@linux.ibm.com>, Lukas Wunner <lukas@wunner.de>, 
	Nicholas Piggin <npiggin@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20240723162107.GA501469-robh@kernel.org>
 <a8d2e310-9446-6cfa-fe00-4ef83cdb6590@amd.com>
 <CAL_JsqJjhaLFm9jiswJTfi4yZFYGKJUdC+HV662RLWEkJjxACw@mail.gmail.com>
 <ac3aeec4-70fc-cd9e-498c-acab0b218d9b@amd.com>
 <p6cs4fxzistpyqkc5bv2sb76inrw7fterocdcu3snnyjpqydbr@thxna6v2umrl>
 <d20b78cd-ed34-3e5a-0176-c20ee5afd0db@amd.com>
 <CAL_JsqJAuVexFAz6gWWuTtX1Go-FnHe6vJapv0znHBERSCtv+Q@mail.gmail.com>
 <0b1be7b7-e65b-8d8e-0659-388dec303039@amd.com>
 <6mjt477ltxhr4sudizyzbspkqb7yspxvnoiblzeiwxw5kwwsmq@bchicp4bmtzq>
 <af45d85c-2145-cbce-b91b-2aa70a9dcd0f@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <af45d85c-2145-cbce-b91b-2aa70a9dcd0f@amd.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: zERw8w-BfFVdH2DDIJaNTMQ227-zUjP4
X-Proofpoint-GUID: yHn67uTODD4v1Bvu00La6-lWVUPXglYb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-29_15,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0
 adultscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407290113
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
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, devicetree@vger.kernel.org, Kowshik Jois B S <kowsjois@linux.ibm.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org, Vaidyanathan Srinivasan <svaidy@linux.ibm.com>, Lukas Wunner <lukas@wunner.de>, Nicholas Piggin <npiggin@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Lizhi,

On 2024/07/29 09:47 AM, Lizhi Hou wrote:
> Hi Amit
> 
> On 7/29/24 04:13, Amit Machhiwal wrote:
> > Hi Lizhi,
> > 
> > On 2024/07/26 11:45 AM, Lizhi Hou wrote:
> > > On 7/26/24 10:52, Rob Herring wrote:
> > > > On Thu, Jul 25, 2024 at 6:06 PM Lizhi Hou <lizhi.hou@amd.com> wrote:
> > > > > Hi Amit,
> > > > > 
> > > > > 
> > > > > I try to follow the option which add a OF flag. If Rob is ok with this,
> > > > > I would suggest to use it instead of V1 patch
> > > > > 
> > > > > diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
> > > > > index dda6092e6d3a..a401ed0463d9 100644
> > > > > --- a/drivers/of/dynamic.c
> > > > > +++ b/drivers/of/dynamic.c
> > > > > @@ -382,6 +382,11 @@ void of_node_release(struct kobject *kobj)
> > > > >                                   __func__, node);
> > > > >            }
> > > > > 
> > > > > +       if (of_node_check_flag(node, OF_CREATED_WITH_CSET)) {
> > > > > +               of_changeset_revert(node->data);
> > > > > +               of_changeset_destroy(node->data);
> > > > > +       }
> > > > What happens if multiple nodes are created in the changeset?
> > > Ok. multiple nodes will not work.
> > > > > +
> > > > >            if (node->child)
> > > > >                    pr_err("ERROR: %s() unexpected children for %pOF/%s\n",
> > > > >                            __func__, node->parent, node->full_name);
> > > > > @@ -507,6 +512,7 @@ struct device_node *of_changeset_create_node(struct
> > > > > of_changeset *ocs,
> > > > >            np = __of_node_dup(NULL, full_name);
> > > > >            if (!np)
> > > > >                    return NULL;
> > > > > +       of_node_set_flag(np, OF_CREATED_WITH_CSET);
> > > > This should be set where the data ptr is set.
> > > Ok. It sounds the fix could be simplified to 3 lines change.
> > Thanks for the patch. The hot-plug and hot-unplug of PCI device seem to work
> > fine as expected. I see this patch would attempt to remove only the nodes which
> > were created in `of_pci_make_dev_node()` with the help of the newly introduced
> > flag, which looks good to me.
> > 
> > Also, since a call to `of_pci_make_dev_node()` from `pci_bus_add_device()`, that
> > creates devices nodes only for bridge devices, is conditional on
> > `pci_is_bridge()`, it only makes sense to retain the logical symmetry and call
> > `of_pci_remove_node()` conditionally on `pci_is_bridge()` as well in
> > `pci_stop_dev()`. Hence, I would like to propose the below change along with the
> > above patch:
> > 
> > diff --git a/drivers/pci/remove.c b/drivers/pci/remove.c
> > index 910387e5bdbf..c6394bf562cd 100644
> > --- a/drivers/pci/remove.c
> > +++ b/drivers/pci/remove.c
> > @@ -23,7 +23,8 @@ static void pci_stop_dev(struct pci_dev *dev)
> >                  device_release_driver(&dev->dev);
> >                  pci_proc_detach_device(dev);
> >                  pci_remove_sysfs_dev_files(dev);
> > -               of_pci_remove_node(dev);
> > +               if (pci_is_bridge(dev))
> > +                       of_pci_remove_node(dev);
> >                  pci_dev_assign_added(dev, false);
> >          }
> > 
> > Please let me know of your thoughts on this and based on that I can spin the v3
> > of this patch.
> 
> As I mentioned, there are endpoints in pci quirks (pci/quirks.c) will also
> create nodes by of_pci_make_dev_node(). So please remove above two lines.

Sorry if I'm misinterpreting something here but as I mentioned,
`of_pci_make_dev_node()` is called only for bridge devices with check performed
via `pci_is_bridge()`, could you please elaborate more on why the same check
can't be put while removing the node via `of_pci_remove_node()`?

Thanks,
Amit

> 
> Thanks,
> 
> Lizhi
> 
> > 
> > In addition to this, can this patch be taken as part of 6.11 as a bug fix?
> > 
> > Thanks,
> > Amit
> > 
> > > 
> > > diff --git a/drivers/pci/of.c b/drivers/pci/of.c
> > > index 51e3dd0ea5ab..0b3ba1e1b18c 100644
> > > --- a/drivers/pci/of.c
> > > +++ b/drivers/pci/of.c
> > > @@ -613,7 +613,7 @@ void of_pci_remove_node(struct pci_dev *pdev)
> > >          struct device_node *np;
> > > 
> > >          np = pci_device_to_OF_node(pdev);
> > > -       if (!np || !of_node_check_flag(np, OF_DYNAMIC))
> > > +       if (!np || !of_node_check_flag(np, OF_CREATED_WITH_CSET))
> > >                  return;
> > >          pdev->dev.of_node = NULL;
> > > 
> > > @@ -672,6 +672,7 @@ void of_pci_make_dev_node(struct pci_dev *pdev)
> > >          if (ret)
> > >                  goto out_free_node;
> > > 
> > > +       of_node_set_flag(np, OF_CREATED_WITH_CSET);
> > >          np->data = cset;
> > >          pdev->dev.of_node = np;
> > >          kfree(name);
> > > diff --git a/include/linux/of.h b/include/linux/of.h
> > > index a0bedd038a05..a46317f6626e 100644
> > > --- a/include/linux/of.h
> > > +++ b/include/linux/of.h
> > > @@ -153,6 +153,7 @@ extern struct device_node *of_stdout;
> > >   #define OF_POPULATED_BUS       4 /* platform bus created for children */
> > >   #define OF_OVERLAY             5 /* allocated for an overlay */
> > >   #define OF_OVERLAY_FREE_CSET   6 /* in overlay cset being freed */
> > > +#define OF_CREATED_WITH_CSET    7 /* created by of_changeset_create_node */
> > > 
> > >   #define OF_BAD_ADDR    ((u64)-1)
> > > 
> > > 
> > > Lizhi
> > > 
> > > > Rob
