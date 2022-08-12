Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17558590B4D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Aug 2022 06:44:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M3rgR6QC3z3bkC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Aug 2022 14:44:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=aLKyZ2l3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=jniethe5@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=aLKyZ2l3;
	dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M3rfl5yjYz2xTj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Aug 2022 14:43:57 +1000 (AEST)
Received: by mail-pj1-x102a.google.com with SMTP id t22so19509142pjy.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Aug 2022 21:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc;
        bh=DKv0nO5kXgl6bopd6R3KrwelTNByGcD8Y4nN76vn7VI=;
        b=aLKyZ2l3E2L/LZrjru13AZbkUTlYIQZ3905Am0ISCoyMGl/Kf9wcFuBT1hDx/ZQNoE
         O/5ypAsMXrcVQlPlU0Heez/cEcy9I70uxSvFInyRHq/MqFsskG3Gn+s8sbc3TJkDfWdj
         E64X7Jo3mFq2rJ1ShfBRgW1f0FdT6ENjAVrg7hEIwbLIoiSYQdPDHjIJu7UA0AI0VsDq
         9Tu06WtwPE2pgw4uNgpAGgrJOpCV3bybbnmQog31BouvoLlqixBX5zWFMXz9aH/Se0cp
         DcUmwOCoLhtspbQb8bCnkPow253kckvlSJctJgowxqqNt0QRAJzIIGjvloQRE21ZeU92
         B7cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc;
        bh=DKv0nO5kXgl6bopd6R3KrwelTNByGcD8Y4nN76vn7VI=;
        b=8HNF67c7yUgqj2r2ejGXYJQFQbKDfWAKs/dLNCGRAn0mq4TMe2Lw961XjhkD1NPBEw
         jGj+nlyuJjGYKIuc53Hn80qmpwJNrQkLTfm6LsR4dKAKbq8a8BtiDE2/YZj86dgN+vlc
         7UKWI1sXTaeaehKd2tE3wWwK5YORV77zTx5GiK7KerhA59YvFY3OabJPjTWPpB/h1ayA
         eejZ3Lt3/geRiuG0fgRboox7gVWQVQ3ygMmN6owZcQfd233OpPFXiycbgFOv1wc+9N4S
         rPDAUAzeZqtx2rE4M6nKE8MjWTz/yIhWfOsMWlMGUTwg1ucsYg/u+ErNW2uOgKlRblZR
         mpHA==
X-Gm-Message-State: ACgBeo0mP7p0YBLwwl2i2zbAWztim8D4UKta9PjQb40bYDfkWJ7XgINX
	/473usGMV4/3wv0CZq9+qB47u2ed3Ms=
X-Google-Smtp-Source: AA6agR6nJ5mHWVeT0t1WF8rzqeqgC4c+W7mBIf5fr8VzBd3FgCAeo0FJBrjTpC0AqY+EnVzCmOoOIQ==
X-Received: by 2002:a17:90a:fe92:b0:1f5:1b0b:1cd7 with SMTP id co18-20020a17090afe9200b001f51b0b1cd7mr2248892pjb.197.1660279434723;
        Thu, 11 Aug 2022 21:43:54 -0700 (PDT)
Received: from tee480.ozlabs.ibm.com (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
        by smtp.googlemail.com with ESMTPSA id q4-20020a17090311c400b0016bffc59718sm583441plh.58.2022.08.11.21.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 21:43:54 -0700 (PDT)
Message-ID: <58312f7639453912e212b201b5c53510dfee3448.camel@gmail.com>
Subject: Re: [PATCH 15/17] powerpc/qspinlock: reduce remote node steal spins
From: Jordan Niethe <jniethe5@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Date: Fri, 12 Aug 2022 14:43:50 +1000
In-Reply-To: <20220728063120.2867508-17-npiggin@gmail.com>
References: <20220728063120.2867508-1-npiggin@gmail.com>
	 <20220728063120.2867508-17-npiggin@gmail.com>
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
+AD4 Allow for a reduction in the number of times a CPU from a different
+AD4 node than the owner can attempt to steal the lock before queueing.
+AD4 This could bias the transfer behaviour of the lock across the
+AD4 machine and reduce NUMA crossings.
+AD4 ---
+AD4  arch/powerpc/lib/qspinlock.c +AHw 34 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+----
+AD4  1 file changed, 31 insertions(+-), 3 deletions(-)
+AD4 
+AD4 diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
+AD4 index d4594c701f7d..24f68bd71e2b 100644
+AD4 --- a/arch/powerpc/lib/qspinlock.c
+AD4 +-+-+- b/arch/powerpc/lib/qspinlock.c
+AD4 +AEAAQA -4,6 +-4,7 +AEAAQA
+AD4  +ACM-include +ADw-linux/export.h+AD4
+AD4  +ACM-include +ADw-linux/percpu.h+AD4
+AD4  +ACM-include +ADw-linux/smp.h+AD4
+AD4 +-+ACM-include +ADw-linux/topology.h+AD4
+AD4  +ACM-include +ADw-asm/qspinlock.h+AD4
+AD4  +ACM-include +ADw-asm/paravirt.h+AD4
+AD4  
+AD4 +AEAAQA -24,6 +-25,7 +AEAAQA struct qnodes +AHs
+AD4  
+AD4  /+ACo Tuning parameters +ACo-/
+AD4  static int STEAL+AF8-SPINS +AF8AXw-read+AF8-mostly +AD0 (1+ADwAPA-5)+ADs
+AD4 +-static int REMOTE+AF8-STEAL+AF8-SPINS +AF8AXw-read+AF8-mostly +AD0 (1+ADwAPA-2)+ADs
+AD4  +ACM-if +AF8-Q+AF8-SPIN+AF8-TRY+AF8-LOCK+AF8-STEAL +AD0APQ 1
+AD4  static const bool MAYBE+AF8-STEALERS +AD0 true+ADs
+AD4  +ACM-else
+AD4 +AEAAQA -39,9 +-41,13 +AEAAQA static bool pv+AF8-prod+AF8-head +AF8AXw-read+AF8-mostly +AD0 false+ADs
+AD4  
+AD4  static DEFINE+AF8-PER+AF8-CPU+AF8-ALIGNED(struct qnodes, qnodes)+ADs
+AD4  
+AD4 -static +AF8AXw-always+AF8-inline int get+AF8-steal+AF8-spins(bool paravirt)
+AD4 +-static +AF8AXw-always+AF8-inline int get+AF8-steal+AF8-spins(bool paravirt, bool remote)
+AD4  +AHs
+AD4 -	return STEAL+AF8-SPINS+ADs
+AD4 +-	if (remote) +AHs
+AD4 +-		return REMOTE+AF8-STEAL+AF8-SPINS+ADs
+AD4 +-	+AH0 else +AHs
+AD4 +-		return STEAL+AF8-SPINS+ADs
+AD4 +-	+AH0
+AD4  +AH0
+AD4  
+AD4  static +AF8AXw-always+AF8-inline int get+AF8-head+AF8-spins(bool paravirt)
+AD4 +AEAAQA -380,8 +-386,13 +AEAAQA static +AF8AXw-always+AF8-inline bool try+AF8-to+AF8-steal+AF8-lock(struct qspinlock +ACo-lock, bool parav
+AD4  
+AD4  		iters+-+-+ADs
+AD4  
+AD4 -		if (iters +AD4APQ get+AF8-steal+AF8-spins(paravirt))
+AD4 +-		if (iters +AD4APQ get+AF8-steal+AF8-spins(paravirt, false))
+AD4  			break+ADs
+AD4 +-		if (iters +AD4APQ get+AF8-steal+AF8-spins(paravirt, true)) +AHs

There's no indication of what true and false mean here which is hard to read.
To me it feels like two separate functions would be more clear.


+AD4 +-			int cpu +AD0 get+AF8-owner+AF8-cpu(val)+ADs
+AD4 +-			if (numa+AF8-node+AF8-id() +ACEAPQ cpu+AF8-to+AF8-node(cpu))

What about using node+AF8-distance() instead?


+AD4 +-				break+ADs
+AD4 +-		+AH0
+AD4  	+AH0
+AD4  	spin+AF8-end()+ADs
+AD4  
+AD4 +AEAAQA -588,6 +-599,22 +AEAAQA static int steal+AF8-spins+AF8-get(void +ACo-data, u64 +ACo-val)
+AD4  
+AD4  DEFINE+AF8-SIMPLE+AF8-ATTRIBUTE(fops+AF8-steal+AF8-spins, steal+AF8-spins+AF8-get, steal+AF8-spins+AF8-set, +ACIAJQ-llu+AFw-n+ACI)+ADs
+AD4  
+AD4 +-static int remote+AF8-steal+AF8-spins+AF8-set(void +ACo-data, u64 val)
+AD4 +-+AHs
+AD4 +-	REMOTE+AF8-STEAL+AF8-SPINS +AD0 val+ADs

REMOTE+AF8-STEAL+AF8-SPINS is int not u64.

+AD4 +-
+AD4 +-	return 0+ADs
+AD4 +-+AH0
+AD4 +-
+AD4 +-static int remote+AF8-steal+AF8-spins+AF8-get(void +ACo-data, u64 +ACo-val)
+AD4 +-+AHs
+AD4 +-	+ACo-val +AD0 REMOTE+AF8-STEAL+AF8-SPINS+ADs
+AD4 +-
+AD4 +-	return 0+ADs
+AD4 +-+AH0
+AD4 +-
+AD4 +-DEFINE+AF8-SIMPLE+AF8-ATTRIBUTE(fops+AF8-remote+AF8-steal+AF8-spins, remote+AF8-steal+AF8-spins+AF8-get, remote+AF8-steal+AF8-spins+AF8-set, +ACIAJQ-llu+AFw-n+ACI)+ADs
+AD4 +-
+AD4  static int head+AF8-spins+AF8-set(void +ACo-data, u64 val)
+AD4  +AHs
+AD4  	HEAD+AF8-SPINS +AD0 val+ADs
+AD4 +AEAAQA -687,6 +-714,7 +AEAAQA DEFINE+AF8-SIMPLE+AF8-ATTRIBUTE(fops+AF8-pv+AF8-prod+AF8-head, pv+AF8-prod+AF8-head+AF8-get, pv+AF8-prod+AF8-head+AF8-set, +ACI
+AD4  static +AF8AXw-init int spinlock+AF8-debugfs+AF8-init(void)
+AD4  +AHs
+AD4  	debugfs+AF8-create+AF8-file(+ACI-qspl+AF8-steal+AF8-spins+ACI, 0600, arch+AF8-debugfs+AF8-dir, NULL, +ACY-fops+AF8-steal+AF8-spins)+ADs
+AD4 +-	debugfs+AF8-create+AF8-file(+ACI-qspl+AF8-remote+AF8-steal+AF8-spins+ACI, 0600, arch+AF8-debugfs+AF8-dir, NULL, +ACY-fops+AF8-remote+AF8-steal+AF8-spins)+ADs
+AD4  	debugfs+AF8-create+AF8-file(+ACI-qspl+AF8-head+AF8-spins+ACI, 0600, arch+AF8-debugfs+AF8-dir, NULL, +ACY-fops+AF8-head+AF8-spins)+ADs
+AD4  	if (is+AF8-shared+AF8-processor()) +AHs
+AD4  		debugfs+AF8-create+AF8-file(+ACI-qspl+AF8-pv+AF8-yield+AF8-owner+ACI, 0600, arch+AF8-debugfs+AF8-dir, NULL, +ACY-fops+AF8-pv+AF8-yield+AF8-owner)+ADs

