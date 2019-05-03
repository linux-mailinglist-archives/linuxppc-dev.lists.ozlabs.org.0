Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A171280D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 08:52:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44wN9c1chjzDqX8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 16:52:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44wN6g2BMpzDqPC
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2019 16:50:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 44wN6g1QrVz9sBb; Fri,  3 May 2019 16:50:03 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 88ec6b93c8e7d6d4ffaf6ad6395ceb3bf552de15
X-Patchwork-Hint: ignore
In-Reply-To: <20190410170448.3923-2-clg@kaod.org>
To: =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, kvm-ppc@vger.kernel.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v5 01/16] powerpc/xive: add OPAL extensions for the XIVE
 native exploitation support
Message-Id: <44wN6g1QrVz9sBb@ozlabs.org>
Date: Fri,  3 May 2019 16:50:03 +1000 (AEST)
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 =?utf-8?b?Q8Op?= =?utf-8?q?dric_Le_Goater?= <clg@kaod.org>,
 kvm@vger.kernel.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2019-04-10 at 17:04:33 UTC, =?utf-8?q?C=C3=A9dric_Le_Goater?= wrote:
> The support for XIVE native exploitation mode in Linux/KVM needs a
> couple more OPAL calls to get and set the state of the XIVE internal
> structures being used by a sPAPR guest.
> 
> Signed-off-by: Céddric Le Goater <clg@kaod.org>
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

Applied to powerpc topic/ppc-kvm, thanks.

https://git.kernel.org/powerpc/c/88ec6b93c8e7d6d4ffaf6ad6395ceb3b

cheers
