Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 288F0925E86
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 13:37:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=f7+L3cQA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WDd6q02bLz3dV4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 21:37:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=f7+L3cQA;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WDd680WhGz3cZs
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jul 2024 21:36:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1720006607;
	bh=R77gWoyRaHjitzxdt9vqwRqguNOuLOOkElH+/b0NzN4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=f7+L3cQAqB64y7v0d9teKpFDl3Lqj5p13+WmEOHetk0kaogcB+CO10T6RnDDzoAGa
	 gteTUArhjd+tZSLSkZ12HblqsPIacZ86GX3eBvVRK39Sd6hSMmBojFyGID68qyD7Rl
	 ibs74wFnVbDxEOHAjYGRnD6gj5uUK1ziIIT6EvjlcYeNd7yWSxe7ALpYLUXbcV9bp3
	 59aqOIqN87dzi1KVnGlACpYAijp6yy+uQ+nBVJlsT+G9g1IrdOBPxf2lfhAI20zdTl
	 YPizHsGFfVpjx+qw3Q/93Ghb4Dx939v87hOWW13H8xo6Vd7m+8gIebykA2M7Bljfte
	 8V0Twp32F5CiA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WDd675Lhqz4xM5;
	Wed,  3 Jul 2024 21:36:47 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 19/20] powerpc/xive: convert to
 of_property_for_each_u32_new()
In-Reply-To: <20240703-of_property_for_each_u32-v1-19-42c1fc0b82aa@bootlin.com>
References: <20240703-of_property_for_each_u32-v1-0-42c1fc0b82aa@bootlin.com>
 <20240703-of_property_for_each_u32-v1-19-42c1fc0b82aa@bootlin.com>
Date: Wed, 03 Jul 2024 21:36:47 +1000
Message-ID: <87ikxmk8q8.fsf@mail.lhotse>
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
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Luca Ceresoli <luca.ceresoli@bootlin.com> writes:
> Simplify code using of_property_for_each_u32_new() as the two additional
> parameters in of_property_for_each_u32() are not used here.
>
> In this case only the 'prop' variable can be removed and not 'reg',
> because 'reg' is used in _previous_ lines of the same function. There
> is no side effect because the of_property_for_each_u32() macro being
> removed would anyway write 'reg' bwfore reading its value, and 'reg'
> is not used in _following_ lines.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  arch/powerpc/sysdev/xive/spapr.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers
