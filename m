Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5851C1EAD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 22:41:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49DPKp1yj1zDrPx
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 May 2020 06:41:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::32d;
 helo=mail-ot1-x32d.google.com; envelope-from=hughd@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=Jb/sTQXq; dkim-atps=neutral
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49DPHF38SHzDqCw
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 May 2020 06:38:57 +1000 (AEST)
Received: by mail-ot1-x32d.google.com with SMTP id z17so3571700oto.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 01 May 2020 13:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:user-agent:mime-version;
 bh=5K9hAwKaOi8+HVaEfEY0paG4gDhmMlw91928+vI5aAk=;
 b=Jb/sTQXqdNBUDKswij7NnPWuzOgUcNNTdP0OdyGz5qV9cbnu885t4t1bsELBwqZH9k
 K06SEAkursV5O1LapRzMBIkLM9ICyTUPIbkJBtBVfoYd8S8moHsWvzINWkV6EvyZ6JPN
 2DdLSYE0xD798X9mmTRrGG9AJDJWPFay984nMSWi5T+mAFkwXb14LtTHcoY4phsusob0
 5irrcS48VA+2GXW1Y1jhWb1ubWtF/6KW9khDCviqRduOUTT+OWck1PiacexTwR7B4kt1
 2b/O74fLkaHaZWgRt38q/N0NXRramS4eLVXCU0FHM2RWg+ov0uX8zsOn6E/6Y6fmWbWM
 /siA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:user-agent
 :mime-version;
 bh=5K9hAwKaOi8+HVaEfEY0paG4gDhmMlw91928+vI5aAk=;
 b=fyiuOEXqcNCq42ubqHPvj9DgYIzlqnUQT0ZLCvfb0SXd2b9WkUKL5T04QeQz7vhyoa
 a7eMmtr0P7T43CChf3xM/u4iYqr48QkMavtHT/z4asCcXJfQQAGWnrq8bhXBScUCiAiV
 yietBtYTeA9ljwtIFnXqnyIf0sD4ff3W+0Yy6MiYkmWvT4nBT8J0YP1xLSj27rhpy7xt
 7TxTBkmpw12SWD5XEQwubV1pzWIZ5vo1nFCXUaPiTwiSqw+aKB3qH2FX2FHiO9j1COGu
 WbxyLXf6jQGj7FDgzn4/izn3NGFAm0aERIfDLcXl4d6VPMYdrgoYnfBOOcOlwZMmuY4q
 orIg==
X-Gm-Message-State: AGi0PuYJdz0kNYiufrhGLHqwzl2Yj/uEoDkimbZ4mTMJ1XYYe3AP5lQ8
 lvDFWbHohbg1PyVNsQWBj1Sj4Q==
X-Google-Smtp-Source: APiQypJUYdVBVO9DhLJNMreWyg0pUEn+rAV1kNACPtdpwOL4bQaU80t94pVv7q/aXiWQ+4zleR55Cg==
X-Received: by 2002:a9d:3f22:: with SMTP id m31mr4827216otc.351.1588365534306; 
 Fri, 01 May 2020 13:38:54 -0700 (PDT)
Received: from eggly.attlocal.net
 (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
 by smtp.gmail.com with ESMTPSA id u1sm223101oif.54.2020.05.01.13.38.53
 (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
 Fri, 01 May 2020 13:38:53 -0700 (PDT)
Date: Fri, 1 May 2020 13:38:28 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@eggly.anvils
To: Nick Piggin <npiggin@gmail.com>
Subject: 5.7-rc interrupt_return Unrecoverable exception 380
Message-ID: <alpine.LSU.2.11.2005011253250.3734@eggly.anvils>
User-Agent: Alpine 2.11 (LSU 23 2013-08-11)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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
Cc: Michal Suchanek <msuchanek@suse.de>, Hugh Dickins <hughd@google.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Nick,

I've been getting an "Unrecoverable exception 380" after a few hours
of load on the G5 (yes, that G5!) with 5.7-rc: when interrupt_return
checks lazy_irq_pending, it crashes at check_preemption_disabled+0x24
with CONFIG_DEBUG_PREEMPT=y.

check_preemption_disabled():
lib/smp_processor_id.c:13
   0:	7c 08 02 a6 	mflr    r0
   4:	fb e1 ff f8 	std     r31,-8(r1)
   8:	fb 61 ff d8 	std     r27,-40(r1)
   c:	fb 81 ff e0 	std     r28,-32(r1)
  10:	fb a1 ff e8 	std     r29,-24(r1)
  14:	fb c1 ff f0 	std     r30,-16(r1)
get_current():
arch/powerpc/include/asm/current.h:20
  18:	eb ed 01 88 	ld      r31,392(r13)
check_preemption_disabled():
lib/smp_processor_id.c:13
  1c:	f8 01 00 10 	std     r0,16(r1)
  20:	f8 21 ff 61 	stdu    r1,-160(r1)
__read_once_size():
include/linux/compiler.h:199
  24:	81 3f 00 00 	lwz     r9,0(r31)
check_preemption_disabled():
lib/smp_processor_id.c:14
  28:	a3 cd 00 02 	lhz     r30,2(r13)

I don't read ppc assembly, and have not jotted down the registers,
but hope you can make sense of it. I get around it with the patch
below (just avoiding the debug), but have no idea whether it's a
necessary fix or a hacky workaround.

Hugh

--- 5.7-rc3/arch/powerpc/include/asm/hw_irq.h	2020-04-12 16:24:29.802769727 -0700
+++ linux/arch/powerpc/include/asm/hw_irq.h	2020-04-27 11:31:10.000000000 -0700
@@ -252,7 +252,7 @@ static inline bool arch_irqs_disabled(vo
 
 static inline bool lazy_irq_pending(void)
 {
-	return !!(get_paca()->irq_happened & ~PACA_IRQ_HARD_DIS);
+	return !!(local_paca->irq_happened & ~PACA_IRQ_HARD_DIS);
 }
 
 /*
