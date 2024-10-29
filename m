Return-Path: <linuxppc-dev+bounces-2691-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E079B56C3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2024 00:25:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XdRDr2m1gz2xjv;
	Wed, 30 Oct 2024 10:25:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730244300;
	cv=none; b=QXYQaNofFcqTspm01444JFKAUXPULHFM94xoq6W5lfEKGbONVzPB0j3zc4Xutxx71uYABkRIak4VzKiGKTE2KzSeNnydoVipCyz8RGJNkSOtbuL+Zl03BJZolYfipTOEYGo4mV1ya912+0M559PY1glY+1AMr1YLXJBaAvMQakYR5JimGurSqmg/XIwDYTTFNHdyqw0vzkSyqVWJ+ortAmBBqkwcLkbSJF/xqBK9ss1q8YchbQk57YwqRLXNTlKc6Gs8oB9/fxYICHXVU+yGynSfOiM86KI/VYivGt5kkPXWqwgtNS3BFcdTecNwdYy6bGBwaTDwHye6B/7TQN1uPA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730244300; c=relaxed/relaxed;
	bh=fu7v7920u/I/Doc6jUHA9tF2v4DuqjpOqfzqwbJ6W7s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LT90/iJcS/Yzzwurd/RVquMNWOTcBbuMaZrmWfpcI7EWrbjvQbtscj2NGd34LYgqlUyshAKhvS+I4wHo4Q1PPs9ImJphJaPsmJwz6Ym1tu4Q1jVTeHEO2wAYO531yhMSCAv0QvMrU5bnEFN3kvfAXG6HYCFvXsF7yazywhs6wLGmSVFL1t6CaJycZAeY3n6eWXzkY7EGr0h20qjKGfRaTqmTR5hhw4M7jxa0wBEJSbuqLH2SvMUKG6Kors3P7DQW0Gwu7FfOAbbI2osP8H1hahdEYYOfpyuQe6kCZNZa8megJp8OaFnc95Qa6mzmOr31USaP2jKU91xjHfuH87ymoQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=jy5NcOzM; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=jy5NcOzM;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XdRDn6rWFz2xFr
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2024 10:24:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1730244291;
	bh=fu7v7920u/I/Doc6jUHA9tF2v4DuqjpOqfzqwbJ6W7s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jy5NcOzMMFEROoCYxPwfk0kVJc5TyhyF6erqUXwOmxPEuwjobb8OMBA8VcQE4dJfK
	 Dii7eLnC+emBvOw+VXhgr7GCk3txt7ck+DWbRG1lsDjsASt7nmpYKyPCEfWKa85WV6
	 0RByPvYVEPWvOJcaqS4MXLG+iLgq+7Sk7cyL349rVu+vHqWrDQ4K0VeyKEcXDKRJdt
	 3alJrK38UQHl3qsjHvrYwo2mFhWmNdgU2ibCR7GnsbEaaMXy++I2bl3XoFDZDKzUzG
	 umwtg/eSR7SGd/7unWn/o4XcPqJgvM/a9n9vBgGIqoXBDgykIUHDWOEjuEE0WoiYhO
	 XmTTsd5wfi4rQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XdRDf6J6vz4xG8;
	Wed, 30 Oct 2024 10:24:50 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
Cc: 2639161967@qq.com
In-Reply-To: <20240920093520.67997-1-mpe@ellerman.id.au>
References: <20240920093520.67997-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/powernv: Free name on error in opal_event_init()
Message-Id: <173024426106.939030.14154632151675124258.b4-ty@ellerman.id.au>
Date: Wed, 30 Oct 2024 10:24:21 +1100
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
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, 20 Sep 2024 19:35:20 +1000, Michael Ellerman wrote:
> In opal_event_init() if request_irq() fails name is not freed, leading
> to a memory leak. The code only runs at boot time, there's no way for a
> user to trigger it, so there's no security impact.
> 
> Fix the leak by freeing name in the error path.
> 
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/powernv: Free name on error in opal_event_init()
      https://git.kernel.org/powerpc/c/cf8989d20d64ad702a6210c11a0347ebf3852aa7

cheers

