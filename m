Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A88D7E7E10
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Nov 2023 18:18:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SRlsL2DlVz3cXy
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Nov 2023 04:18:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SRlrn2vzlz2yV3
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Nov 2023 04:18:01 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9365ACE1174;
	Fri, 10 Nov 2023 17:17:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EAB3C433C7;
	Fri, 10 Nov 2023 17:17:54 +0000 (UTC)
Date: Fri, 10 Nov 2023 17:17:51 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: get_user_pages() and EXEC_ONLY mapping.
Message-ID: <ZU5lv6mcl4AsN279@arm.com>
References: <87bkc1oe8c.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87bkc1oe8c.fsf@linux.ibm.com>
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
Cc: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org, Jason Gunthorpe <jgg@nvidia.com>, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 10, 2023 at 08:19:23PM +0530, Aneesh Kumar K.V wrote:
> Some architectures can now support EXEC_ONLY mappings and I am wondering
> what get_user_pages() on those addresses should return. Earlier
> PROT_EXEC implied PROT_READ and pte_access_permitted() returned true for
> that. But arm64 does have this explicit comment that says
> 
>  /*
>  * p??_access_permitted() is true for valid user mappings (PTE_USER
>  * bit set, subject to the write permission check). For execute-only
>  * mappings, like PROT_EXEC with EPAN (both PTE_USER and PTE_UXN bits
>  * not set) must return false. PROT_NONE mappings do not have the
>  * PTE_VALID bit set.
>  */
> 
> Is that correct? We should be able to get struct page for PROT_EXEC
> mappings?

I don't remember why we ended up with this briefly looking at the code,
pte_access_permitted() is only used on the fast GUP path. On the slow
path, there is a check_vma_flags() call which returns -EFAULT if the vma
is not readable. So the pte_access_permitted() on the fast path matches
the semantics of the slow path.

If one wants the page structure, FOLL_FORCE ignores the read check (on
the slow path), though I think it still fails if VM_MAYREAD is not set.
Unless you have a real use-case where this is not sufficient, I'd leave
the behaviour as is on arm64 (and maybe update other architectures that
support exec-only to do the same).

-- 
Catalin
