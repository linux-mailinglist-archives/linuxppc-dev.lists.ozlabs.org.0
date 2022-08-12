Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E630F590AF9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Aug 2022 06:23:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M3rBj5LWtz3c6D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Aug 2022 14:23:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TphCFdX4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=jniethe5@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TphCFdX4;
	dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M3rB50ls4z2xHd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Aug 2022 14:22:35 +1000 (AEST)
Received: by mail-pg1-x532.google.com with SMTP id c24so13993788pgg.11
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Aug 2022 21:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc;
        bh=HBxVv8bM8mQUKoWtx79tt0sDeW3ZTr98/uxIv/bEJKk=;
        b=TphCFdX4Kj4XCy41pTL7uIUMnL2NRrTQJcu8m4WDLpCW8PflwHw+srreHv1OGorVct
         jQVbYLlGONgu1Lo2UJhjqKSoUmayS9kTZ+X8OhEpo0YfPnc4LqYzp811uRvlIJBconvT
         c6wfblnPlnvsbAKXmdIZLpE8lHWGfScEqJc7QIafw13uBw9FSnNG/zsJQ5neZZbete7I
         vJhTxfVslZ4+z4YdUaWzodXJTLe8gdDyuvxh8/swVyD8x+tsUFEbTQ/8T7wqA3LVbAuF
         /J8UzfhPg9AvQXSNwFoUV2+45qniYCrXFzy1dyof+dbGBCQOs2mv6gADfRRldv1ARNQv
         vjtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc;
        bh=HBxVv8bM8mQUKoWtx79tt0sDeW3ZTr98/uxIv/bEJKk=;
        b=mHYbEs2RaLayC5gW4oHU2/4ZAuW/GquOYhnLx4x+OjKefav0DQ4WBUykhl8x4KiDC5
         RvyrYQqv0Z0kMr0OlTPRZs+H3kKCvXjnJnM+n4CbX3FvePD+PrMVbxENcF+QXlh844in
         5zvuHck5/b//RGP+bLe6UFehkT1HzssdRX+O/soD1xnuB9ZDm41Zea1Vhees8qqL+qON
         mLpOLsAHpgAyyopmr9DUVyEYVycdwn7s9a8IsPyEDuazGFly7QCaUD+3l0ycN+JzpnhL
         1+9/EyaBglSvAQ2S2Eyh1SPni9xKOCEv5pa5FHTR01DdpRg9koz47/0xLPIAHchqp6hF
         hROQ==
X-Gm-Message-State: ACgBeo0FOOKDbwWr4nXp9fRMrPWyXrSGyzaWgf4XJqFK1g7aAHlZBweN
	ee8T8RJ0ngJwLNqh5S5XEfc=
X-Google-Smtp-Source: AA6agR7m2r1BaqrAxp+uLyBJNgAX7eqYu0VnX4i+jb2OVsHY4n8e9Ti2Mf068lXnDQBMf/S80UsB2Q==
X-Received: by 2002:a63:6e82:0:b0:41a:1817:15d9 with SMTP id j124-20020a636e82000000b0041a181715d9mr1741215pgc.577.1660278152079;
        Thu, 11 Aug 2022 21:22:32 -0700 (PDT)
Received: from tee480.ozlabs.ibm.com (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
        by smtp.googlemail.com with ESMTPSA id x10-20020a170902ec8a00b0016cf195eb16sm524173plg.185.2022.08.11.21.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 21:22:31 -0700 (PDT)
Message-ID: <0029908b1bf7b098b6b0ed2a129730a5313a7a37.camel@gmail.com>
Subject: Re: [PATCH 12/17] powerpc/qspinlock: add ability to prod new queue
 head CPU
From: Jordan Niethe <jniethe5@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Date: Fri, 12 Aug 2022 14:22:28 +1000
In-Reply-To: <20220728063120.2867508-14-npiggin@gmail.com>
References: <20220728063120.2867508-1-npiggin@gmail.com>
	 <20220728063120.2867508-14-npiggin@gmail.com>
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
+AD4 After the head of the queue acquires the lock, it releases the
+AD4 next waiter in the queue to become the new head. Add an option
+AD4 to prod the new head if its vCPU was preempted. This may only
+AD4 have an effect if queue waiters are yielding.
+AD4 
+AD4 Disable this option by default for now, i.e., no logical change.
+AD4 ---
+AD4  arch/powerpc/lib/qspinlock.c +AHw 29 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+--
+AD4  1 file changed, 28 insertions(+-), 1 deletion(-)
+AD4 
+AD4 diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
+AD4 index 28c85a2d5635..3b10e31bcf0a 100644
+AD4 --- a/arch/powerpc/lib/qspinlock.c
+AD4 +-+-+- b/arch/powerpc/lib/qspinlock.c
+AD4 +AEAAQA -12,6 +-12,7 +AEAAQA
+AD4  struct qnode +AHs
+AD4  	struct qnode	+ACo-next+ADs
+AD4  	struct qspinlock +ACo-lock+ADs
+AD4 +-	int		cpu+ADs
+AD4  	int		yield+AF8-cpu+ADs
+AD4  	u8		locked+ADs /+ACo 1 if lock acquired +ACo-/
+AD4  +AH0AOw
+AD4 +AEAAQA -30,6 +-31,7 +AEAAQA static bool pv+AF8-yield+AF8-owner +AF8AXw-read+AF8-mostly +AD0 true+ADs
+AD4  static bool pv+AF8-yield+AF8-allow+AF8-steal +AF8AXw-read+AF8-mostly +AD0 false+ADs
+AD4  static bool pv+AF8-yield+AF8-prev +AF8AXw-read+AF8-mostly +AD0 true+ADs
+AD4  static bool pv+AF8-yield+AF8-propagate+AF8-owner +AF8AXw-read+AF8-mostly +AD0 true+ADs
+AD4 +-static bool pv+AF8-prod+AF8-head +AF8AXw-read+AF8-mostly +AD0 false+ADs
+AD4  
+AD4  static DEFINE+AF8-PER+AF8-CPU+AF8-ALIGNED(struct qnodes, qnodes)+ADs
+AD4  
+AD4 +AEAAQA -392,6 +-394,7 +AEAAQA static +AF8AXw-always+AF8-inline void queued+AF8-spin+AF8-lock+AF8-mcs+AF8-queue(struct qspinlock +ACo-lock, b
+AD4  	node +AD0 +ACY-qnodesp-+AD4-nodes+AFs-idx+AF0AOw
+AD4  	node-+AD4-next +AD0 NULL+ADs
+AD4  	node-+AD4-lock +AD0 lock+ADs
+AD4 +-	node-+AD4-cpu +AD0 smp+AF8-processor+AF8-id()+ADs

I suppose this could be used in some other places too.

For example change:
	yield+AF8-to+AF8-prev(lock, node, prev, paravirt)+ADs

In yield+AF8-to+AF8-prev() it could then access the prev-+AD4-cpu.

+AD4  	node-+AD4-yield+AF8-cpu +AD0 -1+ADs
+AD4  	node-+AD4-locked +AD0 0+ADs
+AD4  
+AD4 +AEAAQA -483,7 +-486,14 +AEAAQA static +AF8AXw-always+AF8-inline void queued+AF8-spin+AF8-lock+AF8-mcs+AF8-queue(struct qspinlock +ACo-lock, b
+AD4  	 +ACo this store to locked. The corresponding barrier is the smp+AF8-rmb()
+AD4  	 +ACo acquire barrier for mcs lock, above.
+AD4  	 +ACo-/
+AD4 -	WRITE+AF8-ONCE(next-+AD4-locked, 1)+ADs
+AD4 +-	if (paravirt +ACYAJg pv+AF8-prod+AF8-head) +AHs
+AD4 +-		int next+AF8-cpu +AD0 next-+AD4-cpu+ADs
+AD4 +-		WRITE+AF8-ONCE(next-+AD4-locked, 1)+ADs
+AD4 +-		if (vcpu+AF8-is+AF8-preempted(next+AF8-cpu))
+AD4 +-			prod+AF8-cpu(next+AF8-cpu)+ADs
+AD4 +-	+AH0 else +AHs
+AD4 +-		WRITE+AF8-ONCE(next-+AD4-locked, 1)+ADs
+AD4 +-	+AH0
+AD4  
+AD4  release:
+AD4  	qnodesp-+AD4-count--+ADs /+ACo release the node +ACo-/
+AD4 +AEAAQA -622,6 +-632,22 +AEAAQA static int pv+AF8-yield+AF8-propagate+AF8-owner+AF8-get(void +ACo-data, u64 +ACo-val)
+AD4  
+AD4  DEFINE+AF8-SIMPLE+AF8-ATTRIBUTE(fops+AF8-pv+AF8-yield+AF8-propagate+AF8-owner, pv+AF8-yield+AF8-propagate+AF8-owner+AF8-get, pv+AF8-yield+AF8-propagate+AF8-owner+AF8-set, +ACIAJQ-llu+AFw-n+ACI)+ADs
+AD4  
+AD4 +-static int pv+AF8-prod+AF8-head+AF8-set(void +ACo-data, u64 val)
+AD4 +-+AHs
+AD4 +-	pv+AF8-prod+AF8-head +AD0 +ACEAIQ-val+ADs
+AD4 +-
+AD4 +-	return 0+ADs
+AD4 +-+AH0
+AD4 +-
+AD4 +-static int pv+AF8-prod+AF8-head+AF8-get(void +ACo-data, u64 +ACo-val)
+AD4 +-+AHs
+AD4 +-	+ACo-val +AD0 pv+AF8-prod+AF8-head+ADs
+AD4 +-
+AD4 +-	return 0+ADs
+AD4 +-+AH0
+AD4 +-
+AD4 +-DEFINE+AF8-SIMPLE+AF8-ATTRIBUTE(fops+AF8-pv+AF8-prod+AF8-head, pv+AF8-prod+AF8-head+AF8-get, pv+AF8-prod+AF8-head+AF8-set, +ACIAJQ-llu+AFw-n+ACI)+ADs
+AD4 +-
+AD4  static +AF8AXw-init int spinlock+AF8-debugfs+AF8-init(void)
+AD4  +AHs
+AD4  	debugfs+AF8-create+AF8-file(+ACI-qspl+AF8-steal+AF8-spins+ACI, 0600, arch+AF8-debugfs+AF8-dir, NULL, +ACY-fops+AF8-steal+AF8-spins)+ADs
+AD4 +AEAAQA -631,6 +-657,7 +AEAAQA static +AF8AXw-init int spinlock+AF8-debugfs+AF8-init(void)
+AD4  		debugfs+AF8-create+AF8-file(+ACI-qspl+AF8-pv+AF8-yield+AF8-allow+AF8-steal+ACI, 0600, arch+AF8-debugfs+AF8-dir, NULL, +ACY-fops+AF8-pv+AF8-yield+AF8-allow+AF8-steal)+ADs
+AD4  		debugfs+AF8-create+AF8-file(+ACI-qspl+AF8-pv+AF8-yield+AF8-prev+ACI, 0600, arch+AF8-debugfs+AF8-dir, NULL, +ACY-fops+AF8-pv+AF8-yield+AF8-prev)+ADs
+AD4  		debugfs+AF8-create+AF8-file(+ACI-qspl+AF8-pv+AF8-yield+AF8-propagate+AF8-owner+ACI, 0600, arch+AF8-debugfs+AF8-dir, NULL, +ACY-fops+AF8-pv+AF8-yield+AF8-propagate+AF8-owner)+ADs
+AD4 +-		debugfs+AF8-create+AF8-file(+ACI-qspl+AF8-pv+AF8-prod+AF8-head+ACI, 0600, arch+AF8-debugfs+AF8-dir, NULL, +ACY-fops+AF8-pv+AF8-prod+AF8-head)+ADs
+AD4  	+AH0
+AD4  
+AD4  	return 0+ADs

