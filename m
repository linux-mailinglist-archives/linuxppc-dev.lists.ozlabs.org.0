Return-Path: <linuxppc-dev+bounces-855-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA08967D60
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2024 03:32:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WxrpK6F46z2xZq;
	Mon,  2 Sep 2024 11:32:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725240729;
	cv=none; b=bS+BnLuUGlXJKH3Rm9mkaMDwHvsprckSHlIvhP2BObXyeVPFXFTymjBIIZ0ms7MEtzCptkMGxvlH8zD6gKDXl8C7QfNqYdR0ot0eBg6gbHyp9PT3612eGoyeAxv7iPySEBl3Mum7WvxOqmw5md+1gtiyXPvVyo2hGg0OTInQju7BTJl926/yiQICqNbeODCkPtVb4x/hkKqXR2887+1ZXnmY3mNlmOJmH0t2//6JNHk0PPxbuM7BmyGB0qL0raNsKfk3lrtGjbG1PYIYwTQjo6qQDVDqU8LaFp/VnKvCxOQEINB0duwB4u6KywyW1J1k+b+Vm6pd1AkMyu89obm9zg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725240729; c=relaxed/relaxed;
	bh=hEd15IjYZXnRyhtdgcjfJSRC6rzYSKGY3zoufAR+gS8=;
	h=Received:Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=M0R7NktWcZIMMwXzXb7PZd4NJQ82jUkomqkOyd71MVPD8D6lzgm7NN7v8JXy+JpBfSKf5OVWAf4/FTiIbGOf3687MN+vhsGu74mp0YKSnsK3/dJ8izxMT7pJQsWEbPcGviq++0cyevPgJ250gr6hVuhXoeRfeexyFuUDQU+4BmBAM1b/ws4Z6KmU8CGY3vkXzTjchMCf/5AA/+jiFkKyCHJvrHA3/ZVYVtsBv4TU8zLa8IkIyLqB1LrAv9A90W0I11LePjD8xz8oCBDBPWTB1bMPRiHQJYv4+HG3Vt+/j9lfHYla9XKSN3OAIvch9Z8SwoVrWbhenocS66Zn9P6vLw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=MhUwEyAy; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=srs0=hwiv=qa=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=MhUwEyAy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=srs0=hwiv=qa=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WxrpK4R1Xz2xWb
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Sep 2024 11:32:09 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 15264A41467;
	Mon,  2 Sep 2024 01:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 144B4C4CEC3;
	Mon,  2 Sep 2024 01:32:02 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="MhUwEyAy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1725240721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hEd15IjYZXnRyhtdgcjfJSRC6rzYSKGY3zoufAR+gS8=;
	b=MhUwEyAy7QwH2jAnlwQiZHAw1W8G/s5MAiOhbYmTLIXY3urEtImBd480WCoFf5+MPWPN0x
	N+RDjwdld/4+snJdVN6opo2RSvPoC3xYye/3DpuiTpQ4VeAgwbIzLNtcHj6hrZ8m6D3kNl
	PmoSwz1mjfoPpZ5447mk2wfwaahmsCE=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5302a019 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Mon, 2 Sep 2024 01:32:01 +0000 (UTC)
Date: Mon, 2 Sep 2024 03:31:59 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] selftests: vDSO: Also test counter in vdso_test_chacha
Message-ID: <ZtUVj1GJvypJ_uwK@zx2c4.com>
References: <f9f64c5ded3925ae408f01c1c61e2fdf6f645a71.1725212364.git.christophe.leroy@csgroup.eu>
 <ZtStjU_3K9yIJsmp@zx2c4.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZtStjU_3K9yIJsmp@zx2c4.com>

On Sun, Sep 01, 2024 at 08:08:13PM +0200, Jason A. Donenfeld wrote:
> While you're doing this, also add the remaining, `0, 0` elements.
>
> counter2 will always be counter2. You meant for the first argument to be
> counter1.
>
> Also, same issue with counter2 used twice in that memcmp.

Fixed these up and applied it.

