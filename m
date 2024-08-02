Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1039460E2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2024 17:54:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=MsBFHWLC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wb9Q30NYHz3fS0
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Aug 2024 01:54:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=MsBFHWLC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=konstantin@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wb9PL6q3Jz3cVy
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Aug 2024 01:54:13 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5FAAB628BC;
	Fri,  2 Aug 2024 15:54:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9132C32782;
	Fri,  2 Aug 2024 15:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1722614050;
	bh=Dt8HsdZN2ZKWXTVdrNaWXSik9UFrEhW4MfgQwZOYqlI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MsBFHWLCAkJxPbbEJmV4kOY0uYxl7mgNZX4olG1UlkDFyb1MoAb2m+4APNsjxmszg
	 XaDcoemk3LQJiQz7Qwcg0x6PKxGHssU3JRfoNxmsY4I1vavuMw4uxKrEsviKxMfRlu
	 zD4InjJzy0FUlOvUpYIvxngt5zLkVghHT/OVy3Lw=
Date: Fri, 2 Aug 2024 11:54:06 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: List change - munging for From addresses
Message-ID: <20240802-agile-manipulative-dog-df4487@lemur>
References: <20240802130347.383a1b49@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240802130347.383a1b49@canb.auug.org.au>
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
Cc: ppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 02, 2024 at 01:03:47PM GMT, Stephen Rothwell wrote:
> As more and more sites are using DKIM signing or emails (and DMARC),
> more and more of the list traffic is not being delivered due to Mailman
> altering messages in subtle ways (so the DKIM signature is no longer
> valid).  The easiest thing to do is to tell Mailman to munge the From:
> address so that the messages come from the mailing list itself.  It
> also adds a Reply-To: header with the original sender's address.
> 
> So a message from me to the list will now have
> 
> From: Stephen Rothwell via Linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
> Reply-To: Stephen Rothwell <sfr@canb.auug.org.au>
> 
> The only real downside to this (I think) is that if you take a message
> from the list containing a patch and apply that to a git tree you will
> have to fix up the Author appropriately.
> 
> Konstantin, I assume (hope?) that b4 may have some way of fixing the
> authorship up?

Not really, for two reasons:

- X-Original-From is widely used, but isn't really a standard header.
- From-munging breaks end-to-end attestation, so we consider x-original-from
  and similar headers a potential impersonation attempt and ignore them.

I would generally say that From-munging isn't a great option for any list that
receives patches. A much better approach is to just not modify the message
headers or message body. This should be possible with mailman.

-K
