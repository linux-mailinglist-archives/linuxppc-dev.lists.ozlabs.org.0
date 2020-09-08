Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C741C261B1A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Sep 2020 20:55:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BmDqb1rRgzDqRF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 04:55:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BmDmM4XYpzDqS6
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Sep 2020 04:52:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ZibE8aNU; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4BmDmJ0N0Lz8syr
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Sep 2020 04:52:32 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4BmDmH48X8z9sTR; Wed,  9 Sep 2020 04:52:31 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::343;
 helo=mail-ot1-x343.google.com; envelope-from=chunkeey@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ZibE8aNU; dkim-atps=neutral
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4BmDmG75Xlz9sTK
 for <linuxppc-dev@ozlabs.org>; Wed,  9 Sep 2020 04:52:30 +1000 (AEST)
Received: by mail-ot1-x343.google.com with SMTP id c10so70103otm.13
 for <linuxppc-dev@ozlabs.org>; Tue, 08 Sep 2020 11:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rEVfc7102aruoQnNs8/an5dNx6x874lhLVupvO8piOg=;
 b=ZibE8aNUyT2ZNL/rBW8SU9MxZ9F9pBXpIKcPl0zY4HfVL/zH1EVsZpEiR8wecsgOv+
 4+7zquW7RWTDWqt7SDS2kbowB+JBUy1cHus2w2HclNHy/i7hFcGlCZcy+4WKThzhYrw9
 NdQ/PaTQ10ilsQ0AeS8AtSIYK1fhnlZsFfA9X7IxMOmiB7qC7I3qN67TVHGIiCuaYOh1
 UmT4Vo1lJtRPSt55ZW7/6vVO7dqtc5vRhTjyia7dDiXR95+jepEDfKHbmAf5ucTU3yS2
 z+IIHUduJdw1B3erHZwaMBNjuqItsNdvF4Hdy9N7EeanI7DwrdqUH8Ccaon0WSIfLEhn
 NydQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rEVfc7102aruoQnNs8/an5dNx6x874lhLVupvO8piOg=;
 b=NW7h+9RvV/jBH4kRIzAAzNspp4UaneaQX+lkapuaUpKcekqY4EdDfawqKlu9IS0D7E
 +DnuzaS5lYQDKH6mUVxh3u5iRk1qbj7vxk5w05QE1knRyMSP4nKmm4ldxDzFfw9XChEM
 hHQUexKtJfq4Cv1jSLBrg6G2Rbb9ohHHg813oIg4Dt1zOA2ip6JJkN4qLwYhaxqZ7wRi
 xZTKKmheIhnw1IeuF343HZjXuScRfCRtndRFovgZP9r4a0FnAO+8FYRWu0DMx414/7FC
 FLpfWvm6AjscCs1wl2mSap4qY2l8x57yBANOxq72BO0xwLHUrDN0AZ8nALbjyHmSejEM
 IVcg==
X-Gm-Message-State: AOAM531wisVBOeqjkGQc0SMBOm604wY0JqXVxfDhy2DTloQPyBR3hJKU
 +CKPdtXkkBt8GUjXCaOVpEYtkyabyhfLaMdYrAM=
X-Google-Smtp-Source: ABdhPJw7bXy65SK7JkQMJzyH9hqZryxuVmQGgRNHxawuX7a+mVyqjQXkowp1sezNpYgBLR9mUqLagq7mZyj5AmWjitY=
X-Received: by 2002:a9d:4cd:: with SMTP id 71mr336230otm.131.1599591146690;
 Tue, 08 Sep 2020 11:52:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200623130320.405852-1-mpe@ellerman.id.au>
 <d2652e63-b136-a805-fd6d-00584b64c772@gmail.com>
 <87mu20spxd.fsf@mpe.ellerman.id.au>
In-Reply-To: <87mu20spxd.fsf@mpe.ellerman.id.au>
From: Christian Lamparter <chunkeey@gmail.com>
Date: Tue, 8 Sep 2020 20:52:14 +0200
Message-ID: <CAAd0S9Cc2M+JsqC+3DhLtaQEecweVX-toC2SxNAzNdogFeeTOw@mail.gmail.com>
Subject: Re: [PATCH] powerpc/boot/dts: Fix dtc "pciex" warnings
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: linuxppc-dev@ozlabs.org,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Chris Blake <chrisrblake93@gmail.com>,
 sfr@canb.auug.org.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On Tue, Sep 8, 2020 at 9:12 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
> Christian Lamparter <chunkeey@gmail.com> writes:
> > On 2020-06-23 15:03, Michael Ellerman wrote:
> >> With CONFIG_OF_ALL_DTBS=y, as set by eg. allmodconfig, we see lots of
> >> warnings about our dts files, such as:
> >>
> >>    arch/powerpc/boot/dts/glacier.dts:492.26-532.5:
> >>    Warning (pci_bridge): /plb/pciex@d00000000: node name is not "pci"
> >>    or "pcie"
> >>
> >
> >
> > Unfortunately yes. This patch will break uboot code in Meraki MX60(W) / MX60.
> >
> >  > https://github.com/riptidewave93/meraki-uboot/blob/mx60w-20180413/board/amcc/bluestone/bluestone.c#L1178
> >
> > | if (!pci_available()) {
> > |     fdt_find_and_setprop(blob, "/plb/pciex@d00000000", "status",
> > |                   "disabled", sizeof("disabled"), 1);
> > | }
> >
> >
> > Backstory: There are two version of the Meraki MX60. The MX60
> > and the MX60W. The difference is that the MX60W has a populated
> > mini-pcie slot on the PCB for a >W<ireless card.
> >
> > That said, this is not earth shattering.
>
> I'm happy to revert that hunk if you think any one is actually booting
> mainline on those.

The MX60(W) or APM82181 in general?

The APM82181 devices run really well on the kernel 5.8. The APM82181
had some bitrot and missing pieces. But I started at around 4.4 with
upstreaming various bits and stuff. For proof, I can post a bootlog from
my MyBook Live dev station running my mbl-debian on this weekend:
<https://github.com/chunkeey/mbl-debian>.

This WD MyBook Live project really only needs
 - vanilla 5.8 (I got rid of the make-kpkg hack by switching to make bindeb-pkg)
 - the MyBookLive DTS.
 - kernel config is based on arch/powerpc/configs/44x/bluestone_defconfig +
   (I enabled dwc2 (USB-Port on the DUO), SATA, ext4(+squashfs),
   gpio-support, leds-support, crypto44x)
 - a powerpc32 userspace (debian's sid still builds up-to-date powerpc packages)

For the MX60(W): We have those two supported in OpenWrt. Currently they
are running a OpenWrt kernel based on stable 5.4 series. The missing "bit"
is upstream support for the AR8327 ethernet switch. I know that the chip
can be supported by qca8k: <https://www.spinics.net/lists/netdev/msg420810.html>

....

But of course: My future work with the MX60(W) (and AR8327) depends on how
this series goes. I'm testing the waters with the Meraki MR24 AP and the
WD MyBook Live series. Reason being that both devices are well supported.
They are available in great quantities... and all the core functions
are working.

Cheers,
Christian
