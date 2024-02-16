Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F6C85738F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Feb 2024 02:50:42 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=nUf6VsQU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TbZdW0V7yz3cCc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Feb 2024 12:50:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=nUf6VsQU;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TbZcm6Zrnz30NP
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Feb 2024 12:50:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1708048200;
	bh=ilgT5dMTrGshreLT/xmA8StB9lAVJjM5yFaL9rWoLlY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=nUf6VsQUornJVXtxyPvxjC3f4ZR4GXUYzm/uzcLAo4CF/ClAUxiy8kug865ZUbReq
	 9HtzdPrYVc5xEj2oWXSf/7BkXWuFNLwVjCUGQgEr6qLtJ6H7HgPlDejG+HNNIjAwbi
	 6w8cIduvfIdwqAfB3CP4wlilbEwRkoZj0s9s7M0KGc93FVcSrQKRWAEMqJnr/M/+34
	 K1EJhFueA8dhCIeYVomM86vptheCj3l4Jj/gKneCKLES8lTCF2mTkGRRNt/IQdncMO
	 bybEcODsRExRcydq4WNOog++4G+FboWUqACVsgpwhiDflxujhcgmHgKWXGqbcqSz3m
	 AymH3IjTkKV3w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TbZcm04G8z4wcp;
	Fri, 16 Feb 2024 12:49:59 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Peter Bergner <bergner@linux.ibm.com>, Arnd Bergmann <arnd@kernel.org>,
 linux-api@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2] uapi/auxvec: Define AT_HWCAP3 and AT_HWCAP4 aux
 vector, entries
In-Reply-To: <a50cf258-b861-40e5-8ca9-dec7721400ec@linux.ibm.com>
References: <a406b535-dc55-4856-8ae9-5a063644a1af@linux.ibm.com>
 <aa657f01-7cb1-43f4-947e-173fc8a53f1f@app.fastmail.com>
 <a50cf258-b861-40e5-8ca9-dec7721400ec@linux.ibm.com>
Date: Fri, 16 Feb 2024 12:49:59 +1100
Message-ID: <87edddp48o.fsf@mail.lhotse>
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
Cc: Szabolcs Nagy <szabolcs.nagy@arm.com>, Nick Piggin <npiggin@au1.ibm.com>, Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Peter Bergner <bergner@linux.ibm.com> writes:
> On 2/15/24 2:16 AM, Arnd Bergmann wrote:
>> On Wed, Feb 14, 2024, at 23:34, Peter Bergner wrote:
>>> The powerpc toolchain keeps a copy of the HWCAP bit masks in our TCB for fast
>>> access by the __builtin_cpu_supports built-in function.  The TCB space for
>>> the HWCAP entries - which are created in pairs - is an ABI extension, so
>>> waiting to create the space for HWCAP3 and HWCAP4 until we need them is
>>> problematical.  Define AT_HWCAP3 and AT_HWCAP4 in the generic uapi header
>>> so they can be used in glibc to reserve space in the powerpc TCB for their
>>> future use.
>>>
>>> I scanned through the Linux and GLIBC source codes looking for unused AT_*
>>> values and 29 and 30 did not seem to be used, so they are what I went
>>> with.  This has received Acked-by's from both GLIBC and Linux kernel
>>> developers and no reservations or Nacks from anyone.
>>>
>>> Arnd, we seem to have consensus on the patch below.  Is this something
>>> you could take and apply to your tree? 
>>>
>> 
>> I don't mind taking it, but it may be better to use the
>> powerpc tree if that is where it's actually being used.
>
> So this is not a powerpc only patch, but we may be the first arch
> to use it.  Szabolcs mentioned that aarch64 was pretty quickly filling
> up their AT_HWCAP2 and that they will eventually require using AT_HWCAP3
> as well.  If you still think this should go through the powerpc tree,
> I can check on that.

I'm happy to take it with Arnd's ack.

I trimmed up the commit message a bit, see below.

cheers


Author:     Peter Bergner <bergner@linux.ibm.com>
AuthorDate: Wed Feb 14 16:34:06 2024 -0600
Commit:     Michael Ellerman <mpe@ellerman.id.au>
CommitDate: Fri Feb 16 12:42:59 2024 +1100

    uapi/auxvec: Define AT_HWCAP3 and AT_HWCAP4 aux vector, entries

    The powerpc toolchain keeps a copy of the HWCAP bit masks in the TCB
    for fast access by the __builtin_cpu_supports() built-in function. The
    TCB space for the HWCAP entries - which are created in pairs - is an ABI
    extension, so waiting to create the space for HWCAP3 and HWCAP4 until
    they are needed is problematic. Define AT_HWCAP3 and AT_HWCAP4 in the
    generic uapi header so they can be used in glibc to reserve space in the
    powerpc TCB for their future use.

    I scanned through the Linux and GLIBC source codes looking for unused
    AT_* values and 29 and 30 did not seem to be used, so they are what I
    went with.

    Signed-off-by: Peter Bergner <bergner@linux.ibm.com>
    Acked-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>
    Acked-by: Nicholas Piggin <npiggin@gmail.com>
    Acked-by: Szabolcs Nagy <szabolcs.nagy@arm.com>
    Acked-by: Arnd Bergmann <arnd@arndb.de>
    Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
    Link: https://msgid.link/a406b535-dc55-4856-8ae9-5a063644a1af@linux.ibm.com
