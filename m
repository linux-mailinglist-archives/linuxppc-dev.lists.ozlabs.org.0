Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 103A94FA944
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Apr 2022 17:28:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KbJtG6tkxz3bl9
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Apr 2022 01:28:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XuZzvDcj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=acme@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=XuZzvDcj; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KbJsg2skjz2ynF
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Apr 2022 01:28:07 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3D6EA60AD1;
 Sat,  9 Apr 2022 15:28:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D93EC385A5;
 Sat,  9 Apr 2022 15:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649518083;
 bh=fH6R5XI0+0MFwVlPvp4WGTQEHHbOqX/unKqNw5JN0fo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XuZzvDcjwzt33GApdo4mT8wyKTeHEbtZzEUxNitkFJbRjt9HdqKu72e8XXr4+P5ro
 HbzPfDVzTHfF9mh2gk45gdBJ6BoMTMP8mN7MBQN5WQpoA6HqXYKpMahvWYhVR9q3YZ
 uzUuAmPT+PuPzmevLpFjaBgCjyBsRdAPPzKV9+nlBv10EDD1OQJS+rkyUEZYcRNi8U
 spOkAiXFKcHxLmdX4ALNmYs7FLKveYOh88TRGVraNYFRWwTPd4zbGngas6OSmyEPA1
 Lwjc4z6nD0SOxycooll8D9EV9ROi+bh/eDUcdBwMS3p3KuOgLsoe3349dTevmxmkTy
 ERRcuypNQIinA==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
 id 0E06F40407; Sat,  9 Apr 2022 12:28:01 -0300 (-03)
Date: Sat, 9 Apr 2022 12:28:01 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 0/4] Fix perf bench numa, futex and epoll to work with
 machines having #CPUs > 1K
Message-ID: <YlGmAd3LEh9He6Pg@kernel.org>
References: <20220406175113.87881-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220406175113.87881-1-atrajeev@linux.vnet.ibm.com>
X-Url: http://acmel.wordpress.com
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
Cc: irogers@google.com, maddy@linux.vnet.ibm.com, srikar@linux.vnet.ibm.com,
 rnsastry@linux.ibm.com, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, jolsa@kernel.org, kjain@linux.ibm.com,
 disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Wed, Apr 06, 2022 at 11:21:09PM +0530, Athira Rajeev escreveu:
> The perf benchmark for collections: numa, futex and epoll
> hits failure in system configuration with CPU's more than 1024.
> These benchmarks uses "sched_getaffinity" and "sched_setaffinity"
> in the code to work with affinity.

Applied 1-3, 4 needs some reworking and can wait for v5.19, the first 3
are fixes, so can go now.

- Arnaldo
