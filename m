Return-Path: <linuxppc-dev+bounces-14782-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B1455CBF585
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Dec 2025 19:05:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dVSd43RT8z2yFK;
	Tue, 16 Dec 2025 05:04:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765821880;
	cv=none; b=RQZ/q4ALP4cPuLiZh3bvCB51DhU4st4xVqsBB5OA7yin4ysrwniGbGYENfitQg1hjm+6oa0nZ46U/SHUZBP+Z6mfj6467J+cee0s2/gVx+BBEYliWWMInIDU5lM/et9NkY5WuLoinj4r4C+MPf/exWtreDAQ1BDPJlH+mbBoOLqWRi0F/c5LidknT1uNsiU/FujP0MtEALwFMoYxgXFgTjeflsw+7Tn3CUuebt1hNnAX0hv+4vIgLDYAyKv0q/LLJ9lxqgm6sQy0xLhL/AyFOx28VlbeZ3hSsrpFIkiiU48U1J75W7gOJ/t/3f1K54csOUAdbr4X2r5eHYO2sDTZnA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765821880; c=relaxed/relaxed;
	bh=vCyKOJ0s9R+Ezn7e8Cf4mqC1e80MQeSF9lqCDNjyUQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=guo0OWJFzb0aMro/1qbUlNiGb+inHHNdQipWRdoRTI5K5xeWFR9CEbM47udq5wgz1DiqvGmo8VXiqlTS/wEmS3pYzbll5Go5jKSH0gsEohDjyf+rnd1JlLmasfMAkzQ7bF7C3XEWyVHdL6fMrvDvwLfo0Q/+AF6z/OoKfc6KFP4yoPqlLHSq78+X1BaVwpJcEVTLGLl2sVenUCZ/bGAku8v/Sq5xvWtfGjHPwswrkiUUO0zxZLMDBEKW/LhBraJTch/EAoaQWy47dmPydeW1qt3ouQN1yBup5IQHZEw/91fRWvZHOyYZYOHbRBf1qrq9tORm+DiJ3Cfnyodrl25muQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GtoU2Y3K; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GtoU2Y3K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dVSd33ZZFz2xqL
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Dec 2025 05:04:39 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9557443472;
	Mon, 15 Dec 2025 18:04:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75C66C116B1;
	Mon, 15 Dec 2025 18:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765821877;
	bh=4YcucuPuvCR+ivb2HpxjHrdooGeTBvWWTq7RYUu9cgk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GtoU2Y3KsrGUh9VpQYaGPHvKWpxujATZVgeH2gbuNLmRgrho9eyTRCKwiioQtewoq
	 c7kvNCOl8PtMsiqu/L1iBSI2JHO7pU2cKj7n6aI7pIiV8jfxf7CegNiWlIh9F+GRX7
	 VKwNAUIWhzSppoTtX2d2pov6Wtkxde+w2p21wqi/AJfdTKoOU6VRU3BpEsP7iGVHyX
	 sH/l9Cx+f+y44m4JCn48rSrMxDxna/PWAf0j40uZijpOHdWGGkdUX47sJZlndGnCq/
	 YODKDnO7NtsMOEm5enWzbaqHjCeSJ/FbFCCUjGtE//79oqfhlQC1JTdIK836H8Bj8T
	 Ddjeax26Dzo0Q==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: Ioana Ciornei <ioana.ciornei@nxp.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Christophe Leroy <chleroy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: fsl-mc: Cope for unbound devices in fsl_mc_shutdown
Date: Mon, 15 Dec 2025 19:04:20 +0100
Message-ID: <176582180074.2195007.7728874790291191821.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251209115950.3382308-2-u.kleine-koenig@baylibre.com>
References: <20251209115950.3382308-2-u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=443; i=chleroy@kernel.org; h=from:subject:message-id; bh=m2J5UEklNw2W3tazS3NNq1xPGZoApfz1lQrcIWOVJY4=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWQ6+C7drKq6wvfjXNVf4Y+2uacfmf97XvrG6m1qcgUsl ucO2SzV6yhlYRDjYpAVU2Q5/p9714yuL6n5U3fpw8xhZQIZwsDFKQATEepl+F/gd+LKWiHDGm3v 5mjmxYLN2y3LNfO5GT/mKGvt1fqdKMPwT5lr5vxgjmV5aZpNj3+5OO+bp77QcvPK2+Gsiz2FvtQ 0sQEA
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Tue, 09 Dec 2025 12:59:47 +0100, Uwe Kleine-König wrote:
> Other than a driver's shutdown callback the bus shutdown callback is
> also called for unbound drivers. So check for the device being bound
> before following the pointer to its driver.
> 
> 

Applied, thanks!

[1/1] bus: fsl-mc: Cope for unbound devices in fsl_mc_shutdown
      (no commit info)

Best regards,
-- 
Christophe Leroy (CS GROUP) <chleroy@kernel.org>

