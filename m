Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F8630D934
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 12:54:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DW0TN4T4NzDwvS
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 22:54:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DW09312z4zDwvC
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 22:40:07 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DW0903CHVz9tkZ; Wed,  3 Feb 2021 22:40:03 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, Qian Cai <cai@lca.pw>
In-Reply-To: <20200510051347.1906-1-cai@lca.pw>
References: <20200510051347.1906-1-cai@lca.pw>
Subject: Re: [PATCH] powerpc/powernv/pci: fix a RCU-list lock
Message-Id: <161235200863.1516112.12206707948646314806.b4-ty@ellerman.id.au>
Date: Wed,  3 Feb 2021 22:40:03 +1100 (AEDT)
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
Cc: aik@ozlabs.ru, paulus@samba.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, paulmck@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 10 May 2020 01:13:47 -0400, Qian Cai wrote:
> It is unsafe to traverse tbl->it_group_list without the RCU read lock.
> 
>  WARNING: suspicious RCU usage
>  5.7.0-rc4-next-20200508 #1 Not tainted
>  -----------------------------
>  arch/powerpc/platforms/powernv/pci-ioda-tce.c:355 RCU-list traversed in non-reader section!!
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/powernv/pci: fix a RCU-list lock
      https://git.kernel.org/powerpc/c/c9790fb5df461c91d3fff1d864c1acb8baf5ad5c

cheers
