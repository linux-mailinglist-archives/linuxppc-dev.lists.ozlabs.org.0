Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F41530D06F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 01:48:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVjhf6PL4zDqc7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 11:48:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=90.155.50.34; helo=casper.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=p1lybmAI; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVM3K43QzzDrP5
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Feb 2021 21:47:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=NADaTCO1CjR1KZmInxVOia+51JId9JWZI/jutXFKWOc=; b=p1lybmAIUWUqq7pxKWtAMsxKbp
 IFaPhA+3oSffoBaxzOD4kaMNLGpXMR+AvS8smi4Hmw804tuxMQQmXYUE+ytp0S2+s8aCVXQora/1X
 BuXNB1R1kxl6J7jr4K9WQGfDfyLkrcykH31znsBW4jEsEc98sHcbSivGie3Wo2sX3G6SuJmaAhaCd
 Wc5U4qcKHBjbwsOo4vcBfm+ZiiEIzAc6cgyQllovMJ4TR+/4ezyX20w5eAPpJSA4TOJ3CECah04/v
 R+E3Sgm4ORlphScAkIV7Sxt09sNKYDmvcN6z54dDrHYLYeI3TagaGSrNAHmFKJ9vpNKAEBFTUd/2h
 fIGT2RQg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1l6tDJ-00F4dx-Cn; Tue, 02 Feb 2021 10:47:19 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 502F2301A66;
 Tue,  2 Feb 2021 11:47:16 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 12801299C9F60; Tue,  2 Feb 2021 11:47:16 +0100 (CET)
Date: Tue, 2 Feb 2021 11:47:16 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [RFC PATCH 3/6] mm/mremap: Use pmd/pud_poplulate to update page
 table entries
Message-ID: <YBkttA/rS/1ZHY8a@hirez.programming.kicks-ass.net>
References: <20210202091116.196134-1-aneesh.kumar@linux.ibm.com>
 <20210202091116.196134-3-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210202091116.196134-3-aneesh.kumar@linux.ibm.com>
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
Cc: linux-mm@kvack.org, kaleshsingh@google.com, joel@joelfernandes.org,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 02, 2021 at 02:41:13PM +0530, Aneesh Kumar K.V wrote:
> pmd/pud_populate is the right interface to be used to set the respective
> page table entries. Some architectures do assume that set_pmd/pud_at
> can only be used to set a hugepage PTE. Since we are not setting up a hugepage
> PTE here, use the pmd/pud_populate interface.

Since you did the audit, it might be nice to record which architectures
that are. Also, how much work to fix them?
