Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E85E043F440
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Oct 2021 03:06:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HgPPm6Vz7z3dbj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Oct 2021 12:06:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=oyp+4Zpo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::229;
 helo=mail-lj1-x229.google.com; envelope-from=digetx@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=oyp+4Zpo; dkim-atps=neutral
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HgKW43sPkz2yPD;
 Fri, 29 Oct 2021 09:10:24 +1100 (AEDT)
Received: by mail-lj1-x229.google.com with SMTP id k13so13143999ljj.12;
 Thu, 28 Oct 2021 15:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oJ/0ZuzBVjUo38Wh85+gleqyoNxUo2tupcS3OG//HMk=;
 b=oyp+4ZpoBN8sNbj4o8xY6UXK7DWV+2AXCzvhz53IZDVW7yBXuU0WcYtlG9nrr26Gko
 pspAZNzk5nSawwOoCboqqIBx1NtwU9YP7ClGYgBOs5f5QS+oYjdLS6Chq+lHwnAJsaRE
 aw808EWXPhfWuOImaYWLgQPkx/4+EXGI76qDso1CJ2aKNZ2aChJYUzNXxoU4wlUL2Pxg
 oy7RsSyXKkJJvyMzgbQsMkVQ26q7g1vnPJco9ifX2k6oVsTB9g0J3QdHglNbFRrrT6c8
 P9uyPf++7eB6LV3eSwFOc5BxbfYBVDwZrUUANM1FlvuP72N8IokbXokq1o8sSzQ34LI5
 dsGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oJ/0ZuzBVjUo38Wh85+gleqyoNxUo2tupcS3OG//HMk=;
 b=0aqIu+uQ9AHDGdD2doPGUiFqHgbdoDGcnpzPekZy01lcyVBUzxML012W3hNpjcqIT9
 IF259nnmCe6BOPyQZo84qJN/mKfhaKeh/zLRNrse+SmSs5qkMv3WuKZwnWFJIQz2z+dN
 q8NtwmlMJRB8M//rkpJb4nebJIarCi6apZM1a2Sv62JY5H1xnSQ7iiKzznZKQLaL4bpi
 7IGI10gbFjCszq2w7kdp2bp5eEcx7rgk63aWc12dObEnt+yCseld1BtytF/VTFsOU/ca
 x/VKnoHHGnFUT6MwStUe0eFEh/OqWtGCNGc+UyuhNvuciCC8v6mE91lF6ywvYcH3dNZr
 of6Q==
X-Gm-Message-State: AOAM531RwD/6GKxmOCZSkq/vPFF8Bk4l2O5IRwyuDIr6uAMP4vns6bb4
 pZA+p0QRBO+ZdphR6VevG9Q=
X-Google-Smtp-Source: ABdhPJykwIAUVmO5wKdpzX+/iWk6pBH4AnIAWbvXPbs4nxxBZpydFbV5fsYhpk8QZgUr9D29NxqkEQ==
X-Received: by 2002:a2e:361a:: with SMTP id d26mr7788286lja.104.1635459020939; 
 Thu, 28 Oct 2021 15:10:20 -0700 (PDT)
Received: from [192.168.2.145] (46-138-44-18.dynamic.spd-mgts.ru.
 [46.138.44.18])
 by smtp.googlemail.com with ESMTPSA id x26sm406331ljh.24.2021.10.28.15.10.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 15:10:20 -0700 (PDT)
Subject: Re: [PATCH v2 03/45] notifier: Add
 atomic/blocking_notifier_has_unique_priority()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20211027211715.12671-1-digetx@gmail.com>
 <20211027211715.12671-4-digetx@gmail.com>
 <YXqCz/utp2DFJJ45@smile.fi.intel.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ba9d1a3f-c3e4-7060-9859-97014aa633b4@gmail.com>
Date: Fri, 29 Oct 2021 01:10:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YXqCz/utp2DFJJ45@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 29 Oct 2021 12:02:21 +1100
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rich Felker <dalias@libc.org>,
 linux-ia64@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 Tali Perry <tali.perry1@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Thierry Reding <thierry.reding@gmail.com>, Guo Ren <guoren@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Benjamin Fair <benjaminfair@google.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-sh@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
 Helge Deller <deller@gmx.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>, Tony Lindgren <tony@atomide.com>,
 Chen-Yu Tsai <wens@csie.org>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, xen-devel@lists.xenproject.org,
 linux-mips@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Len Brown <lenb@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-pm@vger.kernel.org,
 =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
 Vladimir Zapolskiy <vz@mleia.com>, linux-acpi@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, Mark Brown <broonie@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-tegra@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-omap@vger.kernel.org,
 Nancy Yuen <yuenn@google.com>, linux-arm-kernel@lists.infradead.org,
 Juergen Gross <jgross@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 Nick Hu <nickhu@andestech.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, Joshua Thompson <funaho@jurai.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

28.10.2021 14:00, Andy Shevchenko пишет:
>> +	while ((*nl) != NULL && (*nl)->priority >= n->priority) {
> ' != NULL' is not needed.
> 

I'll change it in v3, thanks.
