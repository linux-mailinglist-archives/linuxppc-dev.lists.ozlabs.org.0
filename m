Return-Path: <linuxppc-dev+bounces-3390-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C849D03BE
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Nov 2024 13:28:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XrqjK42Vqz3btc;
	Sun, 17 Nov 2024 23:25:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731846341;
	cv=none; b=BLEMwrvSD8GN8rWZwp7acl8RlMwjxJSq2GJSm85lYXpbUJsyuoOZSJGZowruOi/2clGULdo78QpWvcxLlCXjxaX50sB23DRyXmdznJhO97vzNZtX0EAk4FaZt3wouYu1rRpwUH8DTn8XkjimgEQdXIukC+y9HT1Sf6W70uUPMoktknq7N7dETnNGVa0zVYEOlPnFrCSIAWYXoS/uPBxGwn8DWhZOTbEfxhJISCyDvY95LeuAxFtMsQN+TKDoyR5jjrLEyzHF19z0FeCV6sead0+mZzPpUPF+6RAVTM7jidWVesgokvHYehz/3PqB7PlFSzQb6Jm6T36aeVWc9hBV+A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731846341; c=relaxed/relaxed;
	bh=5n8lhceVfRC15Xq9MD3EsVOGBAT7IvvuXtYsil2P6BI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QaNbCK1MXzZmvze4zCqGcL0rfb0fk1aB6srMMPsOIPLF4mvwS6Fr24qu6x+IWVNF0yMzPfI8gC2KFlLwjBgmQxz15AlvkhH6QaWS91T+iof7fynRUjMJWPSEGf4sFWps3z8mQhmxvZBg0NXPq/DAJnuk3+fz0VUwK4P23OsXUEuZZHRZJbeBNq65WR9y7vVzlF+FP/Fmu4jGTZvDRtyXvpvK79OeqGxJCmORgjSBhy3kOs+yY7DBVCf5dgtO/PH1Gxzygg7EbLaEt7al+fPIeWr+30UVdaSzdRBvdbXOxhhcu+O8W9Ikx7i5uzakISGPq7OhgyrtywcAnoA9E/SCpA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=UoZ3EGlf; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=UoZ3EGlf;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XrqjJ29pkz3bsZ
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Nov 2024 23:25:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731846337;
	bh=5n8lhceVfRC15Xq9MD3EsVOGBAT7IvvuXtYsil2P6BI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UoZ3EGlfzDc8z1BW5gLWCqE5R2YALRnxBVBxLzhzOb1h2bP5aD0loIN1GgIKJoglo
	 u+CgSFyB4bPflp+8YhzJbiWzPTCf+1tDJ2+hpM5l/7ZeFIGEUweoKheAgX92v96TPl
	 5cht7cU1h21HdCeDurf5FZGEgd0OzBAXqSgBR3S+rhb3jM5X79cBs350tweUhoOLYH
	 CBcpWsg1GGz3nm0E81/zLgPBNNLHUtIJQTid4FTiDv3VdjkdW+kGmSUPw5sqHzGOU5
	 YOJFkmIEA+rrW5XUhfpWMwjdFm2c2fl7rBMz4p6rGzpLrqxJlT+n2pDbnNkkJJu9Sg
	 oBzEpKQO4NWUA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XrqjF2Bxpz4xfM;
	Sun, 17 Nov 2024 23:25:37 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, Zhang Zekun <zhangzekun11@huawei.com>
Cc: chenjun102@huawei.com
In-Reply-To: <20240930075628.125138-1-zhangzekun11@huawei.com>
References: <20240930075628.125138-1-zhangzekun11@huawei.com>
Subject: Re: [PATCH] powerpc/kexec: Fix the return of uninitialized variable
Message-Id: <173184539767.890800.12089768621772523498.b4-ty@ellerman.id.au>
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

On Mon, 30 Sep 2024 15:56:28 +0800, Zhang Zekun wrote:
> The of_property_read_u64() can fail and remain the variable uninitialized,
> which will then be used. Return error if we failed to read the property.
> 
> 

Applied to powerpc/next.

[1/1] powerpc/kexec: Fix the return of uninitialized variable
      https://git.kernel.org/powerpc/c/83b5a407fbb73e6965adfb4bd0a803724bf87f96

cheers

