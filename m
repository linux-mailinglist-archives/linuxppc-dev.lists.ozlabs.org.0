Return-Path: <linuxppc-dev+bounces-2777-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BE79BA5D3
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Nov 2024 14:57:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XhGPs2RMlz2xwH;
	Mon,  4 Nov 2024 00:57:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730642257;
	cv=none; b=QwwAgWwkdp8IvegvsQjDZBtEyJAwFhE5apuHrBKCbz5LdKQdK+YFQwUP/3HMJ+JhvEgs69FGN74AFbY+9RzrAT+BvXnUkos1dnpVfwH5P7WxcLyT2A+ZOYILj2MrtZQBmxYmbox3h3JotZtlrlYFVhPEyRmyPtXZqbFna9gFwYZZBSnKbWFOtpnA5gpQ01qwLmVxXufFU6NXmcpyF1WxRYTEHYOJD6RPS62GV5oJSF2FHJvuGh6U9KnI3nu2wOy6YBDAoBNae014J9TUH8G0qc7JYCKuPHnD0e1W84SqTdbF1WJp3CqLAxdcXShYAD7KHrCaNhCnbiFxBKbLoZyDmg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730642257; c=relaxed/relaxed;
	bh=LnBUFuHQ8wxisDfmkv/SVcgdxffw2NF75fIbS6RYg6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dg10TZGwBKINeFB5szpciqbUN9rhPL1ciVskx1EgUnaD0WVkzorVwsVFaw86RAIouyXxQUDoGixDCKgCCnUmZ/P7LMZrrkcB9i75LUni9IsAK55xxSJaKzStozjx3LkJrVaj9YDrApRhYHX3eTmmakDthGyq236BFA2S2pKi82MoBc7OAURrNDvGEH50WwFUY9IqoAETZgjMVkf17KFa9haVYthjFSwiQ6TRQLrZAQg/RJBONECGPpEH8/LU2/D8zFHL7BZ28RuDxtma78QUHKeFlJWklXFyQwtxc/uSbQWDKMytx8mA/yXCtHA13/MEV6zcAUavM91Gb8Q1Q0LTMQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EgyAPyUV; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EgyAPyUV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XhGPr2Jv9z2xtN
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Nov 2024 00:57:36 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 337C15C4336;
	Sun,  3 Nov 2024 13:56:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 014DBC4CECD;
	Sun,  3 Nov 2024 13:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730642252;
	bh=VxXH6aqpqHLHF5oRJ5vnT5vpm2uvtxBA9AHVL/CAjN8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EgyAPyUVzD+RX89LUiOchP3Aw0Js3GqP/DtnP8pAtBfaDedVT967mnJ82pBpE9KRN
	 ftK066xUf9/ky+dJfz8zo3ZrlOBBIwzAtGdFfjJW9BVBxme/2A7kncMayzUKYZ5xhE
	 Vmbx+QZrBR8d8lG3rs/hr5GcPBgei7uWbzXvPZxURjQuM+X2Jr3q9fjSTk/A+86b8b
	 PyY1dLiWpn2qN/lGx/OjiSXOJsgO36lUUbVoSgk7DuHWX2RDImBvvO7ui25Wr0tZYV
	 0Xe+h5Xj9lpyGr/BCNqgwMBTm5cG9eqiST44/fbsaiqt3sqcAsOAptCwqbnUAM9n9Z
	 n3EbHG0jaagjw==
Date: Sun, 3 Nov 2024 05:57:30 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: WangYuli <wangyuli@uniontech.com>
Cc: ardb@kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev, kernel@xen0n.name, chenhuacai@kernel.org,
	xry111@xry111.site, sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v2 06/18] loongarch/crc32: expose CRC32 functions through
 lib
Message-ID: <20241103135730.GA813@quark.localdomain>
References: <20241025191454.72616-7-ebiggers@kernel.org>
 <DA8BCDFFEACDA1C6+20241103133655.217375-1-wangyuli@uniontech.com>
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
In-Reply-To: <DA8BCDFFEACDA1C6+20241103133655.217375-1-wangyuli@uniontech.com>
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, Nov 03, 2024 at 09:36:55PM +0800, WangYuli wrote:
> Even though the narrower CRC instructions doesn't require GRLEN=64, they still *aren't* part of LA32 (LoongArch reference manual v1.10, Volume 1, Table 2-1).
> Link: https://lore.kernel.org/all/0a7d0a9e-c56e-4ee2-a83b-00164a450abe@xen0n.name/
> 
> Therefore, we could not directly add ARCH_HAS_CRC32 to config LOONGARCH.
> 

There's still a runtime CPU feature check of cpu_has(CPU_FEATURE_CRC32).
See arch/loongarch/lib/crc32-loongarch.c.  So it's the same as before.
ARCH_HAS_CRC32 just means that the file will be compiled.

If you're trying to say that you think this file should be built only when
CONFIG_64BIT=y, then that would be an existing bug since the existing file
arch/loongarch/crypto/crc32-loongarch.c was built for both 32-bit and 64-bit.
But if you think this is a bug, I can fix this too.

- Eric

