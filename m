Return-Path: <linuxppc-dev+bounces-6802-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8ECA56CA6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Mar 2025 16:55:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z8W8H6KPbz2yvv;
	Sat,  8 Mar 2025 02:55:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::335"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741362911;
	cv=none; b=Kjas+e7YppopkGHqkMlHYqjUJzcCGFeU2Cg42gZSkB0IHZMpe/STSfI0dHOdJh5AFepvfsHDDl4Cm2OS2XueDR1W0mFwufoVeEM8t0Rysfvv0RWE+LcNgdSWfcdP8ty2dB49IlyHGw7V8+KeGirzLjXd8cBc7MycLV/pYiTjtD6/zLQumJXeNMZAeR1nRwO7EiosQYDNTv//wWSDHAd9dwAoBoPeHLJ01xvlDCUrZuWFJxLNJ3ln9ZXQwbqCSTx60C8sfWsP2j5JGYNSfCQJSwuDo3j/fBr0jFZdKccCmmQQa6iF20kAPNVlHLEQgpqQtqKRQ3OEQ9m1xpcn+qhoaw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741362911; c=relaxed/relaxed;
	bh=KTIxiohPLNVVB9YfiDexvU2RO8Xj7BqvYc16wsDl4Q4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nJNDtRCj3Gpwihgki+eJqb9euOd1Yk8z/9QDiXNqYxN3JcH50j5fYcZ63fkKNQHE9A16OfocC2aNhaiE9zU4ESnZKpC+BV387zY4Aor1oiIqV+zkv9ZQ82x6W9RkfElcBN77RdW08ywcblJiSjxpkuqXKVXAyhvtJHHAyyWIJRUT1mbi4AtKpSst2z4VM9ALWniXIo/xch2mIWfaGszVWVdG/C1f28FoGs9B0rDGt27CwOwtMKVB6kUpPFswk3ERXl/RpvDCnW+ZzGfLLkZb1guqpB6nMzO3GkCNxUKAwz58uuI/8dt18azowjHqSylmoSL79osoY31Zx26/pG/SnQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=UnT3Ti+m; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=UnT3Ti+m;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z8W8F6Kq3z2yGs
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Mar 2025 02:55:08 +1100 (AEDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43bcc04d4fcso12590415e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Mar 2025 07:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741362904; x=1741967704; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KTIxiohPLNVVB9YfiDexvU2RO8Xj7BqvYc16wsDl4Q4=;
        b=UnT3Ti+maNKNCBKLWSUexOmRhmpIhk277PRfOelhY15lJUvIktB0Qx6gPvvFGHC7vT
         8HE03igV78k/dWifeMhce2PlMLPkuz3SON+bTktPXSxCuqJxGmqtFtrbC6VZblirJsUg
         MlBw51lKstGXFpvlwbS235buLJwyGGOcbCNilWuI2HsWtCJAu8Q98y5qflfxrkvA4eH6
         DzWEGRxw/BKZ6oVQjDGM7pz1yUGCZ6QkFZ0W6/3R/LlFqcjD5C9iPR9xgNs9dJ/FWwPa
         +Kd8Wl1VdIagq3iMEB6UtkPfFpzed9C4Z/BiXC0SIyVkD+d82Eg5nqFbv13iy2t2Ms2a
         jcaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741362904; x=1741967704;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KTIxiohPLNVVB9YfiDexvU2RO8Xj7BqvYc16wsDl4Q4=;
        b=oP8HLZwMG+BYp2ygLh/rad9ctCi68tYSwiU5W8GN+dajCuy6+oell30vGBucX+QKLz
         AZINu76DpPuPJxmNIeePuJvNH4+4BjRZLNenuuGxpavSLFsnf6Hsd4qVAhBulBoUoBWe
         WXEoLkOoAMUp9LlGhp3NDUZp6Do75sAobA0B6lzu3kD/RIJItgV8yqckC86f9og9AULH
         wNvES0FbhbvuUcU5uDk4edhOYaLX8ZMZpA28wopMsstx07ExlnSWp/X4t9azo84Ne6YR
         SFfe9r8ZwFeMXt+jALYwXUJ1DzCwR4UAlHAYqCv3Xnxs1tZ4kOC69Gfg1F29Dxaq57kz
         6Tfg==
X-Forwarded-Encrypted: i=1; AJvYcCV8Ve8uJFJJPS0Tg27oNSHE7TFPBRhgds6IkDH6K9AfNod4TzEfPthjpmQiY0RDqOwK91+tRqq997k3GMI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwVIgfTxA2N8wSsiHy8dtJfJ6s+HNOZXE9pIj/iC0QCAOeMUAbV
	k0SbjRX7r+6ekJul9opVdXQOZW/q7vqEnl49AJ2yHSxaiAjsnpMJ9dXi6WeKc74=
X-Gm-Gg: ASbGncuKiAGYx4WCPxwREcSul4KOKPP30aImXymOvy/eR9DMMGcUgx16N+D4ies54Ny
	3xgTe06Ef0Y/Qvdw+bghzu/Tio5COKh6ZVju2W/FWUJjGB5BsEGePgryrxjW31bkekXOS36t4zF
	hYiiPQPL4a8ugY7uzXffgZi+jFPKcCL4PyvaEU5EXAJbcZVGR75x5oF9MeAf9VDq1hDevxhEeT/
	Nb7GExWrcLhJvzVjEh5OrCbwUbKDNr9IHL4qzqjo6P47hrLqfAfii6mE4qkXgKTUXUjRrp7TNNt
	KP8TP4RzGpMHNs71mMYcBZIBnsZYGq95bnUa3JtVaSrbK/I=
X-Google-Smtp-Source: AGHT+IF1iPA/Ntx7JECcdwpFF2+Wr14YZrGvchT9BSUSo4BM6xsm3uEkcR6M6E/FoWaOSUozXYVFDA==
X-Received: by 2002:a05:600c:c6:b0:43b:c1ac:aeeb with SMTP id 5b1f17b1804b1-43cb91c58abmr23566485e9.2.1741362904110;
        Fri, 07 Mar 2025 07:55:04 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bdd8dad73sm56612925e9.19.2025.03.07.07.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 07:55:03 -0800 (PST)
Date: Fri, 7 Mar 2025 16:55:01 +0100
From: Petr Mladek <pmladek@suse.com>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Arpitha Raghunandan <98.arpi@gmail.com>,
	David Gow <davidgow@google.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v5 1/3] printf: convert self-test to KUnit
Message-ID: <Z8sW1QBgPVUmEzUd@pathway.suse.cz>
References: <20250221-printf-kunit-convert-v5-0-5db840301730@gmail.com>
 <20250221-printf-kunit-convert-v5-1-5db840301730@gmail.com>
 <Z8mUH0comOCpycpK@pathway.suse.cz>
 <CAJ-ks9nFSzRXFauavzSWhvhr2Rou7qqkWi_LZ=4e1Tyr4_bn3g@mail.gmail.com>
 <CAJ-ks9nDLGvzZ+NDAJsk2Hy1=hsCzayg4-65gk60T_WJZzOUzA@mail.gmail.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ-ks9nDLGvzZ+NDAJsk2Hy1=hsCzayg4-65gk60T_WJZzOUzA@mail.gmail.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu 2025-03-06 09:41:44, Tamir Duberstein wrote:
> On Thu, Mar 6, 2025 at 9:25 AM Tamir Duberstein <tamird@gmail.com> wrote:
> >
> > On Thu, Mar 6, 2025 at 7:25 AM Petr Mladek <pmladek@suse.com> wrote:
> > >
> > > On Fri 2025-02-21 15:34:30, Tamir Duberstein wrote:
> > > > Convert the printf() self-test to a KUnit test.
> > > >
> > > > [...]
> > > >
> >
> > > 2. What was the motivation to remove the trailing '\n', please?
> > >
> > >    It actually makes a difference from the printk() POV. Messages without
> > >    the trailing '\n' are _not_ flushed to the console until another
> > >    message is added. The reason is that they might still be appended
> > >    by pr_cont(). And printk() emits only complete lines to the
> > >    console.
> > >
> > >    In general, messages should include the trailing '\n' unless the
> > >    code wants to append something later or the trailing '\n' is
> > >    added by another layer of the code. It does not seem to be this case.
> > >
> > >
> > > >                       bufsize, fmt, ret, elen);
> > > > -             return 1;
> > > > +             return;
> > > >       }
> > >
> > > [...]
> >
> > I noticed in my testing that the trailing \n didn't change the test
> > output, but I didn't know the details you shared about the trailing
> > \n. I'll restore them, unless we jump straight to the KUNIT macros per
> > the discussion above.

> Ah, I forgot that `tc_fail` already delegates to KUNIT_FAIL. This was
> the reason I removed the trailing newlines -- there is a mix of
> present and absent trailing newlines in KUNIT_* macros, and it's not
> clear to me what the correct thing is. For instance, the examples in
> Documentation/dev-tools/kunit/{start,usage}.rst omit the trailing newlines.

Honestly, I am not able to find how the KUNIT_FAIL() actually prints
the message. I can't find how assert_format() is defined.

Anyway, it seems that for example, kunit_warn() prints the messages
as is in kunit_log(). It does not add the trailing '\n' on its own.

Also I do not see any empty lines when I add back the trailing '\n'
to KUNIT_FAIL() message. This suggests that even KUNIT_FAIL()
prints the messages as is and does not add any extra trailing '\n'.

In my opinion, using the trailing '\n' is the right thing to do
from the printk() POV. Please, add it back.

Best Regards,
Petr

