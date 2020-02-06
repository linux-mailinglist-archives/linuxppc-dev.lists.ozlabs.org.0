Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4AC154CFE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2020 21:33:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48D99v6dQwzDqbY
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2020 07:33:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=t31A+SbT; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48D98B4nkhzDqYM
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Feb 2020 07:31:52 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id c23so26660plz.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Feb 2020 12:31:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=mPfBWVjSrQlutcw1BrAjL4XXYPCEqBan2GAZ0ciyj6I=;
 b=t31A+SbTqXDM3lEZg4KVayrqxz74VfDSMz0w2WvaMJXsYL+/wwwhrDYGEX2qgqmKyS
 T9ENHQjxDjxiYZAQ35oSiJpV/SQn15eayrkfZJQv9jG0sXDmaERveWlSnAjoDYNh+bbx
 WDpQAd2lWiS0RqL1JIdMx+3Cc9HT6I8SWPZK/Hlt3ZZo16vX0lZ5PD0rmELFccZh70an
 UC8dwfmSlUYELL5HjybT4BbBLDBT20kVPbo5MOWC9WI/bxqb77W4J1rv0/AIdMvHeTQG
 sXirGfv/kByGfH7S/dFS+IkZMUn+NgMFrWwyWWKgJBAXYnmDnVlBjkhI1ILmbIp1rPQC
 IYtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=mPfBWVjSrQlutcw1BrAjL4XXYPCEqBan2GAZ0ciyj6I=;
 b=DgU2SEkQvq0TY+gbB6znUx29bBfY8yAHhlzK1t+uJ5IG6YHgst7879GfJ3vMkIztGg
 NtsnK1IePeVNItDO9p65/SINx6vAv5u3qvlo3Yz66RAOZRSW549R3IPmYVB+mOi3t7l5
 ycrzcgzZu+iSv9II+JwZdB8ye+oV157e2EAdoJ18R/CaHVa9BJiPbVCgLuHUGxo/Uo2N
 8YUjrO6w2dRuC3btqh6m2GYE4xVoRCGKH1sNvg6xmqV7ag4YvOOqDzEaP7K+vnNCODnK
 zr570nrl2qHBPLiQbRlF3a2I9/Hm95QMrw5KQlje9AhmgAiavsDyjBmmmJ05izl6Kmns
 HGNQ==
X-Gm-Message-State: APjAAAVtWw1c8AimunvgBw3NW5A4yPgqWPfdA6PXuqktYx6LapYqD2V2
 5q1ukhbDtLXqz+h80/rclBo=
X-Google-Smtp-Source: APXvYqzUg01IbqeYCsdPP/DQ0kp6K10e48GyKhji0m1indNoTWW7YrDDzFrVl7ixXMHgdWzthxpSVQ==
X-Received: by 2002:a17:90a:a881:: with SMTP id
 h1mr6727767pjq.50.1581021109086; 
 Thu, 06 Feb 2020 12:31:49 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id h13sm161679pjc.9.2020.02.06.12.31.47
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 06 Feb 2020 12:31:48 -0800 (PST)
Date: Thu, 6 Feb 2020 12:31:46 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH v5 17/17] powerpc/32s: Enable CONFIG_VMAP_STACK
Message-ID: <20200206203146.GA23248@roeck-us.net>
References: <cover.1576916812.git.christophe.leroy@c-s.fr>
 <2e2509a242fd5f3e23df4a06530c18060c4d321e.1576916812.git.christophe.leroy@c-s.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e2509a242fd5f3e23df4a06530c18060c4d321e.1576916812.git.christophe.leroy@c-s.fr>
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
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Dec 21, 2019 at 08:32:38AM +0000, Christophe Leroy wrote:
> A few changes to retrieve DAR and DSISR from struct regs
> instead of retrieving them directly, as they may have
> changed due to a TLB miss.
> 
> Also modifies hash_page() and friends to work with virtual
> data addresses instead of physical ones. Same on load_up_fpu()
> and load_up_altivec().
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

This patch results in qemu boot failures (mac99 with pmac32_defconfig).
Images fail silently; there is no console output. Reverting the patch
fixes the problem. Bisect log is attached below.

Assuming this was tested on real hardware, am I correct to assume that qemu
for ppc32 (more specifically, qemu's mac99 and g3beige machines) no longer
works with the upstream kernel ?

Thanks,
Guenter

---
# bad: [33b40134e5cfbbccad7f3040d1919889537a3df7] Merge git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net
# good: [d4e9056daedca3891414fe3c91de3449a5dad0f2] initramfs: do not show compression mode choice if INITRAMFS_SOURCE is empty
git bisect start '33b40134e5cf' 'd4e9056daedc'
# good: [9717c1cea16e3eae81ca226f4c3670bb799b61ad] Merge tag 'drm-next-2020-02-04' of git://anongit.freedesktop.org/drm/drm
git bisect good 9717c1cea16e3eae81ca226f4c3670bb799b61ad
# bad: [4c25df5640ae6e4491ee2c50d3f70c1559ef037d] Merge branch 'topic/user-access-begin' into next
git bisect bad 4c25df5640ae6e4491ee2c50d3f70c1559ef037d
# good: [846a17a53aeeee426cbc1252f517a6660eab1427] powerpc/powernv: Use common code for the symbol_map export
git bisect good 846a17a53aeeee426cbc1252f517a6660eab1427
# good: [afe1ec5ab83029baf0f8368a255dc6b998bde576] powerpc/8xx: Split breakpoint exception
git bisect good afe1ec5ab83029baf0f8368a255dc6b998bde576
# bad: [43e76cd368fbb67e767da5363ffeaa3989993c8c] powerpc: Do not consider weak unresolved symbol relocations as bad
git bisect bad 43e76cd368fbb67e767da5363ffeaa3989993c8c
# bad: [af1725d2493dcad4eeb7e63141678181fcd8a2ff] powerpc/kconfig: Move CONFIG_PPC32 into Kconfig.cputype
git bisect bad af1725d2493dcad4eeb7e63141678181fcd8a2ff
# good: [94dd54c51a410b9ffa6356c3ed2ab0317f998ded] powerpc/32s: Avoid crossing page boundary while changing SRR0/1.
git bisect good 94dd54c51a410b9ffa6356c3ed2ab0317f998ded
# bad: [0f9aee0cb9da7db7d96f63cfa2dc5e4f1bffeb87] powerpc/mm: Don't log user reads to 0xffffffff
git bisect bad 0f9aee0cb9da7db7d96f63cfa2dc5e4f1bffeb87
# bad: [cd08f109e26231b279bcc0388428afcac6408ec6] powerpc/32s: Enable CONFIG_VMAP_STACK
git bisect bad cd08f109e26231b279bcc0388428afcac6408ec6
# first bad commit: [cd08f109e26231b279bcc0388428afcac6408ec6] powerpc/32s: Enable CONFIG_VMAP_STACK
