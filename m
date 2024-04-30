Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AAD78B69BA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2024 07:09:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=H7hTHO+n;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VT7Y76KJmz3cWN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2024 15:09:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=H7hTHO+n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=aneesh.kumar@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VT7XP65CZz3bZN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2024 15:09:09 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 50EAE61418;
	Tue, 30 Apr 2024 05:09:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 305F9C2BBFC;
	Tue, 30 Apr 2024 05:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714453746;
	bh=J+SzwUyls9SaMVVFBi7PpXJ+4++slrdMAi6eCnVxZ30=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=H7hTHO+nqAqz262HEwuQx9nek6KdJSHo/iMy65xKf1Q/M66hF7o7LY6ULlgljSObN
	 CHSLsbGq9JWM+ol0UtxI1xVOmRD9zbWW4Pc2vDqDIprQlDu/EQU2dXR/BdZ93IZfeJ
	 p7CZJEsT6PEL4VEat+QY1sPCRGhDnwumcFUTdu6CHF7l4D9YaWdrEBUfgyr7U/QaHu
	 2v+14XmeD5GmZcUlVYSsRuauJmiBeSj5Gx2Xf1WA2xTF5HicXEKZkicogmBTj0lu3m
	 agFpz/00UNSGr7TFj0Z/Bno9QCr174whBE07ZYyf/7bGjn+wgEFErdOuEdcm/6KVmN
	 9YRGlkiCtKE8Q==
X-Mailer: emacs 29.3 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: MMU GATHER: Update Aneesh's address
In-Reply-To: <20240430044327.49363-1-mpe@ellerman.id.au>
References: <20240430044327.49363-1-mpe@ellerman.id.au>
Date: Tue, 30 Apr 2024 10:38:58 +0530
Message-ID: <yq5av83z4etx.fsf@kernel.org>
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
Cc: will@kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:

> Aneesh's IBM address no longer works, switch to his preferred kernel.org
> address.
>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
 
Acked-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
 
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 93af33ee8541..f096c9fff5b3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14898,7 +14898,7 @@ F:	drivers/phy/marvell/phy-pxa-usb.c
>  
>  MMU GATHER AND TLB INVALIDATION
>  M:	Will Deacon <will@kernel.org>
> -M:	"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
> +M:	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
>  M:	Andrew Morton <akpm@linux-foundation.org>
>  M:	Nick Piggin <npiggin@gmail.com>
>  M:	Peter Zijlstra <peterz@infradead.org>
> -- 
> 2.44.0
