Return-Path: <linuxppc-dev+bounces-3438-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FE39D2CE4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2024 18:46:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XtBl02g52z2xy0;
	Wed, 20 Nov 2024 04:46:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732038412;
	cv=none; b=FCRTixNMk5BoDX+1oSfXq/whjZf+JD2jkbFoSgYfkWfu8hY3murDaj0Chf3cwGXlWYU3JrEd/hS3OI4KbOuVnKLLDPhgKOCbhZOJ36Ht9DspaS/jYHx9FnRwKy/8HijvhuF0nzpWy31irxCfpcbu0Vzl7Y1P5v5LRNmGhVbgxsYQOIhWIkUF2ZB5eAo48ZD4v31lIbAR5ReHGSBVPKD73++L0IoWxoh4jmoFwfjAWXS41oYGPcO+J9d/7pcTM9IYvTbAzjz4d4/Z6iRun3JaYcOIp8/l8j7TiZLlmXSlu2FtKiUjT6rdLEcT5Rlnca0HyNgwFhdKrrVzVREad2G5NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732038412; c=relaxed/relaxed;
	bh=AwPBMZwWY6jHnSKaBzPlAhC7dfxBZhFkz57ZZP2TaXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AjmG8X2g0BhaA9ZVNtBtTLwmdGTUKWYpvlpXrNUNyqMb4qJuXSnz106GBut4aKRTdadK88/cbUzaFXnRoAKuEvwsnBU8gNqrzM233ZE6+ZHNiHs4o6HL3I9qQ+GUgkK+YmQVaknmFRP8PNUEGcP1+GbOmmG/CNlOFwFBSp2JBzFU1muJechq6H4v5V4TjGMwDqXdnUK9p28peQE4vlQPCvzi5r11mdv57wtWObdeZE45+sJ2sCNl7zWBMiik+LQ+lNLENnTXrmLOWLUe4OADFLrVH1Vc+Lkz+9KIlefcCsGZ0u1bgflqLeTKJeF6eQ/rxjRjsQL2vj5eJsCJF/iH8A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=V2UCjFOf; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=V2UCjFOf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XtBkz2h7Hz2xxt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2024 04:46:51 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4256C5C4B4D;
	Tue, 19 Nov 2024 17:46:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF441C4CECF;
	Tue, 19 Nov 2024 17:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732038407;
	bh=cGtCgxtTHF3Jbl8CduYT2IKTHC6lkZmDimREyxkO6Bc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V2UCjFOf9RDujcsGXFkSgILPdDp2C8acwBMEtyau482WWnyiXTsgmeQk5nVGwjo1i
	 610w9HbKzBJMpKfxwrf/myk3hq5iWjkdG2poBltU2rXucE7Xkk3rR59lH3G60wwYVt
	 DoeV5kC3wKpi1dEUEWjZcuPKznWSEVjOlOyuVVQ43WKHAEaB8Qn4idItnNDyvR38YN
	 XUlL2+henqEhFtNCJSmOZuhsMzCztdQLbZyaHXZFYBVc2I3L2Y/19wCfOFzdzAxiKD
	 4kr/eGdcGRTVfAdDdOFDy7Fk89GN7FgH35PyStCaqETmgVhl0qGiTnX5ZP8h4g1uTi
	 x2rH1JZld25Qw==
Date: Tue, 19 Nov 2024 17:46:45 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
	Zhihang Shao <zhihang.shao.iscas@gmail.com>
Subject: Re: [PATCH 00/11] Wire up CRC-T10DIF library functions to
 arch-optimized code
Message-ID: <20241119174645.GA3833976@google.com>
References: <20241117002244.105200-1-ebiggers@kernel.org>
 <CAMj1kXFA15AuT5wd0vMJ3X94uysvnGLy42FAQt8fxJsW31UdAg@mail.gmail.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXFA15AuT5wd0vMJ3X94uysvnGLy42FAQt8fxJsW31UdAg@mail.gmail.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Nov 19, 2024 at 09:59:53AM +0100, Ard Biesheuvel wrote:
> > Eric Biggers (11):
> >   lib/crc-t10dif: stop wrapping the crypto API
> >   lib/crc-t10dif: add support for arch overrides
> >   crypto: crct10dif - expose arch-optimized lib function
> >   x86/crc-t10dif: expose CRC-T10DIF function through lib
> >   arm/crc-t10dif: expose CRC-T10DIF function through lib
> >   arm64/crc-t10dif: expose CRC-T10DIF function through lib
> >   powerpc/crc-t10dif: expose CRC-T10DIF function through lib
> >   lib/crc_kunit.c: add KUnit test suite for CRC library functions
> >   lib/crc32test: delete obsolete crc32test.c
> >   powerpc/crc: delete obsolete crc-vpmsum_test.c
> >   MAINTAINERS: add entry for CRC library
> >
> 
> Nice work. The shash API glue was particularly nasty, so good riddance.
> 
> For the series,
> 
> Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
> 
> Happy to take a R: or M: as well, if you need the help.

Thanks Ard.  I will add an R: entry for you in MAINTAINERS.

- Eric

