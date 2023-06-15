Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA83E730DBA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 05:52:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=HUlBhzLn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QhSzj5pKSz3bjV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 13:52:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=HUlBhzLn;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QhSys0K8Bz2ygG
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jun 2023 13:51:49 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QhSyr4qs2z4wg8;
	Thu, 15 Jun 2023 13:51:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1686801108;
	bh=qGB4VmQpo0NG0SfVSZwSKZzT6dQGTcK0z6GE9CVlpHA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=HUlBhzLnwGOuqz/Gh6n755jLbrwG/vJLsKNom07Ay3VJKFafsiXQmdJP4QkcVegHr
	 TPv9WrgY+KwvsvgUvtxwnhgO/VZi7zvhdy58EOjeaGYvpTNcMTYYgV0MmUAN7AANof
	 1hctcrLuo+FGcbqOhit+YywrNyXaTmrcXdbJlvNSgq39wX6+NpQe7vCIde0/9bqX/G
	 /UydAteXIqvdHKE6b06jzhM3tCknRcuFOhJZTfaOnWIO9DmW/rm5l8ZAvrVxBMOlYD
	 1YDO13QIF2j40mcPE3N+W2GlB8OxiovoCsRFsOztf1kT5H3Jxw6enTW1xKaoF7XNab
	 70yM750BR17SQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: wuyonggang001@208suo.com, shuah@kernel.org
Subject: Re: [PATCH] selftests/powerpc: Remove unneeded variable
In-Reply-To: <553bb6053c7b7bee60eda3ca90470ac3@208suo.com>
References: <20230614070926.36395-1-zhanglibing@cdjrlc.com>
 <553bb6053c7b7bee60eda3ca90470ac3@208suo.com>
Date: Thu, 15 Jun 2023 13:51:48 +1000
Message-ID: <87a5x1fkmj.fsf@mail.lhotse>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

wuyonggang001@208suo.com writes:
> Fix the following coccicheck warning:
>
> tools/testing/selftests/powerpc/alignment/alignment_handler.c:558:5-7: 
> Unneeded variable: "rc". Return "0"

The check is wrong.

> diff --git 
> a/tools/testing/selftests/powerpc/alignment/alignment_handler.c 
> b/tools/testing/selftests/powerpc/alignment/alignment_handler.c
> index 33ee34fc0828..4980656c3f70 100644
> --- a/tools/testing/selftests/powerpc/alignment/alignment_handler.c
> +++ b/tools/testing/selftests/powerpc/alignment/alignment_handler.c
> @@ -332,7 +332,7 @@ int test_alignment_handler_vsx_206(void)
>       STORE_VSX_XFORM_TEST(stxvd2x);
>       STORE_VSX_XFORM_TEST(stxvw4x);
>       STORE_VSX_XFORM_TEST(stxsdx);
> -    return rc;
> +    return 0;

rc is used in the macros.

cheers
