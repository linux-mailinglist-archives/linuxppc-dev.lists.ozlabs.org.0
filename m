Return-Path: <linuxppc-dev+bounces-15358-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBA4CFC6ED
	for <lists+linuxppc-dev@lfdr.de>; Wed, 07 Jan 2026 08:45:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dmKnV3gCtz2yHB;
	Wed, 07 Jan 2026 18:45:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767771902;
	cv=none; b=nVo5GNaRZGMjNOQ53AvAFsDF4ywLD6nVMFITnHDeqgv4EH77ejF1r77mmYcv8ZxaBzVpXrj6x5osGFB3hj/8iUl60SSjHFrdcwBmLgDrxLqx55tmssCcfzHxmhLGEnAy2NRuYxw4iXJPwNr58pq56o9ajYNNNw9yt8MFFaJUllH9t2hvo1nUJZUh6I3rpEw3GVseQYHbNdb5OL0JqCIKBDXkIhhJAssJGMB6ietmdVaxUqzBFgwecXFlfDfwk+Lhq/Lm154T0NWyBBwCGmbFrZv9Aslqr0jMgPWamT3BAIhK/Cu1ydiv65rWNquydnW264mp3R1m3pgcB9+poll7YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767771902; c=relaxed/relaxed;
	bh=7led787e+i2vaUrT8azQ6vTdLjYtlmX3vdFDoIZF9nM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dWMs0610soQobcPz2kFB+QAKcqSEhcZKPq48WUrgM9pZyh9MfKzMvJGO9xzRAup5oyTmJGmGnvDEANzhuPq60LEvbvCZcCWkf71NLZqh+/dDvMmwgFyzPy/hmUcBhG3bKlGEBAzN6gCM+wNHM4c1z5/Vdlx37Eeirwl8zooobRHb7OesvAGYAYcbYgY7s5cMTYBx6wld2+ZO2vuUEuVn79WcZTzGBm4Pqg5KEllvgqXZqdsILs1iY/qjnybex8KkQsylHUH4UVKlu2PfAPRmQaYnZ1x/k1H8uSOk2dSkpqyZCSOYgriMSFcyAqhEk6j4q3LiEQULh5FteuvvQawjjw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QE+G7R1l; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QE+G7R1l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmKnT5YX7z2yGQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jan 2026 18:45:01 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 338C844082;
	Wed,  7 Jan 2026 07:44:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE5C8C19422;
	Wed,  7 Jan 2026 07:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767771870;
	bh=h4Km8v2AhofaUc/W5nIkW152feKKqdxJCoedk4XoDOQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QE+G7R1lUiBUQxxaWL+qLZItDP8TmCGLohvtgFhJLQ+ufUxk0ODDxKwnoEjveZJp6
	 Q7aX3kI7BgXawDTFUQjfAbGhMZr0mC0vi4o6hLsgQIONztbGLE2nGyeBWV65pGQF3L
	 Ow+V9OmhNIP1C7NN+nuHljlSg1ISmrdznvA0zBnXxwYahq1xVfwkrDQg6aBbVNJrN3
	 RJ9AK9Be+JuO5I2LmCJAveF93NkQEUX8jJ0elBfcHJ+etlbFbwXcMXxJuvcfNBiDlG
	 wmS9grbJSnurgmfwXcNDhB+7IYdKueREBvq3qu2W8G9mKPn0Ahmh329PyFn6TLJslD
	 vX9nRLqjwxIRQ==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Christophe Leroy <chleroy@kernel.org>
Subject: Re: [PATCH] soc: fsl: qe: Simplify with scoped for each OF child loop
Date: Wed,  7 Jan 2026 08:41:52 +0100
Message-ID: <176777167466.2143957.10187953098162634507.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260102124754.64122-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102124754.64122-2-krzysztof.kozlowski@oss.qualcomm.com>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=379; i=chleroy@kernel.org; h=from:subject:message-id; bh=UPZwj16OmC2X1hC/O9OcQ9FKR5YSJ2CGmCS1YrmwU5o=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWTG8fmo3O7nvLam/o37j9guxYjue8vNe9V5Vh9MCQ9z2 zWzZfqmjlIWBjEuBlkxRZbj/7l3zej6kpo/dZc+zBxWJpAhDFycAjARuZ8M/2zF73LVylnXVOqc XvLqyuYdaotbqvYJyiVXzIiSvcCgl8rwV/T6rwm+G9+LPNGcfvTWZKXkJ9ULkjf2SJ3nkP4p/69 mJgcA
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Fri, 02 Jan 2026 13:47:55 +0100, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> 

Applied, thanks!

[1/1] soc: fsl: qe: Simplify with scoped for each OF child loop
      commit: 66a4ff38d7b213a1278840a754c6d357e7745b24

Best regards,
-- 
Christophe Leroy (CS GROUP) <chleroy@kernel.org>

