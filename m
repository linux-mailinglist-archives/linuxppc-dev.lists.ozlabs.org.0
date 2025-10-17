Return-Path: <linuxppc-dev+bounces-13025-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50731BEB2E1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Oct 2025 20:17:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cpCj40Nj4z3cYN;
	Sat, 18 Oct 2025 05:17:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=23.155.224.40
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760725047;
	cv=none; b=XYkpIASsDDCcrdVYI/Bnu4mauVa8uMT1vI7VTYuKw2kgv2U35LcVL49S29UVv8NVBcWTpxHwY2VTEz/64g6Y9VfDofmlSNtps6UqqDluZ04LSv/Idvy7AGml9nBCNRWb0jZqudYEfBVB60OurU5TFFMB8DtxtyD8CwZ55jHJV9srDg4Dh3uMi/Gdz/lUoRPWkomeTUGw83KCwO+XoPNXTpaNEBIcHnqXMrY+rmb65PypmgNXSLVYZhFFG+MhqdPPmqmWhz1vpPT7N5QGV23i0UmM2Ak1BwWs0ObnIdIivxVdwj9cKSVe+CEtHqJUedj/f+ug5MJuAJzyQ+KAoPVVGg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760725047; c=relaxed/relaxed;
	bh=se5pumbE7LfZQm71qX4ZoJSvxothcAr5G9BqzJGj0bw=;
	h=Date:From:To:Cc:Message-ID:Subject:MIME-Version:Content-Type; b=mbKgkqVmkKiSTZRgW4bbPV6J601Px5uXSu8G60wJ5j9oJF8agtGBBgrh1PlzVhO4orzAsJGUeRIgoBJqjgvBM4ehzP/i1NR0AgVlbqPP09+aIQWXWhN7CRWG7bbXNwHfM5JHpoO6nWugXxhGvmrm0KZRDDZYKt0HyJUxy2zFzrMxg92zuThdOFbFKRbzDE3UuHjFvf96tbT60owOX39RgpcR1enUVhZfJWgliB2HhWZQlOBRDfDgZjjoeq1FwpPcUpRt+/DS2NRr6KhO34aDef44jnCTX+cyLehQpanqhcyKd7yHkiiUlyfq8rtJQzdaCABMnZUeGh9R7eYJ0SMeLQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com; dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=Qj+FF1UI; dkim-atps=neutral; spf=pass (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org) smtp.mailfrom=raptorengineering.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=Qj+FF1UI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org)
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cpCj13pbKz3cYG
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Oct 2025 05:17:25 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 7917982890D1;
	Fri, 17 Oct 2025 13:17:20 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id FcD0k_DUdE2r; Fri, 17 Oct 2025 13:17:18 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 55845828916C;
	Fri, 17 Oct 2025 13:17:18 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 55845828916C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1760725038; bh=se5pumbE7LfZQm71qX4ZoJSvxothcAr5G9BqzJGj0bw=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=Qj+FF1UIWjj0F0pXJoNmCl4RlMyCGJfPOPJni4ce4PzDG1mCY85B75fAC1uYatXeH
	 N1n/CKM/TmTv+7OvffeItUumNJWvQQMYhYjtc+eTy8v9ugreujSVG9z/aR1NY7DIKd
	 QWr0sb9/uC0n0Xjk5/OA8Dtwnnziue9AaCGIHfeU=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id BQ_nKUrx8PIy; Fri, 17 Oct 2025 13:17:16 -0500 (CDT)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 12A5082890D1;
	Fri, 17 Oct 2025 13:17:16 -0500 (CDT)
Date: Fri, 17 Oct 2025 13:17:15 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Dave Airlie <airlied@redhat.com>
Cc: dri-devel@lists.freedesktop.org, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Message-ID: <407388289.1798972.1760725035958.JavaMail.zimbra@raptorengineeringinc.com>
Subject: [PATCH 0/2] Fix AST2500 graphics on ppc64 systems in big-endian
 mode
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
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC141 (Linux)/8.5.0_GA_3042)
Thread-Index: LUG2F4YDIH+Na1U3fGLanAwWnSRh1g==
Thread-Topic: Fix AST2500 graphics on ppc64 systems in big-endian mode
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On ppc64 systems that use the AST2500 graphics device, such as the Blackbird
POWER9 system, the red and blue channels are inverted when the host is running
in big endian mode.  This is due to a ppc64 hardware quirk, which when combined
with a hardware design fault in the AST2500 VGA controller results in a need
to use software-based red-blue channel swapping.

Tested to fix color graphics on Debian sid/ppc64 on a Blackbird system.

Timothy Pearson (2):
  PCI: Add CONFIG_PCI_ARCH_ENDIAN_AUTOSWAP
  drm/ast: Fix framebuffer color swapping on ppc64 systems

 arch/powerpc/Kconfig           |  1 +
 drivers/gpu/drm/ast/ast_mode.c | 33 +++++++++++++++++++++++++++++++--
 drivers/pci/Kconfig            |  4 ++++
 3 files changed, 36 insertions(+), 2 deletions(-)

-- 
2.51.0

