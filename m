Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D6E737525
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 21:36:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=7kPXp7k4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qlxgy5xnnz3bcd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jun 2023 05:35:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=7kPXp7k4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::132; helo=mail-il1-x132.google.com; envelope-from=yuzhao@google.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qlxg01bRRz30fM
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jun 2023 05:35:07 +1000 (AEST)
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-34226590ee3so4355ab.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 12:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687289702; x=1689881702;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fgrxymiL5F23/uQmHvgS1nLpXKJr0BIn13qrER7wwUU=;
        b=7kPXp7k4k+3HQGQzrHrTpVpC3+CYleh95LDUwmec0QRk8dXNViGFWdBoz7WYLFDgcq
         9mzHFBG5RHc2WSbLLbPyGdEp5AmINu2/OyLEWgcZf+0hmVyukWzeI9WzKpn5lDraUg41
         Dw/NwQykbQWflDY01t2Xa8m4gtL2GYxENYVhbBPOD7iPGeMUHF3RkcOmREB6tQWYIyA5
         XTXqWOobv7doQadn8nft8qmFt5iL9tsIOnhnShBm4eHh4P79WicxoRYCMwUD9IZWLfXC
         dO/X0gIp4xuEMjfEGoGJzmZJ3MBcBncVYobqgQ4tjM5GhUdMlCQth5ROf2w2n7qtSTNq
         X0Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687289702; x=1689881702;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fgrxymiL5F23/uQmHvgS1nLpXKJr0BIn13qrER7wwUU=;
        b=X3czsx6DbPryNH5Ktp97M1HhnaBpJQLFwx/tKXlQGmJX0Dx2CGtufW7U1D7yP2rrfh
         mFAbOhvUgGPqiQabOQabITGPJFUCOq1TM3MBbSf5lMeliGHFABAMEK9ZXcknqm2RsvRa
         nJ7I9PftePsxgW2TyHvSCIc5GXOxMIDkEUPbKdEoI7FxHaeIzl5Ove4qL8sZYgW1O1U/
         3EP4DAM/5tWjlg6XfFLTJ7z0H40M6qekDSxZYxvPsaDMkO8xqpJVshcRI7z79G0jzgwJ
         gIoXzCmQw5UPOoi1lydMYE/FbxmfCKNHqIyG21UGGR6bATPO4nt4FH2zEzwknvFuXGJx
         g7Kg==
X-Gm-Message-State: AC+VfDz5jATvCO4O3XOR8eMwbkP9JQn8lPCZoS3oF2QUNRE8fMvHfg0W
	n8+WkZK167g2BJ9243t5XXlqwhfxXHm3G2paVGRcGkxF
X-Google-Smtp-Source: ACHHUZ44V25+O8mS80jURqzGFzPrKPMSqVw1BoroQxBnqtQVlcnBpGMB1LnZ45g5iJ7Zfpl9IGJ4cg==
X-Received: by 2002:a05:6e02:1d84:b0:33d:8f9f:9461 with SMTP id h4-20020a056e021d8400b0033d8f9f9461mr1114326ila.18.1687289702251;
        Tue, 20 Jun 2023 12:35:02 -0700 (PDT)
Received: from google.com ([2620:15c:183:202:53f6:d461:243c:9e3d])
        by smtp.gmail.com with ESMTPSA id r4-20020a92d444000000b003427daab8a9sm811947ilm.10.2023.06.20.12.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 12:35:01 -0700 (PDT)
Date: Tue, 20 Jun 2023 13:34:57 -0600
From: Yu Zhao <yuzhao@google.com>
To: Sachin Sant <sachinp@linux.ibm.com>
Subject: Re: [6.4.0-rc7-next-20230620] Boot failure on IBM Power LPAR
Message-ID: <ZJH/YdBPSP5InJU1@google.com>
References: <E6B3DD9B-8577-450E-A043-E4B307CE379C@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E6B3DD9B-8577-450E-A043-E4B307CE379C@linux.ibm.com>
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
Cc: linux-mm@kvack.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 20, 2023 at 05:41:57PM +0530, Sachin Sant wrote:
> 6.4.0-rc7-next-20230620 fails to boot on IBM Power LPAR with following

Sorry for hijacking this thread -- I've been seeing another crash on
NV since -rc1 but I haven't had the time to bisect. Just FYI.

[    0.814500] BUG: Unable to handle kernel data access on read at 0xc00a0000000003f9
[    0.814814] Faulting instruction address: 0xc000000000c77324
[    0.814988] Oops: Kernel access of bad area, sig: 11 [#1]
[    0.815185] LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA PowerNV
[    0.815487] Modules linked in:
[    0.815653] CPU: 4 PID: 1 Comm: swapper/0 Not tainted 6.4.0-rc7 #1
[    0.815980] Hardware name: ZAIUS_FX_10      POWER9 (raw) 0x4e1202 opal:custom PowerNV
[    0.816293] NIP:  c000000000c77324 LR: c000000000c7c2c8 CTR: c000000000c77270
[    0.816525] REGS: c00020000a416de0 TRAP: 0300   Not tainted  (6.4.0-rc7)
[    0.816778] MSR:  9000000000009033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24008280  XER: 20040000
[    0.817113] CFAR: c000000000c772c8 DAR: c00a0000000003f9 DSISR: 40000000 IRQMASK: 1
[    0.817113] GPR00: c000000000c7c2c8 c00020000a417080 c000000001deea00 00000000000003f9
[    0.817113] GPR04: 0000000000000001 0000000000000000 c0000000027f3b28 c0000000016e0610
[    0.817113] GPR08: 0000000000000000 c000000002b9db10 c000000002b903e0 0000000084008282
[    0.817113] GPR12: 0000000000000000 c000003ffffdba00 c0000000000128c8 0000000000000000
[    0.817113] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000007
[    0.817113] GPR20: c0000000027903f0 c0000000020034a4 c0000000029db000 0000000000000000
[    0.817113] GPR24: c0000000029dad70 c0000000029dad50 0000000000000000 0000000000000001
[    0.817113] GPR28: c000000002d57378 0000000000000000 c000000002d47378 c00a0000000003f9
[    0.820185] NIP [c000000000c77324] io_serial_in+0xb4/0x130
[    0.820383] LR [c000000000c7c2c8] serial8250_config_port+0x4b8/0x1680
[    0.820610] Call Trace:
[    0.820733] [c00020000a417080] [c000000000c768c8] serial8250_request_std_resource+0x88/0x200 (unreliable)
[    0.821221] [c00020000a4170c0] [c000000000c7be50] serial8250_config_port+0x40/0x1680
[    0.821623] [c00020000a417190] [c000000000c733ec] univ8250_config_port+0x11c/0x1e0
[    0.821956] [c00020000a4171f0] [c000000000c71824] uart_add_one_port+0x244/0x750
[    0.822244] [c00020000a417310] [c000000000c73958] serial8250_register_8250_port+0x3b8/0x780
[    0.822504] [c00020000a4173c0] [c000000000c7411c] serial8250_probe+0x14c/0x1e0
[    0.822833] [c00020000a417760] [c000000000cd87e8] platform_probe+0x98/0x1b0
[    0.823157] [c00020000a4177e0] [c000000000cd2a50] really_probe+0x130/0x5b0
[    0.823517] [c00020000a417870] [c000000000cd2f94] __driver_probe_device+0xc4/0x240
[    0.823827] [c00020000a4178f0] [c000000000cd3164] driver_probe_device+0x54/0x180
[    0.824096] [c00020000a417930] [c000000000cd3618] __driver_attach+0x168/0x300
[    0.824330] [c00020000a4179b0] [c000000000ccf468] bus_for_each_dev+0xa8/0x130
[    0.824650] [c00020000a417a10] [c000000000cd1ef4] driver_attach+0x34/0x50
[    0.825094] [c00020000a417a30] [c000000000cd112c] bus_add_driver+0x16c/0x310
[    0.825445] [c00020000a417ac0] [c000000000cd55d4] driver_register+0xa4/0x1b0
[    0.825787] [c00020000a417b30] [c000000000cd7548] __platform_driver_register+0x38/0x50
[    0.826037] [c00020000a417b50] [c00000000206be38] serial8250_init+0x1f8/0x270
[    0.826267] [c00020000a417c00] [c000000000012260] do_one_initcall+0x60/0x300
[    0.826529] [c00020000a417ce0] [c0000000020052c4] kernel_init_freeable+0x3c0/0x484
[    0.826883] [c00020000a417de0] [c0000000000128f4] kernel_init+0x34/0x1e0
[    0.827187] [c00020000a417e50] [c00000000000d014] ret_from_kernel_user_thread+0x14/0x1c
[    0.827595] --- interrupt: 0 at 0x0
[    0.827722] NIP:  0000000000000000 LR: 0000000000000000 CTR: 0000000000000000
[    0.827951] REGS: c00020000a417e80 TRAP: 0000   Not tainted  (6.4.0-rc7)
[    0.828162] MSR:  0000000000000000 <>  CR: 00000000  XER: 00000000
[    0.828394] CFAR: 0000000000000000 IRQMASK: 0
[    0.828394] GPR00: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
[    0.828394] GPR04: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
[    0.828394] GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
[    0.828394] GPR12: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
[    0.828394] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
[    0.828394] GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
[    0.828394] GPR24: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
[    0.828394] GPR28: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
[    0.831329] NIP [0000000000000000] 0x0
[    0.831445] LR [0000000000000000] 0x0
[    0.831554] --- interrupt: 0
[    0.831664] Code: 7bc30020 eba1ffe8 ebc1fff0 ebe1fff8 4e800020 60000000 60420000 3d2200db 3929f110 ebe90000 7fe3fa14 7c0004ac <8bdf0000> 0c1e0000 4c00012c 57de063e
[    0.832263] ---[ end trace 0000000000000000 ]---
