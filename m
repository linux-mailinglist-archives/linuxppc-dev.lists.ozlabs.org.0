Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE612463A5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 11:45:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVTg83pxGzDqMm
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 19:45:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=tiwai@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVTcx3wy7zDqRL
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 19:43:29 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AD50CAD33;
 Mon, 17 Aug 2020 09:43:50 +0000 (UTC)
Date: Mon, 17 Aug 2020 11:43:25 +0200
Message-ID: <s5hk0xxppz6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Allen Pais <allen.cryptic@gmail.com>
Subject: Re: [PATCH 00/10] sound: convert tasklets to use new tasklet_setup()
In-Reply-To: <CAEogwTAGHOfBe4ztkx9To0gQGwHwFWzCBxn8nzWJP=wRJUJ56A@mail.gmail.com>
References: <20200817085703.25732-1-allen.cryptic@gmail.com>
 <s5hpn7pprl1.wl-tiwai@suse.de>
 <CAEogwTAGHOfBe4ztkx9To0gQGwHwFWzCBxn8nzWJP=wRJUJ56A@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI/1.14.6 (Maruoka)
 FLIM/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL/10.8 Emacs/25.3
 (x86_64-suse-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI 1.14.6 - "Maruoka")
Content-Type: text/plain; charset=US-ASCII
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
Cc: alsa-devel@alsa-project.org, keescook@chromium.org, timur@kernel.org,
 Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org, clemens@ladisch.de,
 tiwai@suse.com, o-takashi@sakamocchi.jp, nicoleotsuka@gmail.com,
 Allen Pais <allen.lkml@gmail.com>, perex@perex.cz,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 17 Aug 2020 11:18:53 +0200,
Allen Pais wrote:
> 
> >
> > Is this targeted for 5.9 or 5.10?
> 
> This is targeted for 5.9.

Well, then at the next time, please mention it explicitly in the cover
letter.  Usually this kind of API conversion isn't done during rc.  Or
it's done systematically via script or such.  So unless mentioned,
it's not expected to be carried to 5.9.

In anyway, if the final purpose is to drop the old tasklet API and
that's the plan for 5.9, all tree-wide changes have to be done in
5.9 beforehand.  Was that the decision?

> > I have a patch set to drop the whole tasklet usage in sound/*
> > (destined for 5.10, to be submitted soon), so if that's for 5.10,
> > it'll be likely superfluous.
> 
>  I have picked patches from your tree to adapt to this new API.
> Those can be picked in 5.10 I suppose.

Adapting the changes are trivial, don't worry.  It was just a question
of how to organize changes.


thanks,

Takashi
