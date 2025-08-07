Return-Path: <linuxppc-dev+bounces-10738-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3B9B1DA1F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Aug 2025 16:43:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4byVJs5VgLz3cSK;
	Fri,  8 Aug 2025 00:43:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc4:8::221"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754577805;
	cv=none; b=DBZzFBX3a9mJSV9d1a5JG0TkczsOqzDtdcLVrpKSNN31K/0WFruwg2WwFg3YmTWy44AItkK4vqvf+C68aToIpBxjBT2WrnEi3CbcLx8S9Eej12GtsqKCJ9YziDQTNFoxlzwBpjzjgTRSPjZCkY+kC1mDXWr98d2Ia3pZjnwDAtW0kpb683BEiuvi2jEYfiX70Own15W8EBS7ps+FygLCgcRmE3NkvOoTwjUK/yTRvnwqGHJiWBVEyiqM1QyMq60/Rbj7Ogt070nGQ5swWvcHudZiBI6cgXV4eNTlk5XXSS0XPd+T/4xNcNuYSbu5NsSI+k0sfWxk6W02uAahGtteUg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754577805; c=relaxed/relaxed;
	bh=ZW2w5iiGFhKvtDIx+64aecOBy2PCIe9Xw3eq628K7RM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EPiQqqivsVvLtyw8lL/vWy4G9MXqEBDaNhJeSmyAJZiBbRo5DdeW3ck3A+QjfnMx2SrUl1lL2d+umliohx2gLMO5f+rfm25vEUsRdgDOptH2B8CPM8ShJoWPiR1+jV6oX0UMeUWiLP7r2wIxAp8RFIc8qPY33euqrZzcHIodwFrTQsl92k3Yv47Y960J9Q9pF9MTQGSdb/yOGurQpFwMz6JVKSZgfk/DtUiySF14DYkT35Mt0KvDpxpvNhrKy00ExH/hfeYId97NABSXFbde98nrFzowpTEmmu70qLu2SX3nGnPgj7IaIrxnV7ov+gzjvsloNR2muQXOO3GE7F2y+A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass (client-ip=2001:4b98:dc4:8::221; helo=relay1-d.mail.gandi.net; envelope-from=alex@ghiti.fr; receiver=lists.ozlabs.org) smtp.mailfrom=ghiti.fr
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ghiti.fr (client-ip=2001:4b98:dc4:8::221; helo=relay1-d.mail.gandi.net; envelope-from=alex@ghiti.fr; receiver=lists.ozlabs.org)
X-Greylist: delayed 167788 seconds by postgrey-1.37 at boromir; Fri, 08 Aug 2025 00:43:24 AEST
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4byVJr5Tdlz3cSJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Aug 2025 00:43:23 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D90BA4432A;
	Thu,  7 Aug 2025 14:43:12 +0000 (UTC)
Message-ID: <53b98e1e-4f7e-4320-8d04-d84dd2c4092d@ghiti.fr>
Date: Thu, 7 Aug 2025 16:43:09 +0200
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/17] riscv: Add __attribute_const__ to ffs()-family
 implementations
To: Kees Cook <kees@kernel.org>, linux-arch@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
 linux-alpha@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, llvm@lists.linux.dev,
 linux-hardening@vger.kernel.org
References: <20250804163910.work.929-kees@kernel.org>
 <20250804164417.1612371-9-kees@kernel.org>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250804164417.1612371-9-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvdduudelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpeehiefhuddtuddukeetkeehhedtffduhfevfeeftdefveffgfeuffejjeejfeekueenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemlehftghfmeeksghfleemleeludgumeekrggrfhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemlehftghfmeeksghfleemleeludgumeekrggrfhdphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemlehftghfmeeksghfleemleeludgumeekrggrfhgnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepudekpdhrtghpthhtohepkhgvvghssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhgthhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehli
 hhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeigkeeisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrlhhphhgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqtghskhihsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqhhgvgigrghhonhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmieekkheslhhishhtshdrlhhinhhugidqmheikehkrdhorhhg
X-GND-Sasl: alex@ghiti.fr
X-Spam-Status: No, score=-0.7 required=3.0 tests=RCVD_IN_DNSWL_LOW,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Kees,

On 8/4/25 18:44, Kees Cook wrote:
> While tracking down a problem where constant expressions used by
> BUILD_BUG_ON() suddenly stopped working[1], we found that an added static
> initializer was convincing the compiler that it couldn't track the state
> of the prior statically initialized value. Tracing this down found that
> ffs() was used in the initializer macro, but since it wasn't marked with
> __attribute__const__, the compiler had to assume the function might
> change variable states as a side-effect (which is not true for ffs(),
> which provides deterministic math results).
>
> Add missing __attribute_const__ annotations to RISC-V's implementations of
> variable__ffs(), variable__fls(), and variable_ffs() functions. These are pure
> mathematical functions that always return the same result for the same
> input with no side effects, making them eligible for compiler optimization.
>
> Build tested ARCH=riscv defconfig with GCC riscv64-linux-gnu 14.2.0.
>
> Link: https://github.com/KSPP/linux/issues/364 [1]
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
>   arch/riscv/include/asm/bitops.h | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/include/asm/bitops.h b/arch/riscv/include/asm/bitops.h
> index d59310f74c2b..77880677b06e 100644
> --- a/arch/riscv/include/asm/bitops.h
> +++ b/arch/riscv/include/asm/bitops.h
> @@ -45,7 +45,7 @@
>   #error "Unexpected BITS_PER_LONG"
>   #endif
>   
> -static __always_inline unsigned long variable__ffs(unsigned long word)
> +static __always_inline __attribute_const__ unsigned long variable__ffs(unsigned long word)
>   {
>   	asm goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
>   				      RISCV_ISA_EXT_ZBB, 1)
> @@ -74,7 +74,7 @@ static __always_inline unsigned long variable__ffs(unsigned long word)
>   	 (unsigned long)__builtin_ctzl(word) :	\
>   	 variable__ffs(word))
>   
> -static __always_inline unsigned long variable__fls(unsigned long word)
> +static __always_inline __attribute_const__ unsigned long variable__fls(unsigned long word)
>   {
>   	asm goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
>   				      RISCV_ISA_EXT_ZBB, 1)
> @@ -103,7 +103,7 @@ static __always_inline unsigned long variable__fls(unsigned long word)
>   	 (unsigned long)(BITS_PER_LONG - 1 - __builtin_clzl(word)) :	\
>   	 variable__fls(word))
>   
> -static __always_inline int variable_ffs(int x)
> +static __always_inline __attribute_const__ int variable_ffs(int x)
>   {
>   	asm goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
>   				      RISCV_ISA_EXT_ZBB, 1)


Tested-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Acked-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex



