Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4F76B7664
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Mar 2023 12:44:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PZvw36N3pz3cCy
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Mar 2023 22:44:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=u4NObk0m;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=canonical.com (client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=andrea.righi@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=u4NObk0m;
	dkim-atps=neutral
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PZrSJ4WZ9z3bqB
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Mar 2023 20:09:02 +1100 (AEDT)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 18E113F18C
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Mar 2023 09:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1678698537;
	bh=+zLoqF6BfOdUSle6q2rHxZJA0reMzMkFf8cRs0TMdRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type;
	b=u4NObk0mBe5anmHno4p1kOA1LCd0VO0DtY6vrcB9bzBjLeth4JWOgaWt4ZluKQfdH
	 wa/wX/K1yxG8iQZD1NhyroCmXC90uvp8iUJi4cxbewXbDhQ8czgwtbRk6S+rdIjhBU
	 F4oXz+4mIZMCcEXdUOoAYYAY29Xec0atmAV0iqYIFY8oMmz6A/3oA9rHnoIY8nVWg3
	 J8ZM0MopCtRPTxW7LZjw8oDJPzSNSISVL8HtGHLCSFROxaMf9TvZaM5ic/HUCgNXnb
	 G4PKqyFL4p1H+xpolew8EHMCgFQQXQozofXGqOxCMSRdZoQLyXC2XmOT4Ltxxh+RJI
	 8dH8pSYzrNVDg==
Received: by mail-ed1-f72.google.com with SMTP id h15-20020a056402280f00b004bf9e193c23so16101812ede.11
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Mar 2023 02:08:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678698535;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+zLoqF6BfOdUSle6q2rHxZJA0reMzMkFf8cRs0TMdRQ=;
        b=M8Fb8R+/JA0HBmHJqkrRXBimpQt8JTGb+kY4cl2qCM9DyYO4JXg3bSyhHHjtNEcU+h
         ZdgtOi2GbpuI+kPTcMpMwYd+rnX6L03i8dAXpImZi40RZ/9i+G5TwiRPBvRqz70cnu9E
         HYjsQqgLYdfS79Q8290wKvZuOofy97K2Vu9C6Z14A0i884l0SIprvxQYkEw84df44jhy
         P9+wOaSO3vQJkpHGnYIPlVpvRy9e0wHsLKtZAnCx+Y60VngtGFV4SClabmAIhPkAaIUO
         MZxHDbuLZJ05DMBL+zE0S1vOrNOhaaNfL5fL6l7Yoz1lKONpFOv5dpXi39HV9b52fHZm
         8YJg==
X-Gm-Message-State: AO0yUKWW4YBfhLSK17X2Gos2qQ1DVB4HE5bhk0yKIvkNf423DId2wErR
	hkSNphR8mOvhFb0SLsYG78URMnvM9sXC7cdkf6qtQDKAsvqQFgkKiUiQndmYY8edj8piRGIAuyK
	fEEiQ1vyT6kGpb2ja4jjv6fWbjNKwfQS6oHzwQ4KJhXc=
X-Received: by 2002:a17:907:3fa6:b0:877:a9d2:e5e9 with SMTP id hr38-20020a1709073fa600b00877a9d2e5e9mr43351031ejc.42.1678698535564;
        Mon, 13 Mar 2023 02:08:55 -0700 (PDT)
X-Google-Smtp-Source: AK7set8zaIoGIKt5CAbGfpbiLF+2JUW2fmQCY3xX2N3r1L5GI3QhgID5iSiMfAUqw3n4GDt4lI95/w==
X-Received: by 2002:a17:907:3fa6:b0:877:a9d2:e5e9 with SMTP id hr38-20020a1709073fa600b00877a9d2e5e9mr43350998ejc.42.1678698535272;
        Mon, 13 Mar 2023 02:08:55 -0700 (PDT)
Received: from localhost (host-79-53-23-214.retail.telecomitalia.it. [79.53.23.214])
        by smtp.gmail.com with ESMTPSA id ox29-20020a170907101d00b008e53874f8d8sm3157668ejb.180.2023.03.13.02.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 02:08:55 -0700 (PDT)
Date: Mon, 13 Mar 2023 10:08:54 +0100
From: Andrea Righi <andrea.righi@canonical.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: boot regression on ppc64 with linux 6.2
Message-ID: <ZA7oJr1/Z4vzWy4N@righiandr-XPS-13-7390>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Mon, 13 Mar 2023 22:43:12 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org, Oleg Nesterov <oleg@redhat.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I'm triggering the following bug when booting my qemu powerpc VM:

event-sources: Unable to request interrupt 23 for /event-sources/hot-plug-events
WARNING: CPU: 0 PID: 1 at arch/powerpc/platforms/pseries/event_sources.c:26 request_event_sources_irqs+0xbc/0xf0
Modules linked in:
CPU: 0 PID: 1 Comm: swapper/0 Tainted: G        W          6.2.2-kc #1
Hardware name: IBM pSeries (emulated by qemu) POWER9 (raw) 0x4e1200 0xf000005 of:SLOF,HEAD pSeries
NIP:  c000000002022eec LR: c000000002022ee8 CTR: 0000000000000000
REGS: c000000003483910 TRAP: 0700   Tainted: G        W           (6.2.2-kc)
MSR:  8000000002029033 <SF,VEC,EE,ME,IR,DR,RI,LE>  CR: 24483200  XER: 00000000
CFAR: c000000000180838 IRQMASK: 0 
GPR00: c000000002022ee8 c000000003483bb0 c000000001a5ce00 0000000000000050 
GPR04: c000000002437d78 c000000002437e28 0000000000000001 0000000000000001 
GPR08: c000000002437d00 0000000000000001 0000000000000000 0000000044483200 
GPR12: 0000000000000000 c000000002720000 c000000000012758 0000000000000000 
GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
GPR24: 0000000000000000 c0000000020033fc cccccccccccccccd c0000000000e07f0 
GPR28: c000000000db0520 0000000000000000 c0000000fff92ac0 0000000000000017 
NIP [c000000002022eec] request_event_sources_irqs+0xbc/0xf0
LR [c000000002022ee8] request_event_sources_irqs+0xb8/0xf0
Call Trace:
[c000000003483bb0] [c000000002022ee8] request_event_sources_irqs+0xb8/0xf0 (unreliable)
[c000000003483c40] [c000000002022fa0] __machine_initcall_pseries_init_ras_hotplug_IRQ+0x80/0xb0
[c000000003483c70] [c0000000000121b8] do_one_initcall+0x98/0x300
[c000000003483d50] [c000000002004b28] kernel_init_freeable+0x2ec/0x370
[c000000003483df0] [c000000000012780] kernel_init+0x30/0x190
[c000000003483e50] [c00000000000cf5c] ret_from_kernel_thread+0x5c/0x64
--- interrupt: 0 at 0x0

I did a bisect it and it seems that the offending commit is:
baa49d81a94b ("powerpc/pseries: hvcall stack frame overhead")

Reverting that and also dfecd06bc552 ("powerpc: remove
STACK_FRAME_OVERHEAD"), because we need to re-introduce
STACK_FRAME_OVERHEAD, seems to fix everything.

-Andrea
