Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D933D7D94D9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Oct 2023 12:11:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=i8BMO8t6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SGz2x5YZ9z3d8t
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Oct 2023 21:11:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=i8BMO8t6;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SGyzN740dz3bx0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Oct 2023 21:08:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1698401296;
	bh=30OBHWUfyQHjnBWbrlGeUaI2WXMNAW9Re3MJ+2tSPpc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=i8BMO8t6Y4KHqTx8aUV5Zw4npGWR8icDA0Xv/4pqRaVRUM03VA16MiLOb78fabd3C
	 AiKl8545U4Tepu0sA+VFzcWMD+xuN9/a7cZUWexLo2Izbu9sGvj53Ad5n8deRgubs2
	 vKE2jyhylRvMPvluSCFHjt/H8z7dNm/MN6U5lA86pmpiWo7ZjYBL6ld9xZwkIgzHzl
	 elosUl/zMPN5EfPwD9QLl29qPlMLGuBLfR8+PUSkntuXDhS6xwytpFctYPPNQZoHis
	 A+pnoAvAoo5JPFPQiy6HGIYbQGs3MnF0EGFYMI9x4GhbLqcwdg3rzvnuyEu3ODysto
	 4XJeiC5kSdKTg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SGyzN2hTPz4xVb;
	Fri, 27 Oct 2023 21:08:16 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <e88b154eaf2efd9ff177d472d3411dcdec8ff4f5.1696675567.git.christophe.leroy@csgroup.eu>
References: <e88b154eaf2efd9ff177d472d3411dcdec8ff4f5.1696675567.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/code-patching: Perform hwsync in __patch_instruction() in case of failure
Message-Id: <169840079684.2701453.17093858702248932899.b4-ty@ellerman.id.au>
Date: Fri, 27 Oct 2023 20:59:56 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: "Christopher M . Riedl" <cmr@bluescreens.de>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 07 Oct 2023 12:46:19 +0200, Christophe Leroy wrote:
> Commit c28c15b6d28a ("powerpc/code-patching: Use temporary mm for
> Radix MMU") added a hwsync for when __patch_instruction() fails,
> we results in a quite odd unbalanced logic.
> 
> Instead of calling mb() when __patch_instruction() returns an error,
> call mb() in the __patch_instruction()'s error path directly.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/code-patching: Perform hwsync in __patch_instruction() in case of failure
      https://git.kernel.org/powerpc/c/74726fda9fe306f848088ef73ec266cae0470d5b

cheers
