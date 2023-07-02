Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A865B744E0E
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Jul 2023 16:12:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=CUwaDrb2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qv9wy4Psyz3bxY
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 00:12:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=CUwaDrb2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com; envelope-from=bagasdotme@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qv9w16KZnz3075
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jul 2023 00:11:28 +1000 (AEST)
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-55af0a816e4so1862846a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 02 Jul 2023 07:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688307086; x=1690899086;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3ivs+q0bj7Qjxz2IiyBr82w8PQwpyo1fbvjPNqY7ooY=;
        b=CUwaDrb2T9ha5dPZ3V9rZp++iApzuUxp1qBYCNzDSosdkRYW6xDmU61B8d2TjF8jV1
         Z6hDLNIVgWIQEFbPTrXMwbexw8Hjzo6X2cI3VIfkbJdNPE9u8qvr5TNDxJ1Jr3bNmfiZ
         hq8yzLDHUGUodCSFAXYukebMlceqfXW7viUFU9f/joifL78AOmyOlI+QdPFZA/hkJpvt
         +41Fa+kGcPjfpHL8v1Lp9OoyDzLEoQEi8HIrOFNbs8lc2YitP7uwhm2SFeCAARPdXzWn
         AA5Qfu8tYii59oy2mJ8L9GODyZCB/EJQ6QeKiOE5PAgAqWeMvvbm6YQbGYeRqsAB24md
         LeGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688307086; x=1690899086;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3ivs+q0bj7Qjxz2IiyBr82w8PQwpyo1fbvjPNqY7ooY=;
        b=DvPcgMa6YS/nKaXGF1GPjQ9qEMydJHFl17OqZVTxqTG82u4guCZvshUpgT+WBprMI6
         bqv0PJ9bbm9+tPHf3EENn0wCWDoI2DMCvjOQntOTdySFVLvLGk4OIpj+cuv47MbpvCSs
         rL8MI0OH4jmnfkw/80l3CvTxJM86o30vXAp4pqySPhYJAllXAdonpvjSS4he8a0Tx4mm
         kakxoFS6/d6r9CSIfU2X/sSdE4lG0MTXFh2e7zwWjcQjR3EOki5ZMrpQg+SHsh3DYJeE
         FpdO7HAuDQxqrnucO7bq55tMYX1PAxxBFMOcxCcgyg/wLrn3/KmtXhpk0wjJUfHWqUid
         0d5Q==
X-Gm-Message-State: ABy/qLZ4DQ+2xwaOrpevwEMpXzXX7DbDiyJBaSpwoxe8oMs4ULZ+crfb
	vGBuxXACnpOoNwPVCkjzu4Q=
X-Google-Smtp-Source: APBJJlGvN2Usr+JzDs2tOPcsiSrDfp1sHI7MMhqo/KzQjMYzTVozbL/PHOEn8emK002vzeudgn6NhQ==
X-Received: by 2002:a05:6a20:6a0f:b0:119:5af7:7cef with SMTP id p15-20020a056a206a0f00b001195af77cefmr7833284pzk.56.1688307085745;
        Sun, 02 Jul 2023 07:11:25 -0700 (PDT)
Received: from [192.168.0.103] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id x48-20020a056a000bf000b0062cf75a9e6bsm1589746pfu.131.2023.07.02.07.11.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Jul 2023 07:11:25 -0700 (PDT)
Message-ID: <306e4057-5e40-f0c1-d06b-2adab0eee37d@gmail.com>
Date: Sun, 2 Jul 2023 21:11:15 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: Memory corruption in multithreaded user space program while
 calling fork
Content-Language: en-US
To: Jacob Young <jacobly.alt@gmail.com>
References: <facbfec3-837a-51ed-85fa-31021c17d6ef@gmail.com>
 <CALrpxLe2VagXEhsHPb9P4vJC97hkBYkLswFJB_jmhu1K+x_QhQ@mail.gmail.com>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <CALrpxLe2VagXEhsHPb9P4vJC97hkBYkLswFJB_jmhu1K+x_QhQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Linux Regressions <regressions@lists.linux.dev>, Linux PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Memory Management <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, Laurent Dufour <ldufour@linux.ibm.com>, Suren Baghdasaryan <surenb@google.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/2/23 19:40, Jacob Young wrote:
>> Jacob: Can you repeat bisection please? Why did you skip VMA lock-based
> page fault commits in your bisection?
> 
> All skips were due to compile errors of the form:
> make[3]: 'install_headers' is up to date.
> In file included from ./include/linux/memcontrol.h:20,
>                  from ./include/linux/swap.h:9,
>                  from ./include/linux/suspend.h:5,
>                  from arch/x86/kernel/asm-offsets.c:14:
> ./include/linux/mm.h: In function ‘vma_try_start_write’:
> ./include/linux/mm.h:702:37: error: ‘struct vm_area_struct’ has no member named ‘vm_lock’
>   702 |         if (!down_write_trylock(&vma->vm_lock->lock))
>       |                                     ^~
> ./include/linux/mm.h:706:22: error: ‘struct vm_area_struct’ has no member named ‘vm_lock’
>   706 |         up_write(&vma->vm_lock->lock);
>       |                      ^~
> make[1]: *** [scripts/Makefile.build:114: arch/x86/kernel/asm-offsets.s] Error 1
> make: *** [Makefile:1286: prepare0] Error 2
> 

1. Please don't send HTML emails as mailing lists reject them.
2. Reply inline with appropriate context, rather than top-post reply.

-- 
An old man doll... just what I always wanted! - Clara

