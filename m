Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A9159B80F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Aug 2022 05:41:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M9ynN74kMz3cFN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Aug 2022 13:40:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Je1l+Xpf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M9ymq3MjFz3bkH
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Aug 2022 13:40:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Je1l+Xpf;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4M9ymm08WXz4wgn;
	Mon, 22 Aug 2022 13:40:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1661139625;
	bh=VKTUo2W4RNc2LDslDMcLOnHhdlFBjvbL0BUKEgnwbho=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Je1l+Xpf0IQX7/cqLqeVKhTFzln629PFhZPHnimgYEZfZglpmJOAXo6zZ3qqLhZaf
	 pTCMCKJNyh1BWnCZeF0hO5SpcKNefkyzqjvwSQSbB0Q9p4wyY4mxq13vFYf00xpcbr
	 xzuVuyPEnHozay6S9HX2w6LkAycpVJvPeR7oLAITkfkdIucCbL9dApvTjnXqw0Xk73
	 7cI6LYa6l3ecozrENJFNG4Kt7ornODrTsmYmlmdbec7ns7F8/FpSHkUiBLALBeb+7m
	 8ZXm3JZUDtz306E+p2oj6x37piBTa3oKoIdFKPIktfSUup6WZ2toUR+qoAlwz7y2Qs
	 AO9ZaxnMzKH8g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc: export cpu_smallcore_map for modules
In-Reply-To: <20220819210112.7924-1-rdunlap@infradead.org>
References: <20220819210112.7924-1-rdunlap@infradead.org>
Date: Mon, 22 Aug 2022 13:40:23 +1000
Message-ID: <87o7wdkkt4.fsf@mpe.ellerman.id.au>
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
Cc: "Gautham R . Shenoy" <ego@linux.vnet.ibm.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>, Felix Kuehling <Felix.Kuehling@amd.com>, Randy Dunlap <rdunlap@infradead.org>, Nicholas Piggin <npiggin@gmail.com>, amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, linuxppc-dev@lists.ozlabs.org, Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Randy Dunlap <rdunlap@infradead.org> writes:
> Fix build error when CONFIG_DRM_AMDGPU=m:
>
> ERROR: modpost: "cpu_smallcore_map" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
>
> by exporting 'cpu_smallcore_map' just as other per_cpu
> symbols are exported.
>
> drivers/gpu/drm/amd/amdkfd/kfd_device.c calls cpu_smt_mask().
> This is an inline function on powerpc which references
> cpu_smallcore_map.
>
> Fixes: 425752c63b6f ("powerpc: Detect the presence of big-cores via "ibm, thread-groups"")
> Fixes: 7bc913085765 ("drm/amdkfd: Try to schedule bottom half on same core")

That 2nd commit is not in mainline, only linux-next.

I don't mind merging this fix preemptively, but is that SHA stable?

cheers
