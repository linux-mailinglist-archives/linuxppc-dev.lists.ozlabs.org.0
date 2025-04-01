Return-Path: <linuxppc-dev+bounces-7420-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF15A7830E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Apr 2025 22:01:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZRzQX2T5Cz2yfL;
	Wed,  2 Apr 2025 07:01:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743537668;
	cv=none; b=Yp/SUkNhD/gVE2wE0r9sqfOHppkHAVGlkDiJlRZ2AVefbr9NIieAyT67BCOSAN6E6jCcreBIR0mlBScv6nZLJ3khfyo7p/81lp8CUPMLbMe6TDcWvZfz/2oF9KHdQYBZDjEhgjCkVcf/37uiheUUCA0A2PggOMbgm/VfvHrbeAC7tVBl+07o9FCNt7q+Af/1LKAaF9WoKMXtXQ0Yvu4/OwffO9EtTNBsWFwGs4E6bi/VZpZHqCTQNObOZRChKMgbooPhmmn9l81NTs6MiopQnYuIiw5bWt3GgBb4OKlvtFakdMQ50fOYHhE1y76QuX3Xfbr6FIr8dbsXf61ZZ2vN9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743537668; c=relaxed/relaxed;
	bh=jM6QZVFE4yOPUAkjj67yuEz/kk194Hzhle9HnSGWJfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XfGt4ouvEXhE0qzv85mbfhnVk2/msHBv7G/lsR9EZlsvl9zysXvPM8FcKa3uDqfdqLLBd7k5qC/mT5N7HB+VIo6BgdHiWeNZ4DAM+JUjSMUjTnZvKmf6r5WykZ5FjNTbbcNyzgvUXkmvgvuUbOTWOAwklwpmEB7Jq45rKnPm2xS7PCLjvmtkamWScg2B2+YpqgCiK6Jgg58Rsz9yDH90ZOk0qcqJ+Igx4YXNKlZCNSxfMTElv6pbkWDRJ4tNG5mH+LdS0gwFr6sq8l4E+X//EwNz8hWrznUaLNcUueF9MZdbUhFYz/pZ/SYmeEDbFOUn+ijyGtfV01ttDVAaepp4SQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Sj0UIMgJ; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Sj0UIMgJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZRzQR5yPxz2yVX
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Apr 2025 07:01:03 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3ABB8A4155A;
	Tue,  1 Apr 2025 19:55:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EB7BC4CEE4;
	Tue,  1 Apr 2025 20:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743537659;
	bh=SsEtymDjFxM1dLd88DEPk7b/DPbXgQcSJ+nDYJthskA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sj0UIMgJB3BhWg6Q5hThirUmVNapBvLUCssaM9xJhq4z8rINztn8U2a8VU7uKVvO+
	 KNTKB8yFVEH/6P0aJxnzC8ql/cEZBktK2XjcFkIJonPY+vNiktGaEJh1pu3KP86pOZ
	 0Z/JDChHvvi4fQgWwY2pv315OrvtUWanr7oVb/zq3/xkPyam7hR1FljADmz/mdjKmW
	 3KeD4+Bq0JfzX1PdRiolOCzdjflmaIQN6ONyog6XNtxrNEObEDL4X29f59mJiYMhry
	 cfSVpBrf0Tf8VE+sJ34qXMxAOHcRzpXoXlXhcPxZlM+YajKX9z4ArQ7bi8GhCQGACf
	 ReX1Z2plvjm5Q==
Date: Tue, 1 Apr 2025 13:00:55 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Peter Zijlstra <peterz@infradead.org>, 
	Alessandro Carminati <acarmina@redhat.com>, linux-kselftest@vger.kernel.org, 
	David Airlie <airlied@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	=?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Kees Cook <keescook@chromium.org>, Daniel Diaz <daniel.diaz@linaro.org>, 
	David Gow <davidgow@google.com>, Arthur Grillo <arthurgrillo@riseup.net>, 
	Brendan Higgins <brendan.higgins@linux.dev>, Naresh Kamboju <naresh.kamboju@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Maxime Ripard <mripard@kernel.org>, Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Alessandro Carminati <alessandro.carminati@gmail.com>, Jani Nikula <jani.nikula@intel.com>, 
	dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, loongarch@lists.linux.dev, 
	x86@kernel.org, Linux Kernel Functional Testing <lkft@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: [PATCH v4 06/14] x86: Add support for suppressing warning
 backtraces
Message-ID: <rkuxvq6pkha6pixz5rtu327ujt7ism5f4wgrak7egcecuxwe42@qkn5ewdzwhvo>
References: <20250313114329.284104-1-acarmina@redhat.com>
 <20250313114329.284104-7-acarmina@redhat.com>
 <20250401170829.GO5880@noisy.programming.kicks-ass.net>
 <ddc7939f-fb98-43af-aed1-0bc0594ecc41@roeck-us.net>
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
In-Reply-To: <ddc7939f-fb98-43af-aed1-0bc0594ecc41@roeck-us.net>
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Apr 01, 2025 at 10:53:46AM -0700, Guenter Roeck wrote:
> On 4/1/25 10:08, Peter Zijlstra wrote:
> > > +	if (!KUNIT_IS_SUPPRESSED_WARNING(__func__))			\
> > > +		_BUG_FLAGS(ASM_UD2, __flags, ANNOTATE_REACHABLE(1b));	\
> > >   	instrumentation_end();					\
> > >   } while (0)
> > 
> > NAK, this grows the BUG site for now appreciable reason.
> 
> Only if CONFIG_KUNIT_SUPPRESS_BACKTRACE is enabled. Why does that
> warrant a NACK ?

I agree with Peter, this bloats the code around thousands of UD2 sites.

It would be much better to do the checking after the exception.  In fact
it looks like you're already doing that in report_bug()?

	if (warning && KUNIT_IS_SUPPRESSED_WARNING(function))
		return BUG_TRAP_TYPE_WARN;

Why check it twice?

-- 
Josh

