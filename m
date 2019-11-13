Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC29FAE54
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 11:17:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47CgXl0K3QzF7cj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 21:17:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo6-p01-ob.smtp.rzone.de (client-ip=2a01:238:20a:202:5301::7;
 helo=mo6-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.b="IaPBejWA"; 
 dkim-atps=neutral
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47CgTm41KnzF65S
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 21:15:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1573640098;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=J7/OnwrZ9IrNVa3LANzeKLBHmUi2jZG0D6gUnLn+clU=;
 b=IaPBejWAAJYKVKMyhzz9n+WaDD3NhuSt0cRuEEx3o3f92SdbACRwBMaUGrUMpGvEJ/
 XdcnksUTlf/Z1jTrEpWyrxeVxxK81JBrA9Bfgaw3sWRa6FG8D/4Ic6iwK1fBoBa6384f
 F8VHRPuMBO6qtFccnTint6yR2XM6G5b18aCmYEiQEPuMTQwAqgz+YgWJsTb+HnuL8QPk
 vri+aCxRpyDrDgHkjqnIAjDpVXRJccZO2q8X1GjgZOeqYAHSVijcFgH7nGv42kiXqvq4
 Th4qvGlzKO6wHHMF723s4v2F9xtbLr+vYfVgrhQUTFqZgPS91doBSaUtBdXSjmLjc0yD
 /wSw==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPgFIzdVjkULP4r2k+hZ6iFmBbj9vw=="
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a02:8109:89c0:ebfc:f53b:829e:4025:ce2b]
 by smtp.strato.de (RZmta 44.29.0 AUTH)
 with ESMTPSA id q007c8vADAEHlLm
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Wed, 13 Nov 2019 11:14:17 +0100 (CET)
Subject: Re: Bug 205201 - overflow of DMA mask and bus mask
To: Christoph Hellwig <hch@lst.de>
References: <71A251A5-FA06-4019-B324-7AED32F7B714@xenosoft.de>
 <1b0c5c21-2761-d3a3-651b-3687bb6ae694@xenosoft.de>
 <3504ee70-02de-049e-6402-2d530bf55a84@xenosoft.de>
 <46025f1b-db20-ac23-7dcd-10bc43bbb6ee@xenosoft.de>
 <20191105162856.GA15402@lst.de>
 <2f3c81bd-d498-066a-12c0-0a7715cda18f@xenosoft.de>
 <d2c614ec-c56e-3ec2-12d0-7561cd30c643@xenosoft.de>
 <af32bfcc-5559-578d-e1f4-75e454c965bf@xenosoft.de>
 <0c5a8009-d28b-601f-3d1a-9de0e869911c@xenosoft.de>
 <a794864f-04ae-9b90-50e7-01b416c861fe@xenosoft.de>
 <20191112144109.GA11805@lst.de>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <9b14ca1b-2d5d-52b5-c7b4-0e637dbb1157@xenosoft.de>
Date: Wed, 13 Nov 2019 11:14:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191112144109.GA11805@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: de-DE
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
Cc: linux-arch@vger.kernel.org, darren@stevens-zone.net,
 mad skateman <madskateman@gmail.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, paulus@samba.org, rtd2@xtra.co.nz,
 "contact@a-eon.com" <contact@a-eon.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, nsaenzjulienne@suse.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Christoph,

I have found the issue. :-)

GFP_DMA32 was renamed to GFP_DMA in the PowerPC updates 4.21-1 in 
December last year.

Some PCI devices still use GFP_DMA32 (grep -r GFP_DMA32 *). I renamed 
GFP_DMA32 to GFP_DMA in the file 
"drivers/media/v4l2-core/videobuf-dma-sg.c". After compiling the RC7 of 
kernel 5.4 my TV card works again.

Cheers,
Christian


On 12 November 2019 at 3:41 pm, Christoph Hellwig wrote:
> On Mon, Nov 11, 2019 at 01:22:55PM +0100, Christian Zigotzky wrote:
>> Now, I can definitely say that this patch does not solve the issue.
>>
>> Do you have another patch for testing or shall I bisect?
> I'm still interested in the .config and dmesg.  Especially if the
> board is using arch/powerpc/sysdev/fsl_pci.c, which is the only
> place inside the powerpc arch code doing funny things with the
> bus_dma_mask, which Robin pointed out looks fishy.
>
>> Thanks,
>> Christian
> ---end quoted text---
>

