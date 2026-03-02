Return-Path: <linuxppc-dev+bounces-17545-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCO2J0W9pWn8FQAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17545-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Mar 2026 17:39:33 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BE21DD0B5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Mar 2026 17:39:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fPl5D0XnZz3bmc;
	Tue, 03 Mar 2026 03:39:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.219.46
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772469567;
	cv=none; b=dWo8F1epcNcCw8kMqG18LZPiqTK1AZMWUvrWYy4++k+0v9LK8oCdjkOjQwPfNxcWTarJ1vHtAWcUr/ctuSbisAAcK4aTBni0SJLVGxyMrYro5080oUcche7J/Av5fjuOZ0gBdtRDdmXWY4t7YZPVo+1Mmn4jL0R/DV9Tg3dKCiyOBmiGdxubYJvg7cqL8ba5VujVCnJEFvWGc4Q9+U9IwXu3jlkTe5gVrk9ZnjDDd67i97VhumFRlmWwkh5fOHkoJIrVnq8HbO/jTnjmz4n57N4/0dnBWh8I4e//iRjhhHuMlPQen1iGFBz9sPmf2UfpYgN7zg8m2Ildh2OkkpxY8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772469567; c=relaxed/relaxed;
	bh=32KLibA2LnxuiBPJQhexbcq4h5vz7CZtFSoqgdy1YZE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YM09lYgHxgBbrli9BeSWVVdAOdNU1M3bYc7Akofzv0w4P0HF+f9xF2HVu5SHe0rwNBboMK83Mxf9P2mbpa+qS1PV4yXhIBg36EpD81Vd59oRu5/g4aLsCAAWgkJLtVP9909GoWhKD4UFOQ5lwusYz/wg3pXrIP7X2yh+qhKEZ2VunhMz1+Q32btAttx/smAl9NsR4IU4cy2WoqzEt1jLY8nchQaYKwP1kkPy17HcDoVMH/e+6p3/WHxjqzWLqt1gqI2XzhQh08VkY++Jw4jRzDUXXnroznn9RKC2f47JjWCzmYeoeX5uymTLibPLpxhyf2wFTHLtr6HJhW4kud+vdQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=209.85.219.46; helo=mail-qv1-f46.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.219.46; helo=mail-qv1-f46.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fPl5B3T9Bz3bkL
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Mar 2026 03:39:25 +1100 (AEDT)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-899f79df682so13715486d6.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Mar 2026 08:39:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772469563; x=1773074363;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=32KLibA2LnxuiBPJQhexbcq4h5vz7CZtFSoqgdy1YZE=;
        b=N8QUYnB3kzpr1Lc1nuCDMMwpboXM2boNj8jsDZqQgMhU9JBQwM9KdnyYtPsEcthdTZ
         C+NW+SjtjkaGdTAg9F7OFkx7qvaySzzsHSFX5ey2zAHzxzD+evmjqzwtGASoMTRfPmgd
         dX4IUKG55v6XLz4+lssi8dGKcldPqOpj9LRHtqGNtW4DFfet7m5hXB6PaN3zzNYgwHLb
         1lblrgMiULFWTETpK29rnj3jYZS8fph9IJdd8MrAi5aBNQobdk5bVBcDaZDKeokuKubr
         7+G9CJ/2QU9LSCdgtLhgBV60FTJxpbbvzP0obTIUZM8qcLdzg6yDcx51eH9v5J38RCJj
         VbpA==
X-Forwarded-Encrypted: i=1; AJvYcCWtpm5R8LXXbSUBaaSicWURY3Dem58J3E5wMG+es2LDGsUGDov/ENWcrHZafkL8V2+/UNnZiqzgTffbz/k=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzUzh1nofXoKUMme4+9VkYwsFJrVW4FK9e7VRS2hZSXlwkQLA1N
	A6RddoOucGUV4deTpjIaxp7zpyemnEQ8NQqNAFwaTlWie9sD6l6xxtkTnnEIGxiB
X-Gm-Gg: ATEYQzzhXVmKeGB9Uk5oqfdCwhvGyge2rU9K1EUMf7DNcTgvGmax5/yATxutN4i6A+D
	Jt73uXG3Efgnl46ULgaS2ID44O+i2ZfSNcKgnJMkm92r4gpPj1eUTTZuMhJq5SKDjIqTJpeH6kO
	Ws+iScbMYd1uktDXtFlYKgzDg7jq4hp/UTEB08hCPKfsxylqTi5PKEaLCoGTFg7mVCfSZqKdtj6
	2mcPT3QkWP+6MEZiQhzB1TPxvIfcoowYkl9BJWQwBPn06nl/FnlKPREPrUsZnennUIEWuMJqrTa
	SZA1X2AjezfMcjFhUthAzHIm4cC2HVducqwtG6/OC1M7Bl/+kEqxflLXnH5z3XN45z9XPJdJ53a
	hQKDUQKNNS7PniB9Ur9ZfNvvYRWwe9EbUdruUScGvcrIkAUzUlyzG/v6YtC1YL8qbKAwqCbtoV0
	pGW2+8LpqZ9G9MXIfhXEKTJ2nLHJ8ughkzS/5a9kLCbwY8VscW5yko3mcFKHVzss0z
X-Received: by 2002:ad4:5deb:0:b0:89a:666:ad2b with SMTP id 6a1803df08f44-89a0666af54mr15069146d6.27.1772469563289;
        Mon, 02 Mar 2026 08:39:23 -0800 (PST)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com. [209.85.222.173])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf66f31asm1163604685a.15.2026.03.02.08.39.23
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 08:39:23 -0800 (PST)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8cb3fb47559so562687285a.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Mar 2026 08:39:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVabPST6cw/KMB8KuLyilpD+dUUyaMZ0k8jUQX9g3Xj0sdAgIacowA+6HYDFfh/WIrqCIX14YHl+zagto0=@lists.ozlabs.org
X-Received: by 2002:a05:6102:a4c:b0:5ee:a1e5:6504 with SMTP id
 ada2fe7eead31-5ff3257ef76mr5247593137.36.1772469141709; Mon, 02 Mar 2026
 08:32:21 -0800 (PST)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com> <20260223-soc-of-root-v2-8-b45da45903c8@oss.qualcomm.com>
In-Reply-To: <20260223-soc-of-root-v2-8-b45da45903c8@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Mar 2026 17:32:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX-rdzLhOFEJYBXzCYX5jH2E1=ydGWKgNkD0Nqx-tGr4Q@mail.gmail.com>
X-Gm-Features: AaiRm53oB2X0Qg0vbG2fw10FsfcqVt_uYNXkS-NKRd6s-Lft2nvlJyc42VLB5T0
Message-ID: <CAMuHMdX-rdzLhOFEJYBXzCYX5jH2E1=ydGWKgNkD0Nqx-tGr4Q@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] soc: renesas: don't access of_root directly
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Frank Li <Frank.Li@nxp.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.0 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 42BE21DD0B5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17545-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,pengutronix.de,gmail.com,glider.be,sholland.org,nxp.com,vger.kernel.org,lists.ozlabs.org,lists.infradead.org,lists.linux.dev];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:bartosz.golaszewski@oss.qualcomm.com,m:robh@kernel.org,m:saravanak@kernel.org,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:chleroy@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:Frank.Li@nxp.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:imx@lists.linux.dev,m:linux-renesas-soc@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:driver-core@lists.linux.dev,m:geert@glider.be,m:magnusdamm@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linuxppc-dev@lists.ozlabs.org];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	NEURAL_HAM(-0.00)[-0.541];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,renesas];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Hi Bartosz,

On Mon, 23 Feb 2026 at 14:38, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
> Don't access of_root directly as it reduces the build test coverage for
> this driver with COMPILE_TEST=y and OF=n. Use existing helper functions
> to retrieve the relevant information.
>
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

> --- a/drivers/soc/renesas/renesas-soc.c
> +++ b/drivers/soc/renesas/renesas-soc.c

> @@ -468,7 +469,11 @@ static int __init renesas_soc_init(void)
>         const char *soc_id;
>         int ret;
>
> -       match = of_match_node(renesas_socs, of_root);
> +       struct device_node *root __free(device_node) = of_find_node_by_path("/");
> +       if (!root)
> +               return -ENOENT;
> +
> +       match = of_match_node(renesas_socs, root);
>         if (!match)
>                 return -ENODEV;
>

I still find it silly to add a call to of_find_node_by_path().
In your reply to my comment on v1, you said you don't want to add
another helper.

Currently we have two helpers in this area:
  1. of_machine_device_match(), which returns bool, and tells if a
     match is available,
  2. of_machine_get_match_data(), which returns the match data, if a
     match is available.
But there is no helper to return the actual match?
of_machine_device_match() would be fine, if it wouldn't cast the result
to bool...

As there is no cost (binary size-wise) in having the helper that returns
the match, too, I have sent a series[1] to do that. The last patch[2]
is an alternative to this patch, avoiding the need to add a call to
of_find_node_by_path().

[1] "[PATCH 0/7] of: Add and use of_machine_get_match() helper"
    https://lore.kernel.org/cover.1772468323.git.geert+renesas@glider.be
[2] "[PATCH 7/7] soc: renesas: Convert to of_machine_get_match()"
    https://lore.kernel.org/10876b30a8bdb7d1cfcc2f23fb859f2ffea335fe.1772468323.git.geert+renesas@glider.be

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

