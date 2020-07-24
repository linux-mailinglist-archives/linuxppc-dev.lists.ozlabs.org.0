Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EB05522C80B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 16:33:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCsBC2hKPzDqLg
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jul 2020 00:33:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCqgL1TB8zDr9w
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 23:24:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BCqgJ1wMzz9sTR; Fri, 24 Jul 2020 23:24:43 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: colin@colino.net, "Alexander A. Klimov" <grandmaster@al2klimov.de>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 benh@kernel.crashing.org
In-Reply-To: <20200717182940.75484-1-grandmaster@al2klimov.de>
References: <20200717182940.75484-1-grandmaster@al2klimov.de>
Subject: Re: [PATCH] macintosh/therm_adt746x: Replace HTTP links with HTTPS
 ones
Message-Id: <159559696822.1657499.18409103323748931249.b4-ty@ellerman.id.au>
Date: Fri, 24 Jul 2020 23:24:43 +1000 (AEST)
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

On Fri, 17 Jul 2020 20:29:40 +0200, Alexander A. Klimov wrote:
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

[1/1] macintosh/therm_adt746x: Replace HTTP links with HTTPS ones
      https://git.kernel.org/powerpc/c/1666e5ea2f838f4266e50e4f3d973c0824256429

cheers
