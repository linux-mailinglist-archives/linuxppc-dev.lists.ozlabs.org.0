Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5338FBDD6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 23:11:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=OUD580zT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vv3Df6Qtwz3dB7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2024 07:11:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=OUD580zT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=mailbox.org (client-ip=2001:67c:2050:0:465::102; helo=mout-p-102.mailbox.org; envelope-from=erhard_f@mailbox.org; receiver=lists.ozlabs.org)
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [IPv6:2001:67c:2050:0:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vv3Cw3k16z3cfn
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jun 2024 07:10:49 +1000 (AEST)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4Vv3CZ2kHfz9sc8;
	Tue,  4 Jun 2024 23:10:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1717535434;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ChI+yt8V0Gl1mMMTHjPeyIlN3h4hp6Dd5NAHjZ6KwIY=;
	b=OUD580zTq8/H4qyz+P5JohhY0kAu7iXKJDv0C6wt0BJfi3KjvvmDmlwRPrZgoLBDRmvpRU
	XWgKshcqT19gNqvoF1Nkfl+a61zolKVl9clcq2k5XXH7RcxyMbI2QXr5gDWDz1a9BA1K0i
	frWheHNDXhBJ572LRpNeJhMCLeHdyWCeHPBeSPKekCw8ja/GOkp6Nsw+sSZAiHtk0zNTQQ
	geuPFZBooJTMhUWQyEibF4iJGdFwUruw1vnfbab2cFaAPU/nSjBLOtGvrAssqv7OUphBrL
	BcFIHQciY68BdiwxszmYcYl42MLjAZ4ua1Y74KAWS3jB2SZKc2OmUEfWVUTH+w==
Date: Tue, 4 Jun 2024 23:10:19 +0200
From: Erhard Furtner <erhard_f@mailbox.org>
To: Yosry Ahmed <yosryahmed@google.com>
Subject: Re: kswapd0: page allocation failure: order:0,
 mode:0x820(GFP_ATOMIC), nodemask=(null),cpuset=/,mems_allowed=0 (Kernel
 v6.5.9, 32bit ppc)
Message-ID: <20240604231019.18e2f373@yea>
In-Reply-To: <CAJD7tkZ+QY55GTzW9A7ZCm=rxAEfrW76cWXf8o5nwiKSXp8z=w@mail.gmail.com>
References: <20240508202111.768b7a4d@yea>
	<20240515224524.1c8befbe@yea>
	<CAOUHufZ-9NmzOKjLedvZFp0=N0LvRZn77qC6k1WXK+NHtKr=0w@mail.gmail.com>
	<CAOUHufZ36rQc8AfLtRv2QrEareysdvbprAEO5XkcG-FeDOxFLA@mail.gmail.com>
	<20240602200332.3e531ff1@yea>
	<20240604001304.5420284f@yea>
	<CAJD7tkbCRLdy0vD2Pd17fNrxHgkzW1VucN4qMkohLFLBLaaeCQ@mail.gmail.com>
	<20240604134458.3ae4396a@yea>
	<CAJD7tkYjJJGthQ_8NukGw6Q9EYbLA=8sAH_7=B90KXEL6HWdSw@mail.gmail.com>
	<CAOUHufa0Fpj6SjNgB-z0n5Jg63q1ewkbOAU65forpDwQVs45qg@mail.gmail.com>
	<CAJD7tkb=5GJ9SNUwDsu1Zy3Tus4rjsNo60Hg9N7=gGth409Diw@mail.gmail.com>
	<CAOUHufb6zXr14Wm3T-4-OJh7iAq+vzDKwVYfHLhMMt96SpiZXg@mail.gmail.com>
	<CAJD7tkZ+QY55GTzW9A7ZCm=rxAEfrW76cWXf8o5nwiKSXp8z=w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 602f3f677966dc7d20e
X-MBO-RS-META: kfdi7qzihg3shght4uhztepa48pub5am
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
Cc: Nhat Pham <nphamcs@gmail.com>, Yu Zhao <yuzhao@google.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, Minchan Kim <minchan@kernel.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Johannes Weiner <hannes@cmpxchg.org>, Chengming Zhou <chengming.zhou@linux.dev>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 4 Jun 2024 11:01:39 -0700
Yosry Ahmed <yosryahmed@google.com> wrote:

> How many CPUs does this machine have? I am wondering if 32 can be an
> overkill for small machines, perhaps the number of pools should be
> max(nr_cpus, 32)?

This PowerMac G4 DP got 2 CPUs. Not much for a desktop machine by todays standards but some SoCs have less. ;)

 # lscpu 
Architecture:          ppc
  CPU op-mode(s):      32-bit
  Byte Order:          Big Endian
CPU(s):                2
  On-line CPU(s) list: 0,1
Model name:            7455, altivec supported
  Model:               3.3 (pvr 8001 0303)
  Thread(s) per core:  1
  Core(s) per socket:  1
  Socket(s):           2
  BogoMIPS:            83.78
Caches (sum of all):   
  L1d:                 64 KiB (2 instances)
  L1i:                 64 KiB (2 instances)
  L2:                  512 KiB (2 instances)
  L3:                  4 MiB (2 instances)

Regards,
Erhard
