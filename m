Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 751602DAB90
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Dec 2020 12:01:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CwFgL6yN7zDqSc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Dec 2020 22:01:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CwFP626fBzDqD9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Dec 2020 21:48:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CwFP56srbz9sTc; Tue, 15 Dec 2020 21:48:57 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <6470ab99e58c84a5445af43ce4d1d772b0dc3e93.1606247495.git.christophe.leroy@csgroup.eu>
References: <6470ab99e58c84a5445af43ce4d1d772b0dc3e93.1606247495.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v1 1/3] powerpc/32s: Remove unused counters incremented by
 create_hpte()
Message-Id: <160802921064.504444.15188323739151416876.b4-ty@ellerman.id.au>
Date: Tue, 15 Dec 2020 21:48:57 +1100 (AEDT)
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

On Tue, 24 Nov 2020 19:51:55 +0000 (UTC), Christophe Leroy wrote:
> primary_pteg_full and htab_hash_searches are not used.
> 
> Remove them.

Applied to powerpc/next.

[1/3] powerpc/32s: Remove unused counters incremented by create_hpte()
      https://git.kernel.org/powerpc/c/c5ccb4e78968fbe64f938a5a012fc8ec25cafabf
[2/3] powerpc/32s: In add_hash_page(), calculate VSID later
      https://git.kernel.org/powerpc/c/fec6166b44ded68e68144144a02e498580118f1a
[3/3] powerpc/32s: Cleanup around PTE_FLAGS_OFFSET in hash_low.S
      https://git.kernel.org/powerpc/c/da481c4fe0e485cdab5cf4d2761be8b8fb38d3d1

cheers
