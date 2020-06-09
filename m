Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3F71F33F3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 08:09:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49h0882QFwzDqlg
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 16:09:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49gzFF3WzZzDqRd
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 15:29:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49gzF9729kz9sTb; Tue,  9 Jun 2020 15:29:00 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Thomas Gleixner <tglx@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nadav Amit <namit@vmware.com>,
 "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
 Leonardo Bras <leobras.c@gmail.com>, Allison Randal <allison@lohutok.net>,
 Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Nathan Lynch <nathanl@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <20200518234245.200672-1-leobras.c@gmail.com>
References: <20200518234245.200672-1-leobras.c@gmail.com>
Subject: Re: [PATCH v6 0/2] Implement reentrant rtas call
Message-Id: <159168034552.1381411.5609887094437090637.b4-ty@ellerman.id.au>
Date: Tue,  9 Jun 2020 15:29:00 +1000 (AEST)
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

On Mon, 18 May 2020 20:42:43 -0300, Leonardo Bras wrote:
> Patch 2 implement rtas_call_reentrant() for reentrant rtas-calls:
> "ibm,int-on", "ibm,int-off",ibm,get-xive" and  "ibm,set-xive",
> according to LoPAPR Version 1.1 (March 24, 2016).
> 
> For that, it's necessary that every call uses a different
> rtas buffer (rtas_args). Paul Mackerras suggested using the PACA
> structure for creating a per-cpu buffer for these calls.
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc/rtas: Move type/struct definitions from rtas.h into rtas-types.h
      https://git.kernel.org/powerpc/c/783a015b747f606e803b798eb8b50c73c548691d
[2/2] powerpc/rtas: Implement reentrant rtas call
      https://git.kernel.org/powerpc/c/b664db8e3f976d9233cc9ea5e3f8a8c0bcabeb48

cheers
