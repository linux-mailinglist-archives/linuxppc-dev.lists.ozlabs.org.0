Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D6B1EDD4E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 08:39:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49cx2r37V9zDqXM
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 16:39:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=JfERwxMX; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49cx140cZjzDqWN
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jun 2020 16:37:59 +1000 (AEST)
Received: from kernel.org (unknown [87.71.78.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EE6B9206C3;
 Thu,  4 Jun 2020 06:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591252677;
 bh=O1a535rP16XFYofg4bMZWQkFl2JLEEYgVYDf/xPj9AA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JfERwxMXEu2kI9XoIT9dWNXO1rREUwNy4knLypfsDDn3RoK04PQ+VcJ9cU4AiLvZ9
 zgKMGrd4au2WatdA8yMk1LlH6XWepwggHO+6JEHEW8/tg+Uifk/2Ah/6wTBJLxUsMO
 hIlar1DcvGQ6J2i69MlWxGfbGkXBQIZ5oY21iu3Y=
Date: Thu, 4 Jun 2020 09:37:45 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Ira Weiny <ira.weiny@intel.com>
Subject: Re: [PATCH] arch/{mips,sparc,microblaze,powerpc}: Don't enable
 pagefault/preempt twice
Message-ID: <20200604063745.GB202650@kernel.org>
References: <20200519165422.GA5838@roeck-us.net>
 <20200519184031.GB3356843@iweiny-DESK2.sc.intel.com>
 <20200519194215.GA71941@roeck-us.net>
 <20200520051315.GA3660833@iweiny-DESK2.sc.intel.com>
 <d86dba19-4f4b-061e-a2c7-4f037e9e2de2@roeck-us.net>
 <20200521174250.GB176262@iweiny-DESK2.sc.intel.com>
 <20200603135736.e7b5ded0082a81ae6d9067a0@linux-foundation.org>
 <20200603211416.GA1740285@iweiny-DESK2.sc.intel.com>
 <3538c8ad-674e-d310-d870-4ef6888092ed@roeck-us.net>
 <20200604062226.GA1740345@iweiny-DESK2.sc.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200604062226.GA1740345@iweiny-DESK2.sc.intel.com>
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
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, linux-csky@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org,
 Guenter Roeck <linux@roeck-us.net>, linux-xtensa@linux-xtensa.org,
 Borislav Petkov <bp@alien8.de>, Al Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christian Koenig <christian.koenig@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 03, 2020 at 11:22:26PM -0700, Ira Weiny wrote:
> On Wed, Jun 03, 2020 at 04:44:17PM -0700, Guenter Roeck wrote:
> 
> With linux-next on sparc I too see the spinlock issue; something like:
> 
> ...
> Starting syslogd: BUG: spinlock recursion on CPU#0, S01syslogd/139
>  lock: 0xf53ef350, .magic: dead4ead, .owner: S01syslogd/139, .owner_cpu: 0
> CPU: 0 PID: 139 Comm: S01syslogd Not tainted 5.7.0-next-20200603 #1
> [f0067d00 : 
> do_raw_spin_lock+0xa8/0xd8 ] 
> [f00d598c : 
> copy_page_range+0x328/0x804 ] 
> [f0025c34 : 
> dup_mm+0x334/0x434 ] 
> [f0027198 : 
> copy_process+0x1248/0x12d4 ] 
> [f00273b8 : 
> _do_fork+0x54/0x30c ] 
> [f00276e4 : 
> do_fork+0x5c/0x6c ] 
> [f000de44 : 
> sparc_do_fork+0x18/0x38 ] 
> [f000b7f4 : 
> do_syscall+0x34/0x40 ] 
> [5010cd4c : 
> 0x5010cd4c ] 
> 
> 
> I'm going to bisect between there and HEAD.

The sparc issue should be fixed by 

https://lore.kernel.org/lkml/20200526173302.377-1-will@kernel.org
 
> Ira

-- 
Sincerely yours,
Mike.
