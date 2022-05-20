Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8B852E128
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 02:25:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L46vb4lFLz3blw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 10:25:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JcWqXFaY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::530;
 helo=mail-pg1-x530.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=JcWqXFaY; dkim-atps=neutral
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L46tx5rBGz30B3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May 2022 10:25:12 +1000 (AEST)
Received: by mail-pg1-x530.google.com with SMTP id a38so3535468pgl.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 May 2022 17:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=yv36DBCzX/BQaDUaqPNqLF92qej9eDU0JwdcEZTabGk=;
 b=JcWqXFaY/sALkfW1Dx8cAjkIqdWGEUHyQUznTSVbbLbl1mbRMmFY8SuVJfLHUo2De5
 +A9/rvaAd0QTZ0rG2FjtXgzuTMAiK1Yx8cOEW2gdKRx1En7X3z0ifUDGIw9CM/KdQgfI
 adPvR8voG2EFvXZ7e7d8JYB/9LxDXn2ge1AuGmGy16vZFlsIy0r6qXdabjRyjlG8meg2
 mgpbuc/qynMsQSeQE01YRArkFzbCm+b3ik+CMLc/TC4WwOIHVYaDTvo7Fk9ZJ0AJ2E0o
 ot42Ht/JwKLFz5sFS4t0fC4hI0SEf2xZLLZLNrAstbJv5aq665+t25FyqlHwzhrtoj4H
 9q2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=yv36DBCzX/BQaDUaqPNqLF92qej9eDU0JwdcEZTabGk=;
 b=J9og1vPmH2Xrhir8BxHZF/KRNd/1aI6TWueG+m4KnLhKsdYB7mKuFWCltTQ+U9iqQP
 o4ep3meMPLpPY+BTtuAuSSrnlXmNwbyZtlMuhmxv6FKFC04AZwGXZGxpggvVb6t4GgcM
 EBwWcsW4bzra/9vsexbDaQmpWBD5nfgS7iJUsZw1k0U4pSXtW4FiLZU/MHTfc/j9IvvD
 jSKZ1Uca6KhdhnZ02AqTxdFevrtpN0omgtb+8AJqrDNprgrMrRG8f7ub1pBNkUKfg+Oj
 l1dLz89ENzj8vYJ/blq5Vb9xnltoYuhGfsR9G8t3zeXvuErdMrplTgZx/j+7awMy8c9k
 WpgA==
X-Gm-Message-State: AOAM5320UxHNbGi6un6P4JO9xTyk3tPfQxHUd+QHcGJ5yVNB65UULbFC
 /TkF/2B70VVqvYzSUNwlR+Q=
X-Google-Smtp-Source: ABdhPJztXAbmH6BKWG9SQczKiPGMvBDhoc7zmfBNN5RglBamtXskVMyL+yYcdpdohA8XOXnd0Wwhmw==
X-Received: by 2002:a05:6a00:1a44:b0:510:a043:3b09 with SMTP id
 h4-20020a056a001a4400b00510a0433b09mr7110029pfv.62.1653006310004; 
 Thu, 19 May 2022 17:25:10 -0700 (PDT)
Received: from localhost ([118.208.131.68]) by smtp.gmail.com with ESMTPSA id
 b24-20020a056a0002d800b0050dc76281besm263161pft.152.2022.05.19.17.25.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 17:25:09 -0700 (PDT)
Date: Fri, 20 May 2022 10:25:04 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v6 20/29] init/main: Delay initialization of the lockup
 detector after smp_init()
To: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
References: <20220506000008.30892-1-ricardo.neri-calderon@linux.intel.com>
 <20220506000008.30892-21-ricardo.neri-calderon@linux.intel.com>
 <1652178524.7j2o02lrl8.astroid@bobo.none>
 <20220513231640.GA9074@ranerica-svr.sc.intel.com>
In-Reply-To: <20220513231640.GA9074@ranerica-svr.sc.intel.com>
MIME-Version: 1.0
Message-Id: <1653005608.3e5k2jq3of.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
 Andi Kleen <ak@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org, linux-kernel@vger.kernel.org,
 Stephane Eranian <eranian@google.com>, Ricardo Neri <ricardo.neri@intel.com>,
 iommu@lists.linux-foundation.org, Tony Luck <tony.luck@intel.com>,
 Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Woodhouse <dwmw2@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Ricardo Neri's message of May 14, 2022 9:16 am:
> On Tue, May 10, 2022 at 08:38:22PM +1000, Nicholas Piggin wrote:
>> Excerpts from Ricardo Neri's message of May 6, 2022 9:59 am:
>> > Certain implementations of the hardlockup detector require support for
>> > Inter-Processor Interrupt shorthands. On x86, support for these can on=
ly
>> > be determined after all the possible CPUs have booted once (in
>> > smp_init()). Other architectures may not need such check.
>> >=20
>> > lockup_detector_init() only performs the initializations of data
>> > structures of the lockup detector. Hence, there are no dependencies on
>> > smp_init().
>>=20
>=20
> Thank you for your feedback Nicholas!
>=20
>> I think this is the only real thing which affects other watchdog types?
>=20
> Also patches 18 and 19 that decouple the NMI watchdog functionality from
> perf.
>=20
>>=20
>> Not sure if it's a big problem, the secondary CPUs coming up won't
>> have their watchdog active until quite late, and the primary could
>> implement its own timeout in __cpu_up for secondary coming up, and
>> IPI it to get traces if necessary which is probably more robust.
>=20
> Indeed that could work. Another alternative I have been pondering is to b=
oot
> the system with the perf-based NMI watchdog enabled. Once all CPUs are up
> and running, switch to the HPET-based NMI watchdog and free the PMU count=
ers.

Just to cover smp_init()? Unless you could move the watchdog=20
significantly earlier, I'd say it's probably not worth bothering
with.

Yes the boot CPU is doing *some* work that could lock up, but most=20
complexity is in the secondaries coming up and they won't have their own=20
watchdog coverage for a good chunk of that anyway.

If anything I would just add some timeout warning or IPI or something in
those wait loops in x86's __cpu_up code if you are worried about=20
catching issues here. Actually the watchdog probably wouldn't catch any
of those anyway because they either run with interrupts enabled or
touch_nmi_watchdog()! So yeah that'd be pretty pointless.

Thanks,
Nick
