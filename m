Return-Path: <linuxppc-dev+bounces-3362-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FC79D0386
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Nov 2024 13:25:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xrqhp4MP8z2yFD;
	Sun, 17 Nov 2024 23:25:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731846314;
	cv=none; b=hwOy8Pw5wIfuYahUaXJDEoUCVlGXS2r+w+efcg+z9q+AZqbrRgIlDcvd7yams5myWvkh69lNPqqbH8W/rpdvLcjYhS/fQFGvcZZa7ucbrjwquzQTt8OgaRB6rgqxVhkdu6f1OD2LUodQMl4Fb9bxMpB56HZ+JFUHWt3+QHjwi6r2Lpc4mKCMaSjycQI1HFsEBd6NQugR8iUkUMVDurkwKV6QIqXGtc5990etBiYjDQvm5oT23QJthAOmX8WjnqDftd6z3zXC32ErJMsLEDgosszbBuoOY1m2TG2xMzwE2zLGNTvCVDWsIiAce+vDv2PfA0rHfBozBQguLa0X8RLGgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731846314; c=relaxed/relaxed;
	bh=6YkDsmqGi/hDbdsOuh5XqzzF7DZLsS/qORhMUcP9Eyk=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ivzVpbWnAUMrOE+4Cm0xCapKmwSBzG/zng7l9tJw6AMlnLij62sJRzrxUJ6aO/+0h0VtV7sZINh++A1PQpeR1aYi4ODzx0iKqnC1Oe+djzzmoUJifZm3Keui72+Krp/tQiHvCuLS0iYhZ2JTMbRWMHsLj/nlhBZFtAqaq+upQ9OQrUC8RRckJXq4Iv/bcy5yhaZgUICke+ip1ozje86/ckbPm1Oi1GdJqoVhKDIN+C2MFIzo9HP2bpzNZY/qyIDuPF4tah734s4oRayT2mR8RyDh71mbdN5aWtNtbV5v729c4gPCeZM3KFpvQfojKR3PT0B2n3SL2JXfIgKWiwazLg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=SZ+D9dqR; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=SZ+D9dqR;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xrqhn4cBDz2yM6
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Nov 2024 23:25:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731846310;
	bh=6YkDsmqGi/hDbdsOuh5XqzzF7DZLsS/qORhMUcP9Eyk=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=SZ+D9dqRPFNFDqEnlmPDb73O6ByGIla3lmIAPXvdXd3nk8YJb6Hr9l9dqBbfC5l6n
	 7Q6rqXwRHneHEjiBm02F/ksBc4QEPlnBmdAR496ZnUYRFipt+6HOkfZ12NqlcqU9Rv
	 U74DCDiPZT80b3ckHa0/0YrsQmM3H6Ur+kLrZEfnFzzneQcADOfFdvhamyJPiuiCLy
	 25cCnVWDJSGzpHHRpyQ0CYSqJNa248w06Oz9aECfiavee3m2jUXaaFW6fh8eA6/DYe
	 zJASxwyEHvnOIi+pwj1sC2wAuXOnwFQfp1oTYReNPNSs0f/npgc73LKXIGM3Hikrh4
	 +4x5oUosj/xhw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xrqhk2Yrgz4xD9;
	Sun, 17 Nov 2024 23:25:10 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Ming Lei <ming.lei@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Costa Shulyupin <costa.shul@redhat.com>
In-Reply-To: <20240926092623.399577-2-costa.shul@redhat.com>
References: <20240926092623.399577-2-costa.shul@redhat.com>
Subject: Re: [PATCH v2] powerpc/xive: Use cpumask_intersects()
Message-Id: <173184539764.890800.12646623251156657066.b4-ty@ellerman.id.au>
Date: Sun, 17 Nov 2024 23:09:57 +1100
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

On Thu, 26 Sep 2024 12:26:22 +0300, Costa Shulyupin wrote:
> Replace `cpumask_any_and(a, b) >= nr_cpu_ids`
> with the more readable `!cpumask_intersects(a, b)`.
> 
> Comparison between cpumask_any_and() and cpumask_intersects()
> 
> The cpumask_any_and() function expands using FIND_FIRST_BIT(),
> resulting in a loop that iterates through each bit of the bitmask:
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/xive: Use cpumask_intersects()
      https://git.kernel.org/powerpc/c/6da1cab4f5f8eb778fd61f0eb6ca5b0a011dd44d

cheers

