Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5D76895FA
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 11:26:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7WzP2S9Gz3f8T
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 21:26:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=GuYi/0Ct;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=GuYi/0Ct;
	dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7WyW3sH6z3f5C
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 21:25:55 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id pj3so4603425pjb.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Feb 2023 02:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RJHkDDeQx0HejRi96FH48T3/m9KusdrvPAz5RLkFiYg=;
        b=GuYi/0CtoNZTHZdXaYL/KsMcKdyHJvgDMpjwjNhfQcbpBFbzAt5Xqlin1GouIgftLZ
         wEXcLRQZk/H88gOTLOogLatyldZsUQfUsnIC5htADmPrsErCAjJgBDv0cAi5EZ61tBrR
         dE3CS/7hb9NmndH6cdDg5enT5vspCHVAwTLolJeNvELrOxicE9/eBJXEqxR43yMolkwO
         yHZz2eI5qtbhD5SjVEa4cf2zpqU8O0OvQWsBM7Kw8eTi6lurOdGydFpwPiAg7gW70Kgl
         s2mV/4BLSmXfsNWO+PUCIZobePmwWj/7bGrCuI+YfA9cu7ddSRO0YxTgCBTzaIRqlj9s
         0t2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RJHkDDeQx0HejRi96FH48T3/m9KusdrvPAz5RLkFiYg=;
        b=FJcNPfvBNEzmnTu66soPBW63lCNu1L3lhJwGlONpMZwqWIK3s/x5qcCCazFVk5MYAG
         x8T+cSvGORBFb/kvkTsrPib4Qv8gPo6KX3E2RbvOjVUPlZnxLCOkHqLoEfpFKeFCAcYT
         gkzDY42hmgh2z83lvw+qQMGxLg0tYUy/C5GQM42KfCvnzarolAGjUTvAtJOlQqMOAX7T
         e1ReCqhW06eY5LjG3z965mK7OFEDoJyy1WLMzzQ0JBtgG7u4tUvfVGOvzSaK09WwtP4A
         46CfbWHJWjJhgQP2PrMKI+FcGLGg76YjdYMR4SFAvqxziMFSWzpdaN0872EMo4gtvL6s
         /ZTA==
X-Gm-Message-State: AO0yUKXAOJ3EoTznwUeFZy3GSuKYxHDcbqzkcmi2TJu853XqhXkumod2
	BcCBtNuXrLEXXcaUPD3t7yN8nhjmO3o=
X-Google-Smtp-Source: AK7set9dH1qq18dTuJhF4k5FtMMxUnAdr2+bhY5dJX9o/q0GKsKJ+VBFzOzpM11WrGCAkpjI1hnxkA==
X-Received: by 2002:a17:90b:3e83:b0:230:3256:2ef3 with SMTP id rj3-20020a17090b3e8300b0023032562ef3mr10105935pjb.43.1675419952341;
        Fri, 03 Feb 2023 02:25:52 -0800 (PST)
Received: from localhost (193-116-117-77.tpgi.com.au. [193.116.117.77])
        by smtp.gmail.com with ESMTPSA id x36-20020a17090a38a700b0022bb9f05753sm4637558pjb.48.2023.02.03.02.25.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 02:25:51 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Feb 2023 20:25:48 +1000
Message-Id: <CQ8USYNS32BA.37RU0GOQ2LO7M@bobo>
Subject: Re: [merge] WARN arch/powerpc/kernel/irq_64.c:278
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Sachin Sant" <sachinp@linux.ibm.com>, "linuxppc-dev"
 <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.13.0
References: <7C586644-B8B4-4B41-86E3-80A60D5FE1C7@linux.ibm.com>
In-Reply-To: <7C586644-B8B4-4B41-86E3-80A60D5FE1C7@linux.ibm.com>
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

On Fri Feb 3, 2023 at 4:26 PM AEST, Sachin Sant wrote:
> I am observing an intermittent crash while running powerpc/security
> selftests on a Power10 LPAR booted with powerpc/merge branch code.
>
> ------------[ cut here ]------------
> WARNING: CPU: 1 PID: 5644 at arch/powerpc/kernel/irq_64.c:278 arch_local_=
irq_restore+0x254/0x260

Okay, I guess the static branch test changes from true to false both
times it is tested and so it doesn't recover properly. It's a real bug.
I don't know why I didn't change the static branch under stop machine,
maybe it gets into some recursive issue, that would be ideal if we could
though. But this might be a safer minimal fix?

Thanks,
Nick
--

diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrup=
t.c
index fc6631a80527..0ec1581619db 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -50,16 +50,18 @@ static inline bool exit_must_hard_disable(void)
  */
 static notrace __always_inline bool prep_irq_for_enabled_exit(bool restart=
able)
 {
+	bool must_hard_disable =3D (exit_must_hard_disable() || !restartable);
+
 	/* This must be done with RI=3D1 because tracing may touch vmaps */
 	trace_hardirqs_on();
=20
-	if (exit_must_hard_disable() || !restartable)
+	if (must_hard_disable)
 		__hard_EE_RI_disable();
=20
 #ifdef CONFIG_PPC64
 	/* This pattern matches prep_irq_for_idle */
 	if (unlikely(lazy_irq_pending_nocheck())) {
-		if (exit_must_hard_disable() || !restartable) {
+		if (must_hard_disable) {
 			local_paca->irq_happened |=3D PACA_IRQ_HARD_DIS;
 			__hard_RI_enable();
 		}
