Return-Path: <linuxppc-dev+bounces-16012-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34AF5D3B750
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jan 2026 20:32:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dw0wd5LZQz2xS5;
	Tue, 20 Jan 2026 06:32:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.219.45
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768851169;
	cv=none; b=EdC0r0l/G4nu0Rl8n5k1iXCJwdFn3pT7E72L1VG6ACWAn3ZAZoAqTPxxPReVbp4tcSa8Amu4LIg6ft23ay2VeMO/T66zZ3+Zcg/oD3JB1Ex0VC4l/2z/BI8RQ8lziWDdePdXoTfQxo8Vme7om5fVFJoQa96heYHHHSEgpMyM1OlN2Wdyeq1DmOvH+NWzgcNi1dQimIdtXvxCHZqHf9vFr14BPORRnMbSFKlnQ9VfdhoNMKmXVauv+r9Qzo4ZBwTsgyLwivqmCS2LLp33TTrohOP/grkVZcX5iIFmtJn0kb3yTyjBB1Z1CLTZpjTJR+KtklXPsq3NjbmF/X/Pj1qI6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768851169; c=relaxed/relaxed;
	bh=6Y1wTxdZLJ7XhSQYYR0Ku2EXGP2C5XG02vKe6+mSL78=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S06yDszVfWX+BJqP5PZ69LTZZHDOsvx9b/rSHTMdYqcpFHXmciro2N1j1AlVFdJ7nwHu9x2i1fvUKLq7gkb0EP/voCLAnQLgJBz+et/sUEOFKRIjAwS0s4DhtOGaflL+M8KPp4c9lgV66kWdxyLhQYsw1G/Q0uGaIZ0JGgp1IYTgq5/jVbEYgQ1g4rgELC6DiTZIEKJAaV4a+95GsvgilSRtZ+fh4RWClTo2LfLWq9oiqKla3vMCGAvfLxunKzJrXntfCJ6lR+GHOIoRt1u2b0G4vz63YA3SxchMtE2v5On6mYXukc8xb43FmM2hfig/cjQafqEnz/cbUUDXMfHbww==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=209.85.219.45; helo=mail-qv1-f45.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.219.45; helo=mail-qv1-f45.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dw0wc5VSgz2xHW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jan 2026 06:32:48 +1100 (AEDT)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-88a37cb5afdso78924816d6.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 11:32:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768851165; x=1769455965;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Y1wTxdZLJ7XhSQYYR0Ku2EXGP2C5XG02vKe6+mSL78=;
        b=X5Jj7nTQ//mixarpEKxxry0ZjaS0KaFHd/F98MSOyWvb+9Tr6CNI5ap77/JgLBrQfw
         +YpG7pGmr1mVCMcN85Du4wbA2i2j4ki3D2eeT5ial7U7htVPRzdm+6f7NEMOwe2uR+tQ
         owW749wAzoPLhHZuyqjUETnAOj55KSTkvG0IvXFvDCiXh5ROd+kNk4b2sjUwMUccmR0U
         6wqsGRXmt7KnPLRA0nKr8dabmqF6lvk2lo5RfXb6MstDVHdPGOOJSzm8NnV1jlc1qoOQ
         3YdtYptyxSqK7Ivj39BjUsOmh2PRywe+ZIv2VmNwZN76t9Ubihl90+FtXurQhX4s9J8k
         z9oQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiwkdaGo1FLuBZLQFTK7+v+SD8wF6vFk3GCm+u/YmJKN/DaLYyQ5VxF5b5XcowQxoQN8hnzCRW0RfdYCQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx2lnNlt5nUnqXWCo7kPTjn69xmdnDzjpFpQedXpKQ4FKhFHK0K
	MD5fXD8fIXWeoMJzqMoY87f1jZL9/u9ERuxbcjW1RMnGzlubL5Gjr90q4OxF+5Lh
X-Gm-Gg: AZuq6aJqB2No6jWlQv6q7b+yHsC673PZv0gfrSQpttbu79ttazTeJoU2JYVWKbV6hZR
	T5TJcNnAH238uLPQ6vxFeDt8pe8RMO5MK+4ArsjLgRIdkYnPqCnZxZzR/xHI4MlGw37mOdxsNMk
	b9EwQYlmLDfaroxNRkO5TMv72jJLQ1vBXXaRa1Fx2NZ8x7nIlQs98r3nDqWNA4A1wfT7m26qxZ9
	V1Y13CsHO99MMESt4NDkAIwFhHAi1lHjPkVCC51PV1eMOm7jcp9UtIh0H7ltcgNI5u/ujr92r5z
	LXo3IEE2EfQQaDS/ZPtKjhxfrOHYAvdBEPtdabCxPazSefVV73u96iF2gayifXo32F/8oTYrz54
	A13IoeYKSKuzwoBHRS7ANuIX3QnSlafILbGujgTrIN1e7kv5KK15jYVPXFI9520ad5fS8GZmz8n
	fWh+TyQ3SxNAAStWQ4gq4guMS6jCn/WXkfXWVvXbTNVGgMBHalawYh2PsNaPBk8BQ=
X-Received: by 2002:a05:6214:2b0f:b0:892:6763:3819 with SMTP id 6a1803df08f44-8939825160cmr212565446d6.24.1768851165113;
        Mon, 19 Jan 2026 11:32:45 -0800 (PST)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com. [209.85.160.172])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8942e6d6366sm96114126d6.51.2026.01.19.11.32.44
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 11:32:44 -0800 (PST)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-502a4e3e611so28642861cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 11:32:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXuJMnvgwq7FIqfFbyeiWZc/h8aFsPbXyWWg3rT3rXD6PAKr0M3tt6oTL9MvcDgjbHTyIKwX6weEzz9uTo=@lists.ozlabs.org
X-Received: by 2002:a05:6102:3e96:b0:5ef:b32c:dff8 with SMTP id
 ada2fe7eead31-5f1923fb2c1mr5826988137.5.1768850738083; Mon, 19 Jan 2026
 11:25:38 -0800 (PST)
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
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com> <20260119-soc-of-root-v1-7-32a0fa9a78b4@oss.qualcomm.com>
In-Reply-To: <20260119-soc-of-root-v1-7-32a0fa9a78b4@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Jan 2026 20:25:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU56p9jH8OZ5bpwKq8Q31C-8X85YAjiXZm8amYdo+Xotw@mail.gmail.com>
X-Gm-Features: AZwV_QjRSaQ_qXyXNZN9OqtIjEIE6rAZwNcvdO7jDgxqMH0vtYkLnv2_hmzs9Y4
Message-ID: <CAMuHMdU56p9jH8OZ5bpwKq8Q31C-8X85YAjiXZm8amYdo+Xotw@mail.gmail.com>
Subject: Re: [PATCH 7/8] soc: renesas: don't access of_root directly
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.0 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Bartosz,

On Mon, 19 Jan 2026 at 11:40, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
> Don't access of_root directly as it reduces the build test coverage for
> this driver with COMPILE_TEST=y and OF=n. Use existing helper functions
> to retrieve the relevant information.
>
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Thanks for your patch!

> --- a/drivers/soc/renesas/renesas-soc.c
> +++ b/drivers/soc/renesas/renesas-soc.c
> @@ -6,6 +6,7 @@
>   */
>
>  #include <linux/bitfield.h>
> +#include <linux/cleanup.h>
>  #include <linux/io.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
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

I am not so fond of these of_find_node_by_path("/") + something replacements.
What about adding an of_match_root() helper?

However, in the previous patch you used a different strategy:

-       if (!of_match_node(imx8_soc_match, of_root))
+       if (!of_machine_device_match(imx8_soc_match))

>         if (!match)
>                 return -ENODEV;
>
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

