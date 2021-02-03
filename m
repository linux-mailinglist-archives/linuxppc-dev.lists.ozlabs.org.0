Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AB14030D996
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 13:12:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DW0tl5qbYzDywc
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 23:12:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DW0996nxCzDwtB
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 22:40:13 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DW0992mCjz9t56; Wed,  3 Feb 2021 22:40:11 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Mackerras <paulus@samba.org>
In-Reply-To: <b0607f1113d1558e73476bb06db0ee16d31a6e5b.1608716197.git.christophe.leroy@csgroup.eu>
References: <e4471bf81089252470efb3eed735d71a5b32adbd.1608716197.git.christophe.leroy@csgroup.eu>
 <b0607f1113d1558e73476bb06db0ee16d31a6e5b.1608716197.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/xmon: Enable breakpoints on 8xx
Message-Id: <161235201042.1516112.18227660998011390380.b4-ty@ellerman.id.au>
Date: Wed,  3 Feb 2021 22:40:09 +1100 (AEDT)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 23 Dec 2020 09:38:48 +0000 (UTC), Christophe Leroy wrote:
> Since commit 4ad8622dc548 ("powerpc/8xx: Implement hw_breakpoint"),
> 8xx has breakpoints so there is no reason to opt breakpoint logic
> out of xmon for the 8xx.

Applied to powerpc/next.

[1/1] powerpc/xmon: Enable breakpoints on 8xx
      https://git.kernel.org/powerpc/c/30662217885d7341161924acf1665924d7d37d64

cheers
