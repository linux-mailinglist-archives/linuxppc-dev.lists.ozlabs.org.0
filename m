Return-Path: <linuxppc-dev+bounces-3396-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDA19D094E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Nov 2024 07:07:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XsHGd1Zyxz2yNn;
	Mon, 18 Nov 2024 17:07:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731910057;
	cv=none; b=godyhppqiy3ll7jEdvbvh6W1r39oTRYSk5JiaUfNJCkX6d9B28/OU7ciTG+9lqnkvsjEvzfv1KLFjsuyVM1+bSDX8uAnFLUsMeZ8hepE/I1YCycW5END349c1eaedSWLtX/y4rzWhTf8EUdrjSFGYH5RlmPmbur2dd/KfLoMNEqnq0QJGVeCFb+wo41WD/TnWMkRkpi271sBWG50iLPjcCdWKrYxyM/xSduubqLc77D0VlGFUMguWVtiFsW7Oj868K1LjIaIzBnevs/wyG2QutpOlpoyeTs5kugjuuTELw/NcyCT6QLTb4kubg20tw9vWgJOFUuMiM1qd9omVFIpMw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731910057; c=relaxed/relaxed;
	bh=z1Fd1ilnNJkiEtM/RBMHqbcg3yHAJWJe9OlZBZwXLTc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bWKGvefadxJCzdegXUVv1Q/YNi9Ti+dPu0TeykcsyqGX5Zxokd0o6nRu9mEW9SP/qCBhy8mJZriaYM5CxRFEv+wg3oX5XC6Hf4NHCYk/5YpfaQAuas1xaAn78KqNyZrBUm7YmJLZkQjPzsQHoflGEBp6ZtVmSwQOF04OXit74XKi0wsHF6kJgie9+QYn/7v+cFyHTuZFrPNgDfxcVJ5MEP5Us7JdmQI5WcO0i1LI9QOShubsoCj6G9fZVkrcNwrvns8jR2mNWU9O1hv4BvQsPGnmJEABNwLyIQqL2k5Ms11GEZM+SRviBa4QkivBi9JlKfJ4IYOnRm0gooqVvjKxFQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ZWi1owTl; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ZWi1owTl;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XsHGZ5BYGz2yN8
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2024 17:07:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731910050;
	bh=z1Fd1ilnNJkiEtM/RBMHqbcg3yHAJWJe9OlZBZwXLTc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ZWi1owTlUv0ZNIvznpWtr5Ob6iYk6V0LVG9+NGlIYK3FVVBIABGwTzt9YfK1F/Kc3
	 Djp1iWyISNYz12k/GDC9GYJSfkz7R2GzIbiZ2ZQKM6i/IqwLCgkpa9TUPSH4q0cUOr
	 yB2s11BlBsPEutsk9IijPDY4ABxAxj5yvgs01ngQAd7u9oO6FCgbwYNpAX7BzDQfm3
	 PtfG9pl9FESFL5/R8x46nKLGvbD+uQIyaQLFwB3UwsTZ0G++6nz3mIAeTsEhaPEZ/J
	 LUw3OTcC6uQhRSMC0HsEG4VgxpU2eQuzyARWyXztR4f4C1t78evLnxkrw2LZQEAm03
	 +nijMR346U2hw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XsHGV4tmQz4xD3;
	Mon, 18 Nov 2024 17:07:30 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Gerhard Pircher <gerhard_pircher@gmx.net>, linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, geert@linux-m68k.org, arnd@arndb.de
Subject: Re: [RFC PATCH 01/10] powerpc/chrp: Remove CHRP support
In-Reply-To: <7e8a2788-f0ab-4d98-b26c-114e04558fb3@gmx.net>
References: <20241114131114.602234-1-mpe@ellerman.id.au>
 <7e8a2788-f0ab-4d98-b26c-114e04558fb3@gmx.net>
Date: Mon, 18 Nov 2024 17:07:31 +1100
Message-ID: <87bjydoz18.fsf@mpe.ellerman.id.au>
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
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Gerhard Pircher <gerhard_pircher@gmx.net> writes:
> Am 14.11.24 um 14:11 schrieb Michael Ellerman:
>> CHRP (Common Hardware Reference Platform) was a standard developed by
>> IBM & Apple for PowerPC-based systems.
>>
>> The standard was used in the development of some machines but never
>> gained wide spread adoption.
>>
>> The Linux CHRP code only supports a handful of machines, all 32-bit, eg.
>> IBM B50, bplan/Genesi Pegasos/Pegasos2, Total Impact briQ, and possibly
>> some from Motorola? No Apple machines should be affected.
>>
>> All of those mentioned above are over or nearing 20 years old, and seem
>> to have no active users.

> Pegasos2 users still exist, but admittedly they mainly use MorphOS and
> AmigaOS4 on these machines.

Ack. To be clear my comment was only referring to Linux users.

The Linux CHRP support is still present in v6.12, which will be an LTS
for the next 2 years at least, so if there's folks who occasionally boot
Linux they will still be able to do that for a while.

cheers

