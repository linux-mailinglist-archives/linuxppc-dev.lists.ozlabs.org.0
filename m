Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC1F8BE69E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2024 16:53:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JvNPgBvv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VYh9Z3YJbz3cWP
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 00:53:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JvNPgBvv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=acme@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VYh8t4PdKz3cF6
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2024 00:53:02 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id ECB1FCE126E;
	Tue,  7 May 2024 14:53:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B756BC4AF63;
	Tue,  7 May 2024 14:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715093580;
	bh=G2fd/G6gHoEl3QR40FzwdMkgc9pQE2sWSv49OHbI4d4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JvNPgBvvlZTMle2tmEciAGw4tri1AC80m9Gm4LuqqYzLzoD5yn/+U4w1lq0hVsEPN
	 NuNmtC1elTWZev4XncK6IHzUFAxmbg4LwnEV2c9vAfCl5HJiireagp/Ej8oPJKGuul
	 /6wHXPs9HT5lEn/+xwvxUOqeUwCCUpDzN95f5CsNZGT/7Chke0GafGBJQAcZez/uUq
	 7poyjgcEqoT6wr6EBEJHitW+ROmlFfZzQBtREzVs2C9YM3212ZkdWRARw8oLHMVc5H
	 OynWw14pkd5xCPEp01lHucmRHRS0CLawCT4nnn2ZQ71hfKMrdUUgBFHkFabTYqEwrO
	 EdReYeVrSrymw==
Date: Tue, 7 May 2024 11:52:57 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Namhyung Kim <namhyung@kernel.org>
Subject: Re: [PATCH V2 3/9] tools/perf: Fix a comment about multi_regs in
 extract_reg_offset function
Message-ID: <ZjpASVk1GezAzDAG@x1>
References: <20240506121906.76639-1-atrajeev@linux.vnet.ibm.com>
 <20240506121906.76639-4-atrajeev@linux.vnet.ibm.com>
 <CAM9d7ciKUQErzu1Y7FnWCryW15xUkyJLSt-Jez9h8TYgp-tLjw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAM9d7ciKUQErzu1Y7FnWCryW15xUkyJLSt-Jez9h8TYgp-tLjw@mail.gmail.com>
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
Cc: irogers@google.com, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, kjain@linux.ibm.com, adrian.hunter@intel.com, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, jolsa@kernel.org, akanksha@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 06, 2024 at 09:40:15PM -0700, Namhyung Kim wrote:
> On Mon, May 6, 2024 at 5:19 AM Athira Rajeev
> <atrajeev@linux.vnet.ibm.com> wrote:
> >
> > Fix a comment in function which explains how multi_regs field gets set
> > for an instruction. In the example, "mov  %rsi, 8(%rbx,%rcx,4)", the
> > comment mistakenly referred to "dst_multi_regs = 0". Correct it to use
> > "src_multi_regs = 0"
> >
> > Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> 
> Acked-by: Namhyung Kim <namhyung@kernel.org>

Cherry picked this one into perf-tools-next.

Thanks,

- Arnaldo
