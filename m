Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 674FC70028B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 May 2023 10:33:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QHhr22DhZz3fZV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 May 2023 18:33:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=XJuAKB5U;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=bagasdotme@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=XJuAKB5U;
	dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QHhq83qtRz3bh3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 May 2023 18:33:08 +1000 (AEST)
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-52cb78647ecso5669517a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 May 2023 01:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683880385; x=1686472385;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x53jitR+5ZS0lsQhUwqNwHmvFRGxLktN4AjS2lQkxd0=;
        b=XJuAKB5UOqUfZw9wUydMc9bHTnQC6/O56kq0p5Igr+wJbo6sBG48L1NRzhleKc3nNY
         XMuVg7apUg5ub68mszAzEc1y8L1qu8x3oHlQt37k/M7wKdVeYuAsL40xk45z3LCvx6Ad
         sPYMxeEzD8sBDkiSDh3Z206JWx9LyrRdB+QPbGFycI6l9WyJdx8e4GrqPrvnXM4sNs/l
         Dp6lyLhugBiuZO1Rv6c2TgRzfpTf44jCmX6Gj0wasWpW1YZpxpc0+LwKmSLTkX6oN128
         ImYsuGMuElDLt64p+XeFLXgRiHSDWKJ+ZIUR4AxDKk9oYvXP0GAeVJOIyVhdNZFojM63
         Ipxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683880385; x=1686472385;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x53jitR+5ZS0lsQhUwqNwHmvFRGxLktN4AjS2lQkxd0=;
        b=BeDcBTj3COY//ql20dn8t8qvOB6iMZdcDhkd6E7ZLGUpddZ7zvIqoGBZ6j9ToOk2cm
         fy2xhMXv8GU1Ev885GaBiB9U0fYMfB5PGfwLYFNB/Egeg72aUNnJSYMQj6ucW1WdLPsx
         AyuABvUMK18805K9XzoImk5xF8c49C/Jy8WibIXXsmPGmFT9CCBrdkOkK7y6inRaPnKs
         iZFtKK7jNododMKNHUaToBYn2EPmYuNzrpmfQ3onYPFPy0WYUN8jYRxqENil+0OSLv+8
         WWsr/7fNF18bmBuKhfA1NIxh45NqIaC0raMxzfvU6AnCmb/8PL5eNmPhq7kdNuiaD3p2
         g0Rg==
X-Gm-Message-State: AC+VfDwjQAbzZIChX+BdxYosbOMpSynunl/gde2v2dvRy9vTXtY9V7Qe
	u9DO+4rWR1TXrLtwCPpA9ZU=
X-Google-Smtp-Source: ACHHUZ69dfi0/XuETklEsPrw1ZScu3oU8yr8yBQSdIPoHvkw6INo2XlIycmvllqn0DtqiCmUr6GJqA==
X-Received: by 2002:a17:903:238d:b0:1a6:83fa:b370 with SMTP id v13-20020a170903238d00b001a683fab370mr22681306plh.2.1683880385195;
        Fri, 12 May 2023 01:33:05 -0700 (PDT)
Received: from [192.168.43.80] (subs32-116-206-28-8.three.co.id. [116.206.28.8])
        by smtp.gmail.com with ESMTPSA id i2-20020a170902c94200b001a988a71617sm7360566pla.192.2023.05.12.01.33.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 May 2023 01:33:04 -0700 (PDT)
Message-ID: <3e5548e4-5a3e-9346-ec58-3617e1947186@gmail.com>
Date: Fri, 12 May 2023 15:32:57 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: Fwd: Linux 6.3.1 + AMD RX 570 on ppc64le 4K: Kernel attempted to
 read user page (1128) - exploit attempt? (uid: 0)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Regressions <regressions@lists.linux.dev>,
 Linux for PowerPC <linuxppc-dev@lists.ozlabs.org>,
 Linux AMDGPU <amd-gfx@lists.freedesktop.org>
References: <588c1a66-9976-c96f-dcdd-beec8b7410f0@gmail.com>
Content-Language: en-US
In-Reply-To: <588c1a66-9976-c96f-dcdd-beec8b7410f0@gmail.com>
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
Cc: Qingqing Zhuo <qingqing.zhuo@amd.com>, Fangzhi Zuo <Jerry.Zuo@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>, darkbasic@linuxsystems.it, Hersen Wu <hersenxs.wu@amd.com>, Alex Deucher <alexander.deucher@amd.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/11/23 15:06, Bagas Sanjaya wrote:
> Hi,
> 
> I notice a regression report on bugzilla ([1]). As many developers
> don't keep an eye on it, I decide to forward it by email.
> 
> Quoting from it:
> 
>>  darkbasic 2023-05-10 13:36:37 UTC
>>
>> I'm using Gentoo Linux on a Raptor CS Talos 2 ppc64le, GPU is an AMD RX 570. So far the past dozen of kernels (up to 6.2.14) worked flawlessly, but with 6.3.1 I don't get any video output and I get the following in journalctl:
>>
>> May 10 15:09:01 talos2 kernel: Kernel attempted to read user page (1128) - exploit attempt? (uid: 0)
>> May 10 15:09:01 talos2 kernel: BUG: Unable to handle kernel data access on read at 0x00001128
>> May 10 15:09:01 talos2 kernel: Faulting instruction address: 0xc00800000d1a805c
>> May 10 15:09:01 talos2 kernel: Oops: Kernel access of bad area, sig: 11 [#1]
>> May 10 15:09:01 talos2 kernel: LE PAGE_SIZE=4K MMU=Radix SMP NR_CPUS=512 NUMA PowerNV
>> May 10 15:09:01 talos2 kernel: Modules linked in: rfkill(+) 8021q garp mrp stp llc binfmt_misc amdgpu uvcvideo uvc videobuf2_vmalloc videobuf2_memops gpu_sched snd_hda_codec_hdmi i2c_algo_bit at24(+) videobuf2_v4l2 drm_ttm_helper regmap_i2c videobuf2_common ttm snd_usb_audio drm_di>
>> May 10 15:09:01 talos2 kernel: CPU: 0 PID: 188 Comm: kworker/0:3 Not tainted 6.3.1-gentoo-dist #1
>> May 10 15:09:01 talos2 kernel: Hardware name: T2P9S01 REV 1.01 POWER9 0x4e1202 opal:skiboot-9858186 PowerNV
>> May 10 15:09:01 talos2 kernel: Workqueue: events_long drm_dp_check_and_send_link_address [drm_display_helper]
>> May 10 15:09:01 talos2 kernel: NIP:  c00800000d1a805c LR: c00800000d1a8018 CTR: c000000000c87900
>> May 10 15:09:01 talos2 kernel: REGS: c00000000beb3370 TRAP: 0300   Not tainted  (6.3.1-gentoo-dist)
>> May 10 15:09:01 talos2 kernel: MSR:  900000000280b033 <SF,HV,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 88048223  XER: 0000005a
>> May 10 15:09:01 talos2 kernel: CFAR: c000000000c87980 DAR: 0000000000001128 DSISR: 40000000 IRQMASK: 0 
>>                                GPR00: c00800000d1a8018 c00000000beb3610 c00800000d690f00 0000000000000000 
>>                                GPR04: 0000000000000002 c00800000d6297c0 0000000000000000 c00000002a00b740 
>>                                GPR08: 0000000000000000 0000000000001124 0000000000000000 c00800000d431560 
>>                                GPR12: c000000000c87900 c000000002a6b000 c000000000170ad8 c00000001a460310 
>>                                GPR16: 0000000000000045 c000000022858388 c000000026000340 0000000000000001 
>>                                GPR20: 0000000000000000 0000000000000001 c0000000260001a0 0000000000004000 
>>                                GPR24: 0000000000004000 c000000026000010 c0000000228580b8 fffffffffffffffd 
>>                                GPR28: 0000000000000000 c0000000228580a0 c000000022856000 c000000022858000 
>> May 10 15:09:01 talos2 kernel: NIP [c00800000d1a805c] is_synaptics_cascaded_panamera+0x244/0x600 [amdgpu]
>> May 10 15:09:01 talos2 kernel: LR [c00800000d1a8018] is_synaptics_cascaded_panamera+0x200/0x600 [amdgpu]
>> May 10 15:09:01 talos2 kernel: Call Trace:
>> May 10 15:09:01 talos2 kernel: [c00000000beb3610] [c00800000d1a8018] is_synaptics_cascaded_panamera+0x200/0x600 [amdgpu] (unreliable)
>> May 10 15:09:01 talos2 kernel: [c00000000beb36d0] [c00800000b7c2b18] drm_helper_probe_single_connector_modes+0x230/0x698 [drm_kms_helper]
>> May 10 15:09:01 talos2 kernel: [c00000000beb3810] [c000000000c57174] drm_client_modeset_probe+0x2b4/0x16c0
>> May 10 15:09:01 talos2 kernel: [c00000000beb3a10] [c00800000b7c7a30] __drm_fb_helper_initial_config_and_unlock+0x68/0x640 [drm_kms_helper]
>> May 10 15:09:01 talos2 kernel: [c00000000beb3af0] [c00800000b7c5b08] drm_fbdev_client_hotplug+0x40/0x1d0 [drm_kms_helper]
>> May 10 15:09:01 talos2 kernel: [c00000000beb3b70] [c000000000c55480] drm_client_dev_hotplug+0x120/0x1b0
>> May 10 15:09:01 talos2 kernel: [c00000000beb3c00] [c00800000b7c1130] drm_kms_helper_hotplug_event+0x58/0x80 [drm_kms_helper]
>> May 10 15:09:01 talos2 kernel: [c00000000beb3c30] [c00800000b80b298] drm_dp_check_and_send_link_address+0x330/0x3a0 [drm_display_helper]
>> May 10 15:09:01 talos2 kernel: [c00000000beb3cd0] [c000000000162d84] process_one_work+0x2f4/0x580
>> May 10 15:09:01 talos2 kernel: [c00000000beb3d70] [c0000000001630b8] worker_thread+0xa8/0x600
>> May 10 15:09:01 talos2 kernel: [c00000000beb3e00] [c000000000170bf4] kthread+0x124/0x130
>> May 10 15:09:01 talos2 kernel: [c00000000beb3e50] [c00000000000dd14] ret_from_kernel_thread+0x5c/0x64
>> May 10 15:09:01 talos2 kernel: --- interrupt: 0 at 0x0
>> May 10 15:09:01 talos2 kernel: NIP:  0000000000000000 LR: 0000000000000000 CTR: 0000000000000000
>> May 10 15:09:01 talos2 kernel: REGS: c00000000beb3e80 TRAP: 0000   Not tainted  (6.3.1-gentoo-dist)
>> May 10 15:09:01 talos2 kernel: MSR:  0000000000000000 <>  CR: 00000000  XER: 00000000
>> May 10 15:09:01 talos2 kernel: CFAR: 0000000000000000 IRQMASK: 0 
>>                                GPR00: 0000000000000000 c00000000beb4000 0000000000000000 0000000000000000 
>>                                GPR04: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
>>                                GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
>>                                GPR12: 0000000000000000 0000000000000000 c000000000170ad8 c00000000a8fb240 
>>                                GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
>>                                GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
>>                                GPR24: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
>>                                GPR28: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
>> May 10 15:09:01 talos2 kernel: NIP [0000000000000000] 0x0
>> May 10 15:09:01 talos2 kernel: LR [0000000000000000] 0x0
>> May 10 15:09:01 talos2 kernel: --- interrupt: 0
>> May 10 15:09:01 talos2 kernel: Code: 41820094 e91f0568 e95f0000 813f0088 81080030 3d4a0001 39290444 e94a7ca0 79291764 1d0811f0 7d4a4214 7d2a4a14 <81290004> 91270074 813f0088 39290424 
>> May 10 15:09:01 talos2 kernel: ---[ end trace 0000000000000000 ]---
>> May 10 15:09:01 talos2 kernel: at24 4-0054: supply vcc not found, using dummy regulator
> 
> See the report for details.
> 
> Anyway, I'm adding this to regzbot:
> 
> #regzbot introduced: v6.2..v6.3 https://bugzilla.kernel.org/show_bug.cgi?id=217427
> #regzbot title: No video output from AMD RX 570 and kernel exploit attempt on ppc64le
> 

#regzbot introduced: f4f3b7dedbe849
#regzbot link: https://gitlab.freedesktop.org/drm/amd/-/issues/2553

-- 
An old man doll... just what I always wanted! - Clara

