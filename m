Return-Path: <linuxppc-dev+bounces-1111-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B9896F3BE
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2024 13:56:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0ZRn5lMcz30M0;
	Fri,  6 Sep 2024 21:55:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725623733;
	cv=none; b=P1cNIJG92ZdVUBTSWyRYM4oOrUeGS7JhCv53Vy7376dN8mW5uEQh8lv0R2wklkEFYLLlALGbSsuunkp/R3EdraWwf69EUj03rK/fSmimvxRCATkFcc6mvUA6XQBHiUFHrMQi+mJYXwAKadNEuDqRVXmbXU6hve9tShmy1PBB31YqGfz7q+guCdFJW00NkwuosmtrNFYvO6z8vsPxYAGM3UscFoIwqTxvEfhlV9y2hdFOVItYEdxzT8Ude0zLJ+B33D92RRvW8cYBMOTTig9CCJmmK8pPz99sqe1hfftY+R4c9tCf2WlV+ELlVcylAJrg1eLOZ15LEPHEAGVpazA+KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725623733; c=relaxed/relaxed;
	bh=K0PedkY/VbhOwrKCfnQ3wCGYve32D7xpq2GGUQe3pfc=;
	h=DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type; b=BGg/lR47p513s/y2a9rD3jyORfb1quZi8fkSzDOXC5L0v76JrUxtH4s3B/RtbuHjXTKGAgzk8qWwdkz5+TP3LsnpRK5ICXFfpMecnOBPtp/8prdTE8o0fZd8zOqxgfzJ1+XBvgXKEfhAW332Tb83xWgtRNkaxyqIKLeutxukZeSs5dQp+dLb0YIAmothx2HC3hpgYXi8vhFgn9WFSKLVUT1zTSuyrBW7SoZhV8ZCGoWRwiW5i1+cRgUFxllrUzjWJ54wfG0zbNyjs4Sdc1jlxfHHGTKDzTGSkSuBoNv8rSy42JznRM+s8TaOQ+8z2YCKOsOBrSpB6SwRwOlkKc0XCg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Ui9SjyZO; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Ui9SjyZO;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0ZRn5b11z30J8
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2024 21:55:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1725623733;
	bh=K0PedkY/VbhOwrKCfnQ3wCGYve32D7xpq2GGUQe3pfc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Ui9SjyZObeY+6gI2qD3gSA3B+gehCFKsZI4oXM+rwrxxCfwOv2gtlKAw5xNuP0AxD
	 MVZk9GfC8mNNhrmFE+Xx5ISoP2yMQuE8tD44Ebxp6OaVPxoT1xWQDQWzBEx5Fcx7BA
	 /+6XH6ueo0FE8mfRfv5p2aSTl4IOAY6xw0eTiegygI9Es+n9ZIONdNUXfx9hgnAsEp
	 Rd6Ub3SQZAb+I5vLDlYUUZOoogB+BPIauznAWwRz7PgYqHOSTlVlADswJV91g62GC2
	 AdXBtF5mBJFFTnXke9k90fgbrbQOUR8kreeymQWbB2J6Qmyfx+pSPRq15dpUJ2aleD
	 9owwS7EVUlWdQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X0ZRn4RK7z4xGl;
	Fri,  6 Sep 2024 21:55:33 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org, yuehaibing@huawei.com, Huang Xiaojia <huangxiaojia2@huawei.com>
Cc: linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20240826150957.3500237-1-huangxiaojia2@huawei.com>
References: <20240826150957.3500237-1-huangxiaojia2@huawei.com>
Subject: Re: [PATCH -next 1/3] powerpc: Constify struct kobj_type
Message-Id: <172562357210.467568.4999410694983714938.b4-ty@ellerman.id.au>
Date: Fri, 06 Sep 2024 21:52:52 +1000
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On Mon, 26 Aug 2024 23:09:55 +0800, Huang Xiaojia wrote:
> 'struct kobj_type' is not modified. It is only used in
> kobject_init_and_add()/kobject_init() which takes
> a 'const struct kobj_type *ktype' parameter.
> 
> Constifying this structure moves some data to a read-only section,
> so increase over all security.
> 
> [...]

Applied to powerpc/next.

[1/3] powerpc: Constify struct kobj_type
      https://git.kernel.org/powerpc/c/7509c23770054fdaffd966926462248d44a323c1
[2/3] powerpc: powernv: Constify struct kobj_type
      https://git.kernel.org/powerpc/c/7492ca369e98a45b55592456dc1b24d58b3392f5
[3/3] powerpc: pseries: Constify struct kobj_type
      https://git.kernel.org/powerpc/c/6f2683274d0d0b51a986f73c2afb9058156f1641

cheers

