Return-Path: <linuxppc-dev+bounces-3505-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B109D647B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Nov 2024 20:13:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xw4Wh3XsNz2yD5;
	Sat, 23 Nov 2024 06:13:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::22b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732302816;
	cv=none; b=BQj0A60/c9ol4RglBWJyijcydnm8gnYDtrQ6OtmInsD/lG5X34Ljfgi/ikHhUpY4SVZQNtON9BJ9Td0f46HXXnfqtLe+x+yj52yUl9YkAmMA10viceLy4d2Y+l8vj+sxbxwSY0Niik13y5QHtXHEYlfaPu80mcOBuvKYxIs4ABGC5GhzR2gKElV6tWGQgPwN5+YaKGdGtdFBgwrF35CEptZHyxOF6G2XjzavHHHNXzVSoAbc2fJ2ti7hAuE6SA2ROZEXuv/JqaBkc4xug1A8sF8nTxpZGY6JrMN30aduSWuSB8pny9aGpB3n6M5E9Zx8FOzWRtKB3u9jQjaba3oXPg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732302816; c=relaxed/relaxed;
	bh=V9rknCNYPDePTJ0RvnpJE5IJL2DelNX7GA8OrQV0NdI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y+gFFv11KMQ1g4xUNS4nzH4Gq0KmlirC9XpWfopt/1ASVuksh7zLmTLjDkQbPDxmQQGQpvFhHr9p9DenLMd8zrOIJS8fWJZsrl9WJjaYVlDFAdMj2Y/3/rx7WrrcUmHEtz9k6dObbDW5/zAgLJCBx/Koc7RUoACZ8i8JYr/Yv/jnk7lGzQylPDK2aLNZkLvS9NYYq6jvbXnG3KN0tbVDVoz3UuRRk250+AfmJWQ71Bg4yr4fEz9TyJz2y1tNb1IIpbi6VDpmyzgiomJmiMOgk5gHDrc8uKU7O3JZoaOKoUX1nVRzxfJly5nTkWc/JYMNjKR/rPCZDAB/z9+SN1FbOw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=X0c2+pPw; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::22b; helo=mail-lj1-x22b.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=X0c2+pPw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::22b; helo=mail-lj1-x22b.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xw4Wf5c3nz2xl6
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Nov 2024 06:13:33 +1100 (AEDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2ffa974b2b0so9969201fa.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2024 11:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1732302809; x=1732907609; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V9rknCNYPDePTJ0RvnpJE5IJL2DelNX7GA8OrQV0NdI=;
        b=X0c2+pPwnDoKzuybCQPskTWPBsPzQzk71tvvIa2a8wOnvOOflvjZyjL0tM1dph1+VU
         IYi/HPTZF5mRutmIN4Ar9Bddnd5RPPbRM7B4LBdbgyNzev9MlWrNbnOcYtzC6/1f7v1D
         DXfnhqUAwiuknkI2Dlo/XaRnLQp/ZY6hntiHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732302809; x=1732907609;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V9rknCNYPDePTJ0RvnpJE5IJL2DelNX7GA8OrQV0NdI=;
        b=UFVoNJKBItHpwx+ibArvnawZB4eAOdwIRSU1+jOxW5vjlbRo8a6hzPXiBbDycqYdHQ
         ZFR9n/ey1L4O15p/qxks++/RSOMvZ9uo5hgZYa7WFxFxdo0NgavuPhRYcN5No/gxzDbg
         Busreyl8tvT5CoYXejJJIHlzV/bB15AY8DIYsG+/3ehsTGN2bmmwqGLAL/4fbW1cQXCu
         FoHE9NLBF5kYadUh1MEuWrdWRLBmHbmdJxshQeiD7w9QH+vjdS/9XS3NCk5mLm95EPc7
         fOlQds6LK71qrCCC1ruX5mc8XfFVRcXLK2Hf173j9/B0ruSTJTS/7myGfinPjEbMLAFX
         XvWw==
X-Forwarded-Encrypted: i=1; AJvYcCXH3geyKNlK7webI32QNyJWDfjqvSwYtk4B/n3yFwHFez4IRyDnD8NHEXkbwEPKDQVI2Y1yJkqYEPuXuWo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyMVVPUzpYVNytprviVzwsb70BbDs4Ftjj7T6VPq1TNoaL0jN31
	qUPo4AzA8eGtxjL67GhBCAxdE8r7cJLE/C/UydtnQ97RAOFceqbr0Jv/1Y/yC+iAmojijmI3KEZ
	Wc01P4A==
X-Gm-Gg: ASbGncuq5DKIKhQYcRsagDgKfS1g3JDbDhtX0X3Qe8l5xgPmidfyHUzQG2mse+72XHi
	6VYUxwbb8gvMAOzozNiGqnyK4aBxsFQj05TDSr0n1LVgZ6EFE6v/S6qBftQ88PdkxYP7uRH8u8N
	+fV/QuSAC0OmZiUEfUYNLp9LqUM3B2nt7CDiaOrxE2Dwlar3dRqVO5md+0tLEncm45KjGhjUtNS
	xH5JgmB4y4HXSMNxALh78QUYZy0hozLGqqNOQTjKwTcccfRmNukbpQ7iHmskV7aU3Yq/izVGRYr
	eO6082iCTYZEP4zjWubrrzK7Q0hr
X-Google-Smtp-Source: AGHT+IGlqlpDCfyxISZ/WBbxmmBj6wIfRgrJ7jTlF3HocMTD3dXrGeoTIRp8XPzTV4h/rJPFLhR5lw==
X-Received: by 2002:a2e:be23:0:b0:2fa:d7bf:6f43 with SMTP id 38308e7fff4ca-2ffa7197a6cmr26335991fa.27.1732302808876;
        Fri, 22 Nov 2024 11:13:28 -0800 (PST)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffa53769e3sm4652431fa.73.2024.11.22.11.13.23
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2024 11:13:24 -0800 (PST)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2ffa974b2b0so9968111fa.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2024 11:13:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU4gqGudVdmP/K27bOkFIbsCb9S0oh8R0T/ElnCRECqNVPNsjJSsFQpqc5s2Ut2xoJTnkCWLMeNqGeHN94=@lists.ozlabs.org
X-Received: by 2002:a05:6512:b97:b0:53d:d12c:2f02 with SMTP id
 2adb3069b0e04-53dd36a0421mr2548987e87.18.1732302803270; Fri, 22 Nov 2024
 11:13:23 -0800 (PST)
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
References: <cover.1730166635.git.jpoimboe@kernel.org> <82cbb9983fef5ecf6f1cb33661e977172d40a7e6.1730166635.git.jpoimboe@kernel.org>
 <20241029032735.pw3bg64bpneqnfhk@treble.attlocal.net> <76bb85ceeb854e3ab68d87f846515306@AcuMS.aculab.com>
 <20241115230653.hfvzyf3aqqntgp63@jpoimboe> <CAHk-=wgLCzEwa=S4hZFGeOPjix-1_fDrsqR-QLaBcDM-fgkvhw@mail.gmail.com>
 <20241121214011.iiup2fdwsys7hhts@jpoimboe> <CAHk-=wigHm2J4LkUL1=y_H8zGwM0JsK2CrWyLNbz9fvXfbaBQA@mail.gmail.com>
 <20241122001223.t4uywacusrplpefq@jpoimboe> <CAHk-=whm4fEYrzrrRrqEhELLFz2xNCMT9be+J0uiR_EwXwa0DA@mail.gmail.com>
 <20241122031115.5aasuktqrp2sidfj@jpoimboe> <CAHk-=wjJt49tgtmYv42bXU3h0Txb+mQZEOHseahA4EcK6s=BxA@mail.gmail.com>
In-Reply-To: <CAHk-=wjJt49tgtmYv42bXU3h0Txb+mQZEOHseahA4EcK6s=BxA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 22 Nov 2024 11:13:05 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiL0TepguMNaR65ZdkkiBEoi4hTE7PwG3bBO1c5SOXmWw@mail.gmail.com>
Message-ID: <CAHk-=wiL0TepguMNaR65ZdkkiBEoi4hTE7PwG3bBO1c5SOXmWw@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] x86/uaccess: Avoid barrier_nospec() in 64-bit __get_user()
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: David Laight <David.Laight@aculab.com>, "x86@kernel.org" <x86@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Waiman Long <longman@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Mark Rutland <mark.rutland@arm.com>, "Kirill A . Shutemov" <kirill@shutemov.name>
Content-Type: multipart/mixed; boundary="0000000000003c694e0627852d0c"
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

--0000000000003c694e0627852d0c
Content-Type: text/plain; charset="UTF-8"

On Thu, 21 Nov 2024 at 19:57, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Anyway, that was a long way of saying: I really think we should just
> special-case the (few) important cases that get reported. Because any
> *big* improvements will come not from just inlining.

Looking around at the futex code some more, I note:

 - the cmpxchg case and futex ops use an explicit barrier too, which is bad

 - we'd actually be better off inlining not just the user access, but
the whole futex_get_value_locked(), because then the compiler will be
able to do CSE on the user address masking, and only do it once
(several places do multiple different futex_get_value_locked() calls).

iow, I think the fix for the futex case ends up being a patch
something like the attached.

[ Annoyingly, we need "can_do_masked_user_access()" even on x86,
because the 32-bit case doesn't do the address masking trick ]

I've only compiled it so far, about to actually boot into it. Pray for me,

               Linus

--0000000000003c694e0627852d0c
Content-Type: text/x-patch; charset="US-ASCII"; name="patch.diff"
Content-Disposition: attachment; filename="patch.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_m3t4cmwq0>
X-Attachment-Id: f_m3t4cmwq0

IGFyY2gveDg2L2luY2x1ZGUvYXNtL2Z1dGV4LmggfCAgOCArKysrLS0KIGtlcm5lbC9mdXRleC9j
b3JlLmMgICAgICAgICAgfCAyMiAtLS0tLS0tLS0tLS0tLS0tLQoga2VybmVsL2Z1dGV4L2Z1dGV4
LmggICAgICAgICB8IDU5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Ky0tCiAzIGZpbGVzIGNoYW5nZWQsIDYzIGluc2VydGlvbnMoKyksIDI2IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL2Z1dGV4LmggYi9hcmNoL3g4Ni9pbmNs
dWRlL2FzbS9mdXRleC5oCmluZGV4IDk5ZDM0NWI2ODZmYS4uNmUyNDU4MDg4ODAwIDEwMDY0NAot
LS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9mdXRleC5oCisrKyBiL2FyY2gveDg2L2luY2x1ZGUv
YXNtL2Z1dGV4LmgKQEAgLTQ4LDcgKzQ4LDkgQEAgZG8gewkJCQkJCQkJXAogc3RhdGljIF9fYWx3
YXlzX2lubGluZSBpbnQgYXJjaF9mdXRleF9hdG9taWNfb3BfaW51c2VyKGludCBvcCwgaW50IG9w
YXJnLCBpbnQgKm92YWwsCiAJCXUzMiBfX3VzZXIgKnVhZGRyKQogewotCWlmICghdXNlcl9hY2Nl
c3NfYmVnaW4odWFkZHIsIHNpemVvZih1MzIpKSkKKwlpZiAoY2FuX2RvX21hc2tlZF91c2VyX2Fj
Y2VzcygpKQorCQl1YWRkciA9IG1hc2tlZF91c2VyX2FjY2Vzc19iZWdpbih1YWRkcik7CisJZWxz
ZSBpZiAoIXVzZXJfYWNjZXNzX2JlZ2luKHVhZGRyLCBzaXplb2YodTMyKSkpCiAJCXJldHVybiAt
RUZBVUxUOwogCiAJc3dpdGNoIChvcCkgewpAQCAtODQsNyArODYsOSBAQCBzdGF0aWMgaW5saW5l
IGludCBmdXRleF9hdG9taWNfY21weGNoZ19pbmF0b21pYyh1MzIgKnV2YWwsIHUzMiBfX3VzZXIg
KnVhZGRyLAogewogCWludCByZXQgPSAwOwogCi0JaWYgKCF1c2VyX2FjY2Vzc19iZWdpbih1YWRk
ciwgc2l6ZW9mKHUzMikpKQorCWlmIChjYW5fZG9fbWFza2VkX3VzZXJfYWNjZXNzKCkpCisJCXVh
ZGRyID0gbWFza2VkX3VzZXJfYWNjZXNzX2JlZ2luKHVhZGRyKTsKKwllbHNlIGlmICghdXNlcl9h
Y2Nlc3NfYmVnaW4odWFkZHIsIHNpemVvZih1MzIpKSkKIAkJcmV0dXJuIC1FRkFVTFQ7CiAJYXNt
IHZvbGF0aWxlKCJcbiIKIAkJIjE6XHQiIExPQ0tfUFJFRklYICJjbXB4Y2hnbCAlMywgJTJcbiIK
ZGlmZiAtLWdpdCBhL2tlcm5lbC9mdXRleC9jb3JlLmMgYi9rZXJuZWwvZnV0ZXgvY29yZS5jCmlu
ZGV4IDMyNmJmZTY1NDlkNy4uOTgzM2ZkYjYzZTM5IDEwMDY0NAotLS0gYS9rZXJuZWwvZnV0ZXgv
Y29yZS5jCisrKyBiL2tlcm5lbC9mdXRleC9jb3JlLmMKQEAgLTQ1MSwyOCArNDUxLDYgQEAgc3Ry
dWN0IGZ1dGV4X3EgKmZ1dGV4X3RvcF93YWl0ZXIoc3RydWN0IGZ1dGV4X2hhc2hfYnVja2V0ICpo
YiwgdW5pb24gZnV0ZXhfa2V5ICoKIAlyZXR1cm4gTlVMTDsKIH0KIAotaW50IGZ1dGV4X2NtcHhj
aGdfdmFsdWVfbG9ja2VkKHUzMiAqY3VydmFsLCB1MzIgX191c2VyICp1YWRkciwgdTMyIHV2YWws
IHUzMiBuZXd2YWwpCi17Ci0JaW50IHJldDsKLQotCXBhZ2VmYXVsdF9kaXNhYmxlKCk7Ci0JcmV0
ID0gZnV0ZXhfYXRvbWljX2NtcHhjaGdfaW5hdG9taWMoY3VydmFsLCB1YWRkciwgdXZhbCwgbmV3
dmFsKTsKLQlwYWdlZmF1bHRfZW5hYmxlKCk7Ci0KLQlyZXR1cm4gcmV0OwotfQotCi1pbnQgZnV0
ZXhfZ2V0X3ZhbHVlX2xvY2tlZCh1MzIgKmRlc3QsIHUzMiBfX3VzZXIgKmZyb20pCi17Ci0JaW50
IHJldDsKLQotCXBhZ2VmYXVsdF9kaXNhYmxlKCk7Ci0JcmV0ID0gX19nZXRfdXNlcigqZGVzdCwg
ZnJvbSk7Ci0JcGFnZWZhdWx0X2VuYWJsZSgpOwotCi0JcmV0dXJuIHJldCA/IC1FRkFVTFQgOiAw
OwotfQotCiAvKioKICAqIHdhaXRfZm9yX293bmVyX2V4aXRpbmcgLSBCbG9jayB1bnRpbCB0aGUg
b3duZXIgaGFzIGV4aXRlZAogICogQHJldDogb3duZXIncyBjdXJyZW50IGZ1dGV4IGxvY2sgc3Rh
dHVzCmRpZmYgLS1naXQgYS9rZXJuZWwvZnV0ZXgvZnV0ZXguaCBiL2tlcm5lbC9mdXRleC9mdXRl
eC5oCmluZGV4IDhiMTk1ZDA2ZjRlOC4uMzIzNTcyMDE0YjMyIDEwMDY0NAotLS0gYS9rZXJuZWwv
ZnV0ZXgvZnV0ZXguaAorKysgYi9rZXJuZWwvZnV0ZXgvZnV0ZXguaApAQCAtNiw2ICs2LDcgQEAK
ICNpbmNsdWRlIDxsaW51eC9ydG11dGV4Lmg+CiAjaW5jbHVkZSA8bGludXgvc2NoZWQvd2FrZV9x
Lmg+CiAjaW5jbHVkZSA8bGludXgvY29tcGF0Lmg+CisjaW5jbHVkZSA8bGludXgvdWFjY2Vzcy5o
PgogCiAjaWZkZWYgQ09ORklHX1BSRUVNUFRfUlQKICNpbmNsdWRlIDxsaW51eC9yY3V3YWl0Lmg+
CkBAIC0yMjUsMTAgKzIyNiw2NCBAQCBleHRlcm4gYm9vbCBfX2Z1dGV4X3dha2VfbWFyayhzdHJ1
Y3QgZnV0ZXhfcSAqcSk7CiBleHRlcm4gdm9pZCBmdXRleF93YWtlX21hcmsoc3RydWN0IHdha2Vf
cV9oZWFkICp3YWtlX3EsIHN0cnVjdCBmdXRleF9xICpxKTsKIAogZXh0ZXJuIGludCBmYXVsdF9p
bl91c2VyX3dyaXRlYWJsZSh1MzIgX191c2VyICp1YWRkcik7Ci1leHRlcm4gaW50IGZ1dGV4X2Nt
cHhjaGdfdmFsdWVfbG9ja2VkKHUzMiAqY3VydmFsLCB1MzIgX191c2VyICp1YWRkciwgdTMyIHV2
YWwsIHUzMiBuZXd2YWwpOwotZXh0ZXJuIGludCBmdXRleF9nZXRfdmFsdWVfbG9ja2VkKHUzMiAq
ZGVzdCwgdTMyIF9fdXNlciAqZnJvbSk7CiBleHRlcm4gc3RydWN0IGZ1dGV4X3EgKmZ1dGV4X3Rv
cF93YWl0ZXIoc3RydWN0IGZ1dGV4X2hhc2hfYnVja2V0ICpoYiwgdW5pb24gZnV0ZXhfa2V5ICpr
ZXkpOwogCitzdGF0aWMgaW5saW5lIGludCBmdXRleF9jbXB4Y2hnX3ZhbHVlX2xvY2tlZCh1MzIg
KmN1cnZhbCwgdTMyIF9fdXNlciAqdWFkZHIsIHUzMiB1dmFsLCB1MzIgbmV3dmFsKQoreworCWlu
dCByZXQ7CisKKwlwYWdlZmF1bHRfZGlzYWJsZSgpOworCXJldCA9IGZ1dGV4X2F0b21pY19jbXB4
Y2hnX2luYXRvbWljKGN1cnZhbCwgdWFkZHIsIHV2YWwsIG5ld3ZhbCk7CisJcGFnZWZhdWx0X2Vu
YWJsZSgpOworCisJcmV0dXJuIHJldDsKK30KKworLyoKKyAqIFRoaXMgZG9lcyBhIHBsYWluIGF0
b21pYyB1c2VyIHNwYWNlIHJlYWQsIGFuZCB0aGUgdXNlciBwb2ludGVyIGhhcworICogYWxyZWFk
eSBiZWVuIHZlcmlmaWVkIGVhcmxpZXIgYnkgZ2V0X2Z1dGV4X2tleSgpIHRvIGJlIGJvdGggYWxp
Z25lZAorICogYW5kIGFjdHVhbGx5IGluIHVzZXIgc3BhY2UsIGp1c3QgbGlrZSBmdXRleF9hdG9t
aWNfY21weGNoZ19pbmF0b21pYygpLgorICoKKyAqIFdlIHN0aWxsIHdhbnQgdG8gYXZvaWQgYW55
IHNwZWN1bGF0aW9uLCBhbmQgd2hpbGUgX19nZXRfdXNlcigpIGlzCisgKiB0aGUgdHJhZGl0aW9u
YWwgbW9kZWwgZm9yIHRoaXMsIGl0J3MgYWN0dWFsbHkgc2xvd2VyIHRoZW4gZG9pbmcKKyAqIHRo
aXMgbWFudWFsbHkgdGhlc2UgZGF5cy4KKyAqCisgKiBXZSBjb3VsZCBqdXN0IGhhdmUgYSBwZXIt
YXJjaGl0ZWN0dXJlIHNwZWNpYWwgZnVuY3Rpb24gZm9yIGl0LAorICogdGhlIHNhbWUgd2F5IHdl
IGRvIGZ1dGV4X2F0b21pY19jbXB4Y2hnX2luYXRvbWljKCksIGJ1dCByYXRoZXIKKyAqIHRoYW4g
Zm9yY2UgZXZlcnlib2R5IHRvIGRvIHRoYXQsIHdyaXRlIGl0IG91dCBsb25nLWhhbmQgdXNpbmcK
KyAqIHRoZSBsb3ctbGV2ZWwgdXNlci1hY2Nlc3MgaW5mcmFzdHJ1Y3R1cmUuCisgKgorICogVGhp
cyBsb29rcyBhIGJpdCBvdmVya2lsbCwgYnV0IGdlbmVyYWxseSBqdXN0IHJlc3VsdHMgaW4gYSBj
b3VwbGUKKyAqIG9mIGluc3RydWN0aW9ucy4KKyAqLworc3RhdGljIF9fYWx3YXlzX2lubGluZSBp
bnQgZnV0ZXhfcmVhZF9pbmF0b21pYyh1MzIgKmRlc3QsIHUzMiBfX3VzZXIgKmZyb20pCit7CisJ
dTMyIHZhbDsKKworCWlmIChjYW5fZG9fbWFza2VkX3VzZXJfYWNjZXNzKCkpCisJCWZyb20gPSBt
YXNrZWRfdXNlcl9hY2Nlc3NfYmVnaW4oZnJvbSk7CisJZWxzZSBpZiAoIXVzZXJfcmVhZF9hY2Nl
c3NfYmVnaW4oZnJvbSwgc2l6ZW9mKCpmcm9tKSkpCisJCXJldHVybiAtRUZBVUxUOworCXVuc2Fm
ZV9nZXRfdXNlcih2YWwsIGZyb20sIEVmYXVsdCk7CisJdXNlcl9hY2Nlc3NfZW5kKCk7CisJKmRl
c3QgPSB2YWw7CisJcmV0dXJuIDA7CitFZmF1bHQ6CisJdXNlcl9hY2Nlc3NfZW5kKCk7CisJcmV0
dXJuIC1FRkFVTFQ7Cit9CisKK3N0YXRpYyBpbmxpbmUgaW50IGZ1dGV4X2dldF92YWx1ZV9sb2Nr
ZWQodTMyICpkZXN0LCB1MzIgX191c2VyICpmcm9tKQoreworCWludCByZXQ7CisKKwlwYWdlZmF1
bHRfZGlzYWJsZSgpOworCXJldCA9IGZ1dGV4X3JlYWRfaW5hdG9taWMoZGVzdCwgZnJvbSk7CisJ
cGFnZWZhdWx0X2VuYWJsZSgpOworCisJcmV0dXJuIHJldDsKK30KKwogZXh0ZXJuIHZvaWQgX19m
dXRleF91bnF1ZXVlKHN0cnVjdCBmdXRleF9xICpxKTsKIGV4dGVybiB2b2lkIF9fZnV0ZXhfcXVl
dWUoc3RydWN0IGZ1dGV4X3EgKnEsIHN0cnVjdCBmdXRleF9oYXNoX2J1Y2tldCAqaGIpOwogZXh0
ZXJuIGludCBmdXRleF91bnF1ZXVlKHN0cnVjdCBmdXRleF9xICpxKTsK
--0000000000003c694e0627852d0c--

