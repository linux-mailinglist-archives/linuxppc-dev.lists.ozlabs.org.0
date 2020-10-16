Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9F42903B8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Oct 2020 13:03:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CCNYP5lB8zDqRX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Oct 2020 22:03:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4CCNWt0ycgzDqXJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Oct 2020 22:02:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CCNWs4F2Fz9sTq; Fri, 16 Oct 2020 22:02:01 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Qian Cai <cai@lca.pw>
In-Reply-To: <20201014182811.12027-1-cai@lca.pw>
References: <20201014182811.12027-1-cai@lca.pw>
Subject: Re: [PATCH -next] Revert "powerpc/pci: unmap legacy INTx interrupts
 when a PHB is removed"
Message-Id: <160284610672.1777686.18064845721943277893.b4-ty@ellerman.id.au>
Date: Fri, 16 Oct 2020 22:02:01 +1100 (AEDT)
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Alexey Kardashevskiy <aik@ozlabs.ru>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Oliver O'Halloran <oohall@gmail.com>, Cédric Le Goater <clg@kaod.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 14 Oct 2020 14:28:11 -0400, Qian Cai wrote:
> This reverts commit 3a3181e16fbde752007759f8759d25e0ff1fc425 which
> causes memory corruptions on POWER9 NV.

Applied to powerpc/next.

[1/1] Revert "powerpc/pci: unmap legacy INTx interrupts when a PHB is removed"
      https://git.kernel.org/powerpc/c/ffd0b25ca049a477cb757e5bcf2d5e1664d12e5d

cheers
