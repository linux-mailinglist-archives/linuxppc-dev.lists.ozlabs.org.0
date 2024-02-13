Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C7D852847
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 06:39:59 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PHkAAbfY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYqsT0h0fz3dTx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 16:39:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PHkAAbfY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYqrk1hWmz2xqH
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 16:39:18 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 82538CE199D;
	Tue, 13 Feb 2024 05:39:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EEAFC433C7;
	Tue, 13 Feb 2024 05:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707802753;
	bh=kVPmS5ATZR2XIMsQ9oMeLw+28mzdQWPEEAUNT2yQ+Kw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PHkAAbfYD3jB4ef8/Qi0e4WyUP66vO6N1PPtZMflvAlyUEycPbyUNZ9NxPw+XVN3J
	 63V4wV/DjkW9HIYBzRjW3GmTafdCrNXQFgY/YBXxfx5/Gl0cYdjZFIQplKstLrHMy4
	 +xjNF+T7QE+/36KpDgK9f38lsnwndR/IipgBkUfuNnuFt6z8UhZUdmXG/Jfo25kqKK
	 xCiemjM18OapXoP9VjPHWABNgFRc3rjvQrrRKcVZx4aAJn7Ipl1blNG2wny7uzE6XG
	 ocnjLVO2R5GtdlF2mGoG2kf0117xRH2Qap+YpnTKPW//1OQnhhChzarcezo0gb00eo
	 p8Ft5haiOWZlg==
Date: Tue, 13 Feb 2024 11:00:25 +0530
From: Naveen N Rao <naveen@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/ftrace: Ignore ftrace locations in exit text
 sections
Message-ID: <k627jrya2f524lfwa3dafhf7uvomamojkpww6b4uavx5wr6z6f@r5jkqiey6t6b>
References: <20240209075931.666935-1-naveen@kernel.org>
 <669b8cbe-3fd4-44fb-be8d-f21def9f728e@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <669b8cbe-3fd4-44fb-be8d-f21def9f728e@csgroup.eu>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Steven Rostedt <rostedt@goodmis.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 12, 2024 at 07:31:03PM +0000, Christophe Leroy wrote:
> 
> 
> Le 09/02/2024 à 08:59, Naveen N Rao a écrit :
> > diff --git a/arch/powerpc/include/asm/sections.h 
> > b/arch/powerpc/include/asm/sections.h
> > index ea26665f82cf..d389dcecdb0b 100644
> > --- a/arch/powerpc/include/asm/sections.h
> > +++ b/arch/powerpc/include/asm/sections.h
> > @@ -14,6 +14,7 @@ typedef struct func_desc func_desc_t;
> >   
> >   extern char __head_end[];
> >   extern char __srwx_boundary[];
> > +extern char _sexittext[], _eexittext[];
> 
> Should we try to at least use the same symbols as others, or best try to 
> move this into include/asm-generic/sections.h, just like inittext ?

I used this name based on what is used for init text start and end in 
the generic code: _sinittext and _einittext.

> 
> $ git grep exittext
> arch/arm64/include/asm/sections.h:extern char __exittext_begin[], 
> __exittext_end[];

Arm64 also uses the non-standard __inittext_begin/__inittext_end, so it 
looks to be something very specific to arm64.

I do agree it would be good to refactor and unify names across 
architectures.


- Naveen

