Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1064C7A5744
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Sep 2023 04:13:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Qgq3yOvs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RqQFZ67jJz3cgS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Sep 2023 12:13:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Qgq3yOvs;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RqQDg1GhFz2ygr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Sep 2023 12:13:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1695089583;
	bh=yK4i0fyc5ITTA94RNhwm6rcVMib+w9bmcMtOgracjcM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Qgq3yOvs6gGgFR80VJ38hn9Cwo84MntwgzdO4oF59tS94tUSQ+ttUeM62Md9g0evl
	 QwxqqXHzTm0ZtXxHKOmH012krt4g6qLXwQqCcACUN9RAEK5rUwACqiaf7RoMw1FOyl
	 ZTwD3Xgl+uCB5EB82Miw5QQLBETwXpqUklZDJebz8yRAPQJnNJnUKjdUYGFd6CrHGL
	 aPdh7qQ2Zmpjb0XdtHZNfc/vJrR9SZ/u/U8/lKWQKBanezPW8J2OSuHQbaxR7IPbBr
	 a0T9M2Y6rySu6F95/tCoaF9JDGhU28j1/sxXlCznmtM34o3lt3q8+k2toEAfmN+E5g
	 L4oylx7S2wosg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RqQDZ3JWCz4xDB;
	Tue, 19 Sep 2023 12:13:01 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer
 <gerg@linux-m68k.org>, Nicholas Piggin <npiggin@gmail.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Thomas Gleixner <tglx@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 2/2] powerpc: Replace GPL 2.0+ README.legal
 boilerplate with SPDX
In-Reply-To: <d91725ff1ed5d4b6ba42474e2ebfeebe711cba23.1695031668.git.geert@linux-m68k.org>
References: <cover.1695031668.git.geert@linux-m68k.org>
 <d91725ff1ed5d4b6ba42474e2ebfeebe711cba23.1695031668.git.geert@linux-m68k.org>
Date: Tue, 19 Sep 2023 12:12:57 +1000
Message-ID: <87h6nqlxli.fsf@mail.lhotse>
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
Cc: linux-spdx@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:
> Upstream Linux never had a "README.legal" file, but it was present
> in early source releases of Linux/m68k.  It contained a simple copyright
> notice and a link to a version of the "COPYING" file that predated the
> addition of the "only valid GPL version is v2" clause.
>
> Get rid of the references to non-existent files by replacing the
> boilerplate with SPDX license identifiers.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

LGTM.

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers
