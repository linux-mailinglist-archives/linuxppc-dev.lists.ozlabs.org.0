Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 237235A56F9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 00:17:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGlD76cZ1z3gRW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 08:17:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=A8iXlM7k;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::449; helo=mail-pf1-x449.google.com; envelope-from=3_y4nywykdlaikhudrweewbu.secbydknffs-tulbyiji.epbqri.ehw@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=A8iXlM7k;
	dkim-atps=neutral
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGk5W5Ssvz3bms
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Aug 2022 07:26:23 +1000 (AEST)
Received: by mail-pf1-x449.google.com with SMTP id 125-20020a621483000000b0053814ac4b8bso1876344pfu.16
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 14:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc;
        bh=WpdYqLbUAWRRR7NpWeIwifObGgR3/WEcKlSas1duxWs=;
        b=A8iXlM7kWh/+WLxmr7Wxu633pJ33WbnreWCJkhO2mN51OTMuCRIiZbXSJTMwU7nnLp
         8HrWKhSa16qOE9IHNHTIDFaumIghV/X3vZxzBwxJyopuUJchdMXN0oUY2EJvc97qw23/
         002SGSF6e/GfvGXcSJZJ9OH52bwQ+17bBv1qwUEkh+/hxiA3XGJZS3QMw2bsNQo6K8n5
         ASVJIXUmfSCyDSBXlWu7+9C2NTyQxO6WdEpOrWiiN0G0XOZ0xYY++9szDB3PW4z/iVNr
         kXUF0efo+Jl4A1NDPbFsv2i2F8cuEbcHbyZjyx1JQrC6JX3bDooGkyCEfiAtjL3LX2kX
         L4Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=WpdYqLbUAWRRR7NpWeIwifObGgR3/WEcKlSas1duxWs=;
        b=GO4lU7xTe9ia72S4nz4/ZjoGKO0qDk5bCYEgDL0Zq7IKDr9+Qd0+wzacykvtR5TSpY
         bprm/bft70qdzAKkZv3xUg8vrWSE0HqOft6dUv6GyaOPiB9Zy/3VqycURfp1LFnF88Bu
         rrxnnw7rPtwKiW52quRu9JSSpGNPmM1PBSjY0tlSfhvmWIibiraOL8L/0D7vKLfycW7k
         Y8Oa5gchmINfgGKzTj4zUPF5Q8W3DzkEmjX5BHmqYeRI3IgKRjfBo/oExxHFrFakA2l7
         njQ9L2CYfG7aBjH0RcE5jCGxW9197WS8RqQs54qiLW099FnV7qJeykkBNcyQDHwymLho
         Fctw==
X-Gm-Message-State: ACgBeo1zvAhlAaDAwnhaVlHVeiGl2NtxJ15jpsE7bys3ZdDBdPGkWSZh
	IJcCPAbbdmLSEYE4fMG59TnuOCS8Q/c=
X-Google-Smtp-Source: AA6agR7BIF7zDBFRMtaQFIX+dYsK3ioA4U218I6Y8n5CHeAbnavsVuqAEK5kMo+KsvAOcZae2RDMSpS8XIE=
X-Received: from surenb-spec.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e30])
 (user=surenb job=sendgmr) by 2002:a17:903:2d1:b0:171:3773:b95 with SMTP id
 s17-20020a17090302d100b0017137730b95mr17499271plk.173.1661808383315; Mon, 29
 Aug 2022 14:26:23 -0700 (PDT)
Date: Mon, 29 Aug 2022 21:25:30 +0000
In-Reply-To: <20220829212531.3184856-1-surenb@google.com>
Mime-Version: 1.0
References: <20220829212531.3184856-1-surenb@google.com>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Message-ID: <20220829212531.3184856-28-surenb@google.com>
Subject: [RFC PATCH 27/28] powerpc/mm: define ARCH_SUPPORTS_PER_VMA_LOCK
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 30 Aug 2022 08:01:45 +1000
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, jglisse@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, paulmck@kernel.org, riel@surriel.com, liam.howlett@oracle.com, luto@kernel.org, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, mgorman@techsingularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Laurent Dufour <ldufour@linux.ibm.com>

Set ARCH_SUPPORTS_PER_VMA_LOCK so that the per-VMA lock support can be
compiled on powernv and pseries.
It may be use on the other platforms but I can't test that seriously.

Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
---
 arch/powerpc/platforms/powernv/Kconfig | 1 +
 arch/powerpc/platforms/pseries/Kconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/powerpc/platforms/powernv/Kconfig b/arch/powerpc/platforms/powernv/Kconfig
index ae248a161b43..70a46acc70d6 100644
--- a/arch/powerpc/platforms/powernv/Kconfig
+++ b/arch/powerpc/platforms/powernv/Kconfig
@@ -16,6 +16,7 @@ config PPC_POWERNV
 	select PPC_DOORBELL
 	select MMU_NOTIFIER
 	select FORCE_SMP
+	select ARCH_SUPPORTS_PER_VMA_LOCK
 	default y
 
 config OPAL_PRD
diff --git a/arch/powerpc/platforms/pseries/Kconfig b/arch/powerpc/platforms/pseries/Kconfig
index fb6499977f99..7d13a2de3475 100644
--- a/arch/powerpc/platforms/pseries/Kconfig
+++ b/arch/powerpc/platforms/pseries/Kconfig
@@ -21,6 +21,7 @@ config PPC_PSERIES
 	select HOTPLUG_CPU
 	select FORCE_SMP
 	select SWIOTLB
+	select ARCH_SUPPORTS_PER_VMA_LOCK
 	default y
 
 config PARAVIRT_SPINLOCKS
-- 
2.37.2.672.g94769d06f0-goog

