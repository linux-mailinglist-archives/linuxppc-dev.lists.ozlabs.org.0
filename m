Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B44C113D222
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 03:24:01 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47yp0Y2C6xzDqLx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 13:23:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ynN03ZPmzDqTK
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 12:55:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Hw6/QtEa; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 47ynN02FDsz8tnl
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 12:55:44 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 47ynN00yxZz9sR0; Thu, 16 Jan 2020 12:55:44 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::841;
 helo=mail-qt1-x841.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Hw6/QtEa; dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 47ynMz6FZ0z9sPW
 for <linuxppc-dev@ozlabs.org>; Thu, 16 Jan 2020 12:55:43 +1100 (AEDT)
Received: by mail-qt1-x841.google.com with SMTP id w47so17614501qtk.4
 for <linuxppc-dev@ozlabs.org>; Wed, 15 Jan 2020 17:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7nv34PHrN5VOk4Wy41EUm0tFWCKxqvmzV5aGh+yvC3A=;
 b=Hw6/QtEahY43J7NbU/nhrk/NB3vzEOxQr+DgHRXHPyhKFO88xxK20xrBoERlmL8Afi
 duz9612WR0DqhTY0YFP5WiH0jKWwnTUxqbjXL+MqIDSCBBepfGr/m3f3wyd8OB4rkmhh
 vSKlvz6TB100UjY4yJLG0R/OtF3+UmRwaOQrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7nv34PHrN5VOk4Wy41EUm0tFWCKxqvmzV5aGh+yvC3A=;
 b=XVM8smnlaJ3LURi4Xse+j5/9JDX1phK9EOmx6RRt5JTNJlUv4e48blSreCmn4i3QeS
 cH4ydNeBc8I+qReIOj/ZOnPG+Ko3EgR/K10gaLLYk5HKNhtaPnMs+wYWD4K9r1k6znIC
 uMDmFpmlACD03YnTLESkV+l7sb/t+z07KlhPUP8Lsa12rDKRcrcR4/zardw6Mum+jVkj
 9qpa7wOBzBURy+L8hq6AnsKJXq6YtxKfOzcJnDPJA2GnCQaKLMSYETOYDqoyNM2tmth1
 PJxIdJVNKMqD3fVyplnvnsv1q6jBhnZBmh9+BHK4ivMlxruvHBKRcul6rGrpLCzvBFiO
 sOJQ==
X-Gm-Message-State: APjAAAWh+FTvZrTI3VyL+5M/BydGHGXhU0vXR8fDkIh3TTzNsEXLPpM/
 aKpdymJC5iq6B68IoVvUXyUIpduiASEdkqWb4/fhMIcE
X-Google-Smtp-Source: APXvYqxJVoHYJxW0wq6uB1YYcXejjW7pH9TLwSM38stFIqEK3W6A5A71vlIOuMWs0JuZFvPRNiF6SL5Znk3Af317CLE=
X-Received: by 2002:ac8:4244:: with SMTP id r4mr205827qtm.169.1579139741759;
 Wed, 15 Jan 2020 17:55:41 -0800 (PST)
MIME-Version: 1.0
References: <20200116014808.15756-1-mpe@ellerman.id.au>
 <20200116014808.15756-5-mpe@ellerman.id.au>
In-Reply-To: <20200116014808.15756-5-mpe@ellerman.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 16 Jan 2020 01:55:29 +0000
Message-ID: <CACPK8XekfmGakjz-n-StWucokiEvS98D9fpjDRhbRzjP2bC78Q@mail.gmail.com>
Subject: Re: [PATCH 5/9] powerpc/configs/skiroot: Drop default n
 CONFIG_CRYPTO_ECHAINIV
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linuxppc-dev@ozlabs.org, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 16 Jan 2020 at 01:48, Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> It's default n so we don't need to disable it.
>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Acked-by: Joel Stanley <joel@jms.id.au>
