Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A53D85805EC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 22:48:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LsBw54W0zz3dq9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 06:48:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux-m68k.org (client-ip=2a02:1800:120:4::f00:11; helo=gauss.telenet-ops.be; envelope-from=geert@linux-m68k.org; receiver=<UNKNOWN>)
X-Greylist: delayed 511 seconds by postgrey-1.36 at boromir; Tue, 26 Jul 2022 06:48:14 AEST
Received: from gauss.telenet-ops.be (gauss.telenet-ops.be [IPv6:2a02:1800:120:4::f00:11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LsBvf2VK5z3bZC
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jul 2022 06:48:14 +1000 (AEST)
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
	by gauss.telenet-ops.be (Postfix) with ESMTPS id 4LsBjR5gF4z4wwcx
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jul 2022 22:39:23 +0200 (CEST)
Received: from ramsan.of.borg ([84.195.186.194])
	by xavier.telenet-ops.be with bizsmtp
	id zYfN2700F4C55Sk01YfNAN; Mon, 25 Jul 2022 22:39:23 +0200
Received: from geert (helo=localhost)
	by ramsan.of.borg with local-esmtp (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1oG4rK-005GYD-Hj; Mon, 25 Jul 2022 22:39:22 +0200
Date: Mon, 25 Jul 2022 22:39:22 +0200 (CEST)
From: Geert Uytterhoeven <geert@linux-m68k.org>
X-X-Sender: geert@ramsan.of.borg
To: linux-kernel@vger.kernel.org
Subject: Re: Build regressions/improvements in v5.19-rc8
In-Reply-To: <20220725203417.3446690-1-geert@linux-m68k.org>
Message-ID: <alpine.DEB.2.22.394.2207252237200.1255142@ramsan.of.borg>
References: <CAHk-=wiWwDYxNhnStS0e+p-NTFAQSHvab=2-8LwxunCVuY5-2A@mail.gmail.com> <20220725203417.3446690-1-geert@linux-m68k.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-scsi@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 25 Jul 2022, Geert Uytterhoeven wrote:
> JFYI, when comparing v5.19-rc8[1] to v5.19-rc7[3], the summaries are:
>  - build errors: +1/-5

   + /kisskb/src/include/ufs/ufshci.h: error: initializer element is not constant:  => 245:36

v5.19-rc8/powerpc-gcc5/ppc64_book3e_allmodconfig
v5.19-rc8/powerpc-gcc5/powerpc-allmodconfig
v5.19-rc8/powerpc-gcc5/ppc64le_allmodconfig

Seen before

> [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/e0dccc3b76fb35bb257b4118367a883073d7390e/ (all 135 configs)
> [3] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/ff6992735ade75aae3e35d16b17da1008d753d28/ (all 135 configs)

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds
