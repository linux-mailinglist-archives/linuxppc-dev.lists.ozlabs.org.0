Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BC767A989
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jan 2023 05:13:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P1r6g0XgSz3cKr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jan 2023 15:13:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=D/u0rmtQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P1r5n2hg8z2xjw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jan 2023 15:12:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=D/u0rmtQ;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4P1r5j0GJRz4xyY;
	Wed, 25 Jan 2023 15:12:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1674619946;
	bh=leUmDE+CZ32bv0Iqn7DI7Je7HT39oOea5EznvVolH2A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=D/u0rmtQPBZO4VOc1rVoVtHOn4lBMOTL7Bc/hB9ejP5Zvln/aVBEQKvxRiPsxfeAR
	 8CZKcCDA4U1VqKP02X1wgsodQXh1gWRK4+FtKZmmUijJuwGMvCFHKeg+k9j8ho4wQ/
	 AOWD0AizqG/goj4UgMFID/48DHvs+iD7x3gIddS6KxXrX00koFM2yxItHaukxIG11C
	 efuu1M6CVsvEE86PcKXdkps2ccpkGZ5+zmTjDaDriXmXby07g0JrE5GIOS6r9Etrve
	 JjP8gE9UvzCB5zUMQI778oAIRz6DLG6gxCSuqAQVThv2Irmq07KWd14+ZuWcTFATIl
	 z6pT44cH9Sjgg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Chancellor <nathan@kernel.org>, masahiroy@kernel.org
Subject: Re: [PATCH v2 06/14] powerpc/vdso: Remove unused '-s' flag from
 ASFLAGS
In-Reply-To: <20221228-drop-qunused-arguments-v2-6-9adbddd20d86@kernel.org>
References: <20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org>
 <20221228-drop-qunused-arguments-v2-6-9adbddd20d86@kernel.org>
Date: Wed, 25 Jan 2023 15:12:24 +1100
Message-ID: <87y1prp80n.fsf@mpe.ellerman.id.au>
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
Cc: nicolas@fjasle.eu, linux-kbuild@vger.kernel.org, trix@redhat.com, llvm@lists.linux.dev, ndesaulniers@google.com, npiggin@gmail.com, Nathan Chancellor <nathan@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Chancellor <nathan@kernel.org> writes:
> When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, it
> warns:
>
>   clang-16: error: argument unused during compilation: '-s' [-Werror,-Wunused-command-line-argument]
>
> The compiler's '-s' flag is a linking option (it is passed along to the
> linker directly), which means it does nothing when the linker is not
> invoked by the compiler. The kernel builds all .o files with '-c', which
> stops the compilation pipeline before linking, so '-s' can be safely
> dropped from ASFLAGS.
>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> Reviewed-by: Segher Boessenkool <segher@kernel.crashing.org>
> ---
> Cc: mpe@ellerman.id.au

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers
