Return-Path: <linuxppc-dev+bounces-3374-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 604F69D039A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Nov 2024 13:26:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xrqj80hwXz3bkT;
	Sun, 17 Nov 2024 23:25:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731846331;
	cv=none; b=gk/WAQKj5/XMacRxgHk5ADHlJbq3g3apuR2tTgj65yULisDqDEWxZC+6PX9ZDvgqKXIaAGjt8hg9glJIZpehAhpqBy7TydEnlqKVYn44p66M0CzskXUjjYe3zsgu9UDtwafcjDk0usLLlwVdWfl8v1+3oAv/7Geds3CVXsgEU3jDtHRpxjBJV98amSWNy/HAwWMeFH/NVjRvRctF3oBIZBWZff09gIk7F5DhvksrzRJqL/jyWvdIacmKtDs67bSPFv/61+dqsY01h2OBrUPBjawVzs/LcCMXhVA/DaG71NfOFzKatdxNPwTT3tKBXkx1970mqolPv/2VVDNMQpr6Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731846331; c=relaxed/relaxed;
	bh=tIh/QNV7meNa8ZIOXp4JCVdE5EyBroYXF+febM+ZTBY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DiHat6XRl7OhanBXNXDSI8DCwL+BdSji2fMXx7ftcObyr6Yb0U5M7XVbxj3culjKZ36rP5GNxKbzmQYqYH0WxHXQau2hK9uaFg7rcfi5ezCTyep1rqu6xJL5Gu/WbzCI0Fye+EeEjpuT7Dcb37JBexhD15Z92VG9BhaI2Ok9/xrSV1aYMjEiSMdYHoiBoG2S2RiQfxO9Kdp2kij07FMo/J0GZfrR3Sn3MHHgLrVSIpEjkQAvhUjplX6ZHnVrWAnYMMQEBMMIdXyiScwGtAP2rHjgI1KsLnXmQj17nC2zFs6f4c7gBySqCOBGbCWR7pbvpdnwTW9DU2O+d5LPUG3T9A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=DHjTIw83; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=DHjTIw83;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xrqj73TN9z3bhs
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Nov 2024 23:25:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731846328;
	bh=tIh/QNV7meNa8ZIOXp4JCVdE5EyBroYXF+febM+ZTBY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DHjTIw83VFAysYWEw7AgoPAe6hOt4XDQZOG2X63mE2qeumMvRDF2mUpHXtJUcRE8N
	 R+ghXJqqRr6WH2hHJkynC/ievdh9h5KBPxgZC19TtzcVP4ksJiM5tQHlt8BRXAfIkA
	 /WU2tEuRmzubxUWOWbdOH42Jfkvujqw4miYp8BSAWIPpqh1oQtGuoZkzc1f3cEZg5+
	 F4EFQkUyasEXcfRfJrkMuLh1apvdcSWYtWLFfbT6VPis5dXaMih0CAUjOrOy43bu7l
	 TrYPr8MkDEpwxy7zG6tZhKpgerwkVYXriBVTLniJ9jW9+RQAI3e9j7hbqRGvpoAKGI
	 AQCjUIgARCGVA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xrqj4380Zz4xfJ;
	Sun, 17 Nov 2024 23:25:28 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linux-pm@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, rafael@kernel.org, viresh.kumar@linaro.org
In-Reply-To: <20241112085148.415574-1-mpe@ellerman.id.au>
References: <20241112085148.415574-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] cpufreq: maple: Remove maple driver
Message-Id: <173184539748.890800.8372516431978764964.b4-ty@ellerman.id.au>
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

On Tue, 12 Nov 2024 19:51:48 +1100, Michael Ellerman wrote:
> This driver is no longer buildable since the PPC_MAPLE platform was
> removed, see commit 62f8f307c80e ("powerpc/64: Remove maple platform").
> 
> Remove the driver.
> 
> Note that the comment in the driver says it supports "SMU & 970FX
> based G5 Macs", but that's not true, that comment was copied from
> pmac64-cpufreq.c, which still exists and continues to support those
> machines.
> 
> [...]

Applied to powerpc/next.

[1/1] cpufreq: maple: Remove maple driver
      https://git.kernel.org/powerpc/c/fae2987e67786a6358c0ef47189b12ff19e9543a

cheers

