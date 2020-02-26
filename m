Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE4D170655
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 18:41:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SNQR2mCRzDqlf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 04:41:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=vbabka@suse.cz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.cz
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SNN638MTzDqN5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 04:39:33 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 764CFAC66;
 Wed, 26 Feb 2020 17:39:29 +0000 (UTC)
Subject: Re: [PATCH V2 2/4] mm/vma: Make vma_is_accessible() available for
 general use
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <1582520593-30704-1-git-send-email-anshuman.khandual@arm.com>
 <1582520593-30704-3-git-send-email-anshuman.khandual@arm.com>
From: Vlastimil Babka <vbabka@suse.cz>
Message-ID: <c2a38ca8-1134-6e7d-c10a-658e282fcd4e@suse.cz>
Date: Wed, 26 Feb 2020 18:39:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1582520593-30704-3-git-send-email-anshuman.khandual@arm.com>
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
Cc: Rich Felker <dalias@libc.org>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Paul Burton <paulburton@kernel.org>, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 Guo Ren <guoren@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-m68k@lists.linux-m68k.org, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ralf Baechle <ralf@linux-mips.org>,
 Andy Lutomirski <luto@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Thomas Gleixner <tglx@linutronix.de>, Steven Rostedt <rostedt@goodmis.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/24/20 6:03 AM, Anshuman Khandual wrote:
> Lets move vma_is_accessible() helper to include/linux/mm.h which makes it
> available for general use. While here, this replaces all remaining open
> encodings for VMA access check with vma_is_accessible().
> 
> Cc: Guo Ren <guoren@kernel.org>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: Rich Felker <dalias@libc.org>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: Andy Lutomirski <luto@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: Mel Gorman <mgorman@suse.de>
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-m68k@lists.linux-m68k.org
> Cc: linux-mips@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-sh@vger.kernel.org
> Cc: linux-mm@kvack.org
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Acked-by: Guo Ren <guoren@kernel.org>
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>

Acked-by: Vlastimil Babka <vbabka@suse.cz
