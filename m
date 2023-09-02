Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C51A879082D
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Sep 2023 16:01:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=M/kbn/GS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RdGlk5CLbz3cCG
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Sep 2023 00:01:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=M/kbn/GS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RdGkj6zM7z2yVw
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  3 Sep 2023 00:00:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ykAU0IuBWCOAh/V+bHoSxJwmB/ONT4m36dnHXVeI+gc=; b=M/kbn/GSgML7w28FfggmH7XG6B
	AoIOPSIS/rWN+MsWq75QfC/Aee19klAuIvycRMJdm8AER52SmM8ldLrimDyFfGzgfA1Lh27sJMhjx
	9yR6IcYoIrGndMgjYzvRoVm4M/ZCmqT4UI5tCYhmnQUr66neucxUcFUTIXtw2EMPmynRUEf96gTef
	F7fCCcZU2Z6YpiIZfwoADbPIrShS3D2YGkNno4Vrc5chfgi8c+J1r/XUDm2LU5pVzVck07858xIDd
	e7YyQUXHRVLmmrJ2hEWQiN04YMXTLjuPogl7tDhN6y4GH1ZZAKxIH2VC7FBmAjAZduDxoiuRKz6Xp
	RntoFSfw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qcR9o-00EvUv-Kx; Sat, 02 Sep 2023 13:59:24 +0000
Date: Sat, 2 Sep 2023 14:59:24 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH gmem FIXUP] mm, compaction: make testing
 mapping_unmovable() safe
Message-ID: <ZPM/vJnwI4bi9bo2@casper.infradead.org>
References: <20230901082025.20548-2-vbabka@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230901082025.20548-2-vbabka@suse.cz>
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
Cc: kvm@vger.kernel.org, david@redhat.com, linux-mips@vger.kernel.org, linux-mm@kvack.org, pbonzini@redhat.com, chao.p.peng@linux.intel.com, linux-riscv@lists.infradead.org, isaku.yamahata@gmail.com, linux-security-module@vger.kernel.org, paul@paul-moore.com, anup@brainfault.org, chenhuacai@kernel.org, jmorris@namei.org, wei.w.wang@intel.com, tabba@google.com, yu.c.zhang@linux.intel.com, serge@hallyn.com, mail@maciej.szmigiero.name, aou@eecs.berkeley.edu, michael.roth@amd.com, ackerleytng@google.com, paul.walmsley@sifive.com, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, qperret@google.com, seanjc@google.com, linux-kernel@vger.kernel.org, oliver.upton@linux.dev, jarkko@kernel.org, palmer@dabbelt.com, kvm-riscv@lists.infradead.org, maz@kernel.org, linux-fsdevel@vger.kernel.org, liam.merwick@oracle.com, akpm@linux-foundation.org, vannapurve@google.com, linuxppc-dev@lists.ozlabs.org, kirill.shutemov@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 01, 2023 at 10:20:26AM +0200, Vlastimil Babka wrote:
> As Kirill pointed out, mapping can be removed under us due to
> truncation. Test it under folio lock as already done for the async
> compaction / dirty folio case. To prevent locking every folio with
> mapping to do the test, do it only for unevictable folios, as we can
> expect the unmovable mapping folios are also unevictable - it is the
> case for guest memfd folios.
> 
> Also incorporate comment update suggested by Matthew.

In the meantime, 866ff80176aa went upstream earlier this merge window,
so it's going to have some conflicts.

