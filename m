Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 194BA42A778
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Oct 2021 16:40:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HTJHf3zFZz2ysq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 01:40:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.134; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HTJH94Rytz2yHJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Oct 2021 01:40:19 +1100 (AEDT)
Received: from mail-wr1-f47.google.com ([209.85.221.47]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M4ahC-1mZkS01ZEU-001gcU for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Oct
 2021 16:40:14 +0200
Received: by mail-wr1-f47.google.com with SMTP id r18so67748783wrg.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Oct 2021 07:40:13 -0700 (PDT)
X-Gm-Message-State: AOAM5329ZrJDwkQdaZENlf0kCUZz6uCofPG3oaMhbMQRTBU5hQj74Ngj
 iikW1BqHLhHlcbYWpQQgYSSGr401NDkrPsZ/el8=
X-Google-Smtp-Source: ABdhPJwsX00JvLV147YNI/vITnilDiDSyCMYaOBQxpBe5IV6UNyEVoOL9Nc4pFKmxwenTCCaRUt2Gu+9DapKCFiP6aE=
X-Received: by 2002:a1c:2358:: with SMTP id j85mr5978288wmj.1.1634049612821;
 Tue, 12 Oct 2021 07:40:12 -0700 (PDT)
MIME-Version: 1.0
References: <20211008164728.30e3d3a3@canb.auug.org.au>
 <20211011082704.3cff4568@canb.auug.org.au>
 <CAL_JsqJE_GHnehBz-71BOGXfjm6q2p0u6FQA5KwO8zK_i1LpMQ@mail.gmail.com>
In-Reply-To: <CAL_JsqJE_GHnehBz-71BOGXfjm6q2p0u6FQA5KwO8zK_i1LpMQ@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 12 Oct 2021 16:39:56 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1EcNuxT-w-8w-HDr2+idsP=vFZ3Cn27fX7o56GOuu_Cg@mail.gmail.com>
Message-ID: <CAK8P3a1EcNuxT-w-8w-HDr2+idsP=vFZ3Cn27fX7o56GOuu_Cg@mail.gmail.com>
Subject: Re: linux-next: build warnings in Linus' tree
To: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:hv55MgxvPlgvFyi3O5rZZmf/t2QikeY9DQ8ptJ70SIB2RyxtOB2
 uF86Qf8q0qcGuvPaME515yxzhqjLJ5CNYReVOEtPfJqTSI042rplBkWzBSok9RsV0oXt/Qg
 huGzPEzqjVUvXmqakENL3yoLIdZezsv25vksTS5pz7hfxJw90Odl+a84iUgG7YcZFwTVEEa
 ulNCGnF4UyOuK4fCjcvkg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:uOJrQmVua+U=:S9ROvkUz3bumQZKmbadXLC
 82ZgkgzPVZRrm4AtgzPGXJOgn4A4w2OI8sIYgFPEKPi8W5HU1AlF1SYA+qaK8kw4LGw5CLJRd
 UZajG44KGX7yqAvTgXF3ORTvDd3mVSFGJ52IndwzHlar9RTiRUyFhsHHAxAdmIE7MYgkJf1fx
 9zEWlckmjqgsNuoejIiFCh78iAXKzhpT+FZ1cRZ6e90Iai5oEmDPH0Cd6VDbnREpZRxyX1zLI
 GMNAVSOnRJhtdg0u5zMpSfbARbs/yV55ag9pgdu6qgJPbzGR2SGUDc223OnAsF224WXgG2AZ4
 YCYCfVgJVvGWFm/ohMYFfRUjebSg5Cy9Dn5WhMQcVJTaWQCiU7RTrp7tzVNy/O96DHuCBF/CJ
 dzVMi/Ttm3YBiUPFFCgfPkn0NIHzqS5AONqj65JxmFjv4YUKWnRPRSqsbOMhYVoMydsH3sf4d
 +jrWLJOCMNzm92tBxCxX8OMZ/WcK8D+HARyPsUyzIngYfjq3p8NNAmeABfGCIiOrSHk7udwhg
 BFsDBhNsuVKhdRn9ohd8IG0X5akKEnjStraSz14SHibh2MJ8StQGc63VKtDo6CNFTrXpRP4ie
 ksNkj7pkwkJB1Aw3BO8D9UTqdHCuKikJtGYgoFO5mn8Sgj5+W4TVUYe8M+e0HN6Xh+auWLAfs
 YK4YhuvGByJ/EIloT6M3kPE+GUJlZbObqvks24Oz1TwIDOUqxItaXB8cQtAQSN3oE6zMkTWFv
 xNe61ZyPDSi8V3VJDYtpAwtdF3oWZdOODdiO3A==
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Anatolij Gustschin <agust@denx.de>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 11, 2021 at 10:42 PM Rob Herring <robh+dt@kernel.org> wrote:
> On Sun, Oct 10, 2021 at 4:27 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> FYI, u-boot removed mpc5xxx support in 2017, so maybe there's
> similarly not a need to keep them in the kernel? It does appear NXP
> will still sell you the parts though the last BSP was 2009.

Specifically, MPC5200B has a 15 year lifetime, which ends in
11 months from now. The original bplan/Genesi Efika 5K2 was
quite popular at the time it came out, and there are probably
still some of those hanging around, but they came with Open
Firmware rather than relying on the dts files that ship with the
kernel.

Grant Likely was the original maintainer for MPC52xx until 2011,
Anatolij Gustschin is still listed as maintainer since then but hasn't
been active in it for a while either. Anatolij can probably best judge
which of these boards are still in going to be used with future kernels,
but I suspect once you start removing bits from 52xx, the newer
but less common 512x platform can go away as well.

         Arnd
