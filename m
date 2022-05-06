Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C55951CF0A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 04:41:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvZZR2D9Pz3bxR
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 12:41:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=llMPp7+K;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvZYq0vtsz3bdR
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 12:40:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=llMPp7+K; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KvZYj580jz4x7Y;
 Fri,  6 May 2022 12:40:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1651804842;
 bh=OZR46u3Sin209gHTa7HOBQ6+AD+YHBHgUHJTbOAwzOw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=llMPp7+KgH5XSjyOxoDfc3h6x932RKETWwtX4KtrWETMUxqZ60KMj6dDzncQn96Bx
 FE4QVONeCzrxC1TVJBqeO487ak5SZdZeyW6FNN9/5+E94W17jlfOz5joqM3xBSet+h
 Bdq1acqm3K8cTKkGp0JWgTi+PVJUXbrs9FN+PS/R6Zb3bcb5MBhSP6DDM3620lHfeZ
 Td76ezE56cWbHELxx06PCd9zhuMwPmA237m3M84L6ZKur5T6FJP4JN63efpl2+UjDr
 kHAGRJJJp+VJfF3mNXwr1muUlUGPwihlGk4KcHGnM5BtiV+6j7qjZky5vhp2m9K7rp
 Dwgb7mwZQyCcA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, acme@kernel.org,
 jolsa@kernel.org, disgoel@linux.vnet.ibm.com
Subject: Re: [PATCH V2 2/2] tools/perf/tests: Fix session topology test to
 skip the test in guest environment
In-Reply-To: <20220505094000.58220-3-atrajeev@linux.vnet.ibm.com>
References: <20220505094000.58220-1-atrajeev@linux.vnet.ibm.com>
 <20220505094000.58220-3-atrajeev@linux.vnet.ibm.com>
Date: Fri, 06 May 2022 12:40:38 +1000
Message-ID: <87r157tmc9.fsf@mpe.ellerman.id.au>
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
Cc: irogers@google.com, maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com,
 kjain@linux.ibm.com, linux-perf-users@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Athira Rajeev <atrajeev@linux.vnet.ibm.com> writes:
> The session topology test fails in powerpc pSeries platform.
> Test logs:
> <<>>
> Session topology : FAILED!
> <<>>
>
> This testcases tests cpu topology by checking the core_id and
> socket_id stored in perf_env from perf session. The data from
> perf session is compared with the cpu topology information
> from "/sys/devices/system/cpu/cpuX/topology" like core_id,
> physical_package_id. In case of virtual environment, detail
> like physical_package_id is restricted to be exposed. Hence
> physical_package_id is set to -1. The testcase fails on such
> platforms since socket_id can't be fetched from topology info.
>
> Skip the testcase in powerpc for pSeries. Use the utility
> function "cpuinfo_field" to check platform from /proc/cpuinfo.

I don't think that's the right way to fix it.

If we ever had a "pseries" machine that did expose physical_package_id
then this test would continue to skip, even when it could succeed.

So if physical_package_id being -1 is the problem then you should skip
the test based on that.

cheers
