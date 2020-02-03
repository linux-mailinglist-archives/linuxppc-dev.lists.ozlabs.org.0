Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FE41500FF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Feb 2020 05:55:34 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 489wW83zTqzDqdG
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Feb 2020 15:55:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=russell.cc (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=ruscur@russell.cc;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256
 header.s=fm1 header.b=TotxA/Mk; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=iMY/H/Cy; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 489wPK5GSDzDqQQ
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Feb 2020 15:50:29 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 21891725;
 Sun,  2 Feb 2020 23:50:26 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Sun, 02 Feb 2020 23:50:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 message-id:subject:from:to:cc:date:in-reply-to:references
 :content-type:mime-version:content-transfer-encoding; s=fm1; bh=
 bFOUHt7V3C4f1TpU4gQyO6wPuUUc6O2MFNH7/EMga9Y=; b=TotxA/MkYWmTcJAk
 iEa8IfjfrpQHh/fIOtqge0pfHDmUhttrkia5OwjxpGNFlvfc5jc5KN7qmEif5CnF
 tg4mSF9rOj/BFlu8/gO/cQeevwy5Ri1GJEKf4bcWkOyT4PFq5/AL7lGIfLAl6p1z
 RwUq2J9kt/X45MZVQA7qnDjxX79QQ0Ry7lAAIP0Kii6BOJ2M0e7wSCrfVwDorsB7
 nlSHDAT34qPuxfNizWOR/TmVuSiBABN7QM8uJOrpJ4SHgcxpmdVtuWdSIw6YddT5
 0yiBurE32MxAyGDPLFvXnzjqnJ+yZquS4UWEZQJICXE0KMmyauAgRLbbHJnI8MAT
 C6X1iA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=bFOUHt7V3C4f1TpU4gQyO6wPuUUc6O2MFNH7/EMga
 9Y=; b=iMY/H/Cyr70rWB30iy2bxK99ytKSA+1JzLtXQRUzGpg2v8YUhtuMe+nDY
 AuwlKz5elc9XaW9hH57P/xTa0FOP5X5lrq3Viom3XLtIycWZuOdG6Ln0TFt/5wo6
 Lk7aL8iLYmsK61grO1iZlVXBEUZO/7IQ+ZJTc01ocBkc4m3Ewuz6x8Z/sxjMiEvF
 ysE35gQCdJ8Q+F+vSoPAMSORUrEjCEX7xAUPix1V8zxx87GyUgBIRgm7jssGhs8f
 ckgzs2djm5nNnZTuG+Kw6rFwd+mLGj0LGdBhmRiDYD1pVtBuASxBUy+m+g2vCXfV
 hGP6Gp3enxMZsYxMqO3RWVP5ocQQg==
X-ME-Sender: <xms:kKY3Xl1Tw-4kUHM1ytFMGWq4rc_k1VTMf1DnBBtlqfuUn_v0D44u6Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrgeeigdejgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculddutddmnecujfgurhepkffuhffvffgjfhgtfggggfesthejredttder
 jeenucfhrhhomheptfhushhsvghllhcuvehurhhrvgihuceorhhushgtuhhrsehruhhssh
 gvlhhlrdgttgeqnecukfhppeduvddvrdelledrkedvrddutdenucevlhhushhtvghrufhi
 iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehruhhstghurhesrhhushhsvghllh
 drtggt
X-ME-Proxy: <xmx:kKY3XgUC8UbMVYlq_LRjyG3PhAjyQY-3fRhMEckL7ci861M5AuPg0A>
 <xmx:kKY3Xg5HtbBlZ14vuy6l80-LDNB2uerE4zxbXU32EsOCMoVO-O6qrg>
 <xmx:kKY3XnLe7M4v3h2t3vkakRgHMrYrXusWPz742Ss2l_LM5zVg3xOH-w>
 <xmx:kaY3XgE5h4blsJe8-0UBYNnCTQPg-3w7_T0GL0mV-ItYd9BLsf2kxA>
Received: from crackle.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5C8A4328005D;
 Sun,  2 Feb 2020 23:50:22 -0500 (EST)
Message-ID: <3078df74c232e54aef3e8bb3523587a3053ab0ec.camel@russell.cc>
Subject: Re: [PATCH v2 2/7] powerpc/kprobes: Mark newly allocated probes as RO
From: Russell Currey <ruscur@russell.cc>
To: Christophe Leroy <christophe.leroy@c-s.fr>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael
 Ellerman <mpe@ellerman.id.au>
Date: Mon, 03 Feb 2020 15:50:19 +1100
In-Reply-To: <01fdf1b7375b3e1e43a634bf6719b576c4c5db11.1580477672.git.christophe.leroy@c-s.fr>
References: <84be5ad6a996adf5693260749dcb4d8c69182073.1580477672.git.christophe.leroy@c-s.fr>
 <01fdf1b7375b3e1e43a634bf6719b576c4c5db11.1580477672.git.christophe.leroy@c-s.fr>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.3 
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2020-01-31 at 13:34 +0000, Christophe Leroy wrote:
> With CONFIG_STRICT_KERNEL_RWX=y and CONFIG_KPROBES=y, there will be
> one
> W+X page at boot by default.  This can be tested with
> CONFIG_PPC_PTDUMP=y and CONFIG_PPC_DEBUG_WX=y set, and checking the
> kernel log during boot.
> 
> powerpc doesn't implement its own alloc() for kprobes like other
> architectures do, but we couldn't immediately mark RO anyway since we
> do
> a memcpy to the page we allocate later.  After that, nothing should
> be
> allowed to modify the page, and write permissions are removed well
> before the kprobe is armed.
> 
> The memcpy() would fail if >1 probes were allocated, so use
> patch_instruction() instead which is safe for RO.
> 
> Reviewed-by: Daniel Axtens <dja@axtens.net>
> Signed-off-by: Russell Currey <ruscur@russell.cc>
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> ---
> v2: removed the redundant flush
> ---
>  arch/powerpc/kernel/kprobes.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/kprobes.c
> b/arch/powerpc/kernel/kprobes.c
> index 2d27ec4feee4..d3e594e6094c 100644
> --- a/arch/powerpc/kernel/kprobes.c
> +++ b/arch/powerpc/kernel/kprobes.c
> @@ -24,6 +24,7 @@
>  #include <asm/sstep.h>
>  #include <asm/sections.h>
>  #include <linux/uaccess.h>
> +#include <linux/set_memory.h>
>  
>  DEFINE_PER_CPU(struct kprobe *, current_kprobe) = NULL;
>  DEFINE_PER_CPU(struct kprobe_ctlblk, kprobe_ctlblk);
> @@ -124,13 +125,12 @@ int arch_prepare_kprobe(struct kprobe *p)
>  	}
>  
>  	if (!ret) {
> -		memcpy(p->ainsn.insn, p->addr,
> -				MAX_INSN_SIZE *
> sizeof(kprobe_opcode_t));
> +		patch_instruction(p->ainsn.insn, *p->addr);
>  		p->opcode = *p->addr;
> -		flush_icache_range((unsigned long)p->ainsn.insn,
> -			(unsigned long)p->ainsn.insn +
> sizeof(kprobe_opcode_t));
>  	}
>  
> +	set_memory_ro((unsigned long)p->ainsn.insn, 1);
> +


Since this can be called multiple times on the same page, can avoid by
implementing:

void *alloc_insn_page(void)
{
	void *page;

	page = vmalloc_exec(PAGE_SIZE);
	if (page)
		set_memory_ro((unsigned long)page, 1);

	return page;
}

Which is pretty much the same as what's in arm64.  Works for me and
passes ftracetest, I was originally doing this but cut it because it
broke with the memcpy, but works with patch_instruction().

>  	p->ainsn.boostable = 0;
>  	return ret;
>  }

