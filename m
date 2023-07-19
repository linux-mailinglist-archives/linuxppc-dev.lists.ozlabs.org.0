Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7E175982C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 16:24:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DGl5JY9H;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DGl5JY9H;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5dPX0zfXz30hQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jul 2023 00:24:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DGl5JY9H;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DGl5JY9H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=fmartine@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5dNg26DDz2yDd
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jul 2023 00:24:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689776639;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AYL0WxfELPHjwx6ZiDqavEiQQIijrcopNRfhrvLV03A=;
	b=DGl5JY9HyulFIN/2+f+illzXjr1CUuSPQJD1122DRrwP6xZ92xeN2pjhyAJKxa+HgV3FIl
	MynIC41Cm5gBRFdGnOCNo1AIeuuXPtrvlxSorh2+q4UwJ7JZyfc3uHorXVkAiFh5mHtz0H
	ecT14gFgxtldx91wuKFNLDzERZKBYqE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689776639;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AYL0WxfELPHjwx6ZiDqavEiQQIijrcopNRfhrvLV03A=;
	b=DGl5JY9HyulFIN/2+f+illzXjr1CUuSPQJD1122DRrwP6xZ92xeN2pjhyAJKxa+HgV3FIl
	MynIC41Cm5gBRFdGnOCNo1AIeuuXPtrvlxSorh2+q4UwJ7JZyfc3uHorXVkAiFh5mHtz0H
	ecT14gFgxtldx91wuKFNLDzERZKBYqE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-97-6T-bTnQiOwm4TBv9DMvG2A-1; Wed, 19 Jul 2023 10:23:56 -0400
X-MC-Unique: 6T-bTnQiOwm4TBv9DMvG2A-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-314394a798dso398051f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 07:23:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689776635; x=1690381435;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AYL0WxfELPHjwx6ZiDqavEiQQIijrcopNRfhrvLV03A=;
        b=ld2MB5hueAJ3XnFEytf420asXCFk082DX0eCVOvyAaLvbzCmq63056GZTJRSoYPJbG
         +dq3q5s8pJ2RHbJBL2oIW4zP+K/ISRlnrdmobVLQMrFz7gmuNHkXvb7+at4tGDsS3yl2
         iXWA3lzrQOJNe6bF9rj3MEmZz+tDYfGLXpr1733zCWcvOVP6BT6bOapB/9l1xm68ttjJ
         6NH7W/IHuv0yZkkXuhy/guYkZo9XOlDYahZh4faVjde2Uanqw+4p3zE1yFNXxoWeIqQ1
         3o9Fp2Yfq8MedF5OISpxooAw29vF7WVtMmQgLKLVm46H9vW4BoFhngp2NDS5zqJkFg+O
         xzow==
X-Gm-Message-State: ABy/qLZfKrNjN7mqRGmRvBnYvgAXU9f//3nWCQSdcKVRMpMvNbaUVI0e
	aUV0T0k9Wft5ZX6dK78B9qsohNlteoYK6ElDWrhbc57yxiJtKt1b3ULAOTdQl/FFYyDTaVP5IpD
	EcQwex6MGY1jUc40cJB8JfiJVSQ==
X-Received: by 2002:adf:f406:0:b0:317:15f5:a1cc with SMTP id g6-20020adff406000000b0031715f5a1ccmr41816wro.22.1689776635704;
        Wed, 19 Jul 2023 07:23:55 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHAuWaDn4wkaE25f0gFYugdobiggD0h46Z8p4U2s3LOHj24u3Bx+1zUs1XU1djJ3aSjiu0SQg==
X-Received: by 2002:adf:f406:0:b0:317:15f5:a1cc with SMTP id g6-20020adff406000000b0031715f5a1ccmr41757wro.22.1689776635405;
        Wed, 19 Jul 2023 07:23:55 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id q19-20020a056000137300b003143d80d11dsm5429196wrz.112.2023.07.19.07.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 07:23:54 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Arnd Bergmann <arnd@kernel.org>, linux-fbdev@vger.kernel.org, Thomas
 Zimmermann <tzimmermann@suse.de>, Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v2 7/9] vga16fb: drop powerpc support
In-Reply-To: <20230719123944.3438363-8-arnd@kernel.org>
References: <20230719123944.3438363-1-arnd@kernel.org>
 <20230719123944.3438363-8-arnd@kernel.org>
Date: Wed, 19 Jul 2023 16:23:53 +0200
Message-ID: <87a5vshtdy.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: linux-hyperv@vger.kernel.org, x86@kernel.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Will Deacon <will@kernel.org>, linux-efi@vger.kernel.org, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, "K. Y. Srinivasan" <kys@microsoft.com>, David Airlie <airlied@gmail.com>, Ard Biesheuvel <ardb@kernel.org>, Wei Liu <wei.liu@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Dexuan Cui <decui@microsoft.com>, Russell King <linux@armlinux.org.uk>, Deepak Rawat <drawat.floss@gmail.com>, Ingo Molnar <mingo@redhat.com>, Matt Turner <mattst88@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Haiyang Zhang <haiyangz@microsoft.com>, Nicholas Piggin <npiggin@gmail.com>, Bor
 islav Petkov <bp@alien8.de>, loongarch@lists.linux.dev, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Khalid Aziz <khalid@gonehiking.org>, Brian Cain <bcain@quicinc.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Daniel Vetter <daniel@ffwll.ch>, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Arnd Bergmann <arnd@kernel.org> writes:

> From: Arnd Bergmann <arnd@arndb.de>
>
> I noticed that commit 0db5b61e0dc07 ("fbdev/vga16fb: Create
> EGA/VGA devices in sysfb code") broke vga16fb on non-x86 platforms,
> because the sysfb code never creates a vga-framebuffer device when
> screen_info.orig_video_isVGA is set to '1' instead of VIDEO_TYPE_VGAC.
>
> However, it turns out that the only architecture that has allowed
> building vga16fb in the past 20 years is powerpc, and this only worked
> on two 32-bit platforms and never on 64-bit powerpc. The last machine
> that actually used this was removed in linux-3.10, so this is all dead
> code and can be removed.
>
> The big-endian support in vga16fb.c could also be removed, but I'd just
> leave this in place.
>
> Fixes: 933ee7119fb14 ("powerpc: remove PReP platform")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

