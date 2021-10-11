Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6918429843
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Oct 2021 22:42:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HSrMv2lCwz3051
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Oct 2021 07:42:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hd6bqWio;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hd6bqWio; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HSrMF25PYz2xtV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Oct 2021 07:42:17 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1627D60F4B
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Oct 2021 20:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633984934;
 bh=ibFTHb+m3Z5pkvpLr9kxh7hAkVuH9dWI+TtoS66LBss=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hd6bqWiokjnvfWsKkWSYNKdO2Hw/sTNInPnU2c2coke5zm/Qke5RHdxh4QeSh28S9
 DExN41HF1TehUVhN1ayjJnYGUqqzXo4iCljRwR+FdElZ/Ltbv3fGhzvco5W/wF9QIX
 +l3P7+NpuWbg10JW6U4Q1E8L4CcKaWdhsCV0NO2ONXWWDjaljcmNrD5A7ukfUKh8H2
 sT89DOfyMuaNnfDTICPVP8HZtGqKtMtn4n2kKPfiv1gHK3iMiC1sxiZml3r6H2mEXG
 WED2pJdqDnw7LZSKdOGe6MI468c1DdU9ZKulkLEyhLYY5kHALd3Zx44EUZyvoHkDoj
 HRMWP+fMCKLGA==
Received: by mail-ed1-f47.google.com with SMTP id g8so72449903edt.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Oct 2021 13:42:14 -0700 (PDT)
X-Gm-Message-State: AOAM532TCze0iOWYUM+iUqrX7LgBSdZ5s2NQurHelxvWCDhwDO3GE6h3
 Ir+MppJKVKO4Uq8siayhKRwm+GScdfE/ZIA5bQ==
X-Google-Smtp-Source: ABdhPJyuQvOrfitnTSM7CD8MUEyAH4rqnj7rt9TGPaP73gd4ePuhtXG3Htc00PD+tsTKC+JIU18wvsUhRLtOgD4aqqQ=
X-Received: by 2002:a05:6402:1d55:: with SMTP id
 dz21mr32990982edb.164.1633984932421; 
 Mon, 11 Oct 2021 13:42:12 -0700 (PDT)
MIME-Version: 1.0
References: <20211008164728.30e3d3a3@canb.auug.org.au>
 <20211011082704.3cff4568@canb.auug.org.au>
In-Reply-To: <20211011082704.3cff4568@canb.auug.org.au>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 11 Oct 2021 15:42:00 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJE_GHnehBz-71BOGXfjm6q2p0u6FQA5KwO8zK_i1LpMQ@mail.gmail.com>
Message-ID: <CAL_JsqJE_GHnehBz-71BOGXfjm6q2p0u6FQA5KwO8zK_i1LpMQ@mail.gmail.com>
Subject: Re: linux-next: build warnings in Linus' tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>, 
 Michael Ellerman <mpe@ellerman.id.au>
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

+Arnd in regards to removing platforms.

On Sun, Oct 10, 2021 at 4:27 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> [Cc'ing Rob]
>
> Rob: these warnings have been there for a long time ...

If anyone cares about these platforms, then the warnings should be
fixed by folks that care. If not, then perhaps the DT files should
just get removed.

FYI, u-boot removed mpc5xxx support in 2017, so maybe there's
similarly not a need to keep them in the kernel? It does appear NXP
will still sell you the parts though the last BSP was 2009.

Rob
