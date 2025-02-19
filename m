Return-Path: <linuxppc-dev+bounces-6359-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3235A3CA95
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2025 21:58:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yypf213TQz30TZ;
	Thu, 20 Feb 2025 07:58:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::233"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739998730;
	cv=none; b=den9qidhRG1W/xVKKOjrAIPlD1LCSpZUP+LFcf33Fmfq/xdmXLUi0bvvP7vrtFPySK9QHpksJVuLn9s2J+Z9IKM5h8v3U4oIYynu1N7BY8886BRegSFGQhKEwDGbFOInr9acmSx/ady51opn6Pwz26nFNdF2kVD55vY/E9wyaLCzuSUlaTnAhdnk3UfHwi0TG9rdeYQelby/Rs24wYUzgwkMVIKSqV8A1pdToEs/mSbERRkR962jK6OkLvhBl4RP6IVOkMjDgnZ7zxSrxUaAXc2AqQFcNXP0zA43TcMRfcZynuCNVDv6ZH0kJCywmWyQsByuGTY4IzqMUFBeeGPdhg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739998730; c=relaxed/relaxed;
	bh=29zpgtmqkMxdyASEnJJCIlnqLj+EywBz14CpRjuAKx4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VjR6W2MBX1+sYa+BPHHNwYdfCGcEZrqje0eFqc7bIw0OulAlfihHi/G0KSKlO3BYoCUJOQsfWi52L9p80yIh5AaF4b4gkHtcwLdoAfAeg3sUax1wn94ZdTMismWnGnZXALoqYapVGaELGm2VLxWFwN8xROMvjh0ROHiAJ/LQHTmCqcu7gzT29Ebd6qBaBLvHLY+PTy5g+p67KXdAawAdq+j44YccmU4uNEO30NZdtW8KSBbw7pJhINPyZR6msUhGqS7KiLUm7EPLAlJ4odFV1NueSdZnF9diTLCR/TWsWb1rTu+F35oI6vt0Z3YqwaO4ruetBZvacmm6RjPJnLVNUA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UWb3H+OM; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com; envelope-from=tamird@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UWb3H+OM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com; envelope-from=tamird@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yypf05y5Vz30TM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2025 07:58:48 +1100 (AEDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-3098088c630so1800551fa.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2025 12:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739998725; x=1740603525; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=29zpgtmqkMxdyASEnJJCIlnqLj+EywBz14CpRjuAKx4=;
        b=UWb3H+OMoG8ltQ/NKXyRO5LWrIgILM0eRwV102y0NRRxyyGJs7qA0tTuj5GxBovA1I
         zmlhAUDP41AIkJU9eZwCClEio8unYGX0dmMovYBUK5kWUgJdD9saH6TsHQxLsgfxndcY
         +WPlcMT6zat88qYE2twgbBjeEKnP/U3whquYzHTGqL5gDmIRhZNQx9eLi9SvVcAsUior
         HhfEeSIlqh7DgodEfTe7h1GNoR0qcgFz2xFbmYjjNiDr3cKXs1KVkammz5xxhg+VVaeb
         jQV9JpDsIlP0prHdqsUUcxvNfAXxriyjvlKjOkq4piPOkYZc0qsw4mnambKCe8PHNVBN
         MMMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739998725; x=1740603525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=29zpgtmqkMxdyASEnJJCIlnqLj+EywBz14CpRjuAKx4=;
        b=AmQj3qm5MnoXq2GxxCEURg7hFG7cQBlV6GmGpbTZ0acToncLEpyKqr6GaiG4JFpfoq
         KpyXvuMPrfRTR1VxyBnUeeb5tWz+B8yVlXbNCmrpCJ6VGwUlolRDsm5qvQ/NGu7vW7Sd
         V7+eYufwYuYEzcPS4NjbcKcbyr4iF7e1IMyTN48W0ML4Hyucm30upJWJLpVT/4g0fxwN
         oxzNFtDb+vmzvVodghtbIvz0YpLa+XlDsCVvWkIcuFvQQayxEWktdDoX+iv+9v/irpEm
         KQYLd34VP7+0qIQCP61hNe58w2TP2N58Muav3B7BQOe2W3qn9lRjFev7VmYbw/JlpPjt
         eYBQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8EUxskLT0xYewlQU7Ed6NA647H/21tKB/ujhLfiztGX+hwgJN5NkaSqZFlgn/wAC7Y909TKtTpaAkEHo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyZdlho4zFUj234O5vkvf6L8l30ECed4SosiMerffZix93faXZe
	3oiS/33WXT6Vx1/IJebIl+wg2qYo3QImFdbZetQ/4kHIbvT3onfqCc/lROcZbJIDO9I8P/m5rdp
	u86tgElAJ88TFrshGjOtsSpXIU9Q=
X-Gm-Gg: ASbGncuEZJBZfMFM/dOCyjwy8tzOBz8TD6idF6rcR4XTrFqr23MYfzSNPkDHcoyjje6
	tHP5wuoWZ1e2zb+35ThP8yc72eaMW75n6cN7dBSeMsyUgPYyRwjBW3Lj+DEzUzrnVtPB0XSMMHy
	82pMokEyRhPrX2
X-Google-Smtp-Source: AGHT+IGoT3bsf2kdFagKyysGj4sdKTWGjnr/6od8iw5I/qyGVa7OesRWN+3jUei2+ekugunoU+v2tNYtkTv+DDddmPk=
X-Received: by 2002:a2e:b60e:0:b0:308:f4cc:9505 with SMTP id
 38308e7fff4ca-30927a577c6mr53587141fa.2.1739998724732; Wed, 19 Feb 2025
 12:58:44 -0800 (PST)
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
References: <20250214-printf-kunit-convert-v4-0-c254572f1565@gmail.com>
 <20250214-printf-kunit-convert-v4-3-c254572f1565@gmail.com> <CAKwiHFh52-_ssWjC3wdtZ=92AHAw7grnDugZpmf7T962VQrEbQ@mail.gmail.com>
In-Reply-To: <CAKwiHFh52-_ssWjC3wdtZ=92AHAw7grnDugZpmf7T962VQrEbQ@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 19 Feb 2025 15:58:08 -0500
X-Gm-Features: AWEUYZllpGxIALFm_VU7C7f0caMYFvyxidAHTXkA2rezSlvudlun8QXj74kF6fQ
Message-ID: <CAJ-ks9kadHvF3gKjZh-_oFdb1x_qOR6i1=Jamuaw9iq129gOnQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] printf: implicate test line in failure messages
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Arpitha Raghunandan <98.arpi@gmail.com>, David Gow <davidgow@google.com>, 
	Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Brendan Higgins <brendan.higgins@linux.dev>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Feb 19, 2025 at 3:41=E2=80=AFPM Rasmus Villemoes
<linux@rasmusvillemoes.dk> wrote:
>
> On Fri, 14 Feb 2025 at 22:53, Tamir Duberstein <tamird@gmail.com> wrote:
> >
> > This improves the failure output by pointing to the failing line at the
> > top level of the test, e.g.:
> >       # test_number: EXPECTATION FAILED at lib/printf_kunit.c:103
> >   lib/printf_kunit.c:167: vsnprintf(buf, 256, "%#-12x", ...) wrote '0x1=
234abcd  ', expected '0x1234abce  '
> >       # test_number: EXPECTATION FAILED at lib/printf_kunit.c:142
> >   lib/printf_kunit.c:167: kvasprintf(..., "%#-12x", ...) returned '0x12=
34abcd  ', expected '0x1234abce  '
> >
>
> Actually, I'm not sure that is an improvement as-is, with the two
> different line numbers being printed. It takes some thought to
> recognize which one is relevant and which one is not.

They're both relevant -- `do_test` does a bunch of checks, so you want
to know which particular check failed, but also which invocation at
the top level resulted in that check failing.

> Can't we have a variant of KUNIT_FAIL that allows one to pass the
> file/line info when the caller has better info than the location of
> the KUNIT_FAIL itself?
>
> >  static void __printf(5, 0)
> > -do_test(struct kunit *kunittest, int bufsize, const char *expect, int =
elen,
> > -       const char *fmt, va_list ap)
> > +do_test(struct kunit *kunittest, const char *file, const int line, int=
 bufsize, const char *expect,
> > +       int elen, const char *fmt, va_list ap)
>
> This can't be right, the __printf attribute must be updated accordingly.

Good catch. Oddly I'm not able to reproduce any compiler complaints
here, even with the attribute completely removed.

