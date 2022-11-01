Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DFA6151A6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Nov 2022 19:39:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N1zM20hySz3chb
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Nov 2022 05:39:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=marcan.st header.i=@marcan.st header.a=rsa-sha256 header.s=default header.b=y4nKaGfk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=marcan.st (client-ip=212.63.210.85; helo=mail.marcansoft.com; envelope-from=marcan@marcan.st; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=marcan.st header.i=@marcan.st header.a=rsa-sha256 header.s=default header.b=y4nKaGfk;
	dkim-atps=neutral
X-Greylist: delayed 518 seconds by postgrey-1.36 at boromir; Wed, 02 Nov 2022 05:37:37 AEDT
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N1zKF51Nrz3cM6
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Nov 2022 05:37:37 +1100 (AEDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 855924267B;
	Tue,  1 Nov 2022 18:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1667327328; bh=FNzvVcw0wbF+4/Rh6ZkrNFOkM2Dg97dYxtkFzoT3wCU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=y4nKaGfkdXYMVrEShBWZHRKdzFtCCDoBLOOkwL3REl6NbF+6M053rcomejdo0EIC8
	 8okltHpHzXzQXvk/Ali5MJcV8o+VzCM9QwQsr+ke7KllD7CjQjh4756qenmpXBD/b+
	 rjd+lOKfJNR+YNdlL8HbecQ5GnzPf239Q0vpOg734niZiN08FHz7KVIlSUtOPEzbNv
	 Gk8N6WTMhOxXK7U+9Jd0ARlrsqfIJFP04pHD9Ga2PiRPQp5eQo0onr11YQ3J545Hmx
	 8zvs8KSKogigqkHYFxWlTXhnFG4Ew4wCWDuJ/EIvg+24dimHGJ+5BED8x8aBUpFj9P
	 uSyl1yIVKueRw==
Message-ID: <a40dbff1-6aa1-dedf-7eb2-c75d75d808b2@marcan.st>
Date: Wed, 2 Nov 2022 03:28:43 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3] i2c/pasemi: PASemi I2C controller IRQ enablement
Content-Language: en-US
To: Arminder Singh <arminders208@outlook.com>, linux-kernel@vger.kernel.org
References: <MN2PR01MB5358ED8FC32C0CFAEBD4A0E19F5F9@MN2PR01MB5358.prod.exchangelabs.com>
From: Hector Martin <marcan@marcan.st>
In-Reply-To: <MN2PR01MB5358ED8FC32C0CFAEBD4A0E19F5F9@MN2PR01MB5358.prod.exchangelabs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: linux-arm-kernel@lists.infradead.org, Sven Peter <sven@svenpeter.dev>, Nicholas Piggin <npiggin@gmail.com>, linux-i2c@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 07/10/2022 09.42, Arminder Singh wrote:
> This patch adds IRQ support to the PASemi I2C controller driver to 
> increase the performace of I2C transactions on platforms with PASemi I2C 
> controllers. While primarily intended for Apple silicon platforms, this 
> patch should also help in enabling IRQ support for older PASemi hardware 
> as well should the need arise.
> 
> Signed-off-by: Arminder Singh <arminders208@outlook.com>
> ---
> This version of the patch has been tested on an M1 Ultra Mac Studio,
> as well as an M1 MacBook Pro, and userspace launches successfully
> while using the IRQ path for I2C transactions.
>
[...]

Please increase the timeout to 100ms for v4. 10ms was always wrong (the
datasheet says the hardware clock stretching timeout is 25ms, and most
i2c drivers have much larger timeouts), and with the tighter timing
achievable with the IRQ patchset we are seeing timeouts in tipd
controller requests which can clock-stretch for ~10ms themselves,
followed by a spiral of errors as the driver has pretty poor error
recovery. Increasing the timeout fixes the immediate problem/regression.

Other than that, I now have a patch that makes the whole timeout/error
detection/recovery much more robust, but I can submit it after this goes
in :)

- Hector
