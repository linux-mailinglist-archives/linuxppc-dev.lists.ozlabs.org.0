Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F862D5F23
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 16:10:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CsHRY4SYGzDr2y
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Dec 2020 02:10:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4CsBYP3ZbnzDqcD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Dec 2020 22:30:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CsBYJ2d3xz9shn; Thu, 10 Dec 2020 22:30:28 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Arnd Bergmann <arnd@arndb.de>, "James E.J. Bottomley" <jejb@linux.ibm.com>, Jaroslav Kysela <perex@perex.cz>, Michael Ellerman <mpe@ellerman.id.au>, Geoff Levand <geoff@infradead.org>, Jakub Kicinski <kuba@kernel.org>, "Martin K. Petersen" <martin.petersen@oracle.com>, Jens Axboe <axboe@kernel.dk>, Jim Paris <jim@jtan.com>, Takashi Iwai <tiwai@suse.com>, Uwe Kleine-König <u.kleine-koenig@pengutronix.de>, "David S. Miller" <davem@davemloft.net>, Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
In-Reply-To: <20201126165950.2554997-1-u.kleine-koenig@pengutronix.de>
References: <20201126165950.2554997-1-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 1/2] ALSA: ppc: drop if block with always false condition
Message-Id: <160756606231.1313423.17458520968397977116.b4-ty@ellerman.id.au>
Date: Thu, 10 Dec 2020 22:30:28 +1100 (AEDT)
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
Cc: linux-fbdev@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-usb@vger.kernel.org, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, linux-block@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, netdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 26 Nov 2020 17:59:49 +0100, Uwe Kleine-König wrote:
> The remove callback is only called for devices that were probed
> successfully before. As the matching probe function cannot complete
> without error if dev->match_id != PS3_MATCH_ID_SOUND, we don't have to
> check this here.

Applied to powerpc/next.

[1/2] ALSA: ppc: drop if block with always false condition
      https://git.kernel.org/powerpc/c/7ff94669e7d8e50756cd57947283381ae9665759
[2/2] powerpc/ps3: make system bus's remove and shutdown callbacks return void
      https://git.kernel.org/powerpc/c/6d247e4d264961aa3b871290f9b11a48d5a567f2

cheers
