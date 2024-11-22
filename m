Return-Path: <linuxppc-dev+bounces-3501-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC289D5E7F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Nov 2024 12:58:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XvtsX3pfkz2xjv;
	Fri, 22 Nov 2024 22:58:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:1004:224b::bc"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732276704;
	cv=none; b=nLZuvKE0nFE/lMNnVDaYsNHsy+ORcL6Q9tGPwCekfkP8rsHwlUw/8Zw0GJCxyE5/Z3DzL8Of0zUCDHWmcfiTG1nkuJKi2NerGT6L9u5fLpFcuH6Q4+GWrK0/c+ZpbDaJIH7t7sxcWkPK+1YZC91sWryIwqEBqcu8cB8fWi+5VggbMu6CJ6iQBXZFQKbb3E+3Sl/JQF+viDQppT0yd/6TNxM36LXC1dnXWfihL4xcRtoIV4VHCOgxiAol906UAMSPOmzPVwbUx3PTOayyDWrYe1CwMiH5XXQ2P+Jgc/XP4A7lMuyPCG1eQGqMXUfKDvk85kFjoaoFwAsZQjntuVUCoA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732276704; c=relaxed/relaxed;
	bh=IUm5K1QpDLqrSIFnFvSWxFRNljNOtCpXkwifZSl6pK4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=AixZsnDVdlKdxDZ6vTrKOEVPFenkaphVaCYHPl6E5yN/58fivv/b7Bwvtn8d528ueVF7utarGhJIiki4k2633UkfbZOyFgOiOQ7kJRowctzzxLg1gFg4EOr3HiPVUEi324WgAhsarq7KBoEB5tgj96Z7UdGzkaV6Cpw83TV20B/jafypuMO7zZSFN05IvPv2i9N5bfbqLk7IicsC3CX+osIWhuiaDfqrBWG3tmLYbvZaC2EAuyv5wQH70kOgAMvi8l/eUBi8UCJ6aHM+IGnuATJgx5M1AEdW2IE5aouN2DWSBuSa7Z7mrI8RsEdlwcHDodtQkt3bPTcwljjBiUnVig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=pzeM6uSe; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:1004:224b::bc; helo=out-188.mta0.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=pzeM6uSe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:1004:224b::bc; helo=out-188.mta0.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org)
Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [IPv6:2001:41d0:1004:224b::bc])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XvtsS2yFvz2xjK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2024 22:58:19 +1100 (AEDT)
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1732276661;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IUm5K1QpDLqrSIFnFvSWxFRNljNOtCpXkwifZSl6pK4=;
	b=pzeM6uSeH2Y5cOTdDA1cSo4d3+jVXmy43WTztqwzhyNhn383H14aJG1eu1zAUXG9pXJ60C
	HJ+/v4lPAtkVwPX2wOeRH6DSstoUW7VaDpNBWpP2FAZryyDVn6UfDoi2feRDxCWk3jQXj+
	4IVx7Z4o5JLz3uRBxdxjhzyQWEqfDF0=
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
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.1\))
Subject: Re: [PATCH] powerpc: Transliterate author name and remove FIXME
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <87v7wuy3p5.fsf@mpe.ellerman.id.au>
Date: Fri, 22 Nov 2024 12:57:26 +0100
Cc: Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <55B1EE24-BEC9-4A8D-84B0-ED32FCC070A5@linux.dev>
References: <20241110162139.5179-2-thorsten.blum@linux.dev>
 <87v7wuy3p5.fsf@mpe.ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 11. Nov 2024, at 02:11, Michael Ellerman wrote:
> Thorsten Blum <thorsten.blum@linux.dev> writes:
>> The name is Mimi Phuong-Thao Vo.
>=20
> Is that the correct spelling?
>=20
> The github commit below suggests it's Mimi Ph=C3=BB=C3=B4ng-Th=C3=A5o =
V=C3=B5.
>=20
> And presumably the author preferred that spelling, otherwise they =
would
> have just written it in ASCII in the first place.
>=20
> =
https://github.com/bminor/binutils-gdb/commit/6603bf38d74409906b3814f6a26c=
0483a5d32e41

Hi Michael,

Are you suggesting to keep "Mimi Ph\373\364ng-Th\345o V\365" and a FIXME
instead of changing it to "Mimi Phuong-Thao Vo" which is how she spells
her name on her LinkedIn profile and other websites?

I doubt anyone prefers their name to be spelled with octal escape
characters.

Thanks,
Thorsten=

