Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5BD290220
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Oct 2020 11:43:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CCLn2351jzDqd7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Oct 2020 20:43:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1231::1; helo=merlin.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=merlin.20170209 header.b=a7EzGtcN; 
 dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CCLl841KHzDqWq
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Oct 2020 20:41:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=kY5/nlPS50tc/QzCJtgtyF62V3ySxVBkZXcvKwpXhxY=; b=a7EzGtcN/BPOAuZcqG2S/jFCG1
 v3d1/Noe9xB9YkHRjuQKiRMY7QH//b7wdBEY0J46pVkEEsvoeyZL7lPJRppbQ5Y4+Z/ZcCHNvjcpa
 1H/ERZMigSiiJ1/7f9jassoFTEkh1LvE1h+qWnmkEvGxvSoRdCcg5OK5K1iSY+aQwu8YsEW3IUWRR
 IIGEj3Dmu0868JTGN55hxYlnTKAx6eo+XiL4PUOSp0trPD4hLYzo1vJSjC1q/xgewVniBBnm/lK8A
 oFVJlSpawpOZf2PIFpkCa4CnWr+Gu09l6c6VU6sHNEkou6oe3Hx7j1cwYuOuaiMJ+2vEnTpKDzmof
 RRD5y8VQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTMEw-0003KL-Bs; Fri, 16 Oct 2020 09:41:34 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id CEF51300DB4;
 Fri, 16 Oct 2020 11:41:32 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id B1F952019D2CA; Fri, 16 Oct 2020 11:41:32 +0200 (CEST)
Date: Fri, 16 Oct 2020 11:41:32 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 3/8] powerpc: Mark functions called inside uaccess blocks
 w/ 'notrace'
Message-ID: <20201016094132.GI2611@hirez.programming.kicks-ass.net>
References: <20201015150159.28933-1-cmr@codefail.de>
 <20201015150159.28933-4-cmr@codefail.de>
 <20201016065616.GB9343@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201016065616.GB9343@infradead.org>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 "Christopher M. Riedl" <cmr@codefail.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 16, 2020 at 07:56:16AM +0100, Christoph Hellwig wrote:
> On Thu, Oct 15, 2020 at 10:01:54AM -0500, Christopher M. Riedl wrote:
> > Functions called between user_*_access_begin() and user_*_access_end()
> > should be either inlined or marked 'notrace' to prevent leaving
> > userspace access exposed. Mark any such functions relevant to signal
> > handling so that subsequent patches can call them inside uaccess blocks.
> 
> I don't think running this much code with uaccess enabled is a good
> idea.  Please refactor the code to reduce the criticial sections with
> uaccess enabled.
> 
> Btw, does powerpc already have the objtool validation that we don't
> accidentally jump out of unsafe uaccess critical sections?

It does not, there was some effort on that a while ago, but I suspect
they're waiting for the ARM64 effort to land and build on that.
