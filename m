Return-Path: <linuxppc-dev+bounces-12178-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5E3B5676E
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Sep 2025 12:06:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cPkN248Yyz3ccl;
	Sun, 14 Sep 2025 20:06:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757844402;
	cv=none; b=hfej7uQqFaJdcXQMTZ4ooUeoZ/2ebm7bCjtZU0WX5vuXz4bx8t2bbu0YWxWa9Cupfe+DD52WgvAiS+XuUUyt6mmZWCQdiyhRbKM0TR97UiNf3mxzSNNi1ggFOizaJlsCdGjJ6LsITE/fTxo0Q/v4+QIoO1b9mAJ4ygkWIKxPvtqrRP3LDiSctQkoK5HZ7uNWCHuOvw1sA3KSDAOu4B+FuM2E9j/xkl2wIix1fY+acPFrsNGXxhMMFbKMKK6g691wyCLFT53KXMF4DSTn5M2Wkx+KjI5X1rzJIzui23tTVQ8AxAl4yTSGk5851S5yS9mhqRwqu78cX4jyN8oWBir4ag==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757844402; c=relaxed/relaxed;
	bh=rQXP67kYwWg6vM4UTDhamwKWj1krkQlt4rQZSoQPEdQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gdoh6Y6nCSHnhKlVewhU0Apqd9dmcxntydmLbZ4agmzUXe/k5BmQX7Kle5iXwdDV8ciIz6ow8vTnIZ8AtmTjN/lNVFmbBrR+rMDgtiJomY2OuHAKE49BAldet3RuSUQV7qGMpQAeFo7RgtLxlfnMWMpe05hIoUg2kd/RaEjtBv7K0/ANji1uNhcdfuLwN05170062YUMrIBZvSmTHkiGV3UloVMkhyGXDwv2Fa5LGc4Yx1ntSXvQM6saZq9a1J7i+InzmyPF940UdRsYNdUOw3vDnhm/HX/HbMQOpkWwDgz58cvIuVq/4KgVSVb/LN7MV72Tz4olgJS6nxavEH2c7A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hGhVWy4h; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hGhVWy4h;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cPkN13BQ9z3cQx
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Sep 2025 20:06:41 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 20DFE438E7;
	Sun, 14 Sep 2025 10:06:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4082AC4CEF0;
	Sun, 14 Sep 2025 10:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757844399;
	bh=sAkxjJJfEShLrXBVvUbe5Nbuot2UFPkdNXybwJxcBYY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hGhVWy4h/gu84b8AUY5CAxhBjA4oE+f4FI8q2AbORfRl5Mzbjbj6lhOkyStQ0oi9M
	 W8QoYlTDAMmDvzc22PRN4vIf6UvnWIEgHfPK3nbIaO6+Bgc4ot987GJoAgiZ4Qoss+
	 dxJ+3IkBSVZOwu+N2Z4n4dxeuzzil+8fSxn4vpD6k3VBKvJUfWYkKTYv+ULvYtpxSe
	 ARcPnImrypfujumW2c+Tkx9maY07yERhC6rWJz/fkMGgSqGvpdn/rBYS9IbwIOKyKB
	 hvuk4ypNdLPnSksQeCF7GqwSkxro5/n9s5UJO1kqWTpzV4Z4DDYeQc9CzvLJ70Fc+A
	 sMyziae1DQ/+A==
Message-ID: <a079375f-38c2-4f38-b2be-57737084fde8@kernel.org>
Date: Sun, 14 Sep 2025 12:06:24 +0200
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
Subject: Re: [PATCH RESEND 21/62] init: remove all mentions of root=/dev/ram*
To: Askar Safin <safinaskar@gmail.com>, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Christian Brauner <brauner@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
 Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@lst.de>,
 Jens Axboe <axboe@kernel.dk>, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Aleksa Sarai <cyphar@cyphar.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Julian Stecklina <julian.stecklina@cyberus-technology.de>,
 Gao Xiang <hsiangkao@linux.alibaba.com>, Art Nikpal <email2tema@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, Eric Curtin <ecurtin@redhat.com>,
 Alexander Graf <graf@amazon.com>, Rob Landley <rob@landley.net>,
 Lennart Poettering <mzxreary@0pointer.de>, linux-arch@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org, x86@kernel.org,
 Ingo Molnar <mingo@redhat.com>, linux-block@vger.kernel.org,
 initramfs@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-efi@vger.kernel.org,
 linux-ext4@vger.kernel.org, "Theodore Y . Ts'o" <tytso@mit.edu>,
 linux-acpi@vger.kernel.org, Michal Simek <monstr@monstr.eu>,
 devicetree@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 Kees Cook <kees@kernel.org>, Thorsten Blum <thorsten.blum@linux.dev>,
 Heiko Carstens <hca@linux.ibm.com>, patches@lists.linux.dev
References: <20250913003842.41944-1-safinaskar@gmail.com>
 <20250913003842.41944-22-safinaskar@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250913003842.41944-22-safinaskar@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 13/09/2025 02:38, Askar Safin wrote:
> Initrd support is removed, so root=/dev/ram* is never correct

For all your other patches (here is correct):

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597


> 
> Signed-off-by: Askar Safin <safinaskar@gmail.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt          | 3 +--
>  Documentation/arch/m68k/kernel-options.rst               | 9 ++-------
>  arch/arm/boot/dts/arm/integratorap.dts                   | 2 +-
>  arch/arm/boot/dts/arm/integratorcp.dts                   | 2 +-
>  arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-cmm.dts     | 2 +-
>  .../boot/dts/aspeed/aspeed-bmc-facebook-galaxy100.dts    | 2 +-
>  .../arm/boot/dts/aspeed/aspeed-bmc-facebook-minipack.dts | 2 +-
>  .../arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge100.dts | 2 +-
>  arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge40.dts | 2 +-
>  arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yamp.dts    | 2 +-
>  .../boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi  | 2 +-

No, don't do that. DTS is always separate. Don't mix DTS into such huge
patchbom, either.

>  arch/arm/boot/dts/hisilicon/hi3620-hi4511.dts            | 2 +-
>  .../boot/dts/intel/ixp/intel-ixp42x-welltech-epbx100.dts | 2 +-
>  arch/arm/boot/dts/nspire/nspire-classic.dtsi             | 2 +-
>  arch/arm/boot/dts/nspire/nspire-cx.dts                   | 2 +-
>  arch/arm/boot/dts/samsung/exynos4210-origen.dts          | 2 +-
>  arch/arm/boot/dts/samsung/exynos4210-smdkv310.dts        | 2 +-
>  arch/arm/boot/dts/samsung/exynos4412-smdk4412.dts        | 2 +-
>  arch/arm/boot/dts/samsung/exynos5250-smdk5250.dts        | 2 +-
>  arch/arm/boot/dts/st/ste-nomadik-nhk15.dts               | 2 +-
>  arch/arm/boot/dts/st/ste-nomadik-s8815.dts               | 2 +-
>  arch/arm/boot/dts/st/stm32429i-eval.dts                  | 2 +-
>  arch/arm/boot/dts/st/stm32746g-eval.dts                  | 2 +-
>  arch/arm/boot/dts/st/stm32f429-disco.dts                 | 2 +-
>  arch/arm/boot/dts/st/stm32f469-disco.dts                 | 2 +-
>  arch/arm/boot/dts/st/stm32f746-disco.dts                 | 2 +-
>  arch/arm/boot/dts/st/stm32f769-disco.dts                 | 2 +-
>  arch/arm/boot/dts/st/stm32h743i-disco.dts                | 2 +-
>  arch/arm/boot/dts/st/stm32h743i-eval.dts                 | 2 +-
>  arch/arm/boot/dts/st/stm32h747i-disco.dts                | 2 +-
>  arch/arm/boot/dts/st/stm32h750i-art-pi.dts               | 2 +-
>  arch/arm/configs/assabet_defconfig                       | 2 +-
>  arch/arm/configs/at91_dt_defconfig                       | 2 +-
>  arch/arm/configs/exynos_defconfig                        | 2 +-

To me your patchset is way too big bomb, too difficult to review. You
touch too many subsystems in the same commits. In few cases I saw
dependency, in other cases like here - there is no dependency! So why
grouping independent things together? It only makes it difficult to review.

Anyway, combining here DTS is a no-go for me.

Best regards,
Krzysztof

