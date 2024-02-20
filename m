Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D700585BBAF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Feb 2024 13:17:30 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=GD3yqmmZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TfJLw5qX9z3c5J
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Feb 2024 23:17:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=GD3yqmmZ;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TfJLD1M5Nz3020
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Feb 2024 23:16:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1708431412;
	bh=2l3rBrlaMDW50C86WedOYl7TeQVL5MVxtb4kb091kQk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=GD3yqmmZQf54kSia4Vj/3n4xZgcFVPM5H6gU8+s9s35DsGhuI6nAewDF9BU+ge3QZ
	 lT+4OWi8po+tJ5Gk57Xs5s0htXbYPgwhapZNazGzz5H0xgezLSxMpiL+OgbgS++AiE
	 uRMPJG2y4t241r87y9Zjl8D6Djm0wM9e9k7dI5j6lnUGXF54j7eAqbnizJIKw2OMB8
	 B28kkNowEZI0oNTFgE/pDj1Lw+BPztdQXeNSNfMpXdPG+mIT4bND1umhw7W6IX+u54
	 q2LMXtic7AQaSkIfr81mypInF1OkX83Y8N4CsMJZtW7g9Nnju4fM5O2XzA9bY8K221
	 Xx6o7UIyF1sRQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TfJLD02whz4wxs;
	Tue, 20 Feb 2024 23:16:51 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, "Aneesh Kumar K.V"
 <aneesh.kumar@linux.ibm.com>, "Naveen N. Rao"
 <naveen.n.rao@linux.ibm.com>, Brian King <brking@linux.ibm.com>
Subject: Re: [PATCH RFC] powerpc/pseries: exploit H_PAGE_SET_UNUSED for
 partition migration
In-Reply-To: <20240111-h_page_set_unused-for-lpm-v1-1-cd56184ad608@linux.ibm.com>
References: <20240111-h_page_set_unused-for-lpm-v1-1-cd56184ad608@linux.ibm.com>
Date: Tue, 20 Feb 2024 23:16:51 +1100
Message-ID: <87edd7baa4.fsf@mail.lhotse>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
writes:
> From: Nathan Lynch <nathanl@linux.ibm.com>
>
> Although the H_PAGE_INIT hcall's H_PAGE_SET_UNUSED historically has
> been tied to the cooperative memory overcommit (CMO) platform feature,
> the flag also is treated by the PowerVM hypervisor as a hint that the
> page contents need not be copied to the destination during a live
> partition migration.
>
> Use the "ibm,migratable-partition" root node property to determine
> whether this partition/guest can be migrated. Mark freed pages unused
> if so (or if CMO is in use, as before).
>
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
> ---
> Several things yet to improve here:
>
> * powerpc's arch_free_page()/HAVE_ARCH_FREE_PAGE should be decoupled
>   from CONFIG_PPC_SMLPAR.
>
> * powerpc's arch_free_page() could be made to use a static key if
>   justified.
>
> * I have not yet measured the overhead this introduces, nor have I
>   measured the benefit to a live migration.
>
> To date, I have smoke tested it by doing a live migration and
> performing a build on a kernel with the change, to ensure it doesn't
> introduce obvious memory corruption or anything. It hasn't blown up
> yet :-)
>
> This will be a possibly significant behavior change in that we will be
> flagging pages unused where we typically did not before. Until now,
> having CMO enabled was the only way to do this, and I don't think that
> feature is used all that much?

Yeah AFAIK it has to be explicitly configured and enabled via the HMC,
so doesn't get much testing or usage.

> Posting this as RFC to see if there are any major concerns.
 
My worry is that this will add overhead for everyone in normal usage, an
hcall per freed set of pages, whereas the benefit is only seen when a
migration happens.

But that does depend on how often arch_free_page() gets called in normal
usage, which I don't know offhand.

cheers
