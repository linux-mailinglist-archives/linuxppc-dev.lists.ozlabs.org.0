Return-Path: <linuxppc-dev+bounces-7990-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC46A9CDFB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Apr 2025 18:23:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZkdSW1XKZz2yys;
	Sat, 26 Apr 2025 02:23:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745598219;
	cv=none; b=oPZ6LsNfVTGmvTtAk5/3onLB7oraskAn/UCQ5ocIzaAuaolY32ISJM/fZZ8IPdTyRIREk41HLYN2zd6FysYFfEpDniITekotfxQQT7LJvBfGv4pyqkdNYDDywCBzypuCju8PczZclZjAuoiEpxsFZlZE3OVo6lWLkqkKvpnNw029j4l+yyVIb9qjOlVZrmfbEI4YzYu9n1GAXb63VY4zppd/k88THWXtISoDbpcIPaNVuk6IFvoIxFIBhPf/ts3dynFFVdTQTbxq1NJvrjpnUUVqTvaMBIF6YmWbTiUqPu71K+o6RDIW8Pti79EJWDpYjqs7l3UtxlDZvatjRT3QHA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745598219; c=relaxed/relaxed;
	bh=jAaSIMhxlsFVyasL4fNhdLj8S0Zxik+9V6e2ixNYehw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TMhCQd9lwHfwh5KREI1v2VmjUjdvhLVXNg0F4+PFR6Oy3HsnVsTrTqkl7MYIZGEwxzz/12BNEoSy+jwFh96KsWL+pJrjyX0Q5urdrpHih0VLecD7Xx3CuIoz+6SUVGVZjbjK8YdFJ1e2/tBTEkj2tck3DDPqxEWLt7zBBk3YnN7srBNIvGUav20mXCBILXarzbdWcAt/YWP3cBbNMPcRC6H1u7zy7nEb+KVG41Bv/SavXp6UnbbGZ8sj2ttmaRgmgmMxM+yUT0GCCznWj3t/BofIdiozSCmIBvOnKC9culmTZf/9aizH2v9EF4qyihjs9wzdA1MohAeq2f1Qv3mCMw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=djEJ3HED; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=mk7sP/Sv; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=djEJ3HED;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=mk7sP/Sv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZkdST5pGtz2ydQ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Apr 2025 02:23:37 +1000 (AEST)
Date: Fri, 25 Apr 2025 18:23:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745598213;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jAaSIMhxlsFVyasL4fNhdLj8S0Zxik+9V6e2ixNYehw=;
	b=djEJ3HEDJRMRiGfx411Itey1aaOMWN2KekJ08l9mt561flfUhUVsE+AYrsYIMNmlS/tJ6X
	PBcYjys6hC4CcV7KFD2HTvY0ABTgHLprCLM4T1bxBY0qSSYwjBCmBEb0kf9IR/DSb84byK
	s4lFh2zz3klwQX4CyD5NlZjlIgUyHDzIXRQGsK3mER82gvHJ/Woi7xzBKy2WCsl03gzK6S
	cFoMe/rDLpb0Vaw40FgqO6mT1mYyLyV5HOzequpg4lpKw/BzzhVlVGWTQdngmaXCOKGDa/
	bRPi8r/EH+v4qbKxBQKJj3G1u8i56z4njC5ZXLBVec6SJeqf4OrddHYAkpah6w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745598213;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jAaSIMhxlsFVyasL4fNhdLj8S0Zxik+9V6e2ixNYehw=;
	b=mk7sP/SvMwdYxg/KeT/YGVBt3XA+4NXrRJo4uu3EVWVMZWny8roE8rsz+EiYa34nNrtx5W
	Q1Sy1hJ7iejTDlDg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: npiggin@gmail.com, vaibhav@linux.ibm.com, maddy@linux.ibm.com,
	linuxppc-dev@lists.ozlabs.org, christophe.leroy@csgroup.eu,
	gautam@linux.ibm.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] powerpc: kvm: use generic transfer to guest mode work
Message-ID: <20250425162331.qwpzuc-8@linutronix.de>
References: <20250421102837.78515-1-sshegde@linux.ibm.com>
 <20250421102837.78515-2-sshegde@linux.ibm.com>
 <20250424144215._ooDjDz9@linutronix.de>
 <365ba747-9311-45ab-b798-80ba4e578796@linux.ibm.com>
 <20250424183811.7_MLThpt@linutronix.de>
 <2891b989-6249-4e84-969e-f11af3f92b0b@linux.ibm.com>
 <20250425133131.DTvWJE29@linutronix.de>
 <5cc88718-13ff-4220-a8f6-c988a919aa65@linux.ibm.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5cc88718-13ff-4220-a8f6-c988a919aa65@linux.ibm.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025-04-25 19:54:56 [+0530], Shrikanth Hegde wrote:
> > > But looking at the semantics of usage of xfer_to_guest_mode_work
> > > I think using schedule is probably right over here.
> > > Correct me if i got it all wrong.
> > 
> > No, if you do xfer_to_guest_mode_work() then it will invoke schedule()
> > when appropriate. It just the thing in kvmhv_run_single_vcpu() looks odd
> > and might have been duct tape or an accident and could probably be
> > removed.
> > 
> 
> I was wondering xfer_to_guest_mode_work could also call cond_resched
> instead of schedule since for preempt=full/lazy is preemptible
> as early as possible right?

No, I think it is okay. For preempt=full you shouldn't observe the 
flag in xfer_to_guest_mode_work() so it does not matter.

Sebastian

