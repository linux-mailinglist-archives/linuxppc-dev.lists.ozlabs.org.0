Return-Path: <linuxppc-dev+bounces-14305-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EADDBC6A0D5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Nov 2025 15:42:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d9nPw4sWtz2yvH;
	Wed, 19 Nov 2025 01:42:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=176.9.10.151
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763476932;
	cv=none; b=fAlKSpZ3mX6MtJjsd3RYKUmiICP4olgHI3SlLB8fIU1aTeb05p0GhIuUxx0VGz4IPmpa6CE0h0sFX710/UGkPbUyS7C3LHX+uUSPWF4jCLytP58FOq7wCzLd5GJ0gvU8+KKdS+rLNmcB0Av0icft0S8KpvJkEskg/YJifTLtF2oScWpJWaK7JQuPTHleh4aXvZmUVOIpQZ/YGthLCXwu1a2l40JEDVYNlZDNC428LTcophjtxdgAMIKslenSy/KYO03ryZkr7rrN4CAY/vMyZk5nPAK+xVvfEKoEqXeQ2CuznDa/nKAcLaJTZBpck09rGb1Dboui+sa5XI3C1tVgHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763476932; c=relaxed/relaxed;
	bh=dg4kdYmQD9pOuHVmBlO/os7cl4IQGg77c2SdNrJufvM=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=ZLkOpNyhN2VX0aJGOspyXg+NbXMY5rWqFOT31AWVH1TxrP2Cq/FYPINxijh9d1h7m9/RM/2D8wS7/hi1ChenmIihrLPj9cy871UiHBhVMjV+87m7EiiggWaJCv7wps0CXI/vc1GT/ctJOpiQMrE6tNAnD6YyrOxZC6N2t2ppwMeEqtvMOEgMGXw42u0tetNnES8PimjSqJ0N6CgNpinZG8VFASg/kw0u3IEUupmprlyfDDzz5S/833x/Jw3HvvvFQElxtoCHgku0QWF6GYRUezxBhYuwvyRLjMWDiIE3HVxGdGLlAaNQMYFbKlg7R8JZ+eSXt3csJPY71XkaptXsYA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=exactco.de; dkim=pass (2048-bit key; unprotected) header.d=exactco.de header.i=@exactco.de header.a=rsa-sha256 header.s=x header.b=aRO4Do0p; dkim-atps=neutral; spf=pass (client-ip=176.9.10.151; helo=exactco.de; envelope-from=rene@exactco.de; receiver=lists.ozlabs.org) smtp.mailfrom=exactco.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=exactco.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=exactco.de header.i=@exactco.de header.a=rsa-sha256 header.s=x header.b=aRO4Do0p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=exactco.de (client-ip=176.9.10.151; helo=exactco.de; envelope-from=rene@exactco.de; receiver=lists.ozlabs.org)
Received: from exactco.de (exactco.de [176.9.10.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d9nPv4BDMz2yqP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 01:42:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de;
	s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version:References:
	In-Reply-To:From:Subject:Cc:To:Message-Id:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=dg4kdYmQD9pOuHVmBlO/os7cl4IQGg77c2SdNrJufvM=; b=aRO4Do0p+yi/zEAT0kEQEi0zJk
	ZNz5xY+s9pKMZnRwF3B7KMBABLXRdmdO0zgH7RMQoCEbcRLFp4qFApb+WyrQU4QWdknwT7ji95YnW
	gCyA6iKgxRlx4nxpXbV7cHyMtibEm8FX4GARnRDY7bsNu6hh5j4rmoK87CrhF+xXP0NX5E5BZ6VPn
	5uuoYVJ1xY0kCkZ83h9QzEXaIMaZX7Tnuz1yi6GS3PJ+T7FBEI9WyTjHBzkBO0mXjx0bFgO9qk62O
	NRM4PRcWY/C7ePuow7ljBH/zwqg99xbCmon1CwiowtEYgibYjrcBReofWPC9pW9CYaxCdtWeyDg6+
	3xa86MuQ==;
Date: Tue, 18 Nov 2025 15:42:20 +0100 (CET)
Message-Id: <20251118.154220.44312517709250718.rene@exactco.de>
To: christophe.leroy@csgroup.eu
Cc: linuxppc-dev@lists.ozlabs.org, geoff@infradead.org,
 maddy@linux.ibm.com, mpe@ellerman.id.au
Subject: Re: ppc/lv1call: Fix PS3 LV1 clobbering SRR
From: =?iso-8859-1?Q?Ren=E9?= Rebe <rene@exactco.de>
In-Reply-To: <a376f125-649e-4939-9363-ec73f1c1ea48@csgroup.eu>
References: <20251118.144230.697987246761031674.rene@exactco.de>
	<a376f125-649e-4939-9363-ec73f1c1ea48@csgroup.eu>
X-Mailer: Mew version 6.10 on Emacs 30.2
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

On Tue, 18 Nov 2025 14:57:25 +0100, Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> Le 18/11/2025 à 14:42, René Rebe a écrit :
> > [Vous ne recevez pas souvent de courriers de
> > rene@exactco.de. Découvrez pourquoi ceci est important à
> > https://aka.ms/LearnAboutSenderIdentification ]
> > Since a while booting a PS3 instantly yields:
> 
> Can you bisect to say since when, and add a Fixes: tag to the commit ?

I could, but it might take a day, or two. But maybe always, and we
only notice since 6eaaf9de3599865ee3b339d90cb24f2153f40bf4
("powerpc/64s/interrupt: Check and fix srr_valid without crashing")?

Should I use that as a Fixes?

> > <4>SRR0 was: c0000000000971b4 should be: c0000000002d55c4
> > <4>SRR1 was: 8000000000008032 should be: 8000000000008032
> > Fix LV1 clobbering SRR by srr_regs_clobbered() each lv1 call.
> > Attribute srr_regs_clobbered always_inline for use by modules.
> > Signed-off-by: René Rebe <rene@exactco.de>
> > ---
> >   arch/powerpc/include/asm/interrupt.h | 1 +
> >   arch/powerpc/include/asm/lv1call.h   | 3 ++-
> >   2 files changed, 3 insertions(+), 1 deletion(-)
> > diff --git a/arch/powerpc/include/asm/interrupt.h
> > b/arch/powerpc/include/asm/interrupt.h
> > index eb0e4a20b818..783c6f32a395 100644
> > --- a/arch/powerpc/include/asm/interrupt.h
> > +++ b/arch/powerpc/include/asm/interrupt.h
> > @@ -106,6 +106,7 @@ static inline bool is_implicit_soft_masked(struct
> > pt_regs *regs)
> >          return search_kernel_soft_mask_table(regs->nip);
> >   }
> > +__attribute__((always_inline))
> >   static inline void srr_regs_clobbered(void)
> 
> Instead, use:
> 
> 	static __always_inline void srr_regs_clobbered(void)

Of course, happy to v2 as soon as I know of the above Fixes: is good
enough or I should start bisecting to double-check, ...

Merci,
       René

-- 
René Rebe, ExactCODE GmbH, Berlin, Germany
https://exactco.de • https://t2linux.com • https://patreon.com/renerebe

