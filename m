Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8328D375BB4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 21:31:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FbkGX3sWMz3bnd
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 May 2021 05:31:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx1.molgen.mpg.de;
 envelope-from=pmenzel@molgen.mpg.de; receiver=<UNKNOWN>)
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FbkG644rRz2yxk
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 May 2021 05:31:07 +1000 (AEST)
Received: from [192.168.0.3] (ip5f5aef15.dynamic.kabel-deutschland.de
 [95.90.239.21])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id CBFC761E5FE00;
 Thu,  6 May 2021 21:31:00 +0200 (CEST)
From: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: WARNING: CPU: 0 PID: 1 at arch/powerpc/lib/feature-fixups.c:109
 do_feature_fixups+0xb0/0xf0
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Message-ID: <9f1e8f9a-9ccd-fc96-04cc-30137dbe9011@molgen.mpg.de>
Date: Thu, 6 May 2021 21:31:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dear Linux folks,


On the POWER8 system IBM S822LC, Linux 5.13+, built with USSAN, logs the 
warning below.

```
[    0.030091] 
================================================================================
[    0.030295] UBSAN: array-index-out-of-bounds in 
arch/powerpc/kernel/legacy_serial.c:359:56
[    0.030325] index -1 is out of range for type 'legacy_serial_info [8]'
[    0.030350] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.12.0+ #2
[    0.030360] Call Trace:
[    0.030363] [c000000024f1bad0] [c0000000009f4330] 
dump_stack+0xc4/0x114 (unreliable)
[    0.030386] [c000000024f1bb20] [c0000000009efed0] 
ubsan_epilogue+0x18/0x78
[    0.030400] [c000000024f1bb80] [c0000000009efafc] 
__ubsan_handle_out_of_bounds+0xac/0xd0
[    0.030414] [c000000024f1bc20] [c000000001711588] 
ioremap_legacy_serial_console+0x54/0x144
[    0.030430] [c000000024f1bc70] [c0000000000123c0] 
do_one_initcall+0x60/0x2c0
[    0.030444] [c000000024f1bd40] [c000000001704bc4] 
kernel_init_freeable+0x19c/0x25c
[    0.030458] [c000000024f1bda0] [c000000000012a2c] kernel_init+0x2c/0x180
[    0.030471] [c000000024f1be10] [c00000000000d6ec] 
ret_from_kernel_thread+0x5c/0x70
[    0.030484] 
================================================================================
[    0.030641] 
================================================================================
[    0.030668] UBSAN: array-index-out-of-bounds in 
arch/powerpc/kernel/legacy_serial.c:360:58
[    0.030697] index -1 is out of range for type 'plat_serial8250_port [9]'
[    0.030721] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.12.0+ #2
[    0.030730] Call Trace:
[    0.030733] [c000000024f1bad0] [c0000000009f4330] 
dump_stack+0xc4/0x114 (unreliable)
[    0.030749] [c000000024f1bb20] [c0000000009efed0] 
ubsan_epilogue+0x18/0x78
[    0.030762] [c000000024f1bb80] [c0000000009efafc] 
__ubsan_handle_out_of_bounds+0xac/0xd0
[    0.030775] [c000000024f1bc20] [c0000000017115a0] 
ioremap_legacy_serial_console+0x6c/0x144
[    0.030790] [c000000024f1bc70] [c0000000000123c0] 
do_one_initcall+0x60/0x2c0
[    0.030802] [c000000024f1bd40] [c000000001704bc4] 
kernel_init_freeable+0x19c/0x25c
[    0.030816] [c000000024f1bda0] [c000000000012a2c] kernel_init+0x2c/0x180
[    0.030829] [c000000024f1be10] [c00000000000d6ec] 
ret_from_kernel_thread+0x5c/0x70
[    0.030842] 
================================================================================
```


Kind regards,

Paul

