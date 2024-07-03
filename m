Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B1D926AFA
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 23:53:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CWLQZ/k7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WDtp80NJhz3fQk
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2024 07:53:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CWLQZ/k7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WDtnS6wWjz3ccL
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2024 07:53:16 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6A0A9CE20EF;
	Wed,  3 Jul 2024 21:53:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B06BC2BD10;
	Wed,  3 Jul 2024 21:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720043594;
	bh=EoX513EDEZICnXv3yAGou7CPrLBwziHXypDMjhVRvm0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CWLQZ/k7qZhU2o2y7z+5qDb/MGabHPbWUptEbLH7jsltVHiv9FCuqFT60d6nkspyf
	 O0a/JVdhsll0FtcFmUFl0qSi3PqzgvOUGXCzmG3ZEGGW1O7vuM8EzNRlPIDHs+xmZm
	 onypvjmbfV/NrqcCbe9yyZo4gaXMW8O+4Vb5k5kl2w1ox18a9KQcCuTtCQT8Y9Pz0m
	 FWtewMhlEJbAQB9hIIc5xtLs2W6IWHBPo8AQ+5R6vKZCIZbRjhTbegs3hsPJ4Kd9qX
	 +HgX0lnj52ScJA8eNV70atG630jvgq6vc1/z8ezZjXK9yR1MtBlFVam1cRWEPyBEYw
	 YHHaoRrsYEYMg==
From: Namhyung Kim <namhyung@kernel.org>
To: linuxppc-dev@lists.ozlabs.org,
	Abhishek Dubey <adubey@linux.ibm.com>
Subject: Re: [PATCH] perf report: Calling available function for stats printing
Date: Wed,  3 Jul 2024 14:53:13 -0700
Message-ID: <172004357966.3801669.9283730297152342211.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
In-Reply-To: <20240628183224.452055-1-adubey@linux.ibm.com>
References: <20240628183224.452055-1-adubey@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: mark.rutland@arm.com, irogers@google.com, peterz@infradead.org, adrian.hunter@intel.com, npiggin@gmail.com, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, alexander.shishkin@linux.intel.com, mingo@redhat.com, jolsa@kernel.org, naveen.n.rao@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 28 Jun 2024 14:32:24 -0400, Abhishek Dubey wrote:

> For printing dump_trace, just use existing stats_print()
> function.
> 
> 

Applied to perf-tools-next, thanks!

Best regards,
Namhyung
