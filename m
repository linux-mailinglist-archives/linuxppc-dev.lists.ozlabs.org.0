Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F8322399F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 12:45:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B7SSN4d0SzDrCB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 20:45:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d44;
 helo=mail-io1-xd44.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Sh5xu9u/; dkim-atps=neutral
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B7SQl059zzDrNt
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jul 2020 20:43:42 +1000 (AEST)
Received: by mail-io1-xd44.google.com with SMTP id v6so9949595iob.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jul 2020 03:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k8uVrhgOhQqs7eK819gJP8Isbzose7d4S6jSpx+aI80=;
 b=Sh5xu9u/wMBK0BIZ3S3CrccFZFXqFVJ4Ty0AQHr0cL8kZHGhS3jOuXUk9jXjaeRefF
 y+C9/gckVZKpTLyBboNKSeD5GSoq5i2gnSTzY9jDo1h3YCoOiz021y7F01Wt1gFKGePd
 ZEIpDHPAYgr9nTouyQ75MdKyfuqMKP/WY7KRH7f6B6cDSyWsBc0eTi6RWbW19OBEIpWR
 7mu5uRRArsi5V/QNvhzymvCcRP0TD3pa0BJ+pTr2rbnt3ONv6qKPOKajYE/O+NHxx83H
 7vJ/K9Y/CIfHTKFwaRU7xDEQeKUUtOjYSvtWxNDzSpOm0gdBf9n+IcV7LZJHGe/MSHLZ
 3vzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k8uVrhgOhQqs7eK819gJP8Isbzose7d4S6jSpx+aI80=;
 b=Nyazj5rDz6o3Hg2ItnixL9hfcgDZ95ZLQM4OvVXfogtoCTw1BU2sw/HIo1Tguc3W2t
 b0Fr0i4bzyJqQSdz1L3NjorhpECyRRi97Vy79cD1aAGzRKHKjnbPsi2ENmQfZaP22KA8
 +q/fDfItAnzB+EcD4MRlMY2Umo1SE+GSKA4KHD1KTf58zzfXVXnuZpDzNzRHF6YHDfgu
 3EVP7iEhlygjbhOJjF4Y/v+cJvfRVu7pwdRT6fIodnhr10LOSNFxYQs/s/YXxkLKqxSv
 v06SSRe7Z+Ch6POmp5ks971UIdIaeaCzDtH5+tA08L+jaovJEjTDfn1eZx39jf4Dxe4z
 /QBg==
X-Gm-Message-State: AOAM5325YGmIS9FQVlvDLR+k03baSDKcq9CTV3StXY0H88EMPgjgqLdR
 Faptfl/RRf6LvMw6dzfz6ar40j6yg0tgZcqQhoM=
X-Google-Smtp-Source: ABdhPJxtuasrS8D2ZlPmVecjcSsGZsiTpJFsPWZr7RaOLcuYkOg1E6NK9odWW/xu2ORR28QduMslbT/r0b/7WEdeWxM=
X-Received: by 2002:a6b:c343:: with SMTP id t64mr9228896iof.66.1594982618648; 
 Fri, 17 Jul 2020 03:43:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAO3ALPy8_pxVyFROZUWNafEH1vUCP6LVpNmBBuMDSewGitzdLw@mail.gmail.com>
 <CAOSf1CEOu5jX6KXKWiConBf=TDwF3qdASMxtfDjqSR6vOKN4XA@mail.gmail.com>
 <CAO3ALPwZPN1vdqHaFsuSpgj63o6Z69VUg0LngmCSnvESrO4kNg@mail.gmail.com>
In-Reply-To: <CAO3ALPwZPN1vdqHaFsuSpgj63o6Z69VUg0LngmCSnvESrO4kNg@mail.gmail.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Fri, 17 Jul 2020 20:43:27 +1000
Message-ID: <CAOSf1CEiCOjTQ8XX=cC10eghaC+1xaRG-bju8VBFQStOCaU_xQ@mail.gmail.com>
Subject: Re: ASMedia USB 3.x host controllers triggering EEH on POWER9
To: Forest Crossman <cyrozap@gmail.com>
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
Cc: linux-pci <linux-pci@vger.kernel.org>, linux-usb@vger.kernel.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 17, 2020 at 8:10 PM Forest Crossman <cyrozap@gmail.com> wrote:
>
> > From word 2 of the PEST entry the faulting DMA address is:
> > 0x0000203974c00000. That address is interesting since it looks a lot
> > like a memory address on the 2nd chip, but it doesn't have bit 59 set
> > so TVE#0 is used to validate it. Obviously that address is above 2GB
> > so we get the error.
>
> Ah, I see. Do you know if the information on the PEST registers is
> documented publicly somewhere? I tried searching for what those
> registers meant in the PHB4 spec but it basically just said, "the PEST
> registers contain PEST data," which isn't particularly helpful.

Most of it is in the IODA spec. See Sec 2.2.6 "Partitionable-Endpoint
State Table", the only part that isn't documented there is the top
bits of each word which are documented in the PHB spec for some
reason. For word one the top bit (PPCBIT(0)) means MMIO is frozen and
for word two (PPCBIT(64)) the top bit indicates DMA is frozen.

> > What's probably happening is that the ASmedia controller doesn't
> > actually implement all 64 address bits and truncates the upper bits of
> > the DMA address. Doing that is a blatant violation of the PCIe (and
> > probably the xHCI) spec, but it's also pretty common since "it works
> > on x86." Something to try would be booting with the iommu=nobypass in
> > the kernel command line. That'll disable TVE#1 and force all DMAs to
> > go through TVE#0.
>
> Thanks, iommu=nobypass fixed it! Plugging in one or more USB devices
> no longer triggers any EEH errors.
>
> > Assuming the nobypass trick above works, what you really need to do is
> > have the driver report that it can't address all 64bits by setting its
> > DMA mask accordingly. For the xhci driver it looks like this is done
> > in xhci_gen_setup(), there might be a quirks-style interface for
> > working around bugs in specific controllers that you can use. Have a
> > poke around and see what you can find :)
>
> Yup, the xhci driver has a quirks system, and conveniently one of
> those is XHCI_NO_64BIT_SUPPORT. After making a 3-line patch to
> xhci-pci.c to add that quirk for this chip, the host controller is now
> able to work without setting iommu=nobypass in the kernel arguments.

Cool

> Thank you so much for your help! You've likely saved me several hours
> of reading documentation, as well as several more hours of fiddling
> around with the xhci driver.

> I'm almost disappointed the fix was so
> simple, but the time savings alone more than makes up for it. I'll
> submit the patch to the USB ML shortly.

It might be only three lines, but it doesn't mean it's trivial. Most
bugs like that require a lot of context to understand, let alone fix.
Thanks for looking into it!

Oliver
