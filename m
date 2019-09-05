Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EB37EA9914
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2019 05:57:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46P6Mh72NmzDqvW
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2019 13:57:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46P6Kk6NmYzDqQD
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2019 13:55:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46P6Kk1PQwz9s3Z;
 Thu,  5 Sep 2019 13:55:38 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Bart Van Assche <bvanassche@acm.org>, Qian Cai <cai@lca.pw>
Subject: Re: lockdep warning while booting POWER9 PowerNV
In-Reply-To: <9b8b287a-4ae1-ca9b-cff1-6d93672b6893@acm.org>
References: <1567199630.5576.39.camel@lca.pw>
 <9b8b287a-4ae1-ca9b-cff1-6d93672b6893@acm.org>
Date: Thu, 05 Sep 2019 13:55:35 +1000
Message-ID: <87ef0vpfbc.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Peter Zijlstra <peterz@infradead.org>, linuxppc-dev@lists.ozlabs.org,
 Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Bart Van Assche <bvanassche@acm.org> writes:
> On 8/30/19 2:13 PM, Qian Cai wrote:
>> https://raw.githubusercontent.com/cailca/linux-mm/master/powerpc.config
>> 
>> Once in a while, booting an IBM POWER9 PowerNV system (8335-GTH) would generate
>> a warning in lockdep_register_key() at,
>> 
>> if (WARN_ON_ONCE(static_obj(key)))
>> 
>> because
>> 
>> key = 0xc0000000019ad118
>> &_stext = 0xc000000000000000
>> &_end = 0xc0000000049d0000
>> 
>> i.e., it will cause static_obj() returns 1.
>
> (back from a trip)
>
> Hi Qian,
>
> Does this mean that on POWER9 it can happen that a dynamically allocated 
> object has an address that falls between &_stext and &_end?

I thought that was true on all arches due to initmem, but seems not.

I guess we have the same problem as s390 and we need to define
arch_is_kernel_initmem_freed().

Qian, can you try this:

diff --git a/arch/powerpc/include/asm/sections.h b/arch/powerpc/include/asm/sections.h
index 4a1664a8658d..616b1b7b7e52 100644
--- a/arch/powerpc/include/asm/sections.h
+++ b/arch/powerpc/include/asm/sections.h
@@ -5,8 +5,22 @@
 
 #include <linux/elf.h>
 #include <linux/uaccess.h>
+
+#define arch_is_kernel_initmem_freed arch_is_kernel_initmem_freed
+
 #include <asm-generic/sections.h>
 
+extern bool init_mem_is_free;
+
+static inline int arch_is_kernel_initmem_freed(unsigned long addr)
+{
+	if (!init_mem_is_free)
+		return 0;
+
+	return addr >= (unsigned long)__init_begin &&
+		addr < (unsigned long)__init_end;
+}
+
 extern char __head_end[];
 
 #ifdef __powerpc64__


cheers
