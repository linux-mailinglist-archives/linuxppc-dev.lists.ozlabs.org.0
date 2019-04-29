Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D1277DD77
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 10:13:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44sy8d2pXpzDqQQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 18:13:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=haabendal.dk
 (client-ip=46.30.210.182; helo=mailrelay1-1.pub.mailoutpod1-cph3.one.com;
 envelope-from=esben@haabendal.dk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=haabendal.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=haabendal.dk header.i=@haabendal.dk header.b="CP2vSNy7";
 dkim-atps=neutral
X-Greylist: delayed 330 seconds by postgrey-1.36 at bilbo;
 Mon, 29 Apr 2019 17:04:27 AEST
Received: from mailrelay1-1.pub.mailoutpod1-cph3.one.com
 (mailrelay1-1.pub.mailoutpod1-cph3.one.com [46.30.210.182])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44swd70LhwzDqNC
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2019 17:04:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=haabendal.dk; s=20140924;
 h=content-type:mime-version:message-id:in-reply-to:date:references:subject:cc:
 to:from:from; bh=2zPNY/cLW+90UYWtDhMxkbIjGVuo2/qwkZPK5J1aSCw=;
 b=CP2vSNy756Mu3PtV+/tCzfX6N6bBGGfZKwlgWUT2H2cArhP/z70fnh24zaD9CdWJ/CVftTTS4gt2y
 lzy6ywMHBUcRWoNQim3ZF/6tQSSjIgSDKBsymx0AH22Qz5W85tgTTNBnRrDn0B9XKmkxbmpYhfGqah
 6+ZKk6oxQnrQyZZY=
X-HalOne-Cookie: 03bc1ce83dc9ecce239c19145261b37861aa8c6c
X-HalOne-ID: dcee62ed-6a4c-11e9-b614-d0431ea8a283
Received: from localhost (unknown [193.163.1.7])
 by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id dcee62ed-6a4c-11e9-b614-d0431ea8a283;
 Mon, 29 Apr 2019 07:03:16 +0000 (UTC)
From: Esben Haabendal <esben@haabendal.dk>
To: "Enrico Weigelt\, metux IT consult" <info@metux.net>
Subject: Re: [PATCH 40/41] drivers: tty: serial: helper for setting mmio range
References: <1556369542-13247-1-git-send-email-info@metux.net>
 <1556369542-13247-41-git-send-email-info@metux.net>
Date: Mon, 29 Apr 2019 09:03:16 +0200
In-Reply-To: <1556369542-13247-41-git-send-email-info@metux.net> (Enrico
 Weigelt's message of "Sat, 27 Apr 2019 14:52:21 +0200")
Message-ID: <87ef5lz423.fsf@haabendal.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Mon, 29 Apr 2019 18:12:14 +1000
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

"Enrico Weigelt, metux IT consult" <info@metux.net> writes:

> Introduce a little helpers for settings the mmio range from an
> struct resource or start/len parameters with less code.
> (also setting iotype to UPIO_MEM)
>
> Also converting drivers to use these new helpers as well as
> fetching mapsize field instead of using hardcoded values.
> (the runtime overhead of that should be negligible)
>
> The idea is moving to a consistent scheme, so later common
> calls like request+ioremap combination can be done by generic
> helpers.

Why not simply replace iobase, mapbase and mapsize with a struct
resource value instead?

Incidentally, that would allow to specify a memory resource with a
parent memory resource :)

/Esben
