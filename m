Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CA47111BF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 May 2023 19:13:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QRvlG40XYz3fGn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 May 2023 03:13:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=hlN2P2+4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::2c; helo=mail-oa1-x2c.google.com; envelope-from=vishal.moola@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=hlN2P2+4;
	dkim-atps=neutral
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com [IPv6:2001:4860:4864:20::2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QRvkQ0BxLz30Qq
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 May 2023 03:12:29 +1000 (AEST)
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-19eab8bca4dso1491116fac.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 May 2023 10:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685034745; x=1687626745;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H8r4ODEq2+fLCDOwkU0I9uMZzQGsmacbN0I7clioZxg=;
        b=hlN2P2+4u+i/qYY499lGWAoyNY/dboRXOhJznjo9Nm7b8P8cZFR+c+0fCkL2rW25CD
         +hZ5J0+Ex4V3ScR/Xe/US44TDdlNVBI/xdsG40Ua1AXHZ442jMGry74GV2BfJq0J5IYV
         u7lelVrP8y0maLYqq75TrtqE6TS9ejRf7OJtZV90tVtzTBQB8gLHvCfhdBCn30nX09L2
         ck5ghpRGKOeV6W36JYgZ3HGXIa/8ueDRuLasr3XHrrQINIR3LY+3Qk5dm5YcGu7+Oweg
         Z/YZFzs6cf7vI3ciL7ceyYyXeS7nwrYpgRm5g9mSuxHdlnBWIXgAoNtf5095aMXhJIqs
         nB3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685034745; x=1687626745;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H8r4ODEq2+fLCDOwkU0I9uMZzQGsmacbN0I7clioZxg=;
        b=WXfihfkF8ULUetWZ14nfzigKUOSJRDWG3VvLeYvpFDC8kuGrfjFFvy72OgsDICNghA
         iwF5NxZT5HyOleNMGrJYf0u1RqwQxqHuJJ5cP5rJ7LHwdo94xIQNP7CG5KxURaRIzORV
         99oqqP6NUgp3Afk3zsvd9dFbP9o882+t22EegbQ9hTAQ90/rMwcut0wdxOuqu4S7BhIu
         cY6VAtQ26d5l9xGOfNDaSjKg189AVMk+fusDZ7WKA66tZz6YQpT5IxPUpn19mkMQ0LXc
         gncIDeEUHMO5B2bEyXpgg7aQR0aLr+V8Fwat4KW8We9T/K7nZ6DgiL9MdovfQAAAwVTH
         5u/g==
X-Gm-Message-State: AC+VfDxX4lKCj5vvw3izHaNskPPoc2maJoXLKT4Eg3TCUA1X8Oe2FBn+
	QlxZXUY0CH/wdXkfunMydFeMfgEMGDbJK663zXA=
X-Google-Smtp-Source: ACHHUZ7vTuIkb3AY2emRZbpynC4n929WANyhiAk9Z8pBe93X++8c36ksUYj3vhKz06//2+LG6F86/hC/ahr56+n93g0=
X-Received: by 2002:a05:6871:505:b0:19a:1694:f03f with SMTP id
 s5-20020a056871050500b0019a1694f03fmr1875889oal.47.1685034745319; Thu, 25 May
 2023 10:12:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230501192829.17086-1-vishal.moola@gmail.com>
 <20230501192829.17086-3-vishal.moola@gmail.com> <20230525085819.GW4967@kernel.org>
In-Reply-To: <20230525085819.GW4967@kernel.org>
From: Vishal Moola <vishal.moola@gmail.com>
Date: Thu, 25 May 2023 10:12:14 -0700
Message-ID: <CAOzc2pw63URkr08q4_VP+3wbRDnFjyUE8zxQrvQtnJ5kbtGhFg@mail.gmail.com>
Subject: Re: [PATCH v2 02/34] s390: Use _pt_s390_gaddr for gmap address tracking
To: Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, Matthew Wilcox <willy@infradead.org>, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 25, 2023 at 1:58=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> On Mon, May 01, 2023 at 12:27:57PM -0700, Vishal Moola (Oracle) wrote:
> > s390 uses page->index to keep track of page tables for the guest addres=
s
> > space. In an attempt to consolidate the usage of page fields in s390,
> > replace _pt_pad_2 with _pt_s390_gaddr to replace page->index in gmap.
> >
> > This will help with the splitting of struct ptdesc from struct page, as
> > well as allow s390 to use _pt_frag_refcount for fragmented page table
> > tracking.
> >
> > Since page->_pt_s390_gaddr aliases with mapping, ensure its set to NULL
> > before freeing the pages as well.
>
> Wouldn't it be easier to use _pt_pad_1 which is aliased with lru and that
> does not seem to be used by page tables at all?

I initially thought the same, but s390 page tables use lru.
