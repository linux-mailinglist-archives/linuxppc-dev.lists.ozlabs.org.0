Return-Path: <linuxppc-dev+bounces-566-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8290F96015C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2024 08:12:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtHJ462NLz2y8r;
	Tue, 27 Aug 2024 16:12:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724739124;
	cv=none; b=OPLZZ6IGfG9EuroZfNa/Fjrdxc18qo3R+DVJ5QTxujSUQNuY1/r0uDKPWF0uf3TXY3orG01zIB/8zHakgBlqMImKp017Fq1+cXBI1QOw8GM1tINAMA+lkOzTJ+FwBnn/F0/bvjxD+iKMEQtbbl0lOC18WsLUq0fBCm5+scXg1GfcyU5xejazTlvkQiaHSJf8lfMvZhmvfHrWB0Ve4mLa46sftPHZ7qIYogYnDxGzdFrSH9UWvUqphWZZE63wj9j8ReLysfOh/+J48ZyZlf94y9Qw9nLdER1KifALTWvRq2KhVUDvbivuyll6CF+kh97IDeqW2ve3HoBww1w9ypyo6A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724739124; c=relaxed/relaxed;
	bh=fG7x1OH97cuYrqXwRt3tfXrSo2tqzR3kMonHADTQYJ4=;
	h=DKIM-Signature:Received:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type; b=ZR9L2uRYYCk5YDkbzFKQpSREiQJpclo8XO/00u93SJK7Kh0C8z2JcwxIjWqgjGwCxhsGc8HxLJXrLR3I3e4AmC8Uw2j4gwRyEwxc5uwjKVkOltHuVn1z2nNL9h+20wgXXDbBFfcD8axON6iU5dHDPnQeNXPmsZt6obxxrGbcU/ndNp1rQ8KMc/FsJCHBk3Vb96La+99hF+GV5c2Artr9mPGVFqYixtyaFnJpf8kmybtpptyO7qXNVwmdW+lkUnKMBG3x/XV1qYIDVsaVKoFeFzVJuyRNccaycR6N8xUT/tUK9JxJykqqh4j7aMtkvup+aoabzW+QHUMpX67ys8nu0w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=clIaXTg7; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=clIaXTg7;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtHJ36z1Kz2xps
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 16:12:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1724739119;
	bh=fG7x1OH97cuYrqXwRt3tfXrSo2tqzR3kMonHADTQYJ4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=clIaXTg7srpOEu96sVX7cpgJT3VYl9yK8hIkUNuEuwYyuxtbh0oGaXBJi3Odw+yr8
	 +QoMQ1OLgrTtIoOXO33jGJPUzFAuBA2fnRmJfvGVSXukBeYzpGUdTq+Z3fhgg+4Blm
	 3u5L20QwG+lWe2MTK9tbnz7MvEY4ZZRuaMoh4k5zhzEyUsKrU7WKfYPEd8ETvSdf9K
	 8GTDRVC14UZhN1CSXXOw6yOOydDEPRQFylel2JGw1fnCXx+UPjG5Vgw+iTKsqBYyYe
	 zmnhq4cSxTVYbVRmIqb0ve2MB7FxQkfO0PKRJT/m8qYzMXEA+tv7u1VNW06qHlSq8g
	 KumBqIvQ0inhA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WtHHv3gXSz4wnx;
	Tue, 27 Aug 2024 16:11:55 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Sergei Shtylyov <sergei.shtylyov@gmail.com>, cassel@kernel.org
Cc: dlemoal@kernel.org, linux-ide@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, hch@lst.de,
 linux-ppc@kolla.no, vidra@ufal.mff.cuni.cz
Subject: Re: [PATCH v2] ata: pata_macio: Use WARN instead of BUG
In-Reply-To: <6b2208d1-c18f-14d5-e6d0-acd5c82b4db1@gmail.com>
References: <20240820030407.627785-1-mpe@ellerman.id.au>
 <6b2208d1-c18f-14d5-e6d0-acd5c82b4db1@gmail.com>
Date: Tue, 27 Aug 2024 16:11:54 +1000
Message-ID: <87a5gyfqad.fsf@mail.lhotse>
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

Sergei Shtylyov <sergei.shtylyov@gmail.com> writes:
> On 8/20/24 6:04 AM, Michael Ellerman wrote:
>
>> The overflow/underflow conditions in pata_macio_qc_prep() should never
>> happen. But if they do there's no need to kill the system entirely, a
>> WARN and failing the IO request should be sufficient and might allow the
>> system to keep running.
>
>    WARN*() can kill your system with panic_on_warn -- Android is particularly
> fond of this kernel parameter but I guess it's not your case... :-)
>    Greg KH usually advices against using these macros. :-)

Yeah, but in this case it's replacing BUG with WARN, so I figure it's
clearly an improvement.

Also if someone is running with panic_on_warn then they *want* their
system to panic if anything strange happens, which is the case here.

>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> [...]
>
>    Please do CC me on the PATA driver patches! This one circumvented my review
> (again)... :-/

Oops sorry, I think I just grabbed the Cc's from the report. I'll use
get_maintainer.pl in future.

cheers

