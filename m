Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C74081411B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Dec 2023 06:02:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uFmXIMrX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Srxsq1dlWz3dFH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Dec 2023 16:02:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uFmXIMrX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=aneesh.kumar@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Srxry4lwMz3cXy
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Dec 2023 16:01:38 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 342C6CE25B7;
	Fri, 15 Dec 2023 05:01:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D7AAC433C8;
	Fri, 15 Dec 2023 05:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702616495;
	bh=8RH/h1jakl0y7fPQ+kWUq85u6w9KslnUix/YJd0gqak=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=uFmXIMrXVkH0fn/PsKKyhCuvCCKR72ILItsqoCmKdvQicjHJTk+itW07h9q+uxgTx
	 4S5Xy9zdMEROVAJXk2UlqHVCvs6I5971BZncNlgXD1hKoPgutrEHHlds3gysgQDnrX
	 Ck3Z3aTsBWHh+UutJIO8B+GRu5Mn3FprvP/T20ycwjRfUjtOtmDguHYNFZIqK+7G9c
	 61CedmmpQ9Do9oyZ2KJa2OG2XfyFt0vydvqaKpbMQs0oCFPDRXJ+CkS1Cl0T57D0/N
	 R1XkIMdk+2ODC2zza+9UphvjUoBwYb1TzVDIQ2ksM2kYQDZkEfUZ8Nu/pPblV1piWq
	 7RLuZxlrNt0dg==
X-Mailer: emacs 29.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v5 1/5] powerpc/smp: Enable Asym packing for cores on
 shared processor
In-Reply-To: <20231214180720.310852-2-srikar@linux.vnet.ibm.com>
References: <20231214180720.310852-1-srikar@linux.vnet.ibm.com>
 <20231214180720.310852-2-srikar@linux.vnet.ibm.com>
Date: Fri, 15 Dec 2023 10:31:26 +0530
Message-ID: <87zfyct5y1.fsf@kernel.org>
MIME-Version: 1.0
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
Cc: Mark Rutland <mark.rutland@arm.com>, Valentin Schneider <vschneid@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Srikar Dronamraju <srikar@linux.vnet.ibm.com>, "Paul E. McKenney" <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>, "ndesaulniers@google.com" <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Rohan McLure <rmclure@linux.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Josh Poimboeuf <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:

> If there are shared processor LPARs, underlying Hypervisor can have more
> virtual cores to handle than actual physical cores.
>
> Starting with Power 9, a big core (aka SMT8 core) has 2 nearly
> independent thread groups. On a shared processors LPARs, it helps to
> pack threads to lesser number of cores so that the overall system
> performance and utilization improves. PowerVM schedules at a big core
> level. Hence packing to fewer cores helps.
>

....

> +/*
> + * On shared processor LPARs scheduled on a big core (which has two or more
> + * independent thread groups per core), prefer lower numbered CPUs, so
> + * that workload consolidates to lesser number of cores.
> + */
> +static __ro_after_init DEFINE_STATIC_KEY_FALSE(splpar_asym_pack);


DEFINE_STATIC_KEY_FALSE_RO ?

> +
>  /*
>   * P9 has a slightly odd architecture where pairs of cores share an L2 cache.
>   * This topology makes it *much* cheaper to migrate tasks between adjacent cores
> @@ -1011,9 +1018,20 @@ static int powerpc_smt_flags(void)
>   */

-aneesh
