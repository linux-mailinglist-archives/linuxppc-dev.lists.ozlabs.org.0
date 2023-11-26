Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1199F7F954E
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Nov 2023 21:25:17 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=Zcqqco7i;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SdgFQ5v4Jz3cW7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Nov 2023 07:25:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=Zcqqco7i;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SdgDZ5spKz3c18
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Nov 2023 07:24:29 +1100 (AEDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2c8880f14eeso44815901fa.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Nov 2023 12:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1701030255; x=1701635055; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Z9m0VkYBMPQAAqcfnyKJyHPhdZmsbJX1nKe+Mjna/jI=;
        b=Zcqqco7iejHrRuD+/ICKxyFr3ADzNgAVLl5RJboBs5RPJ++cnagfuiqfH125O3iLe4
         rKa/odUU46y4gtdcwylr2590Xt3i//iJSNegGLrYQWrfkeGVgQhRYnIbM2nSdRODLByE
         9Z82nog3uZnb7LT6UmbljujA9XilAdBrRvOHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701030255; x=1701635055;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z9m0VkYBMPQAAqcfnyKJyHPhdZmsbJX1nKe+Mjna/jI=;
        b=MGKZH3js2J6aed3e2ztvohIEM0iTwDGF2nVKostAfsTGcK7E3cG6QTUPNdx5HprxFj
         Y1eCFhFeBgEoj126lz3mcaO0aL/CBTf5rEvv9azXpYWegFNt7DMGU2GHKYZq6oe1NMYN
         ZfRS5c4CNH+bomM24bwI7uhEqE1qrgatXNMmmb/lrNRkIobSd+bbObwQPvOM3Ey7wcmc
         Z/IuA47jiRvlaT+ZXTZb4S6N3TqfOymOLOxQwuo62IphDKx3aaU3e6YfQLChZL4+aDQe
         N1OTocEqpHfJoJ+DkPWyDEN8cOWoDc2gm8Vbo9Kxa9lg9Cs2+fdn6C12zpdx2wntr040
         lCHw==
X-Gm-Message-State: AOJu0YxE+05Rni5pCjtkH82W/wOOLpqU8bbMCGa5XaYJgO+SrKaqp8Gl
	bFZlV0iwcw0jCykiUdZeE4u3Lxxt4ZHuxYR5duL0aJno
X-Google-Smtp-Source: AGHT+IHVxjxjLjYchWr03+hl3Ruh5FOPPP00Udd5iElUDV8epgdg9e5c+nkRsdlp08N/c8Ktsj8lpA==
X-Received: by 2002:a2e:8699:0:b0:2c5:1900:47a4 with SMTP id l25-20020a2e8699000000b002c5190047a4mr5790993lji.0.1701030255371;
        Sun, 26 Nov 2023 12:24:15 -0800 (PST)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id c12-20020a170906170c00b0099ddc81903asm4868640eje.221.2023.11.26.12.24.14
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Nov 2023 12:24:14 -0800 (PST)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a02d12a2444so514771666b.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Nov 2023 12:24:14 -0800 (PST)
X-Received: by 2002:a17:906:28e:b0:a0a:f934:6075 with SMTP id
 14-20020a170906028e00b00a0af9346075mr3560404ejf.39.1701030253926; Sun, 26 Nov
 2023 12:24:13 -0800 (PST)
MIME-Version: 1.0
References: <202311201406.2022ca3f-oliver.sang@intel.com>
In-Reply-To: <202311201406.2022ca3f-oliver.sang@intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 26 Nov 2023 12:23:57 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjMKONPsXAJ=yJuPBEAx6HdYRkYE8TdYVBvpm3=x_EnCw@mail.gmail.com>
Message-ID: <CAHk-=wjMKONPsXAJ=yJuPBEAx6HdYRkYE8TdYVBvpm3=x_EnCw@mail.gmail.com>
Subject: Re: [linus:master] [file] 0ede61d858: will-it-scale.per_thread_ops
 -2.9% regression
To: kernel test robot <oliver.sang@intel.com>
Content-Type: multipart/mixed; boundary="00000000000009cc68060b13f8a2"
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Christian Brauner <brauner@kernel.org>, lkp@intel.com, Jann Horn <jannh@google.com>, intel-gfx@lists.freedesktop.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, fengwei.yin@intel.com, gfs2@lists.linux.dev, linux-fsdevel@vger.kernel.org, feng.tang@intel.com, ying.huang@intel.com, oe-lkp@lists.linux.dev, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--00000000000009cc68060b13f8a2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 19 Nov 2023 at 23:11, kernel test robot <oliver.sang@intel.com> wro=
te:
>
> kernel test robot noticed a -2.9% regression of will-it-scale.per_thread_=
ops on:
>
> commit: 0ede61d8589cc2d93aa78230d74ac58b5b8d0244 ("file: convert to SLAB_=
TYPESAFE_BY_RCU")

Ok, so __fget_light() is one of our more performance-critical things,
and that commit ends up making it call a rather more expensive version
in __get_file_rcu(), so we have:

>      30.90 =C4=85  4%     -20.6       10.35 =C4=85  2%  perf-profile.self=
.cycles-pp.__fget_light
>       0.00           +26.5       26.48        perf-profile.self.cycles-pp=
.__get_file_rcu

and that "20% decrease balanced by 26% increase elsewhere" then
directly causes the ~3% regression.

I took a look at the code generation, and honestly, I think we're
better off just making __fget_files_rcu() have special logic for this
all, and not use __get_file_rcu().

The 'fd' case really is special because we need to do that
non-speculative pointer access.

Because it turns out that we already have to use array_index_nospec()
to safely generate that pointer to the fd entry, and once you have to
do that "use non-speculative accesses to generate a safe pointer", you
might as well just go whole hog.

So this takes a different approach, and uses the
array_index_mask_nospec() thing that we have exactly to generate that
non-speculative mask for these things:

        /* Mask is a 0 for invalid fd's, ~0 for valid ones */
        mask =3D array_index_mask_nospec(fd, fdt->max_fds);

and then it does something you can consider either horribly clever, or
horribly ugly (this first part is basically just
array_index_nospec()):

        /* fdentry points to the 'fd' offset, or fdt->fd[0] */
        fdentry =3D fdt->fd + (fd&mask);

and then we can just *unconditionally* do the load - but since we
might be loading fd[0] for an invalid case, we need to mask the result
too:

        /* Do the load, then mask any invalid result */
        file =3D rcu_dereference_raw(*fdentry);
        file =3D (void *)(mask & (unsigned long)file);

but now we have done everything without any conditionals, and the only
conditional is now "did we load NULL" - which includes that "we masked
the bad value".

Then we just do that atomic_long_inc_not_zero() on the file, and
re-check the pointer chain we used.

I made files_lookup_fd_raw() do the same thing.

The end result is much nicer code generation at least from my quick
check. And I assume the regression will be gone, and hopefully even
turned into an improvement since this is so hot.

Comments? I also looked at that odd OPTIMIZER_HIDE_VAR() that
__get_file_rcu() does, and I don't get it. Both things come from
volatile accesses, I don't see the point of those games, but I also
didn't care, since it's no longer in a critical code path.

Christian?

NOTE! This patch is not well tested. I verified an earlier version of
this, but have been playing with it since, so caveat emptor.

IOW, I might have messed up some "trivial cleanup" when prepping for
sending it out...

              Linus

--00000000000009cc68060b13f8a2
Content-Type: text/x-patch; charset="US-ASCII"; name="patch.diff"
Content-Disposition: attachment; filename="patch.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_lpfx3pqa0>
X-Attachment-Id: f_lpfx3pqa0

IGZzL2ZpbGUuYyAgICAgICAgICAgICAgIHwgNDggKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrLS0tLS0tLS0tLS0tLS0tLS0tCiBpbmNsdWRlL2xpbnV4L2ZkdGFibGUuaCB8IDE1ICsrKysr
KysrKystLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCA0MCBpbnNlcnRpb25zKCspLCAyMyBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9mcy9maWxlLmMgYi9mcy9maWxlLmMKaW5kZXggNWZiMGIxNDZl
NzllLi5jNzRhNmU4Njg3ZDkgMTAwNjQ0Ci0tLSBhL2ZzL2ZpbGUuYworKysgYi9mcy9maWxlLmMK
QEAgLTk1OSwzMSArOTU5LDQyIEBAIHN0YXRpYyBpbmxpbmUgc3RydWN0IGZpbGUgKl9fZmdldF9m
aWxlc19yY3Uoc3RydWN0IGZpbGVzX3N0cnVjdCAqZmlsZXMsCiAJCXN0cnVjdCBmaWxlICpmaWxl
OwogCQlzdHJ1Y3QgZmR0YWJsZSAqZmR0ID0gcmN1X2RlcmVmZXJlbmNlX3JhdyhmaWxlcy0+ZmR0
KTsKIAkJc3RydWN0IGZpbGUgX19yY3UgKipmZGVudHJ5OworCQl1bnNpZ25lZCBsb25nIG1hc2s7
CiAKLQkJaWYgKHVubGlrZWx5KGZkID49IGZkdC0+bWF4X2ZkcykpCisJCS8qIE1hc2sgaXMgYSAw
IGZvciBpbnZhbGlkIGZkJ3MsIH4wIGZvciB2YWxpZCBvbmVzICovCisJCW1hc2sgPSBhcnJheV9p
bmRleF9tYXNrX25vc3BlYyhmZCwgZmR0LT5tYXhfZmRzKTsKKworCQkvKiBmZGVudHJ5IHBvaW50
cyB0byB0aGUgJ2ZkJyBvZmZzZXQsIG9yIGZkdC0+ZmRbMF0gKi8KKwkJZmRlbnRyeSA9IGZkdC0+
ZmQgKyAoZmQmbWFzayk7CisKKwkJLyogRG8gdGhlIGxvYWQsIHRoZW4gbWFzayBhbnkgaW52YWxp
ZCByZXN1bHQgKi8KKwkJZmlsZSA9IHJjdV9kZXJlZmVyZW5jZV9yYXcoKmZkZW50cnkpOworCQlm
aWxlID0gKHZvaWQgKikobWFzayAmICh1bnNpZ25lZCBsb25nKWZpbGUpOworCisJCWlmICh1bmxp
a2VseSghZmlsZSkpCiAJCQlyZXR1cm4gTlVMTDsKIAotCQlmZGVudHJ5ID0gZmR0LT5mZCArIGFy
cmF5X2luZGV4X25vc3BlYyhmZCwgZmR0LT5tYXhfZmRzKTsKKwkJLyoKKwkJICogT2ssIHdlIGhh
dmUgYSBmaWxlIHBvaW50ZXIgdGhhdCB3YXMgdmFsaWQgYXQKKwkJICogc29tZSBwb2ludCwgYnV0
IGl0IG1pZ2h0IGhhdmUgYmVjb21lIHN0YWxlIHNpbmNlLgorCQkgKgorCQkgKiBXZSBuZWVkIHRv
IGNvbmZpcm0gaXQgYnkgaW5jcmVtZW50aW5nIHRoZSByZWZjb3VudAorCQkgKiBhbmQgdGhlbiBj
aGVjayB0aGUgbG9va3VwIGFnYWluLgorCQkgKgorCQkgKiBhdG9taWNfbG9uZ19pbmNfbm90X3pl
cm8oKSBnaXZlcyB1cyBhIGZ1bGwgbWVtb3J5CisJCSAqIGJhcnJpZXIuIFdlIG9ubHkgcmVhbGx5
IG5lZWQgYW4gJ2FjcXVpcmUnIG9uZSB0bworCQkgKiBwcm90ZWN0IHRoZSBsb2FkcyBiZWxvdywg
YnV0IHdlIGRvbid0IGhhdmUgdGhhdC4KKwkJICovCisJCWlmICh1bmxpa2VseSghYXRvbWljX2xv
bmdfaW5jX25vdF96ZXJvKCZmaWxlLT5mX2NvdW50KSkpCisJCQljb250aW51ZTsKIAogCQkvKgot
CQkgKiBPaywgd2UgaGF2ZSBhIGZpbGUgcG9pbnRlci4gSG93ZXZlciwgYmVjYXVzZSB3ZSBkbwot
CQkgKiB0aGlzIGFsbCBsb2NrbGVzc2x5IHVuZGVyIFJDVSwgd2UgbWF5IGJlIHJhY2luZyB3aXRo
Ci0JCSAqIHRoYXQgZmlsZSBiZWluZyBjbG9zZWQuCi0JCSAqCiAJCSAqIFN1Y2ggYSByYWNlIGNh
biB0YWtlIHR3byBmb3JtczoKIAkJICoKIAkJICogIChhKSB0aGUgZmlsZSByZWYgYWxyZWFkeSB3
ZW50IGRvd24gdG8gemVybyBhbmQgdGhlCiAJCSAqICAgICAgZmlsZSBoYXNuJ3QgYmVlbiByZXVz
ZWQgeWV0IG9yIHRoZSBmaWxlIGNvdW50CiAJCSAqICAgICAgaXNuJ3QgemVybyBidXQgdGhlIGZp
bGUgaGFzIGFscmVhZHkgYmVlbiByZXVzZWQuCi0JCSAqLwotCQlmaWxlID0gX19nZXRfZmlsZV9y
Y3UoZmRlbnRyeSk7Ci0JCWlmICh1bmxpa2VseSghZmlsZSkpCi0JCQlyZXR1cm4gTlVMTDsKLQot
CQlpZiAodW5saWtlbHkoSVNfRVJSKGZpbGUpKSkKLQkJCWNvbnRpbnVlOwotCi0JCS8qCisJCSAq
CiAJCSAqICAoYikgdGhlIGZpbGUgdGFibGUgZW50cnkgaGFzIGNoYW5nZWQgdW5kZXIgdXMuCiAJ
CSAqICAgICAgIE5vdGUgdGhhdCB3ZSBkb24ndCBuZWVkIHRvIHJlLWNoZWNrIHRoZSAnZmR0LT5m
ZCcKIAkJICogICAgICAgcG9pbnRlciBoYXZpbmcgY2hhbmdlZCwgYmVjYXVzZSBpdCBhbHdheXMg
Z29lcwpAQCAtOTkxLDcgKzEwMDIsOCBAQCBzdGF0aWMgaW5saW5lIHN0cnVjdCBmaWxlICpfX2Zn
ZXRfZmlsZXNfcmN1KHN0cnVjdCBmaWxlc19zdHJ1Y3QgKmZpbGVzLAogCQkgKgogCQkgKiBJZiBz
bywgd2UgbmVlZCB0byBwdXQgb3VyIHJlZiBhbmQgdHJ5IGFnYWluLgogCQkgKi8KLQkJaWYgKHVu
bGlrZWx5KHJjdV9kZXJlZmVyZW5jZV9yYXcoZmlsZXMtPmZkdCkgIT0gZmR0KSkgeworCQlpZiAo
dW5saWtlbHkoZmlsZSAhPSByY3VfZGVyZWZlcmVuY2VfcmF3KCpmZGVudHJ5KSkgfHwKKwkJICAg
IHVubGlrZWx5KHJjdV9kZXJlZmVyZW5jZV9yYXcoZmlsZXMtPmZkdCkgIT0gZmR0KSkgewogCQkJ
ZnB1dChmaWxlKTsKIAkJCWNvbnRpbnVlOwogCQl9CkBAIC0xMTI4LDEzICsxMTQwLDEzIEBAIHN0
YXRpYyB1bnNpZ25lZCBsb25nIF9fZmdldF9saWdodCh1bnNpZ25lZCBpbnQgZmQsIGZtb2RlX3Qg
bWFzaykKIAkgKiBhdG9taWNfcmVhZF9hY3F1aXJlKCkgcGFpcnMgd2l0aCBhdG9taWNfZGVjX2Fu
ZF90ZXN0KCkgaW4KIAkgKiBwdXRfZmlsZXNfc3RydWN0KCkuCiAJICovCi0JaWYgKGF0b21pY19y
ZWFkX2FjcXVpcmUoJmZpbGVzLT5jb3VudCkgPT0gMSkgeworCWlmIChsaWtlbHkoYXRvbWljX3Jl
YWRfYWNxdWlyZSgmZmlsZXMtPmNvdW50KSA9PSAxKSkgewogCQlmaWxlID0gZmlsZXNfbG9va3Vw
X2ZkX3JhdyhmaWxlcywgZmQpOwogCQlpZiAoIWZpbGUgfHwgdW5saWtlbHkoZmlsZS0+Zl9tb2Rl
ICYgbWFzaykpCiAJCQlyZXR1cm4gMDsKIAkJcmV0dXJuICh1bnNpZ25lZCBsb25nKWZpbGU7CiAJ
fSBlbHNlIHsKLQkJZmlsZSA9IF9fZmdldChmZCwgbWFzayk7CisJCWZpbGUgPSBfX2ZnZXRfZmls
ZXMoZmlsZXMsIGZkLCBtYXNrKTsKIAkJaWYgKCFmaWxlKQogCQkJcmV0dXJuIDA7CiAJCXJldHVy
biBGRFBVVF9GUFVUIHwgKHVuc2lnbmVkIGxvbmcpZmlsZTsKZGlmZiAtLWdpdCBhL2luY2x1ZGUv
bGludXgvZmR0YWJsZS5oIGIvaW5jbHVkZS9saW51eC9mZHRhYmxlLmgKaW5kZXggYmM0YzMyODdh
NjVlLi5hOGE4YjRkMjQ2MTkgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvZmR0YWJsZS5oCisr
KyBiL2luY2x1ZGUvbGludXgvZmR0YWJsZS5oCkBAIC04MywxMiArODMsMTcgQEAgc3RydWN0IGRl
bnRyeTsKIHN0YXRpYyBpbmxpbmUgc3RydWN0IGZpbGUgKmZpbGVzX2xvb2t1cF9mZF9yYXcoc3Ry
dWN0IGZpbGVzX3N0cnVjdCAqZmlsZXMsIHVuc2lnbmVkIGludCBmZCkKIHsKIAlzdHJ1Y3QgZmR0
YWJsZSAqZmR0ID0gcmN1X2RlcmVmZXJlbmNlX3JhdyhmaWxlcy0+ZmR0KTsKKwl1bnNpZ25lZCBs
b25nIG1hc2sgPSBhcnJheV9pbmRleF9tYXNrX25vc3BlYyhmZCwgZmR0LT5tYXhfZmRzKTsKKwlz
dHJ1Y3QgZmlsZSAqbmVlZHNfbWFza2luZzsKIAotCWlmIChmZCA8IGZkdC0+bWF4X2Zkcykgewot
CQlmZCA9IGFycmF5X2luZGV4X25vc3BlYyhmZCwgZmR0LT5tYXhfZmRzKTsKLQkJcmV0dXJuIHJj
dV9kZXJlZmVyZW5jZV9yYXcoZmR0LT5mZFtmZF0pOwotCX0KLQlyZXR1cm4gTlVMTDsKKwkvKgor
CSAqICdtYXNrJyBpcyB6ZXJvIGZvciBhbiBvdXQtb2YtYm91bmRzIGZkLCBhbGwgb25lcyBmb3Ig
b2suCisJICogJ2ZkfH5tYXNrJyBpcyAnZmQnIGZvciBvaywgb3IgMCBmb3Igb3V0IG9mIGJvdW5k
cy4KKwkgKgorCSAqIEFjY2Vzc2luZyBmZHQtPmZkWzBdIGlzIG9rLCBidXQgbmVlZHMgbWFza2lu
ZyBvZiB0aGUgcmVzdWx0LgorCSAqLworCW5lZWRzX21hc2tpbmcgPSByY3VfZGVyZWZlcmVuY2Vf
cmF3KGZkdC0+ZmRbZmQmbWFza10pOworCXJldHVybiAoc3RydWN0IGZpbGUgKikobWFzayAmICh1
bnNpZ25lZCBsb25nKW5lZWRzX21hc2tpbmcpOwogfQogCiBzdGF0aWMgaW5saW5lIHN0cnVjdCBm
aWxlICpmaWxlc19sb29rdXBfZmRfbG9ja2VkKHN0cnVjdCBmaWxlc19zdHJ1Y3QgKmZpbGVzLCB1
bnNpZ25lZCBpbnQgZmQpCg==
--00000000000009cc68060b13f8a2--
