Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBD559F8F8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 14:03:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MCPrM45HDz30LC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 22:03:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jPSj97YF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jPSj97YF;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MCPqn1nXYz2xHk
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Aug 2022 22:03:01 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id EBD45B8239E;
	Wed, 24 Aug 2022 12:02:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76575C433D6;
	Wed, 24 Aug 2022 12:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661342576;
	bh=JZ3hXAPlKWzmEXJh2Gr2Tdgic81AafQsDP5tJ7ywKaA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jPSj97YFr/FIN1QoDh+6vvTSKDgm6HE3BUroNwFr4hK8naAlEHAKUm4dCaAmaf+zq
	 1cH1EB+AEea5guwSOTSo54sz8pqXG44rJnoUUMqYXUflTHbRBD6UWKpOl9V9bGc6Pg
	 bIQcpRoF4yaZdLxo5NiTYu7OlIG0g+KxjJgetpiqTOQcbKiU+v7VnIuU2poovb292G
	 de2sJb1hYbj5KW34wNlJjn3yHi2icnswUdOyR5iwQtyhL90JzpIMqwjSroj7WFNJvz
	 r8L8nXXcbdoFCzotzh+HFiHk+/np6DoL2REpmo2FkVFcsYpRLEG7h2V67wUb6+OQfL
	 2mq6duJD5gGYQ==
Received: by pali.im (Postfix)
	id 570A07DA; Wed, 24 Aug 2022 14:02:53 +0200 (CEST)
Date: Wed, 24 Aug 2022 14:02:53 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/boot: Fix compilation of uImage for e500
 platforms
Message-ID: <20220824120253.ba46id2n765udzlo@pali>
References: <20220820105200.30425-1-pali@kernel.org>
 <a70bd394-7f44-3129-801c-6dfd2d8a5a00@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a70bd394-7f44-3129-801c-6dfd2d8a5a00@csgroup.eu>
User-Agent: NeoMutt/20180716
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tuesday 23 August 2022 16:57:34 Christophe Leroy wrote:
> Le 20/08/2022 à 12:52, Pali Rohár a écrit :
> > Commit 40a75584e526 ("powerpc/boot: Build wrapper for an appropriate CPU")
> > broke compilation of uImage target for mpc85xx platforms by powerpc e500
> > SPE capable cross compilers. After that commit build process throws error:
> > 
> >      BOOTAS  arch/powerpc/boot/crt0.o
> >    powerpc-linux-gnuspe-gcc: error: unrecognized argument in option ‘-mcpu=powerpc’
> >    powerpc-linux-gnuspe-gcc: note: valid arguments to ‘-mcpu=’ are: 8540 8548 native
> >    make[1]: *** [arch/powerpc/boot/Makefile:231: arch/powerpc/boot/crt0.o] Error 1
> > 
> > Fix this issue by checking for CONFIG_PPC_E500MC / CONFIG_E500 options and
> > applying appropriate -mcpu options for building uImage boot code.
> 
> This is very specific to e500, could you instead do something using 
> CONFIG_TARGET_CPU, just like commit 446cda1b21d9 ("powerpc/32: Don't 
> always pass -mcpu=powerpc to the compiler")

Ok, What about this change?

diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index a9cd2ea4a861..2247374c4e70 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -34,6 +34,7 @@ endif
 
 BOOTCFLAGS    := -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
 		 -fno-strict-aliasing -O2 -msoft-float -mno-altivec -mno-vsx \
+		 $(call cc-option,-mno-spe) $(call cc-option,-mspe=no) \
 		 -pipe -fomit-frame-pointer -fno-builtin -fPIC -nostdinc \
 		 $(LINUXINCLUDE)
 
@@ -44,8 +45,16 @@ else
 BOOTCFLAGS	+= -m64 -mcpu=powerpc64
 endif
 else
+ifdef CONFIG_PPC32
+ifdef CONFIG_TARGET_CPU_BOOL
+BOOTCFLAGS	+= -m32 -mcpu=$(CONFIG_TARGET_CPU)
+else
+BOOTCFLAGS	+= -m32 -mcpu=powerpc
+endif
+else
 BOOTCFLAGS	+= -m32 -mcpu=powerpc
 endif
+endif
 
 BOOTCFLAGS	+= -isystem $(shell $(BOOTCC) -print-file-name=include)
 


> Thanks
> Christophe
> 
> 
> > 
> > Fixes: 40a75584e526 ("powerpc/boot: Build wrapper for an appropriate CPU")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Pali Rohár <pali@kernel.org>
> > ---
> >   arch/powerpc/boot/Makefile | 6 ++++++
> >   1 file changed, 6 insertions(+)
> > 
> > diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
> > index a9cd2ea4a861..d7cf5d87e4bc 100644
> > --- a/arch/powerpc/boot/Makefile
> > +++ b/arch/powerpc/boot/Makefile
> > @@ -44,8 +44,14 @@ else
> >   BOOTCFLAGS	+= -m64 -mcpu=powerpc64
> >   endif
> >   else
> > +ifdef CONFIG_PPC_E500MC
> > +BOOTCFLAGS	+= -m32 $(call cc-option,-mcpu=e500mc,-mcpu=powerpc)
> > +else ifdef CONFIG_E500
> > +BOOTCFLAGS	+= -m32 $(call cc-option,-mcpu=8540 -msoft-float,-mcpu=powerpc)
> > +else
> >   BOOTCFLAGS	+= -m32 -mcpu=powerpc
> >   endif
> > +endif
> >   
> >   BOOTCFLAGS	+= -isystem $(shell $(BOOTCC) -print-file-name=include)
> >   
