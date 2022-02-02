Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D77E84A7BC8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Feb 2022 00:37:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JpyrV4zCKz3bcc
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Feb 2022 10:37:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EQFB7AmH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=mcgrof@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=EQFB7AmH; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jpyqt5DC8z30N0
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Feb 2022 10:36:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=sKMSro+nqi3+TRaInDh/r5jt9h3R6I+1JvbqLUuQ9zw=; b=EQFB7AmHjcEOog2AgXpabrhNbq
 eb+nIuW++r278MsQm+yo6BJLgWEi7DgA0z/LlXygv3QszEhUFbTZTYEd7tnQF95I9q+HDvddpS0dr
 ZT4oOJqpMyq2CEFRDI9sNR/0008KH9VEFO6SEXb/UlghtmM1nhzbpJM/5gNt8d05BRv4D8tQ5GrZW
 fpzQ8SgxsTS6vdNOuRec1F/wQ5pWQ0g4+NAL2ajplTSo5BZ+1fnALWGrFPMSPAfHFWRnsxJ/WmIg1
 N3Sh1ZVZn6t5DVK/fZ6Xax5LywKa/tBa8o8JoZbW2WIGkbbwfyxz0e9MK78JgVYWCcygyNJY3ImiP
 uQFa5xkw==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1nFPAz-00H4rN-PB; Wed, 02 Feb 2022 23:36:37 +0000
Date: Wed, 2 Feb 2022 15:36:37 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 5/5] powerpc: Select
 ARCH_WANTS_MODULES_DATA_IN_VMALLOC on book3s/32 and 8xx
Message-ID: <YfsVhcpVTW0+YCl5@bombadil.infradead.org>
References: <cover.1643282353.git.christophe.leroy@csgroup.eu>
 <a20285472ad0a0a13a1d93c4707180be5b4fa092.1643282353.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a20285472ad0a0a13a1d93c4707180be5b4fa092.1643282353.git.christophe.leroy@csgroup.eu>
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
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "kgdb-bugreport@lists.sourceforge.net"
 <kgdb-bugreport@lists.sourceforge.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Paul Mackerras <paulus@samba.org>,
 Jessica Yu <jeyu@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 27, 2022 at 11:28:12AM +0000, Christophe Leroy wrote:
> book3s/32 and 8xx have a separate area for allocating modules,
> defined by MODULES_VADDR / MODULES_END.
> 
> On book3s/32, it is not possible to protect against execution
> on a page basis. A full 256M segment is either Exec or NoExec.
> The module area is in an Exec segment while vmalloc area is
> in a NoExec segment.
> 
> In order to protect module data against execution, select
> ARCH_WANTS_MODULES_DATA_IN_VMALLOC.
> 
> For the 8xx (and possibly other 32 bits platform in the future),
> there is no such constraint on Exec/NoExec protection, however
> there is a critical distance between kernel functions and callers
> that needs to remain below 32Mbytes in order to avoid costly
> trampolines. By allocating data outside of module area, we
> increase the chance for module text to remain within acceptable
> distance from kernel core text.
> 
> So select ARCH_WANTS_MODULES_DATA_IN_VMALLOC for 8xx as well.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>

Cc list first and then the SOB.

  Luis
