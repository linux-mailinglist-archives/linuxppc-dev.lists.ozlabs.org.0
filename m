Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C93C19CD4D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 01:04:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tdtd6RBHzDrR1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 10:04:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=russell.cc (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=ruscur@russell.cc;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256
 header.s=fm1 header.b=cwU1XyeB; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=jin3OWCM; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tdrX5wDLzDrQ9
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 10:02:51 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 596A65C00FB;
 Thu,  2 Apr 2020 19:02:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 02 Apr 2020 19:02:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 message-id:subject:from:to:cc:date:in-reply-to:references
 :content-type:mime-version:content-transfer-encoding; s=fm1; bh=
 M3R5y7LjkKWnRuSDdjCJ6HcWtMsBj3KFa+ujqdG6xug=; b=cwU1XyeBe/K9fVaV
 L6WVGuM8RgATQaOVraJdy7gZXc+0AoW0ZSH+spjQ6945LBOnrSqHD+kcyTvlMWKN
 GuxC4MQr6ewP58+Ys5h/u6LulOZa95ZcA737TgDolgt4ZHdQqTH0nQQGOb9KJRsj
 1YV7+SCkipVNPup3YAUtL8SW5mcVkmzhj0Z2R/vrYmhIjnmCgSjv9W/DDM8vM1wm
 Fz/poSYGl8D/g38aFz1t9otUbVHUi/UPvyT+kT0Y5CDbOcWotVFzKvkqf32NFcaD
 XgtvYX5YanOll9yi7CdSvHz07jqy8XBQtyrjMJuBAwQhoO2xrQstB4mzhX2QrRJD
 IYD38A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=M3R5y7LjkKWnRuSDdjCJ6HcWtMsBj3KFa+ujqdG6x
 ug=; b=jin3OWCM4S6UvPS8B5qB0y9gYBFtA4Y8U/JBkHGC2UoTikLhrsisVeTcF
 rJpvLiV9N+uJQ6WB6MPL1ABeivsvnsgXhKmQsT8zThDtbUn3Sdbpq3dNvgnvDagg
 AZtpa+Eu0iyFOTBaxJ181DZbPbA/NRa9XFiwWJWpsyBg9HZrPn0KIX1Orm/QmM5Z
 VNLfhK4tfFdEl/QTis/41/3JDhuVebuoMfGMNVubvPsAQOgWcmK0Fr2JWI3Fvznj
 qq4p9QXxGcYIGEhE0CG3Jq+NhicM1oT0P6MrOoUGwkVGBMLW26p/RtVeJtJB9evA
 BJCzwdPf0GnuUVHFT5GsU8r6tAVEg==
X-ME-Sender: <xms:Fm-GXnxvJQ0GGsT_ePXKnVNLnhxuVq5Ypwosmdo9k-I6Vka_asIuaw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrtdehgdduiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculddutddmnecujfgurhepkffuhf
 fvffgjfhgtfggggfesthejredttderjeenucfhrhhomheptfhushhsvghllhcuvehurhhr
 vgihuceorhhushgtuhhrsehruhhsshgvlhhlrdgttgeqnecukfhppeduvddurdeghedrvd
 duvddrvdefleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehruhhstghurhesrhhushhsvghllhdrtggt
X-ME-Proxy: <xmx:Fm-GXkY-sK9s2Vq1rfOpg1aNAXz6j8sAWTYntOPNizRawjTQT0DdHQ>
 <xmx:Fm-GXi0crtWH9hL0QDzfAYnc0mxjxgFRZUpIYYslLLOl4UMUijBEyA>
 <xmx:Fm-GXi6OG-5V77bR0tAJ5ECCLJqcmyL6CHS7Lfoz7qlsMU1l-wsQyw>
 <xmx:F2-GXgQrKT77E88EH4HmWgpXqQzCf6EHgj9K5XH7G7W1n7xE3-j6Ew>
Received: from crackle.ozlabs.ibm.com
 (ppp121-45-212-239.bras1.cbr2.internode.on.net [121.45.212.239])
 by mail.messagingengine.com (Postfix) with ESMTPA id B8E4F3280066;
 Thu,  2 Apr 2020 19:02:44 -0400 (EDT)
Message-ID: <ecaa9bb115f5673e828a7c4546b22802d8775939.camel@russell.cc>
Subject: Re: [PATCH v8 2/7] powerpc/kprobes: Mark newly allocated probes as RO
From: Russell Currey <ruscur@russell.cc>
To: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
 linuxppc-dev@lists.ozlabs.org
Date: Fri, 03 Apr 2020 10:02:41 +1100
In-Reply-To: <1585852977.oiikywo1jz.naveen@linux.ibm.com>
References: <20200402084053.188537-1-ruscur@russell.cc>
 <20200402084053.188537-2-ruscur@russell.cc>
 <1585844035.o235bvxmq0.naveen@linux.ibm.com>
 <1585852977.oiikywo1jz.naveen@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.1 
MIME-Version: 1.0
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
Cc: kernel-hardening@lists.openwall.com, ajd@linux.ibm.com, npiggin@gmail.com,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2020-04-03 at 00:18 +0530, Naveen N. Rao wrote:
> Naveen N. Rao wrote:
> > Russell Currey wrote:
> > > With CONFIG_STRICT_KERNEL_RWX=y and CONFIG_KPROBES=y, there will
> > > be one
> > > W+X page at boot by default.  This can be tested with
> > > CONFIG_PPC_PTDUMP=y and CONFIG_PPC_DEBUG_WX=y set, and checking
> > > the
> > > kernel log during boot.
> > > 
> > > powerpc doesn't implement its own alloc() for kprobes like other
> > > architectures do, but we couldn't immediately mark RO anyway
> > > since we do
> > > a memcpy to the page we allocate later.  After that, nothing
> > > should be
> > > allowed to modify the page, and write permissions are removed
> > > well
> > > before the kprobe is armed.
> > > 
> > > The memcpy() would fail if >1 probes were allocated, so use
> > > patch_instruction() instead which is safe for RO.
> > > 
> > > Reviewed-by: Daniel Axtens <dja@axtens.net>
> > > Signed-off-by: Russell Currey <ruscur@russell.cc>
> > > Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> > > ---
> > >  arch/powerpc/kernel/kprobes.c | 17 +++++++++++++----
> > >  1 file changed, 13 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/arch/powerpc/kernel/kprobes.c
> > > b/arch/powerpc/kernel/kprobes.c
> > > index 81efb605113e..fa4502b4de35 100644
> > > --- a/arch/powerpc/kernel/kprobes.c
> > > +++ b/arch/powerpc/kernel/kprobes.c
> > > @@ -24,6 +24,8 @@
> > >  #include <asm/sstep.h>
> > >  #include <asm/sections.h>
> > >  #include <linux/uaccess.h>
> > > +#include <linux/set_memory.h>
> > > +#include <linux/vmalloc.h>
> > >  
> > >  DEFINE_PER_CPU(struct kprobe *, current_kprobe) = NULL;
> > >  DEFINE_PER_CPU(struct kprobe_ctlblk, kprobe_ctlblk);
> > > @@ -102,6 +104,16 @@ kprobe_opcode_t *kprobe_lookup_name(const
> > > char *name, unsigned int offset)
> > >  	return addr;
> > >  }
> > >  
> > > +void *alloc_insn_page(void)
> > > +{
> > > +	void *page = vmalloc_exec(PAGE_SIZE);
> > > +
> > > +	if (page)
> > > +		set_memory_ro((unsigned long)page, 1);
> > > +
> > > +	return page;
> > > +}
> > > +
> > 
> > This crashes for me with KPROBES_SANITY_TEST during the kretprobe
> > test.  
> 
> That isn't needed to reproduce this. After bootup, disabling
> optprobes 
> also shows the crash with kretprobes:
> 	sysctl debug.kprobes-optimization=0
> 
> The problem happens to be with patch_instruction() in 
> arch_prepare_kprobe(). During boot, on kprobe init, we register a
> probe 
> on kretprobe_trampoline for use with kretprobes (see 
> arch_init_kprobes()). This results in an instruction slot being 
> allocated, and arch_prepare_kprobe() to be called for copying the 
> instruction (nop) at kretprobe_trampoline. patch_instruction() is 
> failing resulting in corrupt instruction which we try to
> emulate/single 
> step causing the crash.

Thanks a lot for the info Naveen, I'll investigate.

- Russell

> 
> 
> - Naveen
> 

