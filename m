Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F2431079B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 10:21:18 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DX8zs0czMzDvX3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 20:21:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=vladimir.murzin@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DX8y41MJXzDvWD
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Feb 2021 20:19:35 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 47C6931B;
 Fri,  5 Feb 2021 01:19:32 -0800 (PST)
Received: from [10.57.5.97] (unknown [10.57.5.97])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 87A5C3F73B;
 Fri,  5 Feb 2021 01:19:28 -0800 (PST)
Subject: Re: [PATCH] mm/memtest: Add ARCH_USE_MEMTEST
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
References: <1612498242-31579-1-git-send-email-anshuman.khandual@arm.com>
From: Vladimir Murzin <vladimir.murzin@arm.com>
Message-ID: <a58f1a92-087d-cf90-ce2b-0c88b39a8116@arm.com>
Date: Fri, 5 Feb 2021 09:20:07 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1612498242-31579-1-git-send-email-anshuman.khandual@arm.com>
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
Cc: Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-xtensa@linux-xtensa.org, linux-kernel@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, Max Filippov <jcmvbkbc@gmail.com>,
 Ingo Molnar <mingo@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Anshuman,

On 2/5/21 4:10 AM, Anshuman Khandual wrote:
> early_memtest() does not get called from all architectures. Hence enabling
> CONFIG_MEMTEST and providing a valid memtest=[1..N] kernel command line
> option might not trigger the memory pattern tests as would be expected in
> normal circumstances. This situation is misleading.

Documentation already mentions which architectures support that:

memtest=        [KNL,X86,ARM,PPC] Enable memtest

yet I admit that not all reflected there

> 
> The change here prevents the above mentioned problem after introducing a
> new config option ARCH_USE_MEMTEST that should be subscribed on platforms
> that call early_memtest(), in order to enable the config CONFIG_MEMTEST.
> Conversely CONFIG_MEMTEST cannot be enabled on platforms where it would
> not be tested anyway.
> 

Is that generic pattern? What about other cross arch parameters? Do they already
use similar subscription or they rely on documentation?

I'm not against the patch just want to check if things are consistent...

Cheers
Vladimir
