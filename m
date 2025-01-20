Return-Path: <linuxppc-dev+bounces-5425-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B4365A172AD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jan 2025 19:27:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YcJhk0S5pz305P;
	Tue, 21 Jan 2025 05:27:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737397621;
	cv=none; b=SkaTfv2Pr9W4zLpFyV9K1XjT+rGZYsr8G76IWpH3GGpYsQZT0Gf2z5BOnpRwaSWNTkQi7LghUG7FidD4wUsm2KMDUuucOq/MRWdhMcq42ksehV1HbEe2JNjcnnVyosQ1DRVxQbOjlfxQGJgZ19kbiOvdfUNvSWxKug8dVwsZKIq9MqGxtM+vvPoYZ2f96yBwYT5QqpZ4kpEI4Ih/4wDQqeJRdhggJ9nlIXBBvVVDaySMz8B4LrKxfTntaFijunmsdcoOiV0zobodNOXJuSzQihEyC9AR+8hbSxeOeoOm7fDzEAmv2pxp54xkM0DxrJoBX3y2ZuOUUS+VgcsbkD1WFA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737397621; c=relaxed/relaxed;
	bh=sFS1Wen+ORvk3OHr3TFsRC9dAs5hXsL3v2o+QsjhikE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Y28EXX4L3fmt2ktKMiPB5u/TVRP4bdGkDHVNXbo8R6vjab65Zxs3uPpYkzBTTYT7SG83Ip3OYFE2H1RLREFTxECqY2UWdC4AZvRodDurQBrve9PGN13Z6ulLUZp64QbiKxhYhtM9c1a8b7xaivLWyL/p+/rcMTMmW74sn5LQmJzjWPGOqefHcbLwvVyQtSyMWixuTE9Nv8Wg1KB8BLR9n9xCdW3ZMWdK8WRNv0DRbLchf7YWPD9rcbrj2XSYm4Nb5jo0QDAR2WVKYRhOs1V7vQ1IukPIw2vq0Qz8pk4G3zL3mr+Do2EjHO3CqVlI0bY/uwvFtLIzbfcRglxFYWXkTw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CR8a9K2U; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CR8a9K2U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YcJhf5t5Mz2xjQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2025 05:26:58 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1796CA4132B;
	Mon, 20 Jan 2025 18:25:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B15F0C4CEDD;
	Mon, 20 Jan 2025 18:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737397614;
	bh=3Ec0q/3tdObVXJBG60rzWCKvQBWmVLyUV9dr8jd55QA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CR8a9K2U2l/ty+sYOWLjiAlBF/YGotue1UZg5v7EN7AMmaJiK1WLbM/kH8eTGIpCU
	 UTcGHEi+cXR/Ebmg2s/9irOnRy1lP8GxzJ4Q8uJrJsh0HX+hIPXiFDfNYYttGXHTcx
	 4BYRvvvq1r5DCx4dY8rqRneRZxtxAlrXLCQPmKIfY3L5pIu1EvFQsrtN/wmmSFQo5A
	 MOFMl/UVEtPKT81uNZtBytYDujFkCM54cQa5B/zPZ1XQAIS0+LHiRMlyjb/K7iUQ3p
	 Eu8TcLalG5WAQ/x0mODE4ebVqk4AfaFG7HMRJ2W1E+NjcwWEeIRT8KtsXbl/Yk1H+X
	 qlwvOyVlZw6Rg==
From: Namhyung Kim <namhyung@kernel.org>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com, 
 irogers@google.com, ravi.bangoria@amd.com, 
 Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Cc: linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 maddy@linux.ibm.com, kjain@linux.ibm.com, disgoel@linux.vnet.ibm.com, 
 hbathini@linux.ibm.com, Tejas Manhas <Tejas.Manhas1@ibm.com>
In-Reply-To: <20250110094620.94976-1-atrajeev@linux.vnet.ibm.com>
References: <20250110094620.94976-1-atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH] tools/perf/tests: Update event_groups test to use
 instructions as one of the sibling event for hw type
Message-Id: <173739761368.3950752.17907962905280799459.b4-ty@kernel.org>
Date: Mon, 20 Jan 2025 10:26:53 -0800
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
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, 10 Jan 2025 15:16:20 +0530, Athira Rajeev wrote:

> In some of the powerpc platforms, event group testcase fails as below:
> 
>    # perf test -v 'Event groups'
>    69: Event groups                                                    :
>    --- start ---
>    test child forked, pid 9765
>    Using CPUID 0x00820200
>    Using hv_24x7 for uncore pmu event
>    0x0 0x0, 0x0 0x0, 0x0 0x0: Fail
>    0x0 0x0, 0x0 0x0, 0x1 0x3: Pass
> 
> [...]

Applied to perf-tools-next, thanks!

Best regards,
Namhyung


