Return-Path: <linuxppc-dev+bounces-5702-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 723BAA226C1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jan 2025 00:11:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YjyZm61BVz30TP;
	Thu, 30 Jan 2025 10:11:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1236::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738192288;
	cv=none; b=ADXBVPl7mX9jbmIdEa0rr1a25ri2HP309TPopDGh6dWiKI/Jw3CC1NHes7TAf8kL9tiThwy5sflOKY5EfwBjfau3JuaGgKBRD/YLiD/6K7rRoQCCpQjv/ehWafegSKgo9TdQY9gznh8xTNe1j+GRkvYk5i6mXeHVGsBWeIEImdGOZ5N//TrLFe9u/7uffU1ppWke8+eOz3Ajwr3O/M20EELOAtZUmRH6+G8BUlA/q9RVD+ABdpy0eJpHSjVH2Ne6XVVqmSLigA/71UsvVlRNE6jU0280HCawa+aS2/usBKOkz8hgOOddAFCNUzY1+vepJk/QeIQSrHnBG0nkKpMGNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738192288; c=relaxed/relaxed;
	bh=QKrCOl8m/rCgj2HwdpxvnpKCmh7wiUqfd/v4l4GcjUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SEqN/Afu+yKUIIx20sFt/X0y5IjOUmFltDSZHnFKCTaCCI0bOSWX8F6uWYLY+mxrDEjBqpUCuEOEVOyLv37fdYP8JVEQoaaNToiruWvSaiq6uqwKSrJUnxKzTT9wS2zgiuxuIS45BYTsV+JpHF4HVV7yqj2edV1wwoCfeU+GWkfOQ0shO7cHmDEzu/xC2O8FJcrR0vrxITvctFeGwMzkfaFcJx9roHotmsdIVh1PfQN2XtFZ8+VxJsKqxqV/qWJIaGO1WsZjhMM2kcqWIVjFaP3r9dpPwaAFBFVOm+WNfTeVvRepDGL4U2/32+u6NB2vQkjkfOWBYHu321AoIGlhow==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=XAlzvbpm; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=XAlzvbpm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YjyZm0ykHz2yYy
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2025 10:11:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QKrCOl8m/rCgj2HwdpxvnpKCmh7wiUqfd/v4l4GcjUc=; b=XAlzvbpm4PcdqKCBNo8ChFEShx
	lqZp17NxxDoP4sob5u58w7AX+GnxbL96EhyRp5zw+EiRrPm9v/XqNrH4/nrejYuxVIjqsPCqz9YwP
	WMKOB9JSXo8Hm3gkO35cRfNjT4Y2eBvLdqz52evfls3I1nKZpV3NZx6BhuUKxl+NCEw2Jrh7gm6Bj
	8gZFqrfU1pvJtZ54J3RtryoRnnuNleBENVgW56ivU/gcjhbOU3SySG1FLFC3cntYHzmArpoHIkYaR
	detcDBHbIfOt7GkEL/RaJcrVpTK6ZZv1uSHlI9GlsJSld2ZLb2LwbjPlRNQNeyLSNHcSHQayK269J
	wbFRDBMw==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1tdHDP-0000000CYqS-0Mah;
	Wed, 29 Jan 2025 23:11:23 +0000
Date: Wed, 29 Jan 2025 23:11:22 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Sidhartha Kumar <sidhartha.kumar@oracle.com>,
	akpm@linux-foundation.org, christophe.leroy@csgroup.eu,
	geert@linux-m68k.org, justinstitt@google.com,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev,
	maddy@linux.ibm.com, morbo@google.com, mpe@ellerman.id.au,
	nathan@kernel.org, naveen@kernel.org, ndesaulniers@google.com,
	npiggin@gmail.com, linux-mm@kvack.org
Subject: Re: [PATCH] xarray: port tests to kunit
Message-ID: <Z5q1mkliUUM5Xlod@casper.infradead.org>
References: <20241205-xarray-kunit-port-v1-1-ee44bc7aa201@gmail.com>
 <07cf896e-adf8-414f-a629-a808fc26014a@oracle.com>
 <qdq4k6323orqifgzo7pbg5vakezr3gptfdehghxsyfrhc4kwvb@d4fxbwcl4gjm>
 <CAJ-ks9=U4PZv4NgyH8B7SbHkecGLy+M=G639hSTv-hnPySqk6w@mail.gmail.com>
 <xf3445vgszstqfwycf5wc5owhnifxb3mny5xjjaihghqgnozmd@3h7hnifir4vu>
 <CAJ-ks9=hNGRFbr3sTQBma3u84Yhog7i33Oc=16FqFjE_JYNERA@mail.gmail.com>
 <Z5qzk_92KU0xoLcP@casper.infradead.org>
 <CAJ-ks9ksSh-r6SmKsm7iJA6nCqvrhXZ8jtjP-YoeMNB6tF5a=g@mail.gmail.com>
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
In-Reply-To: <CAJ-ks9ksSh-r6SmKsm7iJA6nCqvrhXZ8jtjP-YoeMNB6tF5a=g@mail.gmail.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Jan 29, 2025 at 06:08:22PM -0500, Tamir Duberstein wrote:
> The whole point of tools is to liberate stupid humans' brains like
> mine from mundane tasks like working out who to email. The tool wasn't
> wrong; it did exactly what you told it to do in your MAINTAINERS
> entry.

Tools do get things wrong.  So do humans.  When you take your hands off
the steering wheel and the car crashes, it's still your fault.

> > > For what it's worth the kunit invocation, while obscure, is
> > > self-documenting. There's usage information that's reasonably
> > > understandable embedded in the tool itself. I looked for the userspace
> > > testing initially but failed to find
> > > tools/testing/radix-tree/xarray.c. Even now, I'm not sure how I'm
> > > meant to compile this.
> >
> > kunit is useless.  The test_xarray.c module is useless.  If you break
> > xarray, the kernel won't boot far enough to load any modules.  You
> > haven't thought about this AT ALL.
> 
> I don't understand what you're saying here.

Then I don't want to see any more patches from you until you do.

