Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3ED86153C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Feb 2024 16:08:36 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IKcDUuWF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ThD0y513wz3vY7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Feb 2024 02:08:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IKcDUuWF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=lee@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ThD0D2PK5z3dVx
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Feb 2024 02:07:56 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DCBDC63526;
	Fri, 23 Feb 2024 15:07:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEADCC43394;
	Fri, 23 Feb 2024 15:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708700871;
	bh=46B9fXDJG233uKQHkYve91+ux45hfkkJQhoIKZSUOkU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IKcDUuWFMbW8KAoY3FoYKiWWzPiQPmZ7eygPygHSRAhGZ64alNTOjpExJ5nkH4wZ8
	 HDcm+9JCBoCqBjVIZ1nh36/lKxpcrJk66Gualzc0E39SZ5zRhjG25lqF3t/qeSuidx
	 10hkukveSd0UTZWmjmsPCSgdsZIpDiUbr/qEdYrwk1++unyfjtHgzoR6wzE57AzHa5
	 cGGyoIZom4siyK6vfbkLh07+h9xDcO5XENldpCJYg/ruTavwximHkzbJaPYqWCUtMG
	 OIy/Zpak+lX2e7qqNVwUtOsD5+y3vINVFT0dbkI8c5Tsqf4Cq4eBIzRwNhz1TvZzNq
	 GOIEYUCLy2v/A==
From: Lee Jones <lee@kernel.org>
To: andy.shevchenko@gmail.com, pavel@ucw.cz, lee@kernel.org, 
 vadimp@nvidia.com, mpe@ellerman.id.au, npiggin@gmail.com, 
 christophe.leroy@csgroup.eu, hdegoede@redhat.com, mazziesaccount@gmail.com, 
 peterz@infradead.org, mingo@redhat.com, will@kernel.org, longman@redhat.com, 
 boqun.feng@gmail.com, nikitos.tr@gmail.com, 
 George Stark <gnstark@salutedevices.com>
In-Reply-To: <20231214173614.2820929-2-gnstark@salutedevices.com>
References: <20231214173614.2820929-1-gnstark@salutedevices.com>
 <20231214173614.2820929-2-gnstark@salutedevices.com>
Subject: Re: (subset) [PATCH v4 01/10] leds: aw2013: unlock mutex before
 destroying it
Message-Id: <170870086764.1691019.14397200556333161730.b4-ty@kernel.org>
Date: Fri, 23 Feb 2024 15:07:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.4
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: kernel@salutedevices.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 14 Dec 2023 20:36:05 +0300, George Stark wrote:
> In the probe() callback in case of error mutex is destroyed being locked
> which is not allowed so unlock the mutex before destroying.
> 
> 

Applied, thanks!

[01/10] leds: aw2013: unlock mutex before destroying it
        commit: eb0f0a751c8e26b212f78fe7325fa2506c5cbb4b

--
Lee Jones [李琼斯]

