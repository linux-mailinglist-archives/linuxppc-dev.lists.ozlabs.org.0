Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2661E35AA59
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Apr 2021 04:45:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FHK9m6KhFz3c1X
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Apr 2021 12:45:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=Exz1xebH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=willy@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=Exz1xebH; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FHK9H4G7zz2y8F
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Apr 2021 12:45:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=kSBfGQGdldHOGZqey2pG91Lm4sBchHdpUdkbO6By1YI=; b=Exz1xebH0z4i/y6qs7XFO141Qk
 eRdSApUIFaSir1NyVFycHEYEbOXEp95qDIa230dForIUOhOrcL8b410X67OZZNpDdPq7jmGPKucr7
 Jm/mNgBVC4BZbhVGO7ZiGnxsB72BAayKt8FYPWcUkpAAo/QYX9jaHmqnmcaOOEaZUAvoCv7+YoC+d
 azojKss4OD+27TdGNupRux2mmMjSbuKCdgisakoI1PTwZoivDI2KZGt9qSU6szreGgStQJ6HXtug+
 4dyr/8D2BnK5laEKba2tcv99gMP977IVwZBCOGjK+KP98CtMI/JYoGJ42Sjy4kn89qoYCE05lmJgV
 2L/4kfhQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lV3ab-001Esh-RM; Sat, 10 Apr 2021 02:43:27 +0000
Date: Sat, 10 Apr 2021 03:43:13 +0100
From: Matthew Wilcox <willy@infradead.org>
To: kernel test robot <lkp@intel.com>
Subject: Bogus struct page layout on 32-bit
Message-ID: <20210410024313.GX2531743@casper.infradead.org>
References: <20210409185105.188284-3-willy@infradead.org>
 <202104100656.N7EVvkNZ-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202104100656.N7EVvkNZ-lkp@intel.com>
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
Cc: kbuild-all@lists.01.org, clang-built-linux@googlegroups.com,
 Jesper Dangaard Brouer <brouer@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Apr 10, 2021 at 06:45:35AM +0800, kernel test robot wrote:
> >> include/linux/mm_types.h:274:1: error: static_assert failed due to requirement '__builtin_offsetof(struct page, lru) == __builtin_offsetof(struct folio, lru)' "offsetof(struct page, lru) == offsetof(struct folio, lru)"
>    FOLIO_MATCH(lru, lru);
>    include/linux/mm_types.h:272:2: note: expanded from macro 'FOLIO_MATCH'
>            static_assert(offsetof(struct page, pg) == offsetof(struct folio, fl))

Well, this is interesting.  pahole reports:

struct page {
        long unsigned int          flags;                /*     0     4 */
        /* XXX 4 bytes hole, try to pack */
        union {
                struct {
                        struct list_head lru;            /*     8     8 */
...
struct folio {
        union {
                struct {
                        long unsigned int flags;         /*     0     4 */
                        struct list_head lru;            /*     4     8 */

so this assert has absolutely done its job.

But why has this assert triggered?  Why is struct page layout not what
we thought it was?  Turns out it's the dma_addr added in 2019 by commit
c25fff7171be ("mm: add dma_addr_t to struct page").  On this particular
config, it's 64-bit, and ppc32 requires alignment to 64-bit.  So
the whole union gets moved out by 4 bytes.

Unfortunately, we can't just fix this by putting an 'unsigned long pad'
in front of it.  It still aligns the entire union to 8 bytes, and then
it skips another 4 bytes after the pad.

We can fix it like this ...

+++ b/include/linux/mm_types.h
@@ -96,11 +96,12 @@ struct page {
                        unsigned long private;
                };
                struct {        /* page_pool used by netstack */
+                       unsigned long _page_pool_pad;
                        /**
                         * @dma_addr: might require a 64-bit value even on
                         * 32-bit architectures.
                         */
-                       dma_addr_t dma_addr;
+                       dma_addr_t dma_addr __packed;
                };
                struct {        /* slab, slob and slub */
                        union {

but I don't know if GCC is smart enough to realise that dma_addr is now
on an 8 byte boundary and it can use a normal instruction to access it,
or whether it'll do something daft like use byte loads to access it.

We could also do:

+                       dma_addr_t dma_addr __packed __aligned(sizeof(void *));

and I see pahole, at least sees this correctly:

                struct {
                        long unsigned int _page_pool_pad; /*     4     4 */
                        dma_addr_t dma_addr __attribute__((__aligned__(4))); /*     8     8 */
                } __attribute__((__packed__)) __attribute__((__aligned__(4)));  

This presumably affects any 32-bit architecture with a 64-bit phys_addr_t
/ dma_addr_t.  Advice, please?
