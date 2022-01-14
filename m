Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E8F48E85C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jan 2022 11:33:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JZyM918JMz3bTr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jan 2022 21:33:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=VFEa3gAm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12c;
 helo=mail-lf1-x12c.google.com; envelope-from=troglobit@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=VFEa3gAm; dkim-atps=neutral
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JZyLR3lrkz2yLy
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jan 2022 21:33:03 +1100 (AEDT)
Received: by mail-lf1-x12c.google.com with SMTP id x7so28798263lfu.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jan 2022 02:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version:content-transfer-encoding;
 bh=yJuXNGeOhj8b3A5LNs6MNezqzocsK7Un5hWTdxP7AZY=;
 b=VFEa3gAmsLq3ppk2ykoPNVcO0FfrI6DmBQWsLc1f8Sgz0bsFalFIHhOXglmUYpPLDG
 NEMFCC+KQMvL98mf6hxw9EK6M9UWSrjw9fb+RbOfVl8kJP/u5i5XYPBu8toUM9RmA4B7
 NmtZmWx0IAGWCK5qDxi6aRekc7I+MhY7yTByohItIz7+ps6yZ2eL3kH6zFMcG3p35wLZ
 Qo3zLpmTzjRnp5rfGfB4iKe2URYFUsnu7NOFzovhr+lI5SYqWZ/bI6Q0tysgF3w1Ziys
 rqk4o2x8fA7y0hK4nctgL4B581ggNp9/xxt4WACahbcmlqN4tgU4GzIB+krWB6481+0W
 D7dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=yJuXNGeOhj8b3A5LNs6MNezqzocsK7Un5hWTdxP7AZY=;
 b=ISIsjfi3//cZFir/oZTrT9FqXHub8Hc3Fs03mIp1yu5U7+7IXzeBPa7VGe3de/+DVD
 +0Dxa047/nhhIjIckGPDnljbyJLNXk1e2gTJbzeuZLVd13+2y5jIVwkgFX9TVyhSpXTY
 1gScLbdZRiq31se8Wv9TonB2nG7srcMNpOiml95GBQRRPu2oov05SA1VkERJVpFucWx3
 Blxhl4HCBgostHp08mhHe90K6AfmbMEseNsnsRmawey5r3ThkYVT8p97utbXRmZp1WVJ
 Nsp51e1+C3ZyQri83DnOYl0NKZ95YXiPryh2gczs6NcaX6XV/JrtYPfoW0pkf65OFoLm
 6WdA==
X-Gm-Message-State: AOAM5330MQdRVMFtEwP+rG8+1lIYYwuq1R391o3bpeF5qkQ97mmE55L7
 2UMinHfwtl7MXHCWRn8OsuA=
X-Google-Smtp-Source: ABdhPJxvibegZGhR6B7KTQSonpI+ZCqYMWpsWTL8XclhfofNfCNj8ICPw6SpFGqB5CQ4KlgdcxkAEA==
X-Received: by 2002:ac2:4e06:: with SMTP id e6mr6439145lfr.295.1642156375913; 
 Fri, 14 Jan 2022 02:32:55 -0800 (PST)
Received: from wbg (h-98-128-228-27.NA.cust.bahnhof.se. [98.128.228.27])
 by smtp.gmail.com with ESMTPSA id l5sm546121lfk.167.2022.01.14.02.32.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 02:32:55 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: Scott Wood <oss@buserror.net>, linuxppc-dev@lists.ozlabs.org,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH 1/1] powerpc/e500/qemu-e500: allow core to idle without
 waiting
In-Reply-To: <f6d4c1151e290bb71a18dcf6fd424fe15250e75d.camel@buserror.net>
References: <20220112112459.1033754-1-troglobit@gmail.com>
 <f6d4c1151e290bb71a18dcf6fd424fe15250e75d.camel@buserror.net>
Date: Fri, 14 Jan 2022 11:32:54 +0100
Message-ID: <87ilumd2uh.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Tobias Waldekranz <tobias@waldekranz.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 12, 2022 at 06:36, Scott Wood <oss@buserror.net> wrote:
> On Wed, 2022-01-12 at 12:24 +0100, Joachim Wiberg wrote:
>> [snip]
>> +#ifdef CONFIG_PPC64
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.power_save=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D book3e_idle,
>> +#else
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.power_save=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D e500_idle,
>> +#endif
>> =C2=A0};
> In the 32-bit case shouldn't this already be getting added by
> setup_power_save()?  Though I see corenet_generic.c doing the same thing.=
..

We went for consistency with the corenet_generic.c setup, which as you
noted does the same thing.

Best regards
 /Joachim
