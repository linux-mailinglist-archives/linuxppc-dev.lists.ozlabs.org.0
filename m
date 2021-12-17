Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3430647951E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 20:56:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JG09D6RWCz3cXs
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Dec 2021 06:56:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=ravnborg.org
 (client-ip=91.221.196.228; helo=mx2.smtp.larsendata.com;
 envelope-from=sam@ravnborg.org; receiver=<UNKNOWN>)
X-Greylist: delayed 4506 seconds by postgrey-1.36 at boromir;
 Sat, 18 Dec 2021 06:55:54 AEDT
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JG08p1yzkz3cCS
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Dec 2021 06:55:52 +1100 (AEDT)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id c1a4b68e-5f68-11ec-ac19-0050568cd888;
 Fri, 17 Dec 2021 18:40:07 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id CC460194B7E;
 Fri, 17 Dec 2021 19:39:40 +0100 (CET)
Date: Fri, 17 Dec 2021 19:39:36 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Nikita Yushchenko <nikita.yushchenko@virtuozzo.com>
Subject: Re: [PATCH/RFC] mm: add and use batched version of
 __tlb_remove_table()
Message-ID: <YbzZaFY+ht+bUtcz@ravnborg.org>
References: <20211217081909.596413-1-nikita.yushchenko@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211217081909.596413-1-nikita.yushchenko@virtuozzo.com>
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, Will Deacon <will@kernel.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Vasily Gorbik <gor@linux.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, x86@kernel.org,
 Ingo Molnar <mingo@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>,
 Nick Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
 kernel@openvz.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Nikita,

How about adding the following to tlb.h:

#ifndef __tlb_remove_tables
static void __tlb_remove_tables(...)
{
	....
}
#endif


And then the few archs that want to override __tlb_remove_tables
needs to do a
#define __tlb_remove_tables __tlb_remove_tables
static void __tlb_remove_tables(...)
{
	...
}

In this way the archs that uses the default implementation needs not do
anything.
A few functions already uses this pattern in tlb.h - see for example tlb_start_vma
io.h is another file where you can see the same pattern.

	Sam
