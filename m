Return-Path: <linuxppc-dev+bounces-2-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A152E94E6B3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2024 08:32:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=pVsXWGmc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wj4Sz0cX6z2xgw;
	Mon, 12 Aug 2024 16:32:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=pVsXWGmc;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wj4Sx2vfKz2xPc
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Aug 2024 16:32:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1723444369;
	bh=Ofns1V1v5xhhh+F1mL21bIN0suM6fhk7sM9rPWvQio0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=pVsXWGmc4JhEkeMx7uUUbxqlyFuPKS0FuhChf98sidn8RmS4Bl0g4hZaM8bSmHj15
	 giw9ErELdI31u4J6wgN5uWtkoxfXBvaHKbEekeGqBAfdNgQQWfoJ/cNnCPcrUCxCOM
	 cQIXiyg1AHpf96UR9vaIctqz4y7onqmv40iH7iH4hnXlJ+KjmxDlEGUPqL1KfmO5zN
	 AkEsSGq6dWAka5gMEBNWbufEuaP8AOsyKsK2rL/lugU8Bt81ZMbZUJ+em4Rv2VLUG7
	 YWdy87/5R/SL+1F0udBtVeVzgHEQgecMM5qsZ5GOd1TcQ6XH55xStLdSrcSuwAf0hd
	 YHakoBs5KziMg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wj4Sx1w6Wz4w2R;
	Mon, 12 Aug 2024 16:32:49 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>, ppc-dev
 <linuxppc-dev@lists.ozlabs.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: List change - munging for From addresses
In-Reply-To: <20240812161913.082cd5ca@canb.auug.org.au>
References: <20240802130347.383a1b49@canb.auug.org.au>
 <20240802-agile-manipulative-dog-df4487@lemur>
 <20240805124204.49ed65df@canb.auug.org.au>
 <20240805-honored-weightless-kangaroo-71e79e@lemur>
 <20240812155427.14dc2281@canb.auug.org.au>
 <20240812161913.082cd5ca@canb.auug.org.au>
Date: Mon, 12 Aug 2024 16:32:48 +1000
Message-ID: <87plqe8d4f.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> Hi ,
>
> On Mon, 12 Aug 2024 15:54:27 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> On Mon, 5 Aug 2024 10:54:17 -0400 Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:
>> >  
>> So, I am going to try "mean and lean" (since I am the owner/moderator
>> anyway).  Shortly (i.e. in the next hour or so), I will switch the
>> linuxppc-dev mailing list to use Mlmmj.  Hopefully this will fix all
>> our problems with DKIM/DMARC and delivery of posts from some domains.
>> 
>> For the subscribers, to see how to manage you subscription, you will be
>> able to end an email to <linuxppc-dev+help@lists.ozlabs.org> for
>> instructions.  Hopefully you all won't find it too restrictive.
>> 
>> Please report any problems with the list after the change to me.
>
> The switch has happened, let's see how we go (starting wit this mail
 
Looks like it's dropping some 'h' characters? :P

Otherwise looks OK so far. I'll send a patch to test how that goes.

cheers

