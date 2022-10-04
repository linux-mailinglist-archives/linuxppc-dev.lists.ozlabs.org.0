Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 801975F4475
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 15:41:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mhf423k9hz2ywm
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 00:41:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mhf1M3rR9z3bjZ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Oct 2022 00:38:47 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Mhf1H1ksvz4xGR;
	Wed,  5 Oct 2022 00:38:43 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, christophe.leroy@csgroup.eu, npiggin@gmail.com, mpe@ellerman.id.au
In-Reply-To: <20220908072440.258301-1-aneesh.kumar@linux.ibm.com>
References: <20220908072440.258301-1-aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH] powerpc/mm: Fix UBSAN warning reported on hugetlb
Message-Id: <166488997961.779920.6218703404881522542.b4-ty@ellerman.id.au>
Date: Wed, 05 Oct 2022 00:26:19 +1100
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
Cc: linux-mm@kvack.org, akpm@linux-foundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 8 Sep 2022 12:54:40 +0530, Aneesh Kumar K.V wrote:
> Powerpc architecture supports 16GB hugetlb pages with hash translation. For 4K
> page size, this is implemented as a hugepage directory entry at PGD level and
> for 64K it is implemented as a huge page pte at PUD level
> 
> With 16GB hugetlb size, offset within a page is greater than 32 bits. Hence
> switch to use unsigned long type when using hugepd_shift.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/mm: Fix UBSAN warning reported on hugetlb
      https://git.kernel.org/powerpc/c/7dd3a7b90bca2c12e2146a47d63cf69a2f5d7e89

cheers
