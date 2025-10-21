Return-Path: <linuxppc-dev+bounces-13132-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D82BF8D10
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Oct 2025 22:53:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4crkys3GP1z3bfY;
	Wed, 22 Oct 2025 07:53:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::434"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761079989;
	cv=none; b=VFnqYVC32Y1osLVdxU4cB6sXQQZQ8NRQcNMMlUL+Awt92+6ZJBHTFUHfL8l/MhXWipMM0TL0h4STGt4gQza7hkr/SWJtPFm/xoYXmLN73DTsWENE0oPPmTkVS2KbhuP/rNflMizEbOGXCCKc80XwE6LdUn5Q27ZC8Rpy6MMwaubivLknBMJKzn6zOgeSjxlKmGxHelMU9OGuNyuA/IBaCDrgGhVbJRIzB/FatH6EyTnQ3RziuUgIfxBVLXwpzJcpJHP/s9kPjkgFIhyUJyNbZ+lzqv6urE/7dSXg0ivuXuC6RiQekHdxaE5gEfQpLv9TNxZD48zpBKUxQBIaFBttNw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761079989; c=relaxed/relaxed;
	bh=KX1U3LQDhrzk0zMYgAFvq4hyuRv8alrTza4fIy2YOi0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fC8X8UvtFNADxw8xKOu3ECt0spYVuKynXRVijaN/Q2gVVANFciTx3d89insBtQ3sFa0G0/24WMV25xfDpZDhGEOdTVqyt/7VIo5SFSRQLWjv+5mB6k21bPhwEOPUO+/2825MaemXd0mospDYqxiBT1xTDRd/y24NZV9+wPiyS/vBJ1M83d15Y2Mh8fFdsYYGgvlgACEPAiMMWKPL38y4y6Hc+bJ73+Ow5Q2tq8M3rKxnr20Ytkh0q/9nI0ltG/Pei7T3JbZNZZrqb0sKiT5571lBdJ0buiy02NnPq8Jua3ugHJnpVz2Bg6eFlkwmiEFWHstebF8TOedKUs3Hyk3KHA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=artC4ZRm; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=artC4ZRm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4crkyq6tgCz3bfF
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Oct 2025 07:53:07 +1100 (AEDT)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-4270a0127e1so2939546f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 13:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761079979; x=1761684779; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KX1U3LQDhrzk0zMYgAFvq4hyuRv8alrTza4fIy2YOi0=;
        b=artC4ZRmsdaz8pKgW8sMqAlVi8P3AXNOkemR3X/H0EmrK6M/qCYfDL1MNr3lYswHU7
         uZkjeIaQZOtE5QITKGTqvbqyv7FHIFvg9GVXqWh6qIaC/ncAT5AK5SLNQB2NeSw0eO+t
         tiiy5Vp1D1CgWDHHNsOGIcL0UdkHjnJlqUPwGXH7DcMmHEqa0ntAmT5bG6qqL6V0cDem
         Ar25jxzjnEOTVf3mbP5ILqbzL+CMDd8IFA+kX+rNllhTs3Ya1wjX1IchVdEFzmHGoP7m
         ygeIkW6SjL8k//mHTVE+LvnlH9z9ltlC2cBJIke0TX2YBW39x6KJHcxfkEGnd3rVNKAX
         rsgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761079979; x=1761684779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KX1U3LQDhrzk0zMYgAFvq4hyuRv8alrTza4fIy2YOi0=;
        b=iSuHz7p15jGbexIiV2ciWeXsAS5CrbmpTjclz06t/3hcfpQS9vwsT56CG/zOKMXlcA
         7LD0hGY/aGNkpeUQ59fz9tt2jLenCdbIDfVwpK3BTsFLdKeAh2ypOPzltCuCr+S38sIK
         laZxbvTNJ1Es6mGyCcy+EPbatkkRHYsVUoa9pM+0ZpQ4u15E0mHwA/wrsbXj46R4s5WN
         vA88L68cysM+EQrQO8J2G797f67edvNGHeFuZadyovUtZ9p1FEa6s9+Um6/a8At1ZNiW
         ffKC9sIiFtQBeg0iop0EYKsfBytxr4UEobjPVJEVqPseZl8YRttYseghL7+r5WPGXcMv
         A5Tg==
X-Forwarded-Encrypted: i=1; AJvYcCXNrcqxyztfXHmcWwTG/I3H5vKvuXeu1U0pSdNdOoVL6/ts5zenThXjeXfhrssFJZRvX4Fr8fYVPBKVWoM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxMVkJHVT3tdVNDLg9+cyPYa254zh2wbaFGENh9OzGlgvJ4GHcM
	N5eC+LYrT9jHIF1ZcEHcJsVCTmZxa7OzS6jdOfHQhkjG1fg7bsnI2DK/
X-Gm-Gg: ASbGnctmi4xWH71FKQFZWikGVA7m8fRtbYl39CIQ/x+GSmMPD4tIAdTC5zObwJwa/ms
	WB+d1jjV+2KRzhURroJfsZmhiwzPC18xo8M7eJ2tQwT4zvWLmLmb5DM08oXefPPafTWjnQgSzD6
	Zm4tjBX9tigWHiMKidUECknZV69pTYmSOBMm0+LgNuPXskccNMWAbqVSXDGAdVwtgPLdRy6OW5X
	6Zhzylx7vNt31cJdO7Q3EhLZVTUsleaGeMC/S5sfobyKMGDLIqlFRCIty6sm++GloS406LLSecW
	jy6gM1qvc9ymggzPl1wwmcGCF8NOzDomqpWBUmdMCX3z0U9U75T+YiZWSvun2lilNK7BAxYlrDf
	4ygl4gp4K4gwY78qLotbw0yV+4y/mWzvWKZjFV8zaIk98Mm9vh5aY6P17UdxYKFe4OW/kwVcz7E
	axKqHWbIb+/LJdfopL8U1ZiJ06zyYmb7p4pCi8OvAx+bwzESKosXyZ
X-Google-Smtp-Source: AGHT+IG48cx6eMc3yWVGBT0daBkOovb/80ZhUVtFTOZrtyO8Rw6UMLlSBk12jg9YEQoOEfu4lRZoog==
X-Received: by 2002:a05:6000:240c:b0:3fc:c90d:9957 with SMTP id ffacd0b85a97d-42704d6c585mr13473049f8f.16.1761079978558;
        Tue, 21 Oct 2025 13:52:58 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a797sm21895076f8f.27.2025.10.21.13.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 13:52:58 -0700 (PDT)
Date: Tue, 21 Oct 2025 21:52:54 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, kernel test robot <lkp@intel.com>, Russell
 King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Heiko
 Carstens <hca@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>,
 linux-s390@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>, Nicolas
 Palix <nicolas.palix@imag.fr>, Peter Zijlstra <peterz@infradead.org>,
 Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
 =?UTF-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara
 <jack@suse.cz>, linux-fsdevel@vger.kernel.org
Subject: Re: [patch V3 07/12] uaccess: Provide scoped masked user access
 regions
Message-ID: <20251021215254.673dbd35@pumpkin>
In-Reply-To: <874irsz581.ffs@tglx>
References: <20251017085938.150569636@linutronix.de>
	<20251017093030.253004391@linutronix.de>
	<20251020192859.640d7f0a@pumpkin>
	<877bwoz5sp.ffs@tglx>
	<874irsz581.ffs@tglx>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 21 Oct 2025 16:42:22 +0200
Thomas Gleixner <tglx@linutronix.de> wrote:

> On Tue, Oct 21 2025 at 16:29, Thomas Gleixner wrote:
> > On Mon, Oct 20 2025 at 19:28, David Laight wrote:  
> >> There is no requirement to do the accesses in strict memory order
> >> (or to access the lowest address first).
> >> The only constraint is that gaps must be significantly less than 4k.  
> >
> > The requirement is that the access is not spilling over into the kernel
> > address space, which means:
> >
> >        USR_PTR_MAX <= address < (1U << 63)
> >
> > USR_PTR_MAX on x86 is either
> >             (1U << 47) - PAGE_SIZE (4-level page tables)
> >          or (1U << 57) - PAGE_SIZE (5-level page tables)
> >
> > Which means at least ~8 EiB of unmapped space in both cases.
> >
> > The access order does not matter at all.  
> 
> I just noticed that LAM reduces that gap to one page, but then the
> kernel has a 8EiB gap right at the kernel/user boundary, which means
> even in the LAM case an access with less than 8EiB offset from
> USR_PTR_MAX is guaranteed to fault and not to be able to speculatively
> access actual kernel memory.

It wouldn't be a speculative access, it would be a real access.
But 4k (eg a single page) is plenty for 'reasonably sequential'.

Pretty much the only thing that has to be disallowed is a reverse
order memcpy() (or one that accesses the last bytes first) for
copy_to/from_user() if the length parameter is ignored completely.
Linus wasn't brave enough to remove it from the current version
of access_ok().

I do wonder if any other cpu have the same architectural issues
that required the guard page between user and kernel on 32bit x86.
(One is a system call at the end of the last page.)

LAM is one reason why 'masked_user_access' is such a bad name.

	David 

> 
> Thanks,
> 
>         tglx


