Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13995233CB4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jul 2020 02:54:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BHphm714HzDqZm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jul 2020 10:54:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BHpgG0DhszDqYq
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jul 2020 10:53:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=HOVgrxON; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BHpgD6J8Gz9sTC;
 Fri, 31 Jul 2020 10:53:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1596156809;
 bh=q2tssuIDveYqbFkMs1yaRdtxwLZGwL9vDNdk/ysVitc=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=HOVgrxONu5EB/WzntDuvVao96/SBZONZVrmvsECd7EbFr4hppukrb6vt3WUPD6xzC
 UXsMDWIAOlPhKETCBcfHsw2iYAU247EKRDIdVLfW9KxtMjMlR1xehqwsKLzTw3QjRP
 zVDj54FDf8FtvzCBKXFSgYvHlIwSU53JYoIRbpqS8Ow93ifowd7tJnKxP1KT2kqFbh
 b5dD6KSw+G4jZcK28UvyHhK0q7AZOrm8crGoCbTsH4AkR/kCXRZwwqVdzkQGKx+3zQ
 HU3GKVUxVGwC7plKInXeJCkTdWv+FKBr3wNi1kL3u7WYtxfZrVWt8AP+dehJAB/iEM
 vORU2V1z2A1Qg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2] powerpc/vio: drop bus_type from parent device
In-Reply-To: <20200730053716.GA3862178@kroah.com>
References: <20200406155748.6761-1-cascardo@canonical.com>
 <87ime56bax.fsf@mpe.ellerman.id.au> <20200730053716.GA3862178@kroah.com>
Date: Fri, 31 Jul 2020 10:53:27 +1000
Message-ID: <87a6zg5wu0.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Stephen Rothwell <sfr@ozlabs.org>,
 Thadeu Lima de Souza Cascardo <cascardo@canonical.com>,
 Peter Rajnoha <prajnoha@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Greg KH <gregkh@linuxfoundation.org> writes:
> On Thu, Jul 30, 2020 at 11:28:38AM +1000, Michael Ellerman wrote:
>> [ Added Peter & Greg to Cc ]
>> 
>> Thadeu Lima de Souza Cascardo <cascardo@canonical.com> writes:
>> > Commit df44b479654f62b478c18ee4d8bc4e9f897a9844 ("kobject: return error
>> > code if writing /sys/.../uevent fails") started returning failure when
>> > writing to /sys/devices/vio/uevent.
>> >
>> > This causes an early udevadm trigger to fail. On some installer versions of
>> > Ubuntu, this will cause init to exit, thus panicing the system very early
>> > during boot.
>> >
>> > Removing the bus_type from the parent device will remove some of the extra
>> > empty files from /sys/devices/vio/, but will keep the rest of the layout
>> > for vio devices, keeping them under /sys/devices/vio/.
>> 
>> What exactly does it change?
>> 
>> I'm finding it hard to evaluate if this change is going to cause a
>> regression somehow.
>> 
>> I'm also not clear on why removing the bus type is correct, apart from
>> whether it fixes the bug you're seeing.
>> 
>> > It has been tested that uevents for vio devices don't change after this
>> > fix, they still contain MODALIAS.
>> >
>> > Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
>> > Fixes: df44b479654f ("kobject: return error code if writing /sys/.../uevent fails")
>> 
>> AFAICS there haven't been any other fixes for that commit. Do we know
>> why it is only vio that was affected? (possibly because it's a fake bus
>> to begin with?)
>
> So there was an error previously, the core was ignoring it, and now it
> isn't and to fix that you want to remove describing what bus a device is
> on?
>
> Huh???

Right.

Not to mention there are existing unfixed kernels out there, so whatever
userspace is crashing will need to be fixed for those anyway.

>> > diff --git a/arch/powerpc/platforms/pseries/vio.c b/arch/powerpc/platforms/pseries/vio.c
>> > index 37f1f25ba804..a94dab3972a0 100644
>> > --- a/arch/powerpc/platforms/pseries/vio.c
>> > +++ b/arch/powerpc/platforms/pseries/vio.c
>> > @@ -36,7 +36,6 @@ static struct vio_dev vio_bus_device  = { /* fake "parent" device */
>> >  	.name = "vio",
>> >  	.type = "",
>> >  	.dev.init_name = "vio",
>> > -	.dev.bus = &vio_bus_type,
>> >  };
>
> Wait, a static 'struct device'?  You all are playing with fire there.
> That's a reference counted object, and should never be declared like
> that at all.

Since 2005 :)

AC33c9bcf1 ("[PATCH] ppc64: tidy up vio devices fake parent")


> I see you register it, but never unregister it, why?  Why is it even
> needed?

I don't remember, if I ever knew.

The code says:

	/*
	 * The fake parent of all vio devices, just to give us
	 * a nice directory
	 */
	err = device_register(&vio_bus_device.dev);


But I suspect that may no longer be true.

ie. the devices show up in /sys/bus/vio/devices because they have
dev.bus = vio_bus_type, the fake parent doesn't seem to determine the
location.

> And if you remove the bus type of it, it will show up in a different
> part of sysfs, so I think this patch will show a user-visable change,
> right?

Yes I think so. But because it's a fake device to begin with that's
possibly OK.

I think we really need to get to the bottom of whether we need that
device at all, it seems like it might be left over cruft from the
ancient past.

I'll try and find time to work it out.

cheers
