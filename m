Return-Path: <linuxppc-dev+bounces-7158-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDB7A65FD1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Mar 2025 21:58:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZGnPY4TTDz2yr7;
	Tue, 18 Mar 2025 07:58:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742245105;
	cv=none; b=CBxSmpHt+AJ9JYsnNEIb5dYkDFdWRictHqWIZWNY3ooVrQ1z06Uk/Kp+f9AX4S/8f79xkSQCvCFtPcDplLqIpQcSgxumZe8MQiUbAguEWeQWUZu5ZSnNvUWzA5gF46jXFeq6HATr6gb0XDhJwbFvSctsLCgg8//C/I0Jju+kFy5RYfFTEFten9cRAwE6jTy17V/dbrUmHT709ksVMhozv1b3u8JSl9PTiqKMccwN5IcYxXCsJTEpDx4JsLvg679UyzlHJc+2jRs01MaIA2m9IBzYHyNKXC4TVSY7Z21vFVMdDLsuk3DayX+fqDTyzDHs/MunLLWRjimYMwtwcVTzhw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742245105; c=relaxed/relaxed;
	bh=gWHLLx3wpZGoPoc08gNiuPiPN/HOleW2eyEzdCWMJ7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X8l2+SX2+wUIuYmiWg/T6eeKunluSwo8awlhAb7UQGIs3PkT+h3nBmo/ofF/qP3i6HLkpsThacJb3+jAMYJcosFmPMHgsAi3oI60lsX6Jeo+1VU21js7QE1EnWLxoZ6Mm8lAfvfwkNOwMI+824WjEf8usLM4r2f2zmsSu9vF6QJVGKZA7cBcOq79ve4N51Qnuz2NE/1TgEw10ahLbkoVQb4P+/Esk9ad20XyeQkyeDu2BjKa1v9CgUmYueiSUhVb1ldc6SRxXNjDKEEgTlAUqllCAoxYaWSFZeZE7UduytXHdYeNUviJFDbj5qJWJPD8eu8BIdL3V+O2iKELCdWAGw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LpPoF3rC; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LpPoF3rC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZGnPX11ZHz2yjV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Mar 2025 07:58:24 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3EF4BA48D5F;
	Mon, 17 Mar 2025 20:52:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B58C7C4CEE3;
	Mon, 17 Mar 2025 20:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742245100;
	bh=QpFS5fAHCciJkJc6rhl3MyU++6GoZXdBE1mLhu6pdZ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LpPoF3rCj3tSgGcI9NZS+Fm8ejrHrirjgKmGkmj26odd2/xTab5bymgvu0pzecOlO
	 8oeVMx7IGYZZP56fW2PLAKn6SJcGy0w5Vdc8munKK3Do1dR3KTtBghXN9Zlf8BHmOl
	 ZKwJS20pu1KjpEUqF/XsqwJeaxtCPNyvAAEt6Vx17JUV2DdwDYsnsIlz5McnG5OCb3
	 r6DfALMod5G7MmjPGSONrZBOdm7Rxf8mem78R6LLBKaK8I00IhSe6kPETxC8kYcgWn
	 6hqu+cMtL29ULrS7vii+i3bwHWfeGFUSFZa6tN/1LmKgUnwMP/HVElVpCgokmoNBN2
	 9VU6Z+wfj87jw==
Date: Mon, 17 Mar 2025 20:58:15 +0000
From: Simon Horman <horms@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>, Arnd Bergmann <arnd@arndb.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Rafael J. Wysocki" <rafael@kernel.org>, netdev@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-acpi@vger.kernel.org
Subject: Re: [PATCH] net: remove sb1000 cable modem driver
Message-ID: <20250317205815.GN688833@kernel.org>
References: <20250312085236.2531870-1-arnd@kernel.org>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250312085236.2531870-1-arnd@kernel.org>
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_SBL_A autolearn=disabled version=4.0.1
	OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Mar 12, 2025 at 09:51:19AM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> This one is hilariously outdated, it provided a faster downlink over
> TV cable for users of analog modems in the 1990s, through an ISA card.
> 
> The web page for the userspace tools has been broken for 25 years, and
> the driver has only ever seen mechanical updates.
> 
> Link: http://web.archive.org/web/20000611165545/http://home.adelphia.net:80/~siglercm/sb1000.html
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Simon Horman <horms@kernel.org>


