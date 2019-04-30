Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 75594F014
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 07:47:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tVt85dVfzDqQq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 15:47:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=popple.id.au
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=alistair@popple.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=popple.id.au
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tVqn5HGvzDqRL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 15:45:41 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3U5gORt017163
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 01:45:38 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2s6dqedc48-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 01:45:38 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <alistair@popple.id.au>;
 Tue, 30 Apr 2019 06:45:36 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 30 Apr 2019 06:45:32 +0100
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x3U5jVUn51904766
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Apr 2019 05:45:31 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 35A8742042;
 Tue, 30 Apr 2019 05:45:31 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 90A544203F;
 Tue, 30 Apr 2019 05:45:30 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 30 Apr 2019 05:45:30 +0000 (GMT)
Received: from townsend.localnet (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id EBDD7A01D2;
 Tue, 30 Apr 2019 15:45:28 +1000 (AEST)
From: Alistair Popple <alistair@popple.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH kernel v3] powerpc/powernv: Isolate NVLinks between
 GV100GL on Witherspoon
Date: Tue, 30 Apr 2019 15:45:28 +1000
User-Agent: KMail/5.2.3 (Linux/4.18.0-0.bpo.1-amd64; KDE/5.28.0; x86_64; ; )
In-Reply-To: <da41cd35-32f6-043e-13ab-9a225c4e910a@ozlabs.ru>
References: <20190411064844.8241-1-aik@ozlabs.ru>
 <4f7069cf-8c25-6fe1-42df-3b4af2d52172@ozlabs.ru>
 <da41cd35-32f6-043e-13ab-9a225c4e910a@ozlabs.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-TM-AS-GCONF: 00
x-cbid: 19043005-0012-0000-0000-00000316B566
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19043005-0013-0000-0000-0000214F1CAC
Message-Id: <5149814.2BROG1NTNO@townsend>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-30_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=67 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1034 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=797 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904300038
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
Cc: Jose Ricardo Ziviani <joserz@linux.ibm.com>, kvm@vger.kernel.org,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Piotr Jaroszynski <pjaroszynski@nvidia.com>, kvm-ppc@vger.kernel.org,
 Sam Bobroff <sbobroff@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Leonardo Augusto =?ISO-8859-1?Q?Guimar=E3es?= Garcia <lagarcia@br.ibm.com>,
 Reza Arbab <arbab@linux.ibm.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Alexey,

> >>> +void pnv_try_isolate_nvidia_v100(struct pci_dev *bridge)
> >>> +{
> >>> +	u32 mask, val;
> >>> +	void __iomem *bar0_0, *bar0_120000, *bar0_a00000;
> >>> +	struct pci_dev *pdev;
> >>> +	u16 cmd = 0, cmdmask = PCI_COMMAND_MEMORY;
> >>> +
> >>> +	if (!bridge->subordinate)
> >>> +		return;
> >>> +
> >>> +	pdev = list_first_entry_or_null(&bridge->subordinate->devices,
> >>> +			struct pci_dev, bus_list);
> >>> +	if (!pdev)
> >>> +		return;
> >>> +
> >>> +	if (pdev->vendor != PCI_VENDOR_ID_NVIDIA)

Don't you also need to check the PCIe devid to match only [PV]100 devices as 
well? I doubt there's any guarantee these registers will remain the same for 
all future (or older) NVIDIA devices.

IMHO this should really be done in the device driver in the guest. A malcious 
guest could load a modified driver that doesn't do this, but that should not 
compromise other guests which presumably load a non-compromised driver that 
disables the links on that guests GPU. However I guess in practice what you 
have here should work equally well.

- Alistair

> >>> +		return;
> >>> +
> >>> +	mask = nvlinkgpu_get_disable_mask(&pdev->dev);
> >>> +	if (!mask)
> >>> +		return;
> >>> +
> >>> +	bar0_0 = pci_iomap_range(pdev, 0, 0, 0x10000);
> >>> +	if (!bar0_0) {
> >>> +		pci_err(pdev, "Error mapping BAR0 @0\n");
> >>> +		return;
> >>> +	}
> >>> +	bar0_120000 = pci_iomap_range(pdev, 0, 0x120000, 0x10000);
> >>> +	if (!bar0_120000) {
> >>> +		pci_err(pdev, "Error mapping BAR0 @120000\n");
> >>> +		goto bar0_0_unmap;
> >>> +	}
> >>> +	bar0_a00000 = pci_iomap_range(pdev, 0, 0xA00000, 0x10000);
> >>> +	if (!bar0_a00000) {
> >>> +		pci_err(pdev, "Error mapping BAR0 @A00000\n");
> >>> +		goto bar0_120000_unmap;
> >>> +	}
> >> 
> >> Is it really necessary to do three separate ioremaps vs one that would
> >> cover them all here?  I suspect you're just sneaking in PAGE_SIZE with
> >> the 0x10000 size mappings anyway.  Seems like it would simplify setup,
> >> error reporting, and cleanup to to ioremap to the PAGE_ALIGN'd range
> >> of the highest register accessed. Thanks,
> > 
> > Sure I can map it once, I just do not see the point in mapping/unmapping
> > all 0xa10000>>16=161 system pages for a very short period of time while
> > we know precisely that we need just 3 pages.
> > 
> > Repost?
> 
> Ping?
> 
> Can this go in as it is (i.e. should I ping Michael) or this needs
> another round? It would be nice to get some formal acks. Thanks,
> 
> >> Alex
> >> 
> >>> +
> >>> +	pci_restore_state(pdev);
> >>> +	pci_read_config_word(pdev, PCI_COMMAND, &cmd);
> >>> +	if ((cmd & cmdmask) != cmdmask)
> >>> +		pci_write_config_word(pdev, PCI_COMMAND, cmd | cmdmask);
> >>> +
> >>> +	/*
> >>> +	 * The sequence is from "Tesla P100 and V100 SXM2 NVLink Isolation on
> >>> +	 * Multi-Tenant Systems".
> >>> +	 * The register names are not provided there either, hence raw values.
> >>> +	 */
> >>> +	iowrite32(0x4, bar0_120000 + 0x4C);
> >>> +	iowrite32(0x2, bar0_120000 + 0x2204);
> >>> +	val = ioread32(bar0_0 + 0x200);
> >>> +	val |= 0x02000000;
> >>> +	iowrite32(val, bar0_0 + 0x200);
> >>> +	val = ioread32(bar0_a00000 + 0x148);
> >>> +	val |= mask;
> >>> +	iowrite32(val, bar0_a00000 + 0x148);
> >>> +
> >>> +	if ((cmd | cmdmask) != cmd)
> >>> +		pci_write_config_word(pdev, PCI_COMMAND, cmd);
> >>> +
> >>> +	pci_iounmap(pdev, bar0_a00000);
> >>> +bar0_120000_unmap:
> >>> +	pci_iounmap(pdev, bar0_120000);
> >>> +bar0_0_unmap:
> >>> +	pci_iounmap(pdev, bar0_0);
> >>> +}


