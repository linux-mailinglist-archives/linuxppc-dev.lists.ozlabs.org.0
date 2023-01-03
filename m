Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56ABE65C4C0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Jan 2023 18:07:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NmfKs14b7z3c8s
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Jan 2023 04:07:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aOeRamjH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aOeRamjH;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NmfJt38yBz3bZ4
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Jan 2023 04:06:22 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A1FF66148A
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Jan 2023 17:06:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 113F8C433F2
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Jan 2023 17:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672765578;
	bh=WwB4YS42f5XGPpNXEiBFbFwFV+/n8RI3g2IXZAMTruU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=aOeRamjHaw20AEHAAqjBHo7IxNi4RYIEkMfJnU4vHT0NJSZuV+PdeHwgjpQWp4pz4
	 /9iXRXVyOasaCqpgYSCp0pFJlGepSG1RJ/q0giLPQiYapqguaa82bdDw6YH2MHvgfE
	 5UVks0wUMjcaQ0a085AJPLN1IPphHvcSDnO+zBYJllKcV9wGazc8PDyO2aYMZhmrI5
	 LUUy+4/NqfIGtFe/RK6t4tqizqKgL7B0lLFg0UrK9LxI3KhuYJyuXsGPqeH1tZOCgS
	 TraoEUobfF9Obk7AKD1ZDDay7zW9ZD/OkWOyiGvdrBygU6KGgitQ20elRXNPjRcvZw
	 zgiabT623fjRA==
Received: by mail-ua1-f51.google.com with SMTP id cb7so1357184uab.13
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Jan 2023 09:06:17 -0800 (PST)
X-Gm-Message-State: AFqh2krYBslY36EK5lLK/P8Q+yCLybMCae2DPaQpklMbU1Kuh868lwbH
	mPISh4G5OinUTYMieBetfdZTapVT063lhhL02Q==
X-Google-Smtp-Source: AMrXdXvJIMdXF7zcPy7RSuE6bEYOzuv141+QiGaLY/EecStPfy3xDmRN+UNj5LPNobNsGwHdNJU0cP/INp8O0IBeCyI=
X-Received: by 2002:ab0:76c1:0:b0:419:145a:dd46 with SMTP id
 w1-20020ab076c1000000b00419145add46mr4255018uaq.77.1672765576963; Tue, 03 Jan
 2023 09:06:16 -0800 (PST)
MIME-Version: 1.0
References: <cover.1672687924.git.geoff@infradead.org> <f3d97d9426eeda9ee16a0ee6f325fc02fa3a2c57.1672687924.git.geoff@infradead.org>
 <CAL_JsqLPLhe4pP-W+xRXRMjVgJn0maNGnJF9RqQCWX8Pc+GeAA@mail.gmail.com> <9999d2de-b5bc-ba8c-4c52-5ed89472d546@infradead.org>
In-Reply-To: <9999d2de-b5bc-ba8c-4c52-5ed89472d546@infradead.org>
From: Rob Herring <robh@kernel.org>
Date: Tue, 3 Jan 2023 11:06:05 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLqA-ruY7yL-Dgx=pu0+xFGr1ToWjuzrxXR3Yun7Ed4iQ@mail.gmail.com>
Message-ID: <CAL_JsqLqA-ruY7yL-Dgx=pu0+xFGr1ToWjuzrxXR3Yun7Ed4iQ@mail.gmail.com>
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

On Tue, Jan 3, 2023 at 10:45 AM Geoff Levand <geoff@infradead.org> wrote:
>
> Hi Rob,
>
> On 1/2/23 18:03, Rob Herring wrote:
> > On Mon, Jan 2, 2023 at 1:41 PM Geoff Levand <geoff@infradead.org> wrote:
>
> >> --- a/arch/powerpc/kernel/prom.c
> >> +++ b/arch/powerpc/kernel/prom.c
> >> @@ -761,7 +761,7 @@ void __init early_init_devtree(void *params)
> >>         DBG(" -> early_init_devtree(%px)\n", params);
> >>
> >>         /* Too early to BUG_ON(), do it by hand */
> >> -       if (!early_init_dt_verify(params))
> >> +       if (!early_init_dt_scan(params))
> >
> > It would be nice if this could be used instead, but it does other
> > things like memory setup which I think will not work for some PPC
> > platforms.
>
> It seems like what we need is to pull out the command line processing
> code from early_init_dt_scan_nodes and put that into a new function,
> say early_init_setup_cmdline, then have both early_init_dt_scan_nodes
> and powerpc's early_init_devtree call early_init_setup_cmdline.
>
> I'll split this series into two, one for the PS3 updates, and one
> that adds early_init_setup_cmdline.

What is really needed is to make progress on the generic command line
handling, but the 2 different implementations can't seem to work
together to resolve the differences.

Short of that, I don't really want to see another function exposed to
the arch as I've been trying to reduce them. I'll post an alternative
shortly.

Rob
