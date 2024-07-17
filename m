Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 342A993414F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jul 2024 19:17:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=THGtgR5V;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WPN0w18rNz3dGt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2024 03:17:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=THGtgR5V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WPN0B3k8Lz3cPf
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2024 03:16:58 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 844DBCE17D5;
	Wed, 17 Jul 2024 17:16:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25625C2BD10;
	Wed, 17 Jul 2024 17:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721236613;
	bh=yBRi4wphUoMe/4Zy6VzuKVwA0LEFrw39GK4vniN0oPI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=THGtgR5Vlyrids+YPWcn3NUkai8KXh6dmNQet1PcEEn/3Aj7VIMCMsVb0ELsT53WR
	 KhxXdkDEuf2rAwT3skCTBPCj/Rlj3DMmiPodOtyOacWmkqjVw8PI51q6OAfgqu4y6i
	 CIPDJSg2uW8ABw/XwsQ2RKDS8qmVsMXmH91TD6ROHhQiqwRjdzMNLctiiRFAykULTz
	 /k0g5UgWEDtt8XfLrsQi/eiLIr+R95V76NtI2HCx7kZAhvGAx/4quyvulJvuc86VJn
	 KwSnj0pl/wa+psNh8M78DNjG/hsNk8P2963m3gWolN1ko/tlMSxEFrWr9HuReZRILu
	 q/FjeneGOUa9A==
Date: Wed, 17 Jul 2024 10:16:52 -0700
From: Kees Cook <kees@kernel.org>
To: "Balasubrmanian, Vignesh" <vigbalas@amd.com>
Subject: Re: [PATCH v3 1/1] x86/elf: Add a new .note section containing
 xfeatures buffer layout info to x86 core files
Message-ID: <202407171010.DC51195@keescook>
References: <20240712094630.29757-1-vigbalas@amd.com>
 <20240712094630.29757-2-vigbalas@amd.com>
 <87plrhshdl.ffs@tglx>
 <a4943b94-3407-42a0-9273-f7948ae8c35b@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a4943b94-3407-42a0-9273-f7948ae8c35b@amd.com>
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
Cc: "matz@suse.de" <matz@suse.de>, "George, Jini Susan" <JiniSusan.George@amd.com>, "felix.willgerodt@intel.com" <felix.willgerodt@intel.com>, "jhb@FreeBSD.org" <jhb@freebsd.org>, "binutils@sourceware.org" <binutils@sourceware.org>, "x86@kernel.org" <x86@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "Petkov, Borislav" <Borislav.Petkov@amd.com>, "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Borislav Petkov <bp@alien8.de>, "christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>, "linux-toolchains@vger.kernel.org" <linux-toolchains@vger.kernel.org>, "naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "Balasubrmanian, Vignesh" <Vignesh.Balasubrmanian@amd.com>, "ebiederm@xmission.com" <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 17, 2024 at 03:02:23PM +0530, Balasubrmanian, Vignesh wrote:
> 
> On 7/13/2024 4:12 PM, Thomas Gleixner wrote:
> > Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> > 
> > 
> > On Fri, Jul 12 2024 at 15:16, Vignesh Balasubramanian wrote:
> > > diff --git a/arch/x86/include/asm/elf.h b/arch/x86/include/asm/elf.h
> > > index 1fb83d477..cad37090b 100644
> > > --- a/arch/x86/include/asm/elf.h
> > > +++ b/arch/x86/include/asm/elf.h
> > > @@ -13,6 +13,15 @@
> > >   #include <asm/auxvec.h>
> > >   #include <asm/fsgsbase.h>
> > > 
> > > +struct xfeat_component {
> > > +     u32 type;
> > > +     u32 size;
> > > +     u32 offset;
> > > +     u32 flags;
> > > +} __packed;
> > > +
> > > +_Static_assert(sizeof(struct xfeat_component)%4 == 0, "xfeat_component is not aligned");
> > This struct is only used in xstate.c and asm/elf.h is not a UAPI
> > header. So what's the point of declaring it in the header instead of
> > xtsate.c?
> > 
> > If this needs to provided for user space consumption, then it want's to
> > be in a UAPI header, no?
> Our initial idea is to pass the "struct xfeat_component" through "glibc".
> is "include/uapi/linux/elf.h" proper header to add this ?

I'd rather not put arch-specific things in the main UAPI elf.h file
unless there is a good reason.

> I couldn't see any proper header inside "arch/x86/include/uapi/asm/".

Other architectures have arch/*/include/uapi/asm/elf.h, so it may be
time to add one for x86 too. For this to be UAPI, I would want to see
more explicit namespacing, e.g. struct x86_xfeat_component, etc.

-Kees

-- 
Kees Cook
