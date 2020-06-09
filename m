Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B00531F3428
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 08:39:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49h0pC5Q7SzDqQv
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 16:39:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49gzFx5wflzDqRx
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 15:29:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49gzFp5FRYz9sVC; Tue,  9 Jun 2020 15:29:33 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20200417073508.30356-2-oohall@gmail.com>
References: <20200417073508.30356-1-oohall@gmail.com>
 <20200417073508.30356-2-oohall@gmail.com>
Subject: Re: [PATCH 1/4] powerpc/powernv/pci: Add helper to find ioda_pe from
 BDFN
Message-Id: <159168033851.1381411.11245899433443731675.b4-ty@ellerman.id.au>
Date: Tue,  9 Jun 2020 15:29:33 +1000 (AEST)
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

On Fri, 17 Apr 2020 17:35:05 +1000, Oliver O'Halloran wrote:
> For each PHB we maintain a reverse-map that can be used to find the
> PE that a BDFN is currently mapped to. Add a helper for doing this
> lookup so we can check if a PE has been configured without looking
> at pdn->pe_number.

Applied to powerpc/next.

[1/4] powerpc/powernv/pci: Add helper to find ioda_pe from BDFN
      https://git.kernel.org/powerpc/c/a8d7d5fc2e1672924a391aa37ef8c02d1ec84a4e
[2/4] powerpc/powernv/pci: Re-work bus PE configuration
      https://git.kernel.org/powerpc/c/dc3d8f85bb571c3640ebba24b82a527cf2cb3f24
[3/4] powerpc/powernv/pci: Reserve the root bus PE during init
      https://git.kernel.org/powerpc/c/718d249aeadff058f79c2e6b25212dd45bd711ae
[4/4] powerpc/powernv/pci: Sprinkle around some WARN_ON()s
      https://git.kernel.org/powerpc/c/6ae8aedf8fa932541f48a85219d75ca041c22080

cheers
