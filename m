Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2244586C0C7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 07:38:40 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Arly37qj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TlhPn5NcLz3vYK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 17:38:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Arly37qj;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TlhP22Jn0z3bq0
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Feb 2024 17:37:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1709188677;
	bh=8jp6tWwTFbOuHhqd3QihKvXNUZOM/iJjGERmYJI7sHk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Arly37qjNDRDE7QhxbFdyAL000Qjzjoq28bx+VH7Z6wIOdjVZ71anNzdtIiVkQKg5
	 ZX2fM0qrQc9sDT3jR85bk4fSubV6lggkWPDNA9ZyRDuHHWaQ5k/WICwdTrUMB8XyCz
	 ZNfzQF5lcttHCAlQs8lGTz23/CMHOAjYwYDAz3it386OpTELvrVukqRdhI6UUasuJE
	 LuzRpZIBkwVYdBEMq0AQsiN6Nx0bawnrtCk1Y6MqbUZesV0tEh79E1CutcW1JRIJxQ
	 eoVf+cEN/G+T51n1XPZ99AvBUf6peStnrS88s51bmvv7gGZU2jp/+FvQ4D4vaOlEmC
	 97niIGWdGcvcQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TlhP12CMDz4wcH;
	Thu, 29 Feb 2024 17:37:57 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: manual merge of the powerpc tree with the mm-stable
 tree
In-Reply-To: <20240229101721.58569685@canb.auug.org.au>
References: <20240229101721.58569685@canb.auug.org.au>
Date: Thu, 29 Feb 2024 17:37:57 +1100
Message-ID: <87ttlrg4hm.fsf@mail.lhotse>
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> Hi all,
>
> Today's linux-next merge of the powerpc tree got a conflict in:
>
>   arch/powerpc/mm/pgtable_32.c
>
> between commit:
>
>   a5e8131a0329 ("arm64, powerpc, riscv, s390, x86: ptdump: refactor CONFIG_DEBUG_WX")
>
> from the mm-stable tree and commit:
>
>   8f17bd2f4196 ("powerpc: Handle error in mark_rodata_ro() and mark_initmem_nx()")
>
> from the powerpc tree.

Thanks. That's a fairly ugly conflict.

Maybe I'll drop that patch until the generic change has gone in.

cheers
