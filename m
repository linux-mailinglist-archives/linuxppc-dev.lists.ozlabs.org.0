Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E30A51C2E69
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 May 2020 19:43:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49FYHR5qfMzDqkK
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 May 2020 03:43:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=rAOPFuXg; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49FYFm6PZjzDqR0
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 May 2020 03:41:43 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id v63so4393477pfb.10
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 03 May 2020 10:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=E/mr9ZyjU5f7Vr/0eufu9euRQzca2mWViEzdzXjAhKM=;
 b=rAOPFuXgQJ2mpINJ4bZeTHDkrsZEQFsbwUGlrvdK6kp/tJs9EcLfnaWFpQLaMjvlTN
 PpGRnjbVlR/AVFM9AVMPY1HNoRLD+rgpHPyTxpKKlbrj05rCKcKZtY2qpz5bcSW3rVBO
 IocR5gWdH3gQT2RwWqhl/NTjprRC2CBth012R+d19kLQzVIHkQC7ljzq6SUBEAwz0CS8
 BnEP6HirMkFO0ICbg+hSwf+E0KnuOsGeUCXZA18VmuCvpAorlqiIGznMmafOkyr6R+Rc
 Q2PQDp8BGjLWDFmIAM1Oj/Qg5ff8e5fmuTqOOSGH41UE65MVi0GaoynoX/HwzIYTjpMy
 UfXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=E/mr9ZyjU5f7Vr/0eufu9euRQzca2mWViEzdzXjAhKM=;
 b=Ohig+cfDIAwH04v0I9yQ10sEa+1OARPfAglNU0YQNpB2VrqK9Uw8ckj88TB8t9CELq
 Wje8vO7BjGz4gI3re56LahBnzAHTe6xq8gKAszXWn5FLbYPQ7DuaaxX8NxPwkH+yts/B
 Tikr+Zjao2lXnc5B5UagAdqFmqwE83Nujk1k1hsjoZdei9xCcU7pLPRQb/mvn4Y+0IEm
 BJr4vVqbIxFKHkPIasxsXDAxfBe8nlCrvlhe5KYut4gImpwJQnU7X4GqI/61VfsQ0HUo
 O+15mDCvUa1UCYqvdmXQoPHqYXgjVVnriowHcQEQsNNkHULYw389NEfv+5uOLO4HNXFX
 3Kaw==
X-Gm-Message-State: AGi0PuYpq52Ml9PEGV4iIX/gaosR42oV1vbnm7wLakm67tPc69AA4290
 ji4MvR0mD1RFpxDJhj8ROBk=
X-Google-Smtp-Source: APiQypKe5f9UYzoGgygyTvemhYSAj5fxly1sdtXiMOKzeUqRJYW2ZGXxYUOZH0ANd9Z0qgzTnrAvVw==
X-Received: by 2002:aa7:9093:: with SMTP id i19mr13366500pfa.152.1588527699823; 
 Sun, 03 May 2020 10:41:39 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id q97sm4982611pjb.7.2020.05.03.10.41.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 03 May 2020 10:41:39 -0700 (PDT)
Date: Sun, 3 May 2020 10:41:38 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v2 17/20] mm: free_area_init: allow defining max_zone_pfn
 in descending order
Message-ID: <20200503174138.GA114085@roeck-us.net>
References: <20200429121126.17989-1-rppt@kernel.org>
 <20200429121126.17989-18-rppt@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200429121126.17989-18-rppt@kernel.org>
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

Hi,

On Wed, Apr 29, 2020 at 03:11:23PM +0300, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> Some architectures (e.g. ARC) have the ZONE_HIGHMEM zone below the
> ZONE_NORMAL. Allowing free_area_init() parse max_zone_pfn array even it is
> sorted in descending order allows using free_area_init() on such
> architectures.
> 
> Add top -> down traversal of max_zone_pfn array in free_area_init() and use
> the latter in ARC node/zone initialization.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>

This patch causes my microblazeel qemu boot test in linux-next to fail.
Reverting it fixes the problem.

qemu command line:

qemu-system-microblazeel -M petalogix-ml605 -m 256 \
	-kernel arch/microblaze/boot/linux.bin -no-reboot \
	-initrd rootfs.cpio \
	-append 'panic=-1 slub_debug=FZPUA rdinit=/sbin/init console=ttyS0,115200' \
	-monitor none -serial stdio -nographic

initrd:
	https://github.com/groeck/linux-build-test/blob/master/rootfs/microblazeel/rootfs.cpio.gz
configuration:
	https://github.com/groeck/linux-build-test/blob/master/rootfs/microblazeel/qemu_microblazeel_ml605_defconfig

Bisect log is below.

Guenter

---
# bad: [fb9d670f57e3f6478602328bbbf71138be06ca4f] Add linux-next specific files for 20200501
# good: [6a8b55ed4056ea5559ebe4f6a4b247f627870d4c] Linux 5.7-rc3
git bisect start 'HEAD' 'v5.7-rc3'
# good: [068b80b68a670f0b17288c8a3d1ee751f35162ab] Merge remote-tracking branch 'drm/drm-next'
git bisect good 068b80b68a670f0b17288c8a3d1ee751f35162ab
# good: [46c70fc6a3ac35cd72ddad248dcbe4eee716d2a5] Merge remote-tracking branch 'drivers-x86/for-next'
git bisect good 46c70fc6a3ac35cd72ddad248dcbe4eee716d2a5
# good: [f39c4ad479a2f005f972a2b941b40efa6b9c9349] Merge remote-tracking branch 'rpmsg/for-next'
git bisect good f39c4ad479a2f005f972a2b941b40efa6b9c9349
# bad: [165d3ee0162fe28efc2c8180176633e33515df15] ipc-convert-ipcs_idr-to-xarray-update
git bisect bad 165d3ee0162fe28efc2c8180176633e33515df15
# good: [001f1d211ed2ed0f005838dc4390993930bbbd69] mm: remove early_pfn_in_nid() and CONFIG_NODES_SPAN_OTHER_NODES
git bisect good 001f1d211ed2ed0f005838dc4390993930bbbd69
# bad: [aaad7401bd32f10c1d591dd886b3a9b9595c6d77] mm/vmsan: fix some typos in comment
git bisect bad aaad7401bd32f10c1d591dd886b3a9b9595c6d77
# bad: [09f9d0ab1fbed85623b283995aa7a7d78daa1611] khugepaged: allow to collapse PTE-mapped compound pages
git bisect bad 09f9d0ab1fbed85623b283995aa7a7d78daa1611
# bad: [c942fc8a3e5088407bc32d94f554bab205175f8a] mm/vmstat.c: do not show lowmem reserve protection information of empty zone
git bisect bad c942fc8a3e5088407bc32d94f554bab205175f8a
# bad: [b29358d269ace3826d8521bea842fc2984cfc11b] mm/page_alloc.c: rename free_pages_check() to check_free_page()
git bisect bad b29358d269ace3826d8521bea842fc2984cfc11b
# bad: [be0fb591a1f1df20a00c8f023f9ca4891f177b0d] mm: simplify find_min_pfn_with_active_regions()
git bisect bad be0fb591a1f1df20a00c8f023f9ca4891f177b0d
# bad: [c17422a008d36dcf3e9f51469758c5762716cb0a] mm: rename free_area_init_node() to free_area_init_memoryless_node()
git bisect bad c17422a008d36dcf3e9f51469758c5762716cb0a
# bad: [51a2f644fd020d5f090044825c388444d11029d5] mm: free_area_init: allow defining max_zone_pfn in descending order
git bisect bad 51a2f644fd020d5f090044825c388444d11029d5
# first bad commit: [51a2f644fd020d5f090044825c388444d11029d5] mm: free_area_init: allow defining max_zone_pfn in descending order
