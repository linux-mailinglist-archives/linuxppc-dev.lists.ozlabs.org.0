Return-Path: <linuxppc-dev+bounces-10245-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F99B054AF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jul 2025 10:21:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bhBxF6p5Gz3c5J;
	Tue, 15 Jul 2025 18:21:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752567713;
	cv=none; b=T3s122T6iWMs71+R4apHyDgKsPlAoSfataGBjpZD9MRhIT8VNBw9L0EzE2sYQu4OJSwcq2aZmHexuq6pCfCBfHVmvjbJj4K31xQ7Q96OytXzoBKlgT8awEJ2y5GhkQWUc3qmk+aIG1ZxKxm69qgnNbL2Ow0D//6B3TBJ2EYJDu/5uW5VPaYw4zJqSaPA2Yo9cTY3dbZWclOrIShnNqiTNjvMi5JvTSrXlHPHcWxjssDUp7ACqpAtfA1eHTWyCDxWiiOnl0vSvRrebKIvh1qIxxewWsY3NC+GjuSQaEkUtPTP+HQ9Hj/UoyTUf1IPZ9Ijpe+crnpj1b2pMLhyvhh5CA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752567713; c=relaxed/relaxed;
	bh=t3UzT76cF2mP0c32oHerloEV0RO3l8wjuU9BUBUSWiY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JqQLuzQm1bLJUH9BPbrl5i5Hfu7IEUnLaZZifx31htcJwI7jCjDDMxk/QZiEU3j9Ejqo35kjusSrIjjZUUXvOSOzxPY6bQvgFBiq4YvfaX+QeFk5TVNmnUheUZupdUmDSMI4EeCJy+YLmPExCVUkgB2ZLsa+jUoESGRElXVo/KBl33Idd4VfFDgWG/nr72f40DO6ou/I+hP2PxLwfCG7EjQlcizLJQUaA94vvs0esKeOwO71ijL8HCQle94MKM3gOdH09A/asQ0JBxrvaZ3atWlBp1bLoqEvoCUcV/UUtU/Qeqt9HMDZta3B0VWIwY/XR9W06TuTLMQvaQPEVom1/g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Yyk0S7eO; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Yyk0S7eO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bhBxD5FjCz3byF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jul 2025 18:21:52 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BBAF55C5C85;
	Tue, 15 Jul 2025 08:21:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 065E6C4CEE3;
	Tue, 15 Jul 2025 08:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752567709;
	bh=ebyRrw2T66Vzg5kyH0139ZzFXfnA3ppd4smjTMuCtCg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yyk0S7eOz/0KbQcEVcC5HVGT72qMwkR1B39BAzmJtFx98gqSqwZ4cYEgYVtBzfVC2
	 3LUSs4MzmTyUthDeusmxzQyPAnItNXqPDSAaBKGncGsxf674KT3iPqjsNMH8QJF50r
	 uns7xxoYXavnWYAXKTs5ke1MooR+1YlpXF/d4IFkViu3sQYGMfTC4R167CnyCrP3cb
	 OBKhOQA8y3xL1n+i6OobBanD3L+f9z5hM3J90JBoCLiFFV+dvjL7KIouxwwUIC0nQ4
	 +sBbdKX1FQ5v8tLfgxCXp1VLxKiZKu/aGa85eNPomMFjn+FlTuilFKATMst1z1SvvE
	 kyUrS5zSO/XCg==
Date: Tue, 15 Jul 2025 10:21:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Lee Jones <lee@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2] dt-bindings: gpio: Create a trivial GPIO schema
Message-ID: <20250715-hidden-marmoset-of-serenity-dcbfcc@krzk-bin>
References: <20250714201959.2983482-1-robh@kernel.org>
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
Content-Disposition: inline
In-Reply-To: <20250714201959.2983482-1-robh@kernel.org>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Jul 14, 2025 at 03:19:51PM -0500, Rob Herring (Arm) wrote:
> Many simple GPIO controllers without interrupt capability have the same
> schema other than their compatible value. Combine all these bindings
> into a single schema. The criteria to be included here is must use 2
> cells, have no interrupt capability, have 0 or 1 "reg" entries, and
> have no other resources (like clocks).
> 
> Note that "ngpios" is now allowed in some cases it wasn't before and
> constraints on it have been dropped.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> We could also do this for ones with interrupts, but that seems a bit
> more varied.
> 
> v2:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


