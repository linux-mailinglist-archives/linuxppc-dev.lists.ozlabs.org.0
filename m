Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8EC538C21
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 May 2022 09:42:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LC445301wz3bnH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 May 2022 17:42:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=f9KfzqGt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+ed258b20341d80583152+6855+infradead.org+hch@bombadil.srs.infradead.org; receiver=<UNKNOWN>)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LC43L3GzHz2xss
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 May 2022 17:41:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FiBE3+6Zj41uR5MWSVwoPXLvCROMHXml0uOpgCHkabs=; b=f9KfzqGtWoHwTpkTKaUNSmkkrq
	a832nluQ/NYDJ/Phb3YLI0WMym9Jj6F/CRklih5BWReVVSfsoBNc4FQpa36hyWGrcSOLRqUhQJy94
	NUWJqBgxqwa/7N2ZGz0Aiyxlatqsp6OAlKUnnVUPlhjr2/9gnY53W/GUMu+2h43Pls6BrfFWxSar8
	jB5BtaRrjw0mC/Jubs1zspFvkK2s3Mh1RfRugpXDHGzDbXPEndmV6AwLGfqJx1cNFZlHdEedQDIMP
	XvTW3Yxqzd+dRn3d8U1/JZCVqn9Ok78e07bJLe63DCT7Og0w+O6fCSZhA4AWmrNtMGm97tRA/cvvW
	CtGP6mUw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvwV8-009iK0-78; Tue, 31 May 2022 07:41:14 +0000
Date: Tue, 31 May 2022 00:41:14 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/Kconfig: Force THREAD_SHIFT to at least 14 with
 KASAN
Message-ID: <YpXGmilyOWmAh4WA@infradead.org>
References: <cc1190008368a3305d424a98be756fedec6348c1.1653926503.git.christophe.leroy@csgroup.eu>
 <87h756kz0s.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h756kz0s.fsf@mpe.ellerman.id.au>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: Erhard Furtner <erhard_f@mailbox.org>, linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 31, 2022 at 04:16:19PM +1000, Michael Ellerman wrote:
> I was thinking of doing it in C, similar to the way arm64 handles it.
> 
> Something like below. It means we always double the stack size when
> KASAN is enabled. I think it's preferable, as it will always work
> regardless of whether the user has an old .config (or is bisectting)?

Is there any reason to even offer the Kconfig?  It is super cryptic and
just picking the right value directly in the header would seem much
more sensible:

#if defined(CONFIG_PPC_256K_PAGES)
#define MIN_THREAD_SHIFT		15
#elif defined(CONFIG_PPC64)
#define MIN_THREAD_SHIFT		14
#else
#define MIN_THREAD_SHIFT		13
#endif

#ifdef CONFIG_KASAN
#define THREAD_SHIFT		(MIN_THREAD_SHIFT + 1)
#else
#define THREAD_SHIFT		MIN_THREAD_SHIFT
#endif

#if defined(CONFIG_VMAP_STACK) && THREAD_SHIFT < PAGE_SHIFT
#undef THREAD_SHIFT
#define THREAD_SHIFT		PAGE_SHIFT
#endif
