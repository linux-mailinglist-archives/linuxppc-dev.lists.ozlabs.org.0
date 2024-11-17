Return-Path: <linuxppc-dev+bounces-3370-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CE49D0394
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Nov 2024 13:26:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xrqj34CwCz3bgx;
	Sun, 17 Nov 2024 23:25:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731846327;
	cv=none; b=khpBgoFYOBe9XvlBCU0rxk0ue0ArnQsfqUaqertL0i9FLuu30Dxg9y9XzsfwgDRDRzNbHOZh6pZfD8R2dyTOQr7kuDSSzGE3oIDKZd7l96KXxjfSYAhVG9NcmMZCNLvDtcyUK2aHVesyKHBHgavcwHbMiS9xOAQItfX2uT1LLwFp/XzUfCIq4sGVRcX04D/ROTZRTb89LEdCyu5a7zFyP139h3pERI9MirCB1jcbIDy05jAF1mlUXWEApFqihRX50xDFLVRVyfxWXtZUfCuoh/UTcBAESP4ZSWFUjO/OIOZSrxYX2hsxeem353ZI1pPkOz0Es7tDTzvc/I5EU4zXiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731846327; c=relaxed/relaxed;
	bh=qEN0Kwz7qB+tHJIFoBnHGZnsWkjyVi0fv3pOXXkbJ4A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jThYwGGs62hFVYdp1D3CHl38hjh6zsSl+yZgK6AVybhscfuTCkZT1yJFbh7/c2ABxmaPosbRb6cHTnFCmiREps2M3wl8e2j6XkLx2sz8OleEUUc94nFOYhKeYl4RiY/F8+8YnzFG7clGFZVf76O2ie+BuUtIiMal5G7KgvzcGRor/gpbxl+x1qCn3afcClsTOAEYbtMmeGmYMnjzSLlwRS+4bgMtXsu0u6IjrD0cUjRcAWEV8sRIbEvOqci3+bDLa/2FejukqHylvJnTrtYyE0P0E8N1KEERk2bAY4bDG36JNeaUyMTXyTr/ml5/9jr8cQoy2tWYG+LFcrWkc/QHdw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=cYKSUioy; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=cYKSUioy;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xrqj31HRhz3bfB
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Nov 2024 23:25:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731846324;
	bh=qEN0Kwz7qB+tHJIFoBnHGZnsWkjyVi0fv3pOXXkbJ4A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cYKSUioycv3kazqMia0kRCu1mC2T3aI4KdTicIV/2W1oKwKPEVW+okcxOW4xrj91D
	 COm+slZWPPTET2a7yJV2R9Q0Xp8uvlV1CqQ9Q+bnuWbCC8nc/rJmHc1eO4O4RAzlaH
	 UxDigqpCaKP4lWGFussuMuM6hHw53Bxb0kJJVdccjs80M3vLEghPdbkwLcdLYx0eG4
	 wPlcbrD9AYZxYVzgsxbDprDwga89bXqip+Qv8yc9rqcAkFROxhsogS02vMUVZ+7gK3
	 +07l7ro2WA/WTBNKIFcvDTOZNQsXRbdhH/BRBTegDBS5My9SzAJgdGMjLSWDq3jWAm
	 XyrTs+eMBL1Rg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xrqhz3M4hz4xdg;
	Sun, 17 Nov 2024 23:25:23 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, Johannes Berg <johannes@sipsolutions.net>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@ozlabs.org>, Markus Elfring <Markus.Elfring@web.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
In-Reply-To: <189b93e2-4e81-438d-9c77-cbe4d9d7a0d9@web.de>
References: <189b93e2-4e81-438d-9c77-cbe4d9d7a0d9@web.de>
Subject: Re: [PATCH] macintosh: Use common error handling code in via_pmu_led_init()
Message-Id: <173184539767.890800.12330441666540799793.b4-ty@ellerman.id.au>
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

On Thu, 03 Oct 2024 21:15:45 +0200, Markus Elfring wrote:
> Add a jump target so that a bit of exception handling can be better reused
> at the end of this function implementation.
> 
> This issue was detected by using the Coccinelle software.
> 
> 

Applied to powerpc/next.

[1/1] macintosh: Use common error handling code in via_pmu_led_init()
      https://git.kernel.org/powerpc/c/352268dc6da7b422022541c2cf846663110f775c

cheers

