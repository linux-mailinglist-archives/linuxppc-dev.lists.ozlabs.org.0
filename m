Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2585A7E7D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 15:17:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MHl870dZFz3fF6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 23:17:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MHl6F2L4Dz2xJ5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Aug 2022 23:15:33 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MHl6F1V9Yz4xGH;
	Wed, 31 Aug 2022 23:15:33 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <cba76f5a5b01fcc49415e632d92c11c1c5998cab.1660843877.git.christophe.leroy@csgroup.eu>
References: <cba76f5a5b01fcc49415e632d92c11c1c5998cab.1660843877.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/vdso: Don't map VDSO at a fixed address on PPC32
Message-Id: <166195162996.45984.6268667436058610815.b4-ty@ellerman.id.au>
Date: Wed, 31 Aug 2022 23:13:49 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 18 Aug 2022 19:31:25 +0200, Christophe Leroy wrote:
> PPC64 removed default mapping address from VDSO in
> commit 30d0b3682887 ("powerpc: Move 64bit VDSO to improve context
> switch performance").
> 
> Do like PPC64 and let get_unmapped_area() place the VDSO mapping
> at the address it wants, don't force a default address.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/vdso: Don't map VDSO at a fixed address on PPC32
      https://git.kernel.org/powerpc/c/8a8f7866663588b162031a5348c24e42161461cd

cheers
