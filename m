Return-Path: <linuxppc-dev+bounces-13171-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB667BFCD96
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Oct 2025 17:24:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4csCcw5Ywkz30RJ;
	Thu, 23 Oct 2025 02:24:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::62f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761146656;
	cv=none; b=ob+Ag/ueQnf1zlMgppEwBvimirjNx5SMVLopip6fy09NE/yrqzR+bPMto52aowWdJUKhR7NcM4U3XR54jerHB0V+wNgcpfBIQHAHS/c4PUMI46gcDguUUHvzLzMzQ79qKThlyLOX3y5Z8s6iLMvt5b0K67d+s1Qu6wziZJvbLZjguvdKXShqMaJSNVlK39scVUN42TlmNrTbRwKbL5prhbJRpagiGn8x4a94LvexdLelY2lhd8OVf96vP2uhhE6mjzlYI9hL3plKODiLoMrcS7+hAxbztJ7ycgjMVNdQgZagcLoZ8fGuZDXsgsavITP28VPOJCgRL5CImcpDlOgP6g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761146656; c=relaxed/relaxed;
	bh=Y8Ks3283lFKT/3or/kKLaFk/rSeUKOKq+L7qyJbrS/M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FZk9eTPiFRADT0MmYY1L565sOURhA7kEsEkY0on+LHC/iOdj3rG/j7XUnVAnVlw8TDUJVBxQM8Lx/ll1uMCy4LOiwGEZRc/WEiU7eO40Jfxv4z+/ApHkdlAosvoGH2DAR2tc+I3VCNK202cUWiiqQyeNPzK+Cqvir/1rLfh0+ic21EGXCcPSV4GgW1IcZ9thb3wuG9N8vb1TP5dEqfhslMTRNc1ghdCIfbnf5w8JB895fTAt2/7bdb25L1fVDYxacEJuASsNPVwtfqI1hxaCjWfTDO3jCPDIqEqhwsDo2Wiiw3m6aArjuoSfAGsUHU4KfALOvfVqtaJ0WRoXWNifgA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=N10meVzM; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=N10meVzM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4csCcv1sHcz303y
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Oct 2025 02:24:14 +1100 (AEDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b3e7cc84b82so1366191266b.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Oct 2025 08:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1761146650; x=1761751450; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y8Ks3283lFKT/3or/kKLaFk/rSeUKOKq+L7qyJbrS/M=;
        b=N10meVzMRajw3tXYF/SiVV13M+mqNYbMnSNZguSlAZtx+MDvXoz6NDNu7bjjkC/NHv
         nHVkZKExle4CQDjIvnN/cJLdm0lxiSnr0EAxDeqERJmu83JKrMG7A433NcR39NqAC1AL
         7YRTR02ExIj7+kVESJpv649IzzvthB+KszPSA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761146650; x=1761751450;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y8Ks3283lFKT/3or/kKLaFk/rSeUKOKq+L7qyJbrS/M=;
        b=PVSdhcSQDXyr8xq89zW35cfafN48HIInPsh6b5kVrlmX2tNTWD+sTgrOZ2G/ibir/g
         Cg1X9GKECmvgCacmDjGw9ogJKVb3wEQlq7iThGCstmhp8YqWw8wsZccwINofKBONfPVi
         /d6w1y8vQYBwU/h5HvhnOgaY0+ZiXC37D+0D2v8WOcDPh+D04uee1guc3Xv/FgPnzWoZ
         imfAtZmgyLWDnVf+3KngfTHPMuSvxDpBz0PkrcucP+9FciHi/krz+GtwRjkX2YuaH2i4
         wuCJ2dF7a/Rp0JO2sLMj3Lsdmb43MV9Ice8ByIh9Bf7H/SFBfF8e3PHMjKH7aEQzrF8h
         +oWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlahKfc/jY/2A9lhIwPHaZCsD+tVyKEC0igMSsqL/O7LO77QoSZRzskDTnPrGoVYRHtBMKtSD6fVkygo4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyp074njx8Ut2j9FB05o2oAnI2mWlCFzX6+LldcBMxWHHLUPtVH
	J2+FWlu+yDqXEIUy8q9i5QvYmxstJEo3gDscmPcAEOUMwcQ8FPDUlGNNOyIdDa/BqaS0TTbBIlf
	pNQGAqnE=
X-Gm-Gg: ASbGnctuO7e6BF48glhg3nL3aoylRAKRnjTtbqT2ssHxiU+FriOlsnjorWPjLf9OyiP
	pUSj+AmaeIuRZNPmZnRFUs5yVZn0EAed/T4Y++7H3/EyClbxml1KelRfI663iAdw3UjcRvrYgdd
	XP12ioLiyqo+foyWq831LNkpVrEamDLxUD+OWueQIDxEdGOIESZjOrkEib6V/KO9q7vnICvj52U
	hM2a4zDJ7ID6gaaSb9jLDkAznVbCyY5AhC08akIo5e1AHjQMvS8F4dA68awU8QhS29PL3fiF+3m
	EsqVojdcE1Sk87cMO1R7OD+6ZIMXgOZz+SiswqIncXpw6qJ3T1oT/YSulJ2WS7J6vgNKUsL3Z41
	W3Lms9XyHyPpaWqI1GDjqWh0t0OyycDa+2IcsOaOi+xOQKfbkCb3RekB6EHN4ziFqs2R9JmOOCZ
	S65qHvRsQxxcatpURx154KBSQ2Q0W4mXjcnU277gp7n3UF+XHBwQ==
X-Google-Smtp-Source: AGHT+IGGt+vHo+ZitVkjyBYJQV3q3Ac0EdS1wW7H+jWZdtNRr0rkcj89Wqon2BdSjw/rzw7e/2b/+g==
X-Received: by 2002:a17:907:c09:b0:b54:185f:359d with SMTP id a640c23a62f3a-b647384211fmr2386036666b.26.1761146649383;
        Wed, 22 Oct 2025 08:24:09 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65ebf49fd8sm1373516366b.83.2025.10.22.08.24.08
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 08:24:09 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-63d6ee383bdso4909581a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Oct 2025 08:24:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWjm/qEpAP83K43VuQw0WaYnJnAsE49VGQzTv75iB7/FZFqBmfHownuQlT+v9rzVtkEIXdpFqe9+lOrZqM=@lists.ozlabs.org
X-Received: by 2002:a17:906:c144:b0:b04:48b5:6e8a with SMTP id
 a640c23a62f3a-b6472d5d715mr2448051866b.7.1761146216891; Wed, 22 Oct 2025
 08:16:56 -0700 (PDT)
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
Precedence: list
MIME-Version: 1.0
References: <20251022102427.400699796@linutronix.de> <20251022103112.478876605@linutronix.de>
In-Reply-To: <20251022103112.478876605@linutronix.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 22 Oct 2025 05:16:40 -1000
X-Gmail-Original-Message-ID: <CAHk-=wgLAJuJ8SP8NiSGbXJQMdxiPkBN32EvAy9R8kCnva4dfg@mail.gmail.com>
X-Gm-Features: AS18NWAqLsXEY6bsEV3yJ0KWUZmBC6kMtZXzbsnMf3ubAyGEsrR55YgMKptZqjM
Message-ID: <CAHk-=wgLAJuJ8SP8NiSGbXJQMdxiPkBN32EvAy9R8kCnva4dfg@mail.gmail.com>
Subject: Re: [patch V4 10/12] futex: Convert to scoped user access
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, 
	=?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	kernel test robot <lkp@intel.com>, Russell King <linux@armlinux.org.uk>, 
	linux-arm-kernel@lists.infradead.org, x86@kernel.org, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Heiko Carstens <hca@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	David Laight <david.laight.linux@gmail.com>, Julia Lawall <Julia.Lawall@inria.fr>, 
	Nicolas Palix <nicolas.palix@imag.fr>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 22 Oct 2025 at 02:49, Thomas Gleixner <tglx@linutronix.de> wrote:
>
> From: Thomas Gleixner <tglx@linutronix.de>
>
> Replace the open coded implementation with the new get/put_user_scoped()
> helpers.

Well, "scoped" here makes no sense in the name, since it isn't scoped
in any way, it just uses the scoped helpers.

I also wonder if we should just get rid of the futex_get/put_value()
macros entirely. I did those masked user access things them long ago
because that code used "__get_user()" and "__put_user()", and I was
removing those helpers and making it match the pattern elsewhere, but
I do wonder if there is any advantage left to them all.

On x86, just using "get_user()" and "put_user()" should work fine now.
Yes, they check the address, but these days *those* helpers use that
masked user address trick too, so there is no real cost to it.

The only cost would be the out-of-line function call, I think. Maybe
that is a sufficiently big cost here.

             Linus

