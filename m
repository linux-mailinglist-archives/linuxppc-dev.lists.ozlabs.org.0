Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB3142CDB7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Oct 2021 00:18:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HV6P65VyBz3c7L
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Oct 2021 09:18:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kXUS5NJm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=kXUS5NJm; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HV6NQ1nS2z2xrx
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Oct 2021 09:17:42 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1EA05610CC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Oct 2021 22:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634163459;
 bh=iAXL5wKCTXDPPJMdmvXuQp/LrnAKr8yFIpif7ovGZS8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=kXUS5NJmuLj3/+fqDgJFea1cIf6pXU0CZxKV8eXurkJ7/LIT1jCSDCzxreAPi6Fvy
 eN+KojwSmLouJZ/rgCsKg2rW3S0fPo8w3MUb45fKv71v9ytpURRH8BJMEMLCff7tFv
 RpU+4cgZwm/4KZhiiB+laX41W2l38EBVY74sm6vb7zKyzb/IngDx0dskYf6WcS7wuM
 awg5BupiA7j7CRjJ1Po9FVkf8hU2z4SLnvIVP/TSeSMGmcAnYT2MOv8yEbjPxL3a64
 GefIW8RHrKgRwRUosvDcy7Jm1OO79V4uY1dIU3o7o+umKn2YaWEARFWozCY5xhcqLt
 HV5dUuoZsd5Rg==
Received: by mail-qv1-f44.google.com with SMTP id k19so2631799qvm.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Oct 2021 15:17:39 -0700 (PDT)
X-Gm-Message-State: AOAM531G+ZlboWClgewAEPp6674cXsLn4CFrX+xJseppFIiMtw4Hv9Bt
 Gnr1pTV+f9c0C+npovXYX77sMLUljaunO+NFPA==
X-Google-Smtp-Source: ABdhPJxmJi2Xxza37sFggFJC2MLH2xZUa4xlWBETq+bdhKMaOqGK0gTFoAvZo3wfhHajb/fq+U3qA04vhbeonKCE6ls=
X-Received: by 2002:a05:6214:50c:: with SMTP id
 v12mr1582348qvw.45.1634163458268; 
 Wed, 13 Oct 2021 15:17:38 -0700 (PDT)
MIME-Version: 1.0
References: <20211008164728.30e3d3a3@canb.auug.org.au>
 <20211011082704.3cff4568@canb.auug.org.au>
 <CAL_JsqJE_GHnehBz-71BOGXfjm6q2p0u6FQA5KwO8zK_i1LpMQ@mail.gmail.com>
 <CAK8P3a1EcNuxT-w-8w-HDr2+idsP=vFZ3Cn27fX7o56GOuu_Cg@mail.gmail.com>
 <20211014001232.3becbe99@crub>
In-Reply-To: <20211014001232.3becbe99@crub>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 13 Oct 2021 17:17:25 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJSqqYya-xe8YQs0-0KTF3LzwkyGD_2dUxQY9SKVV7RMw@mail.gmail.com>
Message-ID: <CAL_JsqJSqqYya-xe8YQs0-0KTF3LzwkyGD_2dUxQY9SKVV7RMw@mail.gmail.com>
Subject: Re: linux-next: build warnings in Linus' tree
To: Anatolij Gustschin <agust@denx.de>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 13, 2021 at 5:12 PM Anatolij Gustschin <agust@denx.de> wrote:
>
> Hi Arnd, Rob,
>
> On Tue, 12 Oct 2021 16:39:56 +0200
> Arnd Bergmann arnd@arndb.de wrote:
> ...
> >Grant Likely was the original maintainer for MPC52xx until 2011,
> >Anatolij Gustschin is still listed as maintainer since then but hasn't
> >been active in it for a while either. Anatolij can probably best judge
> >which of these boards are still in going to be used with future kernels,
> >but I suspect once you start removing bits from 52xx, the newer
> >but less common 512x platform can go away as well.
>
> many of these boards are still used, i.e. o2d*, digsy_mtc, tqm5200.
> I've sent first series to fix some warnings. Other dts fixes
> require driver changes, so it will take some time to fix them.

In general, you shouldn't need to be changing the drivers. Can you
tell me which warnings need driver changes?

Rob
