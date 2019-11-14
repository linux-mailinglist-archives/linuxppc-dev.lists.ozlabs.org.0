Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8D9FC3C7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 11:15:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DHRM0Q4VzF7fK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 21:15:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DFyD3FxYzF5lT
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 20:08:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 47DFyC0KRXz9sSW; Thu, 14 Nov 2019 20:08:17 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 9f0acf9f80ad504573e6482fb00b53866a9b9d2f
In-Reply-To: <20191103233356.5472-1-chris.smart@humanservices.gov.au>
To: Chris Smart <chris.smart@humanservices.gov.au>,
 <linuxppc-dev@lists.ozlabs.org>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH 1/1] powerpc/crypto: Add cond_resched() in crc-vpmsum
 self-test
Message-Id: <47DFyC0KRXz9sSW@ozlabs.org>
Date: Thu, 14 Nov 2019 20:08:17 +1100 (AEDT)
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
Cc: distroguy@gmail.com, Chris Smart <chris.smart@humanservices.gov.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 2019-11-03 at 23:33:56 UTC, Chris Smart wrote:
> The stress test for vpmsum implementations executes a long for loop in
> the kernel. This blocks the scheduler, which prevents other tasks from
> running, resulting in a warning.
> 
> This fix adds a call to cond_reshed() at the end of each loop, which
> allows the scheduler to run other tasks as required.
> 
> Signed-off-by: Chris Smart <chris.smart@humanservices.gov.au>

Series applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/9f0acf9f80ad504573e6482fb00b53866a9b9d2f

cheers
