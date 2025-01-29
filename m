Return-Path: <linuxppc-dev+bounces-5676-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 396FDA21AD1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2025 11:14:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YjdLK5v83z30Mn;
	Wed, 29 Jan 2025 21:14:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.2.142.161
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738145673;
	cv=none; b=hsVopRtXnvT4pms3K2jn3tIc5TgeIxRjEDj7fon+Tv7ni4jyElwyxWyhSeJoQ1mqy+8aUp0x/E30d/JJbmnadF70n4w7rxZttLXqH6bie8DsKRjPuvIwMuc0eIDJfD7meZ8gt4QY7gbfZqolnWdyopEt5LacL2jqXNMSJYBwTTWf8nrzmvKmcGcPEH7XqjYShgneaouv/wdGoy7ZbxqpzpuPC8IlX2pC/EoyAbvrTWKCyEIr2LUEz+V5xNs3VqMUt0CUK2Gp3g25itzFxTngikpVWMMRhwjK4SgnCSVgnC5kBf14R7ZK1+ObBXth1VXsqA2zfNVvbcuPWqG1WqVRNg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738145673; c=relaxed/relaxed;
	bh=yigIz8jogxLpu8Oq/ClpNGnqxPIg8HGpntMDN4L9js0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YsCGvo3ICiFAEQyzZCKhlnbuQHS/eXVgRSWKPFq5hEg6riprl1dtjt7Fj5E38vTs44JFbIKRXndHNzlgLoyKuHp9ZxNKDJ2ts8IIbiE4ac20mAhE3JyRNbljdMabu6yoyRm//0KY2vkZat1p4RkKm6AGvS27QAYHKufsEl4yRH2v+I0JTgXeMCHXGI+5K2n5ZgpPishtahfpvW6DDMSxDkpV1n8eR08W51rDVL2sNMwuvXHb7xtSJmNqwMuC5rqlkAIz1SsMg/XTzLlJgm91jCdvXvaxh/c+XgDdmfgzs1wlW73p66fHMlSw1zAp3D5Zfo9V5RIlqNrS2eks/pRgQg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; dkim=fail header.d=smtpservice.net header.i=@smtpservice.net header.a=rsa-sha256 header.s=mp6320.a1-4.dyn header.b=gkaTnAKF reason="unknown key version"; dkim=pass (2048-bit key; unprotected) header.d=fjasle.eu header.i=@fjasle.eu header.a=rsa-sha256 header.s=s1174286 header.b=ate+PAla; dkim=pass (1024-bit key; unprotected) header.d=fjasle.eu header.i=@fjasle.eu header.a=rsa-sha256 header.s=mail header.b=lrzTQRN3; dkim-atps=neutral; spf=pass (client-ip=103.2.142.161; helo=e2i673.smtp2go.com; envelope-from=bt.nqwyjwvs5ctmkv2=bkfa06zw9zj9=wfopqj2ku2z1dc@em1174286.fjasle.eu; receiver=lists.ozlabs.org) smtp.mailfrom=em1174286.fjasle.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="unknown key version" header.d=smtpservice.net header.i=@smtpservice.net header.a=rsa-sha256 header.s=mp6320.a1-4.dyn header.b=gkaTnAKF;
	dkim=pass (2048-bit key; unprotected) header.d=fjasle.eu header.i=@fjasle.eu header.a=rsa-sha256 header.s=s1174286 header.b=ate+PAla;
	dkim=pass (1024-bit key; unprotected) header.d=fjasle.eu header.i=@fjasle.eu header.a=rsa-sha256 header.s=mail header.b=lrzTQRN3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=em1174286.fjasle.eu (client-ip=103.2.142.161; helo=e2i673.smtp2go.com; envelope-from=bt.nqwyjwvs5ctmkv2=bkfa06zw9zj9=wfopqj2ku2z1dc@em1174286.fjasle.eu; receiver=lists.ozlabs.org)
Received: from e2i673.smtp2go.com (e2i673.smtp2go.com [103.2.142.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YjdL00s2cz2xbS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 21:14:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=mp6320.a1-4.dyn; x=1738146556; h=Feedback-ID:
	X-Smtpcorp-Track:Message-ID:Subject:To:From:Date:Reply-To:Sender:
	List-Unsubscribe:List-Unsubscribe-Post;
	bh=yigIz8jogxLpu8Oq/ClpNGnqxPIg8HGpntMDN4L9js0=; b=gkaTnAKF4WJjlbN2DE9JXcGbgZ
	DngbaDKhSAsDTnXhXQhxdBAJ6I3E4EhGipB9jBDgA1iqzsdBBh1juZUheOBwngGp4X1pa/zIeHwUj
	7/Y6NlMeKO2/LKZQtNw7JlkXmupIc4lJZrl2GZMlyQQomuIcOJiWVKT0udvGmLVNoEFssZNEf+eNn
	6VPJfLpZqjkOQnLDp02SbWCyK99z6YSBcyygvCW15PhgIp+pcIDg2lkazK3UNWYiZauKUTld+D4lo
	qdEKTG/nHaQy51voNO/iUzq5aMm8PHfzou3idcKt3RNfMLPyTKBbVYwaUiUdTZHFg7oQFBtgWlQV3
	506Md3yw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fjasle.eu;
 i=@fjasle.eu; q=dns/txt; s=s1174286; t=1738145656; h=from : subject :
 to : message-id : date;
 bh=yigIz8jogxLpu8Oq/ClpNGnqxPIg8HGpntMDN4L9js0=;
 b=ate+PAlazPKzwKRSR4pCSLnivR3A7mPu0D7BILwOQL9NC9aLxMuSYzDp4N15j2opNHb4D
 hcK8YZfgWMuhhKMTE53ak1EMHrTrP/wrlp1E6/dduOYV9YDBy9+3ba+bJUNHsC1fUY9LVfL
 FPTwZVQE0kVmNmQ/YkExRCRbPdHu31kH99UisEoUJqaW1//84pL0wI/bR3tGXklFnx6+kq6
 WBIn/8YKP5UOORE34x5XZtynSLHeW/tqlvP5LgMCQMKAJy1wXoyDUsI/8qoRPF5HrkjE+I6
 VwQSs7XNrrtC4HhhA6l1sH4y4pfGnk+Cb89xGbg8o16CsX8l/pyPso9Lf5Nw==
Received: from [10.139.162.187] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1td541-qt4C2u-7W; Wed, 29 Jan 2025 10:12:53 +0000
Received: from [10.85.249.164] (helo=leknes.fjasle.eu)
 by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.97.1-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1td540-4o5NDgrj3YX-m1RY; Wed, 29 Jan 2025 10:12:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
 t=1738145569; bh=jlWqgjHL5N7f8oGkWcnw43c2Ps30GS7ts7AWiFMaylQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lrzTQRN3Tn32FaSlwxsLVco1eX3DaHzg6Z8TRjjS1WIaUVi4Si1yCo3WTUpJh8fdW
 F+PnOhw5lYOsXu+6n/Tv5PbAbEPZUx/dTzHK5fKxW0mkUPZj8xWlai41nC0rQG6uuT
 9SQHPfkpisMCnTaCynW2DaO4AAk9FNYX1ise4kDE=
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
 id 4C4DB3D90C; Wed, 29 Jan 2025 11:12:49 +0100 (CET)
Date: Wed, 29 Jan 2025 11:12:49 +0100
From: Nicolas Schier <nicolas@fjasle.eu>
To: Kienan Stewart <kstewart@efficios.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Nicolas Schier <nicolas@fjasle.org>, Nathan Chancellor <nathan@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, n.schier@avm.de
Subject: Re: [PATCH] kbuild: Add missing $(objtree) prefix to powerpc
 crtsavres.o artifact
Message-ID: <Z5n_Iei185SsQyLd@fjasle.eu>
References: <20250127-buildfix-extmod-powerpc-v1-1-450012b16263@efficios.com>
 <d0eb6abf-c0f2-4726-92ea-7d007813936d@efficios.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d0eb6abf-c0f2-4726-92ea-7d007813936d@efficios.com>
X-Operating-System: Debian GNU/Linux 12.9
X-Smtpcorp-Track: J_iKMLViP4t8.1Rgq2UNn0V0z.dNRmlA0Ys8E
Feedback-ID: 1174286m:1174286a9YXZ7r:1174286sjo3cYpwpr
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue 28 Jan 2025 10:53:42 GMT, Kienan Stewart wrote:
> Hi,
> 
> I missed a few CCs, looping them in now. Apologies for the extra noise.
> 
> thanks,
> kienan
> 
> On 1/27/25 1:47 PM, Kienan Stewart wrote:
> > In the upstream commit 214c0eea43b2ea66bcd6467ea57e47ce8874191b
> > ("kbuild: add $(objtree)/ prefix to some in-kernel build artifacts")
> > artifacts required for building out-of-tree kernel modules had
> > $(objtree) prepended to them to prepare for building in other
> > directories.
> > 
> > When building external modules for powerpc,
> > arch/powerpc/lib/crtsavres.o is required for certain
> > configurations. This artifact is missing the prepended $(objtree).
> > 
> > External modules may work around this omission for v6.13 by setting MO=$KDIR.
> > 
> > Signed-off-by: Kienan Stewart <kstewart@efficios.com>
> > ---
> >   arch/powerpc/Makefile | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> > index f3804103c56ccfdb16289468397ccaea71bf721e..9933b98df69d7f7b9aaf33d36155cc61ab4460c7 100644
> > --- a/arch/powerpc/Makefile
> > +++ b/arch/powerpc/Makefile
> > @@ -58,7 +58,7 @@ ifeq ($(CONFIG_PPC64)$(CONFIG_LD_IS_BFD),yy)
> >   # There is a corresponding test in arch/powerpc/lib/Makefile
> >   KBUILD_LDFLAGS_MODULE += --save-restore-funcs
> >   else
> > -KBUILD_LDFLAGS_MODULE += arch/powerpc/lib/crtsavres.o
> > +KBUILD_LDFLAGS_MODULE += $(objtree)/arch/powerpc/lib/crtsavres.o
> >   endif
> >   ifdef CONFIG_CPU_LITTLE_ENDIAN
> > 
> > ---
> > base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
> > change-id: 20250127-buildfix-extmod-powerpc-a744e1331f83

Thanks!

Reviewed-by: Nicolas Schier <n.schier@avm.de>
Tested-by: Nicolas Schier <n.schier@avm.de>


