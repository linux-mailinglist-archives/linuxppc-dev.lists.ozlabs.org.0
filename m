Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8195180F4D2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Dec 2023 18:43:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lDcLxHel;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SqQvg0DqBz3c4P
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Dec 2023 04:43:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lDcLxHel;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SqQtp6j7Fz2xdf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Dec 2023 04:42:58 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 412CECE1B01;
	Tue, 12 Dec 2023 17:42:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 912EFC433C7;
	Tue, 12 Dec 2023 17:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702402975;
	bh=+h9Hy/o6qPUoywDyWEUPYa0LHvbEAwTr1e24Paq/tos=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lDcLxHelMIzPI8uabqZaj/J1ptw8Bbp3/fmYDq0ra7rMT0PeFkQ90OOZCAPFaUb6A
	 Pf1xrFjFQDntjBJ4litDwDD96rI7P1hbXkHlQbxzfymZPaWqFcP3fJIKPQdbiwgy5V
	 BZJhfu7qQSK2nEpGdAWBr/1DJIdxCNhkDvpMPJNKnZReAND+JosLQhQEoKLVyhjNHY
	 7QQIjUTZ9p13DxnOVCRkam5wdQ9+3tPoCM9vtVV5SAZCsuMYJISitUvT7/vXsbJMJc
	 Qmgwwdb2RgC0munn2yFEdl9n2A/m1gqB5rjiOmGfk/xWixe+wxrvaEF4X8ZUEXoRmv
	 Bu4BZ7fKxNpRQ==
Date: Tue, 12 Dec 2023 09:42:52 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 3/3] drm/amd/display: Support DRM_AMD_DC_FP on RISC-V
Message-ID: <20231212174252.ycztjhgyhtcrffur@treble>
References: <20231122030621.3759313-1-samuel.holland@sifive.com>
 <20231122030621.3759313-4-samuel.holland@sifive.com>
 <ZV2+f/yu3C6xTVqn@infradead.org>
 <6d4cecd5-9083-4d68-a7e2-266dae9e3952@sifive.com>
 <ZXgH6un2uLdjQ48X@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZXgH6un2uLdjQ48X@infradead.org>
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
Cc: Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>, Nicolas Schier <nicolas@fjasle.eu>, Will Deacon <will@kernel.org>, linux-kbuild@vger.kernel.org, Leo Li <sunpeng.li@amd.com>, Nathan Chancellor <nathan@kernel.org>, linux-arm-kernel@lists.infradead.org, Pan Xinhui <Xinhui.Pan@amd.com>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, linuxppc-dev@lists.ozlabs.org, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 11, 2023 at 11:12:42PM -0800, Christoph Hellwig wrote:
> On Thu, Dec 07, 2023 at 10:49:53PM -0600, Samuel Holland wrote:
> > Actually tracking all possibly-FPU-tainted functions and their call sites is
> > probably possible, but a much larger task.
> 
> I think objtool should be able to do that reasonably easily, it already
> does it for checking section where userspace address access is enabled
> or not, which is very similar.

Yeah, that might be doable.  I can look into it.

-- 
Josh
