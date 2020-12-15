Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C446B2DACC0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Dec 2020 13:10:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CwHCK6CLDzDqT4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Dec 2020 23:10:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CwFbg1BJRzDqTY
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Dec 2020 21:58:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CwFbd6xzDz9sRR; Tue, 15 Dec 2020 21:58:05 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Paul Mackerras <paulus@samba.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, npiggin@gmail.com,
 aneesh.kumar@linux.ibm.com, Benjamin Herrenschmidt <benh@kernel.crashing.org>
In-Reply-To: <0d37490a067840f53fc5b118869917c0aec9ab87.1607491747.git.christophe.leroy@csgroup.eu>
References: <0d37490a067840f53fc5b118869917c0aec9ab87.1607491747.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v4 1/6] powerpc/book3s64/kuap: Improve error reporting
 with KUAP
Message-Id: <160802974007.512611.9989753415773028301.b4-ty@ellerman.id.au>
Date: Tue, 15 Dec 2020 21:58:05 +1100 (AEDT)
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

On Wed, 9 Dec 2020 05:29:20 +0000 (UTC), Christophe Leroy wrote:
> This partially reverts commit eb232b162446 ("powerpc/book3s64/kuap: Improve
> error reporting with KUAP") and update the fault handler to print
> 
> [   55.022514] Kernel attempted to access user page (7e6725b70000) - exploit attempt? (uid: 0)
> [   55.022528] BUG: Unable to handle kernel data access on read at 0x7e6725b70000
> [   55.022533] Faulting instruction address: 0xc000000000e8b9bc
> [   55.022540] Oops: Kernel access of bad area, sig: 11 [#1]
> ....
> 
> [...]

Patches 2-6 applied to powerpc/next.

[2/6] powerpc/mm: sanity_check_fault() should work for all, not only BOOK3S
      https://git.kernel.org/powerpc/c/7ceb40027e19567a0a066e3b380cc034cdd9a124
[3/6] powerpc/fault: Unnest definition of page_fault_is_write() and page_fault_is_bad()
      https://git.kernel.org/powerpc/c/5250d026d241febfaf226d26cabe528fc478e225
[4/6] powerpc/mm: Move the WARN() out of bad_kuap_fault()
      https://git.kernel.org/powerpc/c/3dc12dfe74300febc568c3b530c0f9bee01f2821
[5/6] powerpc/fault: Avoid heavy search_exception_tables() verification
      https://git.kernel.org/powerpc/c/cbd7e6ca0210db05c315a27bb5db5a482f2772ce
[6/6] powerpc/fault: Perform exception fixup in do_page_fault()
      https://git.kernel.org/powerpc/c/5f1888a077069988218805534f56b983b6d5710c

cheers
