Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B057D68EA16
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 09:42:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PBYQG3dn4z3cdr
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 19:41:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm1 header.b=yMaUdS+a;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=DPWWMLRf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sakamocchi.jp (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com; envelope-from=o-takashi@sakamocchi.jp; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm1 header.b=yMaUdS+a;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=DPWWMLRf;
	dkim-atps=neutral
X-Greylist: delayed 422 seconds by postgrey-1.36 at boromir; Wed, 08 Feb 2023 19:41:03 AEDT
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PBYPC12q0z3bWC
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Feb 2023 19:41:03 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id D48CD5C0072;
	Wed,  8 Feb 2023 03:33:54 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 08 Feb 2023 03:33:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1675845234; x=
	1675931634; bh=jukRv2y1xt9Uct7GPytfpJjy5G82Ak1THGb0pVwupSk=; b=y
	MaUdS+a0CTiq9wEFVIKTlIcX6qaKtsUGQqpQDpuKvgJV0zbEfcqoTCeXMuRP23WV
	NBmPljneI3tPYtDlgOuSgBg5rVHcnbF5mosJFpAKlYG1cfp7SiewCBKXHMELgUui
	0HlnlVkgujKNWpHp2EZsQEfNgOsB/WulnsyNVLYLhVJG3qKTDxEBbzOJJU8lVk6r
	Of7/RKXbxiW0WDHPmy5Yd1oS+N65oXVipuq6Vs7scxLwIQ31wBeT/wrwU2S6c74K
	rzpbAfA2KwtQCNJMg7zrOYQS41rJu0c1FjnuP5X3dF8RjcOj0x/DzCrsWuvZAeAH
	W5AslNJPEnWfL85F2HQpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1675845234; x=
	1675931634; bh=jukRv2y1xt9Uct7GPytfpJjy5G82Ak1THGb0pVwupSk=; b=D
	PWWMLRfuim1VO+n+LmGYnpfrCUG2ISKP8EStW4KqUz95X60TYknJm4QgZbC5jetY
	KXS8Kuw7mxYcamXzTvcVsgGYE5SZKVYX5DhZF+kglLFZVhRO7VFlE0cXdo9rRMHz
	DaqCMy1rR/nMS3Y3pStv10RUTthXTPFzx6tLus7put4GA7u7o6x3RfrvSbJSwhio
	6SCKQtsjS/f4m0+dLXZMCcPFXBu4WLX1zEf+ZFren+uEgp6TTIY/7AfPY4PVmokS
	4/JQgeijKEH9VAPNVpY0G27yKPvDlELbjn/lyKLeEiG4bNoc4QU+rccg6y6MuEwx
	AnNaRDuMAZWVSJ6pmz6ow==
X-ME-Sender: <xms:cV7jYzFq333IxvTrGNU_ToSRZCKZffZ0vILNnYI9Xh-y4HGgZ1wxEw>
    <xme:cV7jYwVZqvxSaRMgJwzkeTBLfGD6zczbFaUsorrIauTe5l8DaaRPygdcTQDxLScZP
    AMgT3IEVV8DWpFtzfI>
X-ME-Received: <xmr:cV7jY1K9fv7a11h1mZF-16L1n7xRN-RtIlS0Qw36LCkaCyHCWN2h8TX_U-Lc-p5cn5QpwfHScsLpCU5rXPdoi5aLa7_uAWzFwG5M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudegledguddukecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomhepvfgr
    khgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthh
    hirdhjpheqnecuggftrfgrthhtvghrnhepgeejteekhfejteeiffelleffhefgieffkefh
    leeujeffkeeiuedvieegfeffieelnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghk
    rghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:cV7jYxG0iSLAxmEd8aNTs4cMYykuZDROgUPgZL-QpkxMCaIIuW5NEQ>
    <xmx:cV7jY5W1WGZtWIB8mkolNG6BWfOOvjJF_vzgvZlxhNOvarkoaraK0Q>
    <xmx:cV7jY8PKK2N98zaAP-axpRUjBqLB0LVJhFl1wzCq7iwzKjOuZe8Bhw>
    <xmx:cl7jY0MUpsS_jiG34GdszFPAoJhUMflQBAyIRofAsoC23IJbqWaggg>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 Feb 2023 03:33:51 -0500 (EST)
Date: Wed, 8 Feb 2023 17:33:48 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 0/3] ALSA: core: Make some functions return void
Message-ID: <Y+NebPBazKrqJoEZ@workstation>
Mail-Followup-To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Geoff Levand <geoff@infradead.org>,
	Michael Ellerman <mpe@ellerman.id.au>, alsa-devel@alsa-project.org,
	kernel@pengutronix.de, Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-tegra@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <20230207191907.467756-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230207191907.467756-1-u.kleine-koenig@pengutronix.de>
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
Cc: alsa-devel@alsa-project.org, Geoff Levand <geoff@infradead.org>, Takashi Iwai <tiwai@suse.com>, Nicholas Piggin <npiggin@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, kernel@pengutronix.de, linux-tegra@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Tue, Feb 07, 2023 at 08:19:04PM +0100, Uwe Kleine-König wrote:
> Hello,
> 
> while checking in which cases hda_tegra_remove() can return a non-zero value, I
> found that actually cannot happen. This series makes the involved functions
> return void to make this obvious.
> 
> This is a preparation for making platform_driver::remove return void, too.
> 
> Best regards
> Uwe
> 
> Uwe Kleine-König (3):
>   ALSA: core: Make snd_card_disconnect() return void
>   ALSA: core: Make snd_card_free_when_closed() return void
>   ALSA: core: Make snd_card_free() return void
> 
>  include/sound/core.h      |  6 +++---
>  sound/core/init.c         | 40 ++++++++++++++-------------------------
>  sound/pci/hda/hda_tegra.c |  6 ++----
>  sound/ppc/snd_ps3.c       |  4 +---
>  4 files changed, 20 insertions(+), 36 deletions(-)

All of the changes in the patches look good to me, as the return value
seems not to be so effective for a long time (15 years or more) and
expected so for future.
 
Reviewed-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>

One of my concern is that we are mostly in the last week for v6.3
development. When taking influence of the changes into account, it
would be possible to postpone to v6.4 development. But it's up to the
maintainer.


> base-commit: 05ecb680708a1dbe6554d6fc17e5d9a8a7cb5e6a

A small nitpicking. I think you use Linus' tree or so:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=05ecb680708a

Because the hash is not reachable from the branch for next merge window on
the tree of sound subsystem upstream:
https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/commit/?h=for-next&id=05ecb680708a

I guess it is safer to use his tree as your work-base, even
if the three patches can be applied to it as is (fortunately).


Regards

Takashi Sakamoto
