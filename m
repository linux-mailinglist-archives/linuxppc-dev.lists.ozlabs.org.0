Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4DD601298
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Oct 2022 17:16:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MrgYV3NtLz3dwH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Oct 2022 02:15:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.222.181; helo=mail-qk1-f181.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MrgXv1yLFz3bkx
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Oct 2022 02:15:25 +1100 (AEDT)
Received: by mail-qk1-f181.google.com with SMTP id o22so6797290qkl.8
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Oct 2022 08:15:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sOV8A8y2OEDCqeDMSFkwrO9Qw07N2EwVNNkiwYHAOws=;
        b=TmJBVPGb9WKXs431Gm6ExWUY2xvprvWTEkmd6meCCPBPLjE9n958+Lvg2TfBOmZGw7
         0aljuZ3fjM3tr86hjRXIrDHbPM2sxnyz8ZHZDClnBT5CdY84ygOfOtGKkLuIDUt4MYY+
         +tJkl2lJzLH7VtWKcM5qFBekVbpms9xRz8psVjWtdHyzKaIq6xCEQbG3WmKEENHWJ2Xr
         MKfzlTc0TkTjQmdcaPW4tC/P2UH2rKURqmkm45eaNTAeVq9+oCD6pqEAsPhMC8rmWytt
         PuAasLiu4Lju4A5sdCt6hERRKnCv+Vks5LypNaSZJEOraVC09FwR0wf9X3vEoWHHjHkX
         lsnw==
X-Gm-Message-State: ACrzQf22cwuPGLAK+eunP+7/ZqvnNcPU1rVkoBNzSRRhYv6BhxdwH4xf
	pLY9Xab8c1xj7DlsQ72YF7s6MI2gBfEz+g==
X-Google-Smtp-Source: AMsMyM7lJzF3Z3FeH3E/6guKMWlnhvVHDax6fRfE4hmqWbqKJZPdHN/f2JVMfVSXeZTN2gptVDQUig==
X-Received: by 2002:ae9:c318:0:b0:6ee:245a:a4d8 with SMTP id n24-20020ae9c318000000b006ee245aa4d8mr7969356qkg.346.1666019722263;
        Mon, 17 Oct 2022 08:15:22 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id l12-20020a37f90c000000b006cbc6e1478csm31111qkj.57.2022.10.17.08.15.21
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Oct 2022 08:15:21 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id 126so13648868ybw.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Oct 2022 08:15:21 -0700 (PDT)
X-Received: by 2002:a25:4fc2:0:b0:6be:afb4:d392 with SMTP id
 d185-20020a254fc2000000b006beafb4d392mr8994270ybb.604.1666019721188; Mon, 17
 Oct 2022 08:15:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220902215737.981341-1-sean.anderson@seco.com> <20220902215737.981341-6-sean.anderson@seco.com>
In-Reply-To: <20220902215737.981341-6-sean.anderson@seco.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Oct 2022 17:15:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWqTtjuOvDo9qxgDVpm+RBGm7BEgpdqVRH1n_dLGoYLTA@mail.gmail.com>
Message-ID: <CAMuHMdWqTtjuOvDo9qxgDVpm+RBGm7BEgpdqVRH1n_dLGoYLTA@mail.gmail.com>
Subject: Re: [PATCH net-next v5 05/14] net: fman: Map the base address once
To: Sean Anderson <sean.anderson@seco.com>
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
Cc: Madalin Bucur <madalin.bucur@nxp.com>, netdev@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, Eric Dumazet <edumazet@google.com>, Camelia Groza <camelia.groza@nxp.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Sean,

On Sat, Sep 3, 2022 at 12:00 AM Sean Anderson <sean.anderson@seco.com> wrote:
> We don't need to remap the base address from the resource twice (once in
> mac_probe() and again in set_fman_mac_params()). We still need the
> resource to get the end address, but we can use a single function call
> to get both at once.
>
> While we're at it, use platform_get_mem_or_io and devm_request_resource
> to map the resource. I think this is the more "correct" way to do things
> here, since we use the pdev resource, instead of creating a new one.
> It's still a bit tricky, since we need to ensure that the resource is a
> child of the fman region when it gets requested.
>
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> Acked-by: Camelia Groza <camelia.groza@nxp.com>

Thanks for your patch, which is now commit 262f2b782e255b79
("net: fman: Map the base address once") in v6.1-rc1.

> --- a/drivers/net/ethernet/freescale/dpaa/dpaa_eth_sysfs.c
> +++ b/drivers/net/ethernet/freescale/dpaa/dpaa_eth_sysfs.c
> @@ -18,7 +18,7 @@ static ssize_t dpaa_eth_show_addr(struct device *dev,
>
>         if (mac_dev)
>                 return sprintf(buf, "%llx",
> -                               (unsigned long long)mac_dev->res->start);
> +                               (unsigned long long)mac_dev->vaddr);

On 32-bit:

    warning: cast from pointer to integer of different size
[-Wpointer-to-int-cast]

Obviously you should cast to "uintptr_t" or "unsigned long" instead,
and change the "%llx" to "%p" or "%lx"...

However, taking a closer look:
  1. The old code exposed a physical address to user space, the new
     code exposes the mapped virtual address.
     Is that change intentional?
  2. Virtual addresses are useless in user space.
     Moreover, addresses printed by "%p" are obfuscated, as this is
     considered a security issue. Likewise for working around this by
     casting to an integer.

What's the real purpose of dpaa_eth_show_addr()?
Perhaps it should be removed?

>         else
>                 return sprintf(buf, "none");
>  }

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
