Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B9765F139
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Jan 2023 17:30:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NnsR12gTHz3c9T
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Jan 2023 03:30:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.a=rsa-sha256 header.s=google header.b=Xkf28zar;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ffwll.ch (client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com; envelope-from=daniel@ffwll.ch; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.a=rsa-sha256 header.s=google header.b=Xkf28zar;
	dkim-atps=neutral
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NnsQ25pLrz2ynx
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Jan 2023 03:30:00 +1100 (AEDT)
Received: by mail-wr1-x42b.google.com with SMTP id t15so27795962wro.9
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Jan 2023 08:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hriix7PNjl3Fx5Lwj5vGvmpV6J+F4oqIBHmzWDNV1zY=;
        b=Xkf28zaruVrLmqa0GfGmuAvqQQX+dB8u4vBIZu3Zqzswl7V0McjDKsYjGqvgAnDPVt
         JAfXVw2P8vm4NtD5ER0v9cpo5fq34lBw+gZ7lyOmQSBDrvgtT42XqrYiXIz43PC1aoqp
         dm4offnZy34FIeCS0B3FEa0zUz3dEn5dYFCKk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hriix7PNjl3Fx5Lwj5vGvmpV6J+F4oqIBHmzWDNV1zY=;
        b=fTeRqbMIoeCMRUqLwg7z/VvUGF15jA1x3XxPlOpNy0T04zVd0I3+fTxtBIh+WOUuBF
         PaOMBUTJ561Bgh99WqB9occ+8kNoOje8VdZ3u8eKQ3yQrgnL7wJ3F7cm0iajxnKNQNUW
         GCiWcpb3VUR59s3oLgOHE8YtcdBbq2FUqhVI+Wf7fMQ76nfTftQXr08R/h3TJ3OKUIG/
         tkoWvfvCNesYEA9fokhHjDgMRwIZNMa0cvxnzIon9XT6A07aWM1c5RP9NXGKG/5tsGhF
         DQDhSpCqBOngxOFNjfOxrtBe42cvwDXMODt3+tzQgJEraYaqiFOe38/mHCOKP0pC50DK
         pmBw==
X-Gm-Message-State: AFqh2krK4GORaLCfZpbcf44DBneu7y/I108G3E2bLkZ0L4gYLUUTuSP5
	/ws6i2EDDVfTU/kqGefBcgIs5A==
X-Google-Smtp-Source: AMrXdXvytt3BictUpSrNMsVMjqYxBg9ULQXEcgl2Nkqae4pxiPmHRRghamOTQFr1zyRYajkEyGj8ag==
X-Received: by 2002:adf:f9cb:0:b0:285:d0ba:92e2 with SMTP id w11-20020adff9cb000000b00285d0ba92e2mr22521193wrr.47.1672936194547;
        Thu, 05 Jan 2023 08:29:54 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id x15-20020a5d490f000000b00236883f2f5csm36488463wrq.94.2023.01.05.08.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 08:29:53 -0800 (PST)
Date: Thu, 5 Jan 2023 17:29:51 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [PATCH 00/19] Introduce __xchg, non-atomic xchg
Message-ID: <Y7b6/7coJEVlTVxK@phenom.ffwll.local>
Mail-Followup-To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mark Rutland <mark.rutland@arm.com>, linux-m68k@vger.kernel.org,
	linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	Boqun Feng <boqun.feng@gmail.com>, linux-xtensa@linux-xtensa.org,
	Arnd Bergmann <arnd@arndb.de>, intel-gfx@lists.freedesktop.org,
	openrisc@lists.librecores.org, loongarch@lists.linux.dev,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
References: <20221222114635.1251934-1-andrzej.hajda@intel.com>
 <20221222092147.d2bb177c67870884f2e59a9b@linux-foundation.org>
 <6e727952-3ad0-fcc3-82f1-c465dcffd56f@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6e727952-3ad0-fcc3-82f1-c465dcffd56f@intel.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-m68k@vger.kernel.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-snps-arc@lists.infradead.org, intel-gfx@lists.freedesktop.org, linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>, Boqun Feng <boqun.feng@gmail.com>, openrisc@lists.librecores.org, loongarch@lists.linux.dev, Rodrigo Vivi <rodrigo.vivi@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org, linux-alpha@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Dec 29, 2022 at 10:54:50AM +0100, Andrzej Hajda wrote:
> Forgive me late response - Holidays,
> 
> On 22.12.2022 18:21, Andrew Morton wrote:
> > On Thu, 22 Dec 2022 12:46:16 +0100 Andrzej Hajda <andrzej.hajda@intel.com> wrote:
> > 
> > > Hi all,
> > > 
> > > I hope there will be place for such tiny helper in kernel.
> > > Quick cocci analyze shows there is probably few thousands places
> > > where it could be useful.
> > So to clarify, the intent here is a simple readability cleanup for
> > existing open-coded exchange operations.
> 
> And replace private helpers with common one, see the last patch - the
> ultimate goal
> would be to replace all occurrences of fetch_and_zero with __xchg.
> 
> > The intent is *not* to
> > identify existing xchg() sites which are unnecessarily atomic and to
> > optimize them by using the non-atomic version.
> > 
> > Have you considered the latter?
> 
> If you mean some way of (semi-)automatic detection of such cases, then no.
> Anyway this could be quite interesting challenge.

My take is that unless there is very clear demand for this macro from
outside of i915, it's not worth it. All that fetch_and_zero zero achieved
is make i915 code a lot more confusing to read for people who don't know
this thing. And it replaces 2 entirely standard lines of 0, every often
clearing pointers in data structures where you really want the verbosity
to have a reminder and thinking about the locking.

Plus it smells way too much like the cmpxchg family of atomic functions,
addig further to the locking confuion.

Imo the right approach is to just open code this macro in i915 and then
drop it. Again, unless enough people outside of i915 really really want
this, and want to lift this to a kernel idiom.
-Daniel

> 
> > 
> > > I am not sure who is good person to review/ack such patches,
> > I can take 'em.
> > 
> > > so I've used my intuition to construct to/cc lists, sorry for mistakes.
> > > This is the 2nd approach of the same idea, with comments addressed[0].
> > > 
> > > The helper is tiny and there are advices we can leave without it, so
> > > I want to present few arguments why it would be good to have it:
> > > 
> > > 1. Code readability/simplification/number of lines:
> > > 
> > > Real example from drivers/net/ethernet/mellanox/mlx5/core/esw/qos.c:
> > > -       previous_min_rate = evport->qos.min_rate;
> > > -       evport->qos.min_rate = min_rate;
> > > +       previous_min_rate = __xchg(evport->qos.min_rate, min_rate);
> > > 
> > > For sure the code is more compact, and IMHO more readable.
> > > 
> > > 2. Presence of similar helpers in other somehow related languages/libs:
> > > 
> > > a) Rust[1]: 'replace' from std::mem module, there is also 'take'
> > >      helper (__xchg(&x, 0)), which is the same as private helper in
> > >      i915 - fetch_and_zero, see latest patch.
> > > b) C++ [2]: 'exchange' from utility header.
> > > 
> > > If the idea is OK there are still 2 qestions to answer:
> > > 
> > > 1. Name of the helper, __xchg follows kernel conventions,
> > >      but for me Rust names are also OK.
> > I like replace(), or, shockingly, exchange().
> > 
> > But...   Can we simply make swap() return the previous value?
> > 
> > 	previous_min_rate = swap(&evport->qos.min_rate, min_rate);
> 
> As Alexander already pointed out, swap requires 'references' to two
> variables,
> in contrast to xchg which requires reference to variable and value.
> So we cannot use swap for cases:
>     old_value = __xchg(&x, new_value);
> 
> Regards
> Andrzej
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
