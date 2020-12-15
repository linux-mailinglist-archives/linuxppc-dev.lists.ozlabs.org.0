Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F4C2DAC5A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Dec 2020 12:52:05 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CwGnq0XhnzDqSf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Dec 2020 22:51:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CwFPJ4b91zDqP1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Dec 2020 21:49:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CwFPJ1Fbhz9sTL; Tue, 15 Dec 2020 21:49:08 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Tyrel Datwyler <tyreld@linux.ibm.com>, mpe@ellerman.id.au
In-Reply-To: <20201208195434.8289-1-tyreld@linux.ibm.com>
References: <20201208195434.8289-1-tyreld@linux.ibm.com>
Subject: Re: [PATCH] powerpc/rtas: fix typo of ibm,
 open-errinjct in rtas filter
Message-Id: <160802920722.504444.16567596066211679066.b4-ty@ellerman.id.au>
Date: Tue, 15 Dec 2020 21:49:08 +1100 (AEDT)
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

On Tue, 8 Dec 2020 13:54:34 -0600, Tyrel Datwyler wrote:
> Commit bd59380c5ba4 ("powerpc/rtas: Restrict RTAS requests from userspace")
> introduced the following error when invoking the errinjct userspace
> tool.
> 
> [root@ltcalpine2-lp5 librtas]# errinjct open
> [327884.071171] sys_rtas: RTAS call blocked - exploit attempt?
> [327884.071186] sys_rtas: token=0x26, nargs=0 (called by errinjct)
> errinjct: Could not open RTAS error injection facility
> errinjct: librtas: open: Unexpected I/O error
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/rtas: Fix typo of ibm,open-errinjct in RTAS filter
      https://git.kernel.org/powerpc/c/f10881a46f8914428110d110140a455c66bdf27b

cheers
