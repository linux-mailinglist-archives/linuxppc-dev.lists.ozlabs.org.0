Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D732E31874
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jun 2019 01:53:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45G1W20PwFzDqcR
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jun 2019 09:53:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=dexuan.linux@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="nNttQKfz"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Fsyg5frxzDqZq
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Jun 2019 04:13:43 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id x7so3329187plr.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 May 2019 11:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=axvdF3LKD3BgDfD2a305RP9/YoNoUqoYwkWytR/v5ao=;
 b=nNttQKfzC7CUrVhs/y0dsV772JMzRCbdeR5lPENaOO58BtTHwKN/Q73f6OC/cNhYGy
 g2q5xj4HnTV5/3UPECw28Wi7db6eyO/dTXvUkfzDckWcMUxlXdBJkzK2VI7Lb3XQXI7r
 S/JnJJIOetYkn1Eaiq6H0zBm8BsF9AIg/sOn2OgQ6PJNyKawKB66F/luOa2iRElo2AkC
 paPqoJ8xkTTkhlKs993gfK8B3G6ycrlKc2mh7Dkd4LmPVaYdG9l/HJ2G5ts5ze0HO6sb
 wNGVCFEQ5KfhAv8gBHm08x/Yy0i9hXW9rjEkM/zwrzvTAMyYdM5N8UuFQ1/LJYBichpo
 5vOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=axvdF3LKD3BgDfD2a305RP9/YoNoUqoYwkWytR/v5ao=;
 b=mwIjSzdNuZx/P7IfVSrZlDRIC05TzW5z00pghevG5S2T6JuapyvJZuFlHR4sIk7To3
 syCHOQAtYbrHYT+01Van6pfjqSdI4CW/DOy0WTeEFhRKr6Ybo+VIYw7DE1EZNNcpgshm
 Yy0AQi2hCzIhmVXWoamSUJSJGtQtKCRmDqvGTvhrPrEXQrLADPlYYpIo1nijf6eMuqQE
 JHD3Q7lB8jtQhHq3jtuwGXIKuhqDvXsdhNi/mKe/a4KaCfGthV00NmG3RM1EdKQAgYV+
 Zk4rxJetPNAYEfoJkyIewAsB2NjqPi6HutKRasedcHCyOHWl9sjwFN1SVFm0j5CYVBLf
 Nqgg==
X-Gm-Message-State: APjAAAX5lltyE6aSISqyQn4xY7wyadeq7D0OMrtVMNarmHixnH4Ikgll
 Bgx4EiCHNNq4tbxUQ+Hd9Y8kHbCKHTVLZepSezY=
X-Google-Smtp-Source: APXvYqyAT5HFMCTTA81v2MHK2speUidhC9X0Ax4rhGXd5Tl1QqTsmmzjo5YPoD8K6YrNGmsIYA/6LO1mpz6EfiHfzeY=
X-Received: by 2002:a17:902:988a:: with SMTP id
 s10mr11318106plp.304.1559326418033; 
 Fri, 31 May 2019 11:13:38 -0700 (PDT)
MIME-Version: 1.0
References: <79EEB945-661A-41AD-8B26-2FD3B3F84697@linux.vnet.ibm.com>
 <87h89aohnu.fsf@concordia.ellerman.id.au>
In-Reply-To: <87h89aohnu.fsf@concordia.ellerman.id.au>
From: Dexuan-Linux Cui <dexuan.linux@gmail.com>
Date: Fri, 31 May 2019 11:13:26 -0700
Message-ID: <CAA42JLYcPi4ypvX=Ma8yWzUCF=B=FkDrzLex=bJiLyryuWTE2g@mail.gmail.com>
Subject: Re: [next-20190530] Boot failure on PowerPC
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 01 Jun 2019 09:52:26 +1000
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>, Dexuan Cui <decui@microsoft.com>,
 linux-next@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 v-lide@microsoft.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 31, 2019 at 6:52 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Sachin Sant <sachinp@linux.vnet.ibm.com> writes:
> > Latest next fails to boot with a kernel panic on POWER9.
> >
> > [   33.689332] Kernel panic - not syncing: stack-protector: Kernel stack is corrupted in: write_irq_affinity.isra.5+0x15c/0x160
> > [   33.689346] CPU: 35 PID: 4907 Comm: irqbalance Not tainted 5.2.0-rc2-next-20190530-autotest-autotest #1
> > [   33.689352] Call Trace:
> > [   33.689356] [c0000018d974bab0] [c000000000b5328c] dump_stack+0xb0/0xf4 (unreliable)
> > [   33.689364] [c0000018d974baf0] [c000000000120694] panic+0x16c/0x408
> > [   33.689370] [c0000018d974bb80] [c00000000012010c] __stack_chk_fail+0x2c/0x30
> > [   33.689376] [c0000018d974bbe0] [c0000000001b859c] write_irq_affinity.isra.5+0x15c/0x160
> > [   33.689383] [c0000018d974bd30] [c0000000004d6f30] proc_reg_write+0x90/0x110
> > [   33.689388] [c0000018d974bd60] [c00000000041453c] __vfs_write+0x3c/0x70
> > [   33.689394] [c0000018d974bd80] [c000000000418650] vfs_write+0xd0/0x250
> > [   33.689399] [c0000018d974bdd0] [c000000000418a2c] ksys_write+0x7c/0x130
> > [   33.689405] [c0000018d974be20] [c00000000000b688] system_call+0x5c/0x70
> >
> > Machine boots till login prompt and then panics few seconds later.
> >
> > Last known next build was May 24th. Will attempt few builds till May 30 to
> > narrow down this problem.
>
> My CI was fine with next-20190529 (9a15d2e3fd03e3).
>
> cheers

Hi Sachin,
It looks this patch may fix the issue:
https://lkml.org/lkml/2019/5/30/1630 , but I'm not sure.

Thanks
-- Dexuan
