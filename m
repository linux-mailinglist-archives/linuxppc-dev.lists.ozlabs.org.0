Return-Path: <linuxppc-dev+bounces-9229-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 00074AD2873
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jun 2025 23:09:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bGPgb3NZqz2xHv;
	Tue, 10 Jun 2025 07:09:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749503371;
	cv=none; b=Qum367zjtpXyPdz6dB1gkkHs9R7ad4EiiwYCql5bpzrT3LA8d11UoXflAKD4av5CAzR2xrUWuiNh0x6h4TSosuRYy+Ra3fks7ti4GUXibwPWIP6ru5kR+6CFYZ4TM+4Rou2BWxLJlK8ti1ZWnjIa98irwIviZJDGknE9OkbIV8vRD9OjOqDqvUkpFEozDrE3k+FnooT11vBlns6y3uD4D2+MoSCO4QYox9pnKIJAUgvTCb9mDANBFG/oDUH6lCY1zd5VfrM1BAyF8r7AGveaApj9B8O7+EVzRuPs0P9Ec135kUk2Vtxijaa4jXOhJjo00HI5TZNlpPZXyYH6WIfL3g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749503371; c=relaxed/relaxed;
	bh=Byi6ZbZeSTJ4d0f4c+Txg+G1R737uVa/AC1DuFNbhjQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EYThc0PLZu9Bti1IqjhIHmjXphFzeEQxqYL3xszuHWKW9ykmUyu9yIIfWBbQYCp+QcCutv3SZMgIkJUwaLrRJcBBTOSixEu86ErCRzpIsXJ7UkYxggnnz9/2echG7FvlzAlz3ZYB12M6ws/FQIUw64zvTt6GFO/ZTR7EcYoPHICLht08qxfdXoVCtPV6Ocd1i8+XSaVJeUfFQzYKIdyM71PItRldoyM1qn1auJjQOW4W0U+/oBFxLFTKWORWor87VWhm7jK/ug6VxUgMW5pmlHEGC2NEdelnKm0PiWHUeQxdZn+MvBmczHFwL9LO6IT1R69ls48XjEsMf7jpWEdt1g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass (client-ip=45.79.88.28; helo=ms.lwn.net; envelope-from=corbet@lwn.net; receiver=lists.ozlabs.org) smtp.mailfrom=lwn.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lwn.net (client-ip=45.79.88.28; helo=ms.lwn.net; envelope-from=corbet@lwn.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 507 seconds by postgrey-1.37 at boromir; Tue, 10 Jun 2025 07:09:25 AEST
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bGPgT2CcRz2xCd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jun 2025 07:09:24 +1000 (AEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A8BDE41AA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1749502854; bh=Byi6ZbZeSTJ4d0f4c+Txg+G1R737uVa/AC1DuFNbhjQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=MBKhHuMk27quWMUCqecP/2rE811WfvZ88RlmLggZ67jpwR0HL4WAIxKp7uRQ7/iwM
	 wyoR83XEcQ6mPbBK0KcOb2Meua26eLYs1XOP+KGTaDEOtrjKhu+mg510aOFJByDZwJ
	 HtAEwskVmRqFe1WLiVLC5Poc4QTa0OHVzTL6hpCk/AIkNHYGWyWd2+P7GhBishdD7T
	 VBCwPji2GhB1AIULsTADjNtpFeaEIm9gnk6f5uhYuDvZa2q1VW2BBlWxxagCb7jc/W
	 bjNjvINyD8AFwiLK1bUBPv1qEbycLxyi/iy1eSvgKTaeLv0scXI+1mqbMwbxfrF2GE
	 GB1caN+/OV3iA==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id A8BDE41AA1;
	Mon,  9 Jun 2025 21:00:54 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Brigham Campbell <me@brighamcampbell.com>, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
 Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Athira Rajeev <atrajeev@linux.ibm.com>,
 "open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)"
 <linuxppc-dev@lists.ozlabs.org>, "open list:DOCUMENTATION"
 <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: Brigham Campbell <me@brighamcampbell.com>, Randy Dunlap
 <rdunlap@infradead.org>
Subject: Re: [PATCH v3] docs: powerpc: Add htm.rst to table of contents
In-Reply-To: <20250528054146.2658537-2-me@brighamcampbell.com>
References: <20250528054146.2658537-2-me@brighamcampbell.com>
Date: Mon, 09 Jun 2025 15:00:53 -0600
Message-ID: <87ldq0aauy.fsf@trenco.lwn.net>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Brigham Campbell <me@brighamcampbell.com> writes:

> Fix the following documentation build error, which was introduced when
> Documentation/arch/powerpc/htm.rst was added to the repository without
> any reference to the document.
>
> Documentation/arch/powerpc/htm.rst: WARNING: document isn't included in any toctree [toc.not_included]
>
> Fixes: ab1456c5aa7a ("powerpc/pseries/htmdump: Add documentation for H_HTM debugfs interface")
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> Tested-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
> ---
> Changes in v3:
>  - Edit commit message to conform better to de facto kernel development style.
>  - No changes to the diff.
>
>  Documentation/arch/powerpc/index.rst | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/arch/powerpc/index.rst b/Documentation/arch/powerpc/index.rst
> index 0560cbae5fa1..53fc9f89f3e4 100644
> --- a/Documentation/arch/powerpc/index.rst
> +++ b/Documentation/arch/powerpc/index.rst
> @@ -19,6 +19,7 @@ powerpc
>      elf_hwcaps
>      elfnote
>      firmware-assisted-dump
> +    htm
>      hvcs

Applied, thanks.

jon

