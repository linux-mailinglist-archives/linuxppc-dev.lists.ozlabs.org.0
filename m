Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AAA235727
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Aug 2020 15:37:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BKMWl5ZNbzDqPg
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Aug 2020 23:37:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BKMSw5JytzDqH2
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Aug 2020 23:34:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BKMSw4507z9sSt; Sun,  2 Aug 2020 23:34:56 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Alastair D'Silva <alastair@d-silva.org>
In-Reply-To: <20200415012343.919255-1-alastair@d-silva.org>
References: <20200415012343.919255-1-alastair@d-silva.org>
Subject: Re: [PATCH 0/2] powerpc: OpenCAPI Cleanup
Message-Id: <159637523498.42190.4746198134743863254.b4-ty@ellerman.id.au>
Date: Sun,  2 Aug 2020 23:34:56 +1000 (AEST)
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
Cc: Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Frederic Barrat <fbarrat@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 15 Apr 2020 11:23:41 +1000, Alastair D'Silva wrote:
> These patches address checkpatch & kernel doc warnings
> in the OpenCAPI infrastructure.
> 
> Alastair D'Silva (2):
>   ocxl: Remove unnecessary externs
>   ocxl: Address kernel doc errors & warnings
> 
> [...]

Applied to powerpc/next.

[1/2] ocxl: Remove unnecessary externs
      https://git.kernel.org/powerpc/c/c75d42e4c768c403f259f6c7f6217c850cf11be9
[2/2] ocxl: Address kernel doc errors & warnings
      https://git.kernel.org/powerpc/c/3591538a31af37cf6a2d83f1da99e651a822af8b

cheers
