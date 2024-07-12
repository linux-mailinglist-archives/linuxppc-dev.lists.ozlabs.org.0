Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC4892FA43
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2024 14:27:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Co2V4BjM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WL9ph3m10z3cXT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2024 22:27:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Co2V4BjM;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WL9nX3Fg3z3dBZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jul 2024 22:26:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1720787198;
	bh=y3aYzv3E08GfB0EpusXKM20MT9AQOoPQDNzGPOMTVdI=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=Co2V4BjMcX/7vgmwzvkEZr1aw14sUnlShzS9Kl4XYLI/CPlBJuzENWiJr0LaAUuQb
	 5Rq1q2rDPvbSJ1YAYgU08a4HZ3wXvPI3IjgetuU3olC8OnhS2LlTyoaPk9ym+pE58S
	 UObABJKdLCh2UwQqXCMD+iD/FUJIdJ9VVV9eLni4lXsif1Ole5T+oVEIc2MzvXRAkR
	 dZVfKo9PbCLDzZyRn2eaAZDq0nN9zt672hBIQcLnonXlMWFIBnGrEZ/ksdeICD5xpX
	 0vAu+ZIF8Ja30ubpJC+fE+b72H6qZ+2BavN1T8n0hkN11amwpuxhp0uuabUwALmEPr
	 LWDATLrj4zR2w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WL9nV3m8Hz4x1y;
	Fri, 12 Jul 2024 22:26:38 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Jocelyn Falempe <jfalempe@redhat.com>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Kees Cook <kees@kernel.org>, Tony Luck
 <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Petr
 Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, John
 Ogness <john.ogness@linutronix.de>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Jocelyn Falempe <jfalempe@redhat.com>, Andrew
 Morton <akpm@linux-foundation.org>, Jani Nikula <jani.nikula@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kefeng Wang
 <wangkefeng.wang@huawei.com>, Thomas Gleixner <tglx@linutronix.de>, Uros
 Bizjak <ubizjak@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-hyperv@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2] printk: Add a short description string to kmsg_dump()
In-Reply-To: <20240702122639.248110-1-jfalempe@redhat.com>
References: <20240702122639.248110-1-jfalempe@redhat.com>
Date: Fri, 12 Jul 2024 22:26:38 +1000
Message-ID: <87y1664wzl.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jocelyn Falempe <jfalempe@redhat.com> writes:
> kmsg_dump doesn't forward the panic reason string to the kmsg_dumper
> callback.
> This patch adds a new struct kmsg_dump_detail, that will hold the
> reason and description, and pass it to the dump() callback.
>
> To avoid updating all kmsg_dump() call, it adds a kmsg_dump_desc()
> function and a macro for backward compatibility.
>
> I've written this for drm_panic, but it can be useful for other
> kmsg_dumper.
> It allows to see the panic reason, like "sysrq triggered crash"
> or "VFS: Unable to mount root fs on xxxx" on the drm panic screen.
>
> v2:
>  * Use a struct kmsg_dump_detail to hold the reason and description
>    pointer, for more flexibility if we want to add other parameters.
>    (Kees Cook)
>  * Fix powerpc/nvram_64 build, as I didn't update the forward
>    declaration of oops_to_nvram()
>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>  arch/powerpc/kernel/nvram_64.c             |  8 ++++----
>  arch/powerpc/platforms/powernv/opal-kmsg.c |  4 ++--

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers
