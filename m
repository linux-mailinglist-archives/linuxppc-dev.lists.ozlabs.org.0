Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1C6519FA2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 May 2022 14:34:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ktbr02Gvgz3bwC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 May 2022 22:34:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=BtQpLFee;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KtbqN1DxWz3bYM
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 May 2022 22:34:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=BtQpLFee; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KtbqN0Lpjz4ySb;
 Wed,  4 May 2022 22:34:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1651667648;
 bh=oOenf0npmleM7Zkj4fb3tq2ghcHcRGkMR0e0D9XaLHQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=BtQpLFeenGuc/+C1JQ4KNT9NPmTjH++VHQjMBbKQPvSStXCw+h3OzV8Wv6s3b23mX
 LJ+cZTcgXM6HVr/g3Wn9yRbogzHMvqvo1w8EBePigkZoAEVWV281qA0/j3MwWs3vrV
 dMuJQCuFrQ5C84boXpCc7KO2L3HXYJcyI/VefmZQK9H1+OW7PUJazDO7fEDaHD6DGv
 nP88N2MJsXmU4+8lVYE3N7/sNeonFI71+cqypeaV8VtcDSjdgxbN+jDvVSjF/Su9ue
 lpMKEMZ5dJn9SS/4UsPhfzqdeFBU4Gxe1bbiF4gnUDXlLpPXU0nrdJn12v3bDcjrWr
 gCSMg8UGjO2Sg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Alan Modra <amodra@gmail.com>, Segher Boessenkool
 <segher@kernel.crashing.org>
Subject: Re: [PATCH] powerpc/vdso: Fix incorrect CFI in gettimeofday.S
In-Reply-To: <YnBu+Rb/0XJBSTJW@squeak.grove.modra.org>
References: <20220502125010.1319370-1-mpe@ellerman.id.au>
 <20220502142705.GU25951@gate.crashing.org>
 <YnBu+Rb/0XJBSTJW@squeak.grove.modra.org>
Date: Wed, 04 May 2022 22:34:06 +1000
Message-ID: <875ymlv5mp.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Alan Modra <amodra@gmail.com> writes:
> On Mon, May 02, 2022 at 09:27:05AM -0500, Segher Boessenkool wrote:
>> >   2) If a function changes LR or any non-volatile register, the save
>> >      location for those regs must be given. The cfi can be at any
>> >      instruction after the saves up to the point that the reg is
>> >      changed. (Exception: LR save should be described before a bl.)
>> 
>> That isn't an exception?  bl changes the current LR after all :-)
>
> The point is that in other cases the cfi can be as late as the
> instruction that changes the reg.  For calls it must be at least one
> instruction before the call.

Got it.

> Also, I'll note for the wider audience that delaying cfi is slightly
> better than playing it safe as Michael has done in his patch in
> describing the saves right at the save instruction.  Register save cfi
> can usually be grouped together, resulting in fewer CFI_advance codes
> in .eh_frame.

I didn't want to go overboard on combining them, because it's harder to
read the source, especially with the #ifdefs we have for 64-bit.

I was able to save one CFA_advance_loc by moving the LR restore down one
line.

The .eh_frame didn't shrink, I guess because it's padded to some
alignment anyway.

>> Alan proposed a larger patch that changed to a single stack frame, but it needs changes to
>> take into account the red zone.
>
> Yes, now that you mention it, I see the obvious error in the patch I
> wrote.  I did say it was untested!

No worries, identifying the source of the bug as the missing CFI is the
key thing, it would have taken me a while to realise that.

cheers
