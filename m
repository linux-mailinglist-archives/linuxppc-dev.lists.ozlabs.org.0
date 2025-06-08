Return-Path: <linuxppc-dev+bounces-9207-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C947CAD15FF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jun 2025 01:48:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bFsFk4mj6z2ym2;
	Mon,  9 Jun 2025 09:48:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749426522;
	cv=none; b=QnPPxm0GQdpF9xT+E3HtQxUuHsrw5owcA3/J4x5AJ3ZXeDC1NqlLhMtFuIgIR8ZGqN/ebkzmcwGZEE2apnhAbuHdR9Sr+CXerU9Uwfnvv06RESBtE2v85R80usmy5ga3Fm0XvlsCt8ZWn0Ktu8Vdn8g72Pl7C7v5ydj5M0742kbaKzwYdTqCVq1y2GTy6jKYdknz9lQMzrkoPvWs2v2uxW0UtraILxdv0I8JIjhoiACLI2rR9V2hgs5zqqeCZ1xnb+dVyoajQUQ2f/pT/gQ+FQh0oRXowg0qfcuFTilumTrPGoxo4GG+5VIDC1mAl+JneottUiFwO8oinZ/aKYfrHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749426522; c=relaxed/relaxed;
	bh=bfw4JisrcSI7hhJmSGYdFsymCwhoyEU8r4VHLmRjND4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jsHaqxLmGhBGiuduBLjPZrJyo2/2wXW+hXurKRcGYYz3p3EbKv2BZl6yDpZRogv7d0Xkk9RO7H9i3ZIT6sPQ1IhRBWU3tnwAPX4u75eWCsytvm5fwpyEfItDlHfprxA199vSGYik+g5CTDxGKfnckfTMucaHexllcTT6wXNWoekf+jvLnplYj51x3TVgM9uzjIXNaSYzN63JLTcv86WGHnFPtrDlz+xKU6JbnDneer9oVcsGMnLeOUOG2jEv7ehPpizA73lvJZiYBHOq1493JFZc+ioZiZjwZ531nJTFyKt8fVjy0CuGQ98USrhgKCF1AFxNSlRsqGwe5hGq2em7vw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JOEtAeuZ; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JOEtAeuZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bFsFk0sjFz2yft
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Jun 2025 09:48:42 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 183605C5486;
	Sun,  8 Jun 2025 23:46:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ECB5C4CEEE;
	Sun,  8 Jun 2025 23:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749426519;
	bh=PNJP4F4SM5CKWVi44F6XN3CvXe0mnkBMQtyo2ioWp6k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JOEtAeuZjpWvk9z46QbzwFTvSH+ljw/hQKIzEhZJx7YF2EwgrcI3+lI1VVKscms0d
	 m3qcoPnMMDVh4lKObwmfsWuGFAfWfD9VrvL51JeF8gEdf9j5e89zlEOEgaCwxiok5N
	 /aXy/hTwK0fEa7Z/G4j2/UPMcbFCWgXgxCUhbLoCrXwDNwOBWfrQbnnk/HZXwh/U2/
	 WnpIAIMFGu/oqqi+ROzvz89sXkm5O6vGwJ/PQ3JdxSPps11zhBrcyuDg/46eion+ad
	 2/v4rAxctCfEtqWu0G117hIgv+MXBMm76WuvxTusmww2Scut4P917GLHnfL8cwD0i5
	 36P1VSkTzVNzw==
Date: Sun, 8 Jun 2025 16:48:17 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org,
	linux-arch@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v2 00/12] lib/crc: improve how arch-optimized code is
 integrated
Message-ID: <20250608234817.GG1259@sol>
References: <20250607200454.73587-1-ebiggers@kernel.org>
 <aETPdvg8qXv18MDu@zx2c4.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aETPdvg8qXv18MDu@zx2c4.com>
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, Jun 07, 2025 at 05:47:02PM -0600, Jason A. Donenfeld wrote:
> On Sat, Jun 07, 2025 at 01:04:42PM -0700, Eric Biggers wrote:
> > Having arch-specific code outside arch/ was somewhat controversial when
> > Zinc proposed it back in 2018.  But I don't think the concerns are
> > warranted.  It's better from a technical perspective, as it enables the
> > improvements mentioned above.  This model is already successfully used
> > in other places in the kernel such as lib/raid6/.  The community of each
> > architecture still remains free to work on the code, even if it's not in
> > arch/.  At the time there was also a desire to put the library code in
> > the same files as the old-school crypto API, but that was a mistake; now
> > that the library is separate, that's no longer a constraint either.
> 
> I can't express how happy I am to see this revived. It's clearly the
> right way forward and makes it a lot simpler for us to dispatch to
> various arch implementations and also is organizationally simpler.
> 
> Jason

Thanks!  Can I turn that into an Acked-by?

- Eric

