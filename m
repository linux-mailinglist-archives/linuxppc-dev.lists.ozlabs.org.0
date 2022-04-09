Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B654FA9D5
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Apr 2022 19:19:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KbMKv1hvdz3bhQ
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Apr 2022 03:19:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VgF5U5Fj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=acme@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=VgF5U5Fj; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KbMJt7307z2ynF
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Apr 2022 03:18:22 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 478B760DE7;
 Sat,  9 Apr 2022 17:18:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D644C385A0;
 Sat,  9 Apr 2022 17:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649524697;
 bh=U3jHc9UqvdL0OI4026ZW/QrRbZLIojegGMh2u9v87rE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VgF5U5FjEyAQlfJ1rxZKa815KAiFoOPnF+WI8qDhFrWa2WC7XDhcoIAXwPJG1Zx26
 hJoGd07p4baJpG+dOqtCqmukcgqQXq5bnbwqUoz+2/uz0qO8sWhY8g3sDOxvK+ELep
 dJpHqxZ8G0xL0iptyCISOBOMwbaIL2boDtCuDcJEMuGlhkC3lZnv7UmF3LFbppEOd9
 CqPM2gokNOjs8UcayPxAx6JMwWYMRe1i7lULZVHMQnvBFx3Ss0vsc6VPOrQJbUoBky
 y5r5ug+QGtmoF2XzgPJQ7eVCUzxtSnbBLsz4BJcuCUx+aotpTEWDG8QIWqgoD/LHqw
 3oUN+QGPun3yw==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
 id CC4CF40407; Sat,  9 Apr 2022 14:18:13 -0300 (-03)
Date: Sat, 9 Apr 2022 14:18:13 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 0/4] Fix perf bench numa, futex and epoll to work with
 machines having #CPUs > 1K
Message-ID: <YlG/1cegJ3Fh/zj/@kernel.org>
References: <20220406175113.87881-1-atrajeev@linux.vnet.ibm.com>
 <YlGmAd3LEh9He6Pg@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YlGmAd3LEh9He6Pg@kernel.org>
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

Em Sat, Apr 09, 2022 at 12:28:01PM -0300, Arnaldo Carvalho de Melo escreveu:
> Em Wed, Apr 06, 2022 at 11:21:09PM +0530, Athira Rajeev escreveu:
> > The perf benchmark for collections: numa, futex and epoll
> > hits failure in system configuration with CPU's more than 1024.
> > These benchmarks uses "sched_getaffinity" and "sched_setaffinity"
> > in the code to work with affinity.
> 
> Applied 1-3, 4 needs some reworking and can wait for v5.19, the first 3
> are fixes, so can go now.

Now trying to fix this:

  26     7.89 debian:9                      : FAIL gcc version 6.3.0 20170516 (Debian 6.3.0-18+deb9u1)
    bench/numa.c: In function 'alloc_data':
    bench/numa.c:359:6: error: 'orig_mask' may be used uninitialized in this function [-Werror=maybe-uninitialized]
      ret = sched_setaffinity(0, size, mask);
      ~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    bench/numa.c:409:13: note: 'orig_mask' was declared here
      cpu_set_t *orig_mask;
                 ^~~~~~~~~
    cc1: all warnings being treated as errors
    /git/perf-5.18.0-rc1/tools/build/Makefile.build:139: recipe for target 'bench' failed
    make[3]: *** [bench] Error 2


Happened in several distros.

- Arnaldo
