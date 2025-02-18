Return-Path: <linuxppc-dev+bounces-6317-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C5AA39E06
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2025 14:55:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yy1JM6YJjz3045;
	Wed, 19 Feb 2025 00:55:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=37.157.195.192
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739886947;
	cv=none; b=bu1BQf/xxVeUjqUD5KG0Uc7Q5NDWrJFMxYQWNhIQHcp30dAiANN2sRo09V59bM/naaCiqJIB2cSAOTPIObNgZyN7LiFDwpey620oWaX2KJhSiPcH9gxJsMzHwbRo14STpf/hrmOUEtYVv0SWlwxFgfwdCtNJq6auoe+AboWLcS3sN2J13rgMl8ih84j0om95vmbrWfyvZ3LQbZV8PVO0amFq9FgwbDtozhtlzfNaPdi8sa+Jvo8wUmzkr2TnFzwl9nj9Rs5eeMYsU1ApyTGJijWBqZE+g/gjRUJAfJXAjjZbboyo8zc5IpLMNSNip32psnEaS1K/B5Ommp8gATKReQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739886947; c=relaxed/relaxed;
	bh=Wb3kj+Fu4n94NcS7OSE9d+LNr6D/va3T2ssWdLtNhkE=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=mPXEWO+xNgfkStAOS8YoEUSDMSk4qsgMhc6nHYzejsWqXZvu1/D8Tf3Fm+IWXdsiSe48tFGSywaeLXxQW4F+f6zlGQwm5Tf8k0VW6czzkx1C0wjncXxCAHN/QLu0yCU01h0rJOUNpuXSfirXVE1Z/7AIl7U0gNHdeHFJYqhgzmm8l68GOM3llQqq4ffS4CfMGYILHJlz50mK51DpyY9khiOn6BQul/N0Y7DVmWCi2Q6UZFfUkY8aUiqIso9XZuJBXKofGxo0ZPob7BCtreMqS0XLyg+XoZoScXlTRQ+bTMLRQfn4UcX6qxC+SghbqpDreG3Sv57FIwxDDP4Airh8hw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=danny.cz; spf=pass (client-ip=37.157.195.192; helo=redcrew.org; envelope-from=dan@danny.cz; receiver=lists.ozlabs.org) smtp.mailfrom=danny.cz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=danny.cz
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=danny.cz (client-ip=37.157.195.192; helo=redcrew.org; envelope-from=dan@danny.cz; receiver=lists.ozlabs.org)
Received: from redcrew.org (redcrew.org [37.157.195.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yy1JL67JCz2ytT
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2025 00:55:45 +1100 (AEDT)
Received: from server.danny.cz (85-71-161-19.rce.o2.cz [85.71.161.19])
	by redcrew.org (Postfix) with ESMTP id 5B8039E5;
	Tue, 18 Feb 2025 14:55:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 redcrew.org 5B8039E5
Received: from talos.danny.cz (talos [IPv6:2001:470:5c11:160:47df:83f6:718e:218])
	by server.danny.cz (Postfix) with SMTP id 195D315E001;
	Tue, 18 Feb 2025 14:55:41 +0100 (CET)
Date: Tue, 18 Feb 2025 14:55:41 +0100
From: Dan =?UTF-8?B?SG9yw6Fr?= <dan@danny.cz>
To: "Nicholas Piggin" <npiggin@gmail.com>
Cc: <linuxppc-dev@lists.ozlabs.org>
Subject: Re: panic in cpufreq_online() in 6.14-rc1 on PowerNV
Message-Id: <20250218145541.5207d9d43198ee87e4fd871a@danny.cz>
In-Reply-To: <D7V6P2GXV4Z3.1GWB8AYAOUT61@gmail.com>
References: <20250206094148.787dbdaa0580d7ed6c510709@danny.cz>
	<D7V6P2GXV4Z3.1GWB8AYAOUT61@gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; powerpc64le-redhat-linux-gnu)
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
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.3 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, 18 Feb 2025 11:35:08 +1000
"Nicholas Piggin" <npiggin@gmail.com> wrote:

> On Thu Feb 6, 2025 at 6:41 PM AEST, Dan Horák wrote:
> > Hi,
> >
> > I am getting a kernel panic on my Raptor Talos Power9 system after
> > updating to the 6.14-rc1 kernel from 6.13. Seems reproducable every
> > time, but I haven't start bisecting yet. Does it sound familiar to
> > anyone?
> 
> No, but it's possible it could be skiboot changes in PM code.

it was the issue Gautam pointed me to, fixed in 6.14-rc2


		Dan

