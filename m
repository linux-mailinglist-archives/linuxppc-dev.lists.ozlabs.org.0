Return-Path: <linuxppc-dev+bounces-12539-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DCBB96411
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Sep 2025 16:30:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cWMp314XCz2ytV;
	Wed, 24 Sep 2025 00:30:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:5300:60:3a9d::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758633256;
	cv=none; b=nm5RHJgWjq26ULnetxqmX7xb86e7ZHIIuOxsuepcOFHvUtp3XAgQTWQTqYuBgBHUCZIX3YaLZb/JbIMau5TfZJWxEsedVIK8+CrRLO+sSCIZnvJE5ckiodjulejHjVqXfpcpqRrllHK7xBFRnq2ym5k3nUlKl9BmSQXkznheeGEdTj5yK2EvldWmo0is8+ZBJHaiMEBSgEuVeMQPKi0MvRFSQGKBSbXgfPf4vfMgMKUAH64uNex/drIlXGkBy1c/AiiMGwnqGkYtMqFAIVglQn9r4K3hCyf6id4KWMfd3+es2YJpb+PeXnhoLbU/O+/YJEQbx+2KbnBVdN0jwrEN1g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758633256; c=relaxed/relaxed;
	bh=2sItBj+QU9qdXvNcIECQjyDp7nGnsVveQgohkd3EYmM=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:MIME-Version:
	 Content-Type; b=jxSv2orrRlEBmCI2aAxvQItOrtR3yEgpjvUkzJPE7s4YoI27q3L4QdCHiWXWwG+OWpLV80+2mACsNzHycN7jIi2Oi1PgWUzHDsHzGEvWVFuKgmve8BJERz8yq1e5U4nftNdVU6DuNP8/FCdeF5EHbKiWLedB6/y2lPJbAHUqReemcxOqcGQ+ZS95EQeTc3NzzVwntACsUzJ79mcRS2HaWZOvBHcmuYH8/QXfU7di+Ih/joJgzCXUs1fq/UgJ1tstArALawN0E0zmxbvEnVOCT9mEa8w3mcLkfIaZ22YBo+i8GmjXKo2aQuK2CfUfAHsjvD62ndbwsbGaop4OqkKiIg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=tethera.net; dkim=pass (2048-bit key; unprotected) header.d=tethera.net header.i=@tethera.net header.a=rsa-sha256 header.s=2024 header.b=fhY2a8K3; dkim-atps=neutral; spf=pass (client-ip=2607:5300:60:3a9d::1; helo=phubs.tethera.net; envelope-from=david@tethera.net; receiver=lists.ozlabs.org) smtp.mailfrom=tethera.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=tethera.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tethera.net header.i=@tethera.net header.a=rsa-sha256 header.s=2024 header.b=fhY2a8K3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=tethera.net (client-ip=2607:5300:60:3a9d::1; helo=phubs.tethera.net; envelope-from=david@tethera.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 471 seconds by postgrey-1.37 at boromir; Tue, 23 Sep 2025 23:14:14 AEST
Received: from phubs.tethera.net (phubs.tethera.net [IPv6:2607:5300:60:3a9d::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cWL6G0TRxz2yGM
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Sep 2025 23:14:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tethera.net;
 i=@tethera.net; q=dns/txt; s=2024; t=1758632774; h=from : to : cc :
 subject : in-reply-to : date : message-id : mime-version :
 content-type : from; bh=2sItBj+QU9qdXvNcIECQjyDp7nGnsVveQgohkd3EYmM=;
 b=fhY2a8K3+6Pqc7obdcyMoOLs2tg8wCZkGhoAXWA9670cPb67vtaRWP6JtAARfUpFAZs84
 IBx29vHM9Jx0C1WoHSU3HOMtKhfHw5OnrBD+qJSNuOiojlAoGPpdI0n1yFXcRmoPpqvBWqB
 LSjVz2iXNeb1Rls66wn8GHXud1K2QVXMf8Y4NfvWZTcPd9lLXJU0CS5b6+ufgxB7chZsJF+
 6SjHwRsZcTCiego5lqemkQ0b9qFxDqd0YGom6xqLJf6fADTwDxQ3SGawi7Cgsn5CMrpaTPN
 0ljaoj5ya23LZ0i0WKjwBoVlytOr/Jv7PCE/+FUWnn2ho0ZGTF7eooo5zMjA==
Received: from tethera.net (fctnnbsc51w-159-2-211-58.dhcp-dynamic.fibreop.nb.bellaliant.net [159.2.211.58])
	by phubs.tethera.net (Postfix) with ESMTPS id C93D818006D;
	Tue, 23 Sep 2025 10:06:13 -0300 (ADT)
Received: (nullmailer pid 1548093 invoked by uid 1000);
	Tue, 23 Sep 2025 13:06:13 -0000
From: David Bremner <david@tethera.net>
To: devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org
Cc: bhelgaas@google.com, cassel@kernel.org, heiko@sntech.de, krishna.chundru@oss.qualcomm.com, kwilczynski@kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, linux-rockchip@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, lpieralisi@kernel.org, lukas@wunner.de, mahesh@linux.ibm.com, mani@kernel.org, manivannan.sadhasivam@oss.qualcomm.com, oohall@gmail.com, p.zabel@pengutronix.de, robh@kernel.org, wilfred.mallawa@wdc.com, will@kernel.org
Subject: Re: [PATCH v6 0/4] PCI: Add support for resetting the Root Ports in
 a platform specific way
In-Reply-To: <20250715-pci-port-reset-v6-0-6f9cce94e7bb@oss.qualcomm.com>
Date: Tue, 23 Sep 2025 10:06:13 -0300
Message-ID: <87ldm548u2.fsf@tethera.net>
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
Content-Type: text/plain
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


I have been testing this series on the 6.17 pre-releases, lightly
patched by the collabora [1] and mnt-reform [2] teams. I have been testing
on bare hardware, on MNT Research's pocket-reform product. I'm afraid I
can only offer CI level feedback, but in case it helps

1) The series now applies cleanly onto collabora's rockchip-devel branch
2) The resulting kernel boots and runs OK.
3) the resulting kernel still fails the "platform" pm_test [3] with
 "rockchip-dw-pcie a40c00000.pcie: Phy link never came up"

Of course there could be other reasons for (3), I don't know that much
about it.

I'm happy to test a newer version of the series if/when it exists.

d

[1]: https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux.git#rockchip-devel
[2]: https://salsa.debian.org/bremner/collabora-rockchip-3588#reform-patches
[3]: https://www.cs.unb.ca/~bremner/blog/posts/hibernate-pocket-12/

