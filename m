Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF538917C7D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2024 11:28:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=h99XaPul;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8GbL2jDdz3cVk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2024 19:28:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=h99XaPul;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8GZd2C62z30T7
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2024 19:27:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1719394066;
	bh=Z0cCuqbCi6qeO6wyfodeUIhXjtgD405yHuP4v2jv4aU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=h99XaPulVs60hJoiREYh00S73G17Yh76fEEhsz8AUNUeRvRgzaiKHp14NpiY5hZHB
	 Ou+uGW7/5X4esOKXkwam45RV+bQgrN9pWprwAR/XfFX12ll+NfHbWYxwdHSN87d1C9
	 5U0d380qVLVilJNG5oYNWGHRqH7n8FjZ6GJyps348oEmEuKVPQbvTIYbnG+IogUfL4
	 2+3PCmfUzQgXPqM2R93lUySAU5Z4nCobGYry/HyrPQ7yOz4KHACF2PHeyKAEe/kNKm
	 QHizITY9zX1M+cRXeLpT26+yxHrDQMeaROJu7PimI8+cc06toOjMkK9n0BgGQG91Dj
	 nGdflU55OjXww==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4W8GZT6JRtz4wb2;
	Wed, 26 Jun 2024 19:27:45 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/pseries: Fix scv instruction crash with kexec
In-Reply-To: <20240625134047.298759-1-npiggin@gmail.com>
References: <20240625134047.298759-1-npiggin@gmail.com>
Date: Wed, 26 Jun 2024 19:27:45 +1000
Message-ID: <87sex0oxym.fsf@mail.lhotse>
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
Cc: Nicholas Piggin <npiggin@gmail.com>, Sourabh Jain <sourabhjain@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> kexec on pseries disables AIL (reloc_on_exc), required for scv
> instruction support, before other CPUs have been shut down. This means
> they can execute scv instructions after AIL is disabled, which causes an
> interrupt at an unexpected entry location that crashes the kernel.
>
> Change the kexec sequence to disable AIL after other CPUs have been
> brought down.
>
> As a refresher, the real-mode scv interrupt vector is 0x17000, and the
> fixed-location head code probably couldn't easily deal with implementing
> such high addresses so it was just decided not to support that interrupt
> at all.
>
> Reported-by: Sourabh Jain <sourabhjain@linux.ibm.com>
 
Was this reported publicly? I don't remember it.

cheers
