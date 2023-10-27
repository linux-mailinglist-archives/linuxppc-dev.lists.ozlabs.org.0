Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1017D942A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Oct 2023 11:49:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SGyYd0RJQz3cTg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Oct 2023 20:49:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SGyXf3tqtz30gH
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Oct 2023 20:48:34 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SGyXZ0MR3z4xPN;
	Fri, 27 Oct 2023 20:48:30 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, christophe.leroy@csgroup.eu, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
In-Reply-To: <20231024143604.16749-1-aneesh.kumar@linux.ibm.com>
References: <20231024143604.16749-1-aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc/mm: Avoid calling arch_enter/leave_lazy_mmu() in set_ptes
Message-Id: <169840001174.2695453.15255074360035893405.b4-ty@ellerman.id.au>
Date: Fri, 27 Oct 2023 20:46:51 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: willy@infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 24 Oct 2023 20:06:04 +0530, Aneesh Kumar K.V wrote:
> With commit 9fee28baa601 ("powerpc: implement the new page table range
> API") we added set_ptes to powerpc architecture. The implementation
> included calling arch_enter/leave_lazy_mmu() calls.
> 
> The patch removes the usage of arch_enter/leave_lazy_mmu() because
> set_pte is not supposed to be used when updating a pte entry. Powerpc
> architecture uses this rule to skip the expensive tlb invalidate which
> is not needed when you are setting up the pte for the first time. See
> commit 56eecdb912b5 ("mm: Use ptep/pmdp_set_numa() for updating
> _PAGE_NUMA bit") for more details
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/mm: Avoid calling arch_enter/leave_lazy_mmu() in set_ptes
      https://git.kernel.org/powerpc/c/47b8def9358c5eb888e78b24b7e5b7f2e2e97b8e

cheers
