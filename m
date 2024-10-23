Return-Path: <linuxppc-dev+bounces-2525-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F919AD498
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Oct 2024 21:18:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XYf2j0NKcz2yYf;
	Thu, 24 Oct 2024 06:18:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::535"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729711084;
	cv=none; b=RRekJTeQEvLbYSWEsEbvsvIv8lH+F3Ko9Ai/pm3eCiRqiKhHFnHMi3jq/b20ewSdtdzbudljFphHa9/dALxC87dnIITzi+Foosc2XhXWHzgwJ5uzP8KReE8j4EekVGRAW2PJGkEsUzKsy9v+q3BDSyhF7cq4j7Dv+jwkFEwvD6MF+U51Wc2uJOXP1b3yyIFG8y/1mwa2cadHDdf/JMzkRJ11lwS1pRq8P/X65ATtAZI/hcRHqRiGYRb/VgkcFmBQg2SkDlXRikvCIkgJNZPL3qILm/Qb9GY8RNT7M0KcDh7CCndLkYL5m6VEnMgjq1P44hYvQ0rvrQGBKaRGgnb0xA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729711084; c=relaxed/relaxed;
	bh=Z072IXY9lqZmh30sACzCZjysYvyuUgs/Jx7yfqlTebA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iCOanuRgFdkaH1RehKBzvyVwTuxMYdIzWxOnzvGzaxmlIQbK4IUmfjoNtvDPAt9+3FPqC6VMH3hG+Yhp61ls6/3mIrzgdnX9vxZVlfHUB1pQz32O12i6YJCEp1vudfiCun73P+F+2xrvR2Ga850GmoDI5fC80Kw9KXJ6O2HtSPZ1Gff0RsAwVNiavWqJ1hrfyk1/hvgSmqeumWoIxaPP7P/oTWgwo3dYGpBqSrABZbP+3eouwKZTzqqKR7XweIgiBGiv4pPwd5e1m0q9BgJR5Tp0xgPFs8UiXNjhyWOD9+4udc5UJz/7fj2PswrR/nMvq5WAhfNN6tA1W1DG3r9tCQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=PqQZzR19; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=PqQZzR19;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XYf2g0Crdz2yRd
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2024 06:18:01 +1100 (AEDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5c9c28c1ecbso185816a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Oct 2024 12:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1729711075; x=1730315875; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Z072IXY9lqZmh30sACzCZjysYvyuUgs/Jx7yfqlTebA=;
        b=PqQZzR19FkJRNl0a9H7oJ+bJS2t9cYZYJsfyJUlBsJ9k9p3vU5hHAdR/BzVcLvva9s
         xpkrYu5w8YN/tz1+sbpde8g4hnKtzsA1pqUjK/2CAxg76WENR7LjeI/SrQ7wUtPFdA8k
         ayZkV1gx5BXmFWadE7uglY17pJvi5oyvvCXS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729711075; x=1730315875;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z072IXY9lqZmh30sACzCZjysYvyuUgs/Jx7yfqlTebA=;
        b=EEWu6/f+zL5ugeS/fkVPE7hcpP5WGxyhHwd2cMOTjKZFRyMyMrHLwH3emv1R2r8cOb
         AFis6qXcNrZX9CDJJuZcKyylGpy1U9C7sW/NwbV9Gi8261DZ3EPOwWzxnYsPgiDEOr9w
         WQYbcHCbdEhttsf6sNHlD5Q97g6s1DjqpzNsQV2aRkWrbXxg3v5YrrhG5cxxIQH+CzUF
         iduuHQanUdcNmWcNJoAiLS5fmgaMaYJpLPiy9vrVZbLhk1z+lOP308gXCo3++Elm3nA+
         TI6fHoKHnSkV65u1TrnpTpdRy/PCHUSIaH2mi6cUITMiHStHDmD0gu6sTxecN0UVm+pk
         nWnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBz3k4Ep302iptnHYgXwQFi1sl3wnl+X+teOjW4118VMcHkFbNnivqZxL+j3QmdHtICiuv1YfZKGSg3eE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzllOAmrKhTW+r+Vfd9UGt8If171PrC93oY8y2+pdIg0+64gX92
	2EipuaGZGJybKvn7R6u7jHPdW7tEpwFiJusmza6qBm0CWNW/lqyaw2Tl9d9fB4MnfjRakSibE1O
	yeDLyNw==
X-Google-Smtp-Source: AGHT+IEPsKJZhKevqdEEhrmP2FhGMqBQG1NPDtMF1i6JRcDaMmrUj5naH57BkRKwfqRq1apoGP6vEA==
X-Received: by 2002:a05:6402:2104:b0:5cb:6712:6089 with SMTP id 4fb4d7f45d1cf-5cb8ac585f0mr3222307a12.7.1729711075269;
        Wed, 23 Oct 2024 12:17:55 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb6696b553sm4808166a12.3.2024.10.23.12.17.54
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 12:17:54 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a9a0ec0a94fso9179566b.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Oct 2024 12:17:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVeG++8D5UiSrRCGhGMJJPSDs6C8Es5Hub3GF2D2ZE8lcVjDiJTS8FoEqUAF2nBB0vSi+Qa/TIhCHsgNDw=@lists.ozlabs.org
X-Received: by 2002:a17:907:3fa5:b0:a9a:422:ec7 with SMTP id
 a640c23a62f3a-a9abf8a153cmr357743566b.32.1729711073826; Wed, 23 Oct 2024
 12:17:53 -0700 (PDT)
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
 <20241023094448.GAZxjFkEOOF_DM83TQ@fat_crate.local>
In-Reply-To: <20241023094448.GAZxjFkEOOF_DM83TQ@fat_crate.local>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 23 Oct 2024 12:17:35 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgDKPt554sAyzHvW1U+Opx_2Ofu4znjjroMWr1x90SU7A@mail.gmail.com>
Message-ID: <CAHk-=wgDKPt554sAyzHvW1U+Opx_2Ofu4znjjroMWr1x90SU7A@mail.gmail.com>
Subject: Re: [PATCH] x86/uaccess: Avoid barrier_nospec() in copy_from_user()
To: Borislav Petkov <bp@alien8.de>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	"Kirill A. Shutemov" <kirill@shutemov.name>, x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
	Waiman Long <longman@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Ingo Molnar <mingo@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
	Mark Rutland <mark.rutland@arm.com>
Content-Type: multipart/mixed; boundary="0000000000001f0319062529bef0"
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

--0000000000001f0319062529bef0
Content-Type: text/plain; charset="UTF-8"

On Wed, 23 Oct 2024 at 02:45, Borislav Petkov <bp@alien8.de> wrote:
>
> So I was able to get some info: CLAC/STAC in everything Zen4 and older is
> serializing so there's no issue there.
>
> Zen5 is a different story and AC is being renamed there and thus,
> non-serializing. So we'd need to do something there, perhaps something
> like Josh's patch...
>
> But the good thing is we can alternative it out only for those machines, apart
> from the rest.

Hmm. The problem with alternatives is that it gets increasingly ugly
when there are more than two of them.

And even doing a single alternative with some "don't do this unless X"
then means either extra no-ops or some horrid static branch.

Now, if we ignore LAM, we only have two cases (LA48 vs LA57), but we
know that even if we disable LAM until we do the LASS support, that
third case *will* happen.

Finally - the main reason to use the sign bit is that you don't need
some big constant - and the code is small, so the "shift right by 63
and or" is just two instructions and a couple of bytes.

But once you have an alternative *with* a big constant, that advantage
just goes away because you'll just replace the size the constant takes
up with no-ops instead.

So then you might as well just _always_ use a constant.

Which makes me wonder if we can't just use the runtime-const
infrastructure instead. That has the advantage that you can have any
number of different constants and it won't complicate the usage sites,
and you can easily just update the constant at init time with
runtime_const_init() to an arbitrary value.

So then LAM support becomes just updating the value for
runtime_const_init() - none of the code changes, and no different
alternatives cases.

Something like the attached, in other words. Note that this actually does that

+               if (cpu_feature_enabled(X86_FEATURE_LAM))
+                       USER_PTR_MAX = (1ul << 63) - PAGE_SIZE;

partly to show it as docs, and partly because we should just clear
that X86_FEATURE_LAM bit if LASS isn't set, so I think it's right
anyway.

NOTE! This is obviously untested and I didn't check that it does the
cmp/sbb/or the right way around.

Also, it's worth noting that the cmp/sbb/or sequence (if I *did* get
it the right way around) will set all bits only if the original
address is *larger* than USER_PTR_MAX, but we already subtract
PAGE_SIZE from the actual hardware maximum due to other errata, so
that's fine.

IOW, it will turn USER_PTR_MAX and anything less into itself, but
USER_PTR_MAX+1 (and above) becomes all ones.

                   Linus

--0000000000001f0319062529bef0
Content-Type: text/x-patch; charset="US-ASCII"; name="patch.diff"
Content-Disposition: attachment; filename="patch.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_m2m98m2j0>
X-Attachment-Id: f_m2m98m2j0

IGFyY2gveDg2L2luY2x1ZGUvYXNtL3VhY2Nlc3NfNjQuaCB8IDE3ICsrKysrKysrKysrKysrKyst
CiBhcmNoL3g4Ni9rZXJuZWwvY3B1L2NvbW1vbi5jICAgICAgfCAgNiArKysrKysKIGFyY2gveDg2
L2tlcm5lbC92bWxpbnV4Lmxkcy5TICAgICB8ICAxICsKIGFyY2gveDg2L2xpYi9nZXR1c2VyLlMg
ICAgICAgICAgICB8ICA5ICsrKysrKystLQogNCBmaWxlcyBjaGFuZ2VkLCAzMCBpbnNlcnRpb25z
KCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL3Vh
Y2Nlc3NfNjQuaCBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL3VhY2Nlc3NfNjQuaAppbmRleCBhZmNl
OGVlNWQ3YjcuLmRmMTQ2OGFkYTNlZCAxMDA2NDQKLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20v
dWFjY2Vzc182NC5oCisrKyBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL3VhY2Nlc3NfNjQuaApAQCAt
MTIsNiArMTIsMTMgQEAKICNpbmNsdWRlIDxhc20vY3B1ZmVhdHVyZXMuaD4KICNpbmNsdWRlIDxh
c20vcGFnZS5oPgogI2luY2x1ZGUgPGFzbS9wZXJjcHUuaD4KKyNpbmNsdWRlIDxhc20vcnVudGlt
ZS1jb25zdC5oPgorCisvKgorICogVmlydHVhbCB2YXJpYWJsZTogdGhlcmUncyBubyBhY3R1YWwg
YmFja2luZyBzdG9yZSBmb3IgdGhpcywKKyAqIGl0IGNhbiBwdXJlbHkgYmUgdXNlZCBhcyAncnVu
dGltZV9jb25zdF9wdHIoVVNFUl9QVFJfTUFYKScKKyAqLworZXh0ZXJuIHVuc2lnbmVkIGxvbmcg
VVNFUl9QVFJfTUFYOwogCiAjaWZkZWYgQ09ORklHX0FERFJFU1NfTUFTS0lORwogLyoKQEAgLTU4
LDcgKzY1LDE1IEBAIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyBfX3VudGFnZ2VkX2FkZHJf
cmVtb3RlKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLAogICogdXNlcl9hY2Nlc3NfYmVnaW4gdGhhdCBj
YW4gYXZvaWQgdGhlIGZlbmNpbmcuIFRoaXMgb25seSB3b3JrcwogICogZm9yIGRlbnNlIGFjY2Vz
c2VzIHN0YXJ0aW5nIGF0IHRoZSBhZGRyZXNzLgogICovCi0jZGVmaW5lIG1hc2tfdXNlcl9hZGRy
ZXNzKHgpICgodHlwZW9mKHgpKSgobG9uZykoeCl8KChsb25nKSh4KT4+NjMpKSkKK3N0YXRpYyBp
bmxpbmUgdm9pZCBfX3VzZXIgKm1hc2tfdXNlcl9hZGRyZXNzKGNvbnN0IHZvaWQgX191c2VyICpw
dHIpCit7CisJdm9pZCBfX3VzZXIgKnJldDsKKwlhc20oImNtcCAlMSwlMDsgc2JiICVrMCwlazA7
IG9yICUxLCUwIgorCQk6Ij1yIiAocmV0KQorCQk6InIiIChwdHIpLAorCQkgIjAiIChydW50aW1l
X2NvbnN0X3B0cihVU0VSX1BUUl9NQVgpKSk7CisJcmV0dXJuIHJldDsKK30KICNkZWZpbmUgbWFz
a2VkX3VzZXJfYWNjZXNzX2JlZ2luKHgpICh7CQkJCVwKIAlfX2F1dG9fdHlwZSBfX21hc2tlZF9w
dHIgPSAoeCk7CQkJCVwKIAlfX21hc2tlZF9wdHIgPSBtYXNrX3VzZXJfYWRkcmVzcyhfX21hc2tl
ZF9wdHIpOwkJXApkaWZmIC0tZ2l0IGEvYXJjaC94ODYva2VybmVsL2NwdS9jb21tb24uYyBiL2Fy
Y2gveDg2L2tlcm5lbC9jcHUvY29tbW9uLmMKaW5kZXggZjEwNDBjYjY0ODQxLi45ZDQxOWRjMWRm
MTIgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2tlcm5lbC9jcHUvY29tbW9uLmMKKysrIGIvYXJjaC94
ODYva2VybmVsL2NwdS9jb21tb24uYwpAQCAtNjksNiArNjksNyBAQAogI2luY2x1ZGUgPGFzbS9z
ZXYuaD4KICNpbmNsdWRlIDxhc20vdGR4Lmg+CiAjaW5jbHVkZSA8YXNtL3Bvc3RlZF9pbnRyLmg+
CisjaW5jbHVkZSA8YXNtL3J1bnRpbWUtY29uc3QuaD4KIAogI2luY2x1ZGUgImNwdS5oIgogCkBA
IC0yMzg5LDYgKzIzOTAsMTEgQEAgdm9pZCBfX2luaXQgYXJjaF9jcHVfZmluYWxpemVfaW5pdCh2
b2lkKQogCWFsdGVybmF0aXZlX2luc3RydWN0aW9ucygpOwogCiAJaWYgKElTX0VOQUJMRUQoQ09O
RklHX1g4Nl82NCkpIHsKKwkJdW5zaWduZWQgbG9uZyBVU0VSX1BUUl9NQVggPSBUQVNLX1NJWkVf
TUFYOworCisJCWlmIChjcHVfZmVhdHVyZV9lbmFibGVkKFg4Nl9GRUFUVVJFX0xBTSkpCisJCQlV
U0VSX1BUUl9NQVggPSAoMXVsIDw8IDYzKSAtIFBBR0VfU0laRTsKKwkJcnVudGltZV9jb25zdF9p
bml0KHB0ciwgVVNFUl9QVFJfTUFYKTsKIAkJLyoKIAkJICogTWFrZSBzdXJlIHRoZSBmaXJzdCAy
TUIgYXJlYSBpcyBub3QgbWFwcGVkIGJ5IGh1Z2UgcGFnZXMKIAkJICogVGhlcmUgYXJlIHR5cGlj
YWxseSBmaXhlZCBzaXplIE1UUlJzIGluIHRoZXJlIGFuZCBvdmVybGFwcGluZwpkaWZmIC0tZ2l0
IGEvYXJjaC94ODYva2VybmVsL3ZtbGludXgubGRzLlMgYi9hcmNoL3g4Ni9rZXJuZWwvdm1saW51
eC5sZHMuUwppbmRleCA2NzI2YmU4OWI3YTYuLmI4YzU3NDFkMmZiNCAxMDA2NDQKLS0tIGEvYXJj
aC94ODYva2VybmVsL3ZtbGludXgubGRzLlMKKysrIGIvYXJjaC94ODYva2VybmVsL3ZtbGludXgu
bGRzLlMKQEAgLTM1OCw2ICszNTgsNyBAQCBTRUNUSU9OUwogI2VuZGlmCiAKIAlSVU5USU1FX0NP
TlNUX1ZBUklBQkxFUworCVJVTlRJTUVfQ09OU1QocHRyLCBVU0VSX1BUUl9NQVgpCiAKIAkuID0g
QUxJR04oUEFHRV9TSVpFKTsKIApkaWZmIC0tZ2l0IGEvYXJjaC94ODYvbGliL2dldHVzZXIuUyBi
L2FyY2gveDg2L2xpYi9nZXR1c2VyLlMKaW5kZXggZDA2NmFlY2Y4YWViLi4yMDJkNjhlM2ZlYTAg
MTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2xpYi9nZXR1c2VyLlMKKysrIGIvYXJjaC94ODYvbGliL2dl
dHVzZXIuUwpAQCAtMzksOCArMzksMTMgQEAKIAogLm1hY3JvIGNoZWNrX3JhbmdlIHNpemU6cmVx
CiAuaWYgSVNfRU5BQkxFRChDT05GSUdfWDg2XzY0KQotCW1vdiAlcmF4LCAlcmR4Ci0Jc2FyICQ2
MywgJXJkeAorCW1vdnEgJDB4MDEyMzQ1Njc4OWFiY2RlZiwlcmR4CisgIDE6CisgIC5wdXNoc2Vj
dGlvbiBydW50aW1lX3B0cl9VU0VSX1BUUl9NQVgsImEiCisJLmxvbmcgMWIgLSA4IC0gLgorICAu
cG9wc2VjdGlvbgorCWNtcCAlcmF4LCAlcmR4CisJc2JiICVlZHgsICVlZHgKIAlvciAlcmR4LCAl
cmF4CiAuZWxzZQogCWNtcCAkVEFTS19TSVpFX01BWC1cc2l6ZSsxLCAlZWF4Cg==
--0000000000001f0319062529bef0--

