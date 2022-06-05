Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A857053DB1B
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Jun 2022 11:49:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LGBfw4Tz2z3by1
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Jun 2022 19:49:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LGBfS03Qpz2ync
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Jun 2022 19:49:17 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1AB5DD6E;
	Sun,  5 Jun 2022 02:48:44 -0700 (PDT)
Received: from [10.163.37.253] (unknown [10.163.37.253])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 241D53F73D;
	Sun,  5 Jun 2022 02:48:35 -0700 (PDT)
Message-ID: <fe3d0b2b-ebfb-0d95-d79b-632d7ed88959@arm.com>
Date: Sun, 5 Jun 2022 15:18:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 6/6] openrisc/mm: Enable ARCH_HAS_VM_GET_PAGE_PROT
Content-Language: en-US
To: Stafford Horne <shorne@gmail.com>
References: <20220603101411.488970-1-anshuman.khandual@arm.com>
 <20220603101411.488970-7-anshuman.khandual@arm.com> <YpxIENWD3gOkFiG2@antec>
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <YpxIENWD3gOkFiG2@antec>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org, Will Deacon <will@kernel.org>, Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org, x86@kernel.org, linux-csky@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, openrisc@lists.librecores.org, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 6/5/22 11:37, Stafford Horne wrote:
> On Fri, Jun 03, 2022 at 03:44:11PM +0530, Anshuman Khandual wrote:
>> This defines and exports a platform specific custom vm_get_page_prot() via
>> subscribing ARCH_HAS_VM_GET_PAGE_PROT. Subsequently all __SXXX and __PXXX
>> macros can be dropped which are no longer needed.
>>
>> Cc: Jonas Bonn <jonas@southpole.se>
>> Cc: openrisc@lists.librecores.org
>> Cc: linux-kernel@vger.kernel.org
>> Acked-by: Stafford Horne <shorne@gmail.com>
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> 
> Is it possible to retract my Acked-by?  I was following the discussion of this
> new function actually being sub optimal.  So as far as I am concerned all these
> architecture patches should be nak'ed.

Sure, alright. I am planning to redo these arch patches via making
the protection_map[] array private to the platforms but possibly
with a common look up function as Christophe had suggested earlier.
