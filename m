Return-Path: <linuxppc-dev+bounces-6540-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A78EA485AF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2025 17:50:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z3clr422yz3br5;
	Fri, 28 Feb 2025 03:50:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740675032;
	cv=none; b=SPrrKDThTaiSoT4YuRpoOUuqinllbBLfRZk1GFd56ij2NTaAiwf+nX/54Bysmn7EFNbMu85NGOxYbFy868jTOk/hg7qA3kggMYkHOVbNflgVGtjf+7486ewT5w0KwKWzGBQGCxQl/jROzkVel2bSLr55g8XydyebEx2mKslHT3QibDoFFFfEeQjFW3N8vkVUIruf4spU98JfHGxA/tHCORDuJ8CfbLv7u1Sozr4fF1akg+mGXnna3Mzd34OLjjejqmwJJl6ok9uci+kfYKGSurR6yGievmKbv7sxfCbRUF7DY9Mh/kGxRGKe74Px758kbBpens9r+Hy3AsGePjXleA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740675032; c=relaxed/relaxed;
	bh=F+2b0mnSS3hH7uytwVuvAHkTxY6C+wQboMZhCF1Flbs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dTZPFGShLC5pbvMyiNXzs4iUQSbO/aQGmwWVBXb6x/0ZKQLIjILB7pENfUzAhdzZ0agHo93AJnaRH6DeyYe4mEub1LOI7T+7AAWje/fvap8CA0Zj6hl0oSa27hDzYnTMYwQmu8rBEX8FaCZClfCkAwkcw0bqK+KzKhuBICXCubO7vHMYE4jsA9ofJX2G+yvoToeMB+qhLNL03Lh7jev2/mkpCxGwuGn1hfVN3ixNEpLMlitSNs0l6MuaXCybrLn+rgAdhAMCgYKH7TGFNE3MghyiqUrokLad+9kpcGyDXl7/JDZvfEOrERDd2YW0jiQ/wJz0dffWmyLOJqrzihWRsg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tWr2j6nQ; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tWr2j6nQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z3clq4nZxz3bnx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Feb 2025 03:50:31 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6EE565C6072;
	Thu, 27 Feb 2025 16:49:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1392C4CEEB;
	Thu, 27 Feb 2025 16:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740675028;
	bh=vGzYbABsEZES14wNelq5aaknya5cl/i8HQMd55vQGN0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tWr2j6nQWCp6GW/OdvFGYRhqDOWStwZshAd7JJ3lPdinzK2po2RRPspQDtc6GEnXb
	 oW9e7FC7+4JY63xfyAYyrF8tfdSayMa5ETUi2qFWskuC9Q1hRZzDvzoQA6ZhY1t3Rx
	 kuCx0neg9zXpWkYENFVJx5Bgv/fo4vJYqrZEMuBy1/igQ65DAkmfmipSopwIQ9kW3+
	 bkaPZzBa19PwHgismKUXY43Mm+n/BhL4GVJqDgtmG+mvwU+zqV2+e17kDK3DJuiNXZ
	 hanMRcDqOW4idid/Bmt1CwWlu2ZOrKR2CJuBXbGoGxCuVDkBI1U6lBViaJ+g8t2LFq
	 gtQKxls4c5iXA==
From: Namhyung Kim <namhyung@kernel.org>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com, 
 irogers@google.com, Athira Rajeev <atrajeev@linux.ibm.com>
Cc: linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 maddy@linux.ibm.com, kjain@linux.ibm.com, disgoel@linux.vnet.ibm.com, 
 hbathini@linux.vnet.ibm.com, Aditya.Bodkhe1@ibm.com, Tejas.Manhas1@ibm.com
In-Reply-To: <20250225113157.28836-1-atrajeev@linux.ibm.com>
References: <20250225113157.28836-1-atrajeev@linux.ibm.com>
Subject: Re: [PATCH] tools/perf: Use perf_tool__init() to initialize
 default values in builtin trace
Message-Id: <174067502768.1401960.9231492676290649257.b4-ty@kernel.org>
Date: Thu, 27 Feb 2025 08:50:27 -0800
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c04d2
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, 25 Feb 2025 17:01:57 +0530, Athira Rajeev wrote:
> Perf trace on perf.data fails as below:
> 
> 	./perf trace record -- sleep 1
> 	./perf trace -i perf.data
> 	perf: Segmentation fault
> 	Segmentation fault (core dumped)
> 
> [...]
Applied to perf-tools-next, thanks!

Best regards,
Namhyung



