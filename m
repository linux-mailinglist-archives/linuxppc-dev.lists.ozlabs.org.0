Return-Path: <linuxppc-dev+bounces-12583-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D908EBA1F2F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Sep 2025 01:17:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cXqPR2jD0z30FR;
	Fri, 26 Sep 2025 09:17:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758842251;
	cv=none; b=aN0vVVwKmFNwukbNetumX2BwOPTzLx2SIbuWNWw22ymoH5N9hqV0dwvKG9jan5s4xDJIdhG3ZOTsMD0G1TXvVsUz/0pRLU1G6Kchd0SOdUM6qGxsYMdkoxb5e0o3a/5v+kL9+snjEnEm+DihuDki4oH4VAki2n9WFrpnLlYHDtuaMVEic369snRCDtpXGkMljNZnQGloIR9++KVeC/0m5UgoVnTflR7r8xMSZoKiyGVSmShYNcEYUrU+gSUtfH/b7Gn6sH/E6ZG9Gr8l3Swm4R5KAVpQLgVS2/GemhiYGTG2qb8A3LVaigcXNHbNtkUL8fmrWHQGqdYOeGlX4OHD8w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758842251; c=relaxed/relaxed;
	bh=9JwjX2RwaINYBVQON1HAQT8B3J+75lBCjkHNZJp/nFg=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=eg7vcE8H2pR4U1vm74ibBAllxRM9886AfG8x9Q+SgLBPTVQ4QkJazfZRckfK+ITsFI81Q14kosWWnr2KxtS1eS9ZXda1fukHeTCF+SXol109nk2MIVJMHijSQro8x28GaGZMEUxjVdwh45t6nxpU4JRi5wNv3nnbpCNNSUQNKNKDqxj+24MWbI40LvOdqIs6DzkLhDgJkP0LZmNaKIvw+zD0JuDUae5THS3TnVv1YmmHrt4Ae0P6u7VpjI3fU20QLmpUmICzbQtFvUmGF4dENq9/kqSpAA5FBAg3FeCf0Vkl6tpUn+L8N4pH+1uIgp/iLuUvYlEnRztURp6f8dJ59w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=zEu5uNbk; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=zEu5uNbk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cXqPQ1N0tz2xQ2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Sep 2025 09:17:29 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 93B444044F;
	Thu, 25 Sep 2025 23:17:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17829C4CEF0;
	Thu, 25 Sep 2025 23:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1758842247;
	bh=UwBJHVT+vWTJwWZDgObwFp0nU7Jl8uwGl6zSa7Yy8ow=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=zEu5uNbkHJ/tF/idnqJzhDukNEJsCLAt/cqSv6tmmHekUCwoTCaP46y0WDQiNW87L
	 ipPmAS3ipMBid93CHivs8o7CJ8NPaK7SW3j3hOyNv/GBxiPdQBauzCuvQGhxuJj74A
	 Acuptcch5exZ/orzwU4SsPt32okZe7NaXtlVer38=
Date: Thu, 25 Sep 2025 16:17:26 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Andrew Donnellan <ajd@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org, x86@kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, pasha.tatashin@soleen.com,
 sweettea-kernel@dorminy.me, nicholas@linux.ibm.com,
 christophe.leroy@csgroup.eu, alexghiti@rivosinc.com
Subject: Re: [PATCH v17 00/12] Support page table check on PowerPC
Message-Id: <20250925161726.2b34890070e6d8dcf8ad3ba9@linux-foundation.org>
In-Reply-To: <336c0402c59363956d0c4eefc1b8a059e1fcc8e4.camel@linux.ibm.com>
References: <20250909091335.183439-1-ajd@linux.ibm.com>
	<336c0402c59363956d0c4eefc1b8a059e1fcc8e4.camel@linux.ibm.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, 26 Sep 2025 08:42:35 +1000 Andrew Donnellan <ajd@linux.ibm.com> wrote:

> On Tue, 2025-09-09 at 19:13 +1000, Andrew Donnellan wrote:
> > Support page table check on all PowerPC platforms. This works by serialising
> > assignments, reassignments and clears of page table entries at each level in
> > order to ensure that anonymous mappings have at most one writable consumer,
> > and likewise that file-backed mappings are not simultaneously also anonymous
> > mappings.
> > 
> > In order to support this infrastructure, a number of helpers or stubs must be
> > defined or updated for all powerpc platforms. Additionally, we separate
> > set_pte_at() and set_pte_at_unchecked(), to allow for internal, uninstrumented
> > mappings.
> > 
> > On some PowerPC platforms, implementing {pte,pmd,pud}_user_accessible_page()
> > requires the address. We revert previous changes that removed the address
> > parameter from various interfaces, and add it to some other interfaces,
> > in order to allow this.
> > 
> > Note that on 32 bit systems with CONFIG_KFENCE=y, you need [0] to avoid
> > possible failures in init code (this is a code patching/static keys issue,
> > which was discovered by a user testing this series but isn't a bug in page
> > table check).
> > 
> > (This series was initially written by Rohan McLure, who has left IBM and
> > is no longer working on powerpc.)
> 
> Is this likely to make it in in time for 6.18, or should I respin it post merge
> window?

The latter, please.

