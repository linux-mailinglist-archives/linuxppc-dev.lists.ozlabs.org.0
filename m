Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2CBDFBE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 11:46:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44t0DQ1y00zDqQQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 19:46:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=metux.net
 (client-ip=217.72.192.75; helo=mout.kundenserver.de;
 envelope-from=lkml@metux.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=metux.net
X-Greylist: delayed 10459 seconds by postgrey-1.36 at bilbo;
 Mon, 29 Apr 2019 19:44:02 AEST
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44t09G4JB8zDqNT
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2019 19:44:01 +1000 (AEST)
Received: from [192.168.1.110] ([77.9.18.117]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1N2m3G-1gdyq42eM8-0133kZ; Mon, 29 Apr 2019 11:43:20 +0200
Subject: Re: [PATCH 40/41] drivers: tty: serial: helper for setting mmio range
To: Esben Haabendal <esben@haabendal.dk>,
 "Enrico Weigelt, metux IT consult" <info@metux.net>
References: <1556369542-13247-1-git-send-email-info@metux.net>
 <1556369542-13247-41-git-send-email-info@metux.net>
 <87ef5lz423.fsf@haabendal.dk>
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <d0b966eb-46b7-d145-92ed-3c62c495f41b@metux.net>
Date: Mon, 29 Apr 2019 11:43:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <87ef5lz423.fsf@haabendal.dk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:68dkhGSAKsaCjO526gNf2WSoTW6jL84pVEW36g5e32fJf4hZfEa
 B5yR5eOo/trCHlzEMiqf88gr4lugIpFcu4i7DTW0T8FoWZiDwOwvxkhUV//Oq9txPyP1qxO
 p0s8teHbOF2xnbWjYTCy/e6+F0vybuPcYhQPvcgRagIqrGRZ5ZI4QdP/10WEUP7zI9Ka+YU
 NVd7BerOC+zYOaIOiK9cQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:NvmcDnTkNeI=:ba8d+q8YRab3rFKFqBt24t
 Zg9Zpq/zp8ESR/s4VsMdM2nnOKEofNFRgQuqib0Eoa+F6Di5aptfGcy2fbPQ8PlEnZZ9eFk2I
 W8lkLs1brmFQ4pMtwo1NaxLwJO+yyvyfB7yhUe3mP3ipOkVy3TvxwOqCpUxbn7cvLhhjdXYOV
 RACHse6YI1rEPLKisTi4jbY/Z2xia1z7JZNNtXMm7NyYuxlDHoAmeM51Uq1Sm9jqHrh3VjIFE
 zH5gWFbcmJhRKcS506T4D0qDLdiTRWb5HWe08PMYOLEyCWt6KkONz7ZlQEuLletC4+ebSyFne
 +YblDaPDYWW6s7TMZS94IzEKoglkP06ZU7juKMArxn0JPRB97yN78PMrSGLDm4zCHngdgwukX
 8QhoUFb/g5oGgRP7xEm3XeyGV0XvRu9ft3THf7jFb/oF+7zCYEmaFMR7HLRHU94BxlelmoOUT
 hf0mEVyRlee3ckCEnDTzSPPktrpdeTwqaoCQIhlRInQVIwdhHJ8XZKfDN1mzvZ2IlFCWEBcMH
 +/+AxD4dkbOiJWktWAReEU2MAQiJAuIPnt8UjKkg2V6v0lHpO3+n8CFCI9Jvijm6LfpHzTHUN
 Z7KbPljaibH9464lnBZleel3EqRWzc88wYjkyJ4C3GZdlzFeP8imAVrJmxNQRR3yOT8ND3ssO
 MC6KOR0+WrmqVYkvJIvXzV6xd3FMar2vZbSJ2ckBe+smk2GbBP44mQDVVrZ5aKzyo4QDZBzHk
 BkVF8qEdunqnt+mSaL40iQ9yOh8uAqzpNBWyyGax+adypiNnzhrhF9jigoE=
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
Cc: linux-ia64@vger.kernel.org, lorenzo.pieralisi@arm.com,
 linux-mips@vger.kernel.org, linux-serial@vger.kernel.org, andrew@aj.id.au,
 gregkh@linuxfoundation.org, sudeep.holla@arm.com, liviu.dudau@arm.com,
 linux-kernel@vger.kernel.org, vz@mleia.com, linux@prisktech.co.nz,
 sparclinux@vger.kernel.org, khilman@baylibre.com, macro@linux-mips.org,
 slemieux.tyco@gmail.com, matthias.bgg@gmail.com, jacmet@sunsite.dk,
 linux-amlogic@lists.infradead.org, andriy.shevchenko@linux.intel.com,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 29.04.19 09:03, Esben Haabendal wrote:

> Why not simply replace iobase, mapbase and mapsize with a struct
> resource value instead?

That was actually my original goal, when I started this. But the
situation is a bit more tricky. Many drivers (especially the old ones)
initialize these fields in different ways. And there're many places
accessing these fields.

Drivers for old devices should be handled w/ great care. I don't have
access to all that hardware, so I can't test it. Therefore, I'm trying
to move in small steps. One step ahead another.

One of my next steps would be factoring out more common operations
(eg. mapping, etc) into helpers, up to a point, where someday no driver
is accessing these fields directly anymore.

Then we could easily move everything into struct resource. On that
road, we'd also need to find a way for handling the specialities of
the various UPIO_* modes via struct resource.


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
