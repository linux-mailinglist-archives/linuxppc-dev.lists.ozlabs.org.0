Return-Path: <linuxppc-dev+bounces-2576-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D6B9B00EC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2024 13:14:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XZgCg07xhz2xs8;
	Fri, 25 Oct 2024 22:14:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729854862;
	cv=none; b=nnaL6JQQbNaZb/DTJs5K8tlgoD1Uz/xBTBJK3MwgSfHEThDosN2z2TtGfPCKyaVlgB+nFp2dadmtjXnxhKQthG1CmNDQjymZR8dj3jzQT2HY6E45xPatYft2IUxBDAfxDM/sg2YB34UPyhSW5qwkMedeEIJNc96SMq1oYYj4kxO71bq7nOlhWw4nr5+143p4CPnsVSmha/RirQlFywKG1T6AGHGYX+JWTLiImNf76iyF741sBSqOLMm0LxjfE2xw7Hi9Xzeyk3q9WHeOZ5TNSKJvA4hUIEGII0ShROcpqmGHZA/4f+6iZW7U55rNnSTB9NBEgtrnMjzBV3mG+LtkZg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729854862; c=relaxed/relaxed;
	bh=3dTjQaZVR+uUWkKmz4Z6BTzpk5RdKUpw1NUIL1bkTsw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JWcmU45OqxadM0XBUE1ZG/H9THNIKdPAxTbC7Fo27nyTC1uaHt6ohq6diXv7SyLL1R4bLnTJGi+SVCdaHK/F2waXhbdPkDrECguhZ79gMcIo/+3g+XP9nG1f39yioz/Qd1yoXSQr9AmCNzNmzK0txB95N1Nlai6q8wwXTwsuaUJTmUrhQJU0b1+n9ZjiqFD02yblJMQR7qnmqVkiiPtIvOyC2HYnJyBEIYxf6KMkahZMOqjwxwMU+nyITueb3BVm3xcuRbp82dLfA1bPXy9MsYWWZwiOEkeOfOBt/u88OXq0UgiAnrDYbIL1VCVoORHGsAut8mN31csEbRRL+8Kidw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=JDdCwYU+; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=JDdCwYU+;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XZgCc4jRZz2xjd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2024 22:14:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1729854853;
	bh=3dTjQaZVR+uUWkKmz4Z6BTzpk5RdKUpw1NUIL1bkTsw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=JDdCwYU+pIh2r5q1s2zMIl8JJAxp4Mc5pqUoV9hEImpLMfsAta+MtHEBioXUeqUeu
	 sE4DWPV30C1FRZ0w0APFbcKUStTjXflEHCuCkgB9yDjDwemgMpnydJPcmcakilNH68
	 4aR2rNapZ5I26DJZI9TrRMzleYLvjtMTwpMZwS5Sfd6k+OjxQIOeNwX7z0xuaP/AEC
	 8VB66kRdGmfbjwiDL02t9nUyx8FVgmsMJnCiUXRn4hynxDe26ZP2DNG0FdMFQL+pm2
	 gS9la62LQcFMsLA1Eiz7y1VSCuefBNTzhPLxEpbIjkN7yVYHFiz14Wbv2ECd35b5Vd
	 wa5ZKCXQXlv5w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XZgCN5Rwbz4w2N;
	Fri, 25 Oct 2024 22:14:08 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Matthew Maurer <mmaurer@google.com>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu
 <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, Daniel
 Gomez <da.gomez@samsung.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Matthew Maurer <mmaurer@google.com>
Subject: Re: [PATCH v7 1/3] modules: Support extended MODVERSIONS info
In-Reply-To: <20241023-extended-modversions-v7-1-339787b43373@google.com>
References: <20241023-extended-modversions-v7-0-339787b43373@google.com>
 <20241023-extended-modversions-v7-1-339787b43373@google.com>
Date: Fri, 25 Oct 2024 22:14:06 +1100
Message-ID: <874j50juyp.fsf@mail.lhotse>
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
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Matthew Maurer <mmaurer@google.com> writes:
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
>  arch/powerpc/kernel/module_64.c | 24 ++++++++++-
>  kernel/module/internal.h        | 11 +++++
>  kernel/module/main.c            | 92 +++++++++++++++++++++++++++++++++++++----
>  kernel/module/version.c         | 45 ++++++++++++++++++++
>  4 files changed, 162 insertions(+), 10 deletions(-)
>
> diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
> index e9bab599d0c2745e4d2b5cae04f2c56395c24654..02ada0b057cef6b2f29fa7519a5d52acac740ee5 100644
> --- a/arch/powerpc/kernel/module_64.c
> +++ b/arch/powerpc/kernel/module_64.c
> @@ -355,6 +355,24 @@ static void dedotify_versions(struct modversion_info *vers,
>  		}
>  }
>  
> +/* Same as normal versions, remove a leading dot if present. */
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
> +	/* Zero the trailing portion of the names table for robustness */
> +	memset(&str_seq[out], 0, size - out);
> +}

Sorry I realise it's version 7, but although the above looks correct it's
kind of dense.

I think the below would also work and is (I think) easier to follow, and
is more obviously similar to the existing code. I'm sure your version is
faster, but I don't think it's that performance critical.

static void dedotify_ext_version_names(char *str_seq, unsigned long size)
{
	char *end = str_seq + size;
	char *p = str_seq;

	while (p < end) {
		if (*p == '.')
			memmove(p, p + 1, end - p - 1);

		p += strlen(p) + 1;
	}
}

The tail of str_seq will be filled with nulls as long as the last string
was null terminated.

cheers

