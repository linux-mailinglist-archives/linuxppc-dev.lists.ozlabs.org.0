Return-Path: <linuxppc-dev+bounces-5727-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 90895A2389E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2025 02:34:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YkdjC09wgz30Tx;
	Fri, 31 Jan 2025 12:34:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738287262;
	cv=none; b=cPWF8V/59ry6TXHI3zDzAIZ/roTSwTzGTR/OmrO9H4VD2mSGvCZePwlBlwygJc5KBQzHtNdT56EkcFhZ8Q/g3qRGDLTXNDWyyL9Av/GyTiVJKKBuOo6bdbT1VgR9sdYrC7JevnI/RY3ysFXAQHSLNMmjq7FRENBiU4iIscELE7iyv4Gg6XboSdWO8MbYx50dWpk9+N+apn1jtmxK9s8lrH1yWF15qZzQ2a0rxVY9z5FkIqzBGVsgs2G0rClhmyNPUG+m3tqF5dHcb9TkzNe+88sDZRYMeOxPASzDRj1j0WgxcmtFHf9yoosv9SFpKzVRHJZebg1gfWxf8bZchQwHsg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738287262; c=relaxed/relaxed;
	bh=SrNZgYNGia4KKp41+dG+nC3gGkSQbfiB2f2oBxUUAgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H+ZYt99uo59Yx8DqHANazrf+OwV33O6GbIqZyCLGtGm69a/O9r/NarthUjU+8Ma6zGj0J4PWG6sUmclb5hbk/i+51ZScwrZM/357YVMc7LUVPZ2oY10TMCe5fG+ujIjaWjuKz9gW0dVeyynZU+kDEvIW5+XttnvgF7tHc7w1OP4882DGkUssV9baWJhWcIxMGR3Ww3MOQs4LorM1N7SFfxWmyrqr1sh//lhM2slXkpQuMblDTmg07DkSdH826GzGfOn0QUnPG7ps4DmPYSqa/gKXvRUMmtp3zfAQtm1BkAv+3beXSXE4IGJqQik5BMoVEHqiRT2lM+bkn89dgYy01w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org; dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=xYO/8i1a; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=xYO/8i1a;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ykdj90pNBz30MM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jan 2025 12:34:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1738287252;
	bh=SrNZgYNGia4KKp41+dG+nC3gGkSQbfiB2f2oBxUUAgU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xYO/8i1aS1d84FGPiv1JfmMD00Z5i1otzFioiS2DtJWcev0V05tbaLLAeM+Uo71l4
	 +1/Z3IRlOnQmppPzwOjz/L7kpWDBNiigNOR3A4xafe8n5+AeKnEWSGTfYNDQWhcS+6
	 0hPsfoOyDFhOYwpC8wzmlpNacw8aRf36c0QvB56KXOLWZJA9KiiKf+iUM2r2B8fDS9
	 uE+yDTwFTiIkmnj5oYrmfpYR2Tjh/tWLAnkIEHtzndu0zCGL40bE8h6xnrsOb5R5TP
	 H0tPUS3XK13DhqiH6xI2GK1z7TQRIyl8QGqK26sFqrmMGryqOc8hIsnd00ZZoXQJ0L
	 ODy4tBTpg54hA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1003)
	id 4Ykdj013H3z4x4t; Fri, 31 Jan 2025 12:34:12 +1100 (AEDT)
Date: Fri, 31 Jan 2025 12:34:14 +1100
From: Paul Mackerras <paulus@ozlabs.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 5/5] powerpc/microwatt: Add SMP support
Message-ID: <Z5wolsFd82NNfWk8@thinks.paulus.ozlabs.org>
References: <Z5lfDb8wsLlmSLBZ@thinks.paulus.ozlabs.org>
 <Z5lgTN0aA_yiETne@thinks.paulus.ozlabs.org>
 <D7EC9DL1YW6K.5NFBT1W937FK@gmail.com>
 <Z5nRYn11vxVuGU7J@thinks.paulus.ozlabs.org>
 <874j1hss0r.fsf@mpe.ellerman.id.au>
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
In-Reply-To: <874j1hss0r.fsf@mpe.ellerman.id.au>
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Jan 29, 2025 at 11:50:44PM +1100, Michael Ellerman wrote:
> Paul Mackerras <paulus@ozlabs.org> writes:

> There's macros that would make these a little nicer, ie. PPC_RAW_MFSPR()
> and PPC_RAW_BRANCH().

Thanks, I'll use them.

> > 	/* enable the other CPUs, they start at location 0 */
> > 	writel((1ul << ncpus) - 1, syscon + SYSCON_CPU_CTRL);
> >
> > 	timeout = 10000;
> > 	while (!__secondary_hold_acknowledge) {
> > 		if (--timeout == 0)
> > 			break;
> > 		barrier();
> > 	}
> 
> I assume CPU 0 always boots first?

Yes, on reset, only CPU 0 starts executing, and the rest are held in
the reset state until that writel() to SYSCON_CPU_CTRL enables them.
They all then start executing at location 0.

> Is the loop actually necessary? It only waits for a single non-zero CPU
> to come up after all, not all of them.

Yes, it only waits for the first one to get to the point of setting
__secondary_hold_acknowledge, but that might take a microsecond or so,
meaning we do need a loop (or I suppose a udelay(10) would probably
also be sufficient).  The assumption is that any others will get into
the loop very shortly after the first.  If that proves incorrect, it
would be possible instead to start them one by one, clearing
__secondary_hold_acknowledge each time (but I don't have a way to test
such code at present).

Paul.

