Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABDC4720C8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 06:52:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JC9dp0vhvz3c8R
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 16:52:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm3 header.b=ihaZK624;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=bG1NiOkx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=russell.cc (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=ruscur@russell.cc;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256
 header.s=fm3 header.b=ihaZK624; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=bG1NiOkx; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JC9cz1fdMz2yw9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Dec 2021 16:52:02 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 956775C00F8;
 Mon, 13 Dec 2021 00:51:59 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 13 Dec 2021 00:51:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 message-id:subject:from:to:cc:in-reply-to:references
 :content-type:date:mime-version:content-transfer-encoding; s=
 fm3; bh=KNCZmmknk1vATl5pIO2qZPA/mUsuUl4/7/a/8u0yRJs=; b=ihaZK624
 ygrlqrhQMJYZ+bt5k2parkr9oVfYI1EV1LOwLfJ2us7LwxRnBlzbA1FIKt6U8afm
 Kmtn/z1VClKZA9qEw55ZeRN6/zJk6iKp1X+Ukd+J+2EOki74K31N8H0SFBDMonpQ
 GSFoQs8Bjk8SnjoLHtC8Nuz+ULzaulcDNV+jK0RmPO55qDnY7NL2BA4iYmrxxlvV
 t3DvTuynWM/UVw8tDFcy4jLtjuxsaeO1vj9sVx8q3Rd2G8M6TJ3wpEog0KFtdGB4
 HHN2uGJf/T2KSvVEV1+Hwjwmz5qeGCXQWYdT9a7P5DIbstG2zciyqUuvnWkT+dNR
 twe94V1D3Bj/ZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=KNCZmmknk1vATl5pIO2qZPA/mUsuUl4/7/a/8u0yR
 Js=; b=bG1NiOkxabDGJges9de7ThSNaFwuD2+PZ/3hHeLqvhHD44pH8usLFkKkB
 ZfSQSCKRl6SpvN+JY6AaOD2kPzsFzjYKtw49fvFFFLLuC/VOYjOnfcATKP8hhELV
 iexu9yglW6NgmSbtDafJCc0uQKoaGOf3Ol34+27Qko7iBbylWS91AZP3HmJQIevu
 M4aGwgek9RNMs1kShdseMKYsw6765qGdOcntKW6C4mrqaAGF+7OQnrdgazZSwBgD
 p/PlcQBWq67xTOvXvC2CFz+xQ1FWnmwWugFCtAtxaA1e0PBQv55c3V9DCw4wyYyL
 T96vMaOl1YTv7F3nkCSlwVL54cvrw==
X-ME-Sender: <xms:ft-2YVE-YIGLtZ40zqejQXuqZokRb3ddi4DUtqfGo6M-JDwGPA54Wg>
 <xme:ft-2YaVqmYYF1RgYT2YWdplgVJ6eGrltowHYQlQMP0v_2L_dkGm6oNhjg2MvNS1Rp
 4fDe0sxBg6sI3b2cw>
X-ME-Received: <xmr:ft-2YXL-noLHPkF3HoRsSogG8QolihHoPaX7DpFQ0F4h5QMIf2BH8R9tmprbtrxQiyrAYl04sstoLD0lI80yI-KjbZUSbZ904mDPQVk-hJQBl1TmB6bZ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrkeejgdekjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdduhedmnecujfgurhepkffuhffvjghftgffgggfgfesthekredttder
 jeenucfhrhhomheptfhushhsvghllhcuvehurhhrvgihuceorhhushgtuhhrsehruhhssh
 gvlhhlrdgttgeqnecuggftrfgrthhtvghrnhepvedtudelteehtedtjeefudfgleegheek
 jeelueffledtgeehtdejjeevgfduveetnecuffhomhgrihhnpehoiihlrggsshdrohhrgh
 dpkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
 rghilhhfrhhomheprhhushgtuhhrsehruhhsshgvlhhlrdgttg
X-ME-Proxy: <xmx:ft-2YbEuSCiJKgi36kXAT5h1PRVq5uTl6OGZPaUgLUqcFr607DcNNg>
 <xmx:ft-2YbWrHsY1HSf4VuonHz9cJaDNIZHnYdc_sbPQYkjtv0Y4NOcH1w>
 <xmx:ft-2YWNWFqv4xM80LVxdQ0dFZ2MNpZZY2uXBabz3PMnZQKLxc03S6Q>
 <xmx:f9-2YRcxEES2QVEoil6s5rgRk4Qm2p24WJYngyf96ZRI3b-dA_Y3uQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Dec 2021 00:51:56 -0500 (EST)
Message-ID: <994c344b5e3399e9cca6cfdce7bc3253370fc166.camel@russell.cc>
Subject: Re: [PATCH v2 1/2] powerpc/code-patching: add patch_memory() for
 writing RO text
From: Russell Currey <ruscur@russell.cc>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, 
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
In-Reply-To: <9a3a5e5d-ee90-4290-abc9-31be2716e6a1@csgroup.eu>
References: <20211212010357.16280-1-ruscur@russell.cc>
 <9a3a5e5d-ee90-4290-abc9-31be2716e6a1@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 13 Dec 2021 15:51:53 +1000
MIME-Version: 1.0
User-Agent: Evolution 3.42.2 
Content-Transfer-Encoding: 8bit
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
Cc: "jniethe5@gmail.com" <jniethe5@gmail.com>,
 "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>,
 "joe.lawrence@redhat.com" <joe.lawrence@redhat.com>,
 "joel@jms.id.au" <joel@jms.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 2021-12-12 at 09:08 +0000, Christophe Leroy wrote:
> Le 12/12/2021 à 02:03, Russell Currey a écrit :
> > +static int do_patch_memory(void *dest, const void *src, size_t
> > size, unsigned long poke_addr)
> > +{
> > +       unsigned long patch_addr = poke_addr +
> > offset_in_page(dest);
> > +
> > +       if (map_patch_area(dest, poke_addr)) {
> > +               pr_warn("failed to map %lx\n", poke_addr);
> 
> It isn't worth a warning here. If that happens before slab is
> available, 
> it will panic in early_alloc_pgtable().
> 
> If it happens after, you will already get a pile of messages dumping
> the 
> memory state etc ...
> 
> During the last few years, pr_ messages have been removed from most 
> places where ENOMEM is returned.

That's good to know, thanks.

> 
> > +               return -1;
> > +       }
> 
> I have a series reworking error handling at 
> https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=274823&state=*
> 
> Especially this one handles map_patch_area() : 
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/85259d894069e47f915ea580b169e1adbeec7a61.1638446239.git.christophe.leroy@csgroup.eu/
> 
> Would be good if you could rebase your series on top of it.


> 
I've rebased on top of your series (patchwork 274258 & 274823).

> > +
> > +       memcpy((u8 *)patch_addr, src, size);
> 
> Shouldn't we use copy_to_kernel_nofault(), so that we survive from a 
> fault just like patch_instruction() ?

Yes we should.

> > +
> > +       flush_icache_range(patch_addr, size);
> > +
> > +       if (unmap_patch_area(poke_addr)) {
> > +               pr_warn("failed to unmap %lx\n", poke_addr);
> > +               return -1;
> > +       }
> 
> I have changed unmap_page_area() to a void in 
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/299804b117fae35c786c827536c91f25352e279b.1638446239.git.christophe.leroy@csgroup.eu/
> 
> > +
> > +       return 0;
> > +}
> > +
> > +/**
> > + * patch_memory - write data using the text poke area
> > + *
> > + * @dest:      destination address
> > + * @src:       source address
> > + * @size:      size in bytes
> > + *
> > + * like memcpy(), but using the text poke area. No atomicity
> > guarantees.
> > + * Do not use for instructions, use patch_instruction() instead.
> > + * Handles crossing page boundaries, though you shouldn't need to.
> > + *
> > + * Return value:
> > + *     @dest
> > + **/
> > +void *patch_memory(void *dest, const void *src, size_t size)
> > +{
> > +       size_t bytes_written, write_size;
> > +       unsigned long text_poke_addr;
> > +       unsigned long flags;
> > +
> > +       // If the poke area isn't set up, it's early boot and we
> > can just memcpy.
> > +       if (!this_cpu_read(text_poke_area))
> > +               return memcpy(dest, src, size);
> > +
> > +       local_irq_save(flags);
> 
> Do we want to do such potentially big copies with interrupts disabled
> ?

Probably not.  This should never actually get used for big copies - the
problem it was written to solve never copies more than 40 bytes, and is
very unlikely to ever cross a page boundary.

I could disable and re-enable interrupts per-page (per call of
do_patch_memory()) so there's a preemption window on longer operations.

> 
> > +       text_poke_addr = (unsigned
> > long)__this_cpu_read(text_poke_area)->addr;
> > +
> > +       for (bytes_written = 0;
> > +            bytes_written < size;
> > +            bytes_written += write_size) {
> 
> I recommend you to read 
> https://www.kernel.org/doc/html/latest/process/coding-style.html?highlight=coding%20style#naming
> 
> As explained there, local variable names should be short. Using long 
> names is non-productive.
> 
> You could just call it "written", it would allow you to keep the
> for() 
> on a single line, that would be a lot more readable.

I am aware of the coding style, my brain somehow didn't consider
"written" as a better option, which is quite silly.


> > +               // Write as much as possible without crossing a
> > page boundary.
> > +               write_size = min_t(size_t,
> > +                                  size - bytes_written,
> > +                                  PAGE_SIZE - offset_in_page(dest
> > + bytes_written));
> 
> Reduce the size of you variable names and keep it on a single line.

> > +
> > +               if (do_patch_memory(dest + bytes_written,
> > +                                   src + bytes_written,
> > +                                   write_size,
> > +                                   text_poke_addr))
> 
> Same, keep a single line as much as possible.
> 
> > +                       break;
> > +       }
> > +
> > +       local_irq_restore(flags);
> > +
> > +       return dest;
> 
> Maybe it would be better to return ERR_PTR() of the error returned by
> do_page_memory().

That is indeed much better.

Thanks for the feedback.

- Russell

> 
> > +}
> >   #else /* !CONFIG_STRICT_KERNEL_RWX */
> >   
> >   static int do_patch_instruction(u32 *addr, struct ppc_inst instr)
> > @@ -185,6 +254,11 @@ static int do_patch_instruction(u32 *addr,
> > struct ppc_inst instr)
> >         return raw_patch_instruction(addr, instr);
> >   }
> >   
> > +void *patch_memory(void *dest, const void *src, size_t size)
> > +{
> > +       return memcpy(dest, src, size);
> > +}
> > +
> >   #endif /* CONFIG_STRICT_KERNEL_RWX */
> >   
> >   int patch_instruction(u32 *addr, struct ppc_inst instr)
> > 
> 
> Christophe

