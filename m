Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCB892EAA3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2024 16:22:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Vp9D4zD2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WKcPP4DCqz3cp1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2024 00:22:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Vp9D4zD2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=amachhiw@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WKcNk3FJ0z3cQM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jul 2024 00:21:41 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46BDxDbF029159;
	Thu, 11 Jul 2024 14:21:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date
	:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-transfer-encoding:in-reply-to; s=pp1; bh=H
	y7Ow+QuFzjJ8HpKXMdsxifcalcMak4d4YwFzu94KDM=; b=Vp9D4zD2DTnztFWPx
	4JTvWSirWHljxahtUil6FV8CbRXG1/dxWfsR7npfISHY7xqnCT9AXNnmaI/Uwhs6
	MAzRkUwjMyCscFRPllshORjUcTwq/GLaqdE/uxMgax9zcB0sGWVL0iABn97JX7Kd
	5Z/GaRQjSwKV11UEdgXzjHxYYl4HzNW7E4svVSXwIWkUs5X8DwbRx4uBDdy97QEX
	L75H8hTMxkpU5f/tVBsm0Me+PbMk+e7TexD58x/Hlsgl6KRoztQOuBn0DtoZdRou
	DbqIWoFscwSUGowvCdRuJEPFBdlYeOpwCy2ciRs1ElR+DFZYVIzjOm2P4x0xE+ov
	nmEEQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40agrb02d5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jul 2024 14:21:30 +0000 (GMT)
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 46BELU10031657;
	Thu, 11 Jul 2024 14:21:30 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40agrb02cy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jul 2024 14:21:30 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 46BBDMKW024698;
	Thu, 11 Jul 2024 14:21:29 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 407g8uhdqy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jul 2024 14:21:29 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 46BELNvx15335856
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 11 Jul 2024 14:21:25 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5D6542004D;
	Thu, 11 Jul 2024 14:21:23 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AE0B220040;
	Thu, 11 Jul 2024 14:21:14 +0000 (GMT)
Received: from li-e7e2bd4c-2dae-11b2-a85c-bfd29497117c.ibm.com (unknown [9.195.44.247])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 11 Jul 2024 14:21:14 +0000 (GMT)
Date: Thu, 11 Jul 2024 19:51:06 +0530
From: Amit Machhiwal <amachhiw@linux.ibm.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] PCI: Fix crash during pci_dev hot-unplug on pseries KVM
 guest
Message-ID: <qcidmczsjdhaqz7hy3cqnpkjiaulxi7277ayzly3zyrrdbcr4w@5s4x5cgd3xk2>
Mail-Followup-To: Rob Herring <robh@kernel.org>, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org, 
	Bjorn Helgaas <bhelgaas@google.com>, Lizhi Hou <lizhi.hou@amd.com>, 
	Vaibhav Jain <vaibhav@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Vaidyanathan Srinivasan <svaidy@linux.ibm.com>, 
	Kowshik Jois B S <kowsjois@linux.ibm.com>
References: <20240703141634.2974589-1-amachhiw@linux.ibm.com>
 <CAL_JsqL9hg8Hze4oOP1R55yVXBfTKE=RfwdBraNHiO71K21uNA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqL9hg8Hze4oOP1R55yVXBfTKE=RfwdBraNHiO71K21uNA@mail.gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: OdiQBSyMmWoj7PQSjzWTRMr86YEyO3b6
X-Proofpoint-ORIG-GUID: vNxGWtVZgWNpTeQ951TVzKXP0lr4nCmh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-11_09,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 mlxscore=0 spamscore=0 mlxlogscore=664 priorityscore=1501
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407110099
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
Cc: Kowshik Jois B S <kowsjois@linux.ibm.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org, Vaidyanathan Srinivasan <svaidy@linux.ibm.com>, Lizhi Hou <lizhi.hou@amd.com>, Nicholas Piggin <npiggin@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Rob,

On 2024/07/11 06:20 AM, Rob Herring wrote:
> On Wed, Jul 3, 2024 at 8:17 AM Amit Machhiwal <amachhiw@linux.ibm.com> wrote:
> >
> > With CONFIG_PCI_DYNAMIC_OF_NODES [1], a hot-plug and hot-unplug sequence
> > of a PCI device attached to a PCI-bridge causes following kernel Oops on
> > a pseries KVM guest:
> 
> Can I ask why you have this option on in the first place? Do you have
> a use for it or it's just a case of distros turn on every kconfig
> option.

Yes, this option is turned on in Ubuntu's distro kernel config where the issue
was originally reported, while Fedora is keeping this turned off.

    root@ubuntu:~# cat /boot/config-6.8.0-38-generic | grep PCI_DYN
    CONFIG_PCI_DYNAMIC_OF_NODES=y

    root@fedora:~# cat /boot/config-6.9.7-200.fc40.ppc64le | grep PCI_DYN
    # CONFIG_PCI_DYNAMIC_OF_NODES is not set

Thanks,
Amit

> 
> Rob
