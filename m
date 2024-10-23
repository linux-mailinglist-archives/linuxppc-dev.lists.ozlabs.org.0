Return-Path: <linuxppc-dev+bounces-2530-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 221FB9AD877
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2024 01:32:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XYlhH17Cpz2yJL;
	Thu, 24 Oct 2024 10:32:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::22f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729726351;
	cv=none; b=Kmz242va65CcM8tHTFiuWlBY+Pf7LotwVY0feJkZOQhL6IX8sHvt0KAv5NO61iNi03Do3TClqdIJbkedZIEY6qbywqZQpmjXeGdVoz7oRQqOSe2C0B4sun0E7U9np7HPaeFs8pDi0UYrbqvuX3SreXXOpJzLn10KY2BhdKBebR+HfZLyzbm38KBFDWKuapXLFNG98wYxlQ2kd9yIXp1vwTA9MI/bsjEzE1BFkqJ6iBg83KdthNqTTAcWhquOFRK9v5/N3tXJF9gYjwJLJlMoQOpZhiuwya7X9kouQBEDqnlKaZpUv2/DtbzqsqB7MdBjoskoMOxFN1CooKN0s37vbg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729726351; c=relaxed/relaxed;
	bh=7O1ZviVL7l8ZPRgaRmP3mos5h+mgI4rAgJ9ce08WM7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nwM0hWBRlwZJ1uf3X2AGG922nuCx+QZ+cmSbCLPZ8HGe9H0D4+UNDRVm20bYhzes+EA9ToL/5oPf4kKeZjEilIR65S+pWTjOiJQFYKMqI3QwyI1pH5tegaDd8x2QiVkPNaGwwo2AeJ1l2o2/McB7TghuNiOwL0FMKsynolYil35T1ubojWAW0zlINZa4tc9ByLVcVNsvgDIhnAs07LA2HpxYgjFrnckVmjsv4WMQi36H1djRVA2dd0k7Ncu0EkLbhte/LLTTxwS9qT9kexeaNttqf9QD8rDC2xglBYVliJGb98McWIXPRyQAY6kHS9UFvSgYAwC7U5aBPF7U+MibbQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=M13ur9fB; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=M13ur9fB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XYlhD4LsHz2y8d
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2024 10:32:27 +1100 (AEDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2f75c56f16aso2697661fa.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Oct 2024 16:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1729726343; x=1730331143; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7O1ZviVL7l8ZPRgaRmP3mos5h+mgI4rAgJ9ce08WM7Q=;
        b=M13ur9fBkFgBeHeEmaTTe3aHH6+O8SzdshZf2PrHloEe4BjFMKJp1GqLw8na6CxAeL
         1IOdTJ1zfv0sk6GjOlrP38Oylw16f0+DMJJ5rXfRlI1JowiY/2sUaU4KVxoLhvwa0VLo
         19voTIkVsYaWfkEoeKIENgA+GvzX/lsulrDBc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729726343; x=1730331143;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7O1ZviVL7l8ZPRgaRmP3mos5h+mgI4rAgJ9ce08WM7Q=;
        b=SR+aWxqu00xlgs4raQmLYBGHHDkY0+Dt187L7zuNhklLoXIecvSYqvNgQKMT6o6Yy4
         YyXK0McD9MS/VwK5nCOAI/0o3XVBC4Q1Kf6k7iHbMs+Luxe3KTG0olYzrwtunL4jnAH1
         pdf6tevh+SpzHhqGR9GNerI7gr6du33w0E9yI99R4BuXB18xFUDjL5PEYVXLW0G/yvfQ
         l4vAGq2pSTQJcUB1ifcmU5CwTVDJMeqvBQ5p9bOtvJL2ydC83fbDCNJ+OK4E/O5ttUcK
         urzD5SFz5V/8MuPrAnTM9/J3rwnASmmt/d7XKcZQtmXM1hNXZJmpkRasm6+iTDp/Pcnr
         vOKw==
X-Forwarded-Encrypted: i=1; AJvYcCVhcDZq5QRpzOPx/4ztvyMGHYWpQ8Wh8DWf/jtLpMvMxkgWh3/EnRCOslp8fPIdavfNpV838vxIxm2KdZ4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxhXaJ69qT/LCWGRDPGOdw2z35shPayH2xhQDba0qlVD6K4ZWdq
	MAqtoRm2HnYsTt0Z76NVXedwi5Tc/yFJbh8TkY4UKRWTqskEBb0HITBqKNATJDmZT8729UF28Is
	kyLzNUw==
X-Google-Smtp-Source: AGHT+IGzGxqzTWToQel1zBYkDDJ9VkUKmutACnfWGKUnyIRgJ25e+NhM9w3oom43WGnEL3QkLdjArw==
X-Received: by 2002:a2e:819:0:b0:2fa:dc24:a374 with SMTP id 38308e7fff4ca-2fc9d581de3mr17821431fa.37.1729726342780;
        Wed, 23 Oct 2024 16:32:22 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb9adf8295sm12177401fa.79.2024.10.23.16.32.20
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 16:32:21 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539e13375d3so312185e87.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Oct 2024 16:32:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUN++Mi95LiX8N3gXgJMtygD6iDQDOrQgqHAZUFQpYDtjRgzZNvdQ37dU8BPMSTa1btecyDEdPpBFUeC0g=@lists.ozlabs.org
X-Received: by 2002:a05:6512:b22:b0:539:fcba:cc6d with SMTP id
 2adb3069b0e04-53b1a38d1b9mr2537960e87.42.1729726340142; Wed, 23 Oct 2024
 16:32:20 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lists.ozlabs.org/pipermail/linuxppc-dev/>,
  <https://lore.kernel.org/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <CAHk-=wjAoiCmPSi1OwrJofifmtRYEzecjUeu3UUUELMbJHopUA@mail.gmail.com>
 <CAHk-=wgDrG-aKVGrd-9gQsC0pMs936oo8XEFmEn6ciaT9=nfDg@mail.gmail.com>
 <20241014035436.nsleqolyj3xxysrr@treble> <CAHk-=widMFN2wDeS2K65f8FnW8L6gPZa6CNO4OWkv--0G2LXhw@mail.gmail.com>
 <r5ruxmop7vewd7aq6gu2zve4hfmcu4byhlebygswbqkgz43qfq@rsajyfiypcsd>
 <064d7068-c666-49f0-b7df-774c2e281abc@citrix.com> <20241020224444.zhoscljpe7di5yv3@treble>
 <CAHk-=wikKPKDECP=zBEEnxBB44n-uLsnMoOG=aCy6FwDNc9mxA@mail.gmail.com>
 <20241020231112.erso2jzqwkbin4kh@treble> <CAHk-=wiUaWnHGgusaMOodypgm7bVztMVQkB6JUvQ0HoYJqDNYA@mail.gmail.com>
 <20241023094448.GAZxjFkEOOF_DM83TQ@fat_crate.local> <CAHk-=wgDKPt554sAyzHvW1U+Opx_2Ofu4znjjroMWr1x90SU7A@mail.gmail.com>
 <CAHk-=wjpE4hgOs0q7-jZ+=RsCD=YX9R=V3SCprzg0GOUQfCHNw@mail.gmail.com>
In-Reply-To: <CAHk-=wjpE4hgOs0q7-jZ+=RsCD=YX9R=V3SCprzg0GOUQfCHNw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 23 Oct 2024 16:32:03 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg7cptRdM0qpB5O7Z9GuDPXE5Z3Udm_nkaq2F_A1HUbuQ@mail.gmail.com>
Message-ID: <CAHk-=wg7cptRdM0qpB5O7Z9GuDPXE5Z3Udm_nkaq2F_A1HUbuQ@mail.gmail.com>
Subject: Re: [PATCH] x86/uaccess: Avoid barrier_nospec() in copy_from_user()
To: Borislav Petkov <bp@alien8.de>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	"Kirill A. Shutemov" <kirill@shutemov.name>, x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
	Waiman Long <longman@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Ingo Molnar <mingo@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
	Mark Rutland <mark.rutland@arm.com>
Content-Type: multipart/mixed; boundary="00000000000010f96f06252d4cbb"
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

--00000000000010f96f06252d4cbb
Content-Type: text/plain; charset="UTF-8"

On Wed, 23 Oct 2024 at 13:07, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Well, it boots. The code generation (from strncpy_from_user()) seems ok:

Actually, doing some more sanity checking, that patch is wrong.

Not *badly* wrong, but for some reason I did the "sbb" in 32-bit
(quite intentionally, but it's very wrong: I for some reason mentally
went "32-bit sign-extends to 64-bit")

I'd blame the fact that some of the very earliest x86-64 specs did
indeed do exactly that, but the reality is that it was just a
brainfart.

Anyway, the attached patch seems to actually _really_ work, and DTRT.

But considering that I created a 32-bit mask there for a while, maybe
somebody else should actually verify.

And I guess I should make "__put_user()" do the same thing, just so
that we only have one sequence. It probably doesn't matter for
put_user(), since there's no data leak coming out of it, but if
nothing else, avoiding non-canonical accesses from the kernel for any
non-LAM/LASS setup is probably just a good thing once we have this
logic.

Hmm?

                  Linus

--00000000000010f96f06252d4cbb
Content-Type: text/x-patch; charset="US-ASCII"; name="patch.diff"
Content-Disposition: attachment; filename="patch.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_m2miasu00>
X-Attachment-Id: f_m2miasu00

IGFyY2gveDg2L2luY2x1ZGUvYXNtL3VhY2Nlc3NfNjQuaCB8IDE3ICsrKysrKysrKysrKysrKyst
CiBhcmNoL3g4Ni9rZXJuZWwvY3B1L2NvbW1vbi5jICAgICAgfCAgNyArKysrKysrCiBhcmNoL3g4
Ni9rZXJuZWwvdm1saW51eC5sZHMuUyAgICAgfCAgMSArCiBhcmNoL3g4Ni9saWIvZ2V0dXNlci5T
ICAgICAgICAgICAgfCAgOSArKysrKysrLS0KIDQgZmlsZXMgY2hhbmdlZCwgMzEgaW5zZXJ0aW9u
cygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS91
YWNjZXNzXzY0LmggYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS91YWNjZXNzXzY0LmgKaW5kZXggYWZj
ZThlZTVkN2I3Li41MmUxYTU0OWI5OGEgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2luY2x1ZGUvYXNt
L3VhY2Nlc3NfNjQuaAorKysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS91YWNjZXNzXzY0LmgKQEAg
LTEyLDYgKzEyLDEzIEBACiAjaW5jbHVkZSA8YXNtL2NwdWZlYXR1cmVzLmg+CiAjaW5jbHVkZSA8
YXNtL3BhZ2UuaD4KICNpbmNsdWRlIDxhc20vcGVyY3B1Lmg+CisjaW5jbHVkZSA8YXNtL3J1bnRp
bWUtY29uc3QuaD4KKworLyoKKyAqIFZpcnR1YWwgdmFyaWFibGU6IHRoZXJlJ3Mgbm8gYWN0dWFs
IGJhY2tpbmcgc3RvcmUgZm9yIHRoaXMsCisgKiBpdCBjYW4gcHVyZWx5IGJlIHVzZWQgYXMgJ3J1
bnRpbWVfY29uc3RfcHRyKFVTRVJfUFRSX01BWCknCisgKi8KK2V4dGVybiB1bnNpZ25lZCBsb25n
IFVTRVJfUFRSX01BWDsKIAogI2lmZGVmIENPTkZJR19BRERSRVNTX01BU0tJTkcKIC8qCkBAIC01
OCw3ICs2NSwxNSBAQCBzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgX191bnRhZ2dlZF9hZGRy
X3JlbW90ZShzdHJ1Y3QgbW1fc3RydWN0ICptbSwKICAqIHVzZXJfYWNjZXNzX2JlZ2luIHRoYXQg
Y2FuIGF2b2lkIHRoZSBmZW5jaW5nLiBUaGlzIG9ubHkgd29ya3MKICAqIGZvciBkZW5zZSBhY2Nl
c3NlcyBzdGFydGluZyBhdCB0aGUgYWRkcmVzcy4KICAqLwotI2RlZmluZSBtYXNrX3VzZXJfYWRk
cmVzcyh4KSAoKHR5cGVvZih4KSkoKGxvbmcpKHgpfCgobG9uZykoeCk+PjYzKSkpCitzdGF0aWMg
aW5saW5lIHZvaWQgX191c2VyICptYXNrX3VzZXJfYWRkcmVzcyhjb25zdCB2b2lkIF9fdXNlciAq
cHRyKQoreworCXZvaWQgX191c2VyICpyZXQ7CisJYXNtKCJjbXAgJTEsJTA7IHNiYiAlMCwlMDsg
b3IgJTEsJTAiCisJCToiPXIiIChyZXQpCisJCToiciIgKHB0ciksCisJCSAiMCIgKHJ1bnRpbWVf
Y29uc3RfcHRyKFVTRVJfUFRSX01BWCkpKTsKKwlyZXR1cm4gcmV0OworfQogI2RlZmluZSBtYXNr
ZWRfdXNlcl9hY2Nlc3NfYmVnaW4oeCkgKHsJCQkJXAogCV9fYXV0b190eXBlIF9fbWFza2VkX3B0
ciA9ICh4KTsJCQkJXAogCV9fbWFza2VkX3B0ciA9IG1hc2tfdXNlcl9hZGRyZXNzKF9fbWFza2Vk
X3B0cik7CQlcCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rZXJuZWwvY3B1L2NvbW1vbi5jIGIvYXJj
aC94ODYva2VybmVsL2NwdS9jb21tb24uYwppbmRleCBmMTA0MGNiNjQ4NDEuLjhlZTY1NzlmNjk0
YiAxMDA2NDQKLS0tIGEvYXJjaC94ODYva2VybmVsL2NwdS9jb21tb24uYworKysgYi9hcmNoL3g4
Ni9rZXJuZWwvY3B1L2NvbW1vbi5jCkBAIC02OSw2ICs2OSw3IEBACiAjaW5jbHVkZSA8YXNtL3Nl
di5oPgogI2luY2x1ZGUgPGFzbS90ZHguaD4KICNpbmNsdWRlIDxhc20vcG9zdGVkX2ludHIuaD4K
KyNpbmNsdWRlIDxhc20vcnVudGltZS1jb25zdC5oPgogCiAjaW5jbHVkZSAiY3B1LmgiCiAKQEAg
LTIzODksNiArMjM5MCwxMiBAQCB2b2lkIF9faW5pdCBhcmNoX2NwdV9maW5hbGl6ZV9pbml0KHZv
aWQpCiAJYWx0ZXJuYXRpdmVfaW5zdHJ1Y3Rpb25zKCk7CiAKIAlpZiAoSVNfRU5BQkxFRChDT05G
SUdfWDg2XzY0KSkgeworCQl1bnNpZ25lZCBsb25nIFVTRVJfUFRSX01BWCA9IFRBU0tfU0laRV9N
QVg7CisKKwkJaWYgKGNwdV9mZWF0dXJlX2VuYWJsZWQoWDg2X0ZFQVRVUkVfTEFNKSkKKwkJCVVT
RVJfUFRSX01BWCA9ICgxdWwgPDwgNjMpIC0gUEFHRV9TSVpFOworCQlydW50aW1lX2NvbnN0X2lu
aXQocHRyLCBVU0VSX1BUUl9NQVgpOworCiAJCS8qCiAJCSAqIE1ha2Ugc3VyZSB0aGUgZmlyc3Qg
Mk1CIGFyZWEgaXMgbm90IG1hcHBlZCBieSBodWdlIHBhZ2VzCiAJCSAqIFRoZXJlIGFyZSB0eXBp
Y2FsbHkgZml4ZWQgc2l6ZSBNVFJScyBpbiB0aGVyZSBhbmQgb3ZlcmxhcHBpbmcKZGlmZiAtLWdp
dCBhL2FyY2gveDg2L2tlcm5lbC92bWxpbnV4Lmxkcy5TIGIvYXJjaC94ODYva2VybmVsL3ZtbGlu
dXgubGRzLlMKaW5kZXggNjcyNmJlODliN2E2Li5iOGM1NzQxZDJmYjQgMTAwNjQ0Ci0tLSBhL2Fy
Y2gveDg2L2tlcm5lbC92bWxpbnV4Lmxkcy5TCisrKyBiL2FyY2gveDg2L2tlcm5lbC92bWxpbnV4
Lmxkcy5TCkBAIC0zNTgsNiArMzU4LDcgQEAgU0VDVElPTlMKICNlbmRpZgogCiAJUlVOVElNRV9D
T05TVF9WQVJJQUJMRVMKKwlSVU5USU1FX0NPTlNUKHB0ciwgVVNFUl9QVFJfTUFYKQogCiAJLiA9
IEFMSUdOKFBBR0VfU0laRSk7CiAKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2xpYi9nZXR1c2VyLlMg
Yi9hcmNoL3g4Ni9saWIvZ2V0dXNlci5TCmluZGV4IGQwNjZhZWNmOGFlYi4uNDM1N2VjMmEwYmZj
IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9saWIvZ2V0dXNlci5TCisrKyBiL2FyY2gveDg2L2xpYi9n
ZXR1c2VyLlMKQEAgLTM5LDggKzM5LDEzIEBACiAKIC5tYWNybyBjaGVja19yYW5nZSBzaXplOnJl
cQogLmlmIElTX0VOQUJMRUQoQ09ORklHX1g4Nl82NCkKLQltb3YgJXJheCwgJXJkeAotCXNhciAk
NjMsICVyZHgKKwltb3ZxICQweDAxMjM0NTY3ODlhYmNkZWYsJXJkeAorICAxOgorICAucHVzaHNl
Y3Rpb24gcnVudGltZV9wdHJfVVNFUl9QVFJfTUFYLCJhIgorCS5sb25nIDFiIC0gOCAtIC4KKyAg
LnBvcHNlY3Rpb24KKwljbXAgJXJheCwgJXJkeAorCXNiYiAlcmR4LCAlcmR4CiAJb3IgJXJkeCwg
JXJheAogLmVsc2UKIAljbXAgJFRBU0tfU0laRV9NQVgtXHNpemUrMSwgJWVheAo=
--00000000000010f96f06252d4cbb--

