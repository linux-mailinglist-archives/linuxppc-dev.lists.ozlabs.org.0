Return-Path: <linuxppc-dev+bounces-5007-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 569C0A09708
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2025 17:18:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YV6Jf02jnz2ypP;
	Sat, 11 Jan 2025 03:18:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.67.36.65
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736525889;
	cv=none; b=QDGlkquB6mSrceCgAj9QIkI3JFmZptZuBkk6H/oMDeJpimZx+L8PwuB5ZvBKWGF1FaKp1WODrHau/uxIaRQDuGYYuPPR6WC6pKp19H8WAsfQ/I8FKBh3r2jezgOyf1qPIiYxZwhA9t8y3UXPF5nIeQtYx/L5nlSLGKKaYSg2qFBXiyNyEni1/r0l4Fbh2iLPXV49NKSTl1QQH/ATh2aO8TFMzKMYNBltGr2WpFvt79yh/g3TGD5XEYFGX6+0cQ/8/8Rcw50NtCSvVMfaZX0Gh3QphPSjUt4ddvIKtqO/l0zceR4ZVjLHLV23yQWutSw5chZwXrKf7MNI2OD2gnnxKg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736525889; c=relaxed/relaxed;
	bh=YoIZxPwUNh5W5kJ1j6pN+9gP4edUVD7+Wfrmj2CV1CI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AYK/TqXVtxwQ6zCt3eNlM/UUphcYpFpZ+IAY1YbkSOQ5/JWY9k0zMdMjsNBBKlnApL+UmgTzMpXNirBch6QR9xaiMoOCya7NSu7yxlrES+31dGoTM1FcR4SvIQe7e8AxEBhnP+q4ts7Yog49kqfKOKiOENhAbqtNG2R0YuXJJD9JEcjpa5jP4yj3gmZwUM/7tlSzB5sljC8ClsO93T75W8ErMIMr0buJOIuZ5bmApomG3bl2Zt7kuyYAF7CkAmZgDv3J2hN2S9ej8V+rKGq/od/1NR6pvODnQ/cWcHMFPvhiStZ4gGg4sU7oKlRM+lQBYpEpgkRrD3Ti4ItiQa0YZQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net; dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=dN5btD0I; dkim-atps=neutral; spf=pass (client-ip=185.67.36.65; helo=mout01.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org) smtp.mailfrom=posteo.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=dN5btD0I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=posteo.net (client-ip=185.67.36.65; helo=mout01.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YV6Jb5Wh0z2ykn
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2025 03:18:04 +1100 (AEDT)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 409E1240028
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 17:17:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1736525876; bh=Zt0oYLRy2gA4qiDcwUVvzYtQ2ZUaL8kWI5E0eYhdc4U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=dN5btD0IBchnJMV6qQf7gaO3kSJP1klXFDgDLrWfOPEb8cESzqOfTjps/Nz98Ujb0
	 jD6wN+1TrTqrka5Eyp8xx5GJFezsW2gMpt2KPaE78rbz1CDzfv8w1sLDQFAMKFkcWP
	 mO6J8a6j/prT/gYqURWJYiMl27bKm8V+YD5FHQX1dTtIgbqFpRVLzJ/+JKAtiH7FEg
	 JUN20yBPUHVodD/IdAogK3ZWlUE+Cp/ZqGB0nL6AI3qtV3sN5MF2/4jg7d6Oryq86C
	 PmYLMWun4ODcwRdxbJst/yQ6CZH578z0lBM/MlH8v22iNnL/L/GJexM5RqcAtkMfy7
	 z39A8Wb3YmD5g==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4YV6JJ6V20z6tw2;
	Fri, 10 Jan 2025 17:17:52 +0100 (CET)
Date: Fri, 10 Jan 2025 16:17:52 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: j.ne@posteo.net, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Frank Li <Frank.Li@nxp.com>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 04/19] powerpc: dts: mpc8315e: Add labels to peripherals
Message-ID: <Z4FIMM3383gXQ2PH@probook>
References: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
 <20250102-mpc83xx-v1-4-86f78ba2a7af@posteo.net>
 <9a517e08-8ed0-40df-940d-10c57c59f2d0@kernel.org>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9a517e08-8ed0-40df-940d-10c57c59f2d0@kernel.org>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Jan 10, 2025 at 04:19:56PM +0100, Krzysztof Kozlowski wrote:
> On 02/01/2025 19:31, J. Neuschäfer via B4 Relay wrote:
> > From: "J. Neuschäfer" <j.ne@posteo.net>
> > 
> > Labels can be used in board-specific devicetrees to refer to nodes more
> > conveniently.
> > 
> > mpc8315erdb.dtb remains identical after this patch.
> > 
> > Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> 
> 
> Adding labels just to add labels is usually pointless. Instead add
> labels and their user in the same commit - that's the expected style
> with DTS.

Alright, will do.


Thanks,
 jn

