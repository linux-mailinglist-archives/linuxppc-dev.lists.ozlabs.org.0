Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A6A22C82A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 16:37:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCsHJ078zzF14y
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jul 2020 00:37:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCqgP72rhzDqMl
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 23:24:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BCqgL0JnKz9sTT; Fri, 24 Jul 2020 23:24:44 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: nayna@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, pfsmorigo@gmail.com,
 herbert@gondor.apana.org.au, "Alexander A. Klimov" <grandmaster@al2klimov.de>,
 corbet@lwn.net, davem@davemloft.net, linux-doc@vger.kernel.org,
 paulus@samba.org, benh@kernel.crashing.org, linux-crypto@vger.kernel.org,
 leitao@debian.org, linux-kernel@vger.kernel.org, mpe@ellerman.id.au
In-Reply-To: <20200718103958.5455-1-grandmaster@al2klimov.de>
References: <20200718103958.5455-1-grandmaster@al2klimov.de>
Subject: Re: [PATCH] powerpc: Replace HTTP links with HTTPS ones
Message-Id: <159559696781.1657499.3467682028636656801.b4-ty@ellerman.id.au>
Date: Fri, 24 Jul 2020 23:24:44 +1000 (AEST)
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 18 Jul 2020 12:39:58 +0200, Alexander A. Klimov wrote:
> Rationale:
> Reduces attack surface on kernel devs opening the links for MITM
> as HTTPS traffic is much harder to manipulate.
> 
> Deterministic algorithm:
> For each file:
>   If not .svg:
>     For each line:
>       If doesn't contain `\bxmlns\b`:
>         For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
> 	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
>             If both the HTTP and HTTPS versions
>             return 200 OK and serve the same content:
>               Replace HTTP with HTTPS.

Applied to powerpc/next.

[1/1] powerpc: Replace HTTP links with HTTPS ones
      https://git.kernel.org/powerpc/c/c8ed9fc9d29e24dafd08971e6a0c6b302a8ade2d

cheers
