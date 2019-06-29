Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 648785ABE1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jun 2019 16:39:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45bbr16lghzDqyH
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Jun 2019 00:39:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="rAKEbOdk"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45bbpL4bL4zDqRD
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Jun 2019 00:38:01 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id t7so4843604plr.11
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jun 2019 07:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=q/WnLfKcw4bgj8PTvLZ5KR21ZjQSwCvusHGcEx5GQug=;
 b=rAKEbOdkIsG5iezdMxJDlnhHWZ6TX+1yWAY5gO2joFYEUztOpvLXUDj3XQpZlcSRoJ
 aaTgDmh+fov31z1ZlU18g1oHJurd3arNA+4lgs0uShQ5RQeyBmkx1f2QbqChgC4FLfyO
 Qk5UQI1ziu9TU+34OQD6H9gTf9WPxKLW13QHN0LpKFWtpMCyd3qzpJZvG0MsEzo35NDL
 DPgWADzayBLvfrpkhm6bKxuLIFRNdMAcB1TdJRevgvj9zL39U9Y+bW4EPa24IIb1EbsJ
 4gnmjPDAGmmRUnCy1ZW5yPoHxFS6XFK3RARTcFC74FrXdeYShwgWWJAqma7HKYx0Ea94
 v/FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=q/WnLfKcw4bgj8PTvLZ5KR21ZjQSwCvusHGcEx5GQug=;
 b=isWhGp4vQpGucydT3iBFbPhjkD/+N8/i8zdjoFHupWDtyUUK5AdEAfHrmsMkO+6kui
 jqSUG2MkOBoXXDf8CZdO9pGvWzzATkVUplaxMep9rMGedc6IU6e4uus1f16yJrAWHGo2
 xxUlB3YEoMFX8x5pPuc28WVna1oYsnu416P8bmrq/haeN3M7NFMItCf/Bwyu//aPyznT
 o1TzKvbnC0kCEOyeEDqw4z802HUrs+dEgOkf1U78HyGFeDx20Hkm56kSuyw1C1+W0f0S
 I5Za3YPemaEWT6U6iRHHHCDtKeP6s+rZav2SR6l9F6yaVOTDLtJ+j1/16vNsV7XEtn/0
 IFaA==
X-Gm-Message-State: APjAAAXsF2qAtdDxut+ONWN7f1rAq0A243QXplNLhYPkPxC6B+Kps8JS
 rNrOPsy2cY8sJct0Gs2wZC8=
X-Google-Smtp-Source: APXvYqz+xA3xb6TeHYv3WmxTaYv+OEXq87pkZgrr1vlf7HTUT1v+Bfg3tjcjqZTIZK8pkcSgrOd/4Q==
X-Received: by 2002:a17:902:d717:: with SMTP id
 w23mr16712586ply.275.1561819079968; 
 Sat, 29 Jun 2019 07:37:59 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id v28sm4720256pga.65.2019.06.29.07.37.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 29 Jun 2019 07:37:59 -0700 (PDT)
Date: Sat, 29 Jun 2019 07:37:57 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 04/16] MIPS: use the generic get_user_pages_fast code
Message-ID: <20190629143757.GA25077@roeck-us.net>
References: <20190625143715.1689-1-hch@lst.de>
 <20190625143715.1689-5-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190625143715.1689-5-hch@lst.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: x86@kernel.org, Rich Felker <dalias@libc.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org,
 James Hogan <jhogan@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Khalid Aziz <khalid.aziz@oracle.com>, Nicholas Piggin <npiggin@gmail.com>,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 Paul Burton <paul.burton@mips.com>, Jason Gunthorpe <jgg@mellanox.com>,
 Paul Mackerras <paulus@samba.org>, Andrey Konovalov <andreyknvl@google.com>,
 sparclinux@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Tue, Jun 25, 2019 at 04:37:03PM +0200, Christoph Hellwig wrote:
> The mips code is mostly equivalent to the generic one, minus various
> bugfixes and an arch override for gup_fast_permitted.
> 
> Note that this defines ARCH_HAS_PTE_SPECIAL for mips as mips has
> pte_special and pte_mkspecial implemented and used in the existing
> gup code.  They are no-op stubs, though which makes me a little unsure
> if this is really right thing to do.
> 
> Note that this also adds back a missing cpu_has_dc_aliases check for
> __get_user_pages_fast, which the old code was only doing for
> get_user_pages_fast.  This clearly looks like an oversight, as any
> condition that makes get_user_pages_fast unsafe also applies to
> __get_user_pages_fast.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Jason Gunthorpe <jgg@mellanox.com>

This patch causes all mips images (mips, mips64, mipsel, mipsel64)
to crash when booting in qemu. Unfortunately the patch can not be
reverted easily since there are context changes, causing build failures
after the revert, so I can not verify if this is the only problem.

Crash log (same for all variants):

...
Run /sbin/init as init process
BUG: Bad page map in process mount  pte:00b70401 pmd:8e5dc000
page:80c24880 refcount:1 mapcount:-1 mapping:00000000 index:0x0
flags: 0x1000(reserved)
raw: 00001000 80c24884 80c24884 00000000 00000000 00000000 fffffffe 00000001
page dumped because: bad pte
addr:(ptrval) vm_flags:04044411 anon_vma:(ptrval) mapping:(ptrval) index:0
qemu-system-mips: terminating on signal 15 from pid 13034 (/bin/bash)

Guenter

---
bisect log:

# bad: [48568d8c7f479ec45b9c3d02b4b1895f3ef61a03] Add linux-next specific files for 20190628
# good: [4b972a01a7da614b4796475f933094751a295a2f] Linux 5.2-rc6
git bisect start 'HEAD' 'v5.2-rc6'
# good: [89a77c9176fe88f68c3bf7bd255cfea6797258d4] Merge remote-tracking branch 'crypto/master'
git bisect good 89a77c9176fe88f68c3bf7bd255cfea6797258d4
# good: [2cedca636ad73ed838bd636685b245404e490c73] Merge remote-tracking branch 'security/next-testing'
git bisect good 2cedca636ad73ed838bd636685b245404e490c73
# good: [ea260819fdc2f8a64e6c87f3ad80ecc5e4015921] Merge remote-tracking branch 'char-misc/char-misc-next'
git bisect good ea260819fdc2f8a64e6c87f3ad80ecc5e4015921
# good: [aca42ca2a32eacf804ac56a33526f049debc8ec0] Merge remote-tracking branch 'rpmsg/for-next'
git bisect good aca42ca2a32eacf804ac56a33526f049debc8ec0
# good: [f4cd0c7f3c07876f7173b5306e974644c6eec141] Merge remote-tracking branch 'pidfd/for-next'
git bisect good f4cd0c7f3c07876f7173b5306e974644c6eec141
# bad: [09c57a8ab1fc3474b4a620247a0f9e3ac61c4cfe] mm/sparsemem: support sub-section hotplug
git bisect bad 09c57a8ab1fc3474b4a620247a0f9e3ac61c4cfe
# good: [aaffcf10880c363870413c5cdee5dfb6a923e9ae] mm: memcontrol: dump memory.stat during cgroup OOM
git bisect good aaffcf10880c363870413c5cdee5dfb6a923e9ae
# bad: [81d90bb2d2784258ed7c0762ecf34d4665198bad] um: switch to generic version of pte allocation
git bisect bad 81d90bb2d2784258ed7c0762ecf34d4665198bad
# bad: [dadae650472841f004882a2409aa844e37809c60] sparc64-add-the-missing-pgd_page-definition-fix
git bisect bad dadae650472841f004882a2409aa844e37809c60
# good: [d1edd06c6ac8c8c49345ff34de1c72ee571f3f7b] mm: memcg/slab: stop setting page->mem_cgroup pointer for slab pages
git bisect good d1edd06c6ac8c8c49345ff34de1c72ee571f3f7b
# good: [b1ceaacca9e63794bd3f574c928e7e6aca01bce7] mm: simplify gup_fast_permitted
git bisect good b1ceaacca9e63794bd3f574c928e7e6aca01bce7
# bad: [59f238b3353caf43b118e1bb44010aa1abd56d7f] sh: add the missing pud_page definition
git bisect bad 59f238b3353caf43b118e1bb44010aa1abd56d7f
# bad: [93a184240a74cb0242b9b970f0bc018c4fdf24fd] MIPS: use the generic get_user_pages_fast code
git bisect bad 93a184240a74cb0242b9b970f0bc018c4fdf24fd
# good: [7c6a77cff73127e9495e345a0903d55b1b0fb323] mm: lift the x86_32 PAE version of gup_get_pte to common code
git bisect good 7c6a77cff73127e9495e345a0903d55b1b0fb323
# first bad commit: [93a184240a74cb0242b9b970f0bc018c4fdf24fd] MIPS: use the generic get_user_pages_fast code
