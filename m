Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C12A1303AF9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jan 2021 12:00:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQ3g254rzzDqTw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jan 2021 22:00:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.161.43; helo=mail-oo1-f43.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com
 [209.85.161.43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DQ3Zp3zlPzDql0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jan 2021 21:56:48 +1100 (AEDT)
Received: by mail-oo1-f43.google.com with SMTP id n127so3995464ooa.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jan 2021 02:56:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vE9H2Qr5sibnEqk/nQ37bCH833rnUqU+D/XJreRlBIY=;
 b=b06m+hpAybHLTnIfDz9Pyxw0evbLHIe4R21wXNPO4+psOiHxqlls8OV1PqrKroGRzc
 twMlBSbXXVGU/F0vL0+1/h8VTlPP4wWmAaOe3TG0ZSa06ZqJdkJvSKmxKG3Pf1asITlD
 fbxMM/Fi8Kj4VYD21R0Ee74rtf0XsudBmspxkrmGoKF0FKGH8NDd7MiKpjL5LedSTZx6
 U8mphrXd72kj4YBLBue5GJ5ygcLc63+ZgNfNuMg95klLZo6pN7gLGRST4Z5cqfZziYFr
 WzpCUNU5EX8jxzgcwPvsIPUMdU0JA4QRUa20Wla9jupCoW5OlvXY7ncuaGruSzm9Rfc4
 /K/A==
X-Gm-Message-State: AOAM531PISnqIVEQB0cF8w03l2CQj2kwhvUHYMW840+AK/UuP3BCU7zl
 eA7mSWYxFxVMVU/PdtDv+44/7+fOgow31Q11Fd4=
X-Google-Smtp-Source: ABdhPJwTZPke/usOg0RvQsIEXnT6uGT4ZI8MRW0YYj/Wx3ZAFOAdXjRdctIR0fTh39ONcS4pufK/qV8Y8blx+4t+oGI=
X-Received: by 2002:a4a:cb87:: with SMTP id y7mr3536978ooq.1.1611658604662;
 Tue, 26 Jan 2021 02:56:44 -0800 (PST)
MIME-Version: 1.0
References: <20210120105246.23218-1-michael@walle.cc>
 <20210126100256.GA20547@e121166-lin.cambridge.arm.com>
 <1a36ef741c5ab2a6e90b38c58944aa25@walle.cc>
In-Reply-To: <1a36ef741c5ab2a6e90b38c58944aa25@walle.cc>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 26 Jan 2021 11:56:33 +0100
Message-ID: <CAMuHMdUE25X326b2RaW+R_XFcFpdP5GsesoTMero3Em7vp5WzQ@mail.gmail.com>
Subject: Re: [PATCH] PCI: dwc: layerscape: convert to builtin_platform_driver()
To: Michael Walle <michael@walle.cc>
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
Cc: Roy Zang <roy.zang@nxp.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Saravana Kannan <saravanak@google.com>, linux-pci <linux-pci@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Minghuan Lian <minghuan.Lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

On Tue, Jan 26, 2021 at 11:46 AM Michael Walle <michael@walle.cc> wrote:
> Am 2021-01-26 11:02, schrieb Lorenzo Pieralisi:
> > On Wed, Jan 20, 2021 at 11:52:46AM +0100, Michael Walle wrote:
> >> fw_devlink will defer the probe until all suppliers are ready. We
> >> can't
> >> use builtin_platform_driver_probe() because it doesn't retry after
> >> probe
> >> deferral. Convert it to builtin_platform_driver().
> >>
> >> Fixes: e590474768f1 ("driver core: Set fw_devlink=on by default")
> >
> > I will have to drop this Fixes: tag if you don't mind, it is not
> > in the mainline.
>
> That commit is in Greg's for-next tree:
> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git/commit/?h=driver-core-next&id=e590474768f1cc04852190b61dec692411b22e2a
>
> I was under the impression there are other commits with this
> particular fixes tag, too. Either it was removed from
> for-next queues or I was confused.
>
> But I'm fine with removing the tag, assuming this will end
> up together with the "driver core: Set fw_devlink=on by default"
> commit in 5.11.

Definitely not v5.11.

And I sincerely doubt it will be applied for v5.12.
It's already way too late to implement all changes to existing drivers
needed, and get them accepted for v5.12.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
