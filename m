Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5835A84205F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jan 2024 11:01:09 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dShA7CDH;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U1N1dnpB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPLKH1nvsz3cW0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jan 2024 21:01:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dShA7CDH;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U1N1dnpB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=jstancek@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TPLJR4Wwdz3btl
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jan 2024 21:00:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706608819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Lvd79EwJ/EeeRbQUvV7D8alEJPVcC5AuHB/N6mbkr5Q=;
	b=dShA7CDHqo7nkGNy44jA4nN+FQ0AATCq6wDSNRu3iORsbO9j6rEWcB4vSthI1j1Z6ujsQv
	sDeaE8GMwdO3kW+Qq0GJH63l/NxyS5eepJOHHXe34uRjakjWJqnwJlxxQPSpCx5W/MaM++
	C8D3GwDxqQGipvnZ1nnWFTQDkSaMNmI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706608820;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Lvd79EwJ/EeeRbQUvV7D8alEJPVcC5AuHB/N6mbkr5Q=;
	b=U1N1dnpBBHfeLK544Ojv3E5FP195L7J4391BJd0PwhoGXZFFWHrnMKLPSAG37i2/1gp6W0
	MYIB0D6LCrQPdetTYb7otVc89loIQyi/Gi5rnKXnWRjOzQjkWYUOOxxuQt2WEMOMbo+u4c
	0gJ9H4gxbL47CAALJtulJ2Iok4w6rD4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-N7vJN-ptPySIQBwNLPvefQ-1; Tue, 30 Jan 2024 05:00:17 -0500
X-MC-Unique: N7vJN-ptPySIQBwNLPvefQ-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-40fa6618eedso945225e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jan 2024 02:00:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706608816; x=1707213616;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lvd79EwJ/EeeRbQUvV7D8alEJPVcC5AuHB/N6mbkr5Q=;
        b=n8ijnZ9BnlYNs0c3ZXRr6nF0fRdnxAPMfSOCbfD+lsVvE6xqk8zD4hjLRIxE9mii80
         8wf4KVvQY+7ERJfAsYG2hE3Wzl/jlcpZX2+Ms8M5LJgBtYQcL2RoM3CBdVxH4Umr31BS
         OI7vxvfBBa+OkYNUGelijjphaeoFNBAJ6gt9Y5AYzE9KebRE7B3Mw8oTSVps+ifC+hx6
         HkfOgzO5qXRCr1MKDWAhm9eb8h5JKC8QQn1gBKzSVwFME2v+70mv+CUXZmiJ/9owoNe9
         XBllspBTZuGpbS8mWEUWuooM11NGHpJgGzNOcldDb1x7tZwI7UtU50lH8DQTPDII8FW9
         uL6Q==
X-Gm-Message-State: AOJu0Ywmdtrw1d9DeINRczDTJBX/q7tyOOwvIrag+THVacaeDXujdPxu
	4skTOmghebrJBmuhL2RqUbJFIn8hiiLUXeYSBVFFmUnF7+VlsFFQTs21vuQNwD4Kqfew9YXYflU
	VR+6btsY+qSvDdAH4hIW35UBpo/1YeDiaBzS4H9tANZH0YUqTfiLAG7QPONyGDTbBChZwJAU=
X-Received: by 2002:a05:6000:2ac:b0:33a:f521:5815 with SMTP id l12-20020a05600002ac00b0033af5215815mr2795197wry.26.1706608816485;
        Tue, 30 Jan 2024 02:00:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEwb92jelVdRIonuHD9AAXhHL37860vpbI9s5dqUN+CbIom/XaWO3f0Bq1fr41DoHF1tZ3ZDA==
X-Received: by 2002:a05:6000:2ac:b0:33a:f521:5815 with SMTP id l12-20020a05600002ac00b0033af5215815mr2795173wry.26.1706608816134;
        Tue, 30 Jan 2024 02:00:16 -0800 (PST)
Received: from t14s (109-81-83-173.rct.o2.cz. [109.81.83.173])
        by smtp.gmail.com with ESMTPSA id az28-20020adfe19c000000b0033afcf8925asm678165wrb.24.2024.01.30.02.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 02:00:15 -0800 (PST)
Date: Tue, 30 Jan 2024 10:54:20 +0100
From: Jan Stancek <jstancek@redhat.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc: add crtsavres.o to always-y instead of extra-y
Message-ID: <ZbjHTMhQ4Z9lRR6L@t14s>
References: <20231120232332.4100288-1-masahiroy@kernel.org>
 <CX42TU4QHS1Z.A0UUHMDAMZOL@wheely>
MIME-Version: 1.0
In-Reply-To: <CX42TU4QHS1Z.A0UUHMDAMZOL@wheely>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
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
Cc: Masahiro Yamada <masahiroy@kernel.org>, llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, linuxppc-dev@lists.ozlabs.org, jstancek@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 21, 2023 at 10:51:34AM +1000, Nicholas Piggin wrote:
>On Tue Nov 21, 2023 at 9:23 AM AEST, Masahiro Yamada wrote:
>> crtsavres.o is linked to modules. However, as explained in commit
>> d0e628cd817f ("kbuild: doc: clarify the difference between extra-y
>> and always-y"), 'make modules' does not build extra-y.
>>
>> For example, the following command fails:
>>
>>   $ make ARCH=powerpc LLVM=1 KBUILD_MODPOST_WARN=1 mrproper ps3_defconfig modules
>>     [snip]
>>     LD [M]  arch/powerpc/platforms/cell/spufs/spufs.ko
>>   ld.lld: error: cannot open arch/powerpc/lib/crtsavres.o: No such file or directory
>>   make[3]: *** [scripts/Makefile.modfinal:56: arch/powerpc/platforms/cell/spufs/spufs.ko] Error 1
>>   make[2]: *** [Makefile:1844: modules] Error 2
>>   make[1]: *** [/home/masahiro/workspace/linux-kbuild/Makefile:350: __build_one_by_one] Error 2
>>   make: *** [Makefile:234: __sub-make] Error 2
>>
>
>Thanks. Is this the correct Fixes tag?
>
>Fixes: d0e628cd817f ("powerpc/64: Do not link crtsavres.o in vmlinux")
>
>Hmm, looks like LLD might just do this now automatically for us
>too without --save-restore-funcs (https://reviews.llvm.org/D79977).
>But we probably still need it for older versions, so we still need
>your patch.

Hi,

I'm still seeing the error of crtsavres.o missing when building external modules
after "make LLVM=1 modules_prepare". Should it be built also in archprepare?

Thanks,
Jan


diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 051247027..a62334194 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -57,8 +57,11 @@ ifeq ($(CONFIG_PPC64)$(CONFIG_LD_IS_BFD),yy)
  # Have the linker provide sfpr if possible.
  # There is a corresponding test in arch/powerpc/lib/Makefile
  KBUILD_LDFLAGS_MODULE += --save-restore-funcs
+crtsavres_prepare:
  else
  KBUILD_LDFLAGS_MODULE += arch/powerpc/lib/crtsavres.o
+crtsavres_prepare:
+       $(MAKE) $(build)=arch/powerpc/lib arch/powerpc/lib/crtsavres.o
  endif

  ifdef CONFIG_CPU_LITTLE_ENDIAN
@@ -389,7 +392,7 @@ vdso_prepare: prepare0
                 $(build)=arch/powerpc/kernel/vdso include/generated/vdso64-offsets.h)
  endif

-archprepare: checkbin
+archprepare: checkbin crtsavres_prepare

  archheaders:
         $(Q)$(MAKE) $(build)=arch/powerpc/kernel/syscalls all

