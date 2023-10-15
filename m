Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA807C989D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Oct 2023 12:07:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Ns+w7fG5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S7bWr6dMnz3vmw
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Oct 2023 21:07:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Ns+w7fG5;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S7bRF6h7tz30P0
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Oct 2023 21:03:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1697364201;
	bh=l94L/dj1qwPbsPKPKlMHqF6kAwQpYKoOptiW1hDixbE=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=Ns+w7fG5wPFIPBrWZcl99BEa8YVqg0MggquY0VC4rgt38pbPl9/fkLxey4DPhN0kU
	 mBYWGgdJwSQvdLZ2z8oksRitGWd9f+9Iz4wqEOkdrYCPvOMwak64aO0rlRnJz14rQT
	 hg0mh896K9S92iIkYvUl+UCwXN0FivDpUxEmjmrW1zSz8kMRAQK8GPO37omjuPiyH+
	 as/SYlXmKkPyL5e5ei+8DjBAWbFgVQ/S9SQVKfNQyiUaZciAmpL1+/VAhSv7JxolIv
	 7pTmUvxZPIb8Ww2kAJrWcInmt3FLY6NdA/0WKP8OkDCTiANPlH845SFFWdzu+MRJ3X
	 UuZF/bMxXvXAw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4S7bRF5VQgz4wp0;
	Sun, 15 Oct 2023 21:03:21 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20230824122849.942072-1-mpe@ellerman.id.au>
References: <20230824122849.942072-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/mm: Allow ARCH_FORCE_MAX_ORDER up to 12
Message-Id: <169736402375.957740.893150934201855636.b4-ty@ellerman.id.au>
Date: Sun, 15 Oct 2023 21:00:23 +1100
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

On Thu, 24 Aug 2023 22:28:49 +1000, Michael Ellerman wrote:
> Christophe reported that the change to ARCH_FORCE_MAX_ORDER to limit the
> range to 10 had broken his ability to configure hugepages:
> 
>   # echo 1 > /sys/kernel/mm/hugepages/hugepages-8192kB/nr_hugepages
>   sh: write error: Invalid argument
> 
> Several of the powerpc defconfigs previously set the
> ARCH_FORCE_MAX_ORDER value to 12, via the definition in
> arch/powerpc/configs/fsl-emb-nonhw.config, used by:
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/mm: Allow ARCH_FORCE_MAX_ORDER up to 12
      https://git.kernel.org/powerpc/c/ff9e8f41513669e290f6e1904e1bc75950584491

cheers
