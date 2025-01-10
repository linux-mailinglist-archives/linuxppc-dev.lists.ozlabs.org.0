Return-Path: <linuxppc-dev+bounces-5014-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 08875A098B0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2025 18:38:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YV85m0Cwmz30Vn;
	Sat, 11 Jan 2025 04:38:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736530731;
	cv=none; b=RBxAw7HYp8Is9AmWSOEqXJSccLsjiKjtq5MfARk6amsj+0ZW+BpuNQ9M6CARG8WD21r2O4oHHt98ijKPKPu/uiwY1VvLzkdc/Xfv7bvVn/zyO+jsfmOb/L/yLp2beNQxJI0/CUomyFyniUBvobyKWrX0gC62XT94VaKqTHWwe4gHehHSVuj0Rx3j6YWc+yiSuTcOJds0h/aw3JIrz/13Y0I/uJAqWWONotv92EDns28GNqJOgeHeUqPBBnKstcUxrLOwPFL1UrFUuWl7ONLzvkbDnExvGS3wndo+0vId4VMkpcXdNvamchEU5cAWVHe2HYUaqWbpvFwfmpUXfxRl8g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736530731; c=relaxed/relaxed;
	bh=RD6nZV1XtAPWMC9dEZfIf2cqcyFr6kW2Ap+29KyEOFw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CKgmqqhOoTM4SJdSwbndPIZ3Bx3bd5sMrU8Y9MaiballNYdHS4K+zWbd7NmZzpnV7+dLGSQRoYjCdivVIQuxeEyOx5F/9z0pUFh8sfJDOFsCI1RXZRv3gso2A9Q7NKIYihZPStc4fpJ0JfHUQW22klikBundF1iDibqCTqxuS3om0UTHQRuwodmNWePNSrjKEPRpDuxZVsU3lTwJyopLoGPhjgCWXe3dZ4TBeNCiO3WRrSMjWnWGntW3n2PTt0vc3LElFQgPMdp+aM9VmBtVTsrwHFkXBOSn/BE4FiyVjeeoBPe0TF4nKMPPEYA0VInUmIcaXXXfvB3KzCf6DCjwaw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YSfPPwGv; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YSfPPwGv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YV85k5c36z30Pp
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2025 04:38:50 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 505E6A42767
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 17:36:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2304FC4AF0C
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 17:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736530727;
	bh=RD6nZV1XtAPWMC9dEZfIf2cqcyFr6kW2Ap+29KyEOFw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YSfPPwGv7C4m3Vg7Q31vn4+yQY5y99PHqI1t9URfjH0psI6NRYtfeWQ76G/Q79wIa
	 Ge/9OL0HHJKGF7aDPuFO75Y9AaYgA17po7HEQpXATAOxyDJ5c7DgIzwGvJJXSWIvzL
	 rh2gSYD8e+82wuKaPFzg6Ln78lcMmnBwYVQxabs/HRelCXuk29u3V7DjPEgDe/+8uY
	 W17vuCJJts5mh0GnGi9LH7y6kaKrFTzeg4dvRANUTzqMjm1WWN0T82KzWwxFP+4Ymd
	 kXYZptgGGtfRu1Q+ckTuffp0qrikqr+14T2pweQ54TFruSrXcibeReOZZDorEioCM9
	 BCp9VHIy1X4Mw==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5401bd6ccadso2298123e87.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 09:38:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWASDdXDsdZEYoAZV5dpZmpPayfa5S42LxreMKWBtO6YbVd1P9LkKToQjeFKFa/NuVgi1CUBSh6gURoqCI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz+5Qf0++QDJIkHS15dRK8oNPigodOsdEAxAYui367aDOgFfPym
	UQgnfW9AbDlB+DoOsEXa5LTOFKV/Oil1I/Lxm9n9mamNaoCVcdTMRy27xczkJckgJxJ1m20B1jX
	HquUjTR2PUACqbL8AN7QNE8RnBg4=
X-Google-Smtp-Source: AGHT+IFDj4e7Qdk/CVrOBd4VzNqB9OZxNuR4FJLEDyAVOab6ZdZEbgzo0h2oKJsV4Ny6JXL/f8VoeR70ySCzaDQuN2I=
X-Received: by 2002:a05:6512:a8c:b0:542:29a6:db5a with SMTP id
 2adb3069b0e04-542845b1fdcmr3674248e87.35.1736530725759; Fri, 10 Jan 2025
 09:38:45 -0800 (PST)
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
References: <20250103-extended-modversions-v13-0-35d87c65ee04@google.com>
In-Reply-To: <20250103-extended-modversions-v13-0-35d87c65ee04@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 11 Jan 2025 02:38:09 +0900
X-Gmail-Original-Message-ID: <CAK7LNATi1cAH5Gmp0Q=e5tdhVcCW1mACnCKSPuHke4A_VnEczg@mail.gmail.com>
X-Gm-Features: AbW1kvZuf7C0InUFz8wtQFKA4D5Ukm8tL8xvzKpSnzBouaaarUSzvSOupLkZC14
Message-ID: <CAK7LNATi1cAH5Gmp0Q=e5tdhVcCW1mACnCKSPuHke4A_VnEczg@mail.gmail.com>
Subject: Re: [PATCH v13 0/5] Extended MODVERSIONS Support
To: Matthew Maurer <mmaurer@google.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Jonathan Corbet <corbet@lwn.net>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sat, Jan 4, 2025 at 2:37=E2=80=AFAM Matthew Maurer <mmaurer@google.com> =
wrote:
>
> This patch series is intended for use alongside the Implement DWARF
> modversions series [1] to enable RUST and MODVERSIONS at the same
> time.
>
> Elsewhere, we've seen a desire for long symbol name support for LTO
> symbol names [2], and the previous series came up [3] as a possible
> solution rather than hashing, which some have objected [4] to.
>
> This series adds a MODVERSIONS format which uses a section per column.
> This avoids userspace tools breaking if we need to make a similar change
> to the format in the future - we would do so by adding a new section,
> rather than editing the struct definition. In the new format, the name
> section is formatted as a concatenated sequence of NUL-terminated
> strings, which allows for arbitrary length names.
>
> Emitting the extended format is guarded by CONFIG_EXTENDED_MODVERSIONS,
> but the kernel always knows how to validate both the original and
> extended formats.
>
> Emitting the existing format is now guarded by CONFIG_BASIC_MODVERSIONS,
> but it is enabled by default when MODVERSIONS is enabled and must be
> explicitly disabled by the user.
>
> Disabling CONFIG_BASIC_MODVERSIONS may cause some userspace tools to be
> unable to retrieve CRCs until they are patched to understand the new
> location. Even with CONFIG_BASIC_MODVERSIONS enabled, those tools will
> be unable to read the CRCs for long symbols until they are updated to
> read the new format. This is not expected to interfere with normal
> operation, as the primary use for CRCs embedded in the module is
> load-time verification by the kernel. Recording and monitoring of CRCs
> is typically done through Module.symvers.
>
> Selecting RUST and MODVERSIONS is now possible if GENDWARFKSYMS is
> selected, and will implicitly select EXTENDED_MODVERSIONS.
>
> This series depends upon DWARF-based versions [1] and Masahiro's u32
> fixup patch [5].
>
> [1] https://lore.kernel.org/lkml/20241219210736.2990838-20-samitolvanen@g=
oogle.com/
> [2] https://lore.kernel.org/lkml/20240605032120.3179157-1-song@kernel.org=
/
> [3] https://lore.kernel.org/lkml/ZoxbEEsK40ASi1cY@bombadil.infradead.org/
> [4] https://lore.kernel.org/lkml/0b2697fd-7ab4-469f-83a6-ec9ebc701ba0@sus=
e.com/
> [5] https://lore.kernel.org/linux-kbuild/20241228154603.2234284-1-masahir=
oy@kernel.org
>
> Changes in v13:
> - Fixed up missed s32 usage (Thanks Sami).


Applied to linux-kbuild.
Thanks.




--=20
Best Regards
Masahiro Yamada

