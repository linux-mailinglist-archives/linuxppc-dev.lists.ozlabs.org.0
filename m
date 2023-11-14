Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 472C87EB8AA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Nov 2023 22:33:03 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=J8z+kKsY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SVKK91dMBz3dB7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Nov 2023 08:33:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=J8z+kKsY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org)
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SVKJF1xCDz3cC7
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Nov 2023 08:32:13 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 76BE58285AEB;
	Tue, 14 Nov 2023 15:32:10 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id biSp-TwUGzPX; Tue, 14 Nov 2023 15:32:09 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 4FB84828638B;
	Tue, 14 Nov 2023 15:32:09 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 4FB84828638B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1699997529; bh=VJk5zpqX/HpkIG3+/GmjTLYhylofpIfhh6CIJhLyWWc=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=J8z+kKsYz4zv9H/W/6avGsM8p8rkxnO6RAI78RRaNtogloiZIawLmwa7hRcAfJrAk
	 448IyPXHWYThv4pqi3ySn36IImZTPwiFFn22qMXc3+9nUWT69l2fT2UtRKFjLo2+d5
	 eRjhLsDdySCcIvTpewxW/88ZgoyleXcJlc1VDVT4=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id ZZ2vmcZe6J78; Tue, 14 Nov 2023 15:32:09 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 09EA08285AEB;
	Tue, 14 Nov 2023 15:32:09 -0600 (CST)
Date: Tue, 14 Nov 2023 15:32:06 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Message-ID: <993112821.47345042.1699997526942.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <87pm0c7cr6.fsf@mail.lhotse>
References: <1654757454.47202735.1699948827325.JavaMail.zimbra@raptorengineeringinc.com> <87pm0c7cr6.fsf@mail.lhotse>
Subject: Re: [PATCH] powerpc: Fix data corruption on IPI
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC119 (Linux)/8.5.0_GA_3042)
Thread-Topic: powerpc: Fix data corruption on IPI
Thread-Index: 47t/lSCsyOfeUgVx2m7K6jadSmXYHA==
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
Cc: Jens Axboe <axboe@kernel.dk>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



----- Original Message -----
> From: "Michael Ellerman" <mpe@ellerman.id.au>
> To: "Timothy Pearson" <tpearson@raptorengineering.com>, "linuxppc-dev" <linuxppc-dev@lists.ozlabs.org>
> Cc: "Jens Axboe" <axboe@kernel.dk>
> Sent: Tuesday, November 14, 2023 6:14:37 AM
> Subject: Re: [PATCH] powerpc: Fix data corruption on IPI

> Hi Timothy,
> 
> Thanks for debugging this, but I'm unclear why this is helping because
> we should already have a full barrier (hwsync) on both the sending and
> receiving side.
> 
> More below.

So it looks like we might be dealing with a couple of potentially separate issues here, not sure.  This is probably the most infuriating bug I've run across in my career, so please bear with me -- with the amount of active test kernels I have installed at any one time I'm occassionally infecting one with the tests from another. ;)

First, I'm not 100% convinced the code in try_to_wake_up() is race-free on ppc64, since adding a memory barrier between it and the call to kick_process() significantly reduces the frequency of the on-disk corruption.  Can you take a look and see if anything stands out as to why that would be important?

The second part of this though is that the barrier only reduces the frequency of the corruption, it does not eliminate the corruption.  After some consolidation, what completely eliminates the corruption is a combination of:
 * Switching to TWA_SIGNAL_NO_IPI in task_work_add() * 
 * Adding udelay(1000) in io_uring/rw.c:io_write(), right before the call to io_rw_init_file()

Adding a memory barrier instead of the udelay() doesn't work, nor does adding the delay without switching to NO_IPI.

[1] Keeping TWA_SIGNAL and adding the barrier instruction also works, but this is conceptually simpler to understand as to why it would have an effect at all
