Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA33C586320
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Aug 2022 05:39:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lx3l54pYQz3bgR
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Aug 2022 13:39:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=nmtXVlTJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lx3kR5sPWz2xHQ
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Aug 2022 13:38:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=nmtXVlTJ;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Lx3kN1zBNz4x1S;
	Mon,  1 Aug 2022 13:38:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1659325116;
	bh=a6rojnADEQz4YaXLUNDgDgnJraQcyq4lfTUzba9isA8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=nmtXVlTJeDidpXmsU/j+3ucJNxrzRKUeJQRe8pZVaJ0HQ51/vNAoFjPqblu3ThgPG
	 AZZH3vioqUl9prqZkTQMvrMJpvaC6FjO850uPILuAG7Hq386q2ZN3Ol9d5W/53Rt7j
	 5cy5hu0yse14NuKB4xfznYYIaysk0yciTDZbVzEzuMnYCEb/6uiWeZwIgoTs/gvl5Y
	 q4H9/tCS6DCD56ehJEw48UyxI/F8gIFrOfhDmEXWD7ep8zbGvW4anDaNdlsQ42+Bz4
	 6zphYwPGc9Zj9ZVPYM1nW8N/lnohYmLV3HzUJNuDzxfMNLhglzlWrQKw6sghhpvw19
	 JzyM3TvEJXtXA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Rob Herring <robh+dt@kernel.org>, Michael Ellerman
 <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/85xx: P2020: Add law_trgt_if property to PCIe
 DT nodes
In-Reply-To: <CAL_JsqJZ6s4qU+Yt4CCj3q-Fk_MKEddx5aLKu15NLnTbgMyRGA@mail.gmail.com>
References: <20220504180822.29782-1-pali@kernel.org>
 <165909977761.253830.2305727219055135050.b4-ty@ellerman.id.au>
 <CAL_JsqJZ6s4qU+Yt4CCj3q-Fk_MKEddx5aLKu15NLnTbgMyRGA@mail.gmail.com>
Date: Mon, 01 Aug 2022 13:38:32 +1000
Message-ID: <87k07sbpl3.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Pali =?utf-8?Q?Roh=C3=A1r?= <pali@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rob Herring <robh+dt@kernel.org> writes:
> On Fri, Jul 29, 2022 at 7:17 AM Michael Ellerman
> <patch-notifications@ellerman.id.au> wrote:
>>
>> On Wed, 4 May 2022 20:08:22 +0200, Pali Roh=C3=A1r wrote:
>> > DT law_trgt_if property defines Local Access Window Target Interface.
>> >
>> > Local Access Window Target Interface is used for identifying individual
>> > peripheral and mapping its memory to CPU. Interface id is defined by
>> > hardware itself.
>> >
>> > U-Boot uses law_trgt_if DT property in PCIe nodes for configuring memo=
ry
>> > mapping of individual PCIe controllers.
>> >
>> > [...]
>>
>> Applied to powerpc/next.
>>
>> [1/1] powerpc/85xx: P2020: Add law_trgt_if property to PCIe DT nodes
>>       https://git.kernel.org/powerpc/c/1f00b5ab992c122c51bc37662b3b4df59=
63462f3
>
> Why? Minimally, it needs a vendor prefix and s/_/-/ as I commented.

OK. I misread your "maybe that's fine" as approval.

Pali can you send a fixup patch please?

cheers
