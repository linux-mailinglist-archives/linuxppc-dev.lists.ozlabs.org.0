Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E971D1C2E92
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 May 2020 20:44:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49FZfN2nrmzDqgP
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 May 2020 04:44:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=tHOaBm8E; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49FZcV1mjvzDqfk
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 May 2020 04:43:05 +1000 (AEST)
Received: by mail-pj1-x1042.google.com with SMTP id e6so2700083pjt.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 03 May 2020 11:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=wvVr5SRWd1uM2iASOWr26/V96EQuni36LaEArjGu2yc=;
 b=tHOaBm8EnptFt30keOnpprn8KhxKNzh6R0uPpyb1/rQuektkLELMWaypzeGcgTIVgR
 3UFfvYWgiSmpZIhlFEQKqcyjKBxg1/t8/Y2FUk1xkUzRlVrfCGGvoEU11LVkySVMmyw+
 ek2h6QxLoNqNQKleOx6DiipBVGyOAGrtp6ZywnFwrPRZjfybS8wRFPnhztpi6OcGeJY2
 Mkmm5rfuXuxkHuwSdMuxQQ2FgTzlOjtkfOXkgQCsQIcNy4lzW0PJuB4I6iZREr3IhRcZ
 PUk2AVK6p55JTc4UcjBV5jf88EeIcXzGksAaHrFL4PFooS/sx52k9C7zwPTzsAmmBZiN
 k9Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=wvVr5SRWd1uM2iASOWr26/V96EQuni36LaEArjGu2yc=;
 b=OnCOK7zuSabsXKoI8ycq8meOZTwf5NIEJ8HZ87+O56kbQJg7i2VoDPFZhLKv5joKL0
 wMHIHA7PxbR5Rf9UlOUYD9Zbu28vFFzkuIAhVRpaHiqHC73i/jXUEBu7i1YoiQJPweZ5
 Sw30oK+BPF8EuM3AWFXC/RCZZyJrlMEOgKglmsPEW2BIq1AOig6133vZsZfoCMN/GIc0
 dZpFX4RFkDtzhZOqQCJ6QKENPdxw8tQodUOfn/VDwLXU7kNVpa52gTRGGD9v0HXDnY1g
 l8DxeQn3pCCSxX2LXY3ighUWNXY2euKrLXC50MO6KPBd57uLaGeJQdk7/K/otT8gnmgS
 2E7w==
X-Gm-Message-State: AGi0PuYGmaV9vl7ADeFss2MuawD3FiFzNB4M7JxBPd3t4yKa4/4IhkWO
 PEUIy1EAIXPA3az96hTfiwM=
X-Google-Smtp-Source: APiQypLgkse+/uISWA8vmmT+25UVnwu7GijQSoPFykENXegkn7VLCF7eLD/Cy4r98zb82iwUanJgAA==
X-Received: by 2002:a17:902:ed4a:: with SMTP id
 y10mr14093460plb.227.1588531382473; 
 Sun, 03 May 2020 11:43:02 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id x18sm7016715pfi.22.2020.05.03.11.43.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 03 May 2020 11:43:01 -0700 (PDT)
Date: Sun, 3 May 2020 11:43:00 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v2 17/20] mm: free_area_init: allow defining max_zone_pfn
 in descending order
Message-ID: <20200503184300.GA154219@roeck-us.net>
References: <20200429121126.17989-1-rppt@kernel.org>
 <20200429121126.17989-18-rppt@kernel.org>
 <20200503174138.GA114085@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200503174138.GA114085@roeck-us.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, x86@kernel.org,
 Michal Hocko <mhocko@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 Ley Foon Tan <ley.foon.tan@intel.com>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, Greg Ungerer <gerg@linux-m68k.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Baoquan He <bhe@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-hexagon@vger.kernel.org,
 Helge Deller <deller@gmx.de>, linux-sh@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Hoan Tran <Hoan@os.amperecomputing.com>, Mark Salter <msalter@redhat.com>,
 Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 Nick Hu <nickhu@andestech.com>, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org, linux-mips@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, linux-m68k@lists.linux-m68k.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Qian Cai <cai@lca.pw>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Stafford Horne <shorne@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 linux-arm-kernel@lists.infradead.org, Michal Simek <monstr@monstr.eu>,
 Tony Luck <tony.luck@intel.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-parisc@vger.kernel.org, linux-mm@kvack.org,
 Vineet Gupta <vgupta@synopsys.com>, Brian Cain <bcain@codeaurora.org>,
 linux-kernel@vger.kernel.org, openrisc@lists.librecores.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, May 03, 2020 at 10:41:38AM -0700, Guenter Roeck wrote:
> Hi,
> 
> On Wed, Apr 29, 2020 at 03:11:23PM +0300, Mike Rapoport wrote:
> > From: Mike Rapoport <rppt@linux.ibm.com>
> > 
> > Some architectures (e.g. ARC) have the ZONE_HIGHMEM zone below the
> > ZONE_NORMAL. Allowing free_area_init() parse max_zone_pfn array even it is
> > sorted in descending order allows using free_area_init() on such
> > architectures.
> > 
> > Add top -> down traversal of max_zone_pfn array in free_area_init() and use
> > the latter in ARC node/zone initialization.
> > 
> > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> 
> This patch causes my microblazeel qemu boot test in linux-next to fail.
> Reverting it fixes the problem.
> 
The same problem is seen with s390 emulations.

Guenter

> qemu command line:
> 
> qemu-system-microblazeel -M petalogix-ml605 -m 256 \
> 	-kernel arch/microblaze/boot/linux.bin -no-reboot \
> 	-initrd rootfs.cpio \
> 	-append 'panic=-1 slub_debug=FZPUA rdinit=/sbin/init console=ttyS0,115200' \
> 	-monitor none -serial stdio -nographic
> 
> initrd:
> 	https://github.com/groeck/linux-build-test/blob/master/rootfs/microblazeel/rootfs.cpio.gz
> configuration:
> 	https://github.com/groeck/linux-build-test/blob/master/rootfs/microblazeel/qemu_microblazeel_ml605_defconfig
> 
> Bisect log is below.
> 
> Guenter
> 
> ---
> # bad: [fb9d670f57e3f6478602328bbbf71138be06ca4f] Add linux-next specific files for 20200501
> # good: [6a8b55ed4056ea5559ebe4f6a4b247f627870d4c] Linux 5.7-rc3
> git bisect start 'HEAD' 'v5.7-rc3'
> # good: [068b80b68a670f0b17288c8a3d1ee751f35162ab] Merge remote-tracking branch 'drm/drm-next'
> git bisect good 068b80b68a670f0b17288c8a3d1ee751f35162ab
> # good: [46c70fc6a3ac35cd72ddad248dcbe4eee716d2a5] Merge remote-tracking branch 'drivers-x86/for-next'
> git bisect good 46c70fc6a3ac35cd72ddad248dcbe4eee716d2a5
> # good: [f39c4ad479a2f005f972a2b941b40efa6b9c9349] Merge remote-tracking branch 'rpmsg/for-next'
> git bisect good f39c4ad479a2f005f972a2b941b40efa6b9c9349
> # bad: [165d3ee0162fe28efc2c8180176633e33515df15] ipc-convert-ipcs_idr-to-xarray-update
> git bisect bad 165d3ee0162fe28efc2c8180176633e33515df15
> # good: [001f1d211ed2ed0f005838dc4390993930bbbd69] mm: remove early_pfn_in_nid() and CONFIG_NODES_SPAN_OTHER_NODES
> git bisect good 001f1d211ed2ed0f005838dc4390993930bbbd69
> # bad: [aaad7401bd32f10c1d591dd886b3a9b9595c6d77] mm/vmsan: fix some typos in comment
> git bisect bad aaad7401bd32f10c1d591dd886b3a9b9595c6d77
> # bad: [09f9d0ab1fbed85623b283995aa7a7d78daa1611] khugepaged: allow to collapse PTE-mapped compound pages
> git bisect bad 09f9d0ab1fbed85623b283995aa7a7d78daa1611
> # bad: [c942fc8a3e5088407bc32d94f554bab205175f8a] mm/vmstat.c: do not show lowmem reserve protection information of empty zone
> git bisect bad c942fc8a3e5088407bc32d94f554bab205175f8a
> # bad: [b29358d269ace3826d8521bea842fc2984cfc11b] mm/page_alloc.c: rename free_pages_check() to check_free_page()
> git bisect bad b29358d269ace3826d8521bea842fc2984cfc11b
> # bad: [be0fb591a1f1df20a00c8f023f9ca4891f177b0d] mm: simplify find_min_pfn_with_active_regions()
> git bisect bad be0fb591a1f1df20a00c8f023f9ca4891f177b0d
> # bad: [c17422a008d36dcf3e9f51469758c5762716cb0a] mm: rename free_area_init_node() to free_area_init_memoryless_node()
> git bisect bad c17422a008d36dcf3e9f51469758c5762716cb0a
> # bad: [51a2f644fd020d5f090044825c388444d11029d5] mm: free_area_init: allow defining max_zone_pfn in descending order
> git bisect bad 51a2f644fd020d5f090044825c388444d11029d5
> # first bad commit: [51a2f644fd020d5f090044825c388444d11029d5] mm: free_area_init: allow defining max_zone_pfn in descending order
