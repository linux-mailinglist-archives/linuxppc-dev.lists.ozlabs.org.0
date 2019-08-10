Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D40A488ACE
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Aug 2019 12:33:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 465JNj3VBLzDqXt
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Aug 2019 20:33:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 465J615HNBzDqZp
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Aug 2019 20:20:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 465J611wxNz9sNk; Sat, 10 Aug 2019 20:20:35 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 08a456aa643776757e07adfdebe7f7681117d144
In-Reply-To: <20190509051119.7694-1-ajd@linux.ibm.com>
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v2 1/5] powerpc/powernv: Move SCOM access code into
 powernv platform
Message-Id: <465J611wxNz9sNk@ozlabs.org>
Date: Sat, 10 Aug 2019 20:20:35 +1000 (AEST)
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

On Thu, 2019-05-09 at 05:11:15 UTC, Andrew Donnellan wrote:
> The powernv platform is the only one that directly accesses SCOMs. Move the
> support code to platforms/powernv, and get rid of the PPC_SCOM Kconfig
> option, as SCOM support is always selected when compiling for powernv.
> 
> This also means that the Kconfig item for CONFIG_SCOM_DEBUGFS will actually
> show up in menuconfig, as previously it was the only labelled option in
> sysdev/Kconfig and wasn't actually in a menu.
> 
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>

Series applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/08a456aa643776757e07adfdebe7f7681117d144

cheers
