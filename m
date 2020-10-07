Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F9B285714
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Oct 2020 05:31:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5fxp6QjQzDqP1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Oct 2020 14:31:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5fkM1nCQzDqFC
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Oct 2020 14:21:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4C5fkM0DmSz9sV0; Wed,  7 Oct 2020 14:21:14 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Gustavo Romero <gromero@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20200919150025.9609-1-gromero@linux.ibm.com>
References: <20200919150025.9609-1-gromero@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc/tm: Save and restore AMR on treclaim and
 trechkpt
Message-Id: <160204083267.257875.3237205733513981909.b4-ty@ellerman.id.au>
Date: Wed,  7 Oct 2020 14:21:14 +1100 (AEDT)
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
Cc: aneesh.kumar@linux.ibm.com, mikey@neuling.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 19 Sep 2020 12:00:25 -0300, Gustavo Romero wrote:
> Althought AMR is stashed in the checkpoint area, currently we don't save
> it to the per thread checkpoint struct after a treclaim and so we don't
> restore it either from that struct when we trechkpt. As a consequence when
> the transaction is later rolled back the kernel space AMR value when the
> trechkpt was done appears in userspace.
> 
> That commit saves and restores AMR accordingly on treclaim and trechkpt.
> Since AMR value is also used in kernel space in other functions, it also
> takes care of stashing kernel live AMR into the stack before treclaim and
> before trechkpt, restoring it later, just before returning from tm_reclaim
> and __tm_recheckpoint.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/tm: Save and restore AMR on treclaim and trechkpt
      https://git.kernel.org/powerpc/c/d0ffdee8ff01fb21085d835ee54dc8c1c4d19226

cheers
