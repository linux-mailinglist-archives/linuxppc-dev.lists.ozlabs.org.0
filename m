Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BADA921B55E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 14:48:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B3CWc1BTPzDr7Z
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 22:48:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d32;
 helo=mail-io1-xd32.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=GUYwLpsj; dkim-atps=neutral
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B3CSY1YrHzDrN8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jul 2020 22:45:32 +1000 (AEST)
Received: by mail-io1-xd32.google.com with SMTP id q8so5852522iow.7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jul 2020 05:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sZcRO1f+b9jNVOk+x2TB9QgvGJvzpJtVdNfPnEf5s1o=;
 b=GUYwLpsj8qQAESV2nZd93IXVIRWuIKi4fAaq36fiyQN+QxUJg0T4bppoDK9gQHLScZ
 YAAXDocKH5MOsyJXBEgwuG72PzgdztqVAgEH4w+z75r9Uj2DQZ8xay6QAmq1lI0ADqOq
 CtyWQlCoXV8NWFM0QNSlwS9UqM8BYnPXvWN2T3I0bW21ku15Gvf7ARrmVbumtEKDOPhB
 1BMsvfn3g37abilL4UdaVOXZMEceW+cW9EGAL5AL3rGnNz5dJcUQ5hKdmbJ43gVqvwD8
 /+3fUkS8N9dAZC1TAkv/rgcl7t4zGd5ehkS1Sof82TnBIFP9SNnF5wHaUe1tjJrTjFRT
 77YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sZcRO1f+b9jNVOk+x2TB9QgvGJvzpJtVdNfPnEf5s1o=;
 b=PAF7SyjEZ0y4UJJkGLTG0AVqOzaOUDDI0E/1hVfA2ywGmuBwiiciyR0EBdeHA9r6kj
 VqFFEetDg05368mIQErZG1O8nQ6j8qJ/6Iz0uZkKerx8axpyW74BDaMxbsQmyplwQnL/
 1RYs6/3zzUwr7wDyj897qLzdA+te3FHILsDoY+hjZEt0PqbLA8lZkxCZ2WQMreyRb4Zv
 Y1+Hwoa/AV2qdjH20eE9CoN1yd4kqiLvfQs5/o/3tcIkYUDPurBGMmHEXwynw8D7J+Uj
 Axx3HiE43t5AdxRhzuCX7MXuCE8iweL/CjfEUZdwwBPmRU4QMlgsFe6i9+rkS8zWJaNT
 CMhg==
X-Gm-Message-State: AOAM531TLz4JWT3Q3M70YCZdTd2F3KTQYTH26tCCsTuJ7bsIlzd4UKVy
 P6mPvyX2IZJmj/AL3pCoWrdK2uyCrbkY8a3XC3c=
X-Google-Smtp-Source: ABdhPJxddDuO4dGAjJ2ezUEpnPpnjF6sV6CTpQ/0brpm0QJ+Wj5WblRjFKwmGirGRFIaag3TnGFsZuG4284+KODqSb8=
X-Received: by 2002:a02:b714:: with SMTP id g20mr69585673jam.117.1594385129117; 
 Fri, 10 Jul 2020 05:45:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200710052340.737567-1-oohall@gmail.com>
 <20200710064535.GA8354@infradead.org>
In-Reply-To: <20200710064535.GA8354@infradead.org>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Fri, 10 Jul 2020 22:45:17 +1000
Message-ID: <CAOSf1CFj3x+V=0UwDpCOJ8v+sgSihUCaTbwwT1ziddPeYmD=Uw@mail.gmail.com>
Subject: Re: PowerNV PCI & SR-IOV cleanups
To: Christoph Hellwig <hch@infradead.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-pci <linux-pci@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 10, 2020 at 4:45 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Fri, Jul 10, 2020 at 03:23:25PM +1000, Oliver O'Halloran wrote:
> > This is largely prep work for supporting VFs in the 32bit MMIO window.
> > This is an unfortunate necessity due to how the Linux BAR allocator
> > handles BARs marked as non-prefetchable. The distinction
> > between prefetch and non-prefetchable BARs was made largely irrelevant
> > with the introduction of PCIe, but the BAR allocator is overly
> > conservative. It will always place non-pref bars in the prefetchable
> > window, which is 32bit only. This results in us being unable to use VFs
> > from NVMe drives and a few different RAID cards.
>
> How about fixing that in the core PCI code?

I've been kicking around the idea but I've never managed to convince
myself that ignoring the non-prefetchable bit is a safe thing to do in
generic code. Since Gen3 at least the PCIe Base spec has provided some
guidance about when you can put non-prefetchable BARs in the
prefetchable window and as of the Gen5 spec it lists these conditions:

> 1) The entire path from the host to the adapter is over PCI Express.
> 2) No conventional PCI or PCI-X devices do peer-to-peer reads to the range mapped by the BAR.
> 3) The PCI Express Host Bridge does no byte merging. (This is believed to be true on most platforms.)
> 4) Any locations with read side-effects are never the target of Memory Reads with the TH bit Set.
> 5) The range mapped by the BAR is never the target of a speculative Memory Read, either Host initiated or peer-to-peer.

1) Is easy enough to verify.
2) Is probably true, but who knows.
3) I know this is true for the platforms I'm looking at since the HW
designers assure me there is no merging happening at the host-bridge
level. Merging of MMIO ops does seem like an insane thing to do so
it's probably true in general too, but there's no real way to tell.
4) Is also *probably* true since the TH bit is only set when it's
explicitly enabled via the TLP Processing Hints extended capability in
config space. I guess it's possible firmware might enable that without
Linux realising, but in that case Linux is probably not doing BAR
allocation.
5) I have no idea about, but it seems difficult to make any kind of
general statement about.

I might just be being paranoid.

Oliver
