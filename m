Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 093644A0A3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2019 14:19:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45SnFq5CQYzDqdV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2019 22:19:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d41; helo=mail-io1-xd41.google.com;
 envelope-from=radu.rendec@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="XJqwkGGn"; 
 dkim-atps=neutral
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45SnB82FszzDqbs
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2019 22:16:31 +1000 (AEST)
Received: by mail-io1-xd41.google.com with SMTP id s7so29121562iob.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2019 05:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=VD5To6MnDfxC+IblUyr9QHqMXNKUG2Rn2i056Yk7q5s=;
 b=XJqwkGGnuh98wPP8O575KoOR08AD4YwDJfdgVkf5GQHAn42596DeD8l6JkgarBWXlf
 quPjO7rMH1TvR8RIybHhggvHPUWefEsvQVGGK2AIGbN7rrQWUEeC3eFhXr+t2vnD6Eao
 efxtkSBUphv7Hfcfky8x3A4WepJcST6qM4obvsd2RDn2QTZ4efRUsHL+zw1FeMWZzchz
 SWIOeWALK8viMOs/Fjs2cx+BmTJNMDpO68+x44XJ6oDeiP5alZr0opFOmWzWyh02hJYI
 QDOCCjg++9kcRXmt89Z5axe5+184XCuHbYA6T9++hoTP5Ts5H6hQamLF3KQbW5WVzsPb
 smRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=VD5To6MnDfxC+IblUyr9QHqMXNKUG2Rn2i056Yk7q5s=;
 b=azJR5xbGNwktYohppRur7xoIB/jVSAR/87zOU6aEjPdsFU0aYA7ESr8iE0iQ7BMVbt
 Hh7G83kn4rHxSmNfnEMcDdrRB0SVbubw78JS8v0+Cvwy5Vo3wx8s6pywVpBnwekijjIE
 ZsxE5fjbMtj1QmpKOxgJpeNvJ0CYaJ7909muGR+AzwuOfpHPeYm4kQFt6DPpLfp9nwH3
 eTwJ0ErbHqOh31kQtcnrgc2qO44683Clfkqmcck9VJFDz1CWVam8fICbXZ98c7zNCN4v
 TCMo+blidtHpMowxkzZyC+IvrqfQkG1zTG2gpFmtI+J9pdk8ZH7BwWSnUs9fSpx715Cj
 jr9g==
X-Gm-Message-State: APjAAAXSltWPUW4No+gV0BPX5k3WzcIowvFlVgHNwaRk7nyTyOU1aNBu
 P4JbJI+rDve7WT9pNdRTs10=
X-Google-Smtp-Source: APXvYqx1QEId0NwxhHn8WNdY9TZNvtBLJd9m8kwLhJTBJro5Nz64ZXjl7D6Buin0rKikrcDmuGWptA==
X-Received: by 2002:a5e:c70c:: with SMTP id f12mr5081684iop.293.1560860188081; 
 Tue, 18 Jun 2019 05:16:28 -0700 (PDT)
Received: from bat.mindbit.ro (CPE00fc8d79db03-CM00fc8d79db00.cpe.net.fido.ca.
 [72.140.67.131])
 by smtp.gmail.com with ESMTPSA id o7sm12990844ioo.81.2019.06.18.05.16.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 18 Jun 2019 05:16:27 -0700 (PDT)
Message-ID: <fbf9f9cbb99fc40c7d7af86fee3984427c61b799.camel@gmail.com>
Subject: Re: [PATCH 0/1] PPC32: fix ptrace() access to FPU registers
From: Radu Rendec <radu.rendec@gmail.com>
To: Daniel Axtens <dja@axtens.net>, linuxppc-dev@lists.ozlabs.org
Date: Tue, 18 Jun 2019 08:16:25 -0400
In-Reply-To: <87muif2y4l.fsf@dja-thinkpad.axtens.net>
References: <20190610232758.19010-1-radu.rendec@gmail.com>
 <87r27t2el0.fsf@dja-thinkpad.axtens.net>
 <5fcdb5767b7cf4c7d5b7496c0032021e43115d39.camel@gmail.com>
 <87muif2y4l.fsf@dja-thinkpad.axtens.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
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
Cc: Paul Mackerras <paulus@samba.org>, Oleg Nesterov <oleg@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2019-06-18 at 16:42 +1000, Daniel Axtens wrote:
> Radu Rendec <
> radu.rendec@gmail.com
> > writes:
> 
> > On Mon, 2019-06-17 at 11:19 +1000, Daniel Axtens wrote:
> > > Radu Rendec <
> > > radu.rendec@gmail.com
> > > 
> > > > writes:
> > > > Hi Everyone,
> > > > 
> > > > I'm following up on the ptrace() problem that I reported a few days ago.
> > > > I believe my version of the code handles all cases correctly. While the
> > > > problem essentially boils down to dividing the fpidx by 2 on PPC32, it
> > > > becomes tricky when the same code must work correctly on both PPC32 and
> > > > PPC64.
> > > > 
> > > > One other thing that I believe was handled incorrectly in the previous
> > > > version is the unused half of fpscr on PPC32. Note that while PT_FPSCR
> > > > is defined as (PT_FPR0 + 2*32 + 1), making only the upper half visible,
> > > > PT_FPR0 + 2*32 still corresponds to a possible address that userspace
> > > > can pass. In that case, comparing fpidx to (PT_FPSCR - PT_FPR0) would
> > > > cause an invalid access to the FPU registers array.
> > > > 
> > > > I tested the patch on 4.9.179, but that part of the code is identical in
> > > > recent kernels so it should work just the same.
> > > > 
> > > > I wrote a simple test program than can be used to quickly test (on an
> > > > x86_64 host) that all cases are handled correctly for both PPC32/PPC64.
> > > > The code is included below.
> > > > 
> > > > I also tested with gdbserver (test patch included below) and verified
> > > > that it generates two ptrace() calls for each FPU register, with
> > > > addresses between 0xc0 and 0x1bc.
> > > 
> > > Thanks for looking in to this. I can confirm your issue. What I'm
> > > currently wondering is: what is the behaviour with a 32-bit userspace on
> > > a 64-bit kernel? Should they also be going down the 32-bit path as far
> > > as calculating offsets goes?
> > 
> > Thanks for reviewing this. I haven't thought about the 32-bit userspace
> > on a 64-bit kernel, that is a very good question. Userspace passes a
> > pointer, so in theory it could go down either path as long as the
> > pointer points to the right data type.
> > 
> > I will go back to the gdb source code and try to figure out if that case
> > is handled in a special way. If not, it's probably safe to assume that a
> > 32-bit userspace should always go down the 32-bit path regardless of the
> > kernel bitness (in which case I think I have to change my patch).
> 
> It doesn't seem to reproduce on a 64-bit kernel with 32-bit
> userspace. Couldn't tell you why - if you can figure it out from the gdb
> source code I'd love to know! I have, however, tried it - and all the fp
> registers look correct and KASAN doesn't pick up any memory corruption.

I looked at the gdb source code and all it seems to care about is the
architecture it was compiled for. In other words, 32-bit gdb always
assumes 32-bit register layout, regardless of whether it's running on a
32-bit or 64-bit kernel.

So it's no surprise that the problem didn't reproduce and KASAN didn't
pick up anything in your experiment. Since the kernel is 64-bit, it
divides addresses by 8, so all indexes are within bounds. The part that
I don't get is how the FP registers looked correct.

Since you already have a working setup, it would be nice if you could
add a printk to arch_ptrace() to print the address and confirm what I
believe happens (by reading the gdb source code).

So for 32-bit gdb on 64-bit kernel, I think gdb will generate 48 x 4-
byte aligned addresses for the CPU registers, then 32 x 2 x 4-byte
aligned addresses for the FPU registers. The indexes will not overflow,
but access to all registers (CPU and FPU) will be broken because:
 * The kernel always divides by 8. The CPU register address range that
   gdb generates will be half of what the kernel expects and "odd" (i.e.
   non 8-byte aligned) addresses will fail with EIO because the kernel
   code checks that the last 3 bits are all zero.
 * The FPU register indexes will be off by 24. For example, when gdb
   thinks it asks for FPR0, it calculates the address as 4 x 48, but the
   kernel divides by 8, so it will get index 24, which it thinks is a
   CPU register.

When it stops on a breakpoint, gdb seems to read all registers (both CPU
and FPU) in ascending index order. So if you print the address in the
kernel it's actually very easy to verify my theory. I expect addresses
from 0 to 48 x 4 in increments of 4 (for the CPU registers), then
addresses from 48 x 4 to 48 x 4 + 32 x 2 x 4 in increments of 4 (for the
FPU registers).

Best regards,
Radu


