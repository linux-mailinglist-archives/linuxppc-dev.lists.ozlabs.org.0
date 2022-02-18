Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A381C4BED87
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Feb 2022 00:01:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K2d8603qXz3cHC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Feb 2022 10:01:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HwIPNQm6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::232;
 helo=mail-lj1-x232.google.com; envelope-from=geomatsi@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=HwIPNQm6; dkim-atps=neutral
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K0SMC0VM4z3cC3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Feb 2022 21:18:12 +1100 (AEDT)
Received: by mail-lj1-x232.google.com with SMTP id o9so3572173ljq.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Feb 2022 02:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2ZwRbT+1qqEejXkPLNRT0P8U1UfOqBbbk2S+jBiDX7w=;
 b=HwIPNQm6bvP1qyt1DqVyrK6i1IxYBe3pF4kvKD1l9aL3skpcmD5TAiFiTR6vJgOz7B
 t0z9AUGb6zG6pfmU+9BHmWZjjYP8p3JYLtLTfoKdh3BnjyAxS8kyH7aEYnXi01jFZIzF
 573soHdCsmr3/P5ZM1x4mLpZvC48QquGUZEsW8SQQoM18/kWlPpgaxZHrqDS4b16t7Hk
 CPrKR07D3pDZ+6DpMa26njx9Ou6mX/WqALsfbj1Nd6drypXMoKGnpqS7eLYJp4gC/zQZ
 HSj8/Kstfvi7dLE4U0H5uDSTCcko9eMQl/aHEl20oLYR3YeK8yM1gI0YoPwa5+wSkB+m
 kvAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2ZwRbT+1qqEejXkPLNRT0P8U1UfOqBbbk2S+jBiDX7w=;
 b=mjIwL7Pph47jY8BshcZauvjIjeljsDqkLX+PwxzHsDXOgkxFHekutrXhNRbeJmnXTm
 01Q6o8VJE8JWZKyoudNEUzJSFJ0lV7M9dvBfa93EIBvoDxfQ9cNhQPH435Y2OxDuM05z
 yLS26JvTx00JzIuJfbYFhAEZjjM/VgMhzkV179RGuis3XB3oAVa2hdeX6DciZyJNeiA1
 Aaswm1I6SAUozcV6x4z8PMDzUiZHT/kd10Y4ufl/uS+3oSyGWlfsJ86+0Y8V5mW1PFKA
 mDsxX6nI6H1sDShNG3LMBPJiPEa1wN25bLCyZ3EF3ARBgIo/7h0liMOgRNklh6fCXerg
 D/RA==
X-Gm-Message-State: AOAM532a3lt1Zmkuddj8S/Dgj39toE1SruLAQfcFeHnV+UpsLhVmmfbM
 0Q5L5Bq8rlcnAPRHln2w3qs=
X-Google-Smtp-Source: ABdhPJzoG5dWVDHzQOQKtFLm+HFsVZSdj/YZ6lPLZtzc83WeDz9kMHzkcgdFaN0a4Fhn9IjcgX1EIQ==
X-Received: by 2002:a05:651c:1594:b0:244:d406:5224 with SMTP id
 h20-20020a05651c159400b00244d4065224mr5639426ljq.130.1645179485463; 
 Fri, 18 Feb 2022 02:18:05 -0800 (PST)
Received: from curiosity ([5.188.167.245])
 by smtp.gmail.com with ESMTPSA id k18sm207268lfg.217.2022.02.18.02.18.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 02:18:04 -0800 (PST)
Date: Fri, 18 Feb 2022 13:18:03 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH v2 18/18] uaccess: drop maining CONFIG_SET_FS users
Message-ID: <Yg9yWxqD4RO7jI2g@curiosity>
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-19-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220216131332.1489939-19-arnd@kernel.org>
X-Mailman-Approved-At: Tue, 22 Feb 2022 10:00:38 +1100
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
Cc: mark.rutland@arm.com, dalias@libc.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, peterz@infradead.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, guoren@kernel.org, sparclinux@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org,
 will@kernel.org, Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, bcain@codeaurora.org, deller@gmx.de,
 x86@kernel.org, linux@armlinux.org.uk, linux-csky@vger.kernel.org,
 ardb@kernel.org, mingo@redhat.com, geert@linux-m68k.org,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 arnd@arndb.de, hca@linux.ibm.com, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 viro@zeniv.linux.org.uk, shorne@gmail.com, monstr@monstr.eu,
 tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, nickhu@andestech.com,
 jcmvbkbc@gmail.com, linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 dinguyen@kernel.org, ebiederm@xmission.com, richard@nod.at,
 akpm@linux-foundation.org, Linus Torvalds <torvalds@linux-foundation.org>,
 davem@davemloft.net, green.hu@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Arnd,

> From: Arnd Bergmann <arnd@arndb.de>
> 
> There are no remaining callers of set_fs(), so CONFIG_SET_FS
> can be removed globally, along with the thread_info field and
> any references to it.
> 
> This turns access_ok() into a cheaper check against TASK_SIZE_MAX.
> 
> With CONFIG_SET_FS gone, so drop all remaining references to
> set_fs()/get_fs(), mm_segment_t and uaccess_kernel().
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Tested-by: Sergey Matyukevich <sergey.matyukevich@synopsys.com> # for arc changes

Regards,
Sergey
