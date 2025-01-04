Return-Path: <linuxppc-dev+bounces-4656-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A2DA01542
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Jan 2025 15:30:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YQNCc1ctjz2yFQ;
	Sun,  5 Jan 2025 01:30:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.67.36.65
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736001052;
	cv=none; b=LShNsOOXig/nWb2gpZlrbyDZcjo2SOSAFLFOH8zMzO1xsEPGOVfVBqGh3HhatAcBOBEmPPrGJ9DO7KrZmAR6AOfy+7vLBRJSagDGKx6JD0IMRm2KcJEbso1qZM8GI2xR8gVZoKtJKs6Pum1tTYWWRs8sdsu0xpP8ZYkCgeJ3otKKE9DmSYY6ohHN64aeCvrsSO3mv6dSezmV0vBJRQEpMByCKTMA6CgbW5kErYeHyhJs22U15yUZlj8jTSEj9mEQ0W1qciWvRU6f2c7SQQ74LloBZu9TNit6W9KyKHhRW/Hx95BIv0YbPRZTIy6Mu9W2sc6oZjO3CHnjkJAYgAgsGw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736001052; c=relaxed/relaxed;
	bh=ZmxHVOUEQAQwC9Al+eCdeHOHO8ucVH2jdCMUrJQD1XI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ml1ZN1N/RyFeqDyfiC7qwMdL7dvXI7u2JWzF1QWFZ8FXZkTtxcJGSzwU3c2SISA7hbr5+SgZ6ry0Aq3DB7S7LwU6LjKFhBhKEEdYnwblhYOtvO9AE+Mho9NCGSXeT0mrDOvZssQxNEXKXZYHrdEFd8+HCLO0tgYSXuAr/VdI5IehxQYQTytkz2pZhsryvio3yfJluy1GFAjypbkpq+Faab1l572+cQbVpjnR76/C+SjIMvl4h98Sx0ftAobQwmGBEDUKL+qf4KFlyi4Eg+gPV4jrrOhzuH3n4qEaIinA8Djho6ugHyYfTq55sK6WjfzIxnASwGk0jcrbpEIjgyS/nw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net; dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=UsUURpST; dkim-atps=neutral; spf=pass (client-ip=185.67.36.65; helo=mout01.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org) smtp.mailfrom=posteo.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=UsUURpST;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=posteo.net (client-ip=185.67.36.65; helo=mout01.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 570 seconds by postgrey-1.37 at boromir; Sun, 05 Jan 2025 01:30:48 AEDT
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YQNCX4MBLz2y33
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Jan 2025 01:30:45 +1100 (AEDT)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 2FDB5240028
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Jan 2025 15:21:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1736000468; bh=a+7OaDpDjSfo5kJZqCF814SYvX9bNZM0msRQs0by9ME=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=UsUURpSTBUVRJpq/2YULlGJ6066Tr+qDi1HRoPIhigu44x/3DiU8K8M+oqkvJE3qp
	 33wmmpdp+ItQ7BRpfQ4eITXVKUB2m/k2gcbWsuhcXaJ6AHBgKWH8R+YqU1b7/kv7xq
	 1OUSeYQkI4SAPliWf781fLz6mXvGGEbhyR9Tv5CHn3aXKLe0A1MxKARyAJOKUQ3uFm
	 wWG9fHoDZZ2HOguraxaGcZJ3xeLjaRwMuY4uWf+yjMDS6JS4VR52EU5tKiQZdDVJW1
	 y+uM+2RcKACo/NbrBaM3sKwxZ9mr0qg4O6DaDEEZvsnsnaTSKobOYlUnXAtjZfQRbC
	 poBINKqvMLvgw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4YQN0J1Fv7z9rxD;
	Sat,  4 Jan 2025 15:21:04 +0100 (CET)
Date: Sat,  4 Jan 2025 14:21:03 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: j.ne@posteo.net, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Frank Li <Frank.Li@nxp.com>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 13/19] gpio: mpc8xxx: Add MPC8314 support
Message-ID: <Z3lDz9IucqgGdNR4@probook>
References: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
 <20250102-mpc83xx-v1-13-86f78ba2a7af@posteo.net>
 <CACRpkdZVKC9HhUT8LqNnOU5NSE_S-ucuZRWACesEejDWwCyV5w@mail.gmail.com>
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
In-Reply-To: <CACRpkdZVKC9HhUT8LqNnOU5NSE_S-ucuZRWACesEejDWwCyV5w@mail.gmail.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Jan 02, 2025 at 10:38:22PM +0100, Linus Walleij wrote:
> On Thu, Jan 2, 2025 at 7:32 PM J. Neuschäfer via B4 Relay
> <devnull+j.ne.posteo.net@kernel.org> wrote:
> 
> > From: "J. Neuschäfer" <j.ne@posteo.net>
> >
> > GPIO input, output, and interrupts have been tested on a MPC8314E board.
> >
> > Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Can Bartosz simply apply this and the binding patch and get these
> two patches off our tail?

Yes, I think that's a good idea. I'll update my To/Cc list afterwards.


 -- jn

