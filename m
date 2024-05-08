Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E368BFF48
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 15:48:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VZGgM5GKbz3fys
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 23:47:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VZGXS2JxGz3cYL
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2024 23:42:00 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VZGXS1kWCz4xLw;
	Wed,  8 May 2024 23:42:00 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20240507140150.54630-1-mpe@ellerman.id.au>
References: <20240507140150.54630-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] macintosh/ams: Fix unused variable warning
Message-Id: <171517558556.165093.8834544573482791339.b4-ty@ellerman.id.au>
Date: Wed, 08 May 2024 23:39:45 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 08 May 2024 00:01:50 +1000, Michael Ellerman wrote:
> If both CONFIG_SENSORS_AMS_PMU and CONFIG_SENSORS_AMS_I2C are unset,
> there is an unused variable warning in the ams driver:
> 
>   drivers/macintosh/ams/ams-core.c: In function 'ams_init':
>   drivers/macintosh/ams/ams-core.c:181:29: warning: unused variable 'np'
>     181 |         struct device_node *np;
> 
> [...]

Applied to powerpc/next.

[1/1] macintosh/ams: Fix unused variable warning
      https://git.kernel.org/powerpc/c/bc8744c6bf0d487dcb7911d093fce60a62cc2654

cheers
