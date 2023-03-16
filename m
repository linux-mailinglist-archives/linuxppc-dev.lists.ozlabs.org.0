Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 938756BC2D6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Mar 2023 01:34:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PcSvW3Qfqz3cjY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Mar 2023 11:34:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=naebMpWV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PcStc2z56z2x9L
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Mar 2023 11:34:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=naebMpWV;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PcStb64Qxz4x1d;
	Thu, 16 Mar 2023 11:33:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1678926839;
	bh=tVxoK8hf/XN33P1gUvO+d1PauwkQu5SvlY6VlvvJG+I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=naebMpWVzZnTsDDVDCZvu+loLUFkGB0WVnpnOVf1RrkkzLRr65F2p2HX7qV5gH71O
	 bCmEMKta2CEf6yQjYBKBLJ+wsFfECWBBIrieoCou4jcjMP0HgC9/CJlP3lHn6EIv/E
	 34i3WR6kWLcP/AGaJrVMo482XbwaZtaUb9Gfh0kKBiti6xZFgEjZ+Op4CqB/6oDLUw
	 lWI//uuSQlxAcqcd2n2imIyIpJv22PnSxqnEynqVXhD4X2Ly4ocHgIzGmH8lR+tAti
	 L1iOQJnIlam9qUTNGbeP7fJyZ5PPX6sP5s0NjQO5qjtQD9XTbcGiKp8lIC9Wdersg2
	 o+F5WIBKg2JWw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Andrea Righi <andrea.righi@canonical.com>
Subject: Re: boot regression on ppc64 with linux 6.2
In-Reply-To: <ZBFhUAlL+1ZVKcwQ@righiandr-XPS-13-7390>
References: <ZA7oJr1/Z4vzWy4N@righiandr-XPS-13-7390>
 <878rfyofma.fsf@mpe.ellerman.id.au>
 <ZBFhUAlL+1ZVKcwQ@righiandr-XPS-13-7390>
Date: Thu, 16 Mar 2023 11:33:59 +1100
Message-ID: <87zg8dmt54.fsf@mpe.ellerman.id.au>
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
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, Oleg Nesterov <oleg@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Andrea Righi <andrea.righi@canonical.com> writes:
> On Wed, Mar 15, 2023 at 02:30:53PM +1100, Michael Ellerman wrote:
>> Andrea Righi <andrea.righi@canonical.com> writes:
>> > I'm triggering the following bug when booting my qemu powerpc VM:
>> 
>> I'm not seeing that here :/
>> 
>> Can you give a bit more detail?
>>  - qemu version
>>  - qemu command line
>>  - what userspace are you using?
>>  - full dmesg of the failing case
>
> Yeah, ignore this for now, it could be related to another custom patch
> that I had applied (and forgot about it sorry), this one:
> https://lore.kernel.org/lkml/20230119155709.20d87e35.gary@garyguo.net/T/

OK. Did you do the bisect with that patch applied though?

> That is causing other issues on ppc64, so I think it might be related to
> that, I'll do more tests making sure I use a vanilla kernel.

I don't see an obvious connection between the modversions stuff and this
crash, but I guess it's possible.

cheers
