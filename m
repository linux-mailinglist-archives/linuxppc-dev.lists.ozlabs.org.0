Return-Path: <linuxppc-dev+bounces-95-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F90A952652
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2024 01:51:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BAYZ76tz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WklQF0k4gz2yLY;
	Thu, 15 Aug 2024 09:51:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BAYZ76tz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com; envelope-from=ivan.orlov0322@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wkkt30Bvvz2yNB
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2024 09:26:49 +1000 (AEST)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3717d23b123so50983f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2024 16:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723678003; x=1724282803; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZClFBAep9uIC4W8QSIfk6LQ+yY2NkNpTwssIHpdY6XY=;
        b=BAYZ76tzeRqTmjAHQH8Va4dSUDDKgvLB/CvHqgDTHoSRek6jIuaAHFDWxKVhOfLKgZ
         16L/k3BYcE9w+Dyo5Tp1r8tL7GWKZdXWdPBlKjbaUCop/aPtbQX1ipAh9zffeLXAQTTE
         kqZuzdQeILdtD7QuDt27EO6+8+fhwSsMWz47jNVANBpnBw4qEcxmNHwdM7UYdSQI86/8
         QuJqJVKxCFiO0CPo7D785I3nmrNScx6qg2tzakJV3t7sh5gkpCkjdEQEfMIFFhAppb9T
         XTK8hLJUsFlz6ek0DVCL9Nx1yzVHX+0np3J4ogCX86CoIKxOwvX1v9AYYuzpJot35k+f
         OyrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723678003; x=1724282803;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZClFBAep9uIC4W8QSIfk6LQ+yY2NkNpTwssIHpdY6XY=;
        b=XYHYCqJ4X+QNiPSuVov0x0B1ZcY6UF11J/o2/tW/dtEMXxZj0qkmVPf5KrVbbS6SFW
         fBkZG4qiqefJyBhXV3B9zH4d52ZxcsJOHenSIuP+7Do7/EgL6JqOGnDc0v8iogP40Utw
         mYOmPInku07PFpOGLaVBqjA+WStp6VlBSYYfafPKoWdu3IxL/IzMJQNsmQOhjdv7K9Qx
         DQsINx9zXcWrbNKFWF+1Oc0Rp5Ia0uib+cwlspq+QX4NJ/gebgXshlp9R2fS+x5ij7pG
         ++SA7/Nh6ja9VhnWNk6aYtHZw1JF6TlYk+ncGV1lrpAeAXYUcwqmwVWCnk5wGxDAPQPs
         MPDg==
X-Forwarded-Encrypted: i=1; AJvYcCVaY8Nljz6iFC3i5wv4c+dz8fhStn9OOhAyEtI9fb6loL2UsxAkjUCqBlhcBxD0AuQO8C9c9mQY2rC7aYw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx7I46GtI4G7gL/UNwI2IySJaOzQURp2U1i6zXolV3GN1ShiMp9
	PLv3zFHmcyCgol9agezfB7nqUNlKR9Gtx/pE07Y+9cOAK3L3Jpzu
X-Google-Smtp-Source: AGHT+IHarqvzl8DLLw7ZNqNe/eTh6SFNrP5hm8NHQl7uOz5Xar7lyrKhr/X4OxqX1cmj4tNuo32MKQ==
X-Received: by 2002:a05:600c:1c23:b0:426:668f:5ed7 with SMTP id 5b1f17b1804b1-429e0f5be95mr8778515e9.2.1723678002893;
        Wed, 14 Aug 2024 16:26:42 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:d20e:7300:ce68:853e:d0e2:925f? ([2a01:4b00:d20e:7300:ce68:853e:d0e2:925f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898aad93sm212977f8f.95.2024.08.14.16.26.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Aug 2024 16:26:42 -0700 (PDT)
Message-ID: <81303aa9-40a4-42ec-8e48-4a460398d469@gmail.com>
Date: Thu, 15 Aug 2024 00:26:40 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: OVERFLOW_KUNIT_TEST fails with BUG: KASAN: stack-out-of-bounds in
 string_nocheck+0x168/0x1c8 (kernel 6.11-rc2, PowerMac G4 DP)
To: Erhard Furtner <erhard_f@mailbox.org>, Kees Cook <kees@kernel.org>
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 David Gow <davidgow@google.com>, kunit-dev@googlegroups.com
References: <20240809231537.7c9ee7ea@yea> <202408121146.1D02EB6E@keescook>
 <20240814223813.7b301ad4@yea>
Content-Language: en-US
From: Ivan Orlov <ivan.orlov0322@gmail.com>
In-Reply-To: <20240814223813.7b301ad4@yea>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/14/24 21:38, 'Erhard Furtner' via KUnit Development wrote:
> On Mon, 12 Aug 2024 11:54:11 -0700
> Kees Cook <kees@kernel.org> wrote:
> 
>> On Fri, Aug 09, 2024 at 11:15:37PM +0200, Erhard Furtner wrote:
>>> Greetings!
>>>
>>> When KASAN is enabled the Overflow KUnit test fails:
>>>
>>> [...]
>>>      ok 16 shift_nonsense_test
>>>      # overflow_allocation_test: 11 allocation overflow tests finished
>>> ==================================================================
>>> BUG: KASAN: stack-out-of-bounds in string_nocheck+0x168/0x1c8
>>> Read of size 1 at addr c976be40 by task kunit_try_catch/1843
>>>
>>> CPU: 0 UID: 0 PID: 1843 Comm: kunit_try_catch Tainted: G                 N 6.11.0-rc2-PMacG4 #1
>>> Tainted: [N]=TEST
>>> Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
>>> Call Trace:
>>> [c992fb80] [c16651c0] dump_stack_lvl+0x80/0xac (unreliable)
>>> [c992fba0] [c04e0420] print_report+0xdc/0x504
>>> [c992fc00] [c04e01d8] kasan_report+0xf8/0x108
>>> [c992fc80] [c16ae4c8] string_nocheck+0x168/0x1c8
>>> [c992fcf0] [c16b37a4] string+0xa8/0xbc
>>> [c992fd60] [c16b8134] vsnprintf+0x868/0x1750
>>> [c992fdf0] [c0b8490c] kvasprintf+0xa4/0x13c
>>> [c992fe60] [c0b84c3c] kasprintf+0xb4/0xc8
>>> [c992fed0] [c0f4c954] module_remove_driver+0x1f0/0x2fc
>>> [c992ff00] [c0f21628] bus_remove_driver+0x1d0/0x240
>>> [c992ff30] [bfd0cd40] kunit_put_resource+0x128/0x134 [kunit]
>>> [c992ff50] [bfd0a120] kunit_cleanup+0x140/0x144 [kunit]
>>> [c992ff90] [bfd10d64] kunit_generic_run_threadfn_adapter+0xf8/0x148 [kunit]
>>> [c992ffc0] [c00f57e0] kthread+0x36c/0x37c
>>> [c992fff0] [c0028304] start_kernel_thread+0x10/0x14
>>>
>>> The buggy address belongs to the physical page:
>>> page: refcount:0 mapcount:0 mapping:00000000 index:0x0 pfn:0x976b
>>> flags: 0x0(zone=0)
>>> raw: 00000000 00000000 eef2bb10 00000000 00000000 00000000 ffffffff 00000000
>>> raw: 00000000
>>> page dumped because: kasan: bad access detected
>>>
>>> Memory state around the buggy address:
>>>   c976bd00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>>>   c976bd80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>>>> c976be00: 00 00 00 00 00 00 00 00 f1 f1 f1 f1 04 f2 04 f2
>>>                                     ^
>>>   c976be80: 00 04 f3 f3 00 00 00 00 00 00 00 00 00 00 00 00
>>>   c976bf00: 00 00 f1 f1 f1 f1 00 f3 f3 f3 00 00 00 00 00 00
>>> ==================================================================
>>> Disabling lock debugging due to kernel taint
>>>      not ok 17 overflow_allocation_test
>>>      # overflow_size_helpers_test: 43 overflow size helper tests finished
>>>      ok 18 overflow_size_helpers_test
>>>      # overflows_type_test: 378 overflows_type() tests finished
>>>      ok 19 overflows_type_test
>>>      # same_type_test: 0 __same_type() tests finished
>>>      ok 20 same_type_test
>>>      # castable_to_type_test: 75 castable_to_type() tests finished
>>>      ok 21 castable_to_type_test
>>>      ok 22 DEFINE_FLEX_test
>>> # overflow: pass:21 fail:1 skip:0 total:22
>>> # Totals: pass:21 fail:1 skip:0 total:22
>>> not ok 1 overflow
>>>
>>>
>>> This is reproducible on my machine and always happens when running the test via 'modprobe -v overflow_kunit'. Without KASAN enabled (but KFENCE) overflow_allocation_test passes.
>>
>> Hmm, this implies some kind of corruption is sneaking in and the kunit
>> resource freeing code is exploding. I don't immediately see the problem,
>> though.
> 
> Not the 1st memory corruption I got on ppc32 (https://lore.kernel.org/all/20240811165230.91DCFA0660@freki.localdomain/) btw., but this does not seem related.
> 
> I just did a kernel build with overflow_kunit statically built in to run at boot. This way I don't get the "BUG: KASAN: stack-out-of-bounds in string_nocheck+0x168/0x1c8" on the PowerMac and on qemu. Run directly at boot the overflow_kunit just passes. As soon as I build it as module and modprobe it later, I hit the issue. Strange...
> 
> A hint that not the test itself might cause the stack corruption but another process.
> 
> Regards,
> Erhard
> 

Hi Erhard and Kees,

On my QEMU setup the overflow_kunit test produces the following kernel 
panic when running "modprobe -v overflow_kunit" with KASAN and KFENCE 
enabled:

[   52.574541] BUG: KASAN: stack-out-of-bounds in string+0x2a0/0x320
[   52.574541] Read of size 1 at addr ffffc900010d7d88 by task 
systemd-udevd/144
[   52.574541]
[   52.574541] CPU: 11 UID: 0 PID: 144 Comm: systemd-udevd Tainted: G 
              N 6.11.0-rc2-00319-g1fcd5c59a7f8 #83
[   52.574541] Tainted: [N]=TEST
[   52.574541] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), 
BIOS 1.15.0-1 04/01/2014
[   52.574541] Call Trace:
[   52.574541]  <TASK>
[   52.574541]  dump_stack_lvl+0x55/0x70
[   52.574541]  print_report+0xcb/0x620
[   52.574541]  ? srso_return_thunk+0x5/0x5f
[   52.574541]  ? string+0x2a0/0x320
[   52.574541]  kasan_report+0xc5/0x100
[   52.574541]  ? string+0x2a0/0x320
[   52.574541]  string+0x2a0/0x320
[   52.574541]  ? __pfx_string+0x10/0x10
[   52.574541]  ? srso_return_thunk+0x5/0x5f
[   52.574541]  vsnprintf+0x809/0x1600
[   52.574541]  ? __pfx_vsnprintf+0x10/0x10
[   52.574541]  ? kasan_save_stack+0x24/0x50
[   52.574541]  ? __kasan_kmalloc+0xaa/0xb0
[   52.574541]  ? uevent_show+0x127/0x300
[   52.574541]  ? dev_attr_show+0x41/0xc0
[   52.574541]  ? sysfs_kf_seq_show+0x213/0x400
[   52.574541]  ? seq_read_iter+0x404/0x1070
[   52.574541]  ? vfs_read+0x642/0x8f0
[   52.574541]  add_uevent_var+0x135/0x2e0
[   52.574541]  ? __kmalloc_node_noprof+0x1bc/0x3a0
[   52.574541]  ? seq_read_iter+0x67d/0x1070
[   52.574541]  ? __pfx_add_uevent_var+0x10/0x10
[   52.574541]  ? entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   52.574541]  ? stack_trace_save+0x8f/0xc0
[   52.574541]  ? __pfx_stack_trace_save+0x10/0x10
[   52.574541]  ? srso_return_thunk+0x5/0x5f
[   52.574541]  ? stack_depot_save_flags+0x2e/0x710
[   52.574541]  dev_uevent+0x166/0x6a0
[   52.574541]  ? srso_return_thunk+0x5/0x5f
[   52.574541]  ? __pfx_dev_uevent+0x10/0x10
[   52.574541]  ? srso_return_thunk+0x5/0x5f
[   52.574541]  ? kasan_unpoison+0x27/0x60
[   52.574541]  ? srso_return_thunk+0x5/0x5f
[   52.574541]  ? __kasan_slab_alloc+0x4d/0x90
[   52.574541]  ? srso_return_thunk+0x5/0x5f
[   52.574541]  ? __kmalloc_cache_noprof+0x100/0x2b0
[   52.574541]  ? srso_return_thunk+0x5/0x5f
[   52.574541]  ? kasan_save_track+0x14/0x30
[   52.574541]  uevent_show+0x183/0x300
[   52.574541]  ? srso_return_thunk+0x5/0x5f
[   52.574541]  ? mutex_lock+0x8c/0xe0
[   52.574541]  ? __pfx_dev_attr_show+0x10/0x10
[   52.574541]  dev_attr_show+0x41/0xc0
[   52.574541]  sysfs_kf_seq_show+0x213/0x400
[   52.574541]  ? srso_return_thunk+0x5/0x5f
[   52.574541]  seq_read_iter+0x404/0x1070
[   52.574541]  vfs_read+0x642/0x8f0
[   52.574541]  ? __pfx_vfs_read+0x10/0x10
[   52.574541]  ? srso_return_thunk+0x5/0x5f
[   52.574541]  ? srso_return_thunk+0x5/0x5f
[   52.574541]  ? __do_sys_newfstatat+0x86/0xd0
[   52.574541]  ? __pfx___do_sys_newfstatat+0x10/0x10
[   52.574541]  ksys_read+0xec/0x1c0
[   52.574541]  ? __pfx_ksys_read+0x10/0x10
[   52.574541]  ? srso_return_thunk+0x5/0x5f
[   52.574541]  do_syscall_64+0xa6/0x1a0
[   52.574541]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   52.574541] RIP: 0033:0x7fcf58ddf7e2
[   52.574541] Code: c0 e9 b2 fe ff ff 50 48 8d 3d 8a b4 0c 00 e8 a5 1d 
02 00 0f 1f 44 00 00 f3 0f 1e fa 64 8b 04 25 18 00 00 00 85 c0 75 10 0f 
05 <48> 3d 00 f0 ff ff 77 56 c3 0f 1f 44 00 00 48 83 ec 28 48 89 54 24
[   52.574541] RSP: 002b:00007ffd98a30d88 EFLAGS: 00000246 ORIG_RAX: 
0000000000000000
[   52.574541] RAX: ffffffffffffffda RBX: 0000000000001018 RCX: 
00007fcf58ddf7e2
[   52.574541] RDX: 0000000000001018 RSI: 00005586e442f2a0 RDI: 
000000000000000c
[   52.574541] RBP: 00005586e442f2a0 R08: 0000000000000000 R09: 
00005586e442f2a0
[   52.574541] R10: 00007fcf58ee5d10 R11: 0000000000000246 R12: 
000000000000000c
[   52.574541] R13: 0000000000001017 R14: 0000000000000002 R15: 
00007ffd98a30db0
[   52.574541]  </TASK>
[   52.574541]
[   52.574541] The buggy address belongs to the virtual mapping at
[   52.574541]  [ffffc900010d0000, ffffc900010d9000) created by:
[   52.574541]  kernel_clone+0xb9/0x6c0
[   52.574541]
[   52.574541] The buggy address belongs to the physical page:
[   52.574541] page: refcount:1 mapcount:0 mapping:0000000000000000 
index:0x0 pfn:0xa9df
[   52.574541] flags: 0x100000000000000(node=0|zone=1)
[   52.574541] raw: 0100000000000000 0000000000000000 dead000000000122 
0000000000000000
[   52.574541] raw: 0000000000000000 0000000000000000 00000001ffffffff 
0000000000000000
[   52.574541] page dumped because: kasan: bad access detected
[   52.574541]
[   52.574541] Memory state around the buggy address:
[   52.574541]  ffffc900010d7c80: 00 00 00 00 00 00 00 00 00 00 00 00 00 
00 00 f1
[   52.574541]  ffffc900010d7d00: f1 f1 f1 f1 f1 04 f2 00 f2 f2 f2 00 00 
00 f3 f3
[   52.574541] >ffffc900010d7d80: f3 f3 f3 00 00 00 00 00 00 00 00 00 00 
00 00 00
[   52.574541]                       ^
[   52.574541]  ffffc900010d7e00: 00 00 00 00 00 00 00 00 00 00 f1 f1 f1 
f1 00 00
[   52.574541]  ffffc900010d7e80: f3 f3 00 00 00 00 00 00 00 00 00 00 00 
00 00 00
[   52.574541] 
==================================================================
[   52.600667] Disabling lock debugging due to kernel taint


And it looks like I found the root cause (lib/overflow_kunit.c +671):
...
static void overflow_allocation_test(struct kunit *test)
{
        const char device_name[] = "overflow-test";
...

As you can see, the device name is defined as a local variable, which 
means that it doesn't exist out of the 'overflow_allocation_test' 
function scope. This patch:

diff --git a/lib/overflow_kunit.c b/lib/overflow_kunit.c
index f314a0c15a6d..fa7ca8c94eee 100644
--- a/lib/overflow_kunit.c
+++ b/lib/overflow_kunit.c
@@ -668,7 +668,7 @@ DEFINE_TEST_ALLOC(devm_kzalloc,  devm_kfree, 1, 1, 0);

  static void overflow_allocation_test(struct kunit *test)
  {
-	const char device_name[] = "overflow-test";
+	static const char device_name[] = "overflow-test";
  	struct device *dev;
  	int count = 0;


Seems to fix the problem and it is not reproducable anymore.

I will send the proper patch tomorrow.

Good night!

-- 
Kind regards,
Ivan Orlov

