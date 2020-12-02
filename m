Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 863B02CBCC9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 13:19:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CmJ1j74FPzDqBy
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 23:19:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CmHvZ5hhbzDr0w
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Dec 2020 23:14:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=qtDh7Ivv; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CmHvM13p4z9sW0;
 Wed,  2 Dec 2020 23:14:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1606911257;
 bh=dHdu5NS4Xw4IX9X/GFAxYuxXCqWGRcHQlDUnVy182gE=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=qtDh7IvvHnc1+eKidZ76vTxF/6g74s2Qv4NdJCP3ZbL1MvM7SMn0lhAVe5tKSzbZQ
 HAZWdo85rrG0VGkeOEqwRUPOnvHmcNv66RNAVaUJFUprFf5SkMq27aOekm8dbPRCY5
 gkzvsxHN3LwDnlCxInjPmxzTiDx21ibFqTqqu3eDy34Z8nkx1csBez+MJFFdL11gkd
 f/LwaVwDLEtHeYQ1e4yz1BkCIl0n6WAAZmXjde8XppUxjXPuEllv155QVe9hK1naST
 fh3/pL4XJyDtWcjIvBpmTiEV3p97PKO/mL+YIWoTYOapjBgcldMx3HEGaWB6OkoQ9g
 G0I0mDDBKdB0w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 2/2] powerpc/ps3: make system bus's remove and shutdown
 callbacks return void
In-Reply-To: <20201129173153.jbt3epcxnasbemir@pengutronix.de>
References: <20201126165950.2554997-1-u.kleine-koenig@pengutronix.de>
 <20201126165950.2554997-2-u.kleine-koenig@pengutronix.de>
 <s5hv9dphnoh.wl-tiwai@suse.de>
 <20201129173153.jbt3epcxnasbemir@pengutronix.de>
Date: Wed, 02 Dec 2020 23:14:06 +1100
Message-ID: <875z5kwgkx.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: alsa-devel@alsa-project.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 Paul Mackerras <paulus@samba.org>, linux-scsi@vger.kernel.org,
 Alan Stern <stern@rowland.harvard.edu>, Jakub Kicinski <kuba@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, linux-block@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Geoff Levand <geoff@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Jim Paris <jim@jtan.com>,
 netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> writes:
> Hello Michael,
>
> On Sat, Nov 28, 2020 at 09:48:30AM +0100, Takashi Iwai wrote:
>> On Thu, 26 Nov 2020 17:59:50 +0100,
>> Uwe Kleine-K=C3=B6nig wrote:
>> >=20
>> > The driver core ignores the return value of struct device_driver::remo=
ve
>> > because there is only little that can be done. For the shutdown callba=
ck
>> > it's ps3_system_bus_shutdown() which ignores the return value.
>> >=20
>> > To simplify the quest to make struct device_driver::remove return void,
>> > let struct ps3_system_bus_driver::remove return void, too. All users
>> > already unconditionally return 0, this commit makes it obvious that
>> > returning an error code is a bad idea and ensures future users behave
>> > accordingly.
>> >=20
>> > Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
>>=20
>> For the sound bit:
>> Acked-by: Takashi Iwai <tiwai@suse.de>
>
> assuming that you are the one who will apply this patch: Note that it
> depends on patch 1 that Takashi already applied to his tree. So you
> either have to wait untils patch 1 appears in some tree that you merge
> before applying, or you have to take patch 1, too. (With Takashi
> optinally dropping it then.)

Thanks. I've picked up both patches.

If Takashi doesn't want to rebase his tree to drop patch 1 that's OK, it
will just arrive in mainline via two paths, but git should handle it.

cheers
