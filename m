Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3354D69ECDF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 03:36:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PM0dn0Rycz3cBj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 13:36:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kWysoQoo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=bagasdotme@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kWysoQoo;
	dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PM0cp3VdBz3bjj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Feb 2023 13:35:20 +1100 (AEDT)
Received: by mail-pl1-x633.google.com with SMTP id l15so8368216pls.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Feb 2023 18:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sfK3woxIut4xGTzLAkiQfXQIcfWpE/7Qzo8uszx3v2s=;
        b=kWysoQooFn4nw3/bn/+vU16ECuGi39HWe+fUn8n5N4TBsydCkcTX2pyQ5ihXoww2Dm
         jyqMz/kWpvsNO0yvowIEq8oGrin62OTmFCLBiLq8pbNV5Si0KgTrkZoxvU84AoPbeFLT
         IoIundv9qfuGBFBmto9K08PXvDoiR7Ii7i4Z9mYzv/yhwglZHEiMmtyX7l89MYCaSzzh
         ZU9NiKKid1E+kX2R4ASEFF9assVlPEIjsFx0GQvpmRc8C9vdZ9+Lm92+J6jDIu+rQQz/
         pbdXuxUNuQrwVE7CULVnxDnyjmeyn4qTpvsD/lcahLy4lZFAxtsZ7nTHk3T0zaCi+/0F
         erog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sfK3woxIut4xGTzLAkiQfXQIcfWpE/7Qzo8uszx3v2s=;
        b=Lv9axPMD0drTULM+L1luZD3lBPO3WA4m3ncTAC2EMjmSaxC2xhmqzZ66HEDqFMkhF5
         K7xTzIz4YXyFd3jKSU8eiMnZM38YQWAA4K4Yh8cWzUml+cYnCu7cwyIACAJmNdUvnwW4
         C3lBcRdiVVh4lmD9dItAInfcnKdmz3WYXS0KMUzePOPtsvFJHtXFpHkvYPVFUFSy895Y
         qivAS31Oxrjyr/zsvbFSyt8GeFwENZcdthWaCBstJRqYBGXBCPYIRFcsTeKx1Nz41o2A
         CkRU43a9LYZlRPpZ3GQ8O8fQktAxaWDB1Yao815u0vBaqyj9YVgSF3xPEogO5cuH2Zzw
         l1Tg==
X-Gm-Message-State: AO0yUKUsDMjiJ3rJa9RDAFjieFXz0GTcGe4ijOxcieJrLrDdieah9mbg
	f6QfvEsdn5dD41xAMu5MDAI=
X-Google-Smtp-Source: AK7set+JY+eDg/St3c7J8nTXQ4gJWj8e2nUOPULbrlLZqedGI+XUNJ8SsQbCLE9vUMK0ufylO3GkCQ==
X-Received: by 2002:a17:903:805:b0:195:f3e3:b923 with SMTP id kr5-20020a170903080500b00195f3e3b923mr6609389plb.8.1677033316489;
        Tue, 21 Feb 2023 18:35:16 -0800 (PST)
Received: from [192.168.43.80] (subs32-116-206-28-13.three.co.id. [116.206.28.13])
        by smtp.gmail.com with ESMTPSA id c7-20020a170902848700b0019956488546sm10480403plo.277.2023.02.21.18.35.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Feb 2023 18:35:16 -0800 (PST)
Message-ID: <c69dc6be-9642-2876-5375-d536f49d0403@gmail.com>
Date: Wed, 22 Feb 2023 09:35:13 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: linux-next tree panic on ppc64le
Content-Language: en-US
To: Murphy Zhou <jencce.kernel@gmail.com>,
 Linux-Next <linux-next@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org
References: <CADJHv_tWJKgqfXy=2mynVG0U2bJaVqYo59F_OPfdRRptNOV-WQ@mail.gmail.com>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <CADJHv_tWJKgqfXy=2mynVG0U2bJaVqYo59F_OPfdRRptNOV-WQ@mail.gmail.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/22/23 07:55, Murphy Zhou wrote:
> Hi,
> 
> [   59.558339] ------------[ cut here ]------------
> [   59.558361] kernel BUG at arch/powerpc/kernel/syscall.c:34!
> [   59.558373] Oops: Exception in kernel mode, sig: 5 [#1]
> [   59.558384] LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA PowerNV
> [   59.558397] Modules linked in: rfkill i2c_dev sunrpc ast
> i2c_algo_bit drm_shmem_helper drm_kms_helper ext4 syscopyarea
> sysfillrect sysimgblt ofpart ses powernv_flash enclosure
> scsi_transport_sas ipmi_powernv at24 mbcache jbd2 ipmi_devintf
> regmap_i2c opal_prd ipmi_msghandler mtd ibmpowernv drm fuse
> drm_panel_orientation_quirks xfs libcrc32c sd_mod t10_pi
> crc64_rocksoft_generic crc64_rocksoft crc64 sg i40e aacraid vmx_crypto
> [   59.558494] CPU: 29 PID: 6366 Comm: kexec Not tainted 6.2.0-next-20230221 #1
> [   59.558508] Hardware name: CSE-829U POWER9 0x4e1202
> opal:skiboot-v6.0.7 PowerNV
> [   59.558521] NIP:  c000000000031e4c LR: c00000000000d520 CTR: c00000000000d3c0
> [   59.558534] REGS: c000000097247b70 TRAP: 0700   Not tainted
> (6.2.0-next-20230221)
> [   59.558548] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR:
> 84424840  XER: 00000000
> [   59.558570] CFAR: c00000000000d51c IRQMASK: 3
> [   59.558570] GPR00: c00000000000d520 c000000097247e10
> c0000000014b1400 c000000097247e80
> [   59.558570] GPR04: 0000000084424840 0000000000000000
> 0000000000000000 0000000000000000
> [   59.558570] GPR08: 0000000000000000 900000000280b033
> 0000000000000001 0000000000000000
> [   59.558570] GPR12: 0000000000000000 c0000007fffcb280
> 0000000000000000 0000000000000000
> [   59.558570] GPR16: 0000000000000000 0000000000000000
> 0000000000000000 0000000000000000
> [   59.558570] GPR20: 0000000000000000 0000000000000000
> 0000000000000000 0000000000000000
> [   59.558570] GPR24: 0000000000000000 0000000000000000
> 0000000000000000 0000000000000000
> [   59.558570] GPR28: 0000000000000000 0000000084424840
> c000000097247e80 c000000097247e10
> [   59.558689] NIP [c000000000031e4c] system_call_exception+0x5c/0x340
> [   59.558705] LR [c00000000000d520] system_call_common+0x160/0x2c4
> [   59.558719] Call Trace:
> [   59.558725] [c000000097247e10] [c000000000031f18]
> system_call_exception+0x128/0x340 (unreliable)
> [   59.558743] [c000000097247e50] [c00000000000d520]
> system_call_common+0x160/0x2c4
> [   59.558759] --- interrupt: c00 at plpar_hcall+0x38/0x60
> [   59.558770] NIP:  c0000000000f58dc LR: c00000000011277c CTR: 0000000000000000
> [   59.558783] REGS: c000000097247e80 TRAP: 0c00   Not tainted
> (6.2.0-next-20230221)
> [   59.558796] MSR:  900000000280b033
> <SF,HV,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 84424840  XER: 00000000
> [   59.558821] IRQMASK: 0
> [   59.558821] GPR00: 0000000084424840 c0000000972479e0
> c0000000014b1400 000000000000041c
> [   59.558821] GPR04: 0000000097ff4000 0000000000000200
> c000000097247930 c0000007fe233ef8
> [   59.558821] GPR08: 0000000000000000 0000000000000000
> 0000000000000000 0000000000000000
> [   59.558821] GPR12: 0000000000000000 c0000007fffcb280
> 0000000000000000 0000000000000000
> [   59.558821] GPR16: 0000000000000000 0000000000000000
> 0000000000000000 0000000000000000
> [   59.558821] GPR20: 0000000000000000 0000000000000000
> 0000000000000000 0000000000000000
> [   59.558821] GPR24: 0000000000000004 c0000000ba704000
> 00000000000000c6 c008000014d20000
> [   59.558821] GPR28: 000000000417b200 0000000000000000
> c0000000af848800 c000000097ff4000
> [   59.558935] NIP [c0000000000f58dc] plpar_hcall+0x38/0x60
> [   59.558946] LR [c00000000011277c] _plpks_get_config+0x7c/0x270
> [   59.558958] --- interrupt: c00
> [   59.558966] [c0000000972479e0] [c00000000011275c]
> _plpks_get_config+0x5c/0x270 (unreliable)
> [   59.558982] Code: 7c9d2378 60000000 60000000 39200000 0b090000
> 60000000 e93e0108 692a0002 794affe2 0b0a0000 692a4000 794a97e2
> <0b0a0000> e95e0138 794a07e0 0b0a0000
> [   59.559018] ---[ end trace 0000000000000000 ]---
> [   60.564314] pstore: backend (nvram) writing error (-1)
> [   60.564336]
> [   61.564343] Kernel panic - not syncing: Fatal exception

Panic on what linux-next tag? Can you test powerpc/next tree?

-- 
An old man doll... just what I always wanted! - Clara

