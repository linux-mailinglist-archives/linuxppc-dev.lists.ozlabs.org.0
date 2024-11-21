Return-Path: <linuxppc-dev+bounces-3460-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF699D550A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Nov 2024 22:51:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XvX4h2nk9z2xsM;
	Fri, 22 Nov 2024 08:51:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::52f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732225908;
	cv=none; b=EQs1Oh49Y6M1Xz5Ri/DRLkf6zbqRMIcxoMBF6qIlNNL9Zuq86Yqvh4gBuvu2kubD9g0TUfcM8fvlXsVBkA3YlQ42LsRdewRX3kintV29oC7R5rjASOuJ7LE1oXRhUiICYjEkqmfkDLSzfESg3m1D2fotIiWcHDZ7NkzyU5HMBQBtVf2KdRawh8cdtrN2DGpPg5NGV6Z2XvqHwGCTaOqhzXORS15akeDlc59OAXNS9fVFQxErTc4Oj8PB5inLqpNG2ce+s3FZTHbvYfEXPDPNihjRmqexE4DVPpnfE+6OgW5sW188auYKjc+3ozM6t4SvPqdNL9sprAJQBrHjQZL9Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732225908; c=relaxed/relaxed;
	bh=PHKKmDtuZBsmU0fuCBMeHOOxdDx2/H6XhfP9M3Cqc2M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iPxm7wWxDBRH21vcCoGqpWCCy9k69xib/WW3SftbPr76PnE0u9RKNie2z+CDwCt2asYFRcaonA+4reZhmD5+QUJomw8ZIj+7+E5IkZ4fzjFZdOif2fDhUVg/ziz0SfxtXdT6t6QfXua5aL55exrqGgzxZyrQst/qtwovuEKEiicQnOrRvsXdOM6Yham2QRNL7A2u49Bq2K2I0fBjCYgrzV02NFwrwVlMjV3Ts0HBTv+FzPxEpnCLbous4OybEB4Zh7JsvPAi9VnKru0oNX5SMnwMHYefEHmSmNFVwmzHZEcJTdugpqyWb0g8JX2mnZU/i5uujfMZksBSOWRq2iPBkg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=0aQmi2Pv; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com; envelope-from=mmaurer@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=0aQmi2Pv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com; envelope-from=mmaurer@google.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XvX4f2DpZz2xs8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2024 08:51:45 +1100 (AEDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5cfc18d5259so899a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Nov 2024 13:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732225899; x=1732830699; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PHKKmDtuZBsmU0fuCBMeHOOxdDx2/H6XhfP9M3Cqc2M=;
        b=0aQmi2PvY8YuR6+SWMl7FZMmMHd0IDjMWiZFtBPXySTLchIoA2a80y+zFOhTaynkct
         sGevFhAAY0Fh+izVTfiFYIja5sOONuRlRApCN8CBLLvbSLWqTaYioHgMmcrw3Fb3VWUR
         cYbUgorzSdm7mraMOsJs3olGqEStctQLZHgG9USDWEU/wNEAxgaujJu5XCQqmrr2hvdq
         UqaJcRaMnwRl857puNgrpQChkALpl1tEe0gVPlv4g/X8dyj0SF5XJkrr67WI7K+jvRBL
         Zq/TSz02uvJ6JF7L5JG0LwygddIM3jnhpfl/mMcwhdsf4Pooa/csiVwP0Dsi3m5N7dwM
         B3wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732225899; x=1732830699;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PHKKmDtuZBsmU0fuCBMeHOOxdDx2/H6XhfP9M3Cqc2M=;
        b=VNlF66cvPyR7WZ1Qwg3hpncha1bCcUnz8qqszpftAJhO65ctFXSLcLWt+40d36B7WL
         MW5jju5HlxIVrKhdyfXCajkCES7xjcziwrwwLk3Svi6S1eSG1rDtbdiQiLBaWTMxvYRm
         UH+XrZWmIcBLjmoQ0RAQfyYeU+16DP/7V1U04vAopTQm8gbe3WwQvgD4C2f4dBoDuxwk
         yzaY1w15Y7Kb4m8dCwKJCEpX6SLJBYRcQi5e/IzSRHBQ7lwCqIRoRSLuYV/Eidr7xR8B
         bz4+hnjUz9EBZ2vtW2ZRM8ChuUmSTUrMpfYaHr6QmZeT526QkWQ139FDLV0VpwSPWI+5
         9t6w==
X-Forwarded-Encrypted: i=1; AJvYcCVa0RFnqQ9a8Z3qsRYMIU+d/2XAEb4nGO+cNbIa0/Wat80w4VNTsZPvSnsrCK0RNAHwnpxdTcLxkt2SkCY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyfCx4Zs3BiGgE8xR53r5Pq/uV+JH0aHLh5Hg184k5ujfuEjlLw
	wCAp2zWjLho+rSHcH9qlc+LFfnfwezS0xTmEmEC00T3SFJ/XF05q3KTyh/8EWNnz9ptv4ku7biJ
	m4sll+ZSCF3msk5zTV+7IVtFPm7MC3iqSJZoI
X-Gm-Gg: ASbGncvHdgEaEuq81veZaVIx0D7w8XUh6YpIDRrTVdPo4wMnZXTxRbdWwJsgYcSN4CJ
	UzYW6hHvBnE/0CFyVGYinbCJlmaRokLka2Z6dUqI49igXPm1+IPl6cJqi2dixTpC2
X-Google-Smtp-Source: AGHT+IHZXqsbw6LTrWSKQk3j6sgwFD4xI5UHXnS7pvVevPPLF9iib3NRzS9gCFTmnjvbHI8Vhd+KqI0rHViR8+rmNRI=
X-Received: by 2002:aa7:d6cd:0:b0:5cf:bd9a:41ec with SMTP id
 4fb4d7f45d1cf-5d01dcbf0c4mr18135a12.2.1732225899042; Thu, 21 Nov 2024
 13:51:39 -0800 (PST)
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
 <Zy1BVXgnT72Jt_HE@bombadil.infradead.org>
In-Reply-To: <Zy1BVXgnT72Jt_HE@bombadil.infradead.org>
From: Matthew Maurer <mmaurer@google.com>
Date: Thu, 21 Nov 2024 13:51:26 -0800
Message-ID: <CAGSQo03nq5tnqyp8eDZYA7CbjUPZeKs+A33oeSw3znTO9GRF_g@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="000000000000638ddf062773456e"
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

--000000000000638ddf062773456e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 7, 2024 at 2:38=E2=80=AFPM Luis Chamberlain <mcgrof@kernel.org>=
 wrote:
>
> On Wed, Nov 06, 2024 at 02:19:38PM -0800, Matthew Maurer wrote:
> > >
> > > > If booted against an old kernel, it will
> > > > behave as though there is no modversions information.
> > >
> > > Huh? This I don't get. If you have the new libkmod and boot
> > > an old kernel, that should just not break becauase well, long
> > > symbols were not ever supported properly anyway, so no regression.
> >
> > Specifically, if you set NO_BASIC_MODVERSIONS, build a module, and
> > then load said module with a kernel *before* EXTENDED_MODVERSIONS
> > existed, it will see no modversion info on the module to check. This
> > will be true regardless of symbol length.
>
> Isn't that just the same as disabling modverisons?
>
> If you select modversions, you get the options to choose:
>
>   - old modversions
>   - old modversions + extended modversions
>   - extended modversions only

Yes, what I'm pointing out is that kernels before the introduction of
extended modversions will not know how to read extended modversions,
and so they will treat modules with *only* extended modversions as
though they have no modversions.

>
> > > I'm not quite sure I understood your last comment here though,
> > > can you clarify what you meant?
> > >
> > > Anyway, so now that this is all cleared up, the next question I have
> > > is, let's compare a NO_BASIC_MODVERSIONS world now, given that the
> > > userspace requirements aren't large at all, what actual benefits does
> > > using this new extended mod versions have? Why wouldn't a distro end
> > > up preferring this for say a future release for all modules?
> >
> > I think a distro will end up preferring using this for all modules,
> > but was intending to put both in for a transitional period until the
> > new format was more accepted.
>
> The only thing left I think to test is the impact at runtime, and the
> only thing I can think of is first we use find_symbol() on resolve_symbol=
()
> which it took me a while to review and realize that this just uses a
> completely different ELF section, the the ksymtab sections which are spli=
t up
> between the old and the gpl section. But after that we use check_version(=
).
> I suspect the major overhead here is in find_symbol() and that's in no wa=
y shape
> or form affected by your changes, and I also suspect that since the
> way you implemented for_each_modversion_info_ext() is just *one* search
> there shouldn't be any penalty here at all. Given it took *me* a while
> to review all this, I think it would be good for you to also expand your
> cover letter to be crystal clear on these expectations to users and
> developers and if anything expand on the Kconfig / and add documentation
> if we don't document any of this.

I can add a commit extending modules.rst, but it's not clear to me
what piece was surprising here - the existing MODVERSIONS format is
*also* in a separate section. Nothing written in the "Module
Versioning" section has been invalidated that I can see.

Things I could think to add:

* Summary of the internal data format (seems odd, since the previous
one isn't here, and I'd think that an implementation detail anyways)
* A warning about the effects of NO_BASIC_MODVERSIONS (probably better
in Kconfig, isn't in the current changeset because the flag isn't
there)

>
> I'd still like to see you guys test all this with the new TEST_KALLSYMS.

I've attached the results of running TEST_KALLSYMS - it appears to be
irrelevant to performance, as you expected.

>
>   Luis

--000000000000638ddf062773456e
Content-Type: application/octet-stream; name=extended-log
Content-Disposition: attachment; filename=extended-log
Content-Transfer-Encoding: base64
Content-ID: <f_m3rujd550>
X-Attachment-Id: f_m3rujd550

VEFQIHZlcnNpb24gMTMKMS4uMQojIHRpbWVvdXQgc2V0IHRvIDQ1CiMgc2VsZnRlc3RzOiBtb2R1
bGU6IGZpbmRfc3ltYm9sLnNoCiMKIyAgUGVyZm9ybWFuY2UgY291bnRlciBzdGF0cyBmb3IgJy9z
YmluL21vZHByb2JlIHRlc3Rfa2FsbHN5bXNfYic6CiMKIyAgICAgICAgICAgMjg4OTgwMzIgbnMg
ICBkdXJhdGlvbl90aW1lCiMgICAgICAgICAgICAyMzY2MDAwIG5zICAgdXNlcl90aW1lCiMgICAg
ICAgICAgICAgICAgMjA3ICAgICAgcGFnZS1mYXVsdHMKIwojICAgICAgICAwLjAyMDA4NTk5MSBz
ZWNvbmRzIHRpbWUgZWxhcHNlZAojCiMgICAgICAgIDAuMDAyMzY2MDAwIHNlY29uZHMgdXNlcgoj
ICAgICAgICAwLjAwMDAwMDAwMCBzZWNvbmRzIHN5cwojCiMKIwojICBQZXJmb3JtYW5jZSBjb3Vu
dGVyIHN0YXRzIGZvciAnL3NiaW4vbW9kcHJvYmUgdGVzdF9rYWxsc3ltc19iJzoKIwojICAgICAg
ICAgICAyNTMzMzY0MCBucyAgIGR1cmF0aW9uX3RpbWUKIyAgICAgICAgICAgICAgMzIwMDAgbnMg
ICB1c2VyX3RpbWUKIyAgICAgICAgICAgIDIzNTcwMDAgbnMgICBzeXN0ZW1fdGltZQojICAgICAg
ICAgICAgICAgIDIwNyAgICAgIHBhZ2UtZmF1bHRzCiMKIyAgICAgICAgMC4wMjQwODM5NTcgc2Vj
b25kcyB0aW1lIGVsYXBzZWQKIwojICAgICAgICAwLjAwMDAzMjAwMCBzZWNvbmRzIHVzZXIKIyAg
ICAgICAgMC4wMDIzNTcwMDAgc2Vjb25kcyBzeXMKIwojCiMKIyAgUGVyZm9ybWFuY2UgY291bnRl
ciBzdGF0cyBmb3IgJy9zYmluL21vZHByb2JlIHRlc3Rfa2FsbHN5bXNfYic6CiMKIyAgICAgICAg
ICAgMjUzOTg2MDAgbnMgICBkdXJhdGlvbl90aW1lCiMgICAgICAgICAgICAgIDMwMDAwIG5zICAg
dXNlcl90aW1lCiMgICAgICAgICAgICAyMjY5MDAwIG5zICAgc3lzdGVtX3RpbWUKIyAgICAgICAg
ICAgICAgICAyMDggICAgICBwYWdlLWZhdWx0cwojCiMgICAgICAgIDAuMDI0MDk1MjA0IHNlY29u
ZHMgdGltZSBlbGFwc2VkCiMKIyAgICAgICAgMC4wMDAwMzAwMDAgc2Vjb25kcyB1c2VyCiMgICAg
ICAgIDAuMDAyMjY5MDAwIHNlY29uZHMgc3lzCiMKIwpvayAxIHNlbGZ0ZXN0czogbW9kdWxlOiBm
aW5kX3N5bWJvbC5zaAovc2VsZnRlc3RzICMgemNhdCAvcHJvYy9jb25maWcuZ3ogfCBncmVwIEVY
VEVOREVECiMgQ09ORklHX1g4Nl9FWFRFTkRFRF9QTEFURk9STSBpcyBub3Qgc2V0CkNPTkZJR19F
WFRFTkRFRF9NT0RWRVJTSU9OUz15CiMgQ09ORklHX05FVENPTlNPTEVfRVhURU5ERURfTE9HIGlz
IG5vdCBzZXQKQ09ORklHX1NFUklBTF84MjUwX0VYVEVOREVEPXkKL3NlbGZ0ZXN0cyAjCg==
--000000000000638ddf062773456e
Content-Type: application/octet-stream; name=noextend-log
Content-Disposition: attachment; filename=noextend-log
Content-Transfer-Encoding: base64
Content-ID: <f_m3rujd5y1>
X-Attachment-Id: f_m3rujd5y1

VEFQIHZlcnNpb24gMTMKMS4uMQojIHRpbWVvdXQgc2V0IHRvIDQ1CiMgc2VsZnRlc3RzOiBtb2R1
bGU6IGZpbmRfc3ltYm9sLnNoCiMKIyAgUGVyZm9ybWFuY2UgY291bnRlciBzdGF0cyBmb3IgJy9z
YmluL21vZHByb2JlIHRlc3Rfa2FsbHN5bXNfYic6CiMKIyAgICAgICAgICAgMzA0NzczNDggbnMg
ICBkdXJhdGlvbl90aW1lCiMgICAgICAgICAgICAyNDk0MDAwIG5zICAgdXNlcl90aW1lCiMgICAg
ICAgICAgICAgICAgMjA2ICAgICAgcGFnZS1mYXVsdHMKIwojICAgICAgICAwLjAyNDA3ODUyNyBz
ZWNvbmRzIHRpbWUgZWxhcHNlZAojCiMgICAgICAgIDAuMDAyNDk0MDAwIHNlY29uZHMgdXNlcgoj
ICAgICAgICAwLjAwMDAwMDAwMCBzZWNvbmRzIHN5cwojCiMKIwojICBQZXJmb3JtYW5jZSBjb3Vu
dGVyIHN0YXRzIGZvciAnL3NiaW4vbW9kcHJvYmUgdGVzdF9rYWxsc3ltc19iJzoKIwojICAgICAg
ICAgICAyNTI2NDM4NSBucyAgIGR1cmF0aW9uX3RpbWUKIyAgICAgICAgICAgICAgMzQwMDAgbnMg
ICB1c2VyX3RpbWUKIyAgICAgICAgICAgIDIzNTEwMDAgbnMgICBzeXN0ZW1fdGltZQojICAgICAg
ICAgICAgICAgIDIwNyAgICAgIHBhZ2UtZmF1bHRzCiMKIyAgICAgICAgMC4wMjQwODE5ODAgc2Vj
b25kcyB0aW1lIGVsYXBzZWQKIwojICAgICAgICAwLjAwMDAzNDAwMCBzZWNvbmRzIHVzZXIKIyAg
ICAgICAgMC4wMDIzNTEwMDAgc2Vjb25kcyBzeXMKIwojCiMKIyAgUGVyZm9ybWFuY2UgY291bnRl
ciBzdGF0cyBmb3IgJy9zYmluL21vZHByb2JlIHRlc3Rfa2FsbHN5bXNfYic6CiMKIyAgICAgICAg
ICAgMjUzMDA2NDQgbnMgICBkdXJhdGlvbl90aW1lCiMgICAgICAgICAgICAgIDMzMDAwIG5zICAg
dXNlcl90aW1lCiMgICAgICAgICAgICAyMzA3MDAwIG5zICAgc3lzdGVtX3RpbWUKIyAgICAgICAg
ICAgICAgICAyMDcgICAgICBwYWdlLWZhdWx0cwojCiMgICAgICAgIDAuMDI0MTA5NDA5IHNlY29u
ZHMgdGltZSBlbGFwc2VkCiMKIyAgICAgICAgMC4wMDAwMzMwMDAgc2Vjb25kcyB1c2VyCiMgICAg
ICAgIDAuMDAyMzA3MDAwIHNlY29uZHMgc3lzCiMKIwpvayAxIHNlbGZ0ZXN0czogbW9kdWxlOiBm
aW5kX3N5bWJvbC5zaAovc2VsZnRlc3RzICMgemNhdCAvcHJvYy9jb25maWcuZ3ogfCBncmVwIEVY
VEVORAojIENPTkZJR19YODZfRVhURU5ERURfUExBVEZPUk0gaXMgbm90IHNldAojIENPTkZJR19F
WFRFTkRFRF9NT0RWRVJTSU9OUyBpcyBub3Qgc2V0CiMgQ09ORklHX05FVENPTlNPTEVfRVhURU5E
RURfTE9HIGlzIG5vdCBzZXQKQ09ORklHX1NFUklBTF84MjUwX0VYVEVOREVEPXkKL3NlbGZ0ZXN0
cyAjCgo=
--000000000000638ddf062773456e--

