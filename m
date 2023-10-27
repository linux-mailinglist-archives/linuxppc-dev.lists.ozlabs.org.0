Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A15477D9507
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Oct 2023 12:17:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=VJiq8279;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SGzBT3wvvz3dJm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Oct 2023 21:17:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=VJiq8279;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SGyzT4FDvz3cQH
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Oct 2023 21:08:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1698401301;
	bh=FC7+h/MMImsoh32pZqwqSJlj4+oAhJfsLfQ4WI0iOMA=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=VJiq827950XnrpbuGLaDaTEcbGj9x9VsNZvxqUuWYMcv0O+6Mg9aPi8QDuPb7AooI
	 nP+h7Z/Anx7eofbABQNMaUDVsdHF9Lf4wGo3Jz68yUrrEva2h1vEVFPoke+qwM4Thy
	 MoYDlDOTRSI144GT4XR2aqWvoUpIkMjdvzslUgDiYs8EaZMDzsr4Pk5Dq7FryrpRvB
	 2B/CdMcwXWD1xLR8X9rOwZ3lzCjmPhFCeWhnHcdrYOQe/etsO6FD0LhgAT3vGA7cEf
	 j+XcTslxOLEhth//rfzYNca7b9fV3qwCceFzl9qgIKnU+sNovhNvpH1cTMJhN8coxI
	 Pq+J0Jqw+q+5w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SGyzT3523z4xWq;
	Fri, 27 Oct 2023 21:08:21 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20231023092319.1507325-1-mpe@ellerman.id.au>
References: <20231023092319.1507325-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/32s: Implement local_flush_tlb_page_psize()
Message-Id: <169840079686.2701453.11411354355592178144.b4-ty@ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 23 Oct 2023 20:23:19 +1100, Michael Ellerman wrote:
> There's a single call to local_flush_tlb_page_psize() in the code
> patching code. That call is never executed on 32-bit Book3S,
> because it's guarded by mm_patch_enabled() which is essentially a
> radix_enabled() check, which is always false on 32s.
> 
> However depending on how the optimiser sees things it may still trip
> over the BUILD_BUG() in the 32s stub of local_flush_tlb_page_psize().
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/32s: Implement local_flush_tlb_page_psize()
      https://git.kernel.org/powerpc/c/aad26d3b6af13c055b1d05dd253d2484551bde55

cheers
