Return-Path: <linuxppc-dev+bounces-3240-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 230AD9CCD1B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2024 01:30:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XqHxG027Qz2yyC;
	Fri, 15 Nov 2024 11:30:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731630641;
	cv=none; b=CN+ACL7VIVasgJ5k/kYOTs6AB9DBd0dtEaec4LmdyEdngneN96nCkyKXQBCmdLRIzbdTn/33Vm9yTTxM5PqENIiVJ54LFxwlk6UNmiw0sTeyzd99/P9TupX86Aj0vBxo/HzOi6E8yenQmEt/Qc5dS7StZrtdGEF79UEgA+FjYIqIW0V8DhDjAmu4RhhzOWrAdUe3lxEm7fZChR7e3d5UXAZKWwE4dQw9F3eVTAzFuiN7Erxbf7Ge725dT3GejvfUmjC9L7odKddi+MC5g/X3wBLsMCVu628NIEQ6BM5lRaaV8rCGPo8Tzcbw8VGxONXfIzAZIexX525HKYY6m1+qJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731630641; c=relaxed/relaxed;
	bh=a4zPVfXx+Crpt0YpvibCUWUMvHkAdXnWt+x1HwkP4ME=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IIGxl5QffZEDL5vvupCz/UVKDLaYG4zhlAL0YilMEXJ8Qe0rj2J1PfPKRU9S/e+HAg+7u3b9pm0mqiiTeAX2b+5zzRCJ51NdBVtYzPtVjEa3cQ7ghpaPBPvDaZQ8VlHq3lkh1l2juCCckZX78noLfmy0gzoHwIo1N2VYJmBvwRkA9SVoBDemQ0MYRsV+6iHM9RWP/2zQHd9CfJU9axynQEsv8q8jRdItG8pgeQX1tkjiai53DyfS64fCcS9SBJL2gikmjgm+aW62QKvizyZ8Oq6kqV0sWqUhQCcdfnejr6vFHB2yUfcQLam8aThaq7bGGZqb/FiJsJFf+wMNFx2dIg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org; dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=iYeSDixr; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=iYeSDixr;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XqHxD30Nzz2yF6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2024 11:30:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1731630637;
	bh=a4zPVfXx+Crpt0YpvibCUWUMvHkAdXnWt+x1HwkP4ME=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=iYeSDixrpiK43bsxiTaUgCxI3BJPzHZamA6dbA4BFFESDPztJoZbK7h13Jj6wHoRZ
	 fv/LG9fZTuQHkcZg+963TZY0uknXy3U6cVvE2YCYfmTJzrlmmBoLSZW8irZVq+3KVr
	 CIL9YHr9Y41Rlfg8uD/VGudgbamwb6Uu5ON1QzXFDMnrI77OM4nsyKlViIwtbvmP2c
	 sySWTHdU8eWayLK5/T2wbuNVfylZm4wqVhJ5B5lnaXYjr/B3wyVictTbdKJgNre/4u
	 ICklwF7KmZB2uB9ApA3jW+pTzuXrA9zeFCXSd9yEUFVVduy+0ivdSYcQaVwWHzl6WP
	 PfbIlcS4GWglQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XqHx8588zz4xPy;
	Fri, 15 Nov 2024 11:30:36 +1100 (AEDT)
Message-ID: <fa60468bfebb7392bac54454fe196f306f6db97f.camel@ozlabs.org>
Subject: Re: [RFC PATCH 01/20] powerpc/cell: Remove support for IBM Cell
 Blades
From: Jeremy Kerr <jk@ozlabs.org>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, arnd@arndb.de, geoff@infradead.org
Date: Fri, 15 Nov 2024 08:30:37 +0800
In-Reply-To: <20241114125111.599093-1-mpe@ellerman.id.au>
References: <20241114125111.599093-1-mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
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
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Michael,

> IBM Cell Blades used the Cell processor and the "blade" server form
> factor. They were sold as models QS20, QS21 & QS22 from roughly 2006 to
> 2012 [1]. They were used in a few supercomputers (eg. Roadrunner) that
> have since been dismantled, and were not that widely used otherwise.
>=20
> Until recently I still had a working QS22, which meant I was able to
> keep the platform support working, but unfortunately that machine has
> now died.

Oh no!

> Remove the top-level config symbol PPC_IBM_CELL_BLADE, and then
> the dependent symbols PPC_CELL_NATIVE, PPC_CELL_COMMON, CBE_RAS,
> PPC_IBM_CELL_RESETBUTTON, PPC_IBM_CELL_POWERBUTTON, CBE_THERM, and
> AXON_MSI. Then remove the associated C files and headers, and trim
> unused header content (some is shared with PS3).

Nice work, thanks for pulling this apart. For the series:

Acked-by: Jeremy Kerr <jk@ozlabs.org>

Cheers,


Jeremy

