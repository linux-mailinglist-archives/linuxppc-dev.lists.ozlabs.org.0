Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9F873CB11
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jun 2023 15:27:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=j4S9zj7l;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QpFK93PDzz3bkD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jun 2023 23:27:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=j4S9zj7l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QpFJD5y7Qz304M
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Jun 2023 23:26:50 +1000 (AEST)
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-25eb777c7f2so731254a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Jun 2023 06:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687613205; x=1690205205;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=HzHR5VGsBkmKTRWsr9Fr6/IuDbgm5PM65lp5AFdyOdU=;
        b=j4S9zj7lUuy3sqeeDhUPOz9rwvMJbGSEdKnwRk/XZ+y08PrJVIgqGnCRVMjv5QysTG
         qw+xSrtWimmK0w+c8oUxGgA/hWWS3mddb5TfZRZZkZXCB9iy4qhZcLzmK/w1rFGHNOlD
         u6YXzvdMzyxYCBki+QXeLCsaSepsuUuVeoUWLvfvN2Dfxqqx0oSY8FZK/DD2zqhKZHfv
         RYvqwhQB7QGRxNAtgIU6NHSikcQzK9FTked9KfdwhJI/KFzaz6eCW0C1QabmKjtdXE0H
         kEFZFV+Sc13EU6p5oRwnRdHPaXUEyY8PcvUlBsvAgUzJqMVPy3L5lDhMq3dGib+XWXWt
         gQpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687613205; x=1690205205;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HzHR5VGsBkmKTRWsr9Fr6/IuDbgm5PM65lp5AFdyOdU=;
        b=HYaKaOIKRGGkcvycGGMjFOvYLPvmprqSMheC2N6qEmvyDxS45DYObVxE9ediQMY/Q0
         BfstL8znB3jyLbIOacd4WysIUab4TCDBRvc7tpXr2rCtSaAF2I/WYGelQkMZgBZ7aB1f
         Uf1Y5p80h93S3fS+SIZKbiBwBX4eHRyWcaKp0lfDXX08OBG7iMKwgzVFfPLu8QTfLcCK
         da+mzzm64lUKEhQr+i5Mp6rFqOMtNYDgGes/QDinc8+lshsmyjdk+RPc+FNH0mhLKAHM
         J8PWXmbsUksKuCWhZ4ozC/uM+KWOjvkusYRFrZyCneg21JrLtzsjYrCeNA6xkTePGVZY
         6uWQ==
X-Gm-Message-State: AC+VfDyhuhvffBFkm1+h1Hcq9zJkJ7NyooyK6e2iV009gYFydKaUizFy
	E7t9skaArRQR+mtlUrGjTo4=
X-Google-Smtp-Source: ACHHUZ7BC5DQswxC/X8knfo6PJ0Ce0pzV2b4lrahqjLtajzjQRmz1UcB8/ZZrwmJOMsABWyiGJPEWQ==
X-Received: by 2002:a17:90b:251:b0:25b:d304:6eaf with SMTP id fz17-20020a17090b025100b0025bd3046eafmr14080091pjb.24.1687613204832;
        Sat, 24 Jun 2023 06:26:44 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n189-20020a6327c6000000b0055387ffef10sm1282333pgn.24.2023.06.24.06.26.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 06:26:44 -0700 (PDT)
Message-ID: <d4156e51-102f-36b4-e42c-938268b4b608@roeck-us.net>
Date: Sat, 24 Jun 2023 06:26:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [v3,17/19] arch/sparc: Implement fb_is_primary_device() in source
 file
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20230417125651.25126-18-tzimmermann@suse.de>
 <c525adc9-6623-4660-8718-e0c9311563b8@roeck-us.net>
 <55130a50-d129-4336-99ce-3be4229b1c7d@app.fastmail.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <55130a50-d129-4336-99ce-3be4229b1c7d@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Linux-Arch <linux-arch@vger.kernel.org>, linux-fbdev@vger.kernel.org, linux-snps-arc@lists.infradead.org, linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>, Helge Deller <deller@gmx.de>, x86@kernel.org, Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, sparclinux@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/24/23 02:27, Arnd Bergmann wrote:
> On Sat, Jun 24, 2023, at 03:55, Guenter Roeck wrote:
>>
>> On Mon, Apr 17, 2023 at 02:56:49PM +0200, Thomas Zimmermann wrote:
>>> Other architectures implment fb_is_primary_device() in a source
>>> file. Do the same on sparc. No functional changes, but allows to
>>> remove several include statement from <asm/fb.h>.
>>>
>>> v2:
>>> 	* don't include <asm/prom.h> in header file
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> Cc: "David S. Miller" <davem@davemloft.net>
>>
>> This patch results (or appears to result) in the following build error
>> when trying to build sparc64:allmodconfig.
>>
>> Error log:
>> <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
>> WARNING: modpost: drivers/cpufreq/sparc-us2e-cpufreq: section mismatch
>> in reference: cpufreq_us2e_driver+0x20 (section: .data) ->
>> us2e_freq_cpu_init (section: .init.text)
>> WARNING: modpost: drivers/cpufreq/sparc-us3-cpufreq: section mismatch
>> in reference: cpufreq_us3_driver+0x20 (section: .data) ->
>> us3_freq_cpu_init (section: .init.text)
>> ERROR: modpost: "__xchg_called_with_bad_pointer" [lib/atomic64_test.ko]
>> undefined!
> 
> These all look like old bugs that would be trivially fixed if
> anyone cared about sparc.
> 

Odd argument, given that this _is_ a sparc patch. Those may be old
bugs, but at least in 6.4-rc7 sparc64:allmodconfig does at least compile.

Sure, I can stop build testing it if that is where things are going.

Guenter

>> ERROR: modpost: missing MODULE_LICENSE() in arch/sparc/video/fbdev.o
> 
> I checked that there are no callers of fb_is_primary_device()
> in built-in code when CONFIG_FB is =m, so adding the MODULE_LICENSE()
> and MODULE_DESCRIPTION() tags to the file is the correct fix.
> 
>      Arnd

