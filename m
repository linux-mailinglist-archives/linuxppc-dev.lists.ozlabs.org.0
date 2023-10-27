Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 55ACF7D9599
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Oct 2023 12:51:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=NrR/QzVX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SGzx520jmz3cZd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Oct 2023 21:51:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SGzw61Tllz3c4M
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Oct 2023 21:50:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=XPVaQuB38LROMPcFzxpv9kuEMxyfwgF6VESkqwfKulg=; b=NrR/QzVXR13J9OJfVGVkitEG/y
	b5xrPBftzCBX8P7lbcBl7Jfr13UglFWNhHMD5yzgD0bzBtqZEWkeTlqLCosU4AKmHJHdXmF3v2Mij
	ElpA9vKe/o70wqwVrDic9Xj88rB2Dffdxedb2KiBulxRbtbQ1DNo5ZJnMXIRRRvcuWuBiNh+6xr1u
	prwGwW2fIQURhfSxxQgQ9wf4Ozm67pl4/Yez6sQd24HRVi2tbiV9orUnK4LXT3usyG9TWvyHzZuWW
	AsUmTys5vDaGLdBY677asV+JgGNqWjZGQ2csi0ODe4veD3kRnZdjjrsmx0zWTq62bKbpg2Wo5Q+/u
	6du/jmIA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qwKPs-002xVk-8E; Fri, 27 Oct 2023 10:50:12 +0000
Date: Fri, 27 Oct 2023 11:50:12 +0100
From: Matthew Wilcox <willy@infradead.org>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc/mm: Avoid calling arch_enter/leave_lazy_mmu()
 in set_ptes
Message-ID: <ZTuV5GJ52IZE7mxu@casper.infradead.org>
References: <20231024143604.16749-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231024143604.16749-1-aneesh.kumar@linux.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 24, 2023 at 08:06:04PM +0530, Aneesh Kumar K.V wrote:
>  		ptep++;
> -		pte = __pte(pte_val(pte) + (1UL << PTE_RPN_SHIFT));
>  		addr += PAGE_SIZE;
> +		/*
> +		 * increment the pfn.
> +		 */
> +		pte = pfn_pte(pte_pfn(pte) + 1, pte_pgprot((pte)));

when i looked at this, it generated shit code.  did you check?
why did you bother changing this?
