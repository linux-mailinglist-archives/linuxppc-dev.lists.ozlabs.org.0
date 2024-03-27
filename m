Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F5288D37F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 01:48:00 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UezsQDLg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V47Lj6bpYz3vYr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 11:47:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UezsQDLg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V47L01YfGz3bpp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Mar 2024 11:47:20 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AF485CE2381;
	Wed, 27 Mar 2024 00:47:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7EB0C433C7;
	Wed, 27 Mar 2024 00:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711500435;
	bh=2q5crH4HwBtEVMAdw9c1ugeNy2Oyqk30hp+EirVO3q0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=UezsQDLgF9nL66A4jsvBTDD2EOr0eqDdVGhmNGprFvTwmA1eJHgPOWS9WJ7ECimcd
	 RDE0aan9K8Zg8d9M25lbWh96ZCpZ7y0mP+R19goxTSdH2JUd8JcPPdRW83X8rI6QM8
	 MJUThd//pIxYMao207aSg2QzHNfqWYJLPbB+dCwBN2EVPijRRPNUhHocfcqdZVwTSk
	 P3meIA4B8q4n+12qJIk0cKVZsdNFWx3sQ+EkouWPRC+ZdDc/jHiwushF/bhTIdgyqo
	 iwYU8SW6CRg3wKHM6DqpqtfSkZUOfF7qjVM0qmdXWxlmO2PGuFkWXuQEEE+muZ3xGT
	 sSHlZk7LNCyaw==
Date: Tue, 26 Mar 2024 17:47:13 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 0/9] enabled -Wformat-truncation for clang
Message-ID: <20240326174713.49f3a9ce@kernel.org>
In-Reply-To: <20240326223825.4084412-1-arnd@kernel.org>
References: <20240326223825.4084412-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Hannes Reinecke <hare@kernel.org>, Vladimir Oltean <vladimir.oltean@nxp.com>, llvm@lists.linux.dev, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>, netdev@vger.kernel.org, Bill Wendling <morbo@google.com>, linux-scsi@vger.kernel.org, Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org, Helge Deller <deller@gmx.de>, linux-input@vger.kernel.org, Ilpo =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Ariel Elior <aelior@marvell.com>, Nicolas Schier <nicolas@fjasle.eu>, Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-sound@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Claudiu Manoil <claudiu.manoil@nxp.com>, platform-driver-x86@vger.kernel.org, Manish Chopra <manishc@marvell.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Saeed Mahameed <saeedm@nvidia.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Nick Desaulni
 ers <ndesaulniers@google.com>, Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org, Justin Stitt <justinstitt@google.com>, Johannes Berg <johannes@sipsolutions.net>, alsa-devel@alsa-project.org, Maximilian Luz <luzmaximilian@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 26 Mar 2024 23:37:59 +0100 Arnd Bergmann wrote:
> I hope that the patches can get picked up by platform maintainers
> directly, so the final patch can go in later on.

platform == subsystem? :)
