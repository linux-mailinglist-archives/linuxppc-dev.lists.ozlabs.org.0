Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EE0810FA9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Dec 2023 12:21:39 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ch6F7AqX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SqtNK2mVNz3cXZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Dec 2023 22:21:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ch6F7AqX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=aneesh.kumar@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SqtMV3170z30fF
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Dec 2023 22:20:54 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id AE418B81B04;
	Wed, 13 Dec 2023 11:20:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2DD1C433C8;
	Wed, 13 Dec 2023 11:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702466449;
	bh=PG6K9VuJdcgKbvpqgnXCTy8CVJLGJ87KEH9VnhXqixE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ch6F7AqXQjjMxH4QZovM9tXn19t/mAiDiBVBrrQQ+Cap67EkztsefY8FkZrIyyeBG
	 LmukSAUSf6e4VcbCNce3WGkJ6dds9RzIErkl5bFrojzSq1oiaWuKDkR4oNNLnVCMzF
	 L9oEpn9kxPp6fbbY501FkU5Xb8ocNs18CzCnBatLg3kUIJu9Pwswl5ZBgVHsZ4LMgN
	 T67jvVsexR+4t8xntrLgvJAW+Ngz1wyHl16nAYaYl7iiTLT/L9DYaZCLeTOVizYlHJ
	 OH66wz4zDvsFYCtx6wMFO6Htag0taKSIJePK6AdGLJn27VjZJACVnk0fBGZ0399mxh
	 CVPRz+78niZUg==
X-Mailer: emacs 29.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v4 0/5] powerpc/smp: Topology and shared processor
 optimizations
In-Reply-To: <20231211025656.4lqrhnic5gynkuzq@linux.vnet.ibm.com>
References: <20231109054938.26589-1-srikar@linux.vnet.ibm.com>
 <20231211025656.4lqrhnic5gynkuzq@linux.vnet.ibm.com>
Date: Wed, 13 Dec 2023 16:50:40 +0530
Message-ID: <87wmtimjqv.fsf@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Valentin Schneider <vschneid@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, "Paul E. McKenney" <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Rohan McLure <rmclure@linux.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Josh Poimboeuf <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:

> * Srikar Dronamraju <srikar@linux.vnet.ibm.com> [2023-11-09 11:19:28]:
>
> Hi Michael,
>
>> PowerVM systems configured in shared processors mode have some unique
>> challenges. Some device-tree properties will be missing on a shared
>> processor. Hence some sched domains may not make sense for shared processor
>> systems.
>> 
>> 
>
> Did you get a chance to look at this patchset?
> Do you see this getting pulled into your merge branch?
> I havent seen any comments that requires a change from the current patchset.
>

It would be helpful if you could include the details mentioned in your
reply in the commit message. Specifically, provide information
about the over-provisioned config and if you plan to send another
update, please remove the additional changes in the printk_once section.

Reviewed-by: Aneesh Kumar K.V (IBM) <aneesh.kumar@kernel.org>

Thank you.
-aneesh
