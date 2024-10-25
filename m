Return-Path: <linuxppc-dev+bounces-2562-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 571939AF6A7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2024 03:22:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XZQ511bj9z2xsd;
	Fri, 25 Oct 2024 12:22:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729819365;
	cv=none; b=KcXwaBmRoHfbUWmbKdgog//bmQItkXEg5Wuds4Il1EBq1uBJ236AIcYNqD+rIoqtYlBAGithtNRig+iuyPHmVOCKqRBTjwk0mzSrNEz4vL/fZFbnM2pPRxTrVjiFF0M17oicyvr2Pd4mzN9dMlmZvdYB06AQ0fD1l1Z3ZF51Btrsbh7g3A8O+vzuoxRAeCfLT3EUrqtq/mRAAyhpUULWX/5fWYTYOBYl24k4oGugvzpIdAbCEiD9ahY29MlgsGrIBBC0zow3SaHoCYJoRVa7ksF7d6FL/l3tdJIDb4QHW2vdMkmJiBcja9UJxDmlTwXz/slsZhFLd4dcQG2ZXwPRwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729819365; c=relaxed/relaxed;
	bh=PHk+f02gxxCH78JZbRAia+WbVbQ0AJGC2OCKGNTcjio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y7UMQlKU+kXDOqioFeS8WjaCENPOs+2feg+pa/3JjEbedeubDwmh2xvxeT9N1idME/+0rwc+zMyvx5RpUVS9IT9Fma1LA3/mwwhO9JMx4CnSlSWPCX7cqAOi1xSeUt+WxxzsIRWC0y+ppsHZ7CVjfgXQQ2qRXe5qPHPH/0igJMtxcEoncbrDSmyOrQxVlPPTM+Zr1K14dfGBUKicG0inRIZM8RHEZuNlNzDTgwbggaAHL2UmYGMLkNZx3YzDteVn09HKQjCsUH5V0LBq41utBXVL1t5YlGPhMjx9IWKJYldLALZOVulPAe8kDJJN/hvT+dcg6uFRMHYsPR769rYtfg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Bc3a5qD4; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Bc3a5qD4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XZQ501jMkz2xs8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2024 12:22:44 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B7566A42AF6;
	Fri, 25 Oct 2024 01:20:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56E6DC4CEC7;
	Fri, 25 Oct 2024 01:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729819359;
	bh=PHk+f02gxxCH78JZbRAia+WbVbQ0AJGC2OCKGNTcjio=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bc3a5qD4OqjSXdFp0YC/YQR9lx762k8SHCwE/zwZhxpyXyv48dUIt717zB96aKR7+
	 SbtSj8MwlVbEqKW6C26c2Gv6o2zrqmo5IcAdf9trqDWBrMN/JvUjo92s26V3q3ucWi
	 SwVTMP6SfuQ2T5YNj8O3yup9tLtPg6g55ljJSSSjBxw7k6gXkQa7QfiMG9awCkDHQD
	 4gwwY+qWszL0lQR6wpzSm5d2Y2wu3LFG30dKdvTnS3bFB7J/TTDGEYJ3awBZVLKiC5
	 ccRmySNrAF1EkoMB+XET2jpjv2HIDPApBSDm1XnR6mUqYlDl43boiMQwrU+Fj4sUuh
	 LLqYU6N14X0ow==
Date: Thu, 24 Oct 2024 18:22:37 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: clang-built-linux <llvm@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>,
	lkft-triage@lists.linaro.org,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Anders Roxell <anders.roxell@linaro.org>
Subject: Re: powerpc: clang-nightly: fatal error: error in backend: Trying to
 obtain a reserved register "r2".
Message-ID: <20241025012237.GC740745@thelio-3990X>
References: <CA+G9fYs2G_4jyv-V7f85oE53rw5rX0Tnf2V8RQ=O9CuPcbfb2A@mail.gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYs2G_4jyv-V7f85oE53rw5rX0Tnf2V8RQ=O9CuPcbfb2A@mail.gmail.com>
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Naresh,

On Thu, Oct 24, 2024 at 08:35:11PM +0530, Naresh Kamboju wrote:
> The powerpc clang-nightly version 20.0.0 build warnings / errors noticed on
> the Today's Linux next-20241024 tag.
...
> Build errors:
> ----------
> fatal error: error in backend: Trying to obtain a reserved register "r2".

Thanks for the report. I reported this upstream earlier, it should be
resolved now but it will take a little bit for that to filter into
clang-nightly from Debian.

https://github.com/llvm/llvm-project/pull/112603#issuecomment-2430709704

Cheers,
Nathan

