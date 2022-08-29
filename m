Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C395A57B0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 01:41:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGn50454wz3c1p
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 09:41:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=ArosEJjF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGn4M5VFwz2xGD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Aug 2022 09:40:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=ArosEJjF;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MGn4G5VpBz4x3w;
	Tue, 30 Aug 2022 09:40:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1661816431;
	bh=kD9DT1iOOQycVbjPgR5ddjhaq7eIsg081yQ+aUUl9UE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=ArosEJjFSvmrQqbI0FCPipkYSeCJqhCAuXeMbFuvIFnAGMTeFixxRZjlgtQd20vdc
	 DIpc51GwcbDp0vgTyRK+GSjrdLNQMI/Pf5myeacSaETio82kcCwj7qFNX5ocWUzSWd
	 IfB19atNBoCS03zZRO0zOZK/R5JnI7+DuoH4mjNFRiVF+6LSPRi+7IuvEn+TCedsTC
	 I6z4wYj31mYgsDW+PlcBr0P5S74Iw48HJWdeSuyNYanJodEmuyh8ExJ0KqGGg04HOi
	 1kCSEF+nNCQwZyrPx8uJ8rGhZknvzb80ITaQpaf27ROAH7nj4x5WqJi5Cs/M366ncH
	 0nVEIbUlace7w==
Message-ID: <bc95ca95965e69aa434454b5f9fd02c378e35b1e.camel@ozlabs.org>
Subject: Re: [PATCH] Documentation: spufs: correct a duplicate word typo
From: Jeremy Kerr <jk@ozlabs.org>
To: Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org
Date: Tue, 30 Aug 2022 07:40:28 +0800
In-Reply-To: <20220829232908.32437-1-rdunlap@infradead.org>
References: <20220829232908.32437-1-rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.3-2 
MIME-Version: 1.0
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
Cc: linuxppc-dev@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Randy,

> Fix a typo of "or" which should be "of".

Nice, people are still reading the spufs docs! :D

Looks good to me, thanks for the patch.

Reviewed-by: Jeremy Kerr <jk@ozlabs.org>

Cheers,


Jeremy
