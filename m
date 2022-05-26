Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD40534AFB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 May 2022 09:51:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L80Vz4gQxz3c8B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 May 2022 17:51:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux-m68k.org (client-ip=195.130.137.81; helo=weierstrass.telenet-ops.be; envelope-from=geert@linux-m68k.org; receiver=<UNKNOWN>)
X-Greylist: delayed 420 seconds by postgrey-1.36 at boromir; Thu, 26 May 2022 17:51:00 AEST
Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be [195.130.137.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L80VX3301z2ypR
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 May 2022 17:50:59 +1000 (AEST)
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
	by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4L80L84HwPz4x2cT
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 May 2022 09:43:44 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:6498:8099:cb9:b18e])
	by michel.telenet-ops.be with bizsmtp
	id bKjX2700H0qhjiN06KjXSy; Thu, 26 May 2022 09:43:43 +0200
Received: from geert (helo=localhost)
	by ramsan.of.borg with local-esmtp (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1nu89a-001en6-FJ; Thu, 26 May 2022 09:43:30 +0200
Date: Thu, 26 May 2022 09:43:30 +0200 (CEST)
From: Geert Uytterhoeven <geert@linux-m68k.org>
X-X-Sender: geert@ramsan.of.borg
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH net-next] eth: de4x5: remove support for Generic DECchip
 & DIGITAL EtherWORKS PCI/EISA
In-Reply-To: <f84c4cb17eebe385fe22c3fc4563645742269d46.camel@kernel.crashing.org>
Message-ID: <alpine.DEB.2.22.394.2205260933520.394690@ramsan.of.borg>
References: <20220519031345.2134401-1-kuba@kernel.org> <f84c4cb17eebe385fe22c3fc4563645742269d46.camel@kernel.crashing.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
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
Cc: tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, arnd@arndb.de, corbet@lwn.net, netdev@vger.kernel.org, sburla@marvell.com, linux-doc@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, edumazet@google.com, paulus@samba.org, vburru@marvell.com, Jakub Kicinski <kuba@kernel.org>, zhangyue1@kylinos.cn, pabeni@redhat.com, aayarekar@marvell.com, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

 	Hi Ben,

On Sat, 21 May 2022, Benjamin Herrenschmidt wrote:
> On Wed, 2022-05-18 at 20:13 -0700, Jakub Kicinski wrote:
>> Looks like almost all changes to this driver had been tree-wide
>> refactoring since git era begun. There is one commit from Al
>> 15 years ago which could potentially be fixing a real bug.
>>
>> The driver is using virt_to_bus() and is a real magnet for pointless
>> cleanups. It seems unlikely to have real users. Let's try to shed
>> this maintenance burden.
>>
>> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
>
> Removing this driver will kill support for some rather old PowerMac
> models (some PowerBooks I think, paulus would know). No objection on my
> part, though. I doubt people still use these things with new kernels
> but ... who knows ? :-)

Aren't these PCI, and thus working fine with the PCI-only DE2104X
(dc2104x) or TULIP (dc2114x) drivers?

IIRC, I've initially used the de4x5 driver on Alpha (UDB/Multia) or PPC
(CHRP), but switched to the TULIP driver later (that was before the
dc2104x/dc2114x driver split, hence a loooong time ago).

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds
