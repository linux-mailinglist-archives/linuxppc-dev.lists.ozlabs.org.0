Return-Path: <linuxppc-dev+bounces-7804-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFC3A93E40
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Apr 2025 21:29:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZfPvt2TjJz3c5W;
	Sat, 19 Apr 2025 05:29:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745004554;
	cv=none; b=Q1h6zpvaBFvp1wo70/uofpBoTihH60pUu40lvYuWDAVMBpKUO02v2oGYpsvdkeP1ELI3GqiNT5Oo3BTKr8S6/lGomedl5slJ1B4O4Blw02gWyOfI98lekrhXQjAWblHaEvpM48onMe75UvWElK2mUrufbGcHKJFj+UkxLmF7xej0In/AlizNybJub0riX5T+oMI1a+CGxre2fNxjh14wOncMy56oZOEHGt1Fn/kCmyDRwMqYcSpklVGgDPnv6p0g8bI8nTMayUbC2ep8G433bm7UsR0ideVFs6lj1UBa7BanPqD4MW/ebXW8bpMCyoFmd/1aRPI/NECddr9KJn1NGw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745004554; c=relaxed/relaxed;
	bh=RLI5Bu/ypBou7U4Xi6We+HcnndGBzwMXdqmzO5PpVlE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=G2oKtD8B7ZQeA6hJLyU4KzhbKIz60rlhhfHQqfdXmjDj6BiY/J+K1TnxwdIA4dUE/vm5eDfAMstL8fnCvSnT8c8PZjk8BJHrdjT6dtAOJJp0LAvNQTb9bnWHUMEE060bc5b3OoQRTpsOdOBxynYsJSGtsMqKKfNSObB/SpQ21Ktq3vn04CjnlX/VYgXRi02Kb2mfnU9WBH1ghHZlTpbzVlrdptR/bDi7GwZhEoSzRoJLGfMdQDs1fRoHcMKEPb1CpqTDLB+m/b+7mV1MI7hSL1q5LZuCSoZw7Q4PrmsSxzLH7UcDRmArOZhiynNFNgLDNGkv39qzNY2CFDMxMs5ZBQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=p9VN5oZm; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=p9VN5oZm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZfPvq4H6fz3c6q
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Apr 2025 05:29:11 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C74895C4358;
	Fri, 18 Apr 2025 19:26:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 767C0C4CEE2;
	Fri, 18 Apr 2025 19:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745004548;
	bh=HKi4/pkN8/8Z6aYIPs2g1TUo9vd+kfLsVo0FqhGriIg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=p9VN5oZmCcrvD+gNpQJxfGDDYGI6k7h02QBJ3JCYzqftx5tzVGVhWEpT/kpvWOFNX
	 +fzx7aZnQk8yFUTAjI4xKQEgpOMTqFmYJ4sIzuX3rET8a8LEtdPiJjqI5UmfcuSemu
	 VMhO7FWfsjPE5P+zekBdg81Uu14o25pHJy6EFbthrWxCZ+JgEILw6qgcMsGQMXJuDS
	 NDPVUlJNH5pXzpFG6gLPYw0OwyWVnrvKJ9RwC9chuYGsmVVA5sxerCZS4HAaRyMaTT
	 szCt55SCfrUXVeofoDw5rgHGu0GHS6r9f+K7q2evqT6ep+YNg1wYiMBuIW/EF2cwZv
	 1huyIH0NC9b9g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63F47C369AB;
	Fri, 18 Apr 2025 19:29:08 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Subject: [PATCH 0/4] powerpc: Rename wdt@ notes to watchdog@
Date: Fri, 18 Apr 2025 21:28:50 +0200
Message-Id: <20250418-watchdog-v1-0-987ff2046272@posteo.net>
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
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPKnAmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDE0ML3fLEkuSMlPx03ZRkY1MDw6Q0S8OUFCWg8oKi1LTMCrBR0bG1tQA
 7nU6yWgAAAA==
X-Change-ID: 20250418-watchdog-dc3501bf91dd
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745004545; l=1502;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=HKi4/pkN8/8Z6aYIPs2g1TUo9vd+kfLsVo0FqhGriIg=;
 b=NDbbrgw8AjbiooyxPiw4H0nG7A6qJKUbMqvcm1w/C9ntxHUrx41SqIjUsaFelMOBtmYb/HuVY
 W8vmyo8ZfS8B6VwXTkaz7HltxUvh2B3spCh1SMMkvA7YJrbwKDqRg8u
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The watchdog.yaml schema prescribes a node name of "timer" or "watchdog"
rather than the abbreviation "wdt". This series fixes the node name
across arch/powerpc/boot/dts.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
J. Neuschäfer (4):
      powerpc: 512x: Rename wdt@ node to watchdog@
      powerpc: 83xx: Rename wdt@ nodes to watchdog@
      powerpc: 86xx: Rename wdt@ nodes to watchdog@
      powerpc: p2020: Rename wdt@ nodes to watchdog@

 arch/powerpc/boot/dts/asp834x-redboot.dts | 2 +-
 arch/powerpc/boot/dts/fsl/ge_imp3a.dts    | 4 ++--
 arch/powerpc/boot/dts/fsl/gef_ppc9a.dts   | 4 ++--
 arch/powerpc/boot/dts/fsl/gef_sbc310.dts  | 4 ++--
 arch/powerpc/boot/dts/fsl/gef_sbc610.dts  | 4 ++--
 arch/powerpc/boot/dts/mpc5121.dtsi        | 2 +-
 arch/powerpc/boot/dts/mpc8313erdb.dts     | 2 +-
 arch/powerpc/boot/dts/mpc8315erdb.dts     | 2 +-
 arch/powerpc/boot/dts/mpc832x_rdb.dts     | 2 +-
 arch/powerpc/boot/dts/mpc8349emitx.dts    | 2 +-
 arch/powerpc/boot/dts/mpc8349emitxgp.dts  | 2 +-
 arch/powerpc/boot/dts/mpc836x_rdk.dts     | 2 +-
 arch/powerpc/boot/dts/mpc8377_rdb.dts     | 2 +-
 arch/powerpc/boot/dts/mpc8377_wlan.dts    | 2 +-
 arch/powerpc/boot/dts/mpc8378_rdb.dts     | 2 +-
 arch/powerpc/boot/dts/mpc8379_rdb.dts     | 2 +-
 16 files changed, 20 insertions(+), 20 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250418-watchdog-dc3501bf91dd

Best regards,
-- 
J. Neuschäfer <j.ne@posteo.net>



