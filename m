Return-Path: <linuxppc-dev+bounces-15540-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9E3D12984
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jan 2026 13:48:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqXHL2t5fz30Pn;
	Mon, 12 Jan 2026 23:48:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.176.79.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768222110;
	cv=none; b=ZiVInkWlNaltC8cFyXBPc2Ba+rcMTzblVcy2A12ZnNSqqeZlze8cfmZrqZ0JSxXTzmWkTMdJspMdBkRbo2BcSlWN9CWrpzAkDUsVq0WgnUNz0ci1lTHZvAbBwqoANPLENy6k+2fp9bRoReltq5iozKzO6JyVgnYm/8wr8BJhYcbAmRVNgE+t8Bd6kZvzMA0/Oyk6QSwErROp9bNPG+NpGvsHa6qLcB2/aYaIi0e+P1U+yhizYBHkn4MDgnVWYReqrDpowuXOFHqOGed4JaGnRFNovLmTR2am42twYJ5LS0o/Vb+rYBmm+4S9hLfgoF2DJTTvDfiCMctLavdmR3afeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768222110; c=relaxed/relaxed;
	bh=y227+Dq70uj/zUfx9CHnwPhVVQ9IhJDk2aGUpI4Iggw=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Yur3UyNd9b+E3F4G5URMYzEwjTCBQqOWGZHYIey583DI/r/XBKSezjBy/TFuw4paLiaPPHcQvFJ0EBtD8Y3NxYTqVQhha25sANYMY9cG4u/62qHVKEYAu8mhnwNxPMy5oiHcBiA+CHoG+FkRc8ZPgK7gQTwR+26e5VeeK/HNkE7aGrdPU2uoTuhMTxKiv6Aq+NkN4LT5aJNwmjbaNW4Mg/y/TIZLGGodw9ec/ON3YVjUsJiRFIMF6rSFGOV+YfxtQa3xsrd9UfvgsBC4XddzJLNwvKlm37RYM1Wa5J/F6WDGpvJjRytpH7N04Kcg/d2WKVqkcA6FzmS92UgqbqbLgg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqXHK3Zlrz30HQ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jan 2026 23:48:29 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dqXGw4LYvzHnH6K;
	Mon, 12 Jan 2026 20:48:08 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 9539B40086;
	Mon, 12 Jan 2026 20:48:24 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Mon, 12 Jan
 2026 12:48:22 +0000
Date: Mon, 12 Jan 2026 12:48:21 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
CC: Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>, "Saravana
 Kannan" <saravanak@google.com>, Nathan Chancellor <nathan@kernel.org>, "Nick
 Desaulniers" <nick.desaulniers+lkml@gmail.com>, Bill Wendling
	<morbo@google.com>, Justin Stitt <justinstitt@google.com>, Russell King
	<linux@armlinux.org.uk>, Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, Krzysztof Kozlowski <krzk@kernel.org>, "Alim
 Akhtar" <alim.akhtar@samsung.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>, "Nicholas Piggin" <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Nipun Gupta
	<nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>, Abel Vesa
	<abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, Michael Turquette
	<mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	Vinod Koul <vkoul@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, "Rafael J. Wysocki"
	<rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<llvm@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-clk@vger.kernel.org>, <imx@lists.linux.dev>,
	<dmaengine@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<linux-pm@vger.kernel.org>
Subject: Re: [PATCH v3 06/12] cdx: Simplify with scoped for each OF child
 loop
Message-ID: <20260112124821.00001a04@huawei.com>
In-Reply-To: <20260109-of-for-each-compatible-scoped-v3-6-c22fa2c0749a@oss.qualcomm.com>
References: <20260109-of-for-each-compatible-scoped-v3-0-c22fa2c0749a@oss.qualcomm.com>
	<20260109-of-for-each-compatible-scoped-v3-6-c22fa2c0749a@oss.qualcomm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
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
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100009.china.huawei.com (7.191.174.83) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, 09 Jan 2026 17:57:50 +0100
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
but only on basis next one merges as well just for that 'obey the strict
rules in cleanup.h'.

No bug bug I like not having to think about whether there is or not :)

