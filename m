Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2507F966C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Nov 2023 00:22:12 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=GtqWiLYL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sdl9Z2dqzz3cW8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Nov 2023 10:22:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=GtqWiLYL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sdl8k18rrz2xm6
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Nov 2023 10:21:23 +1100 (AEDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-54af1daf6a9so4511786a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Nov 2023 15:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1701040878; x=1701645678; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kOAE1RED/Xp8KBHUMud6deuOummGFwkrCkMa9fkb62w=;
        b=GtqWiLYLzxyAwKyilWZ2Gp+BFfXk02iRfs+6e4xb7Fx4imB77ytxRuVUbz7J0zmc4t
         unk7E1PqkRU5Q5Rld23pcegx3EBXrnSDRxtpV7efMMMt1+xYiyDdh2LXvQmdQFEluV6m
         V4Oejguj6xBGDKO2Vn48nECTJOFDdRHia+7ng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701040878; x=1701645678;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kOAE1RED/Xp8KBHUMud6deuOummGFwkrCkMa9fkb62w=;
        b=rkYVSNjsgVmSiZMLDqtzbws14i50JZIZTN9MflMgKAy7LNtCjSBtIrbAo/CFJBDMwt
         +0ZXxRRfxdgamIQxmK8gkZg29dJzrE0wuXZ3VKJcsdIjToMjIFei20bks8ZTTqkwCzjH
         q0x+wzIowiIVwfGG1EwXa1GxvWrKyonzVQdTkiwm1p13+E9FMD1dp3prlNvs3YQ0Bh89
         YYC6ioR9Z+GThmToRHxuSOdlQodjdyFvf2W9yPdiQWVQGNGqiadjX6T137zea+0DAl5p
         LTuViWehN7skpyxKZ10MjNB6PGEdbgPCnkvbX3RgliO0vymBP/F8HHaI9Flkz838uZaU
         IOHw==
X-Gm-Message-State: AOJu0YyzNRX8N1rBRIdzPsfgnxqjj4epTqLvtRPfD5Sk6XVKS+fT00Ey
	QwibWHCuGLDvmCX51Hmv2pRBGDDz2PZnsS0wYEWahCmZ
X-Google-Smtp-Source: AGHT+IEPWqORIJA0vnglcuP2EXW2syCMlICwxf1sltcA9wGg778GnxozMMmi06x6u2aHXyAATKAhWg==
X-Received: by 2002:a05:6402:294:b0:54b:3a63:4dcf with SMTP id l20-20020a056402029400b0054b3a634dcfmr3361683edv.2.1701040877565;
        Sun, 26 Nov 2023 15:21:17 -0800 (PST)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id h13-20020a05640250cd00b0054b06495dccsm3095828edb.31.2023.11.26.15.21.16
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Nov 2023 15:21:16 -0800 (PST)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a03a900956dso697138366b.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Nov 2023 15:21:16 -0800 (PST)
X-Received: by 2002:a17:906:105c:b0:9ae:659f:4d2f with SMTP id
 j28-20020a170906105c00b009ae659f4d2fmr9105515ejj.26.1701040875921; Sun, 26
 Nov 2023 15:21:15 -0800 (PST)
MIME-Version: 1.0
References: <202311201406.2022ca3f-oliver.sang@intel.com> <CAHk-=wjMKONPsXAJ=yJuPBEAx6HdYRkYE8TdYVBvpm3=x_EnCw@mail.gmail.com>
In-Reply-To: <CAHk-=wjMKONPsXAJ=yJuPBEAx6HdYRkYE8TdYVBvpm3=x_EnCw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 26 Nov 2023 15:20:58 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiCJtLbFWNURB34b9a_R_unaH3CiMRXfkR0-iihB_z68A@mail.gmail.com>
Message-ID: <CAHk-=wiCJtLbFWNURB34b9a_R_unaH3CiMRXfkR0-iihB_z68A@mail.gmail.com>
Subject: Re: [linus:master] [file] 0ede61d858: will-it-scale.per_thread_ops
 -2.9% regression
To: kernel test robot <oliver.sang@intel.com>
Content-Type: multipart/mixed; boundary="00000000000028aa18060b16713c"
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

--00000000000028aa18060b16713c
Content-Type: text/plain; charset="UTF-8"

On Sun, 26 Nov 2023 at 12:23, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> IOW, I might have messed up some "trivial cleanup" when prepping for
> sending it out...

Bah. Famous last words. One of the "trivial cleanups" made the code
more "obvious" by renaming the nospec mask as just "mask".

And that trivial rename broke that patch *entirely*, because now that
name shadowed the "fmode_t" mask argument.

Don't even ask how long it took me to go from "I *tested* this,
dammit, now it doesn't work at all" to "Oh God, I'm so stupid".

So that nobody else would waste any time on this, attached is a new
attempt. This time actually tested *after* the changes.

                  Linus

--00000000000028aa18060b16713c
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-Improve-__fget_files_rcu-code-generation-and-thus-__.patch"
Content-Disposition: attachment; 
	filename="0001-Improve-__fget_files_rcu-code-generation-and-thus-__.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lpg3syhx0>
X-Attachment-Id: f_lpg3syhx0

RnJvbSA0NWY3MGI1NDEzYTY1NGQyMGVhZDQxMGM1MzNlYzFkNjA0YmRiMWUyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBMaW51cyBUb3J2YWxkcyA8dG9ydmFsZHNAbGludXgtZm91bmRh
dGlvbi5vcmc+CkRhdGU6IFN1biwgMjYgTm92IDIwMjMgMTI6MjQ6MzggLTA4MDAKU3ViamVjdDog
W1BBVENIXSBJbXByb3ZlIF9fZmdldF9maWxlc19yY3UoKSBjb2RlIGdlbmVyYXRpb24gKGFuZCB0
aHVzIF9fZmdldF9saWdodCgpKQoKQ29tbWl0IDBlZGU2MWQ4NTg5YyAoImZpbGU6IGNvbnZlcnQg
dG8gU0xBQl9UWVBFU0FGRV9CWV9SQ1UiKSBjYXVzZWQgYQpwZXJmb3JtYW5jZSByZWdyZXNzaW9u
IGFzIHJlcG9ydGVkIGJ5IHRoZSBrZXJuZWwgdGVzdCByb2JvdC4KClRoZSBfX2ZnZXRfbGlnaHQo
KSBmdW5jdGlvbiBpcyBvbmUgb2YgdGhvc2UgY3JpdGljYWwgb25lcyBmb3Igc29tZQpsb2Fkcywg
YW5kIHRoZSBjb2RlIGdlbmVyYXRpb24gd2FzIHVubmVjZXNzYXJpbHkgaW1wYWN0ZWQuICBMZXQn
cyBqdXN0CndyaXRlIHRoYXQgZnVuY3Rpb24gdG8gYmV0dGVyLgoKUmVwb3J0ZWQtYnk6IGtlcm5l
bCB0ZXN0IHJvYm90IDxvbGl2ZXIuc2FuZ0BpbnRlbC5jb20+CkNjOiBDaHJpc3RpYW4gQnJhdW5l
ciA8YnJhdW5lckBrZXJuZWwub3JnPgpDYzogSmFubiBIb3JuIDxqYW5uaEBnb29nbGUuY29tPgpD
YzogTWF0ZXVzeiBHdXppayA8bWpndXppa0BnbWFpbC5jb20+CkNsb3NlczogaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvb2UtbGtwLzIwMjMxMTIwMTQwNi4yMDIyY2EzZi1vbGl2ZXIuc2FuZ0BpbnRl
bC5jb20KU2lnbmVkLW9mZi1ieTogTGludXMgVG9ydmFsZHMgPHRvcnZhbGRzQGxpbnV4LWZvdW5k
YXRpb24ub3JnPgotLS0KIGZzL2ZpbGUuYyAgICAgICAgICAgICAgIHwgNDggKysrKysrKysrKysr
KysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0KIGluY2x1ZGUvbGludXgvZmR0YWJsZS5oIHwg
MTUgKysrKysrKystLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCA0MCBpbnNlcnRpb25zKCspLCAyMyBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9mcy9maWxlLmMgYi9mcy9maWxlLmMKaW5kZXggNWZi
MGIxNDZlNzllLi42MDhiNDgwMmMyMTQgMTAwNjQ0Ci0tLSBhL2ZzL2ZpbGUuYworKysgYi9mcy9m
aWxlLmMKQEAgLTk1OSwzMSArOTU5LDQyIEBAIHN0YXRpYyBpbmxpbmUgc3RydWN0IGZpbGUgKl9f
ZmdldF9maWxlc19yY3Uoc3RydWN0IGZpbGVzX3N0cnVjdCAqZmlsZXMsCiAJCXN0cnVjdCBmaWxl
ICpmaWxlOwogCQlzdHJ1Y3QgZmR0YWJsZSAqZmR0ID0gcmN1X2RlcmVmZXJlbmNlX3JhdyhmaWxl
cy0+ZmR0KTsKIAkJc3RydWN0IGZpbGUgX19yY3UgKipmZGVudHJ5OworCQl1bnNpZ25lZCBsb25n
IG5vc3BlYzsKIAotCQlpZiAodW5saWtlbHkoZmQgPj0gZmR0LT5tYXhfZmRzKSkKKwkJLyogTWFz
ayBpcyBhIDAgZm9yIGludmFsaWQgZmQncywgfjAgZm9yIHZhbGlkIG9uZXMgKi8KKwkJbm9zcGVj
ID0gYXJyYXlfaW5kZXhfbWFza19ub3NwZWMoZmQsIGZkdC0+bWF4X2Zkcyk7CisKKwkJLyogZmRl
bnRyeSBwb2ludHMgdG8gdGhlICdmZCcgb2Zmc2V0LCBvciBmZHQtPmZkWzBdICovCisJCWZkZW50
cnkgPSBmZHQtPmZkICsgKGZkJm5vc3BlYyk7CisKKwkJLyogRG8gdGhlIGxvYWQsIHRoZW4gbWFz
ayBhbnkgaW52YWxpZCByZXN1bHQgKi8KKwkJZmlsZSA9IHJjdV9kZXJlZmVyZW5jZV9yYXcoKmZk
ZW50cnkpOworCQlmaWxlID0gKHZvaWQgKikobm9zcGVjICYgKHVuc2lnbmVkIGxvbmcpZmlsZSk7
CisKKwkJaWYgKHVubGlrZWx5KCFmaWxlKSkKIAkJCXJldHVybiBOVUxMOwogCi0JCWZkZW50cnkg
PSBmZHQtPmZkICsgYXJyYXlfaW5kZXhfbm9zcGVjKGZkLCBmZHQtPm1heF9mZHMpOworCQkvKgor
CQkgKiBPaywgd2UgaGF2ZSBhIGZpbGUgcG9pbnRlciB0aGF0IHdhcyB2YWxpZCBhdAorCQkgKiBz
b21lIHBvaW50LCBidXQgaXQgbWlnaHQgaGF2ZSBiZWNvbWUgc3RhbGUgc2luY2UuCisJCSAqCisJ
CSAqIFdlIG5lZWQgdG8gY29uZmlybSBpdCBieSBpbmNyZW1lbnRpbmcgdGhlIHJlZmNvdW50CisJ
CSAqIGFuZCB0aGVuIGNoZWNrIHRoZSBsb29rdXAgYWdhaW4uCisJCSAqCisJCSAqIGF0b21pY19s
b25nX2luY19ub3RfemVybygpIGdpdmVzIHVzIGEgZnVsbCBtZW1vcnkKKwkJICogYmFycmllci4g
V2Ugb25seSByZWFsbHkgbmVlZCBhbiAnYWNxdWlyZScgb25lIHRvCisJCSAqIHByb3RlY3QgdGhl
IGxvYWRzIGJlbG93LCBidXQgd2UgZG9uJ3QgaGF2ZSB0aGF0LgorCQkgKi8KKwkJaWYgKHVubGlr
ZWx5KCFhdG9taWNfbG9uZ19pbmNfbm90X3plcm8oJmZpbGUtPmZfY291bnQpKSkKKwkJCWNvbnRp
bnVlOwogCiAJCS8qCi0JCSAqIE9rLCB3ZSBoYXZlIGEgZmlsZSBwb2ludGVyLiBIb3dldmVyLCBi
ZWNhdXNlIHdlIGRvCi0JCSAqIHRoaXMgYWxsIGxvY2tsZXNzbHkgdW5kZXIgUkNVLCB3ZSBtYXkg
YmUgcmFjaW5nIHdpdGgKLQkJICogdGhhdCBmaWxlIGJlaW5nIGNsb3NlZC4KLQkJICoKIAkJICog
U3VjaCBhIHJhY2UgY2FuIHRha2UgdHdvIGZvcm1zOgogCQkgKgogCQkgKiAgKGEpIHRoZSBmaWxl
IHJlZiBhbHJlYWR5IHdlbnQgZG93biB0byB6ZXJvIGFuZCB0aGUKIAkJICogICAgICBmaWxlIGhh
c24ndCBiZWVuIHJldXNlZCB5ZXQgb3IgdGhlIGZpbGUgY291bnQKIAkJICogICAgICBpc24ndCB6
ZXJvIGJ1dCB0aGUgZmlsZSBoYXMgYWxyZWFkeSBiZWVuIHJldXNlZC4KLQkJICovCi0JCWZpbGUg
PSBfX2dldF9maWxlX3JjdShmZGVudHJ5KTsKLQkJaWYgKHVubGlrZWx5KCFmaWxlKSkKLQkJCXJl
dHVybiBOVUxMOwotCi0JCWlmICh1bmxpa2VseShJU19FUlIoZmlsZSkpKQotCQkJY29udGludWU7
Ci0KLQkJLyoKKwkJICoKIAkJICogIChiKSB0aGUgZmlsZSB0YWJsZSBlbnRyeSBoYXMgY2hhbmdl
ZCB1bmRlciB1cy4KIAkJICogICAgICAgTm90ZSB0aGF0IHdlIGRvbid0IG5lZWQgdG8gcmUtY2hl
Y2sgdGhlICdmZHQtPmZkJwogCQkgKiAgICAgICBwb2ludGVyIGhhdmluZyBjaGFuZ2VkLCBiZWNh
dXNlIGl0IGFsd2F5cyBnb2VzCkBAIC05OTEsNyArMTAwMiw4IEBAIHN0YXRpYyBpbmxpbmUgc3Ry
dWN0IGZpbGUgKl9fZmdldF9maWxlc19yY3Uoc3RydWN0IGZpbGVzX3N0cnVjdCAqZmlsZXMsCiAJ
CSAqCiAJCSAqIElmIHNvLCB3ZSBuZWVkIHRvIHB1dCBvdXIgcmVmIGFuZCB0cnkgYWdhaW4uCiAJ
CSAqLwotCQlpZiAodW5saWtlbHkocmN1X2RlcmVmZXJlbmNlX3JhdyhmaWxlcy0+ZmR0KSAhPSBm
ZHQpKSB7CisJCWlmICh1bmxpa2VseShmaWxlICE9IHJjdV9kZXJlZmVyZW5jZV9yYXcoKmZkZW50
cnkpKSB8fAorCQkgICAgdW5saWtlbHkocmN1X2RlcmVmZXJlbmNlX3JhdyhmaWxlcy0+ZmR0KSAh
PSBmZHQpKSB7CiAJCQlmcHV0KGZpbGUpOwogCQkJY29udGludWU7CiAJCX0KQEAgLTExMjgsMTMg
KzExNDAsMTMgQEAgc3RhdGljIHVuc2lnbmVkIGxvbmcgX19mZ2V0X2xpZ2h0KHVuc2lnbmVkIGlu
dCBmZCwgZm1vZGVfdCBtYXNrKQogCSAqIGF0b21pY19yZWFkX2FjcXVpcmUoKSBwYWlycyB3aXRo
IGF0b21pY19kZWNfYW5kX3Rlc3QoKSBpbgogCSAqIHB1dF9maWxlc19zdHJ1Y3QoKS4KIAkgKi8K
LQlpZiAoYXRvbWljX3JlYWRfYWNxdWlyZSgmZmlsZXMtPmNvdW50KSA9PSAxKSB7CisJaWYgKGxp
a2VseShhdG9taWNfcmVhZF9hY3F1aXJlKCZmaWxlcy0+Y291bnQpID09IDEpKSB7CiAJCWZpbGUg
PSBmaWxlc19sb29rdXBfZmRfcmF3KGZpbGVzLCBmZCk7CiAJCWlmICghZmlsZSB8fCB1bmxpa2Vs
eShmaWxlLT5mX21vZGUgJiBtYXNrKSkKIAkJCXJldHVybiAwOwogCQlyZXR1cm4gKHVuc2lnbmVk
IGxvbmcpZmlsZTsKIAl9IGVsc2UgewotCQlmaWxlID0gX19mZ2V0KGZkLCBtYXNrKTsKKwkJZmls
ZSA9IF9fZmdldF9maWxlcyhmaWxlcywgZmQsIG1hc2spOwogCQlpZiAoIWZpbGUpCiAJCQlyZXR1
cm4gMDsKIAkJcmV0dXJuIEZEUFVUX0ZQVVQgfCAodW5zaWduZWQgbG9uZylmaWxlOwpkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9saW51eC9mZHRhYmxlLmggYi9pbmNsdWRlL2xpbnV4L2ZkdGFibGUuaApp
bmRleCBiYzRjMzI4N2E2NWUuLjgwYmQ3Nzg5YmFiMSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51
eC9mZHRhYmxlLmgKKysrIGIvaW5jbHVkZS9saW51eC9mZHRhYmxlLmgKQEAgLTgzLDEyICs4Mywx
NyBAQCBzdHJ1Y3QgZGVudHJ5Owogc3RhdGljIGlubGluZSBzdHJ1Y3QgZmlsZSAqZmlsZXNfbG9v
a3VwX2ZkX3JhdyhzdHJ1Y3QgZmlsZXNfc3RydWN0ICpmaWxlcywgdW5zaWduZWQgaW50IGZkKQog
ewogCXN0cnVjdCBmZHRhYmxlICpmZHQgPSByY3VfZGVyZWZlcmVuY2VfcmF3KGZpbGVzLT5mZHQp
OworCXVuc2lnbmVkIGxvbmcgbWFzayA9IGFycmF5X2luZGV4X21hc2tfbm9zcGVjKGZkLCBmZHQt
Pm1heF9mZHMpOworCXN0cnVjdCBmaWxlICpuZWVkc19tYXNraW5nOwogCi0JaWYgKGZkIDwgZmR0
LT5tYXhfZmRzKSB7Ci0JCWZkID0gYXJyYXlfaW5kZXhfbm9zcGVjKGZkLCBmZHQtPm1heF9mZHMp
OwotCQlyZXR1cm4gcmN1X2RlcmVmZXJlbmNlX3JhdyhmZHQtPmZkW2ZkXSk7Ci0JfQotCXJldHVy
biBOVUxMOworCS8qCisJICogJ21hc2snIGlzIHplcm8gZm9yIGFuIG91dC1vZi1ib3VuZHMgZmQs
IGFsbCBvbmVzIGZvciBvay4KKwkgKiAnZmQmbWFzaycgaXMgJ2ZkJyBmb3Igb2ssIG9yIDAgZm9y
IG91dCBvZiBib3VuZHMuCisJICoKKwkgKiBBY2Nlc3NpbmcgZmR0LT5mZFswXSBpcyBvaywgYnV0
IG5lZWRzIG1hc2tpbmcgb2YgdGhlIHJlc3VsdC4KKwkgKi8KKwluZWVkc19tYXNraW5nID0gcmN1
X2RlcmVmZXJlbmNlX3JhdyhmZHQtPmZkW2ZkJm1hc2tdKTsKKwlyZXR1cm4gKHN0cnVjdCBmaWxl
ICopKG1hc2sgJiAodW5zaWduZWQgbG9uZyluZWVkc19tYXNraW5nKTsKIH0KIAogc3RhdGljIGlu
bGluZSBzdHJ1Y3QgZmlsZSAqZmlsZXNfbG9va3VwX2ZkX2xvY2tlZChzdHJ1Y3QgZmlsZXNfc3Ry
dWN0ICpmaWxlcywgdW5zaWduZWQgaW50IGZkKQotLSAKMi40My4wLjUuZzM4ZmIxMzdiZGIKCg==
--00000000000028aa18060b16713c--
