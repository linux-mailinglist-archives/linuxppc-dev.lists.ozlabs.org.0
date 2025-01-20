Return-Path: <linuxppc-dev+bounces-5431-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F85A174BF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jan 2025 23:43:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YcQND5C4bz30Gm;
	Tue, 21 Jan 2025 09:43:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=80.241.56.152
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737412988;
	cv=none; b=WIfl3RZng6yYpdgxQRAYgpx9iNn4//yhJAN9M9gzM1l2ggZiGOM4+H9UCK26to3hdBcT5OYUzNj95AHkD+GgMpoiNb/115PnotLE/XfcUTfSmc/ALbLmLn3RKb4yr46zpiet36w5WVfEQx0nfA7NcjI7LwHYoQymbbXFQwHPPvyE7/f7fL4TaUjmOO3vVCiUkhUXEqEE2fCKT1q7wIV7zy0Xvi5xXFT1NEx4Nd2pIO+c8EADrJ/3cmvIrKwo1sA0jDVpjpXkCs2z0ZJ/z7LYlEAN5utp8lyMVWu0D0n5x4PQ/CVsRPyy8twg6MNY6zp4a5u0xeVEljKRIvthAD0urQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737412988; c=relaxed/relaxed;
	bh=2hh/ss2PDUT4eaNN+vK/Jl8IMH8r6uQh2wZL2yhPstY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ijVaPFuOBYPuxHgrHkLa203SGkFGzViWaa1ZPEFl7KMoAasXZEQY8J9uaaM/Tmg6c07Xvz8hnEZksfHLYLJsW8C6GS8rY7senaS/ZBaxY0+Wn1E23L8PiatpPayf71rpD5tfdTXrlSqujodSv6EQ41/e3khCg4+USdX3sYRr55hU71RmTT4XThAAYIJmrZLymX7IKgaXilVDzvCdtiHi0VxJbcUfWxOcq/tnz9MpDxAlaOBa6I5ETcvIJ+T8RJKuPSax+WVlO9BCbtYJEPWK737dH0AhlwL8zXG8wK9YuM3xbqRjj7FY4uCiKt6vd5EG5JmEnIO7WTRxwvZs19SBjw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=lb3+DeCF; dkim-atps=neutral; spf=pass (client-ip=80.241.56.152; helo=mout-p-102.mailbox.org; envelope-from=erhard_f@mailbox.org; receiver=lists.ozlabs.org) smtp.mailfrom=mailbox.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=lb3+DeCF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=mailbox.org (client-ip=80.241.56.152; helo=mout-p-102.mailbox.org; envelope-from=erhard_f@mailbox.org; receiver=lists.ozlabs.org)
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YcQNC5ljPz304N
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2025 09:43:05 +1100 (AEDT)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4YcQN34NQ4z9t1n;
	Mon, 20 Jan 2025 23:42:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1737412979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2hh/ss2PDUT4eaNN+vK/Jl8IMH8r6uQh2wZL2yhPstY=;
	b=lb3+DeCFeX/0IOYRU03upDMzG4bBJ9QnThmWgALeYMiMfSLs8rmtibaU1UgkboPoQNZFFz
	z2LWq8tlfzWKB5NADY13LI4DeDXQ+9Ui/fk2VDHHU07F7UzZjEZm7AP6BPwbBzzvc/kqTU
	7+c/ukgQ4BgL4IAOLwh6MDIXa+CvhB0klKp5YLzs39WNH4i0HgPlUqa7DTgIkqopnda9m3
	WKR373+l7+rLDxYNRVK1RCzPLk1kqmsHfeteMcoD49CF89cwnyA0Kd8g+lRZm2Lo7dqMYr
	YdqsWulhb2Uu/9e9rwVhOvNYeObdurw6oI8JmxVNf+582EywoMlAy7G488XP9w==
Date: Mon, 20 Jan 2025 23:42:57 +0100
From: Erhard Furtner <erhard_f@mailbox.org>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: Re: BUG: KASAN: vmalloc-out-of-bounds in
 copy_to_kernel_nofault+0xd8/0x1c8 (v6.13-rc6, PowerMac G4)
Message-ID: <20250120234257.712498c4@yea>
In-Reply-To: <af04e91f-0f44-457e-9550-d1d49789158e@linux.ibm.com>
References: <20250112135832.57c92322@yea>
	<af04e91f-0f44-457e-9550-d1d49789158e@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 531158b55e26f6897ce
X-MBO-RS-META: 17jeixh1yq4kwfhszjk6qkf3xdx8oki8
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, 19 Jan 2025 22:06:42 +0530
Madhavan Srinivasan <maddy@linux.ibm.com> wrote:

> On 1/12/25 6:28 PM, Erhard Furtner wrote:
> > Greetings!
> > 
> > I am getting this at bootup on my PowerMac G4 with a KASAN-enabled kernel 6.13-rc6:  
> 
> Sorry for the delayed response,
> 
> Are you seeing this only in this kernel or this is the recent
> kernel you tried to boot?

I think I didn't run a KASAN enabled 6.11 or 6.12 kernel but the reported KASAN hit is still in currently released 6.13:

[...]
==================================================================
BUG: KASAN: vmalloc-out-of-bounds in copy_to_kernel_nofault+0xd8/0x1c8
Write of size 8 at addr f1014000 by task chronyd/1301

CPU: 1 UID: 123 PID: 1301 Comm: chronyd Tainted: G        W          6.13.0-PMacG4 #3
Tainted: [W]=WARN
Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
Call Trace:
[c7bdf690] [c16327c8] dump_stack_lvl+0x70/0x8c (unreliable)
[c7bdf6b0] [c0504b78] print_report+0xdc/0x504
[c7bdf710] [c050493c] kasan_report+0xf8/0x108
[c7bdf790] [c0505c1c] kasan_check_range+0x24/0x18c
[c7bdf7a0] [c03fb668] copy_to_kernel_nofault+0xd8/0x1c8
[c7bdf7c0] [c004c014] patch_instructions+0x15c/0x16c
[c7bdf810] [c00731a8] bpf_arch_text_copy+0x60/0x7c
[c7bdf830] [c02811f4] bpf_jit_binary_pack_finalize+0x50/0xac
[c7bdf850] [c0073cf4] bpf_int_jit_compile+0xb30/0xdec
[c7bdf980] [c0280420] bpf_prog_select_runtime+0x15c/0x478
[c7bdf9d0] [c1264100] bpf_prepare_filter+0xbf8/0xc14
[c7bdfa90] [c12684c4] bpf_prog_create_from_user+0x258/0x2b4
[c7bdfad0] [c02711a8] do_seccomp+0x3dc/0x1890
[c7bdfbc0] [c001d8e0] system_call_exception+0x2dc/0x420
[c7bdff30] [c00281ac] ret_from_syscall+0x0/0x2c
--- interrupt: c00 at 0x591274
NIP:  00591274 LR: 00693b3c CTR: 005196c8
REGS: c7bdff40 TRAP: 0c00   Tainted: G        W           (6.13.0-PMacG4)
MSR:  0200f932 <VEC,EE,PR,FP,ME,IR,DR,RI>  CR: 24004422  XER: 00000000

GPR00: 00000166 aff4aad0 a77fb540 00000001 00000000 01fe2500 00595858 0200f932 
GPR08: 00000000 00001fe9 02001fc8 005196c8 2822244c 00b1fcd8 00000000 aff4bb57 
GPR16: 00000000 00000001 00000000 00000000 00000000 00000001 00000000 00000002 
GPR24: 00aedbb0 00000000 00000000 00000000 006d0004 01ffa060 006d7c1c 00000001 
NIP [00591274] 0x591274
LR [00693b3c] 0x693b3c
--- interrupt: c00

The buggy address belongs to the virtual mapping at
 [f1014000, f1016000) created by:
 text_area_cpu_up+0x20/0x190

The buggy address belongs to the physical page:
page: refcount:1 mapcount:0 mapping:00000000 index:0x0 pfn:0x77116
flags: 0x80000000(zone=2)
raw: 80000000 00000000 00000122 00000000 00000000 00000000 ffffffff 00000001
raw: 00000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 f1013f00: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
 f1013f80: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
>f1014000: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
           ^
 f1014080: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
 f1014100: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
==================================================================
Disabling lock debugging due to kernel taint


Regards,
Erhard

