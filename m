Return-Path: <linuxppc-dev+bounces-1188-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB92971F0A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Sep 2024 18:24:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X2XGR5RbMz2yQl;
	Tue, 10 Sep 2024 02:24:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725899055;
	cv=none; b=FFO4aNSPhkSOYbqXYbDBIMlHzF6DJgowSZtJxp3qO+/U1EeKeM9jKnEh0mrjN3p4HW3ny8yCd0NDbYtyDkmIF4eITXx8HDqyeIT5kyr1XmRmc8R12vffkL/sImnCWLcx2RHW1X4A0yGVjiZOxFv09mhggL2Nwy1fcb7DvcBv/c9GEKlvVQrmCUpYtf6B2LIxIKEcBD+yLDli5Lq08rWOQL8KeeZ1/xy8xGpGvlr4o/59YKzW6/ILvbHkDDP9QTa0BJYNTtSFXUpUXXUV7rjTC3dh7/Ajsx2447dEMw1yS4d7O1mOxdbTnlrWpbDwH6vvoR+S8GqYz4fr2zn7s+yYpA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725899055; c=relaxed/relaxed;
	bh=boTlXbc42pxHSAGjtK2B8Axg1+HxuPU7/ycj3Bgwrfc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n3wnz//zFtuxqlDQr/ybstJgpp/Ecdn0IdP91I/hP4ngO+sueX0+iIwFfystItSiBrmoTQaWLLuIljK8lBhpw8z7ffUH4DuM8jhia83HVKBAbn7WULdE+RQmtBVfJMW3M6q2I6olpbQrrh4aaWOQg1q7h0S+gffONqjdGCDNcHlDLKGsE76zAMmJqkbgucROOR7Cxvi34wGUKlWCcK/AhlGDgWYOBi54S3kKy2EV3nyvrq+zAvywHjweyjAm6lijLBgYR/E2J3epMXO4AUfXlY4DO56KJO5Ix1oNo5tIfCApunOpNuvLwQdLxk/DTrkfnPsqCtF2+ODoQsY3joM4mQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=d+P59sb5; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=d+P59sb5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X2XGR1B1Vz2yPR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2024 02:24:15 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CA6F6A41698
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Sep 2024 16:24:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3063C4CECA
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Sep 2024 16:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725899052;
	bh=LbCGfF+2m+6VIM4/rf1dX5mKKA/cBJhEjzC0d57stTQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=d+P59sb5aVKQU5kcEpCuXp1agRU/Al7LtsqIdJtHuZI8hHA3mBYGhobUgS2oJaRPP
	 Fdpxpnjv76IR0ZioJNB/w06PZw07U5r4uSAuRP+M4KSTeGFcDADgXoOsc0nWILSGx4
	 lWTLYpY5MBGYlmVUK0wnR14VH7XgEw4+RI6GVjAzAhZlRoc1GC6vOibG9CspSrTYYf
	 QfR7v+DBjKG24uLijD/HxMZbqUxYlwT0VKWGifBTPUaCJPgzY/n0djLNXTjpeLQdTM
	 XFIHS6N9AwH7qFtauNH9ydDZbhMXKq2sgtfqg5X+aubj/f8azi5mPEkRr+PPOiRzUe
	 tmhNw7ugee4HQ==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53654dbde59so3601356e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Sep 2024 09:24:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU5cRDYrBNS+tFBvluN7pTz0GlQM+AXZ4o8/pxSfiPig4Qm4+OFUAIXiOG7zv4XZipN+ShwD542is/nDcM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyzYothcP5EoZjJqWFLj0mVh2M9OX5PDHCH+qTlkpqL9KXBDeFU
	nOe7ye5hQHPUX58wxrO0f/u2p3j+3hpK/u3pcwELqPjQiJAdECLB7OBgZZDLh1JDEvV1Qjr/UZL
	xir1GGubaMUAyhE16YxCUE4pqRZA=
X-Google-Smtp-Source: AGHT+IE67j1JHzjul6rP31wPGUDLic05CGTRENXlixjze+8lcgkyMsz6aPX0su5fl7/N3udW7A13ohbWWjCDoLv9HHY=
X-Received: by 2002:a05:6512:1255:b0:535:639d:e3e0 with SMTP id
 2adb3069b0e04-5366bb2b692mr49338e87.24.1725899050649; Mon, 09 Sep 2024
 09:24:10 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20240909200948.70087f49@canb.auug.org.au> <afa6f06a-8d92-4ac1-b5fe-d5b6ade3f740@csgroup.eu>
 <20240910005808.2e355995@canb.auug.org.au>
In-Reply-To: <20240910005808.2e355995@canb.auug.org.au>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 10 Sep 2024 01:23:34 +0900
X-Gmail-Original-Message-ID: <CAK7LNARMD=PR9x-OMN5QJHmeDdAzDM=2F47ccqdLHHGTxVq5Jg@mail.gmail.com>
Message-ID: <CAK7LNARMD=PR9x-OMN5QJHmeDdAzDM=2F47ccqdLHHGTxVq5Jg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the powerpc tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>, 
	"Rob Herring (Arm)" <robh@kernel.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 9, 2024 at 11:58=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi Christophe,
>
> On Mon, 9 Sep 2024 16:22:26 +0200 Christophe Leroy <christophe.leroy@csgr=
oup.eu> wrote:
> >
> > Le 09/09/2024 =C3=A0 12:09, Stephen Rothwell a =C3=A9crit :
> > > Hi all,
> > >
> > > After merging the powerpc tree, today's linux-next build (powerpc
> > > ppc44x_defconfig) failed like this:
> > >
> > > make[3]: *** No rule to make target 'arch/powerpc/boot/treeImage.ebon=
y', needed by 'arch/powerpc/boot/zImage'.  Stop.
> > > make[2]: *** [/home/sfr/next/next/arch/powerpc/Makefile:236: zImage] =
Error 2
> > > make[1]: *** [/home/sfr/next/next/Makefile:224: __sub-make] Error 2
> > > make: *** [Makefile:224: __sub-make] Error 2
> > >
> > > It is not obvious to me what change caused this, so I have just left
> > > the build  broken for today.
> > >
> >
> > Bisected to commit e6abfb536d16 ("kbuild: split device tree build rules=
 into scripts/Makefile.dtbs")
>
> Thanks for that.
>
> --
> Cheers,
> Stephen Rothwell


I squashed the following fix. Hopefully, it will be ok tomorrow.


diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 6385e7aa5dbb..8403eba15457 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -444,7 +444,7 @@ ifneq ($(userprogs),)
 include $(srctree)/scripts/Makefile.userprogs
 endif

-ifneq ($(need-dtbslist)$(dtb-y)$(dtb-)$(filter %.dtb.o %.dtbo.o,$(targets)=
),)
+ifneq ($(need-dtbslist)$(dtb-y)$(dtb-)$(filter %.dtb %.dtb.o
%.dtbo.o,$(targets)),)
 include $(srctree)/scripts/Makefile.dtbs
 endif


--=20
Best Regards
Masahiro Yamada

