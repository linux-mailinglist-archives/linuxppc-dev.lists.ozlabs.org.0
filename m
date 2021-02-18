Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 830BA31E644
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Feb 2021 07:22:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dh4Pf4VlXz30Pf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Feb 2021 17:22:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JmkEVYlI;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JmkEVYlI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=63.128.21.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=jasowang@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=JmkEVYlI; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=JmkEVYlI; 
 dkim-atps=neutral
X-Greylist: delayed 933 seconds by postgrey-1.36 at boromir;
 Thu, 18 Feb 2021 17:22:06 AEDT
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dh4PB4psvz30Jd
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Feb 2021 17:22:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613629322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I4q+YxVSVW16DE0+d+Y+BYB1zXwlSir3yUCLZoTFOt0=;
 b=JmkEVYlI8XnYiKA4oRVNZBM4Ksk3N0qedOu5B3AA+56Eq/99lHtPgTUsvIBHEr3+L/FAG5
 3Ipy3zi0b1wQhEvqHTq4RPv6bqCT1YvRblI7iNIUJtyxQrj9ZId9xGVwsBICMR+9odVguY
 /U490RlDGDshfJTVzLBJButhYepIkAE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613629322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I4q+YxVSVW16DE0+d+Y+BYB1zXwlSir3yUCLZoTFOt0=;
 b=JmkEVYlI8XnYiKA4oRVNZBM4Ksk3N0qedOu5B3AA+56Eq/99lHtPgTUsvIBHEr3+L/FAG5
 3Ipy3zi0b1wQhEvqHTq4RPv6bqCT1YvRblI7iNIUJtyxQrj9ZId9xGVwsBICMR+9odVguY
 /U490RlDGDshfJTVzLBJButhYepIkAE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-PZmTWchaOh2HvEa0I-vBkg-1; Thu, 18 Feb 2021 01:05:15 -0500
X-MC-Unique: PZmTWchaOh2HvEa0I-vBkg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C659E801965;
 Thu, 18 Feb 2021 06:05:12 +0000 (UTC)
Received: from [10.72.13.28] (ovpn-13-28.pek2.redhat.com [10.72.13.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BFAFC6A03D;
 Thu, 18 Feb 2021 06:05:00 +0000 (UTC)
Subject: Re: [PATCH] arm64: defconfig: enable modern virtio pci device
To: Arnd Bergmann <arnd@kernel.org>, Anders Roxell <anders.roxell@linaro.org>
References: <20210210190506.1923684-1-anders.roxell@linaro.org>
 <CAK8P3a2ysNApoG2FDsLdNoWA7nPXvzLMzkjXWdCig9jaSWwuKw@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <fffdfa8f-38c1-6fd1-d043-8a4f476213dc@redhat.com>
Date: Thu, 18 Feb 2021 14:04:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a2ysNApoG2FDsLdNoWA7nPXvzLMzkjXWdCig9jaSWwuKw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "Michael S. Tsirkin" <mst@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Catalin Marinas <catalin.marinas@arm.com>, linux-xtensa@linux-xtensa.org,
 Paul Walmsley <paul.walmsley@sifive.com>,
 virtualization@lists.linux-foundation.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, SoC Team <soc@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Will Deacon <will@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 2021/2/11 下午7:52, Arnd Bergmann wrote:
> On Wed, Feb 10, 2021 at 8:05 PM Anders Roxell <anders.roxell@linaro.org> wrote:
>> Since patch ("virtio-pci: introduce modern device module") got added it
>> is not possible to boot a defconfig kernel in qemu with a virtio pci
>> device.  Add CONFIG_VIRTIO_PCI_MODERN=y fragment makes the kernel able
>> to boot.
>>
>> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
>> ---
>>   arch/arm/configs/multi_v7_defconfig         | 1 +
>>   arch/arm64/configs/defconfig                | 1 +
> Acked-by: Arnd Bergmann <arnd@arndb.de>
>
> Michael, can you pick this up in the vhost tree that introduces the regression?
>
>           Arnd
>

Hi:

Based on the discussion previously, the plan is to select 
VIRTIO_PCI_MODERN, and document the module that select it must depend on 
PCI.

I will post a patch soon.

Thanks

