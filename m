Return-Path: <linuxppc-dev+bounces-8918-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 16338AC262C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 May 2025 17:16:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b3pdV4JV7z301B;
	Sat, 24 May 2025 01:15:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748013358;
	cv=none; b=CdY9Mk19cuF9dZKihuakhSEcLZ1Qn+LjsEBk85BLj48x2wRNKkcZiX0caTNKntSQwTV8dF4UWQtA6Kj8t8IWVGsqdg6FJuj+zgST2eMKYD4SyEV2q5jONrY2VfkhwTMcBOn4WClP0iorGOqeI2wyF/Cba060C9ZkjhMyGiHfOn74kojRxA8LkORBMQJuLZ/vLcbrTlM4+xDrUyq8JHbDrc7jb+UL/+ISHr6QRzvid0Aq99nBvGGGiiEWAnm73uuZiDIorqI3C3GmiZjI13eroPWySEeRRw2yyG+fvW22/xIxgCeegIQw0W9/bSLuFcd0+Y0BwYfYIrRApYq7myYI4A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748013358; c=relaxed/relaxed;
	bh=XWCE6jqKFyONnv3rqRo5aIekZYBw6AYzIcZy4RKLG3w=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=Og/kLA+Hg6QJ9iXWo1WidK2k5xQpfkSvSdtdAVlL0dThe8Ntm7sMuaGn5u58MXX8htbVqNNvTFR0I+1W3p+PKCvB05qRzJH3lCC9/V+Q05u/lZPm5X2gqQimOPpPTD+NzE7kzI2hxGICMF+ElUUI/UugktwFXKZqURzYkMRlVw+4OfLN/UcbOqW7IuePsZbg5pGDa9q+vsAYNWgxzJv/iPchRFnqOqvLP/2elhrWe+9axYHs13QOkD+wKGzz7M6IBsz/1rjo03vpjqeCeuliOU8SDF0WnsQ+CxAebNN9VFOjXhqQk1kElSG0wQlplmHaDUmT6E+oD/o62+FQECfRTw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HX8ckC8A; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HX8ckC8A;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b3pdS701Jz2ySW
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 May 2025 01:15:56 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3B52E5C5DCC;
	Fri, 23 May 2025 15:13:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C994AC4CEE9;
	Fri, 23 May 2025 15:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748013353;
	bh=XWCE6jqKFyONnv3rqRo5aIekZYBw6AYzIcZy4RKLG3w=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=HX8ckC8AMTt3FFPZ5hRUKl69FZBqaXO6fLB2Y7SpVFP65PAO1kjsi8SJWon7Y8VAL
	 5AlZGipDmdwo6ASrUJHjlZWt23IWVhtZ8w28sd2J+3k/5KL0Ds5/1Kd8fX92L9NeSK
	 djeiHI1ul7E3zdbl/W4YgmZQN1kHFHTDKeqsu/HEEZ+Cnkla1/YwztmITvG8ynuDgE
	 JgYg8/t8HUSDfYIDhxSbHCCufsrGiAF7Z4dT97PjU3++rt/osFUnAzdC53SPsceP8v
	 LTwB//5TEGvRiD/yhKtzXkNNBxvtdGzOsRy/8HOt85jlnfIqIfWPNhzlqEZfOF+w9l
	 PDqA51dZv9e7g==
Date: Fri, 23 May 2025 08:15:49 -0700
From: Kees Cook <kees@kernel.org>
To: Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>
CC: Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Marco Elver <elver@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, Ard Biesheuvel <ardb@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 linux-kernel@vger.kernel.org, x86@kernel.org, kasan-dev@googlegroups.com,
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-efi@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org,
 sparclinux@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v2 08/14] powerpc: Handle KCOV __init vs inline mismatches
User-Agent: K-9 Mail for Android
In-Reply-To: <e50abba6c962772c73342bacf20fb87dc99dd542.camel@linux.ibm.com>
References: <20250523043251.it.550-kees@kernel.org> <20250523043935.2009972-8-kees@kernel.org> <e50abba6c962772c73342bacf20fb87dc99dd542.camel@linux.ibm.com>
Message-ID: <6E407BC0-4D84-4420-AE07-EF85EBA1AB1C@kernel.org>
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
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On May 22, 2025 10:24:30 PM PDT, Andrew Donnellan <ajd@linux=2Eibm=2Ecom> =
wrote:
>On Thu, 2025-05-22 at 21:39 -0700, Kees Cook wrote:
>> When KCOV is enabled all functions get instrumented, unless
>> the __no_sanitize_coverage attribute is used=2E To prepare for
>> __no_sanitize_coverage being applied to __init functions, we have to
>> handle differences in how GCC's inline optimizations get resolved=2E
>> For
>> s390 this requires forcing a couple functions to be inline with
>
>I assume you mean powerpc here, though I'm sure my employer is happy
>that you're at least confusing us with IBM's other architecture :)

Whoops! Yes=2E Paste-o on my part=2E The rest of the sentence was updated =
correctly though=2E :)

--=20
Kees Cook

