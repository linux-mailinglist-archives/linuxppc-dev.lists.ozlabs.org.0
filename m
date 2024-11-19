Return-Path: <linuxppc-dev+bounces-3425-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D1E9D1C1E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2024 01:09:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XslHN21f4z2ysW;
	Tue, 19 Nov 2024 11:09:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::52a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731974992;
	cv=none; b=JRrTm5UCYmXrDAmhMzVlxJsRhCVujppKSMUaq2DI2DY4xmv9KsTFG91augV9CXlcSf4Y3wnSlQ295ooPjIyyGIdG0s4mdOlpk1VaH1plJTfY4Us+NFmQX0lgS9sPoZ2lfdvQ2CLm4RPSxOmRQnlouIK0unuCXRZ+YrC7u23dgP8uS984RGqynCHI6gyJje83Vd0/EV2lHmFT5TBckoHJXMI+cbGfqF9CH2kUXJ4/f5whvM7ZT71IEKvFP9nbsNbpoCEJQ35UO7UNPDzO+zUvWBD1RoD+3I9tiCsRlpwI3hYI2w4UQpu/1oKnVnWFoh5HzvDnoPTq5nEjqLgWH2f9ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731974992; c=relaxed/relaxed;
	bh=2joQyxA/A/Ix50bwDrphRLZe1ZN4vLdUciNkknx5Y1w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aWj0kNPOhKbg3oAujWVRybsamU7ZAqr/N2zFJbpFZ2BWQ83RWDY9SGlEPzCA/pl7rOHI5IEbW7aZmBLIix2hIrybNjJNb5ov705zwUDR90+rwTnHjEZ7FVUwUAjTlUoqZiZ6Awsz7K5Ac5qYmmKJK0FDsAKnmj0UR1SVDoO36hZJxVYXxNLpiTKcc2JuICwWLdxzTYyvXlzfNNlOx8f3eg6ZKEQzeSDvnH1MBq/rkch7gdvO/Uzj8Rajtarj/4tzyI2+O2SFDO7OhutzNL9BbrVWQfSiQG15jKIWn+MfrSRNRHUjJLilJn1rrAXC1/LBGuue2jovz04juw1JIxX+mQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=sdju8xgM; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com; envelope-from=mmaurer@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=sdju8xgM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com; envelope-from=mmaurer@google.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XslHL4q7Fz2ysB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2024 11:09:49 +1100 (AEDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5cfc264b8b6so4091a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2024 16:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731974985; x=1732579785; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2joQyxA/A/Ix50bwDrphRLZe1ZN4vLdUciNkknx5Y1w=;
        b=sdju8xgM7Fb4eyWh6uSe/wS+hrLaNrepl8kDAHDzJhZRbaWMmhReylJsp81OmOvxf9
         ekHBalzX8MskHPvbq4SjOr7vtIDi62lM0SsyMiKjRmhcp/20H1EhRkQeeRQBK4zPYIvI
         8KeUHhT3kU6i2is0WWLtRVJHcgis5A/8fUYedW+H3RCKdUeqJd4SZx+AcrfGfDrb/lhx
         fnYuti4c+Rwx6qAl0SkA0vYBfxVSJ4N+5YK3qrwfJruvjxcwAf4wIUnp8LCH4NfD4Tde
         Fpd+jYSgjsDiqhd7L0Uqy0I1DiYwg91Htvko3WJTHkZVdkEmev/IM7VbJAEswPCJ2OMk
         K6ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731974985; x=1732579785;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2joQyxA/A/Ix50bwDrphRLZe1ZN4vLdUciNkknx5Y1w=;
        b=uzk8zcvKiEsUBKzqncwiRc/35FbPpHD3S1EnofmfGn41rMTL9VR7zz5rJGC6yXM0m8
         vUUYKEaXYyh3uJLXCyPgvSQXHQxxUHpxj0Zf3KesLu0eM4Ycz0b2YTjNZaZq8UoVMRFz
         p7y08VnnTq2iDlIxfBVwobkY2ZIp+YjPa3FvjV3RR2I5toa8qd3jabPgIyeUGUm6MZKy
         14dQtgDOVgrzBGAKqLKA2fkDRxR5vGVdveLqNEZlTDplUsDQ0WADZ1y7y8C2Sx/huz96
         NS07IZ8zGImIIXg6xb/tBBf2jjZF9YENKqRTow91W4Q3PFYNDEC9k9HobEPfGjAcARhY
         FkCw==
X-Forwarded-Encrypted: i=1; AJvYcCXOrRgyE6KCbSXqVvKQWvjsVelpFw+hf6sxytdx026gtx+OBNWZ035FzSpFLpl9IqUKM/tGRUF0LtPk2uU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxA8pjA0xSi7mxYf1TeegzI1fc2Sl7mArmd/cHgApmV+uDuUEst
	k+Br65fduPstaeB2Z8VRlQrxa082+Rrhu2cx88XuYgG6s8xnr5Ik553YSzg/ORZZ7bDSJ4MMhv3
	EE+nN3Ut6OtNOeUvw8ZB/thxrkdCgDWpjAmiH
X-Gm-Gg: ASbGnctBtVAu9j/v98mQ957q2itz52Lr5asrQE9xtsVLDd8YBUR7eSkd8k6GsB4jMnx
	NOe66U1mr7C9FrAzLRIOGxjwePxLbx/+Cevp/xszb50PyrWF/BbZeemp3NlTOtA==
X-Google-Smtp-Source: AGHT+IGFkoWOhwex/vXz0phxng/cuRxB+IRiCctA7Y89o5ijfhkRJftBIN3eR6qiPieo/jVpc0lu+QpSWPIlthCtl3k=
X-Received: by 2002:a05:6402:1351:b0:5cf:bd9a:41ec with SMTP id
 4fb4d7f45d1cf-5cfdec244d3mr31183a12.2.1731974985273; Mon, 18 Nov 2024
 16:09:45 -0800 (PST)
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
References: <20241030-extended-modversions-v8-0-93acdef62ce8@google.com>
 <20241030-extended-modversions-v8-2-93acdef62ce8@google.com>
 <ZyNr--iMz_6Fj4yq@bombadil.infradead.org> <CAGSQo00F07viDHQkwBS8_1-THxJHYwx9VkS=TXC5rz3i8zSZSw@mail.gmail.com>
 <ZyVDv0mTm3Bgh1BR@bombadil.infradead.org> <CAGSQo02uDZ5QoRMPOn=3Fa9g5d+VPfKW-vmSsS2H+pOdPYCBFw@mail.gmail.com>
 <ZyrRYUD0K1f7SwWg@bombadil.infradead.org> <CAGSQo03+1WjUVj-iQ6zdOST6z=p+=OqS2Xk_c4ZUdHOsxa7g2w@mail.gmail.com>
 <Zy1BVXgnT72Jt_HE@bombadil.infradead.org> <Zzu-wfGqbuAm24yg@bombadil.infradead.org>
In-Reply-To: <Zzu-wfGqbuAm24yg@bombadil.infradead.org>
From: Matthew Maurer <mmaurer@google.com>
Date: Mon, 18 Nov 2024 16:09:34 -0800
Message-ID: <CAGSQo033fha6tj7sU8se4kbNfYD_rm5sx6-hpF9s8SfcgWH3Tg@mail.gmail.com>
Subject: Re: [PATCH v8 2/3] modpost: Produce extended MODVERSIONS information
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, Lucas De Marchi <lucas.de.marchi@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Petr Pavlu <petr.pavlu@suse.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

> Thinking about this some more, if we're going down enabling a new
> option, it seems to beg the question if the old *two* ksymtab sections
> could just be folded into the a new one where the "gpl only" thing
> becomes just one "column" as you call it. Reasons I ask, it seems like
> we're duplicating symbol names on ksymtab and for modeversions. Could
> you review this a bit?

 Short answer: We could do this, but I don't necessarily think it's a good idea.

ksymtab and modversions aren't duplicating names even with this patch
series - We have two different formats, one for importing symbols, and
one for exporting them. `__ksymtab`, `__ksymtab_gpl`, and
`__ksymtab_strings` are used to export symbols. `__versions` or the
new `__version_ext_names` and `__version_ext_crcs` are used to import
them. For this reason, in any given compilation unit, a string should
only appear either in the ksymtab (providing it), or in versions
(consuming it).

There also isn't as much immediate technical need for that kind of
rework of the ksymtab format - ksymtab uses a string table for their
names, so the "long name support" that extended modversions provides
to modversions is already present in ksymtab.

Combined, this means that there would be few technical benefits to
this - the primary potential benefit I could see to something like
this would be code complexity reduction, which is a bit of a matter of
personal taste, and mine might not match others'.

However, we could do some things similar to what's going on here:
A. We could try to unify versions and ksymtab (this seems most viable,
but the change in meaning of this data structure has me wary)
B. We could make ksymtab use columnar storage for more things - it
already does so for CRCs, we could theoretically make any or all of
licensing, namespaces, or symbol values columnar.

With the caveat that I am not convinced this restructuring is worth
the churn, the way I would do A would be:

1. Add a field to the `kernel_symbol` that indicates whether the
symbol is import/export (or possibly re-use `value` with a 0 value
after linker resolution to mean "import" instead of export).
2. Generate `kernel_symbol` entries for imported symbols, not just
exported ones.
3. Read `kcrctab` for import symbols to figure out what the expected
crc value is when importing, rather than using versions.
4. Stop generating/reading any of `__versions`, `__version_ext_names`,
`__versions_ext_crcs`, etc.

There are two downsides I can see to this:
1. You cannot make this backwards compatible with existing `kmod`.
(This was the argument given against just enlarging MODVERSIONS symbol
names.)
2. It's hard to be certain that we know about all users of `ksymtab`
in order to ensure they all know the new convention around imported vs
exported symbols.

I think that B would actually make things worse because symbols always
today always have a value, a namespace, a name, and a license. The
only thing that's optional is the CRC, and that's already columnar.
Making the other ones columnar would hurt locality. We'd still need
the strtab sections, or we'd end up with many copies of each
namespace, where today that should get deduped down by the linker.
Columns are good for things that are extensions, optional, or variable
length.

If there are other reasons *for* doing this that I'm not aware of,
what I'd do would be:
1. Use the name as the primary index, same as modversions.
2. Split each other piece into its own column, with a joint iterator.
3. Convert license into a column, with an enum value (currently only
fully exported or GPL).
4. Replace places in the coe where a `struct kernel_symbol *` is used
today with an iterator over the joint columns.

Again, to reiterate, I *do not* think that B is a good idea. A might
be, but the improvement seems sufficiently marginal to me that I don't
know if it's worth the churn.

