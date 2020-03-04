Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C9399178A5F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Mar 2020 06:54:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48XNP65xhDzDqYV
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Mar 2020 16:54:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 48XNMc5clnzDqTq
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Mar 2020 16:52:58 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E08EF30E;
 Tue,  3 Mar 2020 21:52:55 -0800 (PST)
Received: from [10.163.1.88] (unknown [10.163.1.88])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DCC5B3F6CF;
 Tue,  3 Mar 2020 21:52:48 -0800 (PST)
Subject: Re: [RFC 2/3] mm/vma: Introduce VM_ACCESS_FLAGS
To: Vlastimil Babka <vbabka@suse.cz>, linux-mm@kvack.org
References: <1583131666-15531-1-git-send-email-anshuman.khandual@arm.com>
 <1583131666-15531-3-git-send-email-anshuman.khandual@arm.com>
 <52b4565f-2dab-c3e5-ead8-d76258f43a10@suse.cz>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <d00c5b01-fb69-3a83-3eae-36231c5b08e9@arm.com>
Date: Wed, 4 Mar 2020 11:22:46 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <52b4565f-2dab-c3e5-ead8-d76258f43a10@suse.cz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, devel@driverdev.osuosl.org,
 linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Mark Salter <msalter@redhat.com>, Rob Springer <rspringer@google.com>,
 Thomas Gleixner <tglx@linutronix.de>, Guan Xuetao <gxt@pku.edu.cn>,
 linux-arm-kernel@lists.infradead.org, Nick Hu <nickhu@andestech.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 nios2-dev@lists.rocketboards.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 03/03/2020 11:18 PM, Vlastimil Babka wrote:
> On 3/2/20 7:47 AM, Anshuman Khandual wrote:
>> There are many places where all basic VMA access flags (read, write, exec)
>> are initialized or checked against as a group. One such example is during
>> page fault. Existing vma_is_accessible() wrapper already creates the notion
>> of VMA accessibility as a group access permissions. Hence lets just create
>> VM_ACCESS_FLAGS (VM_READ|VM_WRITE|VM_EXEC) which will not only reduce code
>> duplication but also extend the VMA accessibility concept in general.
>>
>> Cc: Russell King <linux@armlinux.org.uk>
>> CC: Catalin Marinas <catalin.marinas@arm.com>
>> CC: Mark Salter <msalter@redhat.com>
>> Cc: Nick Hu <nickhu@andestech.com>
>> CC: Ley Foon Tan <ley.foon.tan@intel.com>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Heiko Carstens <heiko.carstens@de.ibm.com>
>> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
>> Cc: Guan Xuetao <gxt@pku.edu.cn>
>> Cc: Dave Hansen <dave.hansen@linux.intel.com>
>> Cc: Thomas Gleixner <tglx@linutronix.de>
>> Cc: Rob Springer <rspringer@google.com>
>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-c6x-dev@linux-c6x.org
>> Cc: nios2-dev@lists.rocketboards.org
>> Cc: linuxppc-dev@lists.ozlabs.org
>> Cc: linux-s390@vger.kernel.org
>> Cc: linux-sh@vger.kernel.org
>> Cc: devel@driverdev.osuosl.org
>> Cc: linux-mm@kvack.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> 
> Dunno. Such mask seems ok for testing flags, but it's a bit awkward when
> initializing flags, where it covers just one of many combinations that seem
> used. But no strong opinions, patch looks correct.

Fair enough. The fact that it covers only one of the many init combinations
used at various places, is indeed a good point. The page fault handlers does
start with VMA flags mask as VM_ACCESS_FLAGS, hence will keep them and drop
other init cases here.
