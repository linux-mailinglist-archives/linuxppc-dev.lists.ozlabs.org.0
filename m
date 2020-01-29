Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7725D14C674
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 07:24:28 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 486tk207xpzDqYS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 17:24:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 486sF35QYmzDqNb
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 16:17:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 486sF25VYjz9sSc; Wed, 29 Jan 2020 16:17:42 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 414f50434aa2463202a5b35e844f4125dd1a7101
In-Reply-To: <20200122031125.25991-1-oohall@gmail.com>
To: Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] selftests/eeh: Bump EEH wait time to 60s
Message-Id: <486sF25VYjz9sSc@ozlabs.org>
Date: Wed, 29 Jan 2020 16:17:42 +1100 (AEDT)
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
Cc: Oliver O'Halloran <oohall@gmail.com>, Douglas Miller <dougmill@us.ibm.com>,
 Steve Best <sbest@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2020-01-22 at 03:11:25 UTC, Oliver O'Halloran wrote:
> Some newer cards supported by aacraid can take up to 40s to recover
> after an EEH event. This causes spurious failures in the basic EEH
> self-test since the current maximim timeout is only 30s.
> 
> Fix the immediate issue by bumping the timeout to a default of 60s,
> and allow the wait time to be specified via an environmental variable
> (EEH_MAX_WAIT).
> 
> Reported-by: Steve Best <sbest@redhat.com>
> Suggested-by: Douglas Miller <dougmill@us.ibm.com>
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/414f50434aa2463202a5b35e844f4125dd1a7101

cheers
