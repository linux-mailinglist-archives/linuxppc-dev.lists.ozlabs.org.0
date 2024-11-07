Return-Path: <linuxppc-dev+bounces-3009-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C38719C0D6F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2024 19:04:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkqhT26Q9z3bpx;
	Fri,  8 Nov 2024 05:04:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc4:8::227"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731002649;
	cv=none; b=ilNm2Wedsjt+REjDgSqv5deuTNWXv2CIj7mpIv7fRxN/glxm0OjQZh1v9P8uNVdF8vWtAyAZXLmv+O2OMf7sEqOHY/xOoRQjmzrHNquCw5MP9FDDuQcrg5cUJxUQchxIN4+UHyN70/x1nzpXRUosfmwBYx3TpqPl/9hJgh6YXsegUga1ky3GFimA/2Y6EPiu+2xciIv10ZfcRyMESk+v4jRt+iDpkePRIoulXRahmqOOA9FLCx+RaFaubzPVbHpklNGP46HeRi35WKblFiXjJFWRvWeCay9baLndL4yJqYRREvMKatfIihp4ky2NCDmNj40xaTl9cYt6h9ltPusESQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731002649; c=relaxed/relaxed;
	bh=v9XGExYP+FD5xVE83+PPloi9X/IUrzdreygul4BmLSg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H7Jca0davHgJ3WTOrzlndt0HuI4MyFDA/a/ahk6ey44Go4fukC3LB3iFZU/5DBkEYe+4W0oSmR1AgmH3ghOrHEe5phmgima+vf3Miapq4tcmIzr8uLkwpz0Vv73qpt2/8+iwkVTMDqAI+YJDa4H23WJO+JWSl8u8wo3BNdDVA3CngwiCxG4acc9yzmtZdqbYKESDrP+YQy4JYnEujfneRpLDZHCHBQBbPhFItXIbom5mE6ps17PAAoLWXgl/7x8E++1+DCa2Te41bI3QWzMFt5WvcNUk3HQ78EjMz+B6wcVlRDwF1g86zt+iE/QTo0svtnvOT5mcmDxOhOZGKMuv7w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=KB4eO8qI; dkim-atps=neutral; spf=pass (client-ip=2001:4b98:dc4:8::227; helo=relay7-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=KB4eO8qI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::227; helo=relay7-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 3650 seconds by postgrey-1.37 at boromir; Fri, 08 Nov 2024 05:04:07 AEDT
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkqhR5YxTz3bps
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2024 05:04:06 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 06FB520007;
	Thu,  7 Nov 2024 18:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731002638;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v9XGExYP+FD5xVE83+PPloi9X/IUrzdreygul4BmLSg=;
	b=KB4eO8qIa2MRgT2At0Bdgd+UcoRM2YYL9KjNKlbF8yXXtpwRizS70pLAYRkcXi8dLVomi+
	3omDI4Zr3vVMcPvLVcYxQ8+dMMa5t10R8cBe9Yn9E7jBEFoH+5uLrgKqxowz/g08KGIVnq
	WG8rbEYxIS1P/nD20TGfDGuNX8ghZ4kEzMUuPhar1AIPyH5h0vEn9QTWhc5QGh3Tm+Y43M
	qTlgd9H7dMtGCTJIYWCpnh+zxOwoQNEUmgYqOP39Zs0ojXN3ofFZ2xvMsdQQEx1Buzpq7L
	vUrs/k/aXYhmd/k4PtLr3lhYTjmzCbSD6QJNoWPQySRXM4U1YzbaMq8WATpgeQ==
Date: Thu, 7 Nov 2024 19:03:55 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: davem@davemloft.net, Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski
 <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Heiner
 Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com, Herve Codina
 <herve.codina@bootlin.com>, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?=
 <u.kleine-koenig@baylibre.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH net-next 2/7] net: freescale: ucc_geth: split
 adjust_link for phylink conversion
Message-ID: <20241107190355.7daafc3d@fedora.home>
In-Reply-To: <Zyz-CcO1inN06mtm@shell.armlinux.org.uk>
References: <20241107170255.1058124-1-maxime.chevallier@bootlin.com>
	<20241107170255.1058124-3-maxime.chevallier@bootlin.com>
	<Zyz-CcO1inN06mtm@shell.armlinux.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: maxime.chevallier@bootlin.com
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello Russell,

On Thu, 7 Nov 2024 17:51:05 +0000
"Russell King (Oracle)" <linux@armlinux.org.uk> wrote:

> On Thu, Nov 07, 2024 at 06:02:49PM +0100, Maxime Chevallier wrote:
> > Preparing the phylink conversion, split the adjust_link callbaclk, by
> > clearly separating the mac configuration, link_up and link_down phases.  
> 
> I'm not entirely sure what the point of this patch is, given that in
> patch 7, all this code gets deleted, or maybe moved?
> 
> If it's moved, it may be better in patch 7 to ensure that doesn't
> happen, and move it in a separate patch - right now patch 7 is horrible
> to review as there's no way to see what the changes are in these
> link_up()/link_down() functions.

I agree that it's hard to review indeed... I followed the documented
approach of splitting-up the adjust_link callback then performing the
conversion, but it's true that it doesn't really make patch 7 more
readable.

I can try to move things around and make patch 7 a bit more
straightforward.

Thanks,

Maxime


