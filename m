Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A0C3752A3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 12:54:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FbVnT183lz30Dk
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 20:54:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=BjZV0LfO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=BjZV0LfO; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FbVms6gdMz2yxY
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 May 2021 20:53:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=y3XLcKmE5Afam3CXYxi4OxOBr7bdPJoC1pKdCFBRVaE=; b=BjZV0LfOC3qjlYrnTV7kSCZsod
 ajFER0c8YqYxysWnxFGjbofmsJyqYTSpmN85WOP4UCENH0VS4P3LpobFUP85NV/5GKFb3LxoAqg0i
 wEaCPEhGjvmvmLh/zLLr38pjToGMTotuZEMEg6+ISgv1UXj6zlfJhZL+i6OOwEGmq5zM3WSRLI2zQ
 b4ks9xWzZdR6HewaLA3csMfDm0axSqG1tHBpsc+m0lZ83rxJNASfIgncQfeoQ3Pp9+a0SR3P0Wzbu
 PNFrP471XEC/YGBafinFkXgaGG5eJIKhFQ2iMNEhTHIsn/azSlfA720xHGKcD+aM1Mqt3IM0ZodRu
 u2iu7CNw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lebbS-001c0Q-HN; Thu, 06 May 2021 10:51:48 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 0B5E8300103;
 Thu,  6 May 2021 12:51:33 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id CB9FC2C328C4C; Thu,  6 May 2021 12:51:33 +0200 (CEST)
Date: Thu, 6 May 2021 12:51:33 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: "Christopher M. Riedl" <cmr@linux.ibm.com>
Subject: Re: [RESEND PATCH v4 10/11] powerpc: Protect patching_mm with a lock
Message-ID: <YJPKNSNVf34a39qC@hirez.programming.kicks-ass.net>
References: <20210506043452.9674-1-cmr@linux.ibm.com>
 <20210506043452.9674-11-cmr@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210506043452.9674-11-cmr@linux.ibm.com>
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
Cc: tglx@linutronix.de, x86@kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-hardening@vger.kernel.org, keescook@chromium.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 05, 2021 at 11:34:51PM -0500, Christopher M. Riedl wrote:
> Powerpc allows for multiple CPUs to patch concurrently. When patching
> with STRICT_KERNEL_RWX a single patching_mm is allocated for use by all
> CPUs for the few times that patching occurs. Use a spinlock to protect
> the patching_mm from concurrent use.
> 
> Modify patch_instruction() to acquire the lock, perform the patch op,
> and then release the lock.
> 
> Also introduce {lock,unlock}_patching() along with
> patch_instruction_unlocked() to avoid per-iteration lock overhead when
> patch_instruction() is called in a loop. A follow-up patch converts some
> uses of patch_instruction() to use patch_instruction_unlocked() instead.

x86 uses text_mutex for all this, why not do the same?
