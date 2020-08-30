Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DC22576D1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Aug 2020 11:48:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bg5454k62zDqTd
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Aug 2020 19:48:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.32.125.2;
 helo=smtpout1.mo529.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from smtpout1.mo529.mail-out.ovh.net
 (smtpout1.mo529.mail-out.ovh.net [178.32.125.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BfS810cLmzDqWK
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Aug 2020 19:04:30 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.2])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id F3603557382C;
 Sun, 30 Aug 2020 11:04:22 +0200 (CEST)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Sun, 30 Aug
 2020 11:04:21 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R0016ce9946f-44e8-4705-a814-a851a51eb937,
 A61985F152D94A1A5BA9A2811F8297B44BAD0564) smtp.auth=clg@kaod.org
Subject: Re: [PATCH 5/5] powerpc: use the generic dma_ops_bypass mode
To: Christoph Hellwig <hch@lst.de>, <iommu@lists.linux-foundation.org>, Alexey
 Kardashevskiy <aik@ozlabs.ru>
References: <20200708152449.316476-1-hch@lst.de>
 <20200708152449.316476-6-hch@lst.de>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <505bcc1d-01a7-9655-88e1-ebddd0b94d56@kaod.org>
Date: Sun, 30 Aug 2020 11:04:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200708152449.316476-6-hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: e391a1c1-ee29-474b-bb7b-57b64649e998
X-Ovh-Tracer-Id: 7752383811902344065
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrudeffedgudefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepgedvieejfedvhfduhfffueevheeludffhfdvkeehleegtddttdfhieegveeghfffnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohephhgthheslhhsthdruggv
X-Mailman-Approved-At: Mon, 31 Aug 2020 19:46:54 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, Daniel Borkmann <daniel@iogearbox.net>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>,
 Joerg Roedel <joro@8bytes.org>, Jesper Dangaard Brouer <brouer@redhat.com>,
 linux-kernel@vger.kernel.org, Oliver O'Halloran <oohall@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, aacraid@microsemi.com,
 Robin Murphy <robin.murphy@arm.com>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On 7/8/20 5:24 PM, Christoph Hellwig wrote:
> Use the DMA API bypass mechanism for direct window mappings.  This uses
> common code and speed up the direct mapping case by avoiding indirect
> calls just when not using dma ops at all.  It also fixes a problem where
> the sync_* methods were using the bypass check for DMA allocations, but
> those are part of the streaming ops.
> 
> Note that this patch loses the DMA_ATTR_WEAK_ORDERING override, which
> has never been well defined, as is only used by a few drivers, which
> IIRC never showed up in the typical Cell blade setups that are affected
> by the ordering workaround.
> 
> Fixes: efd176a04bef ("powerpc/pseries/dma: Allow SWIOTLB")
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/powerpc/Kconfig              |  1 +
>  arch/powerpc/include/asm/device.h |  5 --
>  arch/powerpc/kernel/dma-iommu.c   | 90 ++++---------------------------
>  3 files changed, 10 insertions(+), 86 deletions(-)

I am seeing corruptions on a couple of POWER9 systems (boston) when
stressed with IO. stress-ng gives some results but I have first seen
it when compiling the kernel in a guest and this is still the best way
to raise the issue.

These systems have of a SAS Adaptec controller :

  0003:01:00.0 Serial Attached SCSI controller: Adaptec Series 8 12G SAS/PCIe 3 (rev 01)

When the failure occurs, the POWERPC EEH interrupt fires and dumps
lowlevel PHB4 registers among which :
					  
  [ 2179.251069490,3] PHB#0003[0:3]:           phbErrorStatus = 0000028000000000
  [ 2179.251117476,3] PHB#0003[0:3]:      phbFirstErrorStatus = 0000020000000000

The bits raised identify a PPC 'TCE' error, which means it is related
to DMAs. See below for more details.


Reverting this patch "fixes" the issue but it is probably else where,
in some other layers or in the aacraid driver. How should I proceed 
to get more information ?

Thanks,

C.


[ 2054.970339] EEH: Frozen PE#1fd on PHB#3 detected
[ 2054.970375] EEH: PE location: UOPWR.BOS0019-Node0-Onboard SAS, PHB location: N/A
[ 2179.249415973,3] PHB#0003[0:3]:                  brdgCtl = 00000002
[ 2179.249515795,3] PHB#0003[0:3]:             deviceStatus = 00060040
[ 2179.249596452,3] PHB#0003[0:3]:               slotStatus = 00402000
[ 2179.249633728,3] PHB#0003[0:3]:               linkStatus = a0830008
[ 2179.249674807,3] PHB#0003[0:3]:             devCmdStatus = 00100107
[ 2179.249725974,3] PHB#0003[0:3]:             devSecStatus = 00100107
[ 2179.249773550,3] PHB#0003[0:3]:          rootErrorStatus = 00000000
[ 2179.249809823,3] PHB#0003[0:3]:          corrErrorStatus = 00000000
[ 2179.249850439,3] PHB#0003[0:3]:        uncorrErrorStatus = 00000000
[ 2179.249887411,3] PHB#0003[0:3]:                   devctl = 00000040
[ 2179.249928677,3] PHB#0003[0:3]:                  devStat = 00000006
[ 2179.249967150,3] PHB#0003[0:3]:                  tlpHdr1 = 00000000
[ 2179.250054987,3] PHB#0003[0:3]:                  tlpHdr2 = 00000000
[ 2179.250146600,3] PHB#0003[0:3]:                  tlpHdr3 = 00000000
[ 2179.250262780,3] PHB#0003[0:3]:                  tlpHdr4 = 00000000
[ 2179.250343101,3] PHB#0003[0:3]:                 sourceId = 00000000
[ 2179.250514264,3] PHB#0003[0:3]:                     nFir = 0000000000000000
[ 2179.250717971,3] PHB#0003[0:3]:                 nFirMask = 0030001c00000000
[ 2179.250791474,3] PHB#0003[0:3]:                  nFirWOF = 0000000000000000
[ 2179.250842054,3] PHB#0003[0:3]:                 phbPlssr = 0000001c00000000
[ 2179.250886003,3] PHB#0003[0:3]:                   phbCsr = 0000001c00000000
[ 2179.250929859,3] PHB#0003[0:3]:                   lemFir = 0000000100000080
[ 2179.250973720,3] PHB#0003[0:3]:             lemErrorMask = 0000000000000000
[ 2179.251018622,3] PHB#0003[0:3]:                   lemWOF = 0000000000000080
[ 2179.251069490,3] PHB#0003[0:3]:           phbErrorStatus = 0000028000000000
[ 2179.251117476,3] PHB#0003[0:3]:      phbFirstErrorStatus = 0000020000000000
[ 2179.251162218,3] PHB#0003[0:3]:             phbErrorLog0 = 2148000098000240
[ 2179.251206251,3] PHB#0003[0:3]:             phbErrorLog1 = a008400000000000
[ 2179.251253096,3] PHB#0003[0:3]:        phbTxeErrorStatus = 0000000000000000
[ 2179.265087656,3] PHB#0003[0:3]:   phbTxeFirstErrorStatus = 0000000000000000
[ 2179.265142247,3] PHB#0003[0:3]:          phbTxeErrorLog0 = 0000000000000000
[ 2179.265189734,3] PHB#0003[0:3]:          phbTxeErrorLog1 = 0000000000000000
[ 2179.266335296,3] PHB#0003[0:3]:     phbRxeArbErrorStatus = 0000000000000000
[ 2179.266380366,3] PHB#0003[0:3]: phbRxeArbFrstErrorStatus = 0000000000000000
[ 2179.266426523,3] PHB#0003[0:3]:       phbRxeArbErrorLog0 = 0000000000000000
[ 2179.267537283,3] PHB#0003[0:3]:       phbRxeArbErrorLog1 = 0000000000000000
[ 2179.267581708,3] PHB#0003[0:3]:     phbRxeMrgErrorStatus = 0000000000000000
[ 2179.267628324,3] PHB#0003[0:3]: phbRxeMrgFrstErrorStatus = 0000000000000000
[ 2179.268748771,3] PHB#0003[0:3]:       phbRxeMrgErrorLog0 = 0000000000000000
[ 2179.268794753,3] PHB#0003[0:3]:       phbRxeMrgErrorLog1 = 0000000000000000
[ 2179.268841144,3] PHB#0003[0:3]:     phbRxeTceErrorStatus = 6000000000000000
[ 2179.269945557,3] PHB#0003[0:3]: phbRxeTceFrstErrorStatus = 2000000000000000
[ 2179.269997896,3] PHB#0003[0:3]:       phbRxeTceErrorLog0 = c0000000000001fd
[ 2179.270094740,3] PHB#0003[0:3]:       phbRxeTceErrorLog1 = 0000000000000000
[ 2179.270144030,3] PHB#0003[0:3]:        phbPblErrorStatus = 0000000000020000
[ 2179.281523166,3] PHB#0003[0:3]:   phbPblFirstErrorStatus = 0000000000020000
[ 2179.281575378,3] PHB#0003[0:3]:          phbPblErrorLog0 = 0000000000000000
[ 2179.281627897,3] PHB#0003[0:3]:          phbPblErrorLog1 = 0000000000000000
[ 2179.282710177,3] PHB#0003[0:3]:      phbPcieDlpErrorLog1 = 0000000000000000
[ 2179.282761495,3] PHB#0003[0:3]:      phbPcieDlpErrorLog2 = 0000000000000000
[ 2179.282813999,3] PHB#0003[0:3]:    phbPcieDlpErrorStatus = 0000000000000000
[ 2179.283926192,3] PHB#0003[0:3]:       phbRegbErrorStatus = 0000004000000000
[ 2179.283978457,3] PHB#0003[0:3]:  phbRegbFirstErrorStatus = 0000004000000000
[ 2179.284033525,3] PHB#0003[0:3]:         phbRegbErrorLog0 = 8800005800000000
[ 2179.285123005,3] PHB#0003[0:3]:         phbRegbErrorLog1 = 0000000007011000
[ 2179.285178505,3] PHB#0003[0:3]:                PEST[1fd] = 8300b03800000000 8000000000000000
[ 2055.043233] EEH: Recovering PHB#3-PE#1fd
[ 2055.043274] EEH: PE location: UOPWR.BOS0019-Node0-Onboard SAS, PHB location: N/A
[ 2055.043423] aacraid 0003:01:00.0: aacraid: PCI error detected 2
[ 2055.099306] blk_update_request: I/O error, dev sda, sector 510949048 op 0x1:(WRITE) flags 0xc800 phys_seg 4 prio class 0
