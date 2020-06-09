Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E1ED41F33A3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 07:53:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49gznT5106zDqTZ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 15:53:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49gzDw1qfnzDqRf
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 15:28:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49gzDv2CZyz9sTV; Tue,  9 Jun 2020 15:28:46 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <b459e1600b969047a74e34251a84a3d6fdf1f312.1590858925.git.christophe.leroy@csgroup.eu>
References: <b459e1600b969047a74e34251a84a3d6fdf1f312.1590858925.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2] powerpc/32s: Fix another build failure with
 CONFIG_PPC_KUAP_DEBUG
Message-Id: <159168035275.1381411.17956354294019347730.b4-ty@ellerman.id.au>
Date: Tue,  9 Jun 2020 15:28:46 +1000 (AEST)
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

On Sat, 30 May 2020 17:16:33 +0000 (UTC), Christophe Leroy wrote:
> 'thread' doesn't exist in kuap_check() macro.
> 
> Use 'current' instead.

Applied to powerpc/next.

[1/1] powerpc/32s: Fix another build failure with CONFIG_PPC_KUAP_DEBUG
      https://git.kernel.org/powerpc/c/74016701fe5f873ae23bf02835407227138d874d

cheers
