Return-Path: <linuxppc-dev+bounces-23-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7461C94F962
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2024 00:09:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=fUK47EIF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WjTFv6791z2xKx;
	Tue, 13 Aug 2024 08:09:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=fUK47EIF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=konstantin@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WjGFp3DDMz2xPZ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Aug 2024 23:53:49 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D9ED8CE0E93;
	Mon, 12 Aug 2024 13:53:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB7C0C4AF0D;
	Mon, 12 Aug 2024 13:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1723470824;
	bh=7L8fZ1BGtRAgR4RzO+a31sQ+afb8IZTXJAALlxkrVLQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fUK47EIFhvumRM1+SJJVYmB/P7bkg87zoykcoQWpL+FFH7IHiPr5rzmt3AezvJBsY
	 Cuwo/SvTp0zstxLwL7cZ1SdYFv8HRdtWl5pbTkKWcOP/kBwHNBYab6OpkOAM/HVPgr
	 TovZoVC6B0Uc58Y8NGxeYYFmokbM7oAW3Tl8G4cA=
Date: Mon, 12 Aug 2024 09:53:43 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: ppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: List change - munging for From addresses
Message-ID: <20240812-big-truthful-boar-cbfbb1@lemur>
References: <20240802130347.383a1b49@canb.auug.org.au>
 <20240802-agile-manipulative-dog-df4487@lemur>
 <20240805124204.49ed65df@canb.auug.org.au>
 <20240805-honored-weightless-kangaroo-71e79e@lemur>
 <20240812155427.14dc2281@canb.auug.org.au>
 <20240812161913.082cd5ca@canb.auug.org.au>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240812161913.082cd5ca@canb.auug.org.au>

On Mon, Aug 12, 2024 at 04:19:13PM GMT, Stephen Rothwell wrote:
> > For the subscribers, to see how to manage you subscription, you will be
> > able to end an email to <linuxppc-dev+help@lists.ozlabs.org> for
> > instructions.  Hopefully you all won't find it too restrictive.
> > 
> > Please report any problems with the list after the change to me.
> 
> The switch has happened, let's see how we go (starting wit this mail
> :-)).

Headers look good! One thing you'll also want to set up is OpenARC to add
ARC signatures, which are now required by Google once your mail server reaches
certain thresholds. OpenARC isn't too hard to set up.

-K

