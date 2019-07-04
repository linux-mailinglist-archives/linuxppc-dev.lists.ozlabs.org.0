Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 067335FA0A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2019 16:26:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45fgJj3r3qzDqc1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jul 2019 00:26:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45fgFj5dNJzDqJh
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Jul 2019 00:23:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45fgFg4cF4z9sPB;
 Fri,  5 Jul 2019 00:23:51 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] mm/nvdimm: Add is_ioremap_addr and use that to check
 ioremap address
In-Reply-To: <87r2792jq5.fsf@linux.ibm.com>
References: <20190701134038.14165-1-aneesh.kumar@linux.ibm.com>
 <20190701165152.7a55299eb670b0ca326f24dd@linux-foundation.org>
 <87r2792jq5.fsf@linux.ibm.com>
Date: Fri, 05 Jul 2019 00:23:49 +1000
Message-ID: <87a7dt3mkq.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-mm@kvack.org, dan.j.williams@intel.com, linuxppc-dev@lists.ozlabs.org,
 linux-nvdimm@lists.01.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
> Andrew Morton <akpm@linux-foundation.org> writes:
>
>> On Mon,  1 Jul 2019 19:10:38 +0530 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> wrote:
>>
>>> Architectures like powerpc use different address range to map ioremap
>>> and vmalloc range. The memunmap() check used by the nvdimm layer was
>>> wrongly using is_vmalloc_addr() to check for ioremap range which fails for
>>> ppc64. This result in ppc64 not freeing the ioremap mapping. The side effect
>>> of this is an unbind failure during module unload with papr_scm nvdimm driver
>>
>> The patch applies to 5.1.  Does it need a Fixes: and a Cc:stable?
>
> Actually, we want it to be backported to an older kernel possibly one
> that added papr-scm driver, b5beae5e224f ("powerpc/pseries: Add driver
> for PAPR SCM regions"). But that doesn't apply easily. It does apply
> without conflicts to 5.0

Don't worry about where it applies or doesn't, just tag it with the
correct Fixes: and stable versions and then if it doesn't backport
cleanly then we deal with that later.

cheers
