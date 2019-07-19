Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 933796E598
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 14:23:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45qqsc0GVhzDqxF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 22:23:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=brauner.io
 (client-ip=2a00:1450:4864:20::441; helo=mail-wr1-x441.google.com;
 envelope-from=christian@brauner.io; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=brauner.io
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=brauner.io header.i=@brauner.io header.b="YA6Eggnr"; 
 dkim-atps=neutral
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45qqqH6XgxzDqjl
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jul 2019 22:21:15 +1000 (AEST)
Received: by mail-wr1-x441.google.com with SMTP id p13so32034790wru.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jul 2019 05:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=brauner.io; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ZSNxINB1eoSUuwzdj5DoTcqLmEl60Bp0Y1Hgn40sFfw=;
 b=YA6EggnrFQ6Rx4knXWvUwz2U9x+1SCXFlO09KhemP39oSM5WYZgQ2m/kFVHmUdPaiL
 Bm1Ggw6zh2v63WBxSukl1wDC7kjbGrKz1ZXMbEgZLoli/r4F13x+dHAZ6rE4Pz2qeley
 9tPCOG2cMyDnw62NpBr9grkI92uWPyMgpht0Uw2SLvd9Dz2mAO6avNTIp3+tem/noeAR
 V4om6zfHYpQNS87JMPrVvHsV4E1J0XeN9bBskUB2432vKBEvTC8+7q2OQdTGZ93iZIvI
 ohhk/qhXg1mByYO2x65TDsZB/H0HOt+SpMEznQE/4/KLLVO6NYvQR0/hZMhvkRJlJ94I
 XwzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ZSNxINB1eoSUuwzdj5DoTcqLmEl60Bp0Y1Hgn40sFfw=;
 b=nxM0yToN55SH8m9r62d5Y3MpGa8c5ur+R3hugu4sSePP1cs2qVigE30ulp71zsrGMb
 82JRCrfxfnB7bzJfTxltueJmuaAoxPXkkusyh7cXdgiA4/0K5qizq4Fy87wLz0um3qoi
 GLrrLqWY6heKLT+rOjVZoN/nykCPpT17ErSGJRMNX/9Ov2IYCFHSXNKiHqpkdkiYAnbR
 fB/QlUJzYrxqDr4pBMoCk6sb6yeRCcSzjGPwv/76XUWljr71rKKpuyJbsiZ9bC6Q2tBK
 v151i9i517TM7wKCNnbvBtDr5HXb1JgI4efreB+DX/yJgWSsTg7VICBKqo/MG9ZlUJpR
 H07A==
X-Gm-Message-State: APjAAAU5NMRc+BY7aQG4Rtl1OjyDQgk1UGdtWfsc1KuLGJVObXqqeO/o
 +54fsYrZrJGZ4jLDIDXXPHU=
X-Google-Smtp-Source: APXvYqx9gGrYkCwplFu6XW/mRH357ZdxOoELb3Z3UiLqCzSiDwFdDoevEVdtgUgUKpbiqm5tozaFNg==
X-Received: by 2002:adf:f851:: with SMTP id d17mr56545224wrq.77.1563538868448; 
 Fri, 19 Jul 2019 05:21:08 -0700 (PDT)
Received: from brauner.io (p5097b50e.dip0.t-ipconnect.de. [80.151.181.14])
 by smtp.gmail.com with ESMTPSA id r12sm38324623wrt.95.2019.07.19.05.21.05
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 19 Jul 2019 05:21:07 -0700 (PDT)
Date: Fri, 19 Jul 2019 14:20:59 +0200
From: Christian Brauner <christian@brauner.io>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 1/2] arch: mark syscall number 435 reserved for clone3
Message-ID: <20190719122058.njbtwy2fbd6xrp2d@brauner.io>
References: <20190714192205.27190-1-christian@brauner.io>
 <20190714192205.27190-2-christian@brauner.io>
 <e14eb2f9-43cb-0b9d-dec4-b7e7dcd62091@de.ibm.com>
 <20190716130631.tohj4ub54md25dys@brauner.io>
 <874l3i8h0l.fsf@concordia.ellerman.id.au>
 <20190719102503.tm3ahvkh4rwykmws@brauner.io>
 <871rym8egj.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <871rym8egj.fsf@concordia.ellerman.id.au>
User-Agent: NeoMutt/20180716
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, arnd@arndb.de,
 linux-sh@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 linux-m68k@lists.linux-m68k.org, linux-alpha@vger.kernel.org,
 sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Vasily Gorbik <gor@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 19, 2019 at 09:13:16PM +1000, Michael Ellerman wrote:
> Christian Brauner <christian@brauner.io> writes:
> > On Fri, Jul 19, 2019 at 08:18:02PM +1000, Michael Ellerman wrote:
> >> Christian Brauner <christian@brauner.io> writes:
> >> > On Mon, Jul 15, 2019 at 03:56:04PM +0200, Christian Borntraeger wrote:
> >> >> I think Vasily already has a clone3 patch for s390x with 435. 
> >> >
> >> > A quick follow-up on this. Helge and Michael have asked whether there
> >> > are any tests for clone3. Yes, there will be and I try to have them
> >> > ready by the end of the this or next week for review. In the meantime I
> >> > hope the following minimalistic test program that just verifies very
> >> > very basic functionality (It's not pretty.) will help you test:
> >> 
> >> Hi Christian,
> >> 
> >> Thanks for the test.
> >> 
> >> This actually oopses on powerpc, it hits the BUG_ON in CHECK_FULL_REGS
> >> in process.c around line 1633:
> >> 
> >> 	} else {
> >> 		/* user thread */
> >> 		struct pt_regs *regs = current_pt_regs();
> >> 		CHECK_FULL_REGS(regs);
> >> 		*childregs = *regs;
> >> 		if (usp)
> >> 
> >> 
> >> So I'll have to dig into how we fix that before we wire up clone3.
> >> 
> >> Turns out testing is good! :)
> >
> > Indeed. I have a test-suite for clone3 in mind and I hope to have it
> > ready by the end of next week. It's just always the finding the time
> > part that is annoying. :)
> 
> I know the feeling!
> 
> > Thanks for digging into this, Michael!
> 
> No worries, happy to help where I can.
> 
> In the intervening five minutes I remembered how we handle this, we just
> need a little wrapper to save the non-volatile regs:
> 
> _GLOBAL(ppc_clone3)
> 	bl	save_nvgprs
> 	bl	sys_clone3
> 	b	.Lsyscall_exit

Sounds good.

> 
> 
> A while back I meant to make it generate those automatically based on a
> flag in the syscall.tbl but of course haven't got around to it :)
> 
> So with the above it seems all good:
> 
> $ ./clone3 ; echo $?
> Parent process received child's pid 4204 as return value
> Parent process received child's pidfd 3
> Parent process received child's pid 4204 as return argument
> Child process with pid 4204
> 0
> 
> I'll send a patch to wire it up on Monday.

Excellent! Thank you!
Christian
