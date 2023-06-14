Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C3672F457
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 07:57:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=rYYjExOe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qgvpj3Kr2z30gQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 15:57:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=rYYjExOe;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qgvnq6r12z300q
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 15:57:03 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Qgvnl6MVqz4x1d;
	Wed, 14 Jun 2023 15:56:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1686722219;
	bh=NJMCszZ2hm+epJD/b0/Po9iHFnpLLa6pwtEYRGUJdg4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=rYYjExOevnMF7VSK016ySJJkxyfYKfvocJ/hE9AX27BM+sOECgHU0HNhYT0O7nrN2
	 vyDzsumvC+wkHAcKJM+8UrMsqA266ztoQ/59pPNwQB1T8asqzDUa8Tgj7K3iFutMWg
	 nYpSZcN5oE2tXc3B7f+r9vShGxjta70K78hmp6Lz+vqLmnDCD/tocmltGAr2whGjb+
	 LtBcZXJ8L/FCfjm/l7navUSEV0SoS8ZujmZrq+DBaPZrQ/zqq1cU49Rx6BCmTVku1X
	 SP+KChTEHC5vebS5t5to/Gw66pgAILz6q+h19qAcEm7yMzaWvOaQwn38y/pwKRP4e4
	 br12yYv5yvMYA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 4/4] powerpc/64s: Use POWER10 stsync barrier for wmb()
In-Reply-To: <87wn07foos.fsf@mail.lhotse>
References: <20230609100026.8946-1-npiggin@gmail.com>
 <20230609100026.8946-4-npiggin@gmail.com> <87wn07foos.fsf@mail.lhotse>
Date: Wed, 14 Jun 2023 15:56:57 +1000
Message-ID: <87ttvafuxi.fsf@mail.lhotse>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:
> Nicholas Piggin <npiggin@gmail.com> writes:
>> The most expensive ordering for hwsync to provide is the store-load
>> barrier, because all prior stores have to be drained to the caches
>> before subsequent instructions can complete.
>>
>> stsync just orders stores which means it can just be a barrer that
>> goes down the store queue and orders draining, and does not prevent
>> completion of subsequent instructions. So it should be faster than
>> hwsync.
>>
>> Use stsync for wmb(). Older processors that don't recognise the SC
>> field should treat this as hwsync.
>
> qemu (7.1) emulating ppc64e does not :/
>
>   mpic: Setting up MPIC " OpenPIC  " version 1.2 at fe0040000, max 1 CPUs
>   mpic: ISU size: 256, shift: 8, mask: ff
>   mpic: Initializing for 256 sources
>   Oops: Exception in kernel mode, sig: 4 [#1]
..
>
> I guess just put it behind an #ifdef 64S.

That doesn't work because qemu emulating a G5 also doesn't accept it.

So either we need to get qemu updated and wait a while for that to
percolate, or do some runtime patching of wmbs in the kernel >_<

cheers
