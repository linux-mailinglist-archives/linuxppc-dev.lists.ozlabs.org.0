Return-Path: <linuxppc-dev+bounces-14569-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BC3C9C7B4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 02 Dec 2025 18:54:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dLT0r327cz3c3g;
	Wed, 03 Dec 2025 04:54:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764698044;
	cv=none; b=NOhtTrQ9uIRKy7VjlmdKuHoXxKtlZvX7rT2XVpz2c9EMdzeb1A63Yy1zXtZ8xt/1BphWWB5AU0il33hLXGY7gy57WUpZ1A7tEMHwfRWxjL/nfHL6WQlqlUZ3OyFUy1a1RmE6dCUah0kIKSGA1LFxI6yN3b7Zx+FQTgNuOFLde8GbtYLEK3gzDJg/UdVYpFeGoTgTlJNawj/fs3b/2u5NDuIkyEYrvXE84NB9DLj+Z6eRx5F9eNY9PAe/Xm0FFgsaQqr9akj6rMjqQg1Wsc61H+mXAcURncEtpo8ClZDCbHs9JRmNO0/rGnemT9PTL8GBFixW3qzP69wgPIcrxR/c1A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764698044; c=relaxed/relaxed;
	bh=ArdH54XNQQSMEA/uZyfh51or6HUzi00zryN1S4YPMzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m/XF0NYarN++y2jZb9k49uHK6JYk8V4dpCSbwDce6mdUUp3tA5dmhuTh4elhKxj7mui8GRbhkf3rYMOCqq337AAqO4ZSeWMD/K8WvE9qC7/NqrFDVV9Dv9n0zrkOkwHVdeCcBjf7EBVezH5OFXqtBdRj9i+l1FkizawNce/X/+fDpe3d2Zwq5bNZPycWPLcLqMpmOhFQo1v8gxAid+y/qCR6ELV3kvLW9B5DpPmkbe5vq8bwYS6SSDxy6wQareIGB44myInC/1C7F7Iv6H2SKBu+3StFhPm1orvGxSGzWDwI1lqUmESd+/T/7eC8OUAOWXcqJ8ww+Yhwt2LIqHu/lA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SQtteu/1; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SQtteu/1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dLT0q4jSxz3bsQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Dec 2025 04:54:03 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5DC1A60153;
	Tue,  2 Dec 2025 17:54:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03B05C4CEF1;
	Tue,  2 Dec 2025 17:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764698041;
	bh=MnbEul8eE8Nk7RJysZsOQ5ZcsJgBBNqhf3mH/vOULLM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SQtteu/1bR/pxTRx4mkD4G1KoYZ0axowCbctYKOxvKvPbDtMb6FJ0ePY0Y7ZeEcod
	 LcPoxUL2+OsjGntj3QpV5EmwYxkqff7xr3ZfUpc//S0nHOnuAxLkQcOecL87aTTHav
	 XuxIftQJlHkt/5Ng3o8ThL4iz0pZwhINsAbMeaiPRzLGzpODrtdalNMt7j3ooARPN6
	 nrYrJN+x8o8x1XDfMKDXhmM6qmUb3i1r98Ri/rbSml24QdppPpOPoJuNvHHvjltN2K
	 CItgtSlJRrgOykeKat8EWVJ8GUG7ni7fyR6Ehx/wx85C7nzDnGTeSx7Bdkdjdi4PjT
	 /Ip8lRA3r6/zA==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: Ioana Ciornei <ioana.ciornei@nxp.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Christophe Leroy <chleroy@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 0/2] bus: fsl-mc: Convert to bus callbacks
Date: Tue,  2 Dec 2025 18:53:24 +0100
Message-ID: <176469799115.100758.454425540937766742.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1764684327.git.u.kleine-koenig@baylibre.com>
References: <cover.1764684327.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=609; i=chleroy@kernel.org; h=from:subject:message-id; bh=XqpgtdyNrr7SRUlAdl3kxaAz89/GZt2Met6RBSzpkLg=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWTqq0/Pvnd2011nSeHP8XNnru273qO0c9Y04Y7z7xxFF CtX5GjGd5SyMIhxMciKKbIc/8+9a0bXl9T8qbv0YeawMoEMYeDiFICJiPsy/Pe4Z607w89g0WuV 10JnvU+/f7H0/R29oIRQE97w5hP/hR4wMrzvnnXgaZ95fu+jP5Ji5zf4/TU1+bYotktkhciDzRw rIrkA
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Tue, 02 Dec 2025 15:09:18 +0100, Uwe Kleine-König wrote:
> with the eventual objective to drop .probe, .remove and .shutdown from
> struct device_driver convert the fsl-mc bus to use proper bus functions.
> 
> There is no intended change of behaviour.
> 
> Best regards
> Uwe
> 
> [...]

Applied, thanks!

[1/2] bus: fsl-mc: Drop error message in probe function
      commit: 9b0856f4aaa484dcb1228e050ce05b26eded713a
[2/2] bus: fsl-mc: Convert to bus callbacks
      commit: ef980bda574d3a2ebaa297def62f03d2222e6ef3

Best regards,
-- 
Christophe Leroy (CS GROUP) <chleroy@kernel.org>

