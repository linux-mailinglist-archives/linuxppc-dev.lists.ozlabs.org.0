Return-Path: <linuxppc-dev+bounces-10668-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8494DB1B839
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Aug 2025 18:15:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bxJSL22Bkz3bmC;
	Wed,  6 Aug 2025 02:15:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc4:8:216:3eff:fe9d:e7b4"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754410546;
	cv=none; b=BvMD5uaaYRMLQOu6Mko7VWwE0bc1XbVUqx/oMwg/UZbpFPEpXdrXP73MG78xpKjApNyWLIG+x2QGaUKNU7nYibVaW2dlXAfW1kQXNrzfrrA4AIQkFmrx9Uid1ZAHTE+37CZtLfgwMu1dgCk211KuwNHASMWsa4vCevp9l2lzRzAXCe2ySmRDZMZSPxu90/DiT4WTLToMX/O7YVFE3HZQI2e5X30571jlw1UMsiChuR+SXEsGZmZ9gvN+OQyiNQm5y8JOvDCyKE+zmMU/2zqZaMMdeNaYiQBju/j4JuVYClmDEl6XbU0YTVpi3DGxGLjJrZojXSVa0BoSUN9hzNRk+w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754410546; c=relaxed/relaxed;
	bh=YKKJDDtdxUXV0lV5aN6SeraxUcBFKLa1fTZ3jSmMfEc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d9hdkXbnY/aurzYLf6N0tZQbopus0fkpgavh8qDCf8i0aYvJpYIdSold8nRWm44BrJcC3GymlY1a05KtZ2H2jB2GvZYri7fmDLKhBUFVIORawDf3n5TFeYu7WsbcTIRNwFgBmP/ZAcaiU/mcJE0lrr21trjI38kMg+FTYaoVjKt0MxC1/eQrD1YTcHXNsvw3NzEWODNOryM07t+4im32pd5dpovdQ1Q3fYZcP6h17Lv6W8+SG6MlC68B8p6R9rjRo6SVxDWSG+sDVcEZSjrpamozi1EzddngviqeiA/xb1WFRBjXscqA6ScBBqNZj+TOFIQBlWZuIGVDSGUEOED98w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass (client-ip=2001:4b98:dc4:8:216:3eff:fe9d:e7b4; helo=mslow3.mail.gandi.net; envelope-from=alex@ghiti.fr; receiver=lists.ozlabs.org) smtp.mailfrom=ghiti.fr
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ghiti.fr (client-ip=2001:4b98:dc4:8:216:3eff:fe9d:e7b4; helo=mslow3.mail.gandi.net; envelope-from=alex@ghiti.fr; receiver=lists.ozlabs.org)
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [IPv6:2001:4b98:dc4:8:216:3eff:fe9d:e7b4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bxJSK3JBsz3bm3
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Aug 2025 02:15:45 +1000 (AEST)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 89024581AC0
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Aug 2025 16:06:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 417DE44427;
	Tue,  5 Aug 2025 16:06:42 +0000 (UTC)
Message-ID: <20c1e656-512e-4424-9d4e-176af18bb7d6@ghiti.fr>
Date: Tue, 5 Aug 2025 18:06:41 +0200
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
Subject: Re: [PATCH v4 9/9] kasan/riscv: call kasan_init_generic in kasan_init
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>, ryabinin.a.a@gmail.com,
 hca@linux.ibm.com, christophe.leroy@csgroup.eu, andreyknvl@gmail.com,
 agordeev@linux.ibm.com, akpm@linux-foundation.org, zhangqing@loongson.cn,
 chenhuacai@loongson.cn, trishalfonso@google.com, davidgow@google.com
Cc: glider@google.com, dvyukov@google.com, kasan-dev@googlegroups.com,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org
References: <20250805142622.560992-1-snovitoll@gmail.com>
 <20250805142622.560992-10-snovitoll@gmail.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250805142622.560992-10-snovitoll@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudehiedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhephffhuddtveegleeggeefledtudfhudelvdetudfhgeffffeigffgkeethfejudejnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepudelfedrfeefrdehjedrudelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduleefrdeffedrheejrdduleelpdhhvghloheplgduledvrdduieekrddvvddruddtudgnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepvddupdhrtghpthhtohepshhnohhvihhtohhllhesghhmrghilhdrtghomhdprhgtphhtthhopehrhigrsghinhhinhdrrgdrrgesghhmrghilhdrtghomhdprhgtphhtthhopehhtggrsehlihhnuhigrdhisghmrdgtohhmpdhrtghpthhtoheptghhrhhishhtohhphhgvrdhlvghrohihsegtshhgrhhouhhprdgvuhdprhgtphhtthhopegrnhgurhgvhihknhhvlhesghhmrghilhdrtghomhdprhgtphhtthhopegrghhorhguvggvvheslhhin
 hhugidrihgsmhdrtghomhdprhgtphhtthhopegrkhhpmheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepiihhrghnghhqihhngheslhhoohhnghhsohhnrdgtnh
X-GND-Sasl: alex@ghiti.fr
X-Spam-Status: No, score=-0.0 required=3.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Sabyrzhan,

On 8/5/25 16:26, Sabyrzhan Tasbolatov wrote:
> Call kasan_init_generic() which handles Generic KASAN initialization
> and prints the banner. Since riscv doesn't select ARCH_DEFER_KASAN,
> kasan_enable() will be a no-op, and kasan_enabled() will return
> IS_ENABLED(CONFIG_KASAN) for optimal compile-time behavior.
>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217049
> Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
> ---
>   arch/riscv/mm/kasan_init.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
> index 41c635d6aca..ba2709b1eec 100644
> --- a/arch/riscv/mm/kasan_init.c
> +++ b/arch/riscv/mm/kasan_init.c
> @@ -530,6 +530,7 @@ void __init kasan_init(void)
>   
>   	memset(kasan_early_shadow_page, KASAN_SHADOW_INIT, PAGE_SIZE);
>   	init_task.kasan_depth = 0;
> +	kasan_init_generic();


This is right before actually setting the new mapping to the mmu (which 
is done below by setting a register called SATP). It does not seem to be 
a problem though, just wanted to let you know.

It boots fine with defconfig + kasan inline so:

Tested-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


>   
>   	csr_write(CSR_SATP, PFN_DOWN(__pa(swapper_pg_dir)) | satp_mode);
>   	local_flush_tlb_all();

