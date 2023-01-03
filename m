Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CFD65B93B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Jan 2023 03:04:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NmGJd07fKz3c7x
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Jan 2023 13:04:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uyWrJ+J5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uyWrJ+J5;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NmGHg0f9Dz3bTk
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Jan 2023 13:03:58 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 675C5B80E1B
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Jan 2023 02:03:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ADCCC433D2
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Jan 2023 02:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672711433;
	bh=kSq+iZIFlWTfJ390ONeecgeoETkEhfUzhq4zOWoSJkg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uyWrJ+J5KbT2ZRN5E/VFxqs1azxRJIeNZACb2+N3FM/pt/FgtkdB1rqAL27wmVj2m
	 kKQyD/9N0Gbat0erKdaY+AdrtrlzsDuU61fTilryug2+AaTkWJGu2h01OoKqVZEzVv
	 TzNsrGTzulnxjKDe1HeddGGbGx/DajWxA2lfPfkrs4z3HIC63lT3FxE3/rb5RavuOs
	 vj98PCG+kBc79p6feEwxVZ5ZT1/fqfBMvcAVfoGWdbRRjbd8iW2e0WEbJ+nTylccWM
	 vTBNOllRIgcO1JWyM08rqvC7FoocFHWe4HJ93ezC/Mx4mabQz/8STQJ+2M5iR1wrpF
	 seLDiSxUbEqfA==
Received: by mail-vs1-f43.google.com with SMTP id l184so1814183vsc.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Jan 2023 18:03:53 -0800 (PST)
X-Gm-Message-State: AFqh2kpv46Bd3bJXAVGkBxqHc5yC6bqWTUQfrPJBP/j//aqEJlYunqi1
	81o7Y+FadCTeiMMw7iC1L78kxbsFxJvpYBpH0g==
X-Google-Smtp-Source: AMrXdXt6Ketfzo7B0k0fvdiT7T0XNQEqE1Tg5/7RJIcB20hpJ/mMpIBrS0PxPVrtBbsjLGWjb++1kWbR5g3IUs7R6g0=
X-Received: by 2002:a67:edd4:0:b0:3b5:1fe4:f1c2 with SMTP id
 e20-20020a67edd4000000b003b51fe4f1c2mr4827766vsp.0.1672711432071; Mon, 02 Jan
 2023 18:03:52 -0800 (PST)
MIME-Version: 1.0
References: <cover.1672687924.git.geoff@infradead.org> <f3d97d9426eeda9ee16a0ee6f325fc02fa3a2c57.1672687924.git.geoff@infradead.org>
In-Reply-To: <f3d97d9426eeda9ee16a0ee6f325fc02fa3a2c57.1672687924.git.geoff@infradead.org>
From: Rob Herring <robh@kernel.org>
Date: Mon, 2 Jan 2023 20:03:40 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLPLhe4pP-W+xRXRMjVgJn0maNGnJF9RqQCWX8Pc+GeAA@mail.gmail.com>
Message-ID: <CAL_JsqLPLhe4pP-W+xRXRMjVgJn0maNGnJF9RqQCWX8Pc+GeAA@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] powerpc: Fix processing of CONFIG_CMDLINE
To: Geoff Levand <geoff@infradead.org>
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
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 2, 2023 at 1:41 PM Geoff Levand <geoff@infradead.org> wrote:
>
> Commit a7d550f82b445cf218b47a2c1a9c56e97ecb8c7a (of: fdt: Honor CONFIG_CMDLINE*
> even without /chosen node) moved the processing of the kernel built-in command
> line (CONFIG_CMDLINE) from the early_init_dt_scan_chosen routine to the
> early_init_dt_scan_nodes routine.
>
> The current powerpc startup code does not call into early_init_dt_scan_nodes, so
> processing of CONFIG_CMDLINE never happens, even if CONFIG_CMDLINE_FORCE=y.
> The result is an empty kernel command line, and mounting of the root file system
> then fails with a kernel panic (not syncing: VFS: Unable to mount root fs).
>
> The early_init_dt_scan routine calls into early_init_dt_verify and then
> early_init_dt_scan_nodes.  The powerpc startup routine early_init_devtree
> currently has a call to early_init_dt_verify.  This change replaces that
> early_init_dt_verify call to a call to early_init_dt_scan.
>
> Signed-off-by: Geoff Levand <geoff@infradead.org>
> ---
>  arch/powerpc/kernel/prom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
> index 4f1c920aa13e..82c9cd3bdbec 100644
> --- a/arch/powerpc/kernel/prom.c
> +++ b/arch/powerpc/kernel/prom.c
> @@ -761,7 +761,7 @@ void __init early_init_devtree(void *params)
>         DBG(" -> early_init_devtree(%px)\n", params);
>
>         /* Too early to BUG_ON(), do it by hand */
> -       if (!early_init_dt_verify(params))
> +       if (!early_init_dt_scan(params))

It would be nice if this could be used instead, but it does other
things like memory setup which I think will not work for some PPC
platforms.

Rob
