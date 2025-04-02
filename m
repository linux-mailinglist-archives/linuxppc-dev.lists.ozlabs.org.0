Return-Path: <linuxppc-dev+bounces-7425-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C37A78912
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Apr 2025 09:46:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZSH3w0JxXz2yqn;
	Wed,  2 Apr 2025 18:46:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1:d65d:64ff:fe57:4e05"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743579963;
	cv=none; b=eIOjRYgPlq2Mw2Iw1cXQumlVD3jOqlCoGm60on7D73Q3gvWk7RymPqcz7hlrfNTP/ZmlawzjqmvtySHfpm9ppXPN6BGYuz6jeC4/vNjIX+V4XevNzAZAttHCmdR2sgzKV4SKVA8FaX8h62pC281Wph/3cXnI7FGtxSq/3iexu4c3w6JUKsm9KpYkINNjWRJ3SvSHC0j/vXR11EHZhRvaH6+Xk1cj8GvEupvAiLHiRsujuUDwL3PrEbPn+UBngsFAtp5RrsvtMmcUWcrwmocH6ZDHFOwTd8KFnIj3499g/iuUJdKEJu2U7NjSdVld58HXJ8him3VCuT3AzaiMHNRNiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743579963; c=relaxed/relaxed;
	bh=uIzWjvfJbyS7n54sJ+5shgly3p7L+Bq4hAOWNvm3+QQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PZ7weqfkIhXTr4uk+z8voJZHr5ZwBbzGKfRa8+vqQUW3aDH0FS0lSFvkF+BBxmYBtSH5Ae/a4KCeE4czN3jhanBT8pFjG23h2b3IjWSS5q4eNB55G0wIZ0kdv0cMAOkNva5BlDUICNg4A9qjFMvGgcp2CQspQkiWJg9DyBUS9dg8f0FRPwm9Z/OHRkoLtqr97RrUAWYbKbUtFXGxbdKfWqVXH82TPxscM4ggQsSArl3jR1T9GFMgH8870mAkexFLnTrE+r3FnHDGGsdEwkmenM7NOCOgiKLN6LkBxUeSAGhrrEGuWcvIgKtVl0tJukUe30hndMDx7xaB1Iklw622cg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=K19W1GmQ; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=K19W1GmQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZSH3v0VhXz2yfR
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Apr 2025 18:46:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=uIzWjvfJbyS7n54sJ+5shgly3p7L+Bq4hAOWNvm3+QQ=; b=K19W1GmQJKHEi4CglJlEuX8NWi
	LthI2Z1LT4kdChvQwI3VZxL8k5hQ8dfV9NdzrOUMMX5Pj6OAhhEMS8GDkCXS2YpBQcPOH/Ls8WWAg
	vt0plzI5MTrstT6vVlp7xwsZ0RSoiIMGP/bQXVfBeMRFvz9Ykq9JPtPXarpYwYT/LMNYgK0a0CjKi
	kJJEWZJJLww9Gks/HsTl8JvWnlqFdUJ6xwagZ6hon/A/xb2B/diil2B0kL2IZ7+7EZgbibHMjzb7w
	/qUr5UiptHJqHeN9jIzxomcDYiKG84dHAl9weULxWpIBCV33DZruujj7uy0w4xbjRcWo4+Gbycyy+
	hIRGELoQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzsnH-00000006zJG-0AVp;
	Wed, 02 Apr 2025 07:45:51 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 95EEB30049D; Wed,  2 Apr 2025 09:45:50 +0200 (CEST)
Date: Wed, 2 Apr 2025 09:45:50 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Alessandro Carminati <acarmina@redhat.com>,
	linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Kees Cook <keescook@chromium.org>,
	Daniel Diaz <daniel.diaz@linaro.org>,
	David Gow <davidgow@google.com>,
	Arthur Grillo <arthurgrillo@riseup.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Maxime Ripard <mripard@kernel.org>,
	Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Alessandro Carminati <alessandro.carminati@gmail.com>,
	Jani Nikula <jani.nikula@intel.com>,
	dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, loongarch@lists.linux.dev, x86@kernel.org,
	Linux Kernel Functional Testing <lkft@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: [PATCH v4 06/14] x86: Add support for suppressing warning
 backtraces
Message-ID: <20250402074550.GQ5880@noisy.programming.kicks-ass.net>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ddc7939f-fb98-43af-aed1-0bc0594ecc41@roeck-us.net>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Apr 01, 2025 at 10:53:46AM -0700, Guenter Roeck wrote:

> > >   #define _BUG_FLAGS(ins, flags, extra)					\
> > >   do {									\
> > >   	asm_inline volatile("1:\t" ins "\n"				\
> > >   		     ".pushsection __bug_table,\"aw\"\n"		\
> > >   		     "2:\t" __BUG_REL(1b) "\t# bug_entry::bug_addr\n"	\
> > >   		     "\t"  __BUG_REL(%c0) "\t# bug_entry::file\n"	\
> > > -		     "\t.word %c1"        "\t# bug_entry::line\n"	\
> > > -		     "\t.word %c2"        "\t# bug_entry::flags\n"	\
> > > -		     "\t.org 2b+%c3\n"					\
> > > +		     "\t"  __BUG_FUNC_PTR "\t# bug_entry::function\n"	\
> > > +		     "\t.word %c2"        "\t# bug_entry::line\n"	\
> > > +		     "\t.word %c3"        "\t# bug_entry::flags\n"	\
> > > +		     "\t.org 2b+%c4\n"					\
> > >   		     ".popsection\n"					\
> > >   		     extra						\
> > > -		     : : "i" (__FILE__), "i" (__LINE__),		\
> > > +		     : : "i" (__FILE__), "i" (__BUG_FUNC), "i" (__LINE__),\
> > >   			 "i" (flags),					\
> > >   			 "i" (sizeof(struct bug_entry)));		\
> > >   } while (0)

Also this, why do you need this extra function in the bug entry? Isn't
that trivial from the trap site itself? symbol information should be
able to get you the function from the trap ip.

None of this makes any sense.

