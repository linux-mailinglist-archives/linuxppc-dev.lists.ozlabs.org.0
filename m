Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 761BC1F3469
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 08:52:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49h15H4wJGzDqM1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 16:52:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49gzG42HGXzDqRq
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 15:29:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49gzFy57Skz9sV3; Tue,  9 Jun 2020 15:29:42 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, mpe@ellerman.id.au
In-Reply-To: <20200602041208.128913-1-ravi.bangoria@linux.ibm.com>
References: <20200602041208.128913-1-ravi.bangoria@linux.ibm.com>
Subject: Re: [PATCH] hw_breakpoint: Fix build warnings with clang
Message-Id: <159168035653.1381411.3943139630396101455.b4-ty@ellerman.id.au>
Date: Tue,  9 Jun 2020 15:29:42 +1000 (AEST)
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
Cc: christophe.leroy@c-s.fr, apopple@linux.ibm.com, mikey@neuling.org,
 linux-kernel@vger.kernel.org, npiggin@gmail.com, paulus@samba.org,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2 Jun 2020 09:42:08 +0530, Ravi Bangoria wrote:
> kbuild test robot reported few build warnings with hw_breakpoint code
> when compiled with clang[1]. Fix those.
> 
> [1]: https://lore.kernel.org/linuxppc-dev/202005192233.oi9CjRtA%25lkp@intel.com/

Applied to powerpc/next.

[1/1] hw-breakpoints: Fix build warnings with clang
      https://git.kernel.org/powerpc/c/ef3534a94fdbdeab4c89d18d0164be2ad5d6dbb7

cheers
