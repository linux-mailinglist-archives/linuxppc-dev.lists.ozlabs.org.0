Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CD739F94B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 16:37:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fzt9h6mpPz3070
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 00:37:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=p5f8j36w;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e2a;
 helo=mail-vs1-xe2a.google.com; envelope-from=jrdr.linux@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=p5f8j36w; dkim-atps=neutral
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com
 [IPv6:2607:f8b0:4864:20::e2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fzt9D1MGCz2yyQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Jun 2021 00:36:46 +1000 (AEST)
Received: by mail-vs1-xe2a.google.com with SMTP id y207so2610129vsy.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Jun 2021 07:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bpsV4sDHB2cyK5C6lyt/mnQ+XnkOkcY+7DRUUxVnjl8=;
 b=p5f8j36w8Ntn49cmYv4MvwFWK/AOerSOIgCmJp4QT0LjyYd60aJ67szVOzuYOwVgIk
 G0GlUXBYXTO41rP9p78c0LFY2Y8jlVAHEiBh6jNedWVhxqhFlv1qbuoSrtk+2gkY3gw4
 tWGUrqD6WDLROS+x6cb77ZmfDPHPylL9+At/nsum5kM4RQjRvnlgyF0oQnAlMQ9HrKQg
 X496YWYsLdr/tuV8yIFSepwpA6CxmDNZAHPGjuaMr87i+0KlzxN4zQoRt7Iw2tOfo4A4
 LUHyvgqkg2q5duUjAWuRJOPNYpj4UZJMfY4AvCVDpgO3+EopHv4P+rxU5tgFWKc3ev3u
 cmNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bpsV4sDHB2cyK5C6lyt/mnQ+XnkOkcY+7DRUUxVnjl8=;
 b=F1ZlJvX0ssYTd84/H9uMzzAor/en+FoFH7W89eWRahIwL+7ErvsGZZStEdMn1YWvHA
 wnjV3wTMP//59C25Wrrkbfv4QuCPQTPN1UpJY1mS3u4O0zyEZDfD1Kr9zXyzxhk6cr4X
 YrMkiTHHMjlylPigD91QxngQl3XGfPqkRg3VkuwGLzAHAbhR0QjcRZ2PcF1OxhYaEXjY
 K1OUchv4IhaXIAWVczzKhpsJ8jve/leJD9uDzlMTuBXqHIyCKxuNBdjYrvveRqHDQ9un
 YVsZjIItHHnNvS7FAeYlIE6VItSvglDWSyEHSETCGYLIIVtJ8lkubXNKAdRV0XpJDOgW
 zhrQ==
X-Gm-Message-State: AOAM530nfUw2doanfxXyRxl+tfPJqiRY7TiYBNDn31BMOaotyVvag5lZ
 BTL51cbXoS6Pk0g7jNVRp5Pur4YKL+gUZRBIy7E=
X-Google-Smtp-Source: ABdhPJxgu6VRQIYnVR8042ZEZftV+daJ9LRJsXp14S0KbDSYuzrMWkGkQVTh/DaRfcSvz067m+URDyywJKx8rt2iqQE=
X-Received: by 2002:a67:7cc7:: with SMTP id x190mr433160vsc.30.1623163000809; 
 Tue, 08 Jun 2021 07:36:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210608083418.137226-1-wangkefeng.wang@huawei.com>
 <20210608083418.137226-12-wangkefeng.wang@huawei.com>
In-Reply-To: <20210608083418.137226-12-wangkefeng.wang@huawei.com>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Tue, 8 Jun 2021 20:06:28 +0530
Message-ID: <CAFqt6zZWanzsy=F4LVUkovQE-wqKd0CNG-n=Sx7SBddord6Gcg@mail.gmail.com>
Subject: Re: [PATCH v3 resend 11/15] powerpc: convert to
 setup_initial_init_mm()
To: Kefeng Wang <wangkefeng.wang@huawei.com>
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
Cc: linux-kernel@vger.kernel.org, Linux-MM <linux-mm@kvack.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 8, 2021 at 1:56 PM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
>
> Use setup_initial_init_mm() helper to simplify code.
>
> Note klimit is (unsigned long) _end, with new helper,
> will use _end directly.

With this change klimit left with no user in this file and can be
moved to some appropriate header.
But in a separate series.

>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  arch/powerpc/kernel/setup-common.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
> index 74a98fff2c2f..96697c6e1e16 100644
> --- a/arch/powerpc/kernel/setup-common.c
> +++ b/arch/powerpc/kernel/setup-common.c
> @@ -927,10 +927,7 @@ void __init setup_arch(char **cmdline_p)
>
>         klp_init_thread_info(&init_task);
>
> -       init_mm.start_code = (unsigned long)_stext;
> -       init_mm.end_code = (unsigned long) _etext;
> -       init_mm.end_data = (unsigned long) _edata;
> -       init_mm.brk = klimit;
> +       setup_initial_init_mm(_stext, _etext, _edata, _end);
>
>         mm_iommu_init(&init_mm);
>         irqstack_early_init();
> --
> 2.26.2
>
>
