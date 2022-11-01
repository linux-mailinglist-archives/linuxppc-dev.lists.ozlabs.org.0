Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6149F614A9A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Nov 2022 13:26:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N1q5N2X3Zz3cLp
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Nov 2022 23:26:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N1q4n68xxz2xGD
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Nov 2022 23:26:17 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4N1q4l4Y85z4xGj;
	Tue,  1 Nov 2022 23:26:15 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20221027125626.1383092-1-mpe@ellerman.id.au>
References: <20221027125626.1383092-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/64e: Fix amdgpu build on Book3E w/o AltiVec
Message-Id: <166730554755.2453885.11900967168115603516.b4-ty@ellerman.id.au>
Date: Tue, 01 Nov 2022 23:25:47 +1100
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 27 Oct 2022 23:56:26 +1100, Michael Ellerman wrote:
> There's a build failure for Book3E without AltiVec:
>   Error: cc1: error: AltiVec not supported in this target
>   make[6]: *** [/linux/scripts/Makefile.build:250:
>   drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.o] Error 1
> 
> This happens because the amdgpu build is only gated by
> PPC_LONG_DOUBLE_128, but that symbol can be enabled even though AltiVec
> is disabled.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/64e: Fix amdgpu build on Book3E w/o AltiVec
      https://git.kernel.org/powerpc/c/2153fc9623e5465f503d793d4c94ad65e9ec9b5f

cheers
