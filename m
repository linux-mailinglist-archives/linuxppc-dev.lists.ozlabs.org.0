Return-Path: <linuxppc-dev+bounces-3389-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 008659D03BD
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Nov 2024 13:28:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XrqjK1dSGz3btX;
	Sun, 17 Nov 2024 23:25:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731846341;
	cv=none; b=NCoDWzds5NaUIyqhSztwxz3WClEfdIMPjziOUwMODj/P3xvdo6Twq6apIfLTlv+w+n2VSEAZ7dZqnhUQMA8s5wAbfvBlRlfgPvYaGBpo2i0d8NQHdVkOZflSlbbEnbXWHpvflkU9EHQKfJZTopkWC5kg2PtGhyb5uQbx4YmjJdGpq9Mxw55riFqfHLox3UlydX0BT8IEiZwpRyd865lw12eqJHzw+HA2FBq3m4p6XMndCVM+/zKXPWAp4qRZVFqn8rB3gN80jKIYrnVriJjYwptHI5Tkv9cxTBJ1atNrc8nNOpTOprldpMpgtzrTbCE1W66jTc0D4jnPsY+9Q/6SOw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731846341; c=relaxed/relaxed;
	bh=uPqxzh4mL68Z4sQxC/IdKSxMOi/CnvBFxlpyAqi3H4w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iFAAMyOvjblyU36oPQAbbt1OYYoEKXAq8J++9pNE9G5lXhpqBRY1fOg2nHKIP8pAqCtaVMIXGVTf2ukWNagmAJSqGwkPlYPaXdKQFdLfCcFoJjiVKW59S8ipV3GYQqIFxkSuZoZOV7E94uYDIhVdTQRQYfT+vR57FWG3QPJd0lflbB7Z7/E/ezg6+Ncnsb62ORM/GYI5FslpzZayRCrFrnxduxlhYhrLa5AbyJAKSjzn4QTj89XJFOWYZvFY4jNh6ESBeT5bP3CH1VUaKx3Zq+3oOvwyF1+sRteiEt+0mA9WZ5rFgotY+hV+jI7zrkQ7q0PrHY9uIAjrO82QkMm2+g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=JFtnhF5I; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=JFtnhF5I;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XrqjH5r7Tz3bs0
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Nov 2024 23:25:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731846336;
	bh=uPqxzh4mL68Z4sQxC/IdKSxMOi/CnvBFxlpyAqi3H4w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JFtnhF5I97xVMil2X58ZapbP/ovkjzlcV55oxBzfkh0lfqCYil1K7tyg40g+NkFQE
	 RJ0oXMz/8bCXm+N/rWnJsmpe2CAcBTInYtjFDaonBz8nj73dVjwiDngQu9oilgB1du
	 rE8TjIpb1ybm5wAKmTs6d6rvgLRfS/yDcwUm3SgFEKzki7b7VGR5MUB0GcipDkf0O9
	 Zw+MxkFMAHm05TGRp3h3dq+ZQfOOD77OOcskM+aCPfXFY0il/7FyM+TAWLi6LElxKO
	 oEywP3jCbK8fTkBv5P8C/1VNeu/uiBgfBX9D07t7EbVyuAlSwvItM1kDjgFZnn9dGx
	 G9KlMc5K4e7Hg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XrqjD1nf1z4xfk;
	Sun, 17 Nov 2024 23:25:36 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: ritesh.list@gmail.com, zhangjiao2 <zhangjiao2@cmss.chinamobile.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, shuah@kernel.org
In-Reply-To: <20240930012757.2395-1-zhangjiao2@cmss.chinamobile.com>
References: <20240930012757.2395-1-zhangjiao2@cmss.chinamobile.com>
Subject: Re: [PATCH v2] selftests/powerpc: Remove the path after initialization.
Message-Id: <173184539763.890800.11338398179510571377.b4-ty@ellerman.id.au>
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

On Mon, 30 Sep 2024 09:27:57 +0800, zhangjiao2 wrote:
> If there were no anamolies noted, then we can
> simply remove the log file and return.
> 
> 

Applied to powerpc/next.

[1/1] selftests/powerpc: Remove the path after initialization.
      https://git.kernel.org/powerpc/c/7ca93aa9204b706e4afcd4fae0dc8798500598d5

cheers

