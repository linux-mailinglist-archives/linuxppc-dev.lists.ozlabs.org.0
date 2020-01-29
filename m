Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5516814C664
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 07:16:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 486tXp3cLNzDqWW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 17:16:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 486sF04hKRzDqNf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 16:17:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 486sDz1RWgz9sSS; Wed, 29 Jan 2020 16:17:38 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 173bf44bdfc768af3c07cd0aeeb6ad8d1331b77d
In-Reply-To: <20200114110012.17351-1-laurentiu.tudor@nxp.com>
To: Laurentiu Tudor <laurentiu.tudor@nxp.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] MAINTAINERS: Add myself as maintainer of ehv_bytechan tty
 driver
Message-Id: <486sDz1RWgz9sSS@ozlabs.org>
Date: Wed, 29 Jan 2020 16:17:38 +1100 (AEDT)
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
Cc: "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>,
 "timur@kernel.org" <timur@kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 Diana Madalina Craciun <diana.craciun@nxp.com>,
 "swood@redhat.com" <swood@redhat.com>,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2020-01-14 at 11:00:25 UTC, Laurentiu Tudor wrote:
> Michael Ellerman made a call for volunteers from NXP to maintain
> this driver and I offered myself.
> 
> Signed-off-by: Laurentiu Tudor <laurentiu.tudor@nxp.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/173bf44bdfc768af3c07cd0aeeb6ad8d1331b77d

cheers
