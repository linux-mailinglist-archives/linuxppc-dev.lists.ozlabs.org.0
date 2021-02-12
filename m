Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 291AA31979E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 01:50:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DcFJv3xrTzDx0s
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 11:50:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DcDfH0M3DzDwlB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Feb 2021 11:20:07 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DcDfF6yPFz9sVr; Fri, 12 Feb 2021 11:20:04 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20200902035138.1762531-1-oohall@gmail.com>
References: <20200902035138.1762531-1-oohall@gmail.com>
Subject: Re: [PATCH] powerpc/pci: Remove unimplemented prototypes
Message-Id: <161308904914.3606979.3150829515514773326.b4-ty@ellerman.id.au>
Date: Fri, 12 Feb 2021 11:20:04 +1100 (AEDT)
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

On Wed, 2 Sep 2020 13:51:38 +1000, Oliver O'Halloran wrote:
> The corresponding definitions were deleted in commit 3d5134ee8341
> ("[POWERPC] Rewrite IO allocation & mapping on powerpc64") which
> was merged a mere 13 years ago.

Applied to powerpc/next.

[1/1] powerpc/pci: Remove unimplemented prototypes
      https://git.kernel.org/powerpc/c/b3abe590c80e0ba55b6fce48762232d90dbc37a5

cheers
