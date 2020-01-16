Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5155513D220
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 03:22:06 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ynyM6WV2zDqSM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 13:22:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ynMk3fDczDqT3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 12:55:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=TxbbT7bq; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 47ynMj5mgvz99nb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 12:55:29 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 47ynMj3l2sz9sR4; Thu, 16 Jan 2020 12:55:29 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::743;
 helo=mail-qk1-x743.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=TxbbT7bq; dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 47ynMj21nFz9sPW
 for <linuxppc-dev@ozlabs.org>; Thu, 16 Jan 2020 12:55:29 +1100 (AEDT)
Received: by mail-qk1-x743.google.com with SMTP id x129so17706491qke.8
 for <linuxppc-dev@ozlabs.org>; Wed, 15 Jan 2020 17:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KziSU7BgSSBkEHlynzOHddEtZjAE4pgRpPycCBuIKFM=;
 b=TxbbT7bqziKaaFFzMYWisGVgr1T+MP47pr7kVdY17JE6gZl5rY9IePWy+DeZB3xCL3
 ltRffk5gOsqjw2L8wi7llacSDPO0AGRKHezIdZaM953JEbsOv+ca9xEh1UyVnIUP3pKF
 9nX2AJdyuYX1vmYK71S68OSKX4zSNCC80JsYs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KziSU7BgSSBkEHlynzOHddEtZjAE4pgRpPycCBuIKFM=;
 b=T8BFjMdvBdZLaDB6PmR4/m5qxZXSRaN2aMjX1teKLLm4F228VOd9jPSa7vd7QwEZyQ
 bmRmtPQfBxb68oi0ZeVmDTs8PrVynTaq1uLRuMX+N+HU3rWoCf2R+Tc9n1FZyuML9kUN
 tIqoR5aP9PKkQ+pzllLwaiXIw6vslQAUEQev/ngtEXL3zw/duHwvioQTjTuWfQ8K/3Es
 ttE7tlk6nygwv8w+UlifjsH6qoo3nQZ62Mf5bOuRikcB/9RbenFjuRLyhWUdX0k/iXCZ
 3jnABoBMrq/zSHpFS7NEezd/qOStisGvrcjjPVVE6AZuxapkKXyVj2eRI4M4rRK9MuWe
 BCuA==
X-Gm-Message-State: APjAAAVN9t7aEiyQnrKahfbFonN+l6qhrdRKr7rSAYpvrc2rTvTk1Im1
 S0QMdsybbF8c1XssIX/r5xJkQDMGeYJukmI5/9Y=
X-Google-Smtp-Source: APXvYqwvYR9mNFwvSSK8uMgFKTEnLL5qs1xBl+uv3vKiCMhSjAk8B57dkT3y9fvJcWS32Er+P6feypoTcO2hhWfmG6w=
X-Received: by 2002:a05:620a:48e:: with SMTP id
 14mr25729188qkr.292.1579139727235; 
 Wed, 15 Jan 2020 17:55:27 -0800 (PST)
MIME-Version: 1.0
References: <20200116014808.15756-1-mpe@ellerman.id.au>
 <20200116014808.15756-4-mpe@ellerman.id.au>
In-Reply-To: <20200116014808.15756-4-mpe@ellerman.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 16 Jan 2020 01:55:15 +0000
Message-ID: <CACPK8XcVW5FeyWNNnj94pcJavogxHw9U9UuOpMmyJjNu-YxOLw@mail.gmail.com>
Subject: Re: [PATCH 4/9] powerpc/configs/skiroot: Drop HID_LOGITECH
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
> Commit bdd08fff4915 ("HID: logitech: Add depends on LEDS_CLASS to
> Logitech Kconfig entry") made HID_LOGITECH depend on LEDS_CLASS which
> we do not enable, meaning we are not actually enabling those drivers
> any more.
>
> The Kconfig help text suggests USB HID compliant Logictech devices
> will continue to work without HID_LOGITECH, so just drop it.
>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Acked-by: Joel Stanley <joel@jms.id.au>
