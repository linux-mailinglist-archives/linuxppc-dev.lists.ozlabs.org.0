Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6D6908CAB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 15:46:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Q7NaJSl8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W10tG3hq4z3cYM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 23:46:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Q7NaJSl8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W10sY36T1z3cSH
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2024 23:45:37 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9A098CE2B02;
	Fri, 14 Jun 2024 13:45:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D9B0C2BD10;
	Fri, 14 Jun 2024 13:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718372731;
	bh=mTPEu9ErEKUobSFT0GvxeIBO45KVS7yjsH7xAf+di1k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q7NaJSl8RUVx4k4okd0OK+YPBnvoBcBTYQ7ANwO/ZUbhxiEO2ico06v36O7tDKTn5
	 5bQAMtg9WZ0btOgWdt7kcgoJTsYQKwp5lylHmNTtQKV3xSfc31KXPP8VZRBuKVzw2i
	 ekQtfp8epdKJCj5eH5bqKuacE3DsgI7xfo5C9KrDC2zYGcyXNtuFXuesEqzN9+nbkT
	 pdTXHe0nAHKgoUqM+ORTwj7qfchvXImR4KkA6828+3ZTjXS6DmGXYxw6WAa+Wrv665
	 C7hrTBed0n8fLN0Py/ep+cWWZQYoIZi+NVl9g7RDSp3n/MmL7WFxMeX0osXhYuWMad
	 gJrx6ODIj4hlw==
From: Namhyung Kim <namhyung@kernel.org>
To: acme@kernel.org,
	jolsa@kernel.org,
	adrian.hunter@intel.com,
	irogers@google.com,
	Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/3] tools/perf: Fix the nrcpus in perf bench futex to enable the run when all CPU's are not online
Date: Fri, 14 Jun 2024 06:45:26 -0700
Message-ID: <171837188463.3043419.6370900156954067374.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2.627.g7a2c4fd464-goog
In-Reply-To: <20240607044354.82225-1-atrajeev@linux.vnet.ibm.com>
References: <20240607044354.82225-1-atrajeev@linux.vnet.ibm.com>
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
Cc: maddy@linux.ibm.com, kjain@linux.ibm.com, linux-kernel@vger.kernel.org, akanksha@linux.ibm.com, linux-perf-users@vger.kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 07 Jun 2024 10:13:52 +0530, Athira Rajeev wrote:

> Perf bench futex fails as below when attempted to run on
> on a powerpc system:
> 
>  ./perf bench futex all
>  Running futex/hash benchmark...
> Run summary [PID 626307]: 80 threads, each operating on 1024 [private] futexes for 10 secs.
> 
> [...]

Applied to perf-tools-next after updating the commit log a bit, thanks!

Best regards,
Namhyung
