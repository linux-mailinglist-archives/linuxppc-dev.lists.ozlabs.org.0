Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0368AC906
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Apr 2024 11:37:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=L3g4t8lS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VNKsD1L7Sz3cWP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Apr 2024 19:37:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=L3g4t8lS;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VNKrW2P9Cz3cVD
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Apr 2024 19:36:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1713778587;
	bh=3jnjGD1wi9uX+Rp6wYeoPNeMs6VitJSxh06HmBQgJ7o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=L3g4t8lSRBRIN542rtTbngwEhyuP3PprTdqXLO3bUKIptQa6lU60Rufd/Km1BjYC9
	 /HCPrjvheDOsBp1uj86Q7emLvB4Oe4UtzOAD3JtiIFXJ4gFw7RVtX8umdFHEDHhXMe
	 t2qhmOsbOBvxObKWqWjblsFFZ/lEDnNnNUk/jrONlYbUxjJpRoEiWJHG95omDeHkFC
	 /sD5IpkwBptem70jQkU8zTWusue1T+dAI/y7z2pP4LgaKlYcDMnOV0LdAAN7MZUFpM
	 r1rA/Tfu4nVyEMQBHzJ6Zq3RMvcZFHN/6/2wrJQPfM328ZxeFfjO+pqjR8QqY7EfYS
	 IUtQH7R5IL29A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VNKrW0PmJz4wyh;
	Mon, 22 Apr 2024 19:36:27 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc: Split PAGE_SHIFT/SIZE into vdso/page.h
In-Reply-To: <20231221120410.2226678-1-mpe@ellerman.id.au>
References: <20231221120410.2226678-1-mpe@ellerman.id.au>
Date: Mon, 22 Apr 2024 19:36:26 +1000
Message-ID: <87jzkpkacl.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linus.walleij@linaro.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:
> The VDSO needs PAGE_SHIFT/SIZE defined, so it includes asm/page.h.

For the archives, this was superseeded by Arnd's rework:

  https://lore.kernel.org/all/20240320180228.136371-1-arnd@kernel.org/

cheers
