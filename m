Return-Path: <linuxppc-dev+bounces-7017-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B89A60378
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Mar 2025 22:36:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDLQd1XGfz30Tm;
	Fri, 14 Mar 2025 08:35:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741901753;
	cv=none; b=QtlQUnmIUqLqElGmQJQewCoC+fU3Ar270Gna7wati3CkeBSe4+A1ma3MEFvyx3kPSjC3UIVq1QYnnUKbqBAuC/k4z0ZJe6RU6M5lCoJc0TUicasLI6IeWC2q5YQngX2WWPc5gj1yZTT62Rk0FWznZlsADtu/mmplycf602VvIOyhbgAu3p2IYJWFOUZ3VFFA7+4JvOcVTKY8ohYjOZUaP7X1y3FUxQGwKoPNKW6be5IYSVzkxHRhmSmKjw78LezOg+AjmffnGUGp+NVMYiY7pYjb+/Jwh73IE2EIPm7JsB/6aPsBj+EDDnEvoc0w4+q6l0HfPV3u34zPKkT6IvN1WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741901753; c=relaxed/relaxed;
	bh=r7+96Dla31AVWZ6PWAMx4zWlTCgVkXinkXohN7qWNig=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WUrmIG7moa1rT/WohRQmGnp5nVQeKUUjqjHq4Oh5iUjd1xZnJtnMS5D2LNJL9lg1+1BT2aaq2XaeYP2KGVs9Hn1iTIp3u8BjAHgo9b4Kc2tI5cmtsFj3TafznK+18gGX7TZhGRSprWiEbGz/ivIsbV4vhL9uIZey1OKb7ujVwiLS8GPT0BoHOu6V++haPBQ9+hQqicHOgXKldxXZ3b6p2q86CV43TSP30Kw0kiWMGeb9hoJq4t69veR12ijIYZX8XnjM20sCJD4XsLueYZQTgOl3hnZyWpvZcj+aLrYxoKSZrKVAYMxpeZpJ3ykeACT7t7exuzD7rfo337mtl4DJrQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UGMGL3X9; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UGMGL3X9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZDLQb4FkHz30Vl
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 08:35:51 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B51C9A48744;
	Thu, 13 Mar 2025 21:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2F786C4CEDD;
	Thu, 13 Mar 2025 21:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741901747;
	bh=QXdqznCl6zlXKgo7A3qnzu5GYl6y2ulHGCxl1/kb/sM=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=UGMGL3X9r+/+B7Ki1dz7aIIx3BVj6/jw9e3hQejj2HY56lhR90Ei9eMd2ExJnuVl4
	 nhzlqoKVI4s14JjbEOFjHBXKkMxkXm7ztnSIM6zmtw/B/MM017gC+4IJzAvblOZBvg
	 jcPEwT1Gbo5rA9ZOdDQ2rUIE43QDYeqnt+XTQlja/Ae/LwDdtpkj8dojIZeVJLC/Xz
	 fdg5No0SHcndQ9rhJAKCS7lL72cMqE42jrWkP4rzaInu0VF8qHkcJNKl1mmdZNlfjY
	 Fu0shyD2k9+c7DxeVA4OdeTT2ds+GRTACXc1yIcWHX5XPj1WUgZ4CD8s4nCQxb7gAU
	 Hrb0QHhHUK7LQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E5D2C282DE;
	Thu, 13 Mar 2025 21:35:47 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Subject: [PATCH v4 0/4] Freescale Enhanced Local Bus Controller (eLBC)
 binding YAML conversion
Date: Thu, 13 Mar 2025 22:35:43 +0100
Message-Id: <20250313-ppcyaml-elbc-v4-0-55903722d9ea@posteo.net>
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
X-B4-Tracking: v=1; b=H4sIAK9P02cC/1XMTQ7CIBCG4as0sxZDoVXqynuYLviZWpJaCBBi0
 3B3sYkLl+9MvmeHiMFihFuzQ8Bso3Vrje7UgJ7l+kRiTW1glPWUMUq815t8LQQXpYlSoh+6dlL
 1CXXiA072fXCPsfZsY3JhO/TMv9cfdPmHMieUyIGiubZGCi7u3sWE7rxigrGU8gF6bWhZqQAAA
 A==
X-Change-ID: 20250220-ppcyaml-elbc-bb85941fb250
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Crystal Wood <oss@buserror.net>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741901745; l=2006;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=QXdqznCl6zlXKgo7A3qnzu5GYl6y2ulHGCxl1/kb/sM=;
 b=J/Kgwixg8aMdL6wWzPE1z788ocud2C9oulADJ11L1/1i6gab2H/myIHxU679xZWjMAKxfa4mZ
 mc8dKDOOrNbBF0PZBjh7Pbrdg+VriwAxg4w5LMKXlA9m2IyQfvgVzuB
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

This series converts the fsl,elbc binding to YAML and adds new bindings
for related devices (particular kinds of chip on the eLBC).

For readability, the existing unit address syntax of <cs>,<offset>
(e.g. nand@1,0) is kept. This results in a few dtc validation warnings,
when combined with other choices in this patchset:

- For compatibility with existing kernels which don't explicitly probe
  under an eLBC controller, the "simple-bus" compatible string is kept
  on eLBC controller nodes. The validation logic requires a linear unit
  address, though (e.g. @100000000 instead of @1,0)

The patches in this series were previously part of the following series,
which turned out to be too large and unwieldy:
[PATCH v2 00/12] YAML conversion of several Freescale/PowerPC DT bindings
https://lore.kernel.org/lkml/20250207-ppcyaml-v2-0-8137b0c42526@posteo.net/

Changelogs are present in the individual patches.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
Changes in v4:
- Reintroduce patch "dt-bindings: mtd: raw-nand-chip: Relax node name pattern"
- Link to v3: https://lore.kernel.org/r/20250226-ppcyaml-elbc-v3-0-a90ed71da838@posteo.net

---
J. Neuschäfer (4):
      dt-bindings: mtd: raw-nand-chip: Relax node name pattern
      dt-bindings: memory-controllers: Add fsl,elbc-gpcm-uio
      dt-bindings: nand: Add fsl,elbc-fcm-nand
      dt-bindings: memory-controllers: Convert fsl,elbc to YAML

 .../memory-controllers/fsl,elbc-gpcm-uio.yaml      |  59 ++++++++
 .../bindings/memory-controllers/fsl,elbc.yaml      | 158 +++++++++++++++++++++
 .../devicetree/bindings/mtd/fsl,elbc-fcm-nand.yaml |  68 +++++++++
 .../devicetree/bindings/mtd/raw-nand-chip.yaml     |   2 +-
 .../devicetree/bindings/powerpc/fsl/lbc.txt        |  43 ------
 5 files changed, 286 insertions(+), 44 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250220-ppcyaml-elbc-bb85941fb250

Best regards,
-- 
J. Neuschäfer <j.ne@posteo.net>



