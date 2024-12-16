Return-Path: <linuxppc-dev+bounces-4208-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A069F37DC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2024 18:51:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YBnYS0xvjz2yVG;
	Tue, 17 Dec 2024 04:51:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734371468;
	cv=none; b=HNoDXKmlz94v25TCbqYkghseeFcGaiSOdVK0JUx1O2YZiAd0pqzZ/yXQkahpwMmJ92vdBPL8F64zmCDIZZi+hC3b5dAZ/OtVpK3KrkncsnouaCoZY6lF6wI7ZIQN5YUUX1mF25HRoIwM4Zn+Zvssj67Y+hCRUy6GqWJ81KGpjhSB7llxOYUblHigpoTEGXFWmBrfF1T61Er/0WmHRug0OL68qttTmUL1AukAMXzJuSLtHgPaJt0nNvRQLSzvDoI+T6xbYJShAZmzQ52IWLce3LbDdYjymLTRfM53B5KaJwaIr5cMAmoXo39Uov2e90vsk/GWAY0bWCFUiIDCSCbOTA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734371468; c=relaxed/relaxed;
	bh=L8tdmaZtb/FarxOFWJaTE86m5BCNqD4Xuc+pnJcmnmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CV7ZV5Ndm3b5a7naMieCYjSNSHaNWBE++TnkAJ7Zwe7ftu+5D4nmE//xx47IKh+LYrw0JcsbbcAlLP8juxwcWSwIvx3QjzL+fXq2IS4HYJOxmzaF9l+rYa9n/nYiIZcA/MLE3e2YpWtgAC7BglLdtUSnhg5oqiUJjc/EJff6MwS57QAEL4/+qqGvtRgPkjCl93kEXtBEVdi5t08qSz6g1qhKsDIvLtldLcjz5R2zSjQzVKhyaEruTOdwEQU0Ddbp6dyv6A06juoYqnHH0ZWcSI5TWlG3iM6VMt3eRQwRzKZFL//AUZ4X7xzEtiKRJxxGwUX1g5d4jta/eIXCNbG2UA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JUS4EupW; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=acme@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JUS4EupW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=acme@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YBnYM292Dz2yV8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2024 04:51:03 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 90C285C65C5;
	Mon, 16 Dec 2024 17:50:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15DF0C4CED0;
	Mon, 16 Dec 2024 17:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734371460;
	bh=XPoUp67ed4JoOg0ycSqESbmQXikBffSLNT+vnSBT4A8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JUS4EupWCBbJ4rlfyoEiW4ciIRhZ5qiRuwpunzyaQG3ilqwaMambY46hLzMM41qHT
	 EEpvStm/JYTKjnpg8Vy+RZxCwK8ShsJQj4GjwG2LFAxahBpQ7VM0ItLOTUq7Oruw/v
	 txmBU8VIyVNMlEFJZIhXRr3COxm1e3oquzPuz71T6ZZfYRZoXm7mgQgHVotqRlBjI+
	 TVggZZdQeUtAOe1j328RfyjlWcxw+3ToIKhNA/31GfNtqpXxG565iTvfZ+2o8Me/VQ
	 ru6bZ5QEjtb+zY3wmOneJIIlsOB/+ZLe7Gy07jGhPe85VJAh9pWTT8qEtf0Bkm8tJJ
	 FkbMx7zVewG1w==
Date: Mon, 16 Dec 2024 14:50:57 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: kajoljain <kjain@linux.ibm.com>
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, jolsa@kernel.org,
	adrian.hunter@intel.com, irogers@google.com, namhyung@kernel.org,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com,
	disgoel@linux.vnet.ibm.com, mpetlan@redhat.com, vmolnaro@redhat.com
Subject: Re: [PATCH V3] tools/perf/tests/shell/base_probe: Enhance
 print_overall_results to print summary information
Message-ID: <Z2BogUY4sx8mqrAg@x1>
References: <20241206135254.35727-1-atrajeev@linux.vnet.ibm.com>
 <32b19139-27f2-4f39-a2ae-25027acc980e@linux.ibm.com>
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
In-Reply-To: <32b19139-27f2-4f39-a2ae-25027acc980e@linux.ibm.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Dec 11, 2024 at 05:33:50PM +0530, kajoljain wrote:
> On 12/6/24 19:22, Athira Rajeev wrote:
> > Here -a and -d doesn't require DWARF. Similarly there
> > are few other tests requiring DWARF. To hint the user that
> > missing dwarf could be one issue, update print_overall_results
> > to print a comment string along with summary hinting the possible
> > cause. Update test_invalid_options.sh and test_line_semantics.sh
> > to pass the info about dwarf requirement since these tests
> > failed when perf is built without DWARF. Use the check for
> > presence of dwarf with "perf check feature" and append the
> > hint message based on the result.
 
> Patch looks fine to me.
 
> Reviewed-by: kjain@linux.ibm.com

Thanks, applied to perf-tools-next,

- Arnaldo

