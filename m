Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 18177287A85
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Oct 2020 19:04:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6cy84RwXzDqWr
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Oct 2020 04:04:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::241;
 helo=mail-lj1-x241.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=Pr37Vkql; 
 dkim-atps=neutral
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6cwH0CBgzDqSf
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Oct 2020 04:03:10 +1100 (AEDT)
Received: by mail-lj1-x241.google.com with SMTP id m16so6546455ljo.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Oct 2020 10:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2HnkrkgfxXwwWT8ss7RwMmEpIzbYLcseAwgIbkR5olg=;
 b=Pr37Vkqlz1xNBMlcKSqc44JuHcizUfj8LYo2/YkTOXcK5w5LPfBExAQSaa61+gHvUJ
 BpJypLE0KW7sRHD3xT20EEJ/kf/FbCkBbXoOQ3qTO+R9W6ETIIGPxtV9po7vSCNF0WHW
 XF2QZkukVaYQunpEagpECWZPy2+Saqhj4dV1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2HnkrkgfxXwwWT8ss7RwMmEpIzbYLcseAwgIbkR5olg=;
 b=DUcVzsMskvwqqy9LM3JwNcSMhRtJFVHmplaAc/ET+uvzofS5K7SSYCZxQtVW++x0r3
 Z3zEDu7YH/tOfMAgwYyjVj/qNTZkHFeoCOKCRYtg21r8e3e1bpH6JzmNpaZeprfeyZS8
 PM9Uy43/WmChoW6vwnzTFgA/Pst9HineosoZdLDUkXto9HDWLptsKYvpIyWdrCvBIdoJ
 hk7g0N28s2i7RLQ6doC1IydtKrhkUPZNoKQsYbmHt0/OhsYzQBibCvaKZh0si4hAIkTa
 J27N9q65HJFnUHzJvtNWe1vJPpV7NZ7Nr6Lbl4nHt2WWReW9oeEAQ8LjYSkMHpIcHtt0
 MHzA==
X-Gm-Message-State: AOAM5315/qHKJa7tjBCTtDQJEbhQ2b+s0wM/5RN9MIR9DFC9Qvpdj8IF
 BjEFo7Qz2eyRuq7BT2SrzHaAW97klnmlig==
X-Google-Smtp-Source: ABdhPJy62MLYghiqDvahKFy2ApPgJzw/KEKIbhy9oraHZ/YWHwoPHdJgAHaivYQ3qWQYytBLnutmYA==
X-Received: by 2002:a2e:3c0f:: with SMTP id j15mr3562123lja.461.1602176582391; 
 Thu, 08 Oct 2020 10:03:02 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com.
 [209.85.167.51])
 by smtp.gmail.com with ESMTPSA id j6sm960498lfg.154.2020.10.08.10.02.59
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Oct 2020 10:03:00 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id c141so706397lfg.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Oct 2020 10:02:59 -0700 (PDT)
X-Received: by 2002:a19:e00a:: with SMTP id x10mr3302044lfg.603.1602176579161; 
 Thu, 08 Oct 2020 10:02:59 -0700 (PDT)
MIME-Version: 1.0
References: <20201008092627.399131-1-aneesh.kumar@linux.ibm.com>
In-Reply-To: <20201008092627.399131-1-aneesh.kumar@linux.ibm.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 8 Oct 2020 10:02:42 -0700
X-Gmail-Original-Message-ID: <CAHk-=whwY0WT046fqM-zdHu9vamUjgkvmd36gCd4qSaeYy98nA@mail.gmail.com>
Message-ID: <CAHk-=whwY0WT046fqM-zdHu9vamUjgkvmd36gCd4qSaeYy98nA@mail.gmail.com>
Subject: Re: [RFC PATCH] mm: Fetch the dirty bit before we reset the pte
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Content-Type: multipart/mixed; boundary="000000000000deeb1a05b12bcd0b"
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 Linux-MM <linux-mm@kvack.org>, Hugh Dickins <hughd@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Peter Xu <peterx@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Nick Piggin <npiggin@gmail.com>, John Hubbard <jhubbard@nvidia.com>,
 Kirill Shutemov <kirill@shutemov.name>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--000000000000deeb1a05b12bcd0b
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 8, 2020 at 2:27 AM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
> In copy_present_page, after we mark the pte non-writable, we should
> check for previous dirty bit updates and make sure we don't lose the dirty
> bit on reset.

No, we'll just remove that entirely.

Do you have a test-case that shows a problem? I have a patch that I
was going to delay until 5.10 because I didn't think it mattered in
practice..

The second part of this patch would be to add a sequence count
protection to fast-GUP pinning, so that GUP and fork() couldn't race,
but I haven't written that part.

Here's the first patch anyway. If you actually have a test-case where
this matters, I guess I need to apply it now..

                   Linus

--000000000000deeb1a05b12bcd0b
Content-Type: application/octet-stream; name=fork-cleanup
Content-Disposition: attachment; filename=fork-cleanup
Content-Transfer-Encoding: base64
Content-ID: <f_kg12k1ge0>
X-Attachment-Id: f_kg12k1ge0

IG1tL21lbW9yeS5jIHwgNDYgKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDM2IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL21tL21lbW9yeS5jIGIvbW0vbWVtb3J5LmMKaW5kZXggZmNmYzRjYTM2
ZWJhLi40YTdlODlkMzVlY2YgMTAwNjQ0Ci0tLSBhL21tL21lbW9yeS5jCisrKyBiL21tL21lbW9y
eS5jCkBAIC04MDYsOCArODA2LDYgQEAgY29weV9wcmVzZW50X3BhZ2Uoc3RydWN0IG1tX3N0cnVj
dCAqZHN0X21tLCBzdHJ1Y3QgbW1fc3RydWN0ICpzcmNfbW0sCiAJCXJldHVybiAxOwogCiAJLyoK
LQkgKiBUaGUgdHJpY2sgc3RhcnRzLgotCSAqCiAJICogV2hhdCB3ZSB3YW50IHRvIGRvIGlzIHRv
IGNoZWNrIHdoZXRoZXIgdGhpcyBwYWdlIG1heQogCSAqIGhhdmUgYmVlbiBwaW5uZWQgYnkgdGhl
IHBhcmVudCBwcm9jZXNzLiAgSWYgc28sCiAJICogaW5zdGVhZCBvZiB3cnByb3RlY3QgdGhlIHB0
ZSBvbiBib3RoIHNpZGVzLCB3ZSBjb3B5CkBAIC04MTUsNDYgKzgxMywyMiBAQCBjb3B5X3ByZXNl
bnRfcGFnZShzdHJ1Y3QgbW1fc3RydWN0ICpkc3RfbW0sIHN0cnVjdCBtbV9zdHJ1Y3QgKnNyY19t
bSwKIAkgKiB0aGUgcGlubmVkIHBhZ2Ugd29uJ3QgYmUgcmFuZG9tbHkgcmVwbGFjZWQgaW4gdGhl
CiAJICogZnV0dXJlLgogCSAqCi0JICogVG8gYWNoaWV2ZSB0aGlzLCB3ZSBkbyB0aGUgZm9sbG93
aW5nOgotCSAqCi0JICogMS4gV3JpdGUtcHJvdGVjdCB0aGUgcHRlIGlmIGl0J3Mgd3JpdGFibGUu
ICBUaGlzIGlzCi0JICogICAgdG8gcHJvdGVjdCBjb25jdXJyZW50IHdyaXRlIGZhc3QtZ3VwIHdp
dGgKLQkgKiAgICBGT0xMX1BJTiwgc28gdGhhdCB3ZSdsbCBmYWlsIHRoZSBmYXN0LWd1cCB3aXRo
Ci0JICogICAgdGhlIHdyaXRlIGJpdCByZW1vdmVkLgotCSAqCi0JICogMi4gQ2hlY2sgcGFnZV9t
YXliZV9kbWFfcGlubmVkKCkgdG8gc2VlIHdoZXRoZXIgdGhpcwotCSAqICAgIHBhZ2UgbWF5IGhh
dmUgYmVlbiBwaW5uZWQuCisJICogVGhlIHBhZ2UgcGlubmluZyBjaGVja3MgYXJlIGp1c3QgImhh
cyB0aGlzIG1tIGV2ZXIKKwkgKiBzZWVuIHBpbm5pbmciLCBhbG9uZyB3aXRoIHRoZSAoaW5leGFj
dCkgY2hlY2sgb2YKKwkgKiB0aGUgcGFnZSBjb3VudC4gVGhhdCBtaWdodCBnaXZlIGZhbHNlIHBv
c2l0aXZlcyBmb3IKKwkgKiBmb3IgcGlubmluZywgYnV0IGl0IHdpbGwgd29yayBjb3JyZWN0bHku
CiAJICoKLQkgKiBUaGUgb3JkZXIgb2YgdGhlc2Ugc3RlcHMgaXMgaW1wb3J0YW50IHRvIHNlcmlh
bGl6ZQotCSAqIGFnYWluc3QgdGhlIGZhc3QtZ3VwIGNvZGUgKGd1cF9wdGVfcmFuZ2UoKSkgb24g
dGhlCi0JICogcHRlIGNoZWNrIGFuZCB0cnlfZ3JhYl9jb21wb3VuZF9oZWFkKCksIHNvIHRoYXQK
LQkgKiB3ZSdsbCBtYWtlIHN1cmUgZWl0aGVyIHdlJ2xsIGNhcHR1cmUgdGhhdCBmYXN0LWd1cAot
CSAqIHNvIHdlJ2xsIGNvcHkgdGhlIHBpbm5lZCBwYWdlIGhlcmUsIG9yIHdlJ2xsIGZhaWwKLQkg
KiB0aGF0IGZhc3QtZ3VwLgotCSAqCi0JICogTk9URSEgRXZlbiBpZiB3ZSBkb24ndCBlbmQgdXAg
Y29weWluZyB0aGUgcGFnZSwKLQkgKiB3ZSB3b24ndCB1bmRvIHRoaXMgd3Jwcm90ZWN0KCksIGJl
Y2F1c2UgdGhlIG5vcm1hbAotCSAqIHJlZmVyZW5jZSBjb3B5IHdpbGwgbmVlZCBpdCBhbnl3YXku
Ci0JICovCi0JaWYgKHB0ZV93cml0ZShwdGUpKQotCQlwdGVwX3NldF93cnByb3RlY3Qoc3JjX21t
LCBhZGRyLCBzcmNfcHRlKTsKLQotCS8qCi0JICogVGhlc2UgYXJlIHRoZSAibm9ybWFsbHkgd2Ug
Y2FuIGp1c3QgY29weSBieSByZWZlcmVuY2UiCi0JICogY2hlY2tzLgorCSAqIEFub3RoZXIgaGV1
cmlzdGljIGlzIHRvIGp1c3QgY2hlY2sgdGhlIG1hcGNvdW50IGZvcgorCSAqIHRoaXMgcGFnZS4g
SWYgaXQgaXMgbWFwcGVkIGVsc2V3aGVyZSwgaXQgYWxyZWFkeSBpcworCSAqIG5vdCBhbiBleGNs
dXNpdmVseSBwaW5uZWQgcGFnZSwgYW5kIGRvaW5nIGFub3RoZXIKKwkgKiAiY29weSBieSByZWZl
cmVuY2UiIGlzbid0IGdvaW5nIHRvIG1hdHRlci4KIAkgKi8KIAlpZiAobGlrZWx5KCFhdG9taWNf
cmVhZCgmc3JjX21tLT5oYXNfcGlubmVkKSkpCiAJCXJldHVybiAxOwogCWlmIChsaWtlbHkoIXBh
Z2VfbWF5YmVfZG1hX3Bpbm5lZChwYWdlKSkpCiAJCXJldHVybiAxOwotCi0JLyoKLQkgKiBVaGh1
aC4gSXQgbG9va3MgbGlrZSB0aGUgcGFnZSBtaWdodCBiZSBhIHBpbm5lZCBwYWdlLAotCSAqIGFu
ZCB3ZSBhY3R1YWxseSBuZWVkIHRvIGNvcHkgaXQuIE5vdyB3ZSBjYW4gc2V0IHRoZQotCSAqIHNv
dXJjZSBwdGUgYmFjayB0byBiZWluZyB3cml0YWJsZS4KLQkgKi8KLQlpZiAocHRlX3dyaXRlKHB0
ZSkpCi0JCXNldF9wdGVfYXQoc3JjX21tLCBhZGRyLCBzcmNfcHRlLCBwdGUpOworCWlmIChfX3Bh
Z2VfbWFwY291bnQocGFnZSkgPiAxKQorCQlyZXR1cm4gMTsKIAogCW5ld19wYWdlID0gKnByZWFs
bG9jOwogCWlmICghbmV3X3BhZ2UpCg==
--000000000000deeb1a05b12bcd0b--
