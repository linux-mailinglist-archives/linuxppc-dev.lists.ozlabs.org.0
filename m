Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF39468AF0F
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Feb 2023 10:45:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P8kys5KXdz3f8n
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Feb 2023 20:45:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P8kvW1yM0z3cf8
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Feb 2023 20:42:31 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4P8kvR2hfSz4xyf;
	Sun,  5 Feb 2023 20:42:27 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20230121095352.2823517-1-npiggin@gmail.com>
References: <20230121095352.2823517-1-npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64s: Fix local irq disable when PMIs are disabled
Message-Id: <167559010434.1647710.12584447645752109701.b4-ty@ellerman.id.au>
Date: Sun, 05 Feb 2023 20:41:44 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 21 Jan 2023 19:53:52 +1000, Nicholas Piggin wrote:
> When PMI interrupts are soft-masked, local_irq_save() will clear the PMI
> mask bit, allowing PMIs in and causing a race condition. This causes a
> deadlock in native_hpte_insert via hash_preload, which depends on PMIs
> being disabled since commit 8b91cee5eadd ("powerpc/64s/hash: Make hash
> faults work in NMI context"). native_hpte_insert calls local_irq_save().
> It's possible the lpar hash code is also affected when tracing is
> enabled because __trace_hcall_entry() calls local_irq_save().
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/64s: Fix local irq disable when PMIs are disabled
      https://git.kernel.org/powerpc/c/bc88ef663265676419555df2dc469a471c0add31

cheers
