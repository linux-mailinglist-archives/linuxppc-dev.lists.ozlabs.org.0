Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 750634B87AB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 13:30:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JzHNg0Cr0z3cN8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 23:30:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JzHNK6MPxz2xrG
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Feb 2022 23:30:09 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JzHNL13Bsz4xbG;
 Wed, 16 Feb 2022 23:30:10 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20220211065215.101767-1-aneesh.kumar@linux.ibm.com>
References: <20220211065215.101767-1-aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc/mm: Update default hugetlb size early
Message-Id: <164501435855.521186.2992256285509889819.b4-ty@ellerman.id.au>
Date: Wed, 16 Feb 2022 23:25:58 +1100
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
Cc: linux-mm@kvack.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 11 Feb 2022 12:22:15 +0530, Aneesh Kumar K.V wrote:
> commit: d9c234005227 ("Do not depend on MAX_ORDER when grouping pages by mobility")
> introduced pageblock_order which will be used to group pages better.
> The kernel now groups pages based on the value of HPAGE_SHIFT. Hence HPAGE_SHIFT
> should be set before we call set_pageblock_order.
> 
> set_pageblock_order happens early in the boot and default hugetlb page size
> should be initialized before that to compute the right pageblock_order value.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/mm: Update default hugetlb size early
      https://git.kernel.org/powerpc/c/2354ad252b66695be02f4acd18e37bf6264f0464

cheers
