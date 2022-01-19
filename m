Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FF6493B66
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jan 2022 14:49:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jf6SG3l9Xz30NZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jan 2022 00:49:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=q307KYxl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=willy@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=q307KYxl; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jf6RZ0BGFz2xv0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jan 2022 00:48:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=KXtnBmHR26VnyA5/MyeO0p5Mer/FOttvLvx2Yg5H/f0=; b=q307KYxlizBZChDxVWf50BNc7i
 ulkozYxgvKy0JvUzcELQya+co3ae/kHNFbO1y3/T6S4j4u1q9n27AiQpeEc9GpLDMLSVvksmQpPJK
 MnOEHc+PxkQY8WS6RXMiDj04z27Jr9OmVBz/rv0fcvN4azhZg8dQVHcGy+WMroOnLK3bySxG5A+xI
 LWqXJF+Jr7gv+tHXgGkVDEIF2ha516o0dx4gsz6ldb3tNDDk3wMbKx6lT5M3fygBiU12ICmzCpzXc
 3HIhEJKLOdRJ6XLNvaHagY1xzR38gvmSE8gEDYjtJuNOqUATZ+WipQz+OHME+/GVUHEcyAgphvSQK
 QIPa9SLA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nABJt-00AwLk-Qj; Wed, 19 Jan 2022 13:48:13 +0000
Date: Wed, 19 Jan 2022 13:48:13 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: Re: [PATCH v2 1/3] mm: vmalloc: Let user to control huge vmalloc
 default behavior
Message-ID: <YegWneON2voE9htO@casper.infradead.org>
References: <20211227145903.187152-1-wangkefeng.wang@huawei.com>
 <20211227145903.187152-2-wangkefeng.wang@huawei.com>
 <1642473992.qrnqczjfna.astroid@bobo.none>
 <f0dd59eb-6eb8-5b60-508d-7f4022f655ec@huawei.com>
 <YegQfIQibQi993dp@casper.infradead.org>
 <93db576e-9a62-ee98-5af2-a62f8386212c@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <93db576e-9a62-ee98-5af2-a62f8386212c@huawei.com>
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
Cc: x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-doc@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, linux-mm@kvack.org,
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 19, 2022 at 09:44:20PM +0800, Kefeng Wang wrote:
> 
> On 2022/1/19 21:22, Matthew Wilcox wrote:
> > On Wed, Jan 19, 2022 at 08:57:58PM +0800, Kefeng Wang wrote:
> > > Only parts of our products wants this feature,  we add some interfaces which
> > > only
> > > 
> > > alloc hugevmalloc for them, eg,
> > > vmap_hugepage/vmalloc_hugepage/remap_vmalloc_hugepage_range..
> > > 
> > > for our products, but it's not the choice of most products, also add
> > > nohugevmalloc
> > > 
> > > for most products is expensive, so this is the reason for adding the patch.
> > > 
> > > more config/cmdline are more flexible for test/products，
> > But why do only some products want it?  What goes wrong if all products
> > enable it?  Features should be auto-tuning, not relying on admins to
> > understand them.
> 
> Because this feature will use more memory for vmalloc/vmap, that's why we
> add some explicit
> interfaces as said above in our kernel to control the user.

Have you validated that?  What sort of performance penalty do you see?
