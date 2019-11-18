Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAA5FFD1F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Nov 2019 03:38:20 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47GY6K21HQzDqRf
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Nov 2019 13:38:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=popple.id.au
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=alistair@popple.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=popple.id.au
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47GY4Z70bvzDqKl
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2019 13:36:46 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAI2W8AP118886
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Nov 2019 21:36:37 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2way1ysws6-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Nov 2019 21:36:37 -0500
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <alistair@popple.id.au>;
 Mon, 18 Nov 2019 02:36:35 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 18 Nov 2019 02:36:33 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAI2aVAn22347862
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Nov 2019 02:36:31 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AE5835204E;
 Mon, 18 Nov 2019 02:36:31 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 5B17052050;
 Mon, 18 Nov 2019 02:36:31 +0000 (GMT)
Received: from townsend.localnet (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id D7C51A01EA;
 Mon, 18 Nov 2019 13:36:28 +1100 (AEDT)
From: Alistair Popple <alistair@popple.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 01/11] powerpc/powernv/ioda: Fix ref count for devices
 with their own PE
Date: Mon, 18 Nov 2019 13:36:29 +1100
In-Reply-To: <CAOSf1CEzb_Y4NdXGNPYTOxTR5w7OtBUU+VY46CR6Ou5kwEhJqA@mail.gmail.com>
References: <20190909154600.19917-1-fbarrat@linux.ibm.com>
 <7553103.1BsQ81z3e0@townsend>
 <CAOSf1CEzb_Y4NdXGNPYTOxTR5w7OtBUU+VY46CR6Ou5kwEhJqA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-TM-AS-GCONF: 00
x-cbid: 19111802-0028-0000-0000-000003B99407
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19111802-0029-0000-0000-0000247CAA9D
Message-Id: <2783297.m1VkgVQdWf@townsend>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-17_05:2019-11-15,2019-11-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=975
 malwarescore=0 bulkscore=0 suspectscore=11 spamscore=0 adultscore=0
 clxscore=1034 mlxscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911180018
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
Cc: Andrew Donnellan <ajd@linux.ibm.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Greg Kurz <groug@kaod.org>, Christophe Lombard <clombard@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 Andrew Donnellan <andrew.donnellan@au1.ibm.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Reza Arbab <arbab@linux.ibm.com>,
 Alastair D'Silva <alastair@au1.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Monday, 18 November 2019 12:24:24 PM AEDT Oliver O'Halloran wrote:
> On Mon, Nov 18, 2019 at 12:06 PM Alistair Popple <alistair@popple.id.au>=
=20
wrote:
> >
> > On Wednesday, 13 November 2019 4:38:21 AM AEDT Frederic Barrat wrote:
> > >
> > > However, one question is whether this patch breaks nvlink and if nvli=
nk
> > > assumes the devices won=E2=80=99t go away because we explicitly take =
a reference
> > > forever. In npu_dma.c, there are 2 functions which allow to find the =
GPU
> > > associated to a npu device, and vice-versa. Both functions return a
> > > pointer to a struct pci_dev, but they don=E2=80=99t take a reference =
on the
> > > device being returned. So that seems dangerous. I=E2=80=99m probably =
missing
> > > something.
> > >
> > > Alexey, Alistair: what, if anything, guarantees, that the npu or gpu
> > > devices stay valid. Is it because we simply don=E2=80=99t provide any=
 means to
> > > get rid of them ? Otherwise, don=E2=80=99t we need the callers of
> > > pnv_pci_get_gpu_dev() and pnv_pci_get_npu_dev() to worry about refere=
nce
> > > counting ? I=E2=80=99ve started looking into it and the changes are s=
cary, which
> > > explains Greg=E2=80=99s related commit 02c5f5394918b.
> >
> > To be honest the reference counting looks like it has evolved into=20
something
> > quite suspect and I don't think you're missing anything. In practice=20
though we
> > likely haven't hit any issues because the original callers didn't store
> > references to the pdev which would make the window quite small (althoug=
h=20
the
> > pass through work may have changed that). And as you say there simply=20
wasn't
> > any means to get rid of them anyway (EEH, hotplug, etc. has never been
> > implemented or supported for GPUs and all sorts of terrible things happ=
en=20
if
> > you try).
>=20
> In other words: leaking a ref is the only safe thing to do.

Correct.

> > The best solution would likely be to review the reference counting and =
to
> > teach callers of get_*_dev() to call pci_put_dev(), etc.
>=20
> The issue is that the two callers of get_pci_dev() are non-GPL
> exported symbols so we don't know what's calling them or what their
> expectations are. We be doing whatever makes sense for OpenCAPI and if
> that happens to cause a problem for someone else, then they can deal
> with it.

The issue isn't that it's exported non-GPL vs. GPL, rather that there are=20
probably out-of-tree modules like the NVIDIA driver using it. However as yo=
u=20
say supporting out-of-tree modules is not generally a concern for kernel=20
developers so we certainly shouldn't let that prevent us doing a fix.

=2D Alistair

> Oliver




