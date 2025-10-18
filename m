Return-Path: <linuxppc-dev+bounces-13045-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2AEBEDB19
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Oct 2025 21:58:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cpsvP5GsBz2yN2;
	Sun, 19 Oct 2025 06:58:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=109.224.244.21
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760781540;
	cv=none; b=lbl0rFujn0dkDO+6RHn+qathlrmEk2yOry4I8LrUANW1UfSg4ndbG2dw4Er2HYNxshSchgYLhtF2pJtY3rVaPI0G6WRvJe41vOHw3ZCTJOPYcyAZtbI6s4BEQG3sokGIAwtYI0FplvD55Ge51ftIwCbavaYeDdiX0g43oqw+DfNptax25gLEKu8Gk3zzrZXbb8+Ol/twIP+zu0vcrmhL7hfrs5DzHZdxtK/BsdqrATjEqhlVt7vcE8CmAyZHi6I7rUs2KTnqHZsv+67IPwvz2afA8f0oBir3OQxLzgv53nupgdHhXSqU8PvygSjgvycRUZ9U8ck8Kt9zRai3TeQy9g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760781540; c=relaxed/relaxed;
	bh=8ItXQ6hSbJR9LXlrturJXAd/R+Fj4mAf6Rmo/QY12WQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FcxSNPNqI66DeOzqjXcaFWJs2sdT39EAay6Fd05AyI+F0kGCnSe79W1jcjXO9iBY68Vfl1bKJmvq5VzT5a/NjPFV1xLjfkWNh7EBkbzBBOtDWW1O8dslaPprlpUIcz9EjQHL6GdglwsWuJa44yXwR790S48sTIFj7CmkDxN4yxIbUybKLRqKNNHBCpTITcFLwlqsQAgHAANVxoAh/eLA9CCr5ldOkuYenWAPA9Go8h0Imk0hN41Q677nW3eVQjj0wKb4QLn7tjvXU2nhCRyWOKNrlUGAUz6XJMvbz0+kp0uebYSkT3hBnvAeCgABX7Yhs0BcDN++mbaD6vmyHUnXeQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=fetzner.me; dkim=pass (2048-bit key; unprotected) header.d=fetzner.me header.i=@fetzner.me header.a=rsa-sha256 header.s=protonmail header.b=LxZMW84W; dkim-atps=neutral; spf=pass (client-ip=109.224.244.21; helo=mail-24421.protonmail.ch; envelope-from=alex@fetzner.me; receiver=lists.ozlabs.org) smtp.mailfrom=fetzner.me
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=fetzner.me
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fetzner.me header.i=@fetzner.me header.a=rsa-sha256 header.s=protonmail header.b=LxZMW84W;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fetzner.me (client-ip=109.224.244.21; helo=mail-24421.protonmail.ch; envelope-from=alex@fetzner.me; receiver=lists.ozlabs.org)
Received: from mail-24421.protonmail.ch (mail-24421.protonmail.ch [109.224.244.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cpcbP2Y17z3chv
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Oct 2025 20:58:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fetzner.me;
	s=protonmail; t=1760781531; x=1761040731;
	bh=8ItXQ6hSbJR9LXlrturJXAd/R+Fj4mAf6Rmo/QY12WQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=LxZMW84Woz7PSD1lZDRV/Xr5LxHuJ/5m96O+BNOnjdeUBHG00b01h737vm5pQQsIX
	 KhIg3MEa5z10vThuB13OQjpaBBjVhtanjJcVXDnNhGuw98fONAkZ5ivrcmRpkks220
	 Ei1OvKMpnvG0roJm3/xm3w+Xl0GPlUtBYGGulUQhnZ6vIje6KpDrPCAp0bf/F8o5IP
	 U6WXwemz+1ibovlCjhKVY+Xo8QB1z6HJi41gDVq7AR2V9FZcXFzNBPaP5+Sz669ApD
	 Vd9GMZpp0sm59Wzz2UsuTmmLuEOcR2xUUaEBFnAO2/oKS3hHz3v5ftiXyxtcRVlszw
	 sctUYM6a5hsUg==
Date: Sat, 18 Oct 2025 09:58:47 +0000
To: Christophe Leroy <christophe.leroy@csgroup.eu>
From: Alex Fetzner <alex@fetzner.me>
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PPC] t1024rdb: CONFIG_KERNEL_START=0x0 equivalent for ppc64 (Kernel 3.16.85)
Message-ID: <w5aadJLM8hh94gtoKiG7CgWmDIdGAQ0dZBV82rbZo0vpQqF4yGmUSwhdpRBzuPlcJ4UHyT5jtmCCcy5gYom-Ed1IpG38SkkENAiHe3pK5R8=@fetzner.me>
In-Reply-To: <b41c65b7-db67-48e6-a7ac-609bbc653494@csgroup.eu>
References: <yEcgGewmm_K00goV2VDaiSwPgzZCWcRkHeVowwzmBOkeZHAFjGt6BSjU7ZwRTfKd1cFF6GKshrfTDzQ4LZj65Wkc2S4aPBKKIW6FxvAZ46U=@fetzner.me> <b41c65b7-db67-48e6-a7ac-609bbc653494@csgroup.eu>
Feedback-ID: 141959855:user:proton
X-Pm-Message-ID: 9e41869cb075f1b289eb268311bd3e3762499457
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
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


Thanks Christophe

> > How do I appropriately alter a ppc64 kernel to have entry point 0x0?
After working with the issue further, I determined my original question was=
=20
ill-formed because I had an incomplete understanding.=20

> Even with the CONFIG_KERNEL_START you can't expect any kernel to have a
> virtual start address of 0, because the KERNEL needs to be above user spa=
ce.
>
> But you shouldn't need that. It is the role of the loader to set the MMU
> so that the kernel is running with the correct virtual address.
>=20
> I don't understand why you need the virtual starting address of vmlinux
> to be 0x0.
Indeed, it doesn't make sense for kernel start address 0x0.
As I am trying to make a stand-in for another kernel image without changing
the U-Boot load address, I saw that the original vmlinux ELF header had
Entry point address: 0x0=20
But critically, as I now understand, it also had=20
Type: DYN , not EXEC

What I determined is that I needed CONFIG_RELOCATABLE=3Dy; I did not need t=
o
alter the load address. After making a relocatable kernel, I was able to ge=
t=20
it to boot on my hardware.

>=20
> Here is what I get with ppc64e_defconfig with v6.18-rc1:
>
Thank you for taking the time to find this for me.

Kind regards,
Alex

