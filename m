Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DEB29980F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Oct 2020 21:35:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CKmn11gMzzDqPj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Oct 2020 07:35:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::144;
 helo=mail-lf1-x144.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=JDFEz1Z+; 
 dkim-atps=neutral
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CKmlY0726zDqPG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Oct 2020 07:34:13 +1100 (AEDT)
Received: by mail-lf1-x144.google.com with SMTP id h6so13877157lfj.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Oct 2020 13:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ACP42UCPZC0vmZHAXGjbnSsMTmLOQ+k7BANgbzBdmHc=;
 b=JDFEz1Z+CsmWTeME3clWFGO+2+dJW7zjxmL+2uh6H7ZlR+OWpH9MIc1pezLVSRon7B
 55j1VaDTLlR2dn4klq6PgExMzdUQcYV4fNVnEc9K9fMooZT4kQAStIpTWH02GLqeI4Sj
 sJOVLzOeikIBBjAv+vQgoIlo0hUH30twNOQf4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ACP42UCPZC0vmZHAXGjbnSsMTmLOQ+k7BANgbzBdmHc=;
 b=svDWi1j6d+FQN7YSDiVXYjloFAvI2r3zvjwlNZOAPCo7sedXLCsmFUJcAUStVVk47V
 g2xdXTSlMbB3X9AxHvvfZS6DPLOw9URj/TlVAjN3nsIBRTJiI8FA0/anFzb42nPlCV4b
 U73dbtT1xkQTnfS2oH9lBvgRyKKUyxNE8vKf08pLBHjzmZMu97dW9b4LtTNCjE7/uOWl
 ahXY/sYshtTIZBbtri6dG/JnBVMxEgxTXLrB4OOqneZsrRHQu+0YGBx/RNgc64mclpCg
 2gmf06JFzVpdRWPQ0rNwPOptFffgX3y6oRmOhDLl7Se/G9WOdJX+B9rUfyRFDWaYb5gQ
 FNaQ==
X-Gm-Message-State: AOAM533JbJdXa2TFDTd6et43X6dN0Lwtzj9KDrf3T65Rvv6C7TQRYSp1
 5F5msPiv9fLvO8YrCkBZGm4mdghnNRtE4g==
X-Google-Smtp-Source: ABdhPJwL+UbpKY7MS8KoTlSp9t4fYH9ogsJTh4HcF80qKVXKPTxZbUWydnKrqgITLvayUUQAs6p9WQ==
X-Received: by 2002:ac2:4dad:: with SMTP id h13mr6263711lfe.351.1603744446671; 
 Mon, 26 Oct 2020 13:34:06 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com.
 [209.85.208.169])
 by smtp.gmail.com with ESMTPSA id r6sm1156037lfm.242.2020.10.26.13.34.05
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2020 13:34:05 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id m20so11824822ljj.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Oct 2020 13:34:05 -0700 (PDT)
X-Received: by 2002:a2e:a16b:: with SMTP id u11mr234204ljl.421.1603744445140; 
 Mon, 26 Oct 2020 13:34:05 -0700 (PDT)
MIME-Version: 1.0
References: <fe8abcc88cff676ead8ee48db1e993e63b0611c7.1603327264.git.joe@perches.com>
 <20201026194127.GA106214@roeck-us.net>
In-Reply-To: <20201026194127.GA106214@roeck-us.net>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 26 Oct 2020 13:33:48 -0700
X-Gmail-Original-Message-ID: <CAHk-=whjhHuwANGerJLJyn7jXCfMQMiaBAW+o2r_T+n=Ki+New@mail.gmail.com>
Message-ID: <CAHk-=whjhHuwANGerJLJyn7jXCfMQMiaBAW+o2r_T+n=Ki+New@mail.gmail.com>
Subject: Re: [PATCH] treewide: Convert macro and uses of __section(foo) to
 __section("foo")
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: multipart/mixed; boundary="000000000000f6c96705b298d94b"
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
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Joe Perches <joe@perches.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--000000000000f6c96705b298d94b
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 26, 2020 at 12:41 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> make ARCH=um SUBARCH=x86_64 defconfig:
>
> Building um:defconfig ... failed
> --------------
> Error log:
> arch/um/kernel/skas/clone.c:24:16: error: expected declaration specifiers or '...' before string constant
> arch/x86/um/stub_segv.c:11:16: error: expected declaration specifiers or '...' before string constant

Weird. Is __section() not defined somehow for those files?

It does look like they have very minimal headers, so undoing that
patch just for those two files is likely the right thing to do.

> As with s390, reverting this patch fixes the problem.

s390 should be fixed already.

Is the attached minimal patch sufficient for um to get back to working
order, or is there something else hiding there too?

                   Linus

--000000000000f6c96705b298d94b
Content-Type: application/octet-stream; name=patch
Content-Disposition: attachment; filename=patch
Content-Transfer-Encoding: base64
Content-ID: <f_kgr00tti0>
X-Attachment-Id: f_kgr00tti0

IGFyY2gvdW0va2VybmVsL3NrYXMvY2xvbmUuYyB8IDIgKy0KIGFyY2gveDg2L3VtL3N0dWJfc2Vn
di5jICAgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBiL2FyY2gvdW0va2VybmVsL3NrYXMvY2xvbmUuYyBhL2FyY2gv
dW0va2VybmVsL3NrYXMvY2xvbmUuYwppbmRleCA5NWMzNTUxODFkY2QuLmJmYjcwYzQ1NmIzMCAx
MDA2NDQKLS0tIGIvYXJjaC91bS9rZXJuZWwvc2thcy9jbG9uZS5jCisrKyBhL2FyY2gvdW0va2Vy
bmVsL3NrYXMvY2xvbmUuYwpAQCAtMjEsNyArMjEsNyBAQAogICogb24gc29tZSBzeXN0ZW1zLgog
ICovCiAKLXZvaWQgX19zZWN0aW9uKCIuX19zeXNjYWxsX3N0dWIiKQordm9pZCBfX2F0dHJpYnV0
ZV9fICgoX19zZWN0aW9uX18gKCIuX19zeXNjYWxsX3N0dWIiKSkpCiBzdHViX2Nsb25lX2hhbmRs
ZXIodm9pZCkKIHsKIAlzdHJ1Y3Qgc3R1Yl9kYXRhICpkYXRhID0gKHN0cnVjdCBzdHViX2RhdGEg
KikgU1RVQl9EQVRBOwpkaWZmIC0tZ2l0IGIvYXJjaC94ODYvdW0vc3R1Yl9zZWd2LmMgYS9hcmNo
L3g4Ni91bS9zdHViX3NlZ3YuYwppbmRleCBmZGNkNThhZjcwN2EuLjI3MzYxY2JiN2NhOSAxMDA2
NDQKLS0tIGIvYXJjaC94ODYvdW0vc3R1Yl9zZWd2LmMKKysrIGEvYXJjaC94ODYvdW0vc3R1Yl9z
ZWd2LmMKQEAgLTgsNyArOCw3IEBACiAjaW5jbHVkZSA8c3lzZGVwL21jb250ZXh0Lmg+CiAjaW5j
bHVkZSA8c3lzL3Vjb250ZXh0Lmg+CiAKLXZvaWQgX19zZWN0aW9uKCIuX19zeXNjYWxsX3N0dWIi
KQordm9pZCBfX2F0dHJpYnV0ZV9fICgoX19zZWN0aW9uX18gKCIuX19zeXNjYWxsX3N0dWIiKSkp
CiBzdHViX3NlZ3ZfaGFuZGxlcihpbnQgc2lnLCBzaWdpbmZvX3QgKmluZm8sIHZvaWQgKnApCiB7
CiAJdWNvbnRleHRfdCAqdWMgPSBwOwo=
--000000000000f6c96705b298d94b--
