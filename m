Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A812C6C0F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 20:39:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CjQ1T3DlbzDrtl
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Nov 2020 06:39:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=geoff@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CjPzK6WgjzDrqX
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Nov 2020 06:37:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=euM/zmZmiU7XynopsfsNk5VEQJ/eikhYtJwXlpq8tno=; b=nl6On1ujk9wd9PEKkJgg2KJ2Am
 m8AA3an/yzFOvOzfdYyYfcRQEQMV6C+rNHKxGHpqDzm49BkSsw+5EhhU0P154qkYr9MXuNpi7PREG
 fPLa8hJsj9oN6M7qgVOHMRcPTnFhMtktGs8woTspm5p63HB4LfTCBfTY+3w6jPlLDCe5rI6brlPWe
 Wzm7YdlXRMuEt8mo+EDmAHmVkjUP3io6h5+Bil+IHytP1lZ1245P0R6S0s2IchExPIzcixOwncumC
 FhBV3gK43XgwhLQNaxt5pUzXLAu2p81YKnwCaC/q+zrjSo81jdUaUUkBqIuXwnd/oQ3fdltyGRC9o
 jz4txzgg==;
Received: from [2602:306:c5a2:a380:9e7b:efff:fe40:2b26]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kijYQ-0005Xk-FY; Fri, 27 Nov 2020 19:37:14 +0000
Subject: Re: [PATCH 1/2] ALSA: ppc: drop if block with always false condition
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Jens Axboe <axboe@kernel.dk>,
 Jim Paris <jim@jtan.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Alan Stern <stern@rowland.harvard.edu>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Leonard Goehrs <l.goehrs@pengutronix.de>
References: <20201126165950.2554997-1-u.kleine-koenig@pengutronix.de>
From: Geoff Levand <geoff@infradead.org>
Message-ID: <fdaedef8-4734-7ab3-9334-b628f8207c9e@infradead.org>
Date: Fri, 27 Nov 2020 11:37:07 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201126165950.2554997-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: alsa-devel@alsa-project.org, linux-scsi@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-block@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, netdev@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Uwe,

On 11/26/20 8:59 AM, Uwe Kleine-König wrote:
> The remove callback is only called for devices that were probed
> successfully before. As the matching probe function cannot complete
> without error if dev->match_id != PS3_MATCH_ID_SOUND, we don't have to
> check this here.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

I tested your two patches plus Leonard's patch 'ALSA: ppc: remove
redundant checks in PS3 driver probe' applied to v5.9 on the PS3,
and they seem to work fine.

Thanks for both your efforts.

Tested by: Geoff Levand <geoff@infradead.org>
