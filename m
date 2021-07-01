Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA68E3B8D77
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 07:42:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GFnDb5wpMz3bXL
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 15:42:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=Kkm76Z2l;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=dabbelt.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=palmer@dabbelt.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=dabbelt-com.20150623.gappssmtp.com
 header.i=@dabbelt-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=Kkm76Z2l; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GFnD61jk4z2yLl
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jul 2021 15:42:28 +1000 (AEST)
Received: by mail-pj1-x102d.google.com with SMTP id
 g6-20020a17090adac6b029015d1a9a6f1aso5244856pjx.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Jun 2021 22:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=TucwKz+v5DlXjwmmM09NetwoftkA7mGQQBXI3b6dl+k=;
 b=Kkm76Z2lV470qVfLtyiUDLmtQKzei2APSV0thxaZrOKiSAhzdzTDzpgblm5sGDRt3o
 CI0hm8v6tY+7Jwvw6YFPRuQkyFM7maNMPlsDY4yqNsxpYMF/3w00QiIIJwbfPgMw4nXR
 RGR+pbYdqeDcqI2vrI9z4XObeIbcXeiEUKM9FSnglLqKSCXHvFN/X1E87Nj5miGh7VSC
 8VFlUCRFgmJxzQfd0W+UDSnDD7k5PQEoqBO06dk2hXrFloh7Dln7zT80qolzcOe1i5tB
 RAbGrCCLfXhbUoDygscLB4ChVwqCH3BcGyMJElvunlqbOA3Y+lKVfG67OhDae1qtRUlg
 SW3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=TucwKz+v5DlXjwmmM09NetwoftkA7mGQQBXI3b6dl+k=;
 b=HzuctA+/50uks+rKCS9NQl7tZSdfmMWPYEk+en600EGQOzgLIPOIok/5jplYxkrdjB
 JgG6WMIv4HJgW9r9I1kOTsm2ybVVMbxYYvrz+KUyEviKF0TIQ5JWyxuSjQdrib/Pnc+9
 fXL6QVIVMHtWHHNc63CNsFyVV4PQsidE1N8HAkq/gpoakIH+4lVjSwo3fu180lpkZdRl
 Cx6O1Q/f0leeleW+scCQEq0DWA/qcxIvgukJ4JGbCAlQtow0HErW/EU0PES9/KkA2kU9
 sORY51uGEq4YcSG7oP34R7xAyiD8nYCIfTpx0ahXYgt5Fc/LvvCObCYAGOY2xDxfUfnD
 HB6g==
X-Gm-Message-State: AOAM533WGlt0LCud+K5HdK+vzwB3FNvCL3xMcikS57GZPLtTCqDqn+af
 nF4aIa7jvozh++lGEylwnnJdoA==
X-Google-Smtp-Source: ABdhPJzFry+rk3YDXS83UNhrZJ0tdLKvFcOJCxCk7WjA8qJLoODDQpCXWaDL9EydHVYOHi7ol68qhQ==
X-Received: by 2002:a17:902:988f:b029:114:12d2:d548 with SMTP id
 s15-20020a170902988fb029011412d2d548mr35586726plp.73.1625118144478; 
 Wed, 30 Jun 2021 22:42:24 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id m4sm8383520pjv.41.2021.06.30.22.42.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 22:42:24 -0700 (PDT)
Date: Wed, 30 Jun 2021 22:42:24 -0700 (PDT)
X-Google-Original-Date: Wed, 30 Jun 2021 22:42:22 PDT (-0700)
Subject: Re: [PATCH v6 0/3] Introduce 64b relocatable kernel
In-Reply-To: <8512c6b0-3dff-5485-b5d8-638044594973@ghiti.fr>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alex@ghiti.fr
Message-ID: <mhng-dd5e2fdf-d349-4114-9cbf-6041e2cd2b27@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, paulus@samba.org,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 17 Jun 2021 06:33:48 PDT (-0700), alex@ghiti.fr wrote:
> Le 18/05/2021 à 12:12, Alexandre Ghiti a écrit :
>> After multiple attempts, this patchset is now based on the fact that the
>> 64b kernel mapping was moved outside the linear mapping.
>>
>> The first patch allows to build relocatable kernels but is not selected
>> by default. That patch should ease KASLR implementation a lot.
>> The second and third patches take advantage of an already existing powerpc
>> script that checks relocations at compile-time, and uses it for riscv.
>
> @Palmer, any thought about that? There are no users for now, do you want
> to wait for a KASLR implementation to use it before merging this? If so,
> I can work on a KASLR implementation based on older implementation from
> Zong.

Sorry, I must have missed this patch set the first time through.  I 
don't see any reason to wait for KASLR before taking support for 
relocatable kernels, as relocatable kernelsa are useful on their own.

I'm not sure I'll have time to look at this for this cycle, but I'll try 
to find some time to given that it was posted a while ago.

>
> Thanks,
>
>>
>> This patchset was tested on:
>>
>> * kernel:
>> - rv32: OK
>> - rv64 with RELOCATABLE: OK and checked that "suspicious" relocations are caught.
>> - rv64 without RELOCATABLE: OK
>> - powerpc: build only and checked that "suspicious" relocations are caught.
>>
>> * xipkernel:
>> - rv32: build only
>> - rv64: OK
>>
>> * nommukernel:
>> - rv64: build only
>>
>> Changes in v6:
>>    * Remove the kernel move to vmalloc zone
>>    * Rebased on top of for-next
>>    * Remove relocatable property from 32b kernel as the kernel is mapped in
>>      the linear mapping and would then need to be copied physically too
>>    * CONFIG_RELOCATABLE depends on !XIP_KERNEL
>>    * Remove Reviewed-by from first patch as it changed a bit
>>
>> Changes in v5:
>>    * Add "static __init" to create_kernel_page_table function as reported by
>>      Kbuild test robot
>>    * Add reviewed-by from Zong
>>    * Rebase onto v5.7
>>
>> Changes in v4:
>>    * Fix BPF region that overlapped with kernel's as suggested by Zong
>>    * Fix end of module region that could be larger than 2GB as suggested by Zong
>>    * Fix the size of the vm area reserved for the kernel as we could lose
>>      PMD_SIZE if the size was already aligned on PMD_SIZE
>>    * Split compile time relocations check patch into 2 patches as suggested by Anup
>>    * Applied Reviewed-by from Zong and Anup
>>
>> Changes in v3:
>>    * Move kernel mapping to vmalloc
>>
>> Changes in v2:
>>    * Make RELOCATABLE depend on MMU as suggested by Anup
>>    * Rename kernel_load_addr into kernel_virt_addr as suggested by Anup
>>    * Use __pa_symbol instead of __pa, as suggested by Zong
>>    * Rebased on top of v5.6-rc3
>>    * Tested with sv48 patchset
>>    * Add Reviewed/Tested-by from Zong and Anup
>>
>> Alexandre Ghiti (3):
>>    riscv: Introduce CONFIG_RELOCATABLE
>>    powerpc: Move script to check relocations at compile time in scripts/
>>    riscv: Check relocations at compile time
>>
>>   arch/powerpc/tools/relocs_check.sh | 18 ++--------
>>   arch/riscv/Kconfig                 | 12 +++++++
>>   arch/riscv/Makefile                |  5 ++-
>>   arch/riscv/Makefile.postlink       | 36 ++++++++++++++++++++
>>   arch/riscv/kernel/vmlinux.lds.S    |  6 ++++
>>   arch/riscv/mm/Makefile             |  4 +++
>>   arch/riscv/mm/init.c               | 53 +++++++++++++++++++++++++++++-
>>   arch/riscv/tools/relocs_check.sh   | 26 +++++++++++++++
>>   scripts/relocs_check.sh            | 20 +++++++++++
>>   9 files changed, 162 insertions(+), 18 deletions(-)
>>   create mode 100644 arch/riscv/Makefile.postlink
>>   create mode 100755 arch/riscv/tools/relocs_check.sh
>>   create mode 100755 scripts/relocs_check.sh
>>
