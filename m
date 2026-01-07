Return-Path: <linuxppc-dev+bounces-15381-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5915BCFD2D1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 07 Jan 2026 11:30:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dmPSF2fXhz2yFh;
	Wed, 07 Jan 2026 21:30:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=94.231.106.210
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767781821;
	cv=none; b=ebfjF3T/U1gTRshpjj3yckj4ET3WhIWtgVA0f0un7Z3vtDQREpYWRaG/nH6JVJmGlcVRkj0IaRzgbDRgYLaGIsOHXX/qJUFVfYtu8MOQHa2WfSp9UbsUE7Ckq9zFRoWkGYi+KBbT89oED9kABsp0YGEGFkt6ZnSQAMMkEJOUtL2D96CL5ScHFvQ50Vj0A1l57UYKC3zWdS0r/d7ntWrgSvKIyM/L8GEZAIlL03u8eR5gMNUUzthYI+ugR4j/ha+juA6h5GXy1ZO7nIP3zBiSYxZvBadguuFmBjwLOcZCl77hgrIzYjqiHOqfYOZiMZefALjQNgOJtx/NF1dtubpyhw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767781821; c=relaxed/relaxed;
	bh=5sCdqnj/RCGcOZ4N1FNFLLmFTy7auxTIhL2QEEcNqFg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AP6tz8ikWvOUKgovFkjrROM3/66Y2iTvCXAWh6BNQzzjw1UhN89OlZk1Wl8hp/7tGk04qbW3Hry62VNt7WcLdjuJcWdO7ZbgpvvpSy5dC5MrOQ23PDjOgN4guEHTK2oqBFqfmaPU38IfHBSguOpwMvuEG+1WE1mUSIaCR/E3eZvxIjVIiCLZozcgDNZrltEbwoSgu6kOmM2UINDqXG23wjr2MGtmOI3mnWyjuFroymfDucHl2RJWhQYhD62hzckpME+PjfKSYEXCjmw7Fh6hiESYTozc8mEdMyi9NrztBk4tYz329UijZMBBmhiH3BW9FE2Y56dvjbDu7l1YDNje7w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gaisler.com; dkim=fail header.d=gaisler.com header.i=@gaisler.com header.a=rsa-sha256 header.s=simplycom2 header.b=GapqslJR reason="key not found in DNS"; dkim-atps=neutral; spf=pass (client-ip=94.231.106.210; helo=smtp-out3.simply.com; envelope-from=andreas@gaisler.com; receiver=lists.ozlabs.org) smtp.mailfrom=gaisler.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gaisler.com
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=gaisler.com header.i=@gaisler.com header.a=rsa-sha256 header.s=simplycom2 header.b=GapqslJR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gaisler.com (client-ip=94.231.106.210; helo=smtp-out3.simply.com; envelope-from=andreas@gaisler.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 439 seconds by postgrey-1.37 at boromir; Wed, 07 Jan 2026 21:30:18 AEDT
Received: from smtp-out3.simply.com (smtp-out3.simply.com [94.231.106.210])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmPSB1jNnz2xLR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jan 2026 21:30:18 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by smtp.simply.com (Simply.com) with ESMTP id 4dmPHX1tZwz1DDr1;
	Wed,  7 Jan 2026 11:22:48 +0100 (CET)
Received: from [10.10.15.21] (h-98-128-223-123.NA.cust.bahnhof.se [98.128.223.123])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by smtp.simply.com (Simply.com) with ESMTPSA id 4dmPHS5YrMz1DDdR;
	Wed,  7 Jan 2026 11:22:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gaisler.com;
	s=simplycom2; t=1767781367;
	bh=5sCdqnj/RCGcOZ4N1FNFLLmFTy7auxTIhL2QEEcNqFg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=GapqslJRt7PAo/OPdy40/uiS8yl/fdKamd8Ti7v8KhTSWM+dyJpM0kA09WqDkvmTF
	 JDac2AP0hk4IXLuaOc19G85CIClqVXmQFScccHC7rgNcYdl16DovAFndj0u/scyZuZ
	 rFnlzmQeoXkgQ81qRhHQTXrNih6T2iluIH43PJMds/ZZIo6rm/VM9YDeYihibbVdmg
	 uDvdrF41naRrcWhAD/3/BJoa7qr9vCUPqLxuLP48CDDioxfF0rw5/F8n0Js/OfpQsy
	 f1VR1SCUMB9l0JY24lstr5qvSKP50VGC6KkhF0cw5Ng7hX+p9V4PT5L0p7hEJpFlek
	 UmVwAHzAgacCA==
Message-ID: <836139d1-1425-4381-bb84-6c2654a4d239@gaisler.com>
Date: Wed, 7 Jan 2026 11:22:44 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/19] printk cleanup - part 3
To: Marcos Paulo de Souza <mpdesouza@suse.com>,
 Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <danielt@kernel.org>,
 Douglas Anderson <dianders@chromium.org>, Petr Mladek <pmladek@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>, John Ogness
 <john.ogness@linutronix.de>, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jiri Slaby <jirislaby@kernel.org>, Breno Leitao <leitao@debian.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Kees Cook <kees@kernel.org>,
 Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>
Cc: linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
 kgdb-bugreport@lists.sourceforge.net, linux-serial@vger.kernel.org,
 netdev@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
Content-Language: en-US
From: Andreas Larsson <andreas@gaisler.com>
In-Reply-To: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025-12-27 13:16, Marcos Paulo de Souza wrote:
> The parts 1 and 2 can be found here [1] and here[2].
> 
> The changes proposed in this part 3 are mostly to clarify the usage of
> the interfaces for NBCON, and use the printk helpers more broadly.
> Besides it, it also introduces a new way to register consoles
> and drop thes the CON_ENABLED flag. It seems too much, but in reality
> the changes are not complex, and as the title says, it's basically a
> cleanup without changing the functional changes.

Hi,

Patches 7-17 all say "replacing the CON_ENABLE flag" in their
descriptions, which should rather be "replacing the CON_ENABLED flag".

Cheers,
Andreas


