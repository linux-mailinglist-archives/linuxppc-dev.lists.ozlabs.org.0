Return-Path: <linuxppc-dev+bounces-6824-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4691AA57A46
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Mar 2025 13:53:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z934B059bz30CB;
	Sat,  8 Mar 2025 23:53:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::231"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741438409;
	cv=none; b=jQFn/NI/B6gRftKcMalHJUD1mkwadorqh1lTcYgr7SewLiS7Auv+C1Lmfpr7bYqFNa2xgeQ/luxUFirW623liHn/qJmmjlVSYoLxxML6rRGqKgt9ackDFQ+Mp+76iv3Tdg9Povlb5wJUwuU8sW5JmJYiiwtCPBGbUFJcMBRk3OwNLOCuRLyCW2KHG0fWeHRrSqOKk8LV2G63Ju+p1LWchZys2snRVm7AiIoFxU3xeWLZ7ca2xk7xF0uK9OO0hclkN7/ddBVUFed6e5UXkh5s7OqtMGS3tInytD1QHYKeyBr7UYlyG3tzLo9Xd30I5JYehJyJRMW2LJ8rla3UQRDekw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741438409; c=relaxed/relaxed;
	bh=1sfeeTT7Gmak9LSwhS1Ra7os+FPKWlJywEkinY+5Hwo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U1GGjwXqcdMhHBtJ++5sCG19/pSuSSx9yKljLp8zls/2pCKN4BqAOalH0tyjXJaaKVBlt82OAXBDWdeD02toJhQ70tyzkL9m221IVtH9O511kiAH76+1OzMbqFfUEof0UI6o5WANhb6e+HW1dcYnb9aU4STwe2lTrRRqWEoek1JQqFyzi7nCciO9wdoGtBcXw3ESM+aOTPruUeqXz3YH82ptwNTxRlFKD2VwT57xh2leAlsr0OOGlxYlVSQ3AHadHiftGmVOlyenflbByM/YH6dyS9lHpa1Jq+bNBY9chCAUNDUi1qXXUTVjgY050s3jVja3kPlgX1Qu4DmRxnCU/A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Kbkd2VKr; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::231; helo=mail-lj1-x231.google.com; envelope-from=tamird@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Kbkd2VKr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::231; helo=mail-lj1-x231.google.com; envelope-from=tamird@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z934906qpz305n
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Mar 2025 23:53:28 +1100 (AEDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-30761be8fa8so29183431fa.2
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 08 Mar 2025 04:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741438406; x=1742043206; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1sfeeTT7Gmak9LSwhS1Ra7os+FPKWlJywEkinY+5Hwo=;
        b=Kbkd2VKr5jjlUS0C2oZ+UcOJRSeQO9msAPGif7/JV9T7L4O/j/cygi6zWQ7URWkM/o
         9WjsJdrzE5k6joxcK9FWyeA3QH5qp+i3cGeCsEOIIlS6N39xbTINQ/f/1DZmDrVm3k3S
         y+haTxglTuDCvQoNrDIC+YLYNU/OQTn77nfdDNn7H6qhb7Rnu9R7TFrZdOaofHO+3g70
         vH/QnW8EZzjzqBloVRL+x05SzP+x1Lf4KT6O67IEEo1oSEAHacvVFMPTBdS/jpTKYO0C
         nIUYA/egQx56E5qKvfs4XnPccCRlXn9dIBv1bCa6chF+OqDmuM7by8z3tW5jLfqN/s9h
         rAIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741438406; x=1742043206;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1sfeeTT7Gmak9LSwhS1Ra7os+FPKWlJywEkinY+5Hwo=;
        b=jFN+KRCHWDDrZS9gdF6LwRm9NqFSg919ODqqSepO0jBVvMS9hf8+xmpvcowc/kJ8rR
         hOhHtyvgptLx7GtOW/T7TfcvJDVRveNOSdAc21XF4gTwXxKiiyiirvKdIuYYgHz9YRwn
         hn99brsBEjnQn/BJZDxtGoxpVk5jtYXYGT3RSZaVfwALcl1hVJ2MTq3hUb5RD130rw/G
         kTbCji6z7sgTo+J5iqewkkgsJvfSVBWL8uSrtQnPYBbaLIOFa0RcZFd2WNHSSNxEcjQo
         dA+q3INPOXCc9D/juQh1RHkcAQY1KeiPla+DFVaUMyZiDIIUdD78upQecwJDt4tRyfLI
         Apkg==
X-Forwarded-Encrypted: i=1; AJvYcCX2crlj0iDdNBoY1Diux7qlhcg1Gcnmef0DfgfE2ObzFhAeMflxq3UTqZMVrnMbmQrQt2Vi219Xn8NTud8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzMm0gOiiiPe6k4bkm3H5XMcuBhqYxbHVq6FpYOXhqfoc/IIuHO
	jNTX/YeoJm1GDtz5wOSZFq7t/2vKE8iMrPW5KPgfneNkX9OSVewma8JMQQkl4dsIXmXWTvTmqug
	Fk6bNya/rBZLMxGMVxDTTr+l9m7Y=
X-Gm-Gg: ASbGncvs0Ne/7SCCd/ppKyK7qj5YDSzlY3UvRkErKaCnNTVX8Sx751RDq48dEPzku9w
	FJlPytx8u5BxB3fwp98e0wC51Yi5w9s7+BRRMeWk4x45wEQXGjak9r9rX7rtnhT51yKCRc00uRw
	GqKVAZyDjV5saSkwSdeM+PrefnvZfbNDqGY++CFhSLnHnybAeYvSlXUjQxcVsCgY2gq6OGewY=
X-Google-Smtp-Source: AGHT+IGBc+05qVuuXjaeI2ZzjZWIrRA4Fj6//dVvSffSqc3+iAQQVbEHM/psLC4ti7AS6LxNuas3m+DVljjO7VA71i0=
X-Received: by 2002:a2e:a58b:0:b0:30b:8e06:86a3 with SMTP id
 38308e7fff4ca-30bf452d9c5mr25912651fa.16.1741438405382; Sat, 08 Mar 2025
 04:53:25 -0800 (PST)
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
References: <20250307-printf-kunit-convert-v6-0-4d85c361c241@gmail.com>
 <202503072046.34DAF614E6@keescook> <CAJ-ks9kTO-u+Wqp0K-vdMLAs08fBeoovSeb_pGkMjSHFnBKysA@mail.gmail.com>
In-Reply-To: <CAJ-ks9kTO-u+Wqp0K-vdMLAs08fBeoovSeb_pGkMjSHFnBKysA@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 8 Mar 2025 07:52:49 -0500
X-Gm-Features: AQ5f1Jo-nlWUK8722g4g1onlCZtycc6IeZsxrVSNnIky0DEy506UFGHSg9dFWWw
Message-ID: <CAJ-ks9=zHBmOApsqa=UZcKtg1cH0tp34Kt9_5AEJ7vzwt2QeOA@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] printf: convert self-test to KUnit
To: Kees Cook <kees@kernel.org>
Cc: Arpitha Raghunandan <98.arpi@gmail.com>, David Gow <davidgow@google.com>, 
	Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linuxppc-dev@lists.ozlabs.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sat, Mar 8, 2025 at 7:51=E2=80=AFAM Tamir Duberstein <tamird@gmail.com> =
wrote:
>
> On Fri, Mar 7, 2025 at 11:49=E2=80=AFPM Kees Cook <kees@kernel.org> wrote=
:
> >
> > On Fri, Mar 07, 2025 at 05:08:55PM -0500, Tamir Duberstein wrote:
> > > This is one of just 3 remaining "Test Module" kselftests (the others
> > > being bitmap and scanf), the rest having been converted to KUnit.
> > >
> > > I tested this using:
> > >
> > > $ tools/testing/kunit/kunit.py run --arch arm64 --make_options LLVM=
=3D1 printf
> > >
> > > I have also sent out a series converting scanf[0].
> > >
> > > Link: https://lore.kernel.org/all/20250204-scanf-kunit-convert-v3-0-3=
86d7c3ee714@gmail.com/T/#u [0]
> > >
> > > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> > > ---
> > > Changes in v6:
> > > - Use __printf correctly on `__test`. (Petr Mladek)
> > > - Rebase on linux-next.
> >
> > Thanks for doing this!
> >
> > If Petr, Rasmus, Andy, and/or others Ack this I can carry it in my
> > "lib/ kunit tests move to lib/tests/" tree, as that's where all the
> > infrastructure in lib/tests/ exists.
>
> I think the plan is to take it through the printk tree. We're still
> working on it, here's v6:
> https://lore.kernel.org/all/20250307-printf-kunit-convert-v6-0-4d85c361c2=
41@gmail.com/
> where I've rebased and put the test in lib/tests.

Whoops, this is already the v6 thread! Does the layout here look correct to=
 you?

