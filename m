Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 548FF61152D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 16:51:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MzQTq0yhWz3fQR
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Oct 2022 01:51:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=U9faWpM7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::736; helo=mail-qk1-x736.google.com; envelope-from=yury.norov@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=U9faWpM7;
	dkim-atps=neutral
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MzQN60dPfz3fG6
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Oct 2022 01:46:13 +1100 (AEDT)
Received: by mail-qk1-x736.google.com with SMTP id k4so643687qkj.8
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Oct 2022 07:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0Eap9vgCOo567XBoaqrJtjJTPOneofbaWXwjzfOt/ko=;
        b=U9faWpM7anfFBwf3lzGgjWdNMgzIZ5MaBAebT8n2v2OUJY1IMy0pME/pjQqGG+QCfK
         7bZUQVJbFh+CxKQQwQ9R5DDx2LWJYCh9bHvuVmZHPmCZPkMxsq4v3oJXCIxrEtU2wyRC
         xULShKwG4KVA/V/y2mm6RzTgzuuWv442t/NvFxc8iUofWRjpiTJmB9Up3DOffi9xJubj
         RR/im5wg2HXy+AthCzdp6tuonbTc2TjHap3B8Gg0F07kxqFgPa43HIxP9DkvUH0elOgY
         5p7rsu2JPPbc+4Yasp+tik93X6+d2C8f2E2ZaK63ox8JmrIPJbDeHqmIGgxLkGGsIsze
         bCDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Eap9vgCOo567XBoaqrJtjJTPOneofbaWXwjzfOt/ko=;
        b=XH27LDiI4qScVR6dY7qOH78SKoK9/M28u3o6dUL9tfmyBx4xOkN1UrBAbYqIhDHfNa
         4iWIJNgcgLzp/I7HuCrvSgyAEMViMwZXvV74+LrZsmn+NNTTCaMUgIp94//VG/SPegCW
         6chLEvf/c0nOpABxqLBmNmeVgDdIykbEhZ4ZAz6juR5x0x/BM5RXZgBVvcuH2HkwKOUr
         uINpgZaXaIFfEIVVkREolcOkWu5/FdCTTtIqB2+Mrp+7HuDEokW9CaNbXmFq/Hfxer4m
         MagqRiA7twtoEuSVVeeJDxtJmzxBPR5VVAxu+AMcdhj2s7NrWk2tBAlfPUG5vlSQGDNO
         01ug==
X-Gm-Message-State: ACrzQf1lYPiz8wmboke2NFZJADrKmNizpbKTeYawC2CDcuGcw4U2rgQv
	BPziU8+tY/EOWQrKdipxJgQ=
X-Google-Smtp-Source: AMsMyM57AgHD6SgkTqjWVZle9kdelFZLgih4OaFJ7oUhyOHHF+SxLTt1A5EyJr2xvmD6EBJZRyNRIw==
X-Received: by 2002:ae9:ebce:0:b0:6f9:ff07:7295 with SMTP id b197-20020ae9ebce000000b006f9ff077295mr5459491qkg.655.1666968369100;
        Fri, 28 Oct 2022 07:46:09 -0700 (PDT)
Received: from localhost ([2601:589:4102:5fd2:5b94:d8b:99bf:707a])
        by smtp.gmail.com with ESMTPSA id x3-20020a05620a448300b006bbc09af9f5sm3032932qkp.101.2022.10.28.07.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 07:46:08 -0700 (PDT)
Date: Fri, 28 Oct 2022 07:46:08 -0700
From: Yury Norov <yury.norov@gmail.com>
To: Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH v3 2/2] x86: Fix /proc/cpuinfo cpumask warning
Message-ID: <Y1vrMMtRwb0Lekl0@yury-laptop>
References: <20221014155845.1986223-1-ajones@ventanamicro.com>
 <20221014155845.1986223-3-ajones@ventanamicro.com>
 <20221028074828.b66uuqqfbrnjdtab@kamzik>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221028074828.b66uuqqfbrnjdtab@kamzik>
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
Cc: Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, x86@kernel.org, linux-kernel@vger.kernel.org, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, openrisc@lists.librecores.org, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Thomas Gleixner <tglx@linutronix.de>, Albert Ou <aou@eecs.berkeley.edu>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 28, 2022 at 09:48:28AM +0200, Andrew Jones wrote:
> Hi x86 maintainers,
> 
> I realize 78e5a3399421 has now been reverted, so this fix is no longer
> urgent. I don't believe it's wrong, though, so if it's still of interest,
> then please consider this a friendly ping.
> 
> Thanks,
> drew

Hi Andrew,

I'll take it in bitmap-for-next this weekend.

Thanks,
Yury
