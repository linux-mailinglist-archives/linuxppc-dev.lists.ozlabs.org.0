Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F38D6A69BF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Mar 2023 10:25:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRTNp0pyNz3cN5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Mar 2023 20:25:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WhSm/ig2;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WhSm/ig2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WhSm/ig2;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WhSm/ig2;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRTMt6rJ0z2xVr
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Mar 2023 20:24:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677662678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EjLBO2oSAz1qd2pyxymW7NNpmRhL/8rZkZFuY2z88lg=;
	b=WhSm/ig2q3uWy+EUlEyW1FQVhJ2a48IcohyWlvGH7w9IvTn3KvRmJedys4Dvfey9CdB12c
	xRKhKKpnedVMttd9CqA3wiDbKFSWAB5XEBHXqI8o68QmtP8xNQvyBBCk3beGGhl7EoVM/N
	TRT4x/IUtlx5Nkqmdx8dXy6Js3ELuRg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677662678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EjLBO2oSAz1qd2pyxymW7NNpmRhL/8rZkZFuY2z88lg=;
	b=WhSm/ig2q3uWy+EUlEyW1FQVhJ2a48IcohyWlvGH7w9IvTn3KvRmJedys4Dvfey9CdB12c
	xRKhKKpnedVMttd9CqA3wiDbKFSWAB5XEBHXqI8o68QmtP8xNQvyBBCk3beGGhl7EoVM/N
	TRT4x/IUtlx5Nkqmdx8dXy6Js3ELuRg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-280-y6BwrYfuMfy1XckhSv52eQ-1; Wed, 01 Mar 2023 04:24:33 -0500
X-MC-Unique: y6BwrYfuMfy1XckhSv52eQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 41D9A85CBE0;
	Wed,  1 Mar 2023 09:24:32 +0000 (UTC)
Received: from localhost (ovpn-13-180.pek2.redhat.com [10.72.13.180])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F07B52026D76;
	Wed,  1 Mar 2023 09:24:28 +0000 (UTC)
Date: Wed, 1 Mar 2023 17:24:26 +0800
From: Baoquan He <bhe@redhat.com>
To: Matthew Wilcox <willy@infradead.org>,
	Edward Cree <ecree.xilinx@gmail.com>
Subject: Re: [PATCH v5 01/17] asm-generic/iomap.h: remove ARCH_HAS_IOREMAP_xx
 macros
Message-ID: <Y/8Zyjfuypg3EiDd@MiWiFi-R3L-srv>
References: <20230301034247.136007-1-bhe@redhat.com>
 <20230301034247.136007-2-bhe@redhat.com>
 <7bd6db48-ffb1-7eb1-decf-afa8be032970@gmail.com>
 <Y/7eceqZ+89iPm1C@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y/7eceqZ+89iPm1C@casper.infradead.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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
Cc: linux-arch@vger.kernel.org, wangkefeng.wang@huawei.com, arnd@arndb.de, schnelle@linux.ibm.com, netdev@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, hch@infradead.org, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, David.Laight@aculab.com, loongarch@lists.linux.dev, Martin Habets <habetsm.xilinx@gmail.com>, agordeev@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, shorne@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 03/01/23 at 05:11am, Matthew Wilcox wrote:
> On Wed, Mar 01, 2023 at 04:38:10AM +0000, Edward Cree wrote:
> > On 01/03/2023 03:42, Baoquan He wrote:
> > > diff --git a/drivers/net/ethernet/sfc/io.h b/drivers/net/ethernet/sfc/io.h
> > > index 30439cc83a89..07f99ad14bf3 100644
> > > --- a/drivers/net/ethernet/sfc/io.h
> > > +++ b/drivers/net/ethernet/sfc/io.h
> > > @@ -70,7 +70,7 @@
> > >   */
> > >  #ifdef CONFIG_X86_64
> > >  /* PIO is a win only if write-combining is possible */
> > > -#ifdef ARCH_HAS_IOREMAP_WC
> > > +#ifdef ioremap_wc
> > >  #define EFX_USE_PIO 1
> > >  #endif
> > >  #endif
> > 
> > So I don't know how valid what we're doing here is...
> 
> Well, x86 defines ARCH_HAS_IOREMAP_WC unconditionally, so it doesn't
> affect you ... but you raise a good question about how a driver can
> determine if it's actually getting WC memory.

Yeah, this change doesn't affect sfc. Because ARCH_HAS_IOREMAP_WC is used to
make ioremap_wc defined in <asm/io.h> override the default one in
<asm-generic/iomap.h>, this patch has made code have the same effect.

Besides, I have a question still in my mind. Surely this is unrelated to
this patch.

In commit 38d9029a652c (parisc: Define ioremap_uc and ioremap_wc),
ioremap_wc definition was added in arch/parisc/include/asm/io.h, and it
didn't add ARCH_HAS_IOREMAP_WC definition. However, it won't cause
redefinition of ioremap_wc, even though there's "#include <asm-generic/iomap.h>"
at below. I could be dizzy on these io.h and iomap.h.

When I added ioremap_wt and ioremap_np to debug, ioremap_np will
cause redefinition, while ioremap_wt woundn't. Does anyone know what
I am missing?

diff --git a/arch/parisc/include/asm/io.h b/arch/parisc/include/asm/io.h
index c05e781be2f5..20d566eec3b3 100644
--- a/arch/parisc/include/asm/io.h
+++ b/arch/parisc/include/asm/io.h
@@ -127,6 +127,8 @@ static inline void gsc_writeq(unsigned long long val, unsigned long addr)
  */
 void __iomem *ioremap(unsigned long offset, unsigned long size);
 #define ioremap_wc                     ioremap
+#define ioremap_wt                     ioremap
+#define ioremap_np                     ioremap
 #define ioremap_uc                     ioremap
 #define pci_iounmap                    pci_iounmap

