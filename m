Return-Path: <linuxppc-dev+bounces-15357-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE4FCFC6E4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 07 Jan 2026 08:44:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dmKmt4yPDz2yGQ;
	Wed, 07 Jan 2026 18:44:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767771870;
	cv=none; b=EzImQXVHO82pVFVpFHlqVHPKMusdltTig5AdRgzxZuVzrsTaSug+anl5rexgepH6XF4TeEes3+zbsDFLcuFSyHn53fx88IXFoDIpUKkucJNiICg4lcTiivungfJTVid17AW8gXRxW3lnodGbiZGaPJ+LyYjeURchaFCwtPDg3f86vF8WTCKca7ZOFLbUQTWRcbptaZsAWK/2SyRrvnH+RK3ALj+BcFRFoTxUI9lk/rNQclBeAOu9lKQBg5DGks+J5ni+iHrNugXMYTRyjZBfN5rzzE/+ARQvJNPGfKx09dFp7FA5yPnEP/D3vCYlkk3q29GrKoEkNvfwLhVxIwge7A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767771870; c=relaxed/relaxed;
	bh=g1RYmT08G8K8Ydd9n9w9DLDjdom5NdBubPWt3QgCxSs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dXFLykQ92MCaJMpaP7mt2xKRSiAutuST3Zcv0h4nuLmIHGaT8QEGL5uBtlPnVqWCbtyAhrpsaqSYMHne2pIO6HtmDrwSFBq41CtkB7auOk1hJ29WK+OFHhsYn8b6mCAiX2L8KKbSIjiMJwU8u/JZeIrqni+I4ZHP8bqaOCm89t0wI6QWPA2dZLUxPKrvwNdDwJADWSIc/63D6Nw5/O8GKDvFynFILAZ+3pYqNJh4R4qnguNYxoKFV5NDf8zgjkD2zHdVe5eQmF//tlrnzz3q2lGxWHisrOIKN9T05+QHxkFFZ7VMsTm0Md1NkSj5JyhO4VOw9N0+hV9hrn5bc4QF+w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fgSc0Lle; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fgSc0Lle;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmKmt0XRvz2xbQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jan 2026 18:44:29 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AC6F160007;
	Wed,  7 Jan 2026 07:44:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32F2CC19421;
	Wed,  7 Jan 2026 07:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767771867;
	bh=sJ6UFNhgdxznEaPlaWVQBro0xL6d8TpL3PTMM/QEoas=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fgSc0LleW1+4ixYN+EkKOwPYZlY5CH3OyFyjgM6BuNcG6MdnmufiI7IjfZxtmeA6g
	 6QAvMAbrDP96FQEvvKvfcHUk16ojSpSMSUezysNBFdKNx8qTZvhENyhs+pOdnEgigz
	 r3a5Z2mh8pFBUce7WHW2U47brDllUi4Qnwf8hD/io15MtcLq1R2L0bGS9wezMzEAjx
	 00kAmSc6Jkmvos8eozilHT+em7NxGnXAsfPeOoqH7ez6TryDIC9gYnM5SBqWzDOagp
	 2EO9a6Wy4+ZA958KSVY9BgvJGIpRkqWPOd0hKRRwff7EmAOPLe3nk8k3q6VGMwgwR5
	 wT7rSufiAim8w==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: ioana.ciornei@nxp.com,
	Gui-Dong Han <hanguidong02@gmail.com>
Cc: Christophe Leroy <chleroy@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] bus: fsl-mc: fix use-after-free in driver_override_show()
Date: Wed,  7 Jan 2026 08:41:51 +0100
Message-ID: <176777167465.2143957.13769286595533147394.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251202174438.12658-1-hanguidong02@gmail.com>
References: <20251202174438.12658-1-hanguidong02@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=668; i=chleroy@kernel.org; h=from:subject:message-id; bh=iZF3c2s/gwLPk+6gtKcn3ZoWh+VlN+vu0LbNBwJXh5I=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWTG8Tk0v5mkmnZl3UEXw1Mh7FJcwlynXj7qbFIrWbqsz 9gy4OqujlIWBjEuBlkxRZbj/7l3zej6kpo/dZc+zBxWJpAhDFycAjCRpUsZGdrDTuusjjk6Re7G mdKVXckp05e7vkx6ur4ynOcUT33/mgcM/7OTJ/BGrJxh5LT30nmtnjcuu/Z/36a2Qpbdtt5/O/N bdnYA
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Wed, 03 Dec 2025 01:44:38 +0800, Gui-Dong Han wrote:
> The driver_override_show() function reads the driver_override string
> without holding the device_lock. However, driver_override_store() uses
> driver_set_override(), which modifies and frees the string while holding
> the device_lock.
> 
> This can result in a concurrent use-after-free if the string is freed
> by the store function while being read by the show function.
> 
> [...]

Applied, thanks!

[1/1] bus: fsl-mc: fix use-after-free in driver_override_show()
      commit: 148891e95014b5dc5878acefa57f1940c281c431

Best regards,
-- 
Christophe Leroy (CS GROUP) <chleroy@kernel.org>

