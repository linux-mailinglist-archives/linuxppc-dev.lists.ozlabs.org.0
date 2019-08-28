Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5374E9F982
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 06:43:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JCmc4MXDzDqc5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 14:43:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JCM64NcjzDqqJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2019 14:24:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 46JCM63Rz7z9sP8; Wed, 28 Aug 2019 14:24:50 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 6652bf6408895b09d31fd4128a1589a1a0672823
In-Reply-To: <1566341651-19747-1-git-send-email-gromero@linux.vnet.ibm.com>
To: Gustavo Romero <gromero@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] selftests/powerpc: Retry on host facility unavailable
Message-Id: <46JCM63Rz7z9sP8@ozlabs.org>
Date: Wed, 28 Aug 2019 14:24:50 +1000 (AEST)
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
Cc: desnesn@linux.ibm.com, mikey@neuling.org, gromero@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2019-08-20 at 22:54:11 UTC, Gustavo Romero wrote:
> TM test tm-unavailable must take into account aborts due to host aborting
> a transactin because of a facility unavailable exception, just like it
> already does for aborts on reschedules (TM_CAUSE_KVM_RESCHED).
> 
> Reported-by: Desnes A. Nunes do Rosario <desnesn@linux.ibm.com>
> Tested-by: Desnes A. Nunes do Rosario <desnesn@linux.ibm.com>
> Signed-off-by: Gustavo Romero <gromero@linux.vnet.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/6652bf6408895b09d31fd4128a1589a1a0672823

cheers
