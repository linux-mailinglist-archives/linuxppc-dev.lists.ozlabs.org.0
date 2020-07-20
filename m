Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 13367225750
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 08:07:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B9B8g5z67zDqdw
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 16:07:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B9B6q4xdwzDqTJ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jul 2020 16:05:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=aETQsTd0; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4B9B6q0qKSz9sR4;
 Mon, 20 Jul 2020 16:05:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1595225155;
 bh=zU+qiLwLcNmQZhQfJxLAEcRnO/3oGFVMAZjQzLcLmVM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=aETQsTd0lEC+9xIjhMmhABXHlbVCtRKo7N35xbJcnQzs3865+D9sKvArX/rJYUoRl
 0PX4G0zKTnXc7ujIltCqzD2GtaC29U4eG5JPVnqGW2WXTk2xQu3FySINdZB67EX72m
 JYOOxjlZBWr3t75vGCG4p4dSFCN4wWYCMGn5mc3TbcC41AKFHLDci7wT5s5TkhV9kB
 R3HE46TAQnFBhAl06fB2ZNeuQde2teIlu4YZvPX7ozK9KbERqnORLZ2RAe/zaxrbiy
 m3pCUhmFTrfvr3NtM0DyKeOJJPTwKfR1PbL9FnuEvSOI7LwGEy/RVzu31Vm5wcGGaF
 rgz2Bd0mNFe9A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v6 03/23] powerpc/book3s64/pkeys: pkeys are supported only
 on hash on book3s.
In-Reply-To: <20200709032946.881753-4-aneesh.kumar@linux.ibm.com>
References: <20200709032946.881753-1-aneesh.kumar@linux.ibm.com>
 <20200709032946.881753-4-aneesh.kumar@linux.ibm.com>
Date: Mon, 20 Jul 2020 16:05:50 +1000
Message-ID: <87h7u2u3ep.fsf@mpe.ellerman.id.au>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxram@us.ibm.com,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
> Move them to hash specific file and add BUG() for radix path.
> ---
>  .../powerpc/include/asm/book3s/64/hash-pkey.h | 32 ++++++++++++++++
>  arch/powerpc/include/asm/book3s/64/pkeys.h    | 25 +++++++++++++
>  arch/powerpc/include/asm/pkeys.h              | 37 ++++---------------
>  3 files changed, 64 insertions(+), 30 deletions(-)
>  create mode 100644 arch/powerpc/include/asm/book3s/64/hash-pkey.h
>  create mode 100644 arch/powerpc/include/asm/book3s/64/pkeys.h

This isn't signed-off.

I assume you meant to, so I added it.

cheers

> diff --git a/arch/powerpc/include/asm/book3s/64/hash-pkey.h b/arch/powerpc/include/asm/book3s/64/hash-pkey.h
> new file mode 100644
> index 000000000000..795010897e5d
