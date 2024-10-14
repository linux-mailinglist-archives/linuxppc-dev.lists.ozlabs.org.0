Return-Path: <linuxppc-dev+bounces-2196-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A8499C38D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2024 10:38:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XRrGy6w2dz2yhD;
	Mon, 14 Oct 2024 19:38:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a02:1800:110:4::f00:10"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728895114;
	cv=none; b=GWk7dWuH/lOJ+5AJYghzKvoLZlxfGQeWwfIpfFEtGJmY58uWXjfYsJw+kqF1/+wJUfwUR4CQY2wj/6uwTCSDzMl/XdzpkXL3AiQmkY9owXRy/LScHEjfdPet0PcjfNEYPmpJF7uU0jqa2BuTMgU6+/jU+X7grkY/TJHAroEw+JpPx3nCHELgxeMMCdKNfWSPQZ05bQPXASh82p/yiUNdWevXY4XNf9oi08LAciBbnQqvEHt1w4Yy/bDSJQ6dJt3cTrTBVUPfz2Zxnm1alcCQLtzhgcgSXzTiJcT9IPK5NQFd/OhVhECoGg+BZH/wnkphA58a5tQDz5+1sBi8SjOtaA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728895114; c=relaxed/relaxed;
	bh=iGPo1CwN60Uz9+ZeGk1YZwHrtGbRM7M6EcJNKAjfR0Y=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=eISWZtrwTQ68RFZEvyi4ybTtqUR7+1zgNw7hEhCPAWUXGLskOjY6SGBYqZtb7V53tv+9WwIAOsqttzLpi0zltyZUHoIRg7uSLqF5JbqHjd2IGScr0dgaFUZv8gt75DVgCvkiwHDg9YoSE6D22aoqjj579B2v+6mzE9vw7wyhajcM47gM65VoOAHIPa8IketVJDjlBvHJOfx0IK6q+CVlgL8UBo4gakONQf+M2IJHzIIyH63OqgTvA8Bd7nX6iukl9j8mps4lkJcUI9etYstwcnvdm5HLFW6cQEdVzgTptT/Pji9zr4wpuuY5yXKtbOJKuOONhCNvOC3MJEFoi/r6sg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=2a02:1800:110:4::f00:10; helo=riemann.telenet-ops.be; envelope-from=geert@linux-m68k.org; receiver=lists.ozlabs.org) smtp.helo=riemann.telenet-ops.be
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=riemann.telenet-ops.be (client-ip=2a02:1800:110:4::f00:10; helo=riemann.telenet-ops.be; envelope-from=geert@linux-m68k.org; receiver=lists.ozlabs.org)
Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [IPv6:2a02:1800:110:4::f00:10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XRrGx2s2wz2yFD
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 19:38:30 +1100 (AEDT)
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
	by riemann.telenet-ops.be (Postfix) with ESMTPS id 4XRrGk3x16z4wyKX
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 10:38:22 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:3f20:7967:2d40:9ad2])
	by albert.telenet-ops.be with cmsmtp
	id Q8eL2D00W54R7sz068eL3A; Mon, 14 Oct 2024 10:38:20 +0200
Received: from geert (helo=localhost)
	by ramsan.of.borg with local-esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1t0Gaq-003k6x-Jb;
	Mon, 14 Oct 2024 10:38:20 +0200
Date: Mon, 14 Oct 2024 10:38:20 +0200 (CEST)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: linux-kernel@vger.kernel.org
cc: linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
    dmaengine@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: Build regressions/improvements in v6.12-rc3
In-Reply-To: <20241014072731.3807160-1-geert@linux-m68k.org>
Message-ID: <711d7f6d-b785-7560-f4dc-c6aad2cce99@linux-m68k.org>
References: <CAHk-=wg061j_0+a0wen8E-wxSzKx_TGCkKw-r1tvsp5fLeT0pA@mail.gmail.com> <20241014072731.3807160-1-geert@linux-m68k.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Status: No, score=-0.7 required=5.0 tests=RCVD_IN_DNSWL_LOW,
	SPF_HELO_PASS,SPF_NONE autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, 14 Oct 2024, Geert Uytterhoeven wrote:
> JFYI, when comparing v6.12-rc3[1] to v6.12-rc2[3], the summaries are:
>  - build errors: +3/-1

   + /kisskb/src/crypto/async_tx/async_tx.c: error: no previous prototype for '__async_tx_find_channel' [-Werror=missing-prototypes]:  => 43:1

powerpc-gcc{5,13}/ppc44x_allmodconfig

   + /kisskb/src/drivers/net/ethernet/freescale/fs_enet/mii-bitbang.c: error: format '%x' expects argument of type 'unsigned int', but argument 4 has type 'resource_size_t {aka long long unsigned int}' [-Werror=format=]:  => 126:37
   + /kisskb/src/drivers/net/ethernet/freescale/fs_enet/mii-bitbang.c: error: format '%x' expects argument of type 'unsigned int', but argument 4 has type 'resource_size_t' {aka 'long long unsigned int'} [-Werror=format=]:  => 126:46

powerpc-gcc{5,13}/ppc85xx_allmodconfig

> [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/8e929cb546ee42c9a61d24fae60605e9e3192354/ (all 194 configs)
> [3] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/8cf0b93919e13d1e8d4466eb4080a4c4d9d66d7b/ (131 out of 194 configs)

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds

