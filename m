Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFB479DC4B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 00:55:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=NNkhvJJS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rlf735Q4bz3ffc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 08:55:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=NNkhvJJS;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rlf6B694cz3fY8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 08:54:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1694559263;
	bh=9qFhBwApOtxbCRkss+cXTdVSRxiqaNw6Cm3OsXpblk0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=NNkhvJJSuTAjyxdHn9KL8t+JxECMLmlaD2DyhL7HZu/5W/LGNlBPB8kYup011jINm
	 x0z1ik7md75tNC7W51XDMILuvot3hiewacJvknMqa4Kb3ws4ihsRiy5FWi/6TpnaeO
	 IKW/iy47r3GWyUzBomcanUO0KDpA14BHCvGCNEVnwAgZMcumbJmTyztECe9ufcV6gd
	 mvD/UzUNzMjSvoZ5nUyRT5T0JqGLIClE/OOzb5pEgOgglWMK1FWT5ZdavqwkXiLJrv
	 RwrQJAKcsmpfibrAOaxB7EPC4oavOVn9CVfCu3xiFxgz4hCwgjRMdR5zpWiWxm5pRT
	 go2se/utZvTYw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Rlf672wVTz4xQj;
	Wed, 13 Sep 2023 08:54:23 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Aboorva Devarajan <aboorvad@linux.vnet.ibm.com>,
 aboorvad@linux.vnet.ibm.com, npiggin@gmail.com, rmclure@linux.ibm.com,
 arnd@arndb.de, joel@jms.id.au, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, pratik.r.sampat@gmail.com
Subject: Re: [RFC v3 1/2] powerpc/cpuidle: cpuidle wakeup latency based on
 IPI and timer events
In-Reply-To: <20230911053620.87973-2-aboorvad@linux.vnet.ibm.com>
References: <20230911053620.87973-1-aboorvad@linux.vnet.ibm.com>
 <20230911053620.87973-2-aboorvad@linux.vnet.ibm.com>
Date: Wed, 13 Sep 2023 08:54:15 +1000
Message-ID: <87a5trvw88.fsf@mail.lhotse>
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
Cc: sshegde@linux.vnet.ibm.com, srikar@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Aboorva Devarajan <aboorvad@linux.vnet.ibm.com> writes:
> From: Pratik R. Sampat <psampat@linux.ibm.com>
>
> Introduce a mechanism to fire directed IPIs from a source CPU to a
> specified target CPU and measure the time incurred on waking up the
> target CPU in response.
>
> Also, introduce a mechanism to queue a hrtimer on a specified CPU and
> subsequently measure the time taken to wakeup the CPU.
>
> Define a simple debugfs interface that allows for adjusting the
> settings to trigger IPI and timer events on a designated CPU, and to
> observe the resulting cpuidle wakeup latencies.
>
> Reviewed-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> Signed-off-by: Pratik R. Sampat <psampat@linux.ibm.com>
> Signed-off-by: Aboorva Devarajan <aboorvad@linux.vnet.ibm.com>
> ---
>  arch/powerpc/Kconfig.debug                 |  10 ++
>  arch/powerpc/kernel/Makefile               |   1 +
>  arch/powerpc/kernel/test_cpuidle_latency.c | 154 +++++++++++++++++++++
  
I don't see anything here that's powerpc specific?

Which makes me wonder 1) could this be done with some existing generic
mechanism?, and 2) if not can this test code be made generic.

At the very least this should be Cc'ed to the cpuidle lists &
maintainers given it's a test for cpuidle latency :)

cheers
