Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7646E5AC1D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jun 2019 17:17:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45bcgQ1DsczDqtj
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Jun 2019 01:17:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="NroLZ76O"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45bcdm4gK5zDqrT
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Jun 2019 01:15:40 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id m30so4401261pff.8
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jun 2019 08:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=GttoCpwXZ0YnEgD480v+8xB8TagEdr3d83SlTOyEyRY=;
 b=NroLZ76Oo2crKQBJo8fp4wAzbrnPDUyi6puDLTX4qr11cTGH0bOeLepMhvdQwo020B
 6pSoWWR3kH9ARotFu1VoLKq6TSkJTxnPuTI+vnkbouCiYTmlB0siA0LLLwkSWELVY4CK
 B+AHB27xD0ZZtvlZYod6I2Kb2OBLCXiVyLpVClEMHQnK9lP8gLwCCqFYFsjv0bK9djvg
 Ip/SsNDsbNHaOhOd02uWeVmcEQMegCbYeZeUFqCm22rmEQRnUUfF69IsdbjxePKKKYqS
 xiuv7ChyahFmSIJuO7fdh+Iu669GD3DcuLWeVzI495UDhi+Douu8YoWlFVimf0oV7mWe
 xUDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=GttoCpwXZ0YnEgD480v+8xB8TagEdr3d83SlTOyEyRY=;
 b=PjQdZ7a/pDtEf0Rlbj1iHGl2yHbQ0VrrbOMLAY95+bA4Ag20diAOYZyZzVuzu/rhwf
 4Q1zb5RwJySr6V/uTBK5Yddq20g6ESPYP+UAucarlxsql76gbRiMrhHIUv86hrdFtJPi
 gBA8KSUQ6RpXwmRYJDr198BgogFtUtjUjsAh/wyxOYk3YESZ6egj2lT6HtVEodQwCtC2
 Yfah2fzM1fvaE6sG/CzvBaQkO3dgfbH7YsD51vnWUoa2vj9mNEIHaEaxGp+WGIOOT2J9
 JUoV6WsJ0vEO5qsrHJkAU8O+daT/bwQpxCJJjgYxElq9NTPSvSm/GMFxCvouSzhUcNwh
 oZUQ==
X-Gm-Message-State: APjAAAXY7nb6Ao5IIQv6DzLS45QM2nnK49wNmjUlExij2eRrYImgs0tn
 TGxsvjx1gGudHOUTz15AKC8=
X-Google-Smtp-Source: APXvYqyVpBWX0MYstsM24PSiU2G6Tv937ge94evRwlPCysvJPgEe57082Y4skMOs3eYeU4vWifx+4w==
X-Received: by 2002:a63:4e58:: with SMTP id o24mr14663917pgl.366.1561821337246; 
 Sat, 29 Jun 2019 08:15:37 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id 85sm8120381pfv.130.2019.06.29.08.15.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 29 Jun 2019 08:15:36 -0700 (PDT)
Date: Sat, 29 Jun 2019 08:15:35 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 06/16] sh: use the generic get_user_pages_fast code
Message-ID: <20190629151535.GA18067@roeck-us.net>
References: <20190625143715.1689-1-hch@lst.de>
 <20190625143715.1689-7-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190625143715.1689-7-hch@lst.de>
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
 Paul Burton <paul.burton@mips.com>, Paul Mackerras <paulus@samba.org>,
 Andrey Konovalov <andreyknvl@google.com>, sparclinux@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 25, 2019 at 04:37:05PM +0200, Christoph Hellwig wrote:
> The sh code is mostly equivalent to the generic one, minus various
> bugfixes and two arch overrides that this patch adds to pgtable.h.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

sh:defconfig no longer builds with this patch applied.

mm/gup.c: In function 'gup_huge_pud':
arch/sh/include/asm/pgtable-3level.h:40:36: error:
	implicit declaration of function 'pud_pfn'; did you mean 'pte_pfn'? 

Bisect log attached.

Guenter

---
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
# good: [59f238b3353caf43b118e1bb44010aa1abd56d7f] sh: add the missing pud_page definition
git bisect good 59f238b3353caf43b118e1bb44010aa1abd56d7f
# bad: [51bbf54b3f26a85217db720f4e5b01a6c4d3f010] sparc64: add the missing pgd_page definition
git bisect bad 51bbf54b3f26a85217db720f4e5b01a6c4d3f010
# bad: [be748d6e72113580af7e37ad68a0047659e60189] sh: use the generic get_user_pages_fast code
git bisect bad be748d6e72113580af7e37ad68a0047659e60189
# first bad commit: [be748d6e72113580af7e37ad68a0047659e60189] sh: use the generic get_user_pages_fast code
