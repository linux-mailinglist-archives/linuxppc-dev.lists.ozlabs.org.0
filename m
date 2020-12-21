Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E8C2DFB5A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Dec 2020 12:07:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CzxX30H7jzDqFK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Dec 2020 22:07:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CzxR35v7pzDqJ2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Dec 2020 22:03:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CzxR34Kwbz9sVn; Mon, 21 Dec 2020 22:03:27 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20201211021140.28402-1-ajd@linux.ibm.com>
References: <20201211021140.28402-1-ajd@linux.ibm.com>
Subject: Re: [PATCH] powerpc/powernv: Rate limit opal-elog read failure message
Message-Id: <160854857908.1696279.3604424735058468008.b4-ty@ellerman.id.au>
Date: Mon, 21 Dec 2020 22:03:27 +1100 (AEDT)
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
Cc: aneesh.kumar@linux.ibm.com, mahesh@linux.ibm.com, hegdevasant@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 11 Dec 2020 13:11:41 +1100, Andrew Donnellan wrote:
> Sometimes we can't read an error log from OPAL, and we print an error
> message accordingly. But the OPAL userspace tools seem to like retrying a
> lot, in which case we flood the kernel log with a lot of messages.
> 
> Change pr_err() to pr_err_ratelimited() to help with this.

Applied to powerpc/next.

[1/1] powerpc/powernv: Rate limit opal-elog read failure message
      https://git.kernel.org/powerpc/c/c88017cf2af614409da69934c1738ed5ff2f7022

cheers
