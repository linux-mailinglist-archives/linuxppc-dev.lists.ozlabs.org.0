Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A0A849BA9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Feb 2024 14:22:59 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dthiUBnd;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dthiUBnd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TT6WP3ZqFz3cJW
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Feb 2024 00:22:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dthiUBnd;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dthiUBnd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=jstancek@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TT6Vb45D5z2xct
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Feb 2024 00:22:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707139331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KIOs5oLKwmUHXU8QbeznJvmgtQddL9JBz6AuSst5Dak=;
	b=dthiUBnd0toxPyYu3EKu/K/ZGKbvcuA0FLE3XkanDxPHoCeOc0lIiHDFAA8z0aZuBMjNum
	AYDJlEd2Q3c4Mt0Me5Crh0+Lji+hwnxDwpagJxVGyHe9X/k1NbcN4kiaas8UTFS38KJouB
	KLCXd8Iz+R7vQbVJ93RQ1Rsd3cEX+fc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707139331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KIOs5oLKwmUHXU8QbeznJvmgtQddL9JBz6AuSst5Dak=;
	b=dthiUBnd0toxPyYu3EKu/K/ZGKbvcuA0FLE3XkanDxPHoCeOc0lIiHDFAA8z0aZuBMjNum
	AYDJlEd2Q3c4Mt0Me5Crh0+Lji+hwnxDwpagJxVGyHe9X/k1NbcN4kiaas8UTFS38KJouB
	KLCXd8Iz+R7vQbVJ93RQ1Rsd3cEX+fc=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-88-5hLbFN_xOaSvSNflb4IACQ-1; Mon, 05 Feb 2024 08:22:09 -0500
X-MC-Unique: 5hLbFN_xOaSvSNflb4IACQ-1
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-7d0ac939b9fso2052349241.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Feb 2024 05:22:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707139329; x=1707744129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KIOs5oLKwmUHXU8QbeznJvmgtQddL9JBz6AuSst5Dak=;
        b=u4iYbG5N90cGLqextGUfhKKSqqxEUaDZ55tu4/B/xmzunjtAeNt6mxeljmjeExJQfH
         3eZ10fesy4k/w8k8jTmkVB2O92dZJsOsAww4KGh7LHiGy9Iilnp30a4u3SK7UEmpDstJ
         Q4Km5KDi+YNFtPQ5mZC4Vde/eyJ4PfAPRTvAoVE0PC7P0kIL3rJmVdtwgPn5ZgTLrGkR
         vmvQ4yLumujuHT3wPQrcf+ayi8CyLUb8WUejxHpvnxH75e9adskEELM5a5FBsiZeQxaz
         SdX4jy0zbetD5LDaIq9Vz7L0uFUiiDT2GFhKbsVB6Ni0ugAc2PvrPi60ineTsqVYzkE4
         f5dg==
X-Gm-Message-State: AOJu0Yw5zvy8bUYuKJvEIgW8Dq5XJmxLA8NzOhNE6EbITn9yH/QedDbi
	LtXbqe9RPdqAROHYPkR4VcrgA1qJqBM/E7QYFbwhr3kA2TxQbnyTsmWFak9fN2jDtKpLrPhNx07
	STDVfylfrphXkLnm/hblwBc0rXemx3ms/PsHv85NBRU+Op9LLqxQXBavKomD6MQY5bwX5c15wPi
	r6dpC6f3YrN32VMy99TDzpnJF/WexECNlY9HEA1Q==
X-Received: by 2002:a05:6102:227a:b0:46d:25b2:45ca with SMTP id v26-20020a056102227a00b0046d25b245camr2430371vsd.3.1707139328776;
        Mon, 05 Feb 2024 05:22:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGTqYUjiIYeYl3PqTmLdMiBhcx1hHiK2OI7YlynV/pIuRwn3MzuIAwA1MFAoxSSU6bLHrFbZTOiRaU2u8nol5U=
X-Received: by 2002:a05:6102:227a:b0:46d:25b2:45ca with SMTP id
 v26-20020a056102227a00b0046d25b245camr2430352vsd.3.1707139328286; Mon, 05 Feb
 2024 05:22:08 -0800 (PST)
MIME-Version: 1.0
References: <20231120232332.4100288-1-masahiroy@kernel.org>
 <CX42TU4QHS1Z.A0UUHMDAMZOL@wheely> <ZbjHTMhQ4Z9lRR6L@t14s> <87v873870m.fsf@mail.lhotse>
In-Reply-To: <87v873870m.fsf@mail.lhotse>
From: Jan Stancek <jstancek@redhat.com>
Date: Mon, 5 Feb 2024 14:21:52 +0100
Message-ID: <CAASaF6w9SRoj+Kn6=UaReBNNfL_rrKo-4rvtCj=iF4Nd3Zpw-g@mail.gmail.com>
Subject: Re: [PATCH] powerpc: add crtsavres.o to always-y instead of extra-y
To: Michael Ellerman <mpe@ellerman.id.au>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Tom Rix <trix@redhat.com>, Masahiro Yamada <masahiroy@kernel.org>, llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 5, 2024 at 12:50=E2=80=AFPM Michael Ellerman <mpe@ellerman.id.a=
u> wrote:
>
> Jan Stancek <jstancek@redhat.com> writes:
> > On Tue, Nov 21, 2023 at 10:51:34AM +1000, Nicholas Piggin wrote:
> >>On Tue Nov 21, 2023 at 9:23 AM AEST, Masahiro Yamada wrote:
> >>> crtsavres.o is linked to modules. However, as explained in commit
> >>> d0e628cd817f ("kbuild: doc: clarify the difference between extra-y
> >>> and always-y"), 'make modules' does not build extra-y.
> >>>
> >>> For example, the following command fails:
> >>>
> >>>   $ make ARCH=3Dpowerpc LLVM=3D1 KBUILD_MODPOST_WARN=3D1 mrproper ps3=
_defconfig modules
> >>>     [snip]
> >>>     LD [M]  arch/powerpc/platforms/cell/spufs/spufs.ko
> >>>   ld.lld: error: cannot open arch/powerpc/lib/crtsavres.o: No such fi=
le or directory
> >>>   make[3]: *** [scripts/Makefile.modfinal:56: arch/powerpc/platforms/=
cell/spufs/spufs.ko] Error 1
> >>>   make[2]: *** [Makefile:1844: modules] Error 2
> >>>   make[1]: *** [/home/masahiro/workspace/linux-kbuild/Makefile:350: _=
_build_one_by_one] Error 2
> >>>   make: *** [Makefile:234: __sub-make] Error 2
> >>>
> >>
> >>Thanks. Is this the correct Fixes tag?
> >>
> >>Fixes: d0e628cd817f ("powerpc/64: Do not link crtsavres.o in vmlinux")
> >>
> >>Hmm, looks like LLD might just do this now automatically for us
> >>too without --save-restore-funcs (https://reviews.llvm.org/D79977).
> >>But we probably still need it for older versions, so we still need
> >>your patch.
> >
> > Hi,
> >
> > I'm still seeing the error of crtsavres.o missing when building externa=
l modules
> > after "make LLVM=3D1 modules_prepare". Should it be built also in archp=
repare?
>
> Or modules_prepare?
>
> Example patch below.

I tested your patch with my setup and that works for me as well.

>
> cheers
>
>
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index 051247027da0..82cdef40a9cd 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -59,6 +59,11 @@ ifeq ($(CONFIG_PPC64)$(CONFIG_LD_IS_BFD),yy)
>  KBUILD_LDFLAGS_MODULE +=3D --save-restore-funcs
>  else
>  KBUILD_LDFLAGS_MODULE +=3D arch/powerpc/lib/crtsavres.o
> +
> +crtsavres_prepare: scripts
> +       $(MAKE) $(build)=3Darch/powerpc/lib arch/powerpc/lib/crtsavres.o
> +
> +modules_prepare: crtsavres_prepare
>  endif
>
>  ifdef CONFIG_CPU_LITTLE_ENDIAN
>

