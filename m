Return-Path: <linuxppc-dev+bounces-2240-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1471C99D5B9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2024 19:43:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XS4MY5FG2z3c30;
	Tue, 15 Oct 2024 04:43:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728927801;
	cv=none; b=Y1ErGoJHkLN6Vhz5yE1MTr+JZ5mGsVFTDEHsxreHbUURZ3pM/Bevgh0mrvniPKLsYddlvNW2lecphKC5Pj1FXvHIWChZHt+5shLSDK8Bch69vhdHqGDBRw8YxXInsASq0qtBAI921QWg7+fWbROZNcstxkv0ukb5iYBCihyUd/ZiZRpQfsDR9h95o0UjhZoBJvFL9qbwAd3Ehfa4fGUlM+k+TYUOIy0+AUDyOVgOl36AaPTP46weMoFjM4bFH6XPbOGm0zegC7O4cOVvPDexsNBxJu+xK2++GF4AelQG0o3/m7kzKonhgWA+psnrHjlMCehVfuo06hlmmyyoDQ+K/g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728927801; c=relaxed/relaxed;
	bh=8L2QARkdY45uKSnJUP8U5XXwlJAABkWO1EykjKDkF0o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jWUnWGMMLDPySh9V2kndACFZzednyig/y0PmSU4NrFrVxaOYjNFSVRqtEvC9wC3Cz3iKOjL9uoUIlwfyrwI2fo8cjIjpoRlQ5H709G26tadjSJsY1Qpl0du2dSggAflVu8h1wgXinY9mUeHcA9xOhTFnl2ds4l1dLb++RUkIqruRPOWwCDNuh51wk3QbqiLamNKUZLg8IxRdNIvNvWz80KJWpxOsek6YBV7oACt8bZ9cqn0eQYZWR9okxVC5QUxAfD53mhOM3xkKARHFU5il8//kHWJdCDuYdJrOCiXgtuCbRpmoXOxbaL6S+VAMSYoPfy2dDVjer0PUG9notmm6Ew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lC0o2btr; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lC0o2btr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XS4MX4xhSz3c2F
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2024 04:43:20 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6632BA4268A;
	Mon, 14 Oct 2024 17:43:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A19C9C4CECE;
	Mon, 14 Oct 2024 17:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728927798;
	bh=ol1AsYHgFG1jE/sTqLYzDIYO7XeC3+QanguChEXwTkM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=lC0o2btr2isEaZefXsP9igqUaN3TzEcPl0b2REKMUgSHMPMiQilrzUnAsocwc41p/
	 tOydDFoAWb0gxq3lqtgnwNhKA7n9ntd0E7jph/WEzNTn5+9Tjcc7fG1VFR2hOe1R6N
	 Nk/83QHpRmlhglLB+23pU6/lc87KFm0uYm6CKlU5iLnbCffK0JL5jMENp1bonMRFFp
	 8qmRdDOz4Xh+NDeFYqPEJAuKtyrel8IVsJC+DKjpbBCHgfJVFVViMSewSFI2rDnRLF
	 5raylHPKmjybwMvXV/TVbxyO8580ESEC7PgISFZqLI4sNTXaVvkPnm99S45CfqAAtd
	 CYC0SOa27evxw==
From: Namhyung Kim <namhyung@kernel.org>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com, 
 irogers@google.com, Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Cc: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, akanksha@linux.ibm.com, maddy@linux.ibm.com, 
 kjain@linux.ibm.com, disgoel@linux.vnet.ibm.com, hbathini@linux.ibm.com
In-Reply-To: <20241013170732.71339-1-atrajeev@linux.vnet.ibm.com>
References: <20241013170732.71339-1-atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH] tools/perf/tests: Remove duplicate evlist__delete in
 tests/tool_pmu.c
Message-Id: <172892779762.897882.10648635927487710641.b4-ty@kernel.org>
Date: Mon, 14 Oct 2024 10:43:17 -0700
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, 13 Oct 2024 22:37:32 +0530, Athira Rajeev wrote:

> The testcase for tool_pmu failed in powerpc as below:
> 
>  ./perf test -v "Parsing without PMU name"
>   8: Tool PMU                                                        :
>   8.1: Parsing without PMU name                                      : FAILED!
> 
> This happens when parse_events results in either skip or fail
> of an event. Because the code invokes evlist__delete(evlist)
> and "goto out".
> 
> [...]

Applied to perf-tools-next, thanks!

Best regards,
Namhyung


