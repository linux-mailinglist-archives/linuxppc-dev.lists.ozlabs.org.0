Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CA7FC819
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 14:48:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DN9t0Lj9zF60q
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2019 00:48:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d41;
 helo=mail-io1-xd41.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="alUJk1RQ"; 
 dkim-atps=neutral
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DMt45B4jzF7gZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2019 00:35:08 +1100 (AEDT)
Received: by mail-io1-xd41.google.com with SMTP id s3so6795141ioe.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 05:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SDMYH8wyhFJnrn+Ox/2VWjvOZYIwEyWGWTeXD5Vgcdk=;
 b=alUJk1RQQwuxGMqaBmhWEA3xWwlf84pGl1oPk1UGnp6sNptml0YSuwSmzfOdaLngvm
 xT9yXTbdpD+5Mmjq9qfgd99SR2Xd9/WKlXVb753/XZB0eLbp2ilzQ814E9RshkDMNePK
 XVYZek9gQ9r5icYTst/3MYqvE102Us7C4+IP6PJpztGtYwAJOGfsJDgi99h4zC/qIsbr
 T7Qkg6ApEJYiJWj7uZVKnz9hfA0NmYN8bzQjkZ4m0zdVL6MqJABjrdaZVHGtXo9p0avt
 9jGDrUjuTVG5fke8UncntagtKL8gq+ZiCqhWBaSriK+N1Z8d7MCKtLzOjZ1Q1dflbKV6
 wXhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SDMYH8wyhFJnrn+Ox/2VWjvOZYIwEyWGWTeXD5Vgcdk=;
 b=R0SxqsiTmrWjovxs71E9uxvE7eCmFtcGxcns1RQYsyQbgiJYwk01myP5vM6hbWk8cX
 xYlz5f7z6ND+w6PomJ3oyPqC/JY1JIqaQlvyMxCWDNBM1f9ffa3mg2mWIMhjVUrVHEmM
 bK+XPoVCsV6Tag6UlhGQR5fLubih4iNlP4NQW53/mIUrpgch2x8AM6wdMctRNXQL80mt
 ynDhqrGSJBGhuA6OlnpLaCJl2+/MaVkVkbBjmYpWdLyqY7edCeEZpcmGZ/cwcgAtffj9
 bQnJ7ijOFYDjPsNn6dn+jNM3IhgND5WOJDmuWrmzh3x7YASdJL5wVHCJBjVn/xcw4X+F
 l6Dg==
X-Gm-Message-State: APjAAAXR0iNAYNZWQqcrbAg8Vu7qvc2ysveOYHCbqyJWxwvzduyqHr3b
 +Hy0vXfTtEVrf2LsIXuU3sd1WKkn5GEVe04r1cU=
X-Google-Smtp-Source: APXvYqw8JmfGbQA+DhukuQdd5C2QtFkiE5/ehse5+R9TvBZT5tIQ4lki5Zbxe09l6ZD+NsFNDDvvJnvONkdK/MFQECE=
X-Received: by 2002:a02:730d:: with SMTP id y13mr7613282jab.124.1573738501850; 
 Thu, 14 Nov 2019 05:35:01 -0800 (PST)
MIME-Version: 1.0
References: <20191113094035.22394-1-oohall@gmail.com>
 <20191113143143.GA54971@google.com>
In-Reply-To: <20191113143143.GA54971@google.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Fri, 15 Nov 2019 00:34:50 +1100
Message-ID: <CAOSf1CHzBJjxOd0f-CZcGPDW6S5GXMvw+6VmzBADJWeP2y1WAQ@mail.gmail.com>
Subject: Re: [PATCH] powerpc/powernv: Disable native PCIe port management
To: Bjorn Helgaas <helgaas@kernel.org>
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
Cc: linux-pci@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 14, 2019 at 1:31 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> This is fine, but it feels like sort of a blunt instrument.  Is there
> any practical way to clear pci_host_bridge.native_pcie_hotplug (and
> native_aer if appropriate) for the PHBs in question? That would also
> prevent pciehp from binding.

It is a large hammer, but I don't see a better way to handle it for
the moment. I had another look and my initial assessment was wrong in
that it's the portbus driver which claims the MSI rather than pciehp
itself. The MSI in the PCIe capability is shared between hotplug
events, PMEs, and BW notifications so to make the portbus concept work
the portbus driver needs to own the interrupt. Basicly, pnv_php and
portbus are fundamentally at odds with each other and can't be used
concurrently.

I also think there's some latent issues with the interaction of DPC
and EEH since they operate off the same set of error messages. We
haven't run into any problems yet, but I think that's largely because
we haven't shipped any systems with DPC enabled. In any case, I'd
prefer we disabled portbus until we've fully unpacked what's going on
there.

> We might someday pull portdrv into the PCI core directly instead of as
> a separate driver, and I'm thinking that might be easier if we have
> more specific indications of what the core shouldn't use.

It's not intended to be a permanent change. In the long term I want to
move everything except the initialisation and reset of the PHB out of
firmware and into the kernel so we can use more of the native PCIe
management features.
