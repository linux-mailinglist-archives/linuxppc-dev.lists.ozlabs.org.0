Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 858EEDA3E4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Oct 2019 04:36:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ttZb71xvzDqNR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Oct 2019 13:36:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=209.132.183.28; helo=mx1.redhat.com;
 envelope-from=jasowang@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ttXR10GJzDr4g
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Oct 2019 13:34:11 +1100 (AEDT)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id ED16410DCC97;
 Thu, 17 Oct 2019 02:34:07 +0000 (UTC)
Received: from [10.72.12.185] (ovpn-12-185.pek2.redhat.com [10.72.12.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 138295D9DC;
 Thu, 17 Oct 2019 02:34:00 +0000 (UTC)
Subject: Re: [PATCH 2/2] virtio_ring: Use DMA API if memory is encrypted
To: Christoph Hellwig <hch@lst.de>, Ram Pai <linuxram@us.ibm.com>
References: <1570843519-8696-1-git-send-email-linuxram@us.ibm.com>
 <1570843519-8696-2-git-send-email-linuxram@us.ibm.com>
 <1570843519-8696-3-git-send-email-linuxram@us.ibm.com>
 <20191015073501.GA32345@lst.de>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <398dce4b-9290-0b14-28b1-e521331ec309@redhat.com>
Date: Thu, 17 Oct 2019 10:33:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191015073501.GA32345@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.64]); Thu, 17 Oct 2019 02:34:08 +0000 (UTC)
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
Cc: andmike@us.ibm.com, sukadev@linux.vnet.ibm.com, mdroth@linux.vnet.ibm.com,
 b.zolnierkie@samsung.com, aik@linux.ibm.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, iommu@lists.linux-foundation.org,
 paul.burton@mips.com, robin.murphy@arm.com, m.szyprowski@samsung.com,
 linuxppc-dev@lists.ozlabs.org, david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 2019/10/15 下午3:35, Christoph Hellwig wrote:
> On Fri, Oct 11, 2019 at 06:25:19PM -0700, Ram Pai wrote:
>> From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
>>
>> Normally, virtio enables DMA API with VIRTIO_F_IOMMU_PLATFORM, which must
>> be set by both device and guest driver. However, as a hack, when DMA API
>> returns physical addresses, guest driver can use the DMA API; even though
>> device does not set VIRTIO_F_IOMMU_PLATFORM and just uses physical
>> addresses.
> Sorry, but this is a complete bullshit hack.  Driver must always use
> the DMA API if they do DMA, and if virtio devices use physical addresses
> that needs to be returned through the platform firmware interfaces for
> the dma setup.  If you don't do that yet (which based on previous
> informations you don't), you need to fix it, and we can then quirk
> old implementations that already are out in the field.
>
> In other words: we finally need to fix that virtio mess and not pile
> hacks on top of hacks.


I agree, the only reason for IOMMU_PLATFORM is to make sure guest works 
for some old and buggy qemu when vIOMMU is enabled which seems useless 
(note we don't even support vIOMMU migration in that case).

Thanks

