Return-Path: <linuxppc-dev+bounces-1626-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A75987379
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Sep 2024 14:22:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XDt5w0Tjvz2yGL;
	Thu, 26 Sep 2024 22:22:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727353364;
	cv=none; b=Qh5kBkm8KSx95qHVrBM5rFfxGoNc/dc/j8iX+pT7M40hu2+pBkXtt1y80254BEBbKHh8MeL/CYD0DcEANYEL5fuZD9irDiNSDEdao4LNlQlM6JqwTRaTN7F0lVSYuelWmHew6TKifWmkUSeF0g3d1vZ2WLpHD/zAGCw4VLcHZCrRlmpL/YQzkiZIbgLipmDcZPTyJVsOP3dzm7nydzMf0qRoAgGIPe/zEZEy/UvTAybtD5znUpLCo+gOlVVv/SL0UAPMMg64vHrrHiOrJO7a9hbCYQ4EsO4GdCRRTKkpldynjtRNwz85Tg8jYmwaptmtsm7jc/1YIllZlFxHfDHWuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727353364; c=relaxed/relaxed;
	bh=/4f/LAVy77RkJWivsXBV5FX1olb+qRN8gRM7H6iyXvU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V14zVhYcMQxKxZPhERSTjsjcWlwLo4CN5bTKLWXo7JKbMvDHkzW2M8g1otHX9CTCSkIBcXcRuKnD0ogCsNJ9IFEW9UbXg3XjOFKCrefAduU6nglQJjYhjWzrWreY5cgqlN0gCmCCBO/qYtbQXMRjjo7Hi9h1TFTrylNf1wecxRw9D7Mksq5p1Y1brlSH1/zImbGVmidyb5lnipwdEOEgJC7WxUaO8kwLkPRgHPD1Yb0d5EWA5iH97LdyQi1YjHW3jkNjjlcdybm5ycKny533btO3GWtHJD8VympoP0FikIMl64INaFGXXbLny/rHcnyooP7EzMdrLS+9xcRaMyEGCA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XDt5v5B7Xz2yFL
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2024 22:22:42 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4XDt5q71Kdz9sSL;
	Thu, 26 Sep 2024 14:22:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SeWZDw47vw6L; Thu, 26 Sep 2024 14:22:39 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4XDt5q5zDDz9sRy;
	Thu, 26 Sep 2024 14:22:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B71BE8B76E;
	Thu, 26 Sep 2024 14:22:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id cW2IzJlvTqAb; Thu, 26 Sep 2024 14:22:39 +0200 (CEST)
Received: from [172.25.230.108] (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 63CB08B763;
	Thu, 26 Sep 2024 14:22:39 +0200 (CEST)
Message-ID: <b31c74c1-0c19-4bc4-b1af-db817977748d@csgroup.eu>
Date: Thu, 26 Sep 2024 14:22:39 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 14/16] modules: Support extended MODVERSIONS info
To: Matthew Maurer <mmaurer@google.com>, masahiroy@kernel.org,
 ndesaulniers@google.com, ojeda@kernel.org, gary@garyguo.net,
 mcgrof@kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Alex Gaynor <alex.gaynor@gmail.com>, Benjamin Gray <bgray@linux.ibm.com>,
 Naveen N Rao <naveen@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, neal@gompa.dev, marcan@marcan.st,
 j@jannau.net, asahi@lists.linux.dev, linux-modules@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Petr Pavlu <petr.pavlu@suse.com>,
 Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez
 <da.gomez@samsung.com>, Boqun Feng <boqun.feng@gmail.com>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, linuxppc-dev@lists.ozlabs.org
References: <20240925233854.90072-1-mmaurer@google.com>
 <20240925233854.90072-15-mmaurer@google.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20240925233854.90072-15-mmaurer@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 26/09/2024 à 01:38, Matthew Maurer a écrit :
> Adds a new format for MODVERSIONS which stores each field in a separate
> ELF section. This initially adds support for variable length names, but
> could later be used to add additional fields to MODVERSIONS in a
> backwards compatible way if needed. Any new fields will be ignored by
> old user tooling, unlike the current format where user tooling cannot
> tolerate adjustments to the format (for example making the name field
> longer).
> 
> Since PPC munges its version records to strip leading dots, we reproduce
> the munging for the new format. Other architectures do not appear to
> have architecture-specific usage of this information.
> 
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> ---
>   arch/powerpc/kernel/module_64.c | 23 ++++++++-
>   kernel/module/internal.h        | 11 ++++
>   kernel/module/main.c            | 92 ++++++++++++++++++++++++++++++---
>   kernel/module/version.c         | 45 ++++++++++++++++
>   4 files changed, 161 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
> index e9bab599d0c2..4e7b156dd8b2 100644
> --- a/arch/powerpc/kernel/module_64.c
> +++ b/arch/powerpc/kernel/module_64.c
> @@ -355,6 +355,23 @@ static void dedotify_versions(struct modversion_info *vers,
>   		}
>   }
>   
> +static void dedotify_ext_version_names(char *str_seq, unsigned long size)
> +{
> +	unsigned long out = 0;
> +	unsigned long in;
> +	char last = '\0';
> +
> +	for (in = 0; in < size; in++) {
> +		/* Skip one leading dot */
> +		if (last == '\0' && str_seq[in] == '.')
> +			in++;
> +		last = str_seq[in];
> +		str_seq[out++] = last;
> +	}

Why do you need a loop here ?

Can't you just do something like:

	if (str_seq[0] == '.')
		memmove(str_seq, str_seq + 1, size);


> +	/* Zero the trailing portion of the names table for robustness */
> +	memset(&str_seq[out], 0, size - out);

This seems unneeded.

> +}
> +
>   /*
>    * Undefined symbols which refer to .funcname, hack to funcname. Make .TOC.
>    * seem to be defined (value set later).



Christophe

