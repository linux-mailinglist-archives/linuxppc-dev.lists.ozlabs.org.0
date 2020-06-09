Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 966121F33FF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 08:19:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49h0MV6D2DzDqgs
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 16:19:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49gzFS2q64zDqRf
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 15:29:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49gzFM1nvnz9sV1; Tue,  9 Jun 2020 15:29:10 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, Michael Neuling <mikey@neuling.org>
In-Reply-To: <20200325040546.3091563-1-mikey@neuling.org>
References: <20200325040546.3091563-1-mikey@neuling.org>
Subject: Re: [PATCH] powerpc/tm: Document h/rfid and mtmsrd quirk
Message-Id: <159168031362.1381411.6046975795047644711.b4-ty@ellerman.id.au>
Date: Tue,  9 Jun 2020 15:29:10 +1000 (AEST)
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
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
 Gustavo Romero <gromero@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 25 Mar 2020 15:05:46 +1100, Michael Neuling wrote:
> The ISA has a quirk that's useful for the Linux implementation.
> Document it here so others are less likely to trip over it.

Applied to powerpc/next.

[1/1] powerpc/tm: Document h/rfid and mtmsrd quirk
      https://git.kernel.org/powerpc/c/b8707e2374f68cac79de553ae1ee5c35913813bd

cheers
