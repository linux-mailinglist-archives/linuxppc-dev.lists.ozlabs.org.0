Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D9F85601E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 11:50:46 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aa4QMyfY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TbBg770d8z3vqT
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 21:50:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aa4QMyfY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TbBfQ4qZ4z3cWN
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Feb 2024 21:50:06 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5DE8C618B0;
	Thu, 15 Feb 2024 10:50:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FAB8C43390;
	Thu, 15 Feb 2024 10:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707994202;
	bh=xy4XXrTofRkhuzqJ2OfzNGWp44wXcuVzYggYIeQJMuQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aa4QMyfYRtA3plzFYEq0UQIFe7S7YJuGZusvxfcgDWMzTkGixh5940xndyzPkNBTi
	 8E2WUYQNnQaKCK/j3DpsMjFq6uXC/mZXFKiqUta1mOpEmhKQbHIaSdHJbY/gGrZ8T7
	 7/SDvQ/y/+uhA7ALoHJeyAHHlmWTKC95pR7megBDCkk0MnvxdRF+K4M8g58sakOpTd
	 qF6+7fzC4KTjr1dCMb/77RGzkOwerZ2/e4Rt1xzlEoD4B05RC8yWzztbY0efh0f+zU
	 lsoQgn0UdKgX+jG8vtsGOx7J2e116HH5fZZlag/qYAbjMvpKOGlQfhmKQbtJLeYcz0
	 0hyYlEPrSerIA==
Date: Thu, 15 Feb 2024 16:14:54 +0530
From: Naveen N Rao <naveen@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 2/2] powerpc/bpf: enable kfunc call
Message-ID: <jago3vhogcn4dy7jxbjlm5dy2y4fh3a6xe7jiwkasof5wwp4is@pqdwcq36mj2v>
References: <20240201171249.253097-1-hbathini@linux.ibm.com>
 <20240201171249.253097-2-hbathini@linux.ibm.com>
 <4dd99601-6990-444c-af23-95cb3f7b156b@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4dd99601-6990-444c-af23-95cb3f7b156b@csgroup.eu>
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
Cc: Song Liu <songliubraving@fb.com>, Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@linux.dev>, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 13, 2024 at 07:54:27AM +0000, Christophe Leroy wrote:
> 
> 
> Le 01/02/2024 à 18:12, Hari Bathini a écrit :
> > With module addresses supported, override bpf_jit_supports_kfunc_call()
> > to enable kfunc support. Module address offsets can be more than 32-bit
> > long, so override bpf_jit_supports_far_kfunc_call() to enable 64-bit
> > pointers.
> 
> What's the impact on PPC32 ? There are no 64-bit pointers on PPC32.

Looking at commit 1cf3bfc60f98 ("bpf: Support 64-bit pointers to 
kfuncs"), which added bpf_jit_supports_far_kfunc_call(), that does look 
to be very specific to platforms where module addresses are farther than 
s32. This is true for powerpc 64-bit, but shouldn't be needed for 
32-bit.

> 
> > 
> > Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> > ---
> > 
> > * No changes since v1.
> > 
> > 
> >   arch/powerpc/net/bpf_jit_comp.c | 10 ++++++++++
> >   1 file changed, 10 insertions(+)
> > 
> > diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
> > index 7b4103b4c929..f896a4213696 100644
> > --- a/arch/powerpc/net/bpf_jit_comp.c
> > +++ b/arch/powerpc/net/bpf_jit_comp.c
> > @@ -359,3 +359,13 @@ void bpf_jit_free(struct bpf_prog *fp)
> >   
> >   	bpf_prog_unlock_free(fp);
> >   }
> > +
> > +bool bpf_jit_supports_kfunc_call(void)
> > +{
> > +	return true;
> > +}
> > +
> > +bool bpf_jit_supports_far_kfunc_call(void)
> > +{
> > +	return true;
> > +}

I am not sure there is value in keeping this as a separate patch since 
all support code for kfunc calls is introduced in an earlier patch.  
Consider folding this into the previous patch.

- Naveen
