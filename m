Return-Path: <linuxppc-dev+bounces-4178-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C2A9F3180
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2024 14:29:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YBglt6YBWz2yyR;
	Tue, 17 Dec 2024 00:29:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::435"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734355545;
	cv=none; b=VY+B436Kvz1h/88mvKTOAIot4S7KxDTiJEs8EK9uBjBT8K/PoSSKiG/sroTuBWPSZlv8NgPTYlbLmJQdsZpMWDQQsT/9ExeYpXLCka/kekrlSIpCbGPMS+vRKYOkK0vdnBOnYBVBe7GXJCSMXMYd4ENk9LkDm0CmYjj3xxkRGgAK6WsXTY+hmNAWBoQ1OJmdi7vVmlNAvaOTar6qaUF6kVJfqLC5rVvxlXjgUQ31tVyk4T4oDgDeyADcGgTwpMRCkA5IQ7/AkMRaAlFm/W3zFXcDZNcDuwee8u5R0J1W1W+6B6FHOrwo0XemxPqp8uw4AOPqu3t/IWYrMkZUbP2NeA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734355545; c=relaxed/relaxed;
	bh=STePF4alhOUCMJb60WwslpIUy0epmImIHj5n/B736B8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HSyOzGuC+sQt7uCoLNJ+BepRf+HNz9et2zIeJa1sMA+v4Lg5lDw0gNT76/4RD85eZnPCNPzpuKmS7wMf3QzfYJby5pZme4S/k101KV79k3X/hNxEbduK7FRWqcG6y1JEiChhMbeD+Ekc2qLIMfKNg3XUDHL+Qob19MrJiAvum6G5Td11lgfhjj8JdqjWbn758K/JNyEjcfMsWtrVTp4GROJInRD8LTH9A7N9uNbSyCKbwhuq34jopROOtiTamPHH1671i3XbUHlG8OnoUt2AKMIiHkU0fSrAvAEC+uK9yEoGVdeEKdkvUCb+jADsXMH0cvNxoTUBCdgBRhHWN/q+5g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=QqZnmvrP; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com; envelope-from=petr.pavlu@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=QqZnmvrP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com; envelope-from=petr.pavlu@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YBggC3c1sz2ytT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2024 00:25:41 +1100 (AEDT)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-38633b5dbcfso4449275f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Dec 2024 05:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734355536; x=1734960336; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=STePF4alhOUCMJb60WwslpIUy0epmImIHj5n/B736B8=;
        b=QqZnmvrPay6/oqsOjeljXRhsAw0HIcuXOq98FHAWdrwNu665dlSK9euaIfQjC5j/Gh
         QczZf3Fb6LZcci/1mqwFFI3erlT85pRjb7tXNeIsDCHyKkbZTPHmyTURvGZKG/KxkDez
         GFRKlECxejOWr42Jady32QrD175/24voXLxYRHAgboK+jICCt5s6A261dnJcchD5OjQG
         c2qcKpch1HlEqJc/laOCD4z9dw7x3X8cdL3wm6kyk+Dltr5pq6d/dKkf518KvnKee6rW
         I35K0pel6P+5k97zi4MXDnpKINRUm9oL6X++ok9cOiJrraWmVADHBall7e6Qmy9RNptD
         jEPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734355536; x=1734960336;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=STePF4alhOUCMJb60WwslpIUy0epmImIHj5n/B736B8=;
        b=p1pDCm4Z/+v7ktttmE1E9LTF2PMD1sXT3t03fLw/W9KlA/K+QI0qmHBaZi9HiFV1iX
         CjHvhQI5lSH1zeMDbVc35QROnIX5xVqhhxmAgdwp0uyjWzjJuqkU+PlhNQsXo+GrwvAs
         MWU+i6bmEcctWXPefkMhwYkFPuS5Mfb2hxE13e/NDGzcTKsEvgTJtXkaOWNqqG7QCz+G
         gSY1Hw5zNULL4m2rxQ9i2pXjp9mSBNLHcPi5ulQ6ONAzFN/Y3DIRIQuUJ+0ut/L9p3Kx
         qXrQmR+fE/NV4SKSxsp6IpkNIZSi8ZhWyGOphAiUG8+5vnOMDAx+9Z7KBw+MzZkpkjJG
         SWxA==
X-Forwarded-Encrypted: i=1; AJvYcCUmDAV4QN6U/xjHw2SRxrsT3rgG/4fxAgu/h+fox4zbtsLrNqUOxdIuxf0uSH7rWY9XHzQdYgOu++j1c7o=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxxKYYQnwgCf+QciUoGdcuR4rHourkRIh3DBie1KGHmirjYk80Q
	xQJQeFF6KH9kk0uKIysK3D0FSOruLsmryfeL7mFO9snft21Jnn5DFwmSGqKQCE4=
X-Gm-Gg: ASbGncvIhhua0ktSf/NgZMdGBYwcZg6ViP1XcfUuNXLh0AGpI+sIlwr08uGGV3vKA5F
	Tw/CFStISK7Oy6uu3kp6OB8GP5WpR1rs/gag13glFYk//inBsPWszW9S5HgYpbEdEK4Jd57lHGq
	/EiqrBWa+oGib3OSgu5J+F8uQLX/C/zdJY28wMR3VS6P8wkbZeDKZ5ZY2dZxmxk5zMh7CtCFEdK
	dAMKqBYsR0I0tK2vb4ibi9fy+BAtppejX70ALgePXMXdHu1U0rRTOwhOC4G
X-Google-Smtp-Source: AGHT+IGqoSYH/VA6fKloW87cFzqLGeD30iZmGbWZZas/HuP1gKITI6KUoUpWyXXkXirFAcpa9znGog==
X-Received: by 2002:adf:eec3:0:b0:388:c75d:be97 with SMTP id ffacd0b85a97d-388c75dbeaamr7310161f8f.11.1734355535593;
        Mon, 16 Dec 2024 05:25:35 -0800 (PST)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c804a34fsm8253045f8f.76.2024.12.16.05.25.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 05:25:35 -0800 (PST)
Message-ID: <e522ec59-6ee6-4c11-8a4f-91a683e6435c@suse.com>
Date: Mon, 16 Dec 2024 14:25:33 +0100
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/5] Documentation/kbuild: Document storage of symbol
 information
To: Matthew Maurer <mmaurer@google.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
 Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez
 <da.gomez@samsung.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Jonathan Corbet <corbet@lwn.net>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org
References: <20241123-extended-modversions-v10-0-0fa754ffdee3@google.com>
 <20241123-extended-modversions-v10-4-0fa754ffdee3@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20241123-extended-modversions-v10-4-0fa754ffdee3@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 11/23/24 03:42, Matthew Maurer wrote:
> Document where exported and imported symbols are kept, format options,
> and limitations.
> 
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> ---
>  Documentation/kbuild/modules.rst | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/Documentation/kbuild/modules.rst b/Documentation/kbuild/modules.rst
> index 101de236cd0c9abe1f5684d80063ff3f9a7fc673..c32e3ed67cd26070f6929f6ad98c4308a1ab71f8 100644
> --- a/Documentation/kbuild/modules.rst
> +++ b/Documentation/kbuild/modules.rst
> @@ -423,6 +423,26 @@ Symbols From the Kernel (vmlinux + modules)
>  	1) It lists all exported symbols from vmlinux and all modules.
>  	2) It lists the CRC if CONFIG_MODVERSIONS is enabled.
>  
> +Version Information Formats
> +---------------------------
> +
> +	Exported symbols have information stored in __ksymtab or __ksymtab_gpl
> +	sections. Symbol names and namespaces are stored in __kstrtab and
> +	__kstrtabns respectively, using a format similar to the string table
> +	used for ELF. If CONFIG_MODVERSIONS is enabled, the CRCs corresponding
> +	to exported symbols will be added to the __kcrctab or __kcrctab_gpl.

The second sentence should be that symbol names and namespaces of
exported symbols are both stored in the __ksymtab_strings section.

> +
> +	If CONFIG_BASIC_MODVERSIONS is enabled (default with
> +	CONFIG_MODVERSIONS), imported symbols will have their symbol name and
> +	CRC stored in the __versions section of the importing module. This
> +	mode only supports symbols of length up to 64 bytes.
> +
> +	If CONFIG_EXTENDED_MODVERSIONS is enabled (required to enable both
> +	CONFIG_MODVERSIONS and CONFIG_RUST at the same time), imported symbols
> +	will have their symbol name recorded in the __version_ext_names
> +	section as a series of concatenated, null-terminated strings. CRCs for
> +	these symbols will be recorded in the __version_ext_crcs section.
> +
>  Symbols and External Modules
>  ----------------------------
>  
> 

-- 
Thanks,
Petr

