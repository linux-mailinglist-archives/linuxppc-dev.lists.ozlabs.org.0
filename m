Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D02E7816CE
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Aug 2023 04:47:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UA/UNvXw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RSNT72SGpz30QQ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Aug 2023 12:47:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UA/UNvXw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RSNSG0xpfz2xFm
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Aug 2023 12:47:10 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B1A5D6303B;
	Sat, 19 Aug 2023 02:47:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE3ADC433C7;
	Sat, 19 Aug 2023 02:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692413221;
	bh=oU+6WMg6c2UrnTMLgklxjc7ykpSmhNqopEee8qwkVPk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=UA/UNvXwmLrhSEAhg7lPYmOjNAVVkUkN9pybSImmVxT+0lHuWrCcaZDmCSoYrvjyf
	 YhhI8bWGwgB+/99XZjtcruhpCWdBrpxn6MzuLWby7GqJRFG8rl8Cp+0RQ1VUqQk3jF
	 mEoMvMZpzs2YDyofEWA2JeQE+79wztJn67eSs7aVEPegNN3LeoWHQEXUhIZblTGeku
	 CuQQZAb6wJZuVe6I1lmEZcIgOQSfklhXfzmvPyJ2w9ky5Jtg3bfDWdjkqgDwrb5fbq
	 HkwvaKBtm+RCRcUr1M0AFhFV57+Nb9oY7HsEgtMxvTIkF/G+3ZTn+MWUggMWo2BOeq
	 9NRqhAAGGxXfw==
Date: Fri, 18 Aug 2023 19:46:58 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v4 21/28] net: wan: Add framer framework support
Message-ID: <20230818194658.369da77a@kernel.org>
In-Reply-To: <5f671caf19be0a9bb7ea7b96a6c86381e243ca4c.1692376361.git.christophe.leroy@csgroup.eu>
References: <cover.1692376360.git.christophe.leroy@csgroup.eu>
	<5f671caf19be0a9bb7ea7b96a6c86381e243ca4c.1692376361.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Andrew Lunn <andrew@lunn.ch>, alsa-devel@alsa-project.org, Herve Codina <herve.codina@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Jaroslav Kysela <perex@perex.cz>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Fabio Estevam <festevam@gmail.com>, Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Lee Jones <lee@kernel.org>, Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Nicolin Chen <nicoleotsuka@gmail.com>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Takashi Iwai <tiwai@suse.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>, Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller
 " <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 18 Aug 2023 18:39:15 +0200 Christophe Leroy wrote:
> From: Herve Codina <herve.codina@bootlin.com>
> 
> A framer is a component in charge of an E1/T1 line interface.
> Connected usually to a TDM bus, it converts TDM frames to/from E1/T1
> frames. It also provides information related to the E1/T1 line.

Okay, progress is being made, now it builds patch by patch.
Still some kdoc warnings remain (W=1 build only catches
kdoc warnings in sources, you gotta run ./scripts/kernel-doc -none
explicitly on the headers):

include/linux/framer/framer.h:27: warning: Enum value 'FRAMER_IFACE_E1' not described in enum 'framer_iface'
include/linux/framer/framer.h:27: warning: Enum value 'FRAMER_IFACE_T1' not described in enum 'framer_iface'
include/linux/framer/framer.h:35: warning: expecting prototype for enum framer_clock_mode. Prototype was for enum framer_clock_type instead
include/linux/framer/framer.h:47: warning: expecting prototype for struct framer_configuration. Prototype was for struct framer_config instead
include/linux/framer/framer.h:60: warning: cannot understand function prototype: 'enum framer_event '
include/linux/framer/framer.h:89: warning: Function parameter or member 'notify_status_work' not described in 'framer'
include/linux/framer/framer.h:89: warning: Function parameter or member 'notifier_list' not described in 'framer'
include/linux/framer/framer.h:89: warning: Function parameter or member 'polling_work' not described in 'framer'
-- 
pw-bot: cr
