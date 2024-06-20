Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 830C891161B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 00:58:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WOyKtyGi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W4wrK1rbLz3cV4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 08:58:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WOyKtyGi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W4wqX39rmz3cRY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2024 08:57:28 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 630F9CE1E05;
	Thu, 20 Jun 2024 22:57:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B798C2BD10;
	Thu, 20 Jun 2024 22:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718924245;
	bh=oL0lOl8UlorqgDe4N96CXSn6qERkQqsRkdEwKmnMLpE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WOyKtyGiw4R35+cQwJzIRKbOUcM5jG2Lw029k3dBxiy3q5r1r0iBa1pT8T3JHsfuv
	 a7nj6hsTr7uKLww9GJRlRMomasDZ05PZYMJBeTXxYcIOU7n8AaG41zowyTmRcz+1wt
	 h5ykO0hla58PvGtVSXoUdDz2mhTPszr6H5PEnIWIVWYCq6kSsGez5GkzxSillNnGZB
	 Anok5gtr5T61ZSZgYrb/Adj+xTWapsNgVeXSM82qZ28UuoeU2sSaNWl8H7KhrlwUn3
	 +5tlGup1Pd1RWHTQ8tCYqmf/N5c93MmUKsDabdSqJXdEbBZ4q9mx1LBv9YPJtJKrZl
	 up3TkdcO9Qx4Q==
Date: Fri, 21 Jun 2024 00:57:21 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Subject: Re: [Patch v4 10/10] i2x: pnx: Use threaded irq to fix warning from
 del_timer_sync()
Message-ID: <jgqhlnysuwajlfxjwetas53jzdk6nnmewead2xzyt3xngwpcvl@xbooed6cwlq4>
References: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
 <20240620175657.358273-11-piotr.wojtaszczyk@timesys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240620175657.358273-11-piotr.wojtaszczyk@timesys.com>
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
Cc: alsa-devel@alsa-project.org, Vignesh Raghavendra <vigneshr@ti.com>, Michael Turquette <mturquette@baylibre.com>, Li Zetao <lizetao1@huawei.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>, "J.M.B. Downing" <jonathan.downing@nautel.com>, Markus Elfring <Markus.Elfring@web.de>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Yangtao Li <frank.li@vivo.com>, linux-sound@vger.kernel.org, Vladimir Zapolskiy <vz@mleia.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>, Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Chancel Liu <chancel.liu@nxp.com>, dmaengine@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Piotr,

On Thu, Jun 20, 2024 at 07:56:41PM GMT, Piotr Wojtaszczyk wrote:
> When del_timer_sync() is called in an interrupt context it throws a warning
> because of potential deadlock. Threaded irq handler fixes the potential
> problem.
> 
> Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>

did you run into a lockdep splat?

Anything against using del_timer(), instead? Have you tried?

Thanks,
Andi
