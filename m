Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 092F292E17D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2024 10:07:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=G9vb5BbR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WKS4K4W9Tz30Wc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2024 18:06:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=G9vb5BbR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WKS3f0WZDz30Wc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2024 18:06:21 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EACFA61BCB;
	Thu, 11 Jul 2024 08:06:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 048E8C116B1;
	Thu, 11 Jul 2024 08:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720685178;
	bh=wj4J13ImGJ99o42zdWJ7/yPMS++KVQq5UDwBY0VGnAE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G9vb5BbRi+CNTpkpSy5JWi43mwn7x3Wj9UL63A0mvZ4kORwRTdP5F6fIQrmdYCPnt
	 Zewi3SICi5VbqRCe87FMYhxcAB+iAqLGoD1s/+u5N5OwokAC3EO3tD32Jot5B4/BmP
	 khXdASxl2X+qbw19eWmYE63MUfeaTlWG2K6oY9WHiYpc6oh+I2j0RZKQQ9fDPsdhdE
	 Sq85bCZ0dDU28pzUkQBkrKcTkAHuDvoIyWyrluIMQQ28s4nJ4AXrTmRp/Ivz3kjhSL
	 3sGde0s4Pzc3BEjFsCkqQREwEuazoYTr28eWspPjIIc0/NBD6X8rXXGlxGZriU8QoF
	 kzPEHHMWhVk6A==
Date: Thu, 11 Jul 2024 10:06:14 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2 35/60] i2c: opal: reword according to newest
 specification
Message-ID: <kw6722v3rwxkuw4xqghvac6acxblcljsv5e4g6jhexjjb47pzh@y2jprwr3t653>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-36-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240706112116.24543-36-wsa+renesas@sang-engineering.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>, linux-i2c@vger.kernel.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Wolfram,

On Sat, Jul 06, 2024 at 01:20:35PM GMT, Wolfram Sang wrote:
> Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
> specifications and replace "master/slave" with more appropriate terms.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi
