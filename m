Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E02F2197
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 23:25:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477h1K4NhYzF5s2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 09:25:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=linuxram@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477gym03bTzDqQ8
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2019 09:22:55 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xA6MGVn5022883
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 6 Nov 2019 17:22:53 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w46ms8dgy-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Nov 2019 17:22:52 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <linuxram@us.ibm.com>;
 Wed, 6 Nov 2019 22:22:50 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 6 Nov 2019 22:22:45 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id xA6MM9FI36569426
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 6 Nov 2019 22:22:09 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9F61FA4051;
 Wed,  6 Nov 2019 22:22:44 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D218EA404D;
 Wed,  6 Nov 2019 22:22:40 +0000 (GMT)
Received: from oc0525413822.ibm.com (unknown [9.80.236.142])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed,  6 Nov 2019 22:22:40 +0000 (GMT)
Date: Wed, 6 Nov 2019 14:22:37 -0800
From: Ram Pai <linuxram@us.ibm.com>
To: Michael Roth <mdroth@linux.vnet.ibm.com>
References: <1572902923-8096-1-git-send-email-linuxram@us.ibm.com>
 <265679db-9cb3-1660-0cf6-97f740b1b48b@ozlabs.ru>
 <20191106130558-mutt-send-email-mst@kernel.org>
 <157306632211.17570.17567742230498149897@sif>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <157306632211.17570.17567742230498149897@sif>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
x-cbid: 19110622-4275-0000-0000-0000037B7171
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19110622-4276-0000-0000-0000388EC0D6
Message-Id: <20191106222237.GE5201@oc0525413822.ibm.com>
Subject: RE: [RFC v1 0/2] Enable IOMMU support for pseries Secure VMs
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-06_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1910280000 definitions=main-1911060212
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
Reply-To: Ram Pai <linuxram@us.ibm.com>
Cc: andmike@us.ibm.com, "Michael S. Tsirkin" <mst@redhat.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, linux-kernel@vger.kernel.org,
 ram.n.pai@gmail.com, cai@lca.pw, tglx@linutronix.de,
 sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, hch@lst.de,
 bauerman@linux.ibm.com, david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 06, 2019 at 12:52:02PM -0600, Michael Roth wrote:
> Quoting Michael S. Tsirkin (2019-11-06 12:06:37)
> > On Wed, Nov 06, 2019 at 12:59:50PM +1100, Alexey Kardashevskiy wrote:
> > > 
> > > 
> > > On 05/11/2019 08:28, Ram Pai wrote:
> > > > This patch series enables IOMMU support for pseries Secure VMs.
> > > > 
> > > > 
> > > > Tested using QEMU command line option:
> > > > 
> > > >  "-device virtio-scsi-pci,id=scsi0,bus=pci.0,addr=0x4,
> > > >     iommu_platform=on,disable-modern=off,disable-legacy=on"
> > > >  and 
> > > > 
> > > >  "-device virtio-blk-pci,scsi=off,bus=pci.0,
> > > >     addr=0x5,drive=drive-virtio-disk0,id=virtio-disk0,
> > > >     iommu_platform=on,disable-modern=off,disable-legacy=on"
> > > 
> > > 
> > > Worth mentioning that SLOF won't boot with such devices as SLOF does not know about iommu_platform=on.
> > 
> > Shouldn't be hard to support: set up the iommu to allow everything
> > and ack the feature. Right?
> 
> It's not a static/linear mapping in this case so we need calls to map DMA
> buffers as-needed. I've gotten it to boot with virtio-blk, but the patches
> have some hacks and need cleanup, hoping to post them soon.
> 
> I'm a bit perplexed how we would manage to boot a guest without those
> changes though, this is what I get with qemu 4.1.0:
> 
>   qemu-system-ppc64 -M pseries,ic-mode=xics -m 512M -bios /home/mdroth/w/build/qemu-4.1.0-build/pc-bios/slof.bin -device virtio-blk-pci,drive=drive0,id=blk0,disable-modern=off,disable-legacy=on,iommu_platform=on -drive file=/home/mdroth/vm/bionic-server-cloudimg-ppc64el.img,if=none,id=drive0 -trace enable=spapr_iommu\*,file=trace.out -monitor unix:/tmp/mon.sock,server,nowait -vga none -nographic
>   qemu-system-ppc64: warning: TCG doesn't support requested feature, cap-cfpc=workaround
>   qemu-system-ppc64: warning: TCG doesn't support requested feature, cap-sbbc=workaround
>   qemu-system-ppc64: warning: TCG doesn't support requested feature, cap-ibs=workaround
>   
>   
>   SLOF **********************************************************************
>   QEMU Starting
>    Build Date = Jul  3 2019 12:26:14
>    FW Version = git-ba1ab360eebe6338
>    Press "s" to enter Open Firmware.
>   
>   Populating /vdevice methods
>   Populating /vdevice/vty@71000000
>   Populating /vdevice/nvram@71000001
>   Populating /vdevice/l-lan@71000002
>   Populating /vdevice/v-scsi@71000003
>          SCSI: Looking for devices
>             8200000000000000 CD-ROM   : "QEMU     QEMU CD-ROM      2.5+"
>   Populating /pci@800000020000000
>                        00 0000 (D) : 1af4 1042    virtio [ block ]
>   No NVRAM common partition, re-initializing...
>   Scanning USB
>   Using default console: /vdevice/vty@71000000
>   
>     Welcome to Open Firmware
>   
>     Copyright (c) 2004, 2017 IBM Corporation All rights reserved.
>     This program and the accompanying materials are made available
>     under the terms of the BSD License available at
>     https://urldefense.proofpoint.com/v2/url?u=http-3A__www.opensource.org_licenses_bsd-2Dlicense.php&d=DwIFaQ&c=jf_iaSHvJObTbx-siA1ZOg&r=m-UrKChQVkZtnPpjbF6YY99NbT8FBByQ-E-ygV8luxw&m=-xG4gaWE7BANKGOFx0wmF5ZgZVd8A1r-tsN44n4JUW4&s=QcpPgRqeZAk1pICsA-kk2gNKKiMJLASiPVi-hPinur0&e= 
>   
>   
>   Trying to load:  from: /pci@800000020000000/scsi@0 ... virtioblk_init: failed
>   virtioblk_transfer: Access beyond end of device!
> 
> And then it hangs. This is with TCG so maybe it behaves differently with
> KVM, but that's the result I would expect with the current SLOF code.

you are right. In my case, I was providing the kernel image
on the qemu command line. So there was no need for SLOF to read the
virtio disk. Hence it continued without hanging. SLOF needs to be enhanced
to support IOMMU.


RP

