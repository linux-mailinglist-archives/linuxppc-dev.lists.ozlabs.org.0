Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B77319127EF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 16:36:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VmXARohn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W5KfS2Vv7z3cXT
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jun 2024 00:36:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VmXARohn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W5Kdl0MkHz30T0
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jun 2024 00:35:23 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7C92161C21;
	Fri, 21 Jun 2024 14:35:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5EB3C2BBFC;
	Fri, 21 Jun 2024 14:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718980521;
	bh=bacV9qUz1S8RFon+sqH650IT1ishlSaDQ291gdu4JQE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VmXARohnjZhs6FfkbLGT2X9/8dihi2sfBpFQWgW4BDyRKFzLufeXMWFWB15SZ89n0
	 fA2aHtOAsy9HzVtn6IGgk/oSe80J6C8/h/vkueq07wAKvo5VCAVDCq6J7ZdG24mNKI
	 PLZCb6RhP2YAwT+Iqo24rR2Jm8jNuoVSd+qezkYsGMdOw/uTaPUhZOID+PAmBPB306
	 B74RBOze1WQgWDbry0MyFoL4ffcpGJNIizfsFKBRCTcJaYn7rvyhFnrAY7YfOvmiSh
	 5T6Tgc0bfpHp1B0c1KdGY7pnAR7w7FjhJrpWSZR8dp4SsyhQPFvthNxa+A3U/26/b9
	 Ja8qml6P6uMNA==
From: Namhyung Kim <namhyung@kernel.org>
To: acme@kernel.org,
	jolsa@kernel.org,
	adrian.hunter@intel.com,
	irogers@google.com,
	Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH] tools/perf: Handle perftool-testsuite_probe testcases fail when kernel debuginfo is not present
Date: Fri, 21 Jun 2024 07:35:13 -0700
Message-ID: <171898041590.3877092.8139322744366715128.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2.741.gdbec12cfda-goog
In-Reply-To: <20240617122121.7484-1-atrajeev@linux.vnet.ibm.com>
References: <20240617122121.7484-1-atrajeev@linux.vnet.ibm.com>
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

On Mon, 17 Jun 2024 17:51:21 +0530, Athira Rajeev wrote:

> Running "perftool-testsuite_probe" fails as below:
> 
> 	./perf test -v "perftool-testsuite_probe"
> 	83: perftool-testsuite_probe  : FAILED
> 
> There are three fails:
> 
> [...]

Applied to perf-tools-next, thanks!

Best regards,
Namhyung
