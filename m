Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F255109D04
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 12:31:00 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MhYB1xywzDqZ3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 22:30:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo6-p01-ob.smtp.rzone.de (client-ip=2a01:238:20a:202:5301::5;
 helo=mo6-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.b="ISxc3Vqe"; 
 dkim-atps=neutral
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47MhTG3hJBzDqNN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2019 22:27:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1574767641;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=XMLW3ZOSKguCOTt53NHCRHDrLj4NFW5PozSyNNqJ0vs=;
 b=ISxc3VqelFXRdpV5RV1vK9hqPD+P7jZeMBPb+ujq5LPUW3Zez77LOjTWz3LrQ9Ag0M
 4tHmnL4zFulSe6LHwcAg/J0dJRaUn/gx53K8JgJWSUERfjVOfhdaq/1+ZSTXjUfqRFas
 ysivGtIwrGv/mB9Sdd+YQqvMgQznUjDtMt2SddqJwMQHm5mxdYUfN2lXtsDv5WVZ+x2f
 mlDjqhiV1MsH5R8IosGfUmm+X2YQ7S9R0G0GcgjTgkio+8izc0YsbhBxzVVqIGDVqoUE
 g474OANnCPMo7CyVvnaI7ToWRBwE4aTCzODwJ1IO/H9XExiq5dZmL1EwHzKtBFMYhDkB
 lZzA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPhSIh0PhkEvMsMre1rbZ/xz+jsR"
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a02:8109:89c0:ebfc:14bb:b5af:17db:dc1]
 by smtp.strato.de (RZmta 45.0.2 AUTH) with ESMTPSA id x0678cvAQBQc8Vv
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Tue, 26 Nov 2019 12:26:38 +0100 (CET)
Subject: Re: Bug 205201 - Booting halts if Dawicontrol DC-2976 UW SCSI board
 installed, unless RAM size limited to 3500M
To: Christoph Hellwig <hch@lst.de>
References: <F1EBB706-73DF-430E-9020-C214EC8ED5DA@xenosoft.de>
 <20191121072943.GA24024@lst.de>
 <dbde2252-035e-6183-7897-43348e60647e@xenosoft.de>
 <6eec5c42-019c-a988-fc2a-cb804194683d@xenosoft.de>
 <d0252d29-7a03-20e1-ccd7-e12d906e4bdf@arm.com>
 <b3217742-2c0b-8447-c9ac-608b93265363@xenosoft.de>
 <20191121180226.GA3852@lst.de>
 <2fde79cf-875f-94e6-4a1b-f73ebb2e2c32@xenosoft.de>
 <20191125073923.GA30168@lst.de>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <4681f5fe-c095-15f5-9221-4b55e940bafc@xenosoft.de>
Date: Tue, 26 Nov 2019 12:26:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191125073923.GA30168@lst.de>
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
Cc: linux-arch@vger.kernel.org, darren@stevens-zone.net, rtd2@xtra.co.nz,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-kernel@vger.kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 paulus@samba.org, mad skateman <madskateman@gmail.com>,
 "contact@a-eon.com" <contact@a-eon.com>, Robin Murphy <robin.murphy@arm.com>,
 nsaenzjulienne@suse.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 25 November 2019 at 08:39 am, Christoph Hellwig wrote:
> On Sat, Nov 23, 2019 at 12:42:27PM +0100, Christian Zigotzky wrote:
>> Hello Christoph,
>>
>> Please find attached the dmesg of your Git kernel.
> Thanks.  It looks like on your platform the swiotlb buffer isn't
> actually addressable based on the bus dma mask limit, which is rather
> interesting.  swiotlb_init uses memblock_alloc_low to allocate the
> buffer, and I'll need some help from Mike and the powerpc maintainers
> to figure out how that select where to allocate the buffer from, and
> how we can move it to a lower address.  My gut feeling would be to try
> to do what arm64 does and define a new ARCH_LOW_ADDRESS_LIMIT, preferably
> without needing too much arch specific magic.
>
> As a quick hack can you try this patch on top of the tree from Friday?
>
> diff --git a/include/linux/memblock.h b/include/linux/memblock.h
> index f491690d54c6..e3f95c362922 100644
> --- a/include/linux/memblock.h
> +++ b/include/linux/memblock.h
> @@ -344,7 +344,7 @@ static inline int memblock_get_region_node(const struct memblock_region *r)
>   #define MEMBLOCK_LOW_LIMIT 0
>   
>   #ifndef ARCH_LOW_ADDRESS_LIMIT
> -#define ARCH_LOW_ADDRESS_LIMIT  0xffffffffUL
> +#define ARCH_LOW_ADDRESS_LIMIT  0x0fffffffUL
>   #endif
>   
>   phys_addr_t memblock_phys_alloc_range(phys_addr_t size, phys_addr_t align,
>
Hello Christoph,

The PCI TV card works with your patch! I was able to patch your Git 
kernel with the patch above.

I haven't found any error messages in the dmesg yet.

Thank you!

Cheers,
Christian
