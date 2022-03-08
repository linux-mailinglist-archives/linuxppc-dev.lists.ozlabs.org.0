Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C24164D1721
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 13:19:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCZBl46cmz3cfJ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 23:19:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCZ933zDJz3bY3
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Mar 2022 23:17:59 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KCZ905zd9z4xxx;
 Tue,  8 Mar 2022 23:17:56 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20220222113449.319193-1-mpe@ellerman.id.au>
References: <20220222113449.319193-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/64s: Don't use DSISR for SLB faults
Message-Id: <164674126563.3322453.17067950784264763088.b4-ty@ellerman.id.au>
Date: Tue, 08 Mar 2022 23:07:45 +1100
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
Cc: dja@axtens.net, rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 22 Feb 2022 22:34:49 +1100, Michael Ellerman wrote:
> Since commit 46ddcb3950a2 ("powerpc/mm: Show if a bad page fault on data
> is read or write.") we use page_fault_is_write(regs->dsisr) in
> __bad_page_fault() to determine if the fault is for a read or write, and
> change the message printed accordingly.
> 
> But SLB faults, aka Data Segment Interrupts, don't set DSISR (Data
> Storage Interrupt Status Register) to a useful value. All ISA versions
> from v2.03 through v3.1 specify that the Data Segment Interrupt sets
> DSISR "to an undefined value". As far as I can see there's no mention of
> SLB faults setting DSISR in any BookIV content either.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/64s: Don't use DSISR for SLB faults
      https://git.kernel.org/powerpc/c/d4679ac8ea2e5078704aa1c026db36580cc1bf9a

cheers
