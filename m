Return-Path: <linuxppc-dev+bounces-2964-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E46009C0043
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2024 09:45:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkbHM6znXz3bjs;
	Thu,  7 Nov 2024 19:45:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730969103;
	cv=none; b=BiBqo1v+D7qLJOjKaUPMenB2JEq5pa1ayq125KW8WM2ZYE3rSebYUUVN4IQfHU2TijU68h2kBy3Ld14RPZIxTlZGddNlRZzqv+bWwzRCcZbxcdZJpLOsF1QONxlhSMcEF5TB2YKQDn2bgQ+E1l/Yhb1ZiBATEHElvi16GIS0r5Bw2wUlX+Z5qYEQ8kwMOHgafWhAlQrqZXe0Twf+tAMPaM1YMjvIHKJfVELKorbIG/ChmUQLXyNZsEjGgx6BxPn3en5VUOcARJQjmcWcqcwFjDkqBRhI0K2R99J+W1SG+bFhqSzVUbT//OA/Wg1esASnJjb26+hM9A+3LgYJZid+6w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730969103; c=relaxed/relaxed;
	bh=ueCptTh3dBLcX8F/o4XfV7ZiTYKauBNPyYqtGSJyBAY=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=h71duaI7dZBJ6aIm/FX9vbpjIuQYaOGGweNh4orfBZhk7A1HgCwLKIn43xTutH30TPI+mMr+QsSDfgX+d3WKVaOGoyeLp4PBiUMTCLnM7PA2uqWR1lqLwxhf8I51yZO5+c/lbk1jd41y9bo486a5lNbcto7ZITy7yOgU4VTTzBjGFlInnibFDXoqK7igUHyG8VoQLUL6nc7h72hPEftOhZx67Nu4ddTLvKWv1QmUzd5+f5L+ExPPmN17v87efREj7HoE52krH10/7K937PUejY1F2oGN3SE2unDeCwftQokYZII2f0quzh9/eUa5H6rXiEUWfgKOZmOt+PiScumYnQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=O3iIyIse; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=O3iIyIse;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkbHK42dlz3bjb
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 19:45:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1730969099;
	bh=ueCptTh3dBLcX8F/o4XfV7ZiTYKauBNPyYqtGSJyBAY=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=O3iIyIseJXn4VnZW1VyaHkyChUGR9Imj5exJ31gjm1VJZJFegCF1KS7b8C1/Mm6wH
	 RhKDlQ12U8Lp3M1l1Nzdrh4SCf+qNTBQDZ3vAI1HMn9Gg41ZhcR2pdaTCQlmprAuks
	 FEVvtmU2xRmDR5c0aKcyF9jsn+1SIykadO/TUDSYMxXvcV8SlWdklpFvHEjfAfrwo/
	 FLsAC2abhdHTrYdV9LvEfyffkLZfNvHwMIJk33dyRoZfxONYOuWuQ6h761Dx7XOEv0
	 sXopdWRcVOjlqiaCTD2SUme2Ab2vdDjWIlm68evPwBsMcvWKMe0+uaA+dw3j64GZnK
	 WHepf26UjtwLw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XkbHH0RDhz4x21;
	Thu,  7 Nov 2024 19:44:59 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20241009051826.132805-1-mpe@ellerman.id.au>
References: <20241009051826.132805-1-mpe@ellerman.id.au>
Subject: Re: [PATCH 1/2] powerpc/machdep: Drop include of seq_file.h
Message-Id: <173096894647.18315.7490654927516414876.b4-ty@ellerman.id.au>
Date: Thu, 07 Nov 2024 19:42:26 +1100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, 09 Oct 2024 16:18:25 +1100, Michael Ellerman wrote:
> Drop the include of seq_file.h in machdep.h, replace it with a forward
> declaration of struct seq_file, which is all that's required.
> 
> Add direct includes of seq_file.h to some files that were getting
> seq_file.h via machdep.h.
> 
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc/machdep: Drop include of seq_file.h
      https://git.kernel.org/powerpc/c/3c9670df7f7e871f0d2c2208d2ce79f6cfbca0f6
[2/2] powerpc/machdep: Drop include of dma-mapping.h
      https://git.kernel.org/powerpc/c/b23b9edf64b6387334aa2f8687cca6792b0d9d6c

cheers

