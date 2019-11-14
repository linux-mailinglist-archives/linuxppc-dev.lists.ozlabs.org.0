Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 32948FCB07
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 17:48:50 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DS9W3dk3zF7wV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2019 03:48:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx1.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DS7V6pD2zF55m
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2019 03:47:01 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 43931B146
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 16:46:56 +0000 (UTC)
Date: Thu, 14 Nov 2019 17:46:55 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: WARN_ONCE does not warn once
Message-ID: <20191114164655.GH11661@kitsune.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
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

Hello,

on powernv with 5.3.8 kernel I get flood of messages on boot.

The messages match WARN_ONCE(1, "opal: OPAL_CONSOLE_FLUSH missing.\n");

------------[ cut here ]------------
opal: OPAL_CONSOLE_FLUSH missing.
WARNING: CPU: 0 PID: 0 at ../arch/powerpc/platforms/powernv/opal.c:435 __opal_flush_console+0xfc/0x110
Modules linked in:
Supported: No, Unreleased kernel
CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.8-11.gea9b07d-default #1 SLE15-SP2 (unreleased)
NIP:  c0000000000b9b9c LR: c0000000000b9b98 CTR: c000000000c06ca0
REGS: c00000000158b8c0 TRAP: 0700   Not tainted  (5.3.8-11.gea9b07d-default)
MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28004222  XER: 20000000
CFAR: c000000000132df0 IRQMASK: 1 
GPR00: c0000000000b9b98 c00000000158bb50 c00000000158c600 0000000000000022 
GPR04: c000000000e63b7a 0000000000000002 4f534e4f435f4c41 4853554c465f454c 
GPR08: 676e697373696d20 0000000000000000 0000000000000027 9000000000001033 
GPR12: c0000000001cc080 c000000002150000 0000000000000000 0000000000000000 
GPR16: 00003ffff13114c0 0000000000000000 c0000000014641e0 0000000000000000 
GPR20: 0000000000000000 c000000001765738 c000000001763738 0000000000000001 
GPR24: c0000000015c1ed8 c000000001763318 c000000001762dec 0000000000000001 
GPR28: 0000000000000000 c000000002130d18 0000000000000000 0000000000000000 
NIP [c0000000000b9b9c] __opal_flush_console+0xfc/0x110
LR [c0000000000b9b98] __opal_flush_console+0xf8/0x110
Call Trace:
[c00000000158bb50] [c0000000000b9b98] __opal_flush_console+0xf8/0x110 (unreliable)
[c00000000158bbd0] [c0000000000b9dbc] opal_flush_console+0x2c/0x60
[c00000000158bc00] [c00000000080c180] udbg_opal_putc+0x80/0xd0
[c00000000158bc50] [c000000000033660] udbg_write+0x90/0x140
[c00000000158bc90] [c0000000001c888c] console_unlock+0x32c/0x820
[c00000000158bd70] [c0000000001c9768] register_console+0x5d8/0x790
[c00000000158be10] [c000000000fb9dcc] register_early_udbg_console+0x9c/0xb4
[c00000000158be80] [c000000000fb99c8] setup_arch+0x78/0x39c
[c00000000158bef0] [c000000000fb3c00] start_kernel+0xb4/0x6bc
[c00000000158bf90] [c00000000000c4d4] start_here_common+0x1c/0x20
Instruction dump:
60000000 3860fffe 4bffffa8 60000000 60000000 3c62ff8d 39200001 3d42fff6 
38637558 992afea8 480791f5 60000000 <0fe00000> 4bffff54 48079715 60000000 
random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
---[ end trace 0000000000000000 ]---

This is reapated numerous times and the kernel eventually boots.

Is that an issue with the WARN_ONCE implementation?

Thanks

Michal
