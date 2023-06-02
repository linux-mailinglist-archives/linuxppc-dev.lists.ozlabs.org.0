Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59375720A9E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jun 2023 22:57:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QXwLM757hz3fWY
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Jun 2023 06:57:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Cmq8DbXv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QXwKN0nlkz3dyH
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Jun 2023 06:56:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-Type:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=2SqHJkZPhjuZg+ziKd3QBDsadGaDIt4/U8jrGZZ9s9I=; b=Cmq8DbXvusWYYhz8U0KCUZT7RJ
	uiQrKUsHH6QvuZ4tAn4QPu/SqHm92Ce6wQt/H6P9zjkBeLr7ag8yBYnCsp8i5k9R57GE16PBdOW1u
	WSxoMyuavHKY5E6v2DYi4fWG1K5MTD0Nf48FTxUiDTV0oVcAy+oojTeAHGmwqftzFBVId2ND0HmWa
	19aK9Ex3w4RFu83O8kzJma+gG6xOxm2iSYqapFAgu7Q8uSliDVQvucku0kBUg3RPSLoKez30XY9y6
	suQRoqaC+PyaVdyADyPw9iByqv6PqkAhl3UuyW+IUAcKFeXBzWXpcNn2wUoJM4xyZaFFv58kvqLI4
	Eh7K9Vdw==;
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1q5Box-007sp2-2z;
	Fri, 02 Jun 2023 20:56:28 +0000
Content-Type: multipart/mixed; boundary="------------Q8WP6yuVgFQhKRz4uaB8HZGh"
Message-ID: <2d188c87-ef34-3812-7330-a985f756d959@infradead.org>
Date: Fri, 2 Jun 2023 13:56:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: linux-next: Tree for Jun 2 (arch/powerpc/kernel/iommu.c)
Content-Language: en-US
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20230602140143.0af52cee@canb.auug.org.au>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230602140143.0af52cee@canb.auug.org.au>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Timothy Pearson <tpearson@raptorengineering.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------Q8WP6yuVgFQhKRz4uaB8HZGh
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/1/23 21:01, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20230601:
> 

On powerpc64, a randconfig failed with:

In file included from ../include/linux/list.h:5,
                 from ../include/linux/preempt.h:11,
                 from ../include/linux/spinlock.h:56,
                 from ../include/linux/mmzone.h:8,
                 from ../include/linux/gfp.h:7,
                 from ../include/linux/slab.h:15,
                 from ../arch/powerpc/kernel/iommu.c:15:
../arch/powerpc/kernel/iommu.c: In function 'spapr_tce_setup_phb_iommus_initcall':
../arch/powerpc/kernel/iommu.c:1391:36: error: 'hose_list' undeclared (first use in this function); did you mean 'zonelist'?
 1391 |         list_for_each_entry(hose, &hose_list, list_node) {
      |                                    ^~~~~~~~~
../include/linux/container_of.h:19:33: note: in definition of macro 'container_of'
   19 |         void *__mptr = (void *)(ptr);                                   \
      |                                 ^~~
../include/linux/list.h:531:9: note: in expansion of macro 'list_entry'
  531 |         list_entry((ptr)->next, type, member)
      |         ^~~~~~~~~~
../include/linux/list.h:689:20: note: in expansion of macro 'list_first_entry'
  689 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
      |                    ^~~~~~~~~~~~~~~~
../arch/powerpc/kernel/iommu.c:1391:9: note: in expansion of macro 'list_for_each_entry'
 1391 |         list_for_each_entry(hose, &hose_list, list_node) {
      |         ^~~~~~~~~~~~~~~~~~~
../arch/powerpc/kernel/iommu.c:1391:36: note: each undeclared identifier is reported only once for each function it appears in
 1391 |         list_for_each_entry(hose, &hose_list, list_node) {
      |                                    ^~~~~~~~~
../include/linux/container_of.h:19:33: note: in definition of macro 'container_of'
   19 |         void *__mptr = (void *)(ptr);                                   \
      |                                 ^~~
../include/linux/list.h:531:9: note: in expansion of macro 'list_entry'
  531 |         list_entry((ptr)->next, type, member)
      |         ^~~~~~~~~~
../include/linux/list.h:689:20: note: in expansion of macro 'list_first_entry'
  689 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
      |                    ^~~~~~~~~~~~~~~~
../arch/powerpc/kernel/iommu.c:1391:9: note: in expansion of macro 'list_for_each_entry'
 1391 |         list_for_each_entry(hose, &hose_list, list_node) {
      |         ^~~~~~~~~~~~~~~~~~~
In file included from ../include/linux/init.h:5,
                 from ../arch/powerpc/kernel/iommu.c:13:
./../include/linux/compiler_types.h:338:27: error: expression in static assertion is not an integer
  338 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
      |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
../include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |         ^~~~~~~~~~~~~
../include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
      |                       ^~~~~~~~~~~
../include/linux/list.h:520:9: note: in expansion of macro 'container_of'
  520 |         container_of(ptr, type, member)
      |         ^~~~~~~~~~~~
../include/linux/list.h:531:9: note: in expansion of macro 'list_entry'
  531 |         list_entry((ptr)->next, type, member)
      |         ^~~~~~~~~~
../include/linux/list.h:689:20: note: in expansion of macro 'list_first_entry'
  689 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
      |                    ^~~~~~~~~~~~~~~~
../arch/powerpc/kernel/iommu.c:1391:9: note: in expansion of macro 'list_for_each_entry'
 1391 |         list_for_each_entry(hose, &hose_list, list_node) {
      |         ^~~~~~~~~~~~~~~~~~~


CONFIG_IOMMU_API=y
# CONFIG_IOMMU_SUPPORT is not set
CONFIG_IOMMU_HELPER=y


Full randconfig file is attached.

-- 
~Randy
--------------Q8WP6yuVgFQhKRz4uaB8HZGh
Content-Type: application/gzip; name="config-r9531.gz"
Content-Disposition: attachment; filename="config-r9531.gz"
Content-Transfer-Encoding: base64

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


--------------Q8WP6yuVgFQhKRz4uaB8HZGh--
