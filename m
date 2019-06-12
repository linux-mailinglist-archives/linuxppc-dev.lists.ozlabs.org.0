Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E93741C32
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 08:27:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Nxkh6hBczDr1g
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 16:27:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Nxhl3nDBzDqwl
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 16:26:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="eyDsg02x"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45Nxhl3Hcbz8t23
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 16:26:15 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45Nxhl301Dz9sNC; Wed, 12 Jun 2019 16:26:15 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::e43; helo=mail-vs1-xe43.google.com;
 envelope-from=oded.gabbay@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="eyDsg02x"; 
 dkim-atps=neutral
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45Nxhl1pb5z9s9y
 for <linuxppc-dev@ozlabs.org>; Wed, 12 Jun 2019 16:26:14 +1000 (AEST)
Received: by mail-vs1-xe43.google.com with SMTP id n2so9534202vso.6
 for <linuxppc-dev@ozlabs.org>; Tue, 11 Jun 2019 23:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lKi9fDU0Lxa/G5VIecJ7zcekWrVtK+7i/1xldaoGnKM=;
 b=eyDsg02xExXKcTNUxPVULiXqWMYD105i/SYss3Q7V7I4w3D6V8UOwCLq2ZoHI3mfQg
 OTOZo+12wHolv7tBGv3sdkmuSCqRtGRtsH/CXaw+WsTDMgkJfbsIxMXGQHVukIrCMeIp
 WMJtP4K8mh4CfnD/OzA0LsD4n5zUmMJFuZbqIliJxj+/ysyNeX8d0WMZJkgvyDtB53cj
 r8AAjqQ2NGyvklSU8TGfeou44Ndc8sZVnQxufRmi9ZUNRSE31V2H7I8bSiLHmCPd18cI
 IzURSSp1riW/tb78SPfnulXCdtyqSevY9l/dVLxcqTLtox2ZZPsTDydfn6bTGUfVyk/U
 s8xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lKi9fDU0Lxa/G5VIecJ7zcekWrVtK+7i/1xldaoGnKM=;
 b=ZzwpX25FkMAWG6IW8S8j7pKVlDWVwQO++EgiCGaQVzYsoNIPbaTiYQ+vCVtUMtmDIs
 v1rVFJclRZjaeBRfV+VJQiwDV4vxcfEbmLWr+07xDRVrMlNewZ5ul+GrylEnKeD6MfaD
 EED3BPDPWAcQxCuqX+/aPZXMrozSkfGzrMzQ28g35jKBe8n8IGy6c3+DIBSvdGOEAbD6
 1OsUti33rTgtv+1XCYNzTblFsVNPKghg2jCapHzLbbIHQ1GCOF9+oYQIIHIqZnzJKoJy
 s4xXc0gdQQf/MExiye6t00l3TQlpHsJJtfm1EamawCdsEo0PyvQgI5R3ShN+s5g/MRjC
 ibpQ==
X-Gm-Message-State: APjAAAUAy0FPR7mWNMGGaMed6x5JJOohMjjEQxMUImaoDkaBCBAyv2+L
 z1tY+ZwJ/uldf+kokplN9VXeT1Ou/0VAFcHi270=
X-Google-Smtp-Source: APXvYqwH8H0IVDzCPTEFhE+jcQW08UumKLElWDBxov+7klCRUS6XvGsbE9i0ORzHeyhkcLy76VZViwB8rgx59DVP6D8=
X-Received: by 2002:a67:e3d5:: with SMTP id k21mr28292559vsm.172.1560320771385; 
 Tue, 11 Jun 2019 23:26:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190611092144.11194-1-oded.gabbay@gmail.com>
 <20190611095857.GB24058@kroah.com>
 <20190611151753.GA11404@infradead.org> <20190611152655.GA3972@kroah.com>
 <CAFCwf13A73AxKzaa7Dk3tU-1NDgTFs4+xCO2os7SuSyUHZ9Z3Q@mail.gmail.com>
 <CAFCwf134nTD4FM_9Q+THQ7ZAZzGxhs15O6EheaRJMqM5wxi+aA@mail.gmail.com>
 <ca81ca5d56a3a12db5a92f5cf9745763a86572e8.camel@kernel.crashing.org>
In-Reply-To: <ca81ca5d56a3a12db5a92f5cf9745763a86572e8.camel@kernel.crashing.org>
From: Oded Gabbay <oded.gabbay@gmail.com>
Date: Wed, 12 Jun 2019 09:25:45 +0300
Message-ID: <CAFCwf11naDCqotNx2mrr18WpJ80T=9=jfsJWMSBu7KPrF5paJw@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] habanalabs: enable 64-bit DMA mask in POWER9
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
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
Cc: Russell Currey <ruscur@au1.ibm.com>,
 Oliver OHalloran <oliveroh@au1.ibm.com>, Greg KH <gregkh@linuxfoundation.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, linuxppc-dev@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 12, 2019 at 1:53 AM Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
>
> On Tue, 2019-06-11 at 20:22 +0300, Oded Gabbay wrote:
> >
> > > So, to summarize:
> > > If I call pci_set_dma_mask with 48, then it fails on POWER9. However,
> > > in runtime, I don't know if its POWER9 or not, so upon failure I will
> > > call it again with 32, which makes our device pretty much unusable.
> > > If I call pci_set_dma_mask with 64, and do the dedicated configuration
> > > in Goya's PCIe controller, then it won't work on x86-64, because bit
> > > 59 will be set and the host won't like it (I checked it). In addition,
> > > I might get addresses above 50 bits, which my device can't generate.
> > >
> > > I hope this makes things more clear. Now, please explain to me how I
> > > can call pci_set_dma_mask without any regard to whether I run on
> > > x86-64 or POWER9, considering what I wrote above ?
> > >
> > > Thanks,
> > > Oded
> >
> > Adding ppc mailing list.
>
> You can't. Your device is broken. Devices that don't support DMAing to
> the full 64-bit deserve to be added to the trash pile.
>
Hmm... right know they are added to customers data-centers but what do I know ;)

> As a result, getting it to work will require hacks. Some GPUs have
> similar issues and require similar hacks, it's unfortunate.
>
> Added a couple of guys on CC who might be able to help get those hacks
> right.
Thanks :)
>
> It's still very fishy .. the idea is to detect the case where setting a
> 64-bit mask will give your system memory mapped at a fixed high address
> (1 << 59 in our case) and program that in your chip in the "Fixed high
> bits" register that you seem to have (also make sure it doesn't affect
> MSIs or it will break them).
MSI-X are working. The set of bit 59 doesn't apply to MSI-X
transactions (AFAICS from the PCIe controller spec we have).
>
> This will only work as long as all of the system memory can be
> addressed at an offset from that fixed address that itself fits your
> device addressing capabilities (50 bits in this case). It may or may
> not be the case but there's no way to check since the DMA mask logic
> won't really apply.
Understood. In the specific system we are integrated to, that is the
case - we have less then 48 bits. But, as you pointed out, it is not a
generic solution but with my H/W I can't give a generic fit-all
solution for POWER9. I'll settle for the best that I can do.

>
> You might want to consider fixing your HW in the next iteration... This
> is going to bite you when x86 increases the max physical memory for
> example, or on other architectures.
Understood and taken care of.

>
> Cheers,
> Ben.
>
>
>
>
