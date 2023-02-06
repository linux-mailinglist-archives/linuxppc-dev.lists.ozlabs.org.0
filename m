Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BA268BD09
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Feb 2023 13:37:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P9QkZ6BN2z3cd9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Feb 2023 23:37:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux-m68k.org (client-ip=2a02:1800:110:4::f00:11; helo=weierstrass.telenet-ops.be; envelope-from=geert@linux-m68k.org; receiver=<UNKNOWN>)
X-Greylist: delayed 429 seconds by postgrey-1.36 at boromir; Mon, 06 Feb 2023 23:36:40 AEDT
Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be [IPv6:2a02:1800:110:4::f00:11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P9Qk01QBvz3bYW
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Feb 2023 23:36:38 +1100 (AEDT)
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
	by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4P9QYY0jk9z4wxPl
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Feb 2023 13:29:21 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:5f4c:1e23:9c34:1a39])
	by xavier.telenet-ops.be with bizsmtp
	id HoVL290013XDBUl01oVLXF; Mon, 06 Feb 2023 13:29:20 +0100
Received: from geert (helo=localhost)
	by ramsan.of.borg with local-esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1pP0cZ-008DGp-VV;
	Mon, 06 Feb 2023 13:29:19 +0100
Date: Mon, 6 Feb 2023 13:29:19 +0100 (CET)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: linux-kernel@vger.kernel.org
Subject: Re: Build regressions/improvements in v6.2-rc7
In-Reply-To: <20230206122557.3512171-1-geert@linux-m68k.org>
Message-ID: <9765d21e-f53-64d-5862-f49b996c36b@linux-m68k.org>
References: <CAHk-=whSVeeQN9vO-WSxFkNs0zbUJEBqND-1VO8OJtmu_sn_nw@mail.gmail.com> <20230206122557.3512171-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 6 Feb 2023, Geert Uytterhoeven wrote:
> JFYI, when comparing v6.2-rc7[1] to v6.2-rc6[3], the summaries are:
>  - build errors: +1/-1

   + /kisskb/src/arch/powerpc/kexec/file_load_64.c: error: implicit declaration of function 'memory_hotplug_max' [-Werror=implicit-function-declaration]:  => 993:33

powerpc-gcc1[12]/pseries_le_defconfig+NO_NUMA (fix available)

> [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/4ec5183ec48656cec489c49f989c508b68b518e3/ (all 152 configs)
> [3] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/6d796c50f84ca79f1722bb131799e5a5710c4700/ (all 152 configs)

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds
