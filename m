Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 127D5617327
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 01:01:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2kS26t0tz3cGk
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 11:01:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2lQc0nXI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=mcgrof@infradead.org; receiver=<UNKNOWN>)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2kQf4CDdz3gDM
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Nov 2022 10:59:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=t5AqGgPaokx6x0rdC5uz+rjU5dq/lOC3mQZwI1qWWWM=; b=2lQc0nXIKirMBa4o/dvF+NXVyc
	nyq0G4c3Y6tODFlxfJPvEFrzp7u999cDdCbQImfmCGm8LEr+avFItV98IZ7vT5r4g2F8qlDLoXKrI
	sGcK1fLVzSFrDpi9ihWorXe7ZAD/yBzC9Xk9li1KNmQLQu+O/Y0+BQZGHtAIHhCR6GlXj6h/38caX
	g98vFMkepKFvL68ADOye4fDgtHlk2uT1OJfBAAdFp3gbMm01dltKKhP22PndC8Wffr+qJOcE8y6Rp
	Tb8TsWBuG9oyXMBdQcgXP3kPnqcdpc2qpNa9GD4ckfBgsCBVeoXRWEKKL+Ns0+SQotRwqBV5g4kc3
	LPHdLXuQ==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqNeA-00FFcb-PY; Wed, 02 Nov 2022 23:59:50 +0000
Date: Wed, 2 Nov 2022 16:59:50 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v5 1/2] module: add module_elf_check_arch for
 module-specific checks
Message-ID: <Y2MEdgcrkR79yWqs@bombadil.infradead.org>
References: <20221031120733.3956781-1-npiggin@gmail.com>
 <20221031120733.3956781-2-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031120733.3956781-2-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, Jessica Yu <jeyu@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 31, 2022 at 10:07:32PM +1000, Nicholas Piggin wrote:
> The elf_check_arch() function is also used to test compatibility of
> usermode binaries. Kernel modules may have more specific requirements,
> for example powerpc would like to test for ABI version compatibility.
> 
> Add a weak module_elf_check_arch() that defaults to true, and call it
> from elf_validity_check().
> 
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Jessica Yu <jeyu@kernel.org>
> [np: added changelog, adjust name, rebase]
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Acked-by: Luis Chamberlain <mcgrof@kernel.org>

  Luis
