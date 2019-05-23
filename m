Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2672F2782F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 10:40:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 458jcN2tzzzDqXf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 18:40:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.167.179; helo=mail-oi1-f179.google.com;
 envelope-from=mathieu.malaterre@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=debian.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 458jb03WqTzDqXd
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2019 18:38:52 +1000 (AEST)
Received: by mail-oi1-f179.google.com with SMTP id u64so3772898oib.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2019 01:38:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=dUFm9jdzzVx0N+4mMHaBq5XrorgpIgaFDkBxxlWv3Y0=;
 b=MG8RvjeeA6qZf2p+7piJEqSP/MXnSTipLmScWZJ7mY8u4yU/B5YGxKTzLiHaQEZXPW
 Sit0JiPdVhmJxO76WKJijmw2PNF3ZqQsxAAWIzcetB85h2Ym7mzVrCYRBNyZJieyDk2z
 8NoVHSUgD4xL/Efb7QPwoch52jovCYEUMFMxLn7eoCSYjH31RTQv51eiGZ9izzjzNv5z
 6M/4D293/HEGw/paAZmX/XU6TimJ/An7fs1oqpSu4d/zNPZo01nmPBCk6slzwFLCd1/I
 BF3L2nw6UVbt4NlEmSNU2OD5XFAEf+PPv8Em5kpMHF+UkL7swpCigcZ7sjISzlQuvcvn
 bfBA==
X-Gm-Message-State: APjAAAVVFWYrsXKC7gJpMVzi8gQcqeSOz8XDkfO+baEse99liTR5WCG4
 51Ojk0hkr0LegsjpMOsZVGcmHB4KnVj9u45eLtQNuSAi
X-Google-Smtp-Source: APXvYqzXg2DfrKAitcMXn89BEh5CPP6pH3V0r5j3IrqYPUAopNy3+vpgM/jRM55c63R65eC1caILziHebAOy/YlJ6vk=
X-Received: by 2002:aca:ed44:: with SMTP id l65mr2101687oih.107.1558600729616; 
 Thu, 23 May 2019 01:38:49 -0700 (PDT)
MIME-Version: 1.0
From: Mathieu Malaterre <malat@debian.org>
Date: Thu, 23 May 2019 10:38:38 +0200
Message-ID: <CA+7wUsw_jkgWfknXbpK7_yfy=S5Y0jvQe1KP3kM-LT8fFnUF5g@mail.gmail.com>
Subject: kmemleak: 1157 new suspected memory leaks (see
 /sys/kernel/debug/kmemleak)
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi there,

Is there a way to dump more context (somewhere in of tree
flattening?). I cannot make sense of the following:

kmemleak: 1157 new suspected memory leaks (see /sys/kernel/debug/kmemleak)

Where:

# head -40 /sys/kernel/debug/kmemleak
unreferenced object 0xdf44d180 (size 8):
  comm "swapper", pid 1, jiffies 4294892297 (age 4766.460s)
  hex dump (first 8 bytes):
    62 61 73 65 00 00 00 00                          base....
  backtrace:
    [<0ca59825>] kstrdup+0x4c/0xb8
    [<c8a79377>] kobject_set_name_vargs+0x34/0xc8
    [<661b4c86>] kobject_add+0x78/0x120
    [<c1416f27>] __of_attach_node_sysfs+0xa0/0x14c
    [<2a143d10>] of_core_init+0x90/0x114
    [<a353d0e1>] driver_init+0x30/0x48
    [<84ed01b1>] kernel_init_freeable+0xfc/0x3fc
    [<dc60f815>] kernel_init+0x20/0x110
    [<faa1c5b0>] ret_from_kernel_thread+0x14/0x1c
unreferenced object 0xdf44d178 (size 8):
  comm "swapper", pid 1, jiffies 4294892297 (age 4766.460s)
  hex dump (first 8 bytes):
    6d 6f 64 65 6c 00 97 c8                          model...
  backtrace:
    [<0ca59825>] kstrdup+0x4c/0xb8
    [<0eeb0a3b>] __of_add_property_sysfs+0x88/0x12c
    [<f6c64af0>] __of_attach_node_sysfs+0xcc/0x14c
    [<2a143d10>] of_core_init+0x90/0x114
    [<a353d0e1>] driver_init+0x30/0x48
    [<84ed01b1>] kernel_init_freeable+0xfc/0x3fc
    [<dc60f815>] kernel_init+0x20/0x110
    [<faa1c5b0>] ret_from_kernel_thread+0x14/0x1c
unreferenced object 0xdf4021e0 (size 16):
  comm "swapper", pid 1, jiffies 4294892297 (age 4766.460s)
  hex dump (first 16 bytes):
    63 6f 6d 70 61 74 69 62 6c 65 00 01 00 00 00 00  compatible......
  backtrace:
    [<0ca59825>] kstrdup+0x4c/0xb8
    [<0eeb0a3b>] __of_add_property_sysfs+0x88/0x12c
    [<f6c64af0>] __of_attach_node_sysfs+0xcc/0x14c
    [<2a143d10>] of_core_init+0x90/0x114
    [<a353d0e1>] driver_init+0x30/0x48
    [<84ed01b1>] kernel_init_freeable+0xfc/0x3fc
    [<dc60f815>] kernel_init+0x20/0x110
    [<faa1c5b0>] ret_from_kernel_thread+0x14/0x1c
