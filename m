Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA45E70F4A0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 May 2023 12:59:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QR7Tz5kvLz3fBS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 May 2023 20:59:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=l3Y8DRIQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com; envelope-from=bagasdotme@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=l3Y8DRIQ;
	dkim-atps=neutral
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QR7T63238z2xjw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 May 2023 20:58:16 +1000 (AEST)
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-53469299319so94048a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 May 2023 03:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684925893; x=1687517893;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EtNtYGFCrVyZey4VNLOickd29YxbAE5d03gdnH81J+U=;
        b=l3Y8DRIQWeZSAkdFMfWSj0ifqiRCoUl+MxNzyGPTw4ZMaQ6QWphZ802TjCA9rSm9so
         WMG3R44sc0gr+xXBTBY7TCuICT3d45vwv+Fhc2Kif7HhDdftbNF0EkAGL8oVUJSe2Eay
         ZUaEtkJpPuwE8y8NK/iA7PUeSMknfa4tcoav5tGrXwUQFy8oRiNb9MqyPcTeGkb27rHp
         hMzPGBz5WgbeekaXTC+5mYde3P4XFoDPx30/BpGiJJRyymxVzStX6k13W/tbQ/2bM4zm
         Va38TCsEtvSD8nOdlVZbYfj30hYNmcztUhE7KWlVnuBOtz6HCt6W+ZPxpyac7saVfI9j
         9sDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684925893; x=1687517893;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EtNtYGFCrVyZey4VNLOickd29YxbAE5d03gdnH81J+U=;
        b=kcGT3wxcXK7FRydQCSL7yv/6F99GkQo6cVuxNOH5gdRQRbICovXHdPf3OaVtw27whF
         xIxHb/UjJpL2foW9O0u5ajJ5XaXp/kWfx583YdeHazbWCWVyYfo3jE30k8MR5apizm8F
         DxhKY/EpKHWRGdBtzUb2G+fI4hErqTy8edI8d6c6K021N4mZi0crApypRJTspa0M73p2
         g2NZe9X7nN56wDto3dHdWVxZPnOszp07dfDSIxmnwpdopG5ZKO1w31vh9hs0YUJAo4Ok
         m+5ZslS6HM+1qPS1Y+ld2slV1IcFR+vk2bF4KR13/MM+4HrjqfOZMuDjVDDoLQNdsYea
         8+4w==
X-Gm-Message-State: AC+VfDy34j7q9g+tsHe1dcVnKU8Zl4BtmoVHZ7PZQxZ7bcx2xukW+IPS
	YDEU/8MAKt17UtrjHz0bEdw=
X-Google-Smtp-Source: ACHHUZ4x3mbRZza/OnPc7Hf62AB/tvNESZBkKaby/M3eKCGQRKizRlGE/zRB69YbxrIb8Twc5v/liA==
X-Received: by 2002:a17:90a:bf8b:b0:253:727e:4b41 with SMTP id d11-20020a17090abf8b00b00253727e4b41mr15726441pjs.34.1684925893529;
        Wed, 24 May 2023 03:58:13 -0700 (PDT)
Received: from [192.168.43.80] (subs02-180-214-232-28.three.co.id. [180.214.232.28])
        by smtp.gmail.com with ESMTPSA id i2-20020a17090ac40200b0024de39e8746sm1110323pjt.11.2023.05.24.03.58.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 May 2023 03:58:13 -0700 (PDT)
Message-ID: <2a1cd5e6-01f7-66f9-1f9d-c655cc3f919b@gmail.com>
Date: Wed, 24 May 2023 17:58:07 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux PowerPC <linuxppc-dev@lists.ozlabs.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Linux Regressions <regressions@lists.linux.dev>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: ./include/linux/mmzone.h:1735:2: error: #error Allocator
 MAX_ORDER exceeds SECTION_SIZE (v6.4-rc3 build regression)
Content-Type: text/plain; charset=UTF-8
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
Cc: doru iorgulescu <doru.iorgulescu1@gmail.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, Fabiano Rosas <farosas@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Zi Yan <ziy@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, Disha Goel <disgoel@linux.vnet.ibm.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

I notice a powerpc[64?] build regression on Bugzilla [1]. Quoting from it:

>  CC      arch/powerpc/kernel/asm-offsets.s
> In file included from ./include/linux/gfp.h:7,
>                 from ./include/linux/xarray.h:15,
>                 from ./include/linux/list_lru.h:14,
>                 from ./include/linux/fs.h:13,
>                 from ./include/linux/compat.h:17,
>                 from arch/powerpc/kernel/asm-offsets.c:12:
> ./include/linux/mmzone.h:1735:2: error: #error Allocator MAX_ORDER exceeds SECTION_SIZE
> 1735 | #error Allocator MAX_ORDER exceeds SECTION_SIZE
>      |  ^~~~~
> make[5]: *** [scripts/Makefile.build:114: arch/powerpc/kernel/asm-offsets.s] Error 1

Apparently removing the errored line solves the problem for the reporter
(the attached dmesg on [2] looks fine at a glance).

Anyway, I'm adding it to regzbot:

#regzbot introduced: 23baf831a32c04f https://bugzilla.kernel.org/show_bug.cgi?id=217477
#regzbot title: Allocator MAX_ORDER exceeds SECTION_SIZE caused by MAX_ORDER redefinition

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=217477
[2]: https://bugzilla.kernel.org/show_bug.cgi?id=217477#c1

-- 
An old man doll... just what I always wanted! - Clara
