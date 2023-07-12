Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8F9750BB2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 17:03:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=INFsrzFr;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=INFsrzFr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R1Lbc1jqTz3c22
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 01:03:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=INFsrzFr;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=INFsrzFr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=vschneid@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R1LZh6QFMz3bnt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jul 2023 01:02:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689174166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Kvr3qVn5V77zWJcaKe9AHXcXT+HniwXcgFa7KzwlkrU=;
	b=INFsrzFr97Uh1GhO/Sl2DckVZUds/DCYbd2lQQ8um48DYpZFotHFXmcSIRv8agkxkLqluL
	OrvSgCCjFr017BBf7DK+YYlXm29OV3uYCGj2DB4VAg0YD2TkswALd++yyrFf7kH4sW3Q5D
	pBBKgbNqwxQ16LAGSYISsCLaDeAFcKk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689174166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Kvr3qVn5V77zWJcaKe9AHXcXT+HniwXcgFa7KzwlkrU=;
	b=INFsrzFr97Uh1GhO/Sl2DckVZUds/DCYbd2lQQ8um48DYpZFotHFXmcSIRv8agkxkLqluL
	OrvSgCCjFr017BBf7DK+YYlXm29OV3uYCGj2DB4VAg0YD2TkswALd++yyrFf7kH4sW3Q5D
	pBBKgbNqwxQ16LAGSYISsCLaDeAFcKk=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-7-D-fXpiexMpmNc0DT9vkykw-1; Wed, 12 Jul 2023 11:02:44 -0400
X-MC-Unique: D-fXpiexMpmNc0DT9vkykw-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-767564705f5so823361585a.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jul 2023 08:02:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689174164; x=1691766164;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kvr3qVn5V77zWJcaKe9AHXcXT+HniwXcgFa7KzwlkrU=;
        b=fVjl4oocJ9n3dVrBwPvfVewGYC5R5ddF3Ied1w8lERHNGuQ0x7G7jgmnX7VXytpYkD
         HkUlLVSIH0HM4GTbPW/7k7F1zMwhCqJ/sjBK/5VZtfiygwj7ibE/Uy8kAedDtmW/akhC
         yGCsDBSRZ1ehF8gv9KO3dbVFR5DcJ1OFuSRnu1Pz9tBCoxtb79Tm6PuJ3nVwgHx9Xyk7
         w6SHpbhYbYR2ujsKNgLtfXi+KwyhfZAogsfQ19pKM8yYMsgu0z4uXihlzN4jA1DUkE7B
         HlfaR5Zt1OqCkUj5HXsqUYp7qix9SjMe9maLtobWTo3EBRsroE9YmiDZP8U5VVE+6Jtg
         VMLw==
X-Gm-Message-State: ABy/qLb4pYDIf/UnMohv5z/xBAFNNlxN2Go1Yhn3XNRu5dYPi47GyfnO
	aI38JBn3T+7+bNsOg5iRzw0hyBPFXTdTmv/3NF2drhWVHs8oTUvR+QQIMvJtORHRkokYfOa6a+q
	c2JhydVgEPnKcCIKL291rtOoexg==
X-Received: by 2002:a0c:e545:0:b0:636:2169:4298 with SMTP id n5-20020a0ce545000000b0063621694298mr15517852qvm.1.1689174163864;
        Wed, 12 Jul 2023 08:02:43 -0700 (PDT)
X-Google-Smtp-Source: APBJJlH++qRRrnEHCZes7rTAj13UdiM5e25ZcfTV6Uk9SSKDV/YGCPR9BTbMWih8KQjwtk707jkosQ==
X-Received: by 2002:a0c:e545:0:b0:636:2169:4298 with SMTP id n5-20020a0ce545000000b0063621694298mr15517822qvm.1.1689174163605;
        Wed, 12 Jul 2023 08:02:43 -0700 (PDT)
Received: from vschneid.remote.csb ([154.57.232.159])
        by smtp.gmail.com with ESMTPSA id o6-20020a0ccb06000000b0062ff0dd0332sm2251154qvk.38.2023.07.12.08.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 08:02:43 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [RFC][PATCH] sched: Rename DIE domain
In-Reply-To: <20230712141056.GI3100107@hirez.programming.kicks-ass.net>
References: <20230712141056.GI3100107@hirez.programming.kicks-ass.net>
Date: Wed, 12 Jul 2023 16:02:38 +0100
Message-ID: <xhsmh1qhduq9d.mognet@vschneid.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: juri.lelli@redhat.com, peterz@infradead.org, dave.hansen@linux.intel.com, bsegall@google.com, hpa@zytor.com, agordeev@linux.ibm.com, linux-s390@vger.kernel.org, vincent.guittot@linaro.org, x86@kernel.org, mingo@redhat.com, mgorman@suse.de, borntraeger@linux.ibm.com, gor@linux.ibm.com, hca@linux.ibm.com, npiggin@gmail.com, bp@alien8.de, rostedt@goodmis.org, tglx@linutronix.de, dietmar.eggemann@arm.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, svens@linux.ibm.com, bristot@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/07/23 16:10, Peter Zijlstra wrote:
> Hi
>
> Thomas just tripped over the x86 topology setup creating a 'DIE' domain
> for the package mask :-)
>
> Since these names are SCHED_DEBUG only, rename them.
> I don't think anybody *should* be relying on this, but who knows.
>

FWIW I don't care much about the actual name.

There are some stray references to DIE in comments - see below. Bit funny
to see:
- *  - Package (DIE)
+ *  - Package (PKG)

With that:
Acked-by: Valentin Schneider <vschneid@redhat.com>

---
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index a80a73909dc2a..190a647534984 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -9439,7 +9439,7 @@ static bool sched_use_asym_prio(struct sched_domain *sd, int cpu)
  * can only do it if @group is an SMT group and has exactly on busy CPU. Larger
  * imbalances in the number of CPUS are dealt with in find_busiest_group().
  *
- * If we are balancing load within an SMT core, or at DIE domain level, always
+ * If we are balancing load within an SMT core, or at PKG domain level, always
  * proceed.
  *
  * Return: true if @env::dst_cpu can do with asym_packing load balance. False
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index e9d9cf776b7ab..2cdcfec1d1c89 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -1118,7 +1118,7 @@ build_overlap_sched_groups(struct sched_domain *sd, int cpu)
  *
  *  - Simultaneous multithreading (SMT)
  *  - Multi-Core Cache (MC)
- *  - Package (DIE)
+ *  - Package (PKG)
  *
  * Where the last one more or less denotes everything up to a NUMA node.
  *
@@ -1140,13 +1140,13 @@ build_overlap_sched_groups(struct sched_domain *sd, int cpu)
  *
  * CPU   0   1   2   3   4   5   6   7
  *
- * DIE  [                             ]
+ * PKG  [                             ]
  * MC   [             ] [             ]
  * SMT  [     ] [     ] [     ] [     ]
  *
  *  - or -
  *
- * DIE  0-7 0-7 0-7 0-7 0-7 0-7 0-7 0-7
+ * PKG  0-7 0-7 0-7 0-7 0-7 0-7 0-7 0-7
  * MC	0-3 0-3 0-3 0-3 4-7 4-7 4-7 4-7
  * SMT  0-1 0-1 2-3 2-3 4-5 4-5 6-7 6-7
  *

