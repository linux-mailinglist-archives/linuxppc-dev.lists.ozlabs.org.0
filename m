Return-Path: <linuxppc-dev+bounces-3560-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D29D79D90CA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2024 04:50:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xy7r62R9xz2yVb;
	Tue, 26 Nov 2024 14:49:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732592998;
	cv=none; b=k7DkoWZVueyu7u+FROX3nzCxpOxr52gE5TeJw0NNssT2zwJmkVy9O93wa5vwNxdC6BgWQcZioS+e87O364tHir+DsEKlILOT5SWmPhlkQ+Kui+O9BzDwKPn7xY4vrN6XM/D6FWN+fVZrKPwINyvt5NFjU93FVwUYglA+SUOZIyFcAsF1F4+HVrbpOr0mSBD7tec61u8wlEF91LdRb/4/F4rBhGJVFJMKMoAOHZdaLHysXD1jZUfnbmbuf+MdVlX1iwoAs5Wdl75mpXpIc2YVi29LgPXJW3x/eSv+RH6DCIk0Va++H0VCKIWhjUAaPCwPKLiChHCzMhxYsaGecIbR/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732592998; c=relaxed/relaxed;
	bh=1GDroj8cvLi8AxibFvo2uc0aSiYUK5hkkTcQYG+0QMU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UnnUVKSnjvzj6POdURGSPk36zLmLP16XGkcSR5jGtBiqPUINnnehZXCi41IIXZSTquCUbsTmEyP4Lg1I2t8MJDuhw1wnVq0oFacQI3H/G3KvIpqIf3uwFa3W/N9IuFundWP9KKduu3/lpnlZ/3BjlMiv5zUfgu062DAGMnBbi5imp0bkX44W0up59zy6EzQPjbyrKitbPoZAsoV0A6OgSDznJHR+2p2QHlsfzFrjI5qkUW1+z5nw7pR/VuqLFm1Tf+baVqXQaYbWIgKVnDJRCH6A8d63V2fWa8czJhekraRto1TQ6L8wO+AFJljKaaUoEpCK2jn3I91Q/qr5jpDy/w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=R3WKrDKY; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=R3WKrDKY;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xy7r52xwlz2xxt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2024 14:49:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1732592993;
	bh=1GDroj8cvLi8AxibFvo2uc0aSiYUK5hkkTcQYG+0QMU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=R3WKrDKYw/ByHHEa3PtgTcc8Xvh/auZj8U5ShHkBVdPy++QKCXrk6InR/jlQz2g46
	 Ho3w7cBt7fIt75TfsDMPoccD5p0suflRBhbppyLZX0SOea3+KT1vLVP6q4j+hA7TNd
	 QtKRqI0xD++3UaInC37uz3VJIV+X8ZM3in0MRSbQEwzqA++giq9uCV9m7G/E1Av0jC
	 2j6tYOINNtTiSI3JxBWbOh0dyPlF/OyYE7voVaU7kBqyNlwf1Bj3YxOaFjgRX5JLiN
	 oBNtQU0aNHOTFz9t5zgiM+A/yBhv09Us81gDkbiOP93txeBtDtCFzbtpqfwPhV3SYX
	 BqQqPONaaOXRA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xy7r163rdz4wcy;
	Tue, 26 Nov 2024 14:49:53 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 geert@linux-m68k.org, arnd@arndb.de
Subject: Re: [RFC PATCH 01/10] powerpc/chrp: Remove CHRP support
In-Reply-To: <20241114210418.GM29862@gate.crashing.org>
References: <20241114131114.602234-1-mpe@ellerman.id.au>
 <20241114210418.GM29862@gate.crashing.org>
Date: Tue, 26 Nov 2024 14:49:49 +1100
Message-ID: <87mshm7ixu.fsf@mpe.ellerman.id.au>
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
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Segher Boessenkool <segher@kernel.crashing.org> writes:
> On Fri, Nov 15, 2024 at 12:11:04AM +1100, Michael Ellerman wrote:
>> CHRP (Common Hardware Reference Platform) was a standard developed by
>> IBM & Apple for PowerPC-based systems.
>> 
>> The standard was used in the development of some machines but never
>> gained wide spread adoption.
>> 
>> The Linux CHRP code only supports a handful of machines, all 32-bit, eg.
>> IBM B50, bplan/Genesi Pegasos/Pegasos2, Total Impact briQ, and possibly
>> some from Motorola? No Apple machines should be affected.
>> 
>> All of those mentioned above are over or nearing 20 years old, and seem
>> to have no active users.
>
> This was used by all non-IBM 970 systems as well.  The last was SLOF on
> JS20 and JS21, about 20 years ago yes, and I doubt anyone uses it still
> (I don't).

By "this" you mean the CHRP standard?

At least in Linux the "CHRP" platform has always been 32-bit only AFAIK.

My memory is that JS20/JS21 used the "maple" platform, which was a
64-bit only bare-metal platform, possibly it was actually == CHRP, but
we didn't call it that in Linux.

But maybe I'm wrong, you were more involved than me back than, and it
was a long time ago :)

cheers

