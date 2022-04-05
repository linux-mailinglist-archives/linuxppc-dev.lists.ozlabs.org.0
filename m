Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F364F4778
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Apr 2022 01:39:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KY3yF2Lhfz3bcG
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Apr 2022 09:39:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm2 header.b=BDTTIG+c;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=LVshqzXT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=russell.cc (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=ruscur@russell.cc;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256
 header.s=fm2 header.b=BDTTIG+c; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=LVshqzXT; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KY3xT6C6Sz2xB1
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Apr 2022 09:38:37 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id BC7223201FD6;
 Tue,  5 Apr 2022 19:38:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 05 Apr 2022 19:38:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=BDi2dVKnsCuggv
 fHPfx1Bkm00Qn25XjFlL/gjJOx8bw=; b=BDTTIG+c0STze0v5eTKgD/8+WAf1Yn
 7dWqkUYjqikMp1sMdWcdIc9fi6+FyA8ybr6JnNnFBAHrQ+apP67ad7QXiUi64k3y
 Cy4K6SH5rlvZ62kPRw1SsMhoRSYuIvoxWs3vRR4E8YlwlE8DxA9nCXTlFagkbiFs
 Hc0g248sUA+P/DqEvbb5eWdiF3pxsaYg+E/bCVbP6C4f3+WgjIcOCe1HqqJCcelg
 KJ35GaVnXaGAtVXL7MAHY4Ui7Eao77B7hxCbXkaeb6kBDbCumgzH4uuolrtX+gjf
 UnP3cs2HqAdzjmrfAE2HWJ8WOyhNDcyga3hlXnjdnOXDUDUDHUaNOGOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=BDi2dVKnsCuggvfHPfx1Bkm00Qn25XjFlL/gjJOx8
 bw=; b=LVshqzXT6+W2stY8UBdwpeUyT2C1yc1UpnEOmTZz1mYxy4GNk21i+JHdg
 IPUHErbK2SE1OwuHNizxraXhFK3q2oxf5l2EaxpTojpNdtdEr/itXLLv60LKdl08
 TkxUcBnwlJ9ayDEWQZI6+WRBxCNFtKTOr1KXuUJgqPE6fKrfDr0kxwLcb6uKWxmH
 i1tJBs1TwTPI9ASKJNa0GcDlYi+MVB12s2zjjbndHsldYZeBGh+oHJvH8+G7ckPz
 msNd1Fm7TfjNF1I22WDlT7C98rXAIqic/3SM68XqDOzeyrS7z8rMSwAurL0BTjD/
 wbwA4z1q27EGtBg8DwEMVnWvp9/wQ==
X-ME-Sender: <xms:99JMYsFVqk_fig4mn5i4Ok1R5S8GBrj63BDgzhnbynmPb7Vwq3PvXg>
 <xme:99JMYlUFdKjkoFJsFCMMX5Tn5P2ce0rMJ1ga_LzVQfZdUyCT6pKmkd0iDOwAq3p0i
 uWoM_zT8Hy1UM-40Q>
X-ME-Received: <xmr:99JMYmL77I1yh9DhWgS2X4vutXolPzM6TN-PaAz6FUOZ7VwsTr_i52U9xJssP_W-u-_HhIQvojeCcX6tZ3KUw0fEqdMqJk6yDXFKZO_eg5EMLKtUyRZE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudejhedgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfedtmdenucfjughrpefkuffhvfgjfhgtffggfgfgsehtkeertddt
 reejnecuhfhrohhmpeftuhhsshgvlhhlucevuhhrrhgvhicuoehruhhstghurhesrhhush
 hsvghllhdrtggtqeenucggtffrrghtthgvrhhnpeffveffueevleeivedvveeugeehueeh
 hefgtefhvefhudeitdduieffveejudevvdenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehruhhstghurhesrhhushhsvghllhdrtggt
X-ME-Proxy: <xmx:99JMYuGA_FbtmXeowb1r5mmzLPNG6qTssUI7WCXoWCBfP0AEYd8CRw>
 <xmx:99JMYiXK_A7nKbI5ZhxDSipE2SsqFcgtabY1hjOGPPNVXo1HT7NukA>
 <xmx:99JMYhPsQXCjpUV1bXwTfza-JSJ_OpIWHyXKHmG89F2knqmk5VmhWw>
 <xmx:-NJMYhShhjsDkPIinf9hartpuiX4v1y8rxa6OVhGrfMHhglUMMSoPQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 5 Apr 2022 19:38:30 -0400 (EDT)
Message-ID: <8e107bcaa9e9e392dfe96b9d542ab20af0e910e1.camel@russell.cc>
Subject: Re: [PATCH v2 1/2] powerpc/powernv: Get L1D flush requirements
 from device-tree
From: Russell Currey <ruscur@russell.cc>
To: Joel Stanley <joel@jms.id.au>
In-Reply-To: <CACPK8XdifXFmjCJL3KDu8PJi4KLKWnOBeq86wZvN0kiHGQ=JHw@mail.gmail.com>
References: <20220404101536.104794-1-ruscur@russell.cc>
 <CACPK8XdifXFmjCJL3KDu8PJi4KLKWnOBeq86wZvN0kiHGQ=JHw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 06 Apr 2022 09:38:26 +1000
MIME-Version: 1.0
User-Agent: Evolution 3.42.4 
Content-Transfer-Encoding: 8bit
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
Cc: Murilo Opsfelder =?ISO-8859-1?Q?Ara=FAjo?= <mopsfelder@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2022-04-05 at 02:49 +0000, Joel Stanley wrote:

> I booted both patches in this series on a power10 powernv machine,
> applied on top of v5.18-rc1:
> 
> $ dmesg |grep -i flush
> [    0.000000] rfi-flush: fallback displacement flush available
> [    0.000000] rfi-flush: patched 12 locations (no flush)
> [    0.000000] count-cache-flush: flush disabled.
> [    0.000000] link-stack-flush: flush disabled.

In this case you'd be looking for stf-barrier, uaccess-flush and entry-
flush so this doesn't tell us anything.  This must have been from a
no_spectrev2 boot with count cache and link stack flushes disabled.

> 
> $ grep . /sys/devices/system/cpu/vulnerabilities/*
> /sys/devices/system/cpu/vulnerabilities/itlb_multihit:Not affected
> /sys/devices/system/cpu/vulnerabilities/l1tf:Not affected
> /sys/devices/system/cpu/vulnerabilities/mds:Not affected
> /sys/devices/system/cpu/vulnerabilities/meltdown:Not affected
> /sys/devices/system/cpu/vulnerabilities/spec_store_bypass:Not
> affected
> /sys/devices/system/cpu/vulnerabilities/spectre_v1:Mitigation: __user
> pointer sanitization, ori31 speculation barrier enabled
> /sys/devices/system/cpu/vulnerabilities/spectre_v2:Mitigation:
> Software count cache flush (hardware accelerated), Software link
> stack
> flush
> /sys/devices/system/cpu/vulnerabilities/srbds:Not affected
> /sys/devices/system/cpu/vulnerabilities/tsx_async_abort:Not affected
> 
> Does that match what we expect?

This is as expected for P10, though clearly from a different boot to
the above :)

- Russell

> 
> Cheers,
> 
> Joel
