Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 499478789E5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Mar 2024 22:12:35 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rP8rqt9Z;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TtqH50bVvz3dXC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 08:12:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rP8rqt9Z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TtqGL1Yscz2ykt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Mar 2024 08:11:54 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9D93060F95;
	Mon, 11 Mar 2024 21:11:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6D47C433F1;
	Mon, 11 Mar 2024 21:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710191511;
	bh=5KYeLP/Z7vfTMDvVH57E3WBbpcqd5Ed7Gv0l/gsgDTs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rP8rqt9ZaRKGisJCWcWgf4QTpH4FzeNOquAoSwpsM7HHH3LYm03hV9RhPhsNnG2tu
	 4cabvk9Ov2bxHHDzbp02RMzFMJHD+EH1Y0ulcQWG3VJlfQ2Zx0MMfAxIoxml7UbcQQ
	 43ghmZsFIqYvz/9gztBeeWfWMjK5HVvhrvU5Yy6n5/r6etTVqCwY0Vlq4kxZvEYa6f
	 dqIRKMXaZuC80pCqEvlsutSQtdy/DvI0bSwfi5cTtRruVb6usghq3xMLzPCcLsfrff
	 3YDaxB8KJok6zU6REckYq55AjwoZAnoux/OGr3Hea2S0Es5TaK6nIR0vjsdzAhaE0Q
	 S7oy89IkwYTuw==
Date: Mon, 11 Mar 2024 14:11:50 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v7 0/5] Add support for QMC HDLC
Message-ID: <20240311141150.4ebde44b@kernel.org>
In-Reply-To: <20240307113909.227375-1-herve.codina@bootlin.com>
References: <20240307113909.227375-1-herve.codina@bootlin.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, Ratheesh Kannoth <rkannoth@marvell.com>, Yury Norov <yury.norov@gmail.com>, netdev@vger.kernel.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Mark Brown <broonie@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu,  7 Mar 2024 12:39:03 +0100 Herve Codina wrote:
> This series introduces the QMC HDLC support.
> 
> Patches were previously sent as part of a full feature series and were
> previously reviewed in that context:
> "Add support for QMC HDLC, framer infrastructure and PEF2256 framer" [1]
> 
> In order to ease the merge, the full feature series has been split and
> needed parts were merged in v6.8-rc1:
>  - "Prepare the PowerQUICC QMC and TSA for the HDLC QMC driver" [2]
>  - "Add support for framer infrastructure and PEF2256 framer" [3]
> 
> This series contains patches related to the QMC HDLC part (QMC HDLC
> driver):
>  - Introduce the QMC HDLC driver (patches 1 and 2)
>  - Add timeslots change support in QMC HDLC (patch 3)
>  - Add framer support as a framer consumer in QMC HDLC (patch 4)
> 
> Compare to the original full feature series, a modification was done on
> patch 3 in order to use a coherent prefix in the commit title.
> 
> I kept the patches unsquashed as they were previously sent and reviewed.
> Of course, I can squash them if needed.

Applied, thank you!
