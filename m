Return-Path: <linuxppc-dev+bounces-6803-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA36DA56CE7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Mar 2025 17:01:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z8WH75kVvz3c8Y;
	Sat,  8 Mar 2025 03:01:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741363267;
	cv=none; b=Bzx49JPhcY+utTvZ4kZeUkIu8ehoHQLYQvW7tSeR9nicc3IifuVXAt2ZFv5PUBTsYYBVPIrXceeeQ7EL31jp5a4yXLDGPB6E4EDqg25WLis78IDSqn0vJP+8lg0s6yi7t6pHrRKnnvrfUlHHJHMSvzOIKsWxGd0V5k9v5L3s8h4ALvmdUAoh1/zGIqlVEu2TvSizsxAXvSS5Q/2o2E2SMRawtZGt3u0YrK2s3Iozd5G5yf/xprDk2xQv9vOHNdbdc2YzyrIYtg9wh6WtIz8H4vN8fJCWLHhfcgW/FSQjgPMb5kcmDaSsVjzyt3cnroEz60hoEdPmydLwsYs6TG3jtg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741363267; c=relaxed/relaxed;
	bh=B0Iktfq0DR02GmBsXbOGq/r2zfQq6D1ECaT1ooK1s1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ooi2uV3EG9oq5poXcrz+WzifPlZVUI+YvsVidh4mnkOi42UwzYa1B20U8RDYzJKS1bj3CMdxNYfCzevnJR3Tp1jkIDi1V99GY/1eSns4LUU4NWEJ60Idpn4hrGNDFo9T1H/dXxg38WlhgOoy8hsi8g7L6f5b4TTXmIUbFS96KjZ6OxDq1JjQ4RnOm0ftXyQx6RzaDJUZW4SBFjAOxKqbRArSztQpA754r/bS4U08CUSW4gkqW9L5+r94C7L1tL1McPQhKPPInrwfMMnF9JcRrWwayy8XlOqgmVJQOOm4K5A9+0RPov+3BrL3I0gTQX1p9HYdOJnzTR2wYUvE+cVp+A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=XIF05AMB; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=XIF05AMB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z8WH60tmHz30T0
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Mar 2025 03:01:05 +1100 (AEDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-390f69f8083so1723603f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Mar 2025 08:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741363262; x=1741968062; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B0Iktfq0DR02GmBsXbOGq/r2zfQq6D1ECaT1ooK1s1o=;
        b=XIF05AMBIiu4mUOZGD/Z9XD4vyo12/B5bqFJnSVFTcoJJGIc0tbVRsS6hqdr2RwVVo
         DAI7+J6PrJrnQNGNsaiC83+nOqTk9qi4pkVU2XHSlzXWQ3IvS8neea3Pnaae9GzbgC+X
         X48APj26Elt5INN/WMU3KLw/bsPtkf0/7V2VTJv3rmL43W8L6ky1y4ukhK7+xNWaAV7E
         6Y3Ao6shqKXVAh04im5JuXfIA4E83Eg6/MbeHmjRjkOr9zNTgiMA0abo/dILgs2WKsan
         cjrl2ASXgIMOgDLoZYo7b0+agcpNFiay0OpMUToJPyNMmF/N9oXeR1BY03wf2et7u6Zh
         xkoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741363262; x=1741968062;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B0Iktfq0DR02GmBsXbOGq/r2zfQq6D1ECaT1ooK1s1o=;
        b=WOdTnqib62xLqZeVGnQlsQfUwOZwqFdSlSACx/xah50EkoVmIHQznp8PoSBaw9CFX7
         1xUlXgGgp0IU4k5ZBJxW50KO+UhlN4LZ/rJl29yYxyPXNFBmoVhbKwAJ6eTKZwH9FMsr
         aAR1nRBJ0WH2OHaD4uuhJ+Zl0e5ePcilICErYKs2Obe2DbIt0HFqnY6PLFt9s7Wv5U8c
         QhMEOkoBz5QVHPMZciPbSweQQ23a43NkwJkMZTUGWdZ4mEHGQeoWDVaIKWZuCbvHTo41
         Mg79O2jtzWxnNJG6WGbmMsuLBfYBQE5LBdK7xDevEUX8vMX4pddKbBYS/mVnib8lTpRe
         jQrw==
X-Forwarded-Encrypted: i=1; AJvYcCUU/dlI2y/cSvPxPYI/ch+FyWcZdw7myhsSCv/qZRc0k7WihqghF4Ky4ARblqf6j3BKIK0zC6WZwj0+6zY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwFGzYLm40LMFk9yAXhXmenVW2mX4/5mc22W0mWmwV9NuUGww+Y
	ay8dp61LqYyXO49V8t4kW4BHY4h1jJiE6jaKsCH5s2n76xgh2wVv8zQ8sRuY4bg=
X-Gm-Gg: ASbGncvx/cHaJfv4jbXg/dwrVxAC4bPk4X+rVVWDgZ7e73kGrE+HfrykHvDqFo+1YdH
	5XWrlgp+aOfAMeLmdAlDeFnaCZ5T4Te8JYG4X0wq7IaA7xx8MmBPYrEpYO91I9IkwM6LpyoVEqi
	gXqkla3H2OS3D6ZqYbCkw/8Pe+VGWX2XoiKHs4tPtdzqvx+g3AFMiJUxu1t1zjkD/iGz6HYDlD7
	0mujuTRlOKI+9NAZoYVuYWMbXbyAG89QWYJ2ihdKVtaWpjRYg8933Y1uLazXEF0IuleBX7YFQ5m
	Gf5U0RqInT4a+LCiozN29uNO489td1XnprU30NbMtCY0zSw=
X-Google-Smtp-Source: AGHT+IGwC5RdI2D2x8Mf/1yhLk8SnYyj3NhjKRRM+PHR4SpMZigqBSsZD7IJQFmATNxMAv0Q3Kbu9Q==
X-Received: by 2002:a05:6000:4185:b0:38d:e572:4dc2 with SMTP id ffacd0b85a97d-39132d98d2cmr2269618f8f.40.1741363260299;
        Fri, 07 Mar 2025 08:01:00 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bdd8da473sm54801455e9.18.2025.03.07.08.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 08:00:59 -0800 (PST)
Date: Fri, 7 Mar 2025 17:00:58 +0100
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
Message-ID: <Z8sYOm4qovtdOSI7@pathway.suse.cz>
References: <20250221-printf-kunit-convert-v5-0-5db840301730@gmail.com>
 <20250221-printf-kunit-convert-v5-1-5db840301730@gmail.com>
 <Z8mUH0comOCpycpK@pathway.suse.cz>
 <CAJ-ks9nFSzRXFauavzSWhvhr2Rou7qqkWi_LZ=4e1Tyr4_bn3g@mail.gmail.com>
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
In-Reply-To: <CAJ-ks9nFSzRXFauavzSWhvhr2Rou7qqkWi_LZ=4e1Tyr4_bn3g@mail.gmail.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu 2025-03-06 09:25:43, Tamir Duberstein wrote:
> On Thu, Mar 6, 2025 at 7:25 AM Petr Mladek <pmladek@suse.com> wrote:
> >
> > On Fri 2025-02-21 15:34:30, Tamir Duberstein wrote:
> > > Convert the printf() self-test to a KUnit test.
> > >
> > > In the interest of keeping the patch reasonably-sized this doesn't
> > > refactor the tests into proper parameterized tests - it's all one big
> > > test case.
> > >
> > > --- a/lib/test_printf.c
> > > +++ b/lib/tests/printf_kunit.c
> > > @@ -57,52 +58,50 @@ do_test(int bufsize, const char *expect, int elen,
> > >       va_end(aq);
> > >
> > >       if (ret != elen) {
> > > -             pr_warn("vsnprintf(buf, %d, \"%s\", ...) returned %d, expected %d\n",
> > > +             tc_fail("vsnprintf(buf, %d, \"%s\", ...) returned %d, expected %d",
> >
> > 1. It looks a bit strange that the 1st patch replaces pr_warn() with
> >    tc_fail() which hides KUNIT_FAIL().
> >
> >    And the 2nd patch replaces tc_fail() with KUNIT_FAIL().
> >
> >    It looks like a non-necessary churn.
> >
> >    It would be better to avoid the temporary "tc_fail" and swith to
> >    KUNIT_FAIL() already in this patch.
> >
> >    I did not find any comment about this in the earier versions of the
> >    patchset.
> >
> >    Is it just a result of the evolution of the patchset or
> >    is there any motivation for this?
> 
> The motivation was to keep the width of the macro the same in this
> first patch for ease of review, particularly in the 7 instances where
> the invocation wraps to a second line. If you prefer I go straight to
> KUNIT_FAIL, I can make that change.

I see. It might have been useful when the patch removed the trailing '\n'.
But you are going to add it back. So there won't be any hidden change.
So I would prefer to go straight to KUNIT_FAIL().

> > > @@ -842,13 +836,15 @@ test_pointer(void)
> > >       fourcc_pointer();
> > >  }
> > >
> > > -static void __init selftest(void)
> > > +static void printf_test(struct kunit *test)
> > >  {
> > >       alloced_buffer = kmalloc(BUF_SIZE + 2*PAD_SIZE, GFP_KERNEL);
> > >       if (!alloced_buffer)
> > >               return;
> >
> > I would use here:
> >
> >         KUNIT_ASSERT_NOT_NULL(test, alloced_buffer);
> >
> > And move the same change for the other kmalloc() location from
> > the 2nd patch.
> 
> I didn't do that here because I was trying to keep this patch as small
> as possible, and I wrote that in the commit message.
> 
> As for using KUNIT_ASSERT_NOT_NULL here, that would have to change
> back to an error return in the 2nd patch because this code moves into
> `suite_init`, which is called with `struct kunit_suite` rather than
> `struct kunit_test`, and KUnit assertion macros do not work with the
> former (and for good reason, because failures in suite setup cannot be
> attributed to a particular test case).

I see. KUNIT_ASSERT_NOT_NULL() can't be used in the .suite_exit() callback.

> So I'd prefer to leave this as is.

I agree to leave this as is.

Best Regards,
Petr

