Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC3F590A23
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Aug 2022 04:07:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M3nBd2yGSz3bms
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Aug 2022 12:07:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HmDTgRB0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=jniethe5@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HmDTgRB0;
	dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M3n9z5YXrz2xTj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Aug 2022 12:07:17 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id d16so18436212pll.11
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Aug 2022 19:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc;
        bh=smTjUv57Hlr3AcHnlp+Vjo8DToUDwlZlg3IQvLuE4/c=;
        b=HmDTgRB0xuJCb4pnWxjluTZ0/1KOQsEFuqlbNCfBnGFuu2j4UVVJq9G3Ng/PBLWEOL
         2GKDx5MzHWe5EBCfrhTxEmZsOoYcirL57wXhDSMXIVQWzPMQszYvl0vzoC1YOz8XNGm7
         ndXKZl0iuusv3fBTdgzsWflcO9IYA3pLKSWcnzZ2AeR2qcCPS0QAiEFBUIhE9KFSV4AW
         50cUXCysvVHwcIYU4/JN3rUyy82g3LLMIK1TuXA0jtgMx/yb0+D43B6YPWMpazw1z5z/
         ioNHBr77wk/2JNV1w3UZqKGuvbVcgu2omRGrQRBbux/CgY5eKby3aUOjIzU388PYWgDH
         TrRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc;
        bh=smTjUv57Hlr3AcHnlp+Vjo8DToUDwlZlg3IQvLuE4/c=;
        b=twk8YY4gxEc5CuZxoIDVMPzadArkz6IpXQarbV3Bl7o3+pwPDtlbOjGIMHBr0gTkIJ
         lJC7jrbrkO8YvTAcocGcEoTVoaGRWS7yplSqe/jBE8PoEbltF2dgGKTi1ns7bUgOt+2x
         Rooj2ddbTQGkJeQXk0yDrm4SKtbQJVLLDA4EyvGesl4K+OUKR1g7QHIqnxoJVFr+7IWu
         2PXW+YlrxQkqDna0oJ21doVn7PPluIld9Y1KqRo1mYcscL/zfdhc/lmJ97yMjerdPyd8
         RThZJE87o9VMq47+/MYEhRt5inlRJKttF2JkTFO92EsR8WVRKdKmua3QxX4/0WXCbHl8
         9p6Q==
X-Gm-Message-State: ACgBeo0r7hR0fmO1HUarIvT95uWmKicrj6QwGyqgiHNI3RQCVC7QvK0F
	fvRKV/oQAo7QJY0C6UON5nEzLrPET4U=
X-Google-Smtp-Source: AA6agR6UjYjsPDCzhceBjxUyuUC7nuZB7mXpdUazqQ8AfsWOgbQmKhv1VGnfTEELmbDHcMVMd/1LEg==
X-Received: by 2002:a17:90b:4d91:b0:1f5:24a:ff90 with SMTP id oj17-20020a17090b4d9100b001f5024aff90mr11771200pjb.152.1660270032910;
        Thu, 11 Aug 2022 19:07:12 -0700 (PDT)
Received: from tee480.ozlabs.ibm.com (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
        by smtp.googlemail.com with ESMTPSA id a28-20020a631a1c000000b0041d6cda2d60sm376299pga.66.2022.08.11.19.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 19:07:12 -0700 (PDT)
Message-ID: <bc56c5dd1d8f0343b64574b6899e5e9d8b7d8029.camel@gmail.com>
Subject: Re: [PATCH 09/17] powerpc/qspinlock: implement option to yield to
 previous node
From: Jordan Niethe <jniethe5@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Date: Fri, 12 Aug 2022 12:07:08 +1000
In-Reply-To: <20220728063120.2867508-11-npiggin@gmail.com>
References: <20220728063120.2867508-1-npiggin@gmail.com>
	 <20220728063120.2867508-11-npiggin@gmail.com>
Content-Type: text/plain; charset="UTF-7"
User-Agent: Evolution 3.36.5-0ubuntu1 
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2022-07-28 at 16:31 +-1000, Nicholas Piggin wrote:
+AD4 Queued waiters which are not at the head of the queue don't spin on
+AD4 the lock word but their qnode lock word, waiting for the previous queued
+AD4 CPU to release them. Add an option which allows these waiters to yield
+AD4 to the previous CPU if its vCPU is preempted.
+AD4 
+AD4 Disable this option by default for now, i.e., no logical change.
+AD4 ---
+AD4  arch/powerpc/lib/qspinlock.c +AHw 46 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+--
+AD4  1 file changed, 45 insertions(+-), 1 deletion(-)
+AD4 
+AD4 diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
+AD4 index 55286ac91da5..b39f8c5b329c 100644
+AD4 --- a/arch/powerpc/lib/qspinlock.c
+AD4 +-+-+- b/arch/powerpc/lib/qspinlock.c
+AD4 +AEAAQA -26,6 +-26,7 +AEAAQA static bool MAYBE+AF8-STEALERS +AF8AXw-read+AF8-mostly +AD0 true+ADs
+AD4  static int HEAD+AF8-SPINS +AF8AXw-read+AF8-mostly +AD0 (1+ADwAPA-8)+ADs
+AD4  
+AD4  static bool pv+AF8-yield+AF8-owner +AF8AXw-read+AF8-mostly +AD0 true+ADs
+AD4 +-static bool pv+AF8-yield+AF8-prev +AF8AXw-read+AF8-mostly +AD0 true+ADs

Similiar suggestion, maybe pv+AF8-yield+AF8-prev+AF8-enabled would read better.

Isn't this enabled by default contrary to the commit message?


+AD4  
+AD4  static DEFINE+AF8-PER+AF8-CPU+AF8-ALIGNED(struct qnodes, qnodes)+ADs
+AD4  
+AD4 +AEAAQA -224,6 +-225,31 +AEAAQA static +AF8AXw-always+AF8-inline void yield+AF8-to+AF8-locked+AF8-owner(struct qspinlock +ACo-lock, u32 va
+AD4  	cpu+AF8-relax()+ADs
+AD4  +AH0
+AD4  
+AD4 +-static +AF8AXw-always+AF8-inline void yield+AF8-to+AF8-prev(struct qspinlock +ACo-lock, struct qnode +ACo-node, int prev+AF8-cpu, bool paravirt)

yield+AF8-to+AF8-locked+AF8-owner() takes a raw val and works out the cpu to yield to.
I think for consistency have yield+AF8-to+AF8-prev() take the raw val and work it out too.

+AD4 +-+AHs
+AD4 +-	u32 yield+AF8-count+ADs
+AD4 +-
+AD4 +-	if (+ACE-paravirt)
+AD4 +-		goto relax+ADs
+AD4 +-
+AD4 +-	if (+ACE-pv+AF8-yield+AF8-prev)
+AD4 +-		goto relax+ADs
+AD4 +-
+AD4 +-	yield+AF8-count +AD0 yield+AF8-count+AF8-of(prev+AF8-cpu)+ADs
+AD4 +-	if ((yield+AF8-count +ACY 1) +AD0APQ 0)
+AD4 +-		goto relax+ADs /+ACo owner vcpu is running +ACo-/
+AD4 +-
+AD4 +-	smp+AF8-rmb()+ADs /+ACo See yield+AF8-to+AF8-locked+AF8-owner comment +ACo-/
+AD4 +-
+AD4 +-	if (+ACE-node-+AD4-locked) +AHs
+AD4 +-		yield+AF8-to+AF8-preempted(prev+AF8-cpu, yield+AF8-count)+ADs
+AD4 +-		return+ADs
+AD4 +-	+AH0
+AD4 +-
+AD4 +-relax:
+AD4 +-	cpu+AF8-relax()+ADs
+AD4 +-+AH0
+AD4 +-
+AD4  
+AD4  static +AF8AXw-always+AF8-inline bool try+AF8-to+AF8-steal+AF8-lock(struct qspinlock +ACo-lock, bool paravirt)
+AD4  +AHs
+AD4 +AEAAQA -291,13 +-317,14 +AEAAQA static +AF8AXw-always+AF8-inline void queued+AF8-spin+AF8-lock+AF8-mcs+AF8-queue(struct qspinlock +ACo-lock, b
+AD4  	 +ACo-/
+AD4  	if (old +ACY +AF8-Q+AF8-TAIL+AF8-CPU+AF8-MASK) +AHs
+AD4  		struct qnode +ACo-prev +AD0 get+AF8-tail+AF8-qnode(lock, old)+ADs
+AD4 +-		int prev+AF8-cpu +AD0 get+AF8-tail+AF8-cpu(old)+ADs

This could then be removed.

+AD4  
+AD4  		/+ACo Link +AEA-node into the waitqueue. +ACo-/
+AD4  		WRITE+AF8-ONCE(prev-+AD4-next, node)+ADs
+AD4  
+AD4  		/+ACo Wait for mcs node lock to be released +ACo-/
+AD4  		while (+ACE-node-+AD4-locked)
+AD4 -			cpu+AF8-relax()+ADs
+AD4 +-			yield+AF8-to+AF8-prev(lock, node, prev+AF8-cpu, paravirt)+ADs

And would have this as:
			yield+AF8-to+AF8-prev(lock, node, old, paravirt)+ADs


+AD4  
+AD4  		smp+AF8-rmb()+ADs /+ACo acquire barrier for the mcs lock +ACo-/
+AD4  	+AH0
+AD4 +AEAAQA -448,12 +-475,29 +AEAAQA static int pv+AF8-yield+AF8-owner+AF8-get(void +ACo-data, u64 +ACo-val)
+AD4  
+AD4  DEFINE+AF8-SIMPLE+AF8-ATTRIBUTE(fops+AF8-pv+AF8-yield+AF8-owner, pv+AF8-yield+AF8-owner+AF8-get, pv+AF8-yield+AF8-owner+AF8-set, +ACIAJQ-llu+AFw-n+ACI)+ADs
+AD4  
+AD4 +-static int pv+AF8-yield+AF8-prev+AF8-set(void +ACo-data, u64 val)
+AD4 +-+AHs
+AD4 +-	pv+AF8-yield+AF8-prev +AD0 +ACEAIQ-val+ADs
+AD4 +-
+AD4 +-	return 0+ADs
+AD4 +-+AH0
+AD4 +-
+AD4 +-static int pv+AF8-yield+AF8-prev+AF8-get(void +ACo-data, u64 +ACo-val)
+AD4 +-+AHs
+AD4 +-	+ACo-val +AD0 pv+AF8-yield+AF8-prev+ADs
+AD4 +-
+AD4 +-	return 0+ADs
+AD4 +-+AH0
+AD4 +-
+AD4 +-DEFINE+AF8-SIMPLE+AF8-ATTRIBUTE(fops+AF8-pv+AF8-yield+AF8-prev, pv+AF8-yield+AF8-prev+AF8-get, pv+AF8-yield+AF8-prev+AF8-set, +ACIAJQ-llu+AFw-n+ACI)+ADs
+AD4 +-
+AD4  static +AF8AXw-init int spinlock+AF8-debugfs+AF8-init(void)
+AD4  +AHs
+AD4  	debugfs+AF8-create+AF8-file(+ACI-qspl+AF8-steal+AF8-spins+ACI, 0600, arch+AF8-debugfs+AF8-dir, NULL, +ACY-fops+AF8-steal+AF8-spins)+ADs
+AD4  	debugfs+AF8-create+AF8-file(+ACI-qspl+AF8-head+AF8-spins+ACI, 0600, arch+AF8-debugfs+AF8-dir, NULL, +ACY-fops+AF8-head+AF8-spins)+ADs
+AD4  	if (is+AF8-shared+AF8-processor()) +AHs
+AD4  		debugfs+AF8-create+AF8-file(+ACI-qspl+AF8-pv+AF8-yield+AF8-owner+ACI, 0600, arch+AF8-debugfs+AF8-dir, NULL, +ACY-fops+AF8-pv+AF8-yield+AF8-owner)+ADs
+AD4 +-		debugfs+AF8-create+AF8-file(+ACI-qspl+AF8-pv+AF8-yield+AF8-prev+ACI, 0600, arch+AF8-debugfs+AF8-dir, NULL, +ACY-fops+AF8-pv+AF8-yield+AF8-prev)+ADs
+AD4  	+AH0
+AD4  
+AD4  	return 0+ADs

