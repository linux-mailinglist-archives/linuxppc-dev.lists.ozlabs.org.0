Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C05F4193F03
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 13:43:50 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48p4RQ6rQhzDqvy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 23:43:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48p3ck4XMzzDqSL
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Mar 2020 23:06:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48p3ck030fz9sSK; Thu, 26 Mar 2020 23:06:43 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 3e74a0e16342626511c43937c120beb990539307
In-Reply-To: <20200311102405.392263-1-bala24@linux.ibm.com>
To: Balamuruhan S <bala24@linux.ibm.com>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v2] powerpc test_emulate_step: fix DS operand in ld
 encoding to appropriate value
Message-Id: <48p3ck030fz9sSK@ozlabs.org>
Date: Thu, 26 Mar 2020 23:06:43 +1100 (AEDT)
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
Cc: ravi.bangoria@linux.ibm.com, jniethe5@gmail.com,
 Balamuruhan S <bala24@linux.ibm.com>, paulus@samba.org, sandipan@linux.ibm.com,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2020-03-11 at 10:24:05 UTC, Balamuruhan S wrote:
> ld instruction should have 14 bit immediate field (DS) concatenated with
> 0b00 on the right, encode it accordingly. Introduce macro `IMM_DS()`
> to encode DS form instructions with 14 bit immediate field.
> 
> Fixes: 4ceae137bdab ("powerpc: emulate_step() tests for load/store instructions")
> Reviewed-by: Sandipan Das <sandipan@linux.ibm.com>
> Signed-off-by: Balamuruhan S <bala24@linux.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/3e74a0e16342626511c43937c120beb990539307

cheers
