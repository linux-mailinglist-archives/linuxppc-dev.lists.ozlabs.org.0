Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 676C31987A0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 00:53:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rnn43k5HzDqnn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 09:53:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux-foundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=akpm@linux-foundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=z2ihfI3s; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rnlH45pSzDqkZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 09:51:54 +1100 (AEDT)
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net
 [73.231.172.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0C8F620733;
 Mon, 30 Mar 2020 22:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585608711;
 bh=EXmX9dErmlEkFgnbipzAfMRYR83Acb60UF9bDXiz0DI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=z2ihfI3sBMfsr5Wfl0ingXQoY+GET5tztqWSEKsLwaPrr7s+ZlNiSAKTokhw8O+xN
 ZHVynMZSxwgLZ5vqpo7pk6F7cOLNDYCHpT8EuVMpy6pEAuagf741mQ/aHK8qub7GET
 5sfIGbrfC8VOGI745W0EmSJ89zj6DGCdOS5BwtB0=
Date: Mon, 30 Mar 2020 15:51:50 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH 0/2] mm/thp: Rename pmd_mknotpresent() as pmd_mknotvalid()
Message-Id: <20200330155150.750ef923d297c455c7b418e0@linux-foundation.org>
In-Reply-To: <2e67f1b8-d196-89e4-aee1-f552db1433a0@arm.com>
References: <1584680057-13753-1-git-send-email-anshuman.khandual@arm.com>
 <2e67f1b8-d196-89e4-aee1-f552db1433a0@arm.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Ingo Molnar <mingo@redhat.com>, nouveau@lists.freedesktop.org,
 linux-snps-arc@lists.infradead.org, Steven Rostedt <rostedt@goodmis.org>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vineet Gupta <vgupta@synopsys.com>, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 29 Mar 2020 19:12:35 +0530 Anshuman Khandual <anshuman.khandual@arm.com> wrote:

> 
> 
> On 03/20/2020 10:24 AM, Anshuman Khandual wrote:
> > This series renames pmd_mknotpresent() as pmd_mknotvalid(). Before that it
> > drops an existing pmd_mknotpresent() definition from powerpc platform which
> > was never required as it defines it's pmdp_invalidate() through subscribing
> > __HAVE_ARCH_PMDP_INVALIDATE. This does not create any functional change.
> > 
> > This rename was suggested by Catalin during a previous discussion while we
> > were trying to change the THP helpers on arm64 platform for migration.
> > 
> > https://patchwork.kernel.org/patch/11019637/
> > 
> > This series is based on v5.6-rc6.
> > 
> > Boot tested on arm64 and x86 platforms.
> > Built tested on many other platforms including the ones changed here.
> 
> Gentle ping, any updates regarding this ?

We're in the merge window so I have parked this for consideration after
-rc1.

