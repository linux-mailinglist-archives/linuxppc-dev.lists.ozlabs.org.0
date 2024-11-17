Return-Path: <linuxppc-dev+bounces-3360-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B18F9D0383
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Nov 2024 13:25:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xrqhn2jFyz2yGT;
	Sun, 17 Nov 2024 23:25:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731846313;
	cv=none; b=OL6iDveNcRxZY8voyhBXPZNtgvnp6A4ZdCwGVr9ND4uYd4lv7r63R5sZhZDXmt4raJxqxABI4VRDHJ6JPuk++3vVfePoWNAHUdmXj4gJxHqFOFVp+Jp/Sis/kLRWiuFVoFsnQAjg0l5dsUEBWVJ0jp8f6QKKi1pkgVlj2rHv/anZLt1kwVB9jSUW7EhAr686/MRc4SSAzzaNYW+K17lVuNvgKrd6eBe1RWdimpzGP5VuvvAPjHeHdUgPz665niqv/HYMOw2eQSI67qOyAGq4krDl3/6OQW65uamLpP4qDNhg/XgeDDWYyafke84Yr17URCXZX8ldVw2j/jrJDS0+QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731846313; c=relaxed/relaxed;
	bh=ZwnTGlAOhqOsDts/gSmhFHjUFoMKSdv4VzJ6Hwaq0no=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bet11LhGXyKaC9j+0Ml0/uqlTqyFXRmY7DJwU5AyYOkWHjfPWh4otZ1YWvnZEZUTDnMM4Tv1EqgKF1aj2Gn8iEzcfvjmR0R8C4Q2O+59JwPS7FELOT0jJYlq7oIyKqa+pdbOdHwypQ/0+fSqdPJ0HoaHTq+aBeS0Ljh0znirnyCPPVkRfiOpER11FGJk1mT6bi6rm3RWU9uLKL1rtccFBvxbVPvO1wEwAqwsiTPPE2LHi5XTPT8zTnPUoWpHDb9yciCY+jErLXLMHRr9GQ5f/79Sbt14+IXxfJjcZ4CRXHamNuNROp+PHyochnX2X5FDIP+8HF//eEicCX+LnabS3w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=fD9cObO+; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=fD9cObO+;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xrqhm3NcBz2yF7
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Nov 2024 23:25:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731846309;
	bh=ZwnTGlAOhqOsDts/gSmhFHjUFoMKSdv4VzJ6Hwaq0no=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fD9cObO+kvzMnKLLcjXuemEJL1Jgv/Eek7eh4bLSECXhKgl4lMnVoJM2ix+7ipnLn
	 jlGKdluyz83UDCpkTn2xxOlu8CYKQnn0pYhAqeoLlhp7FGT/MpSI8KEPgPlsh0X3BY
	 Wq+OfImBZyB6i8TO41Vq0g7WGGv6WANqD3E48kjF+yQ2gd8Qlxdgls8dpRi60WgOpY
	 TB0d5n29yUPjiTN1kUvYNjoM6fpaCcuLod4noJpHUrSv9UeHb4QR22O3u0egG08LU8
	 VpjrWTDakzk9s9cozEH9QeA/q15BQf6gqpcvj0JxqaUV313++vQARpSfiENgcw7LRm
	 m0MR0VNmP+bwA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xrqhj2NKmz4xdT;
	Sun, 17 Nov 2024 23:25:09 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, David Wang <00107082@163.com>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20241108162327.9887-1-00107082@163.com>
References: <20241108162327.9887-1-00107082@163.com>
Subject: Re: [PATCH 11/13] powerpc/irq: use seq_put_decimal_ull_width() for decimal values
Message-Id: <173184539748.890800.13994461316487371816.b4-ty@ellerman.id.au>
Date: Sun, 17 Nov 2024 23:09:57 +1100
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sat, 09 Nov 2024 00:23:27 +0800, David Wang wrote:
> Performance improvement for reading /proc/interrupts on arch powerpc
> 
> 

Applied to powerpc/next.

[11/13] powerpc/irq: use seq_put_decimal_ull_width() for decimal values
        https://git.kernel.org/powerpc/c/5b881c1f83792f5db421124171b06f1b8f1fe075

cheers

