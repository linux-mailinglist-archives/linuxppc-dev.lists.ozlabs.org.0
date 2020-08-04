Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2620B23B2BC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 04:23:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLJTk3qPlzDqTJ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 12:23:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::544;
 helo=mail-ed1-x544.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=HTi1knJ5; dkim-atps=neutral
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLJPB1JXnzDqLP
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Aug 2020 12:19:58 +1000 (AEST)
Received: by mail-ed1-x544.google.com with SMTP id v22so17891642edy.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Aug 2020 19:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jtJdFKxws3rk6Kv5RX/K2SLskoL0tYBd/0pBPcg+xxQ=;
 b=HTi1knJ5m81qNlbkzF709jydiZMo5Ww9NRlzRy5ylwcEACB4m1i+mv30uG3yzUwQMw
 zwwsRrj86H42E+Aa9HbsmWWScGRGibBbdb7cl7c2/1uho3AdML/J2Xt8dIlfs1u+VpFu
 2yCXz1LOWIWTIAKRQR/7qPeig9NxD/e8aCEbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jtJdFKxws3rk6Kv5RX/K2SLskoL0tYBd/0pBPcg+xxQ=;
 b=Uab6bBcU6I2dUTOzMQ19RYFzj7juGgXD0/8o/IbQsliCHQm70ljndLwOO8Jd6U2rCk
 G+vz5MwANcBMcibCcQab6AuMslmEli4z4+8/KZIqpHcXzZ//R4JVlxHBIIvDe9B2iLol
 AVRfhBs64Flgkn+J9QibRAWAChq9/w5ulARb1K3kTQ8lm9cNdQQi3ryGsRvpbLLJvyA0
 KXhSgYRQvar0W/JZxJZyEWpb348P8JcHLBQhOTyQsprEbem24XuOZz5b8YC0J6QSKNKr
 04dGndR54odB8YB69u61dML3sjHxF+D6sc1oBlJu3B2kSeMHU7VrcX3XaE1SVb+bH0zc
 35DQ==
X-Gm-Message-State: AOAM530/4gqom3+TkVzjIUhWgH/xIQi4d6iMCBACKdIsh8gY3JLhPXMg
 A0nDS5wITJZN2H2kw0JwbpofGYrr189MqVY5rBcSYWrS
X-Google-Smtp-Source: ABdhPJw2Fi8po7DuBGI2dTSmGjbCvudvykS8wQ9tk5hkwu7oaorawZ/yEqCPQIX4UFCj6+/UPK6UqvuUDzQVBqWDBUo=
X-Received: by 2002:aa7:d1c6:: with SMTP id g6mr11118690edp.232.1596507594259; 
 Mon, 03 Aug 2020 19:19:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200804005410.146094-1-oohall@gmail.com>
 <20200804005410.146094-6-oohall@gmail.com>
In-Reply-To: <20200804005410.146094-6-oohall@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 4 Aug 2020 02:19:42 +0000
Message-ID: <CACPK8Xex4UVoE3Aw8Qiqgufujs2LH16_jQzzvi5i9xp+5fiJww@mail.gmail.com>
Subject: Re: [PATCH 5/6] powerpc/powernv/pci: Drop unused parent variable
To: "Oliver O'Halloran" <oohall@gmail.com>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 4 Aug 2020 at 01:06, Oliver O'Halloran <oohall@gmail.com> wrote:
>
> The "parent" variable in pnv_pci_ioda_configure_pe() isn't used for
> anything anymore and can be dropped.
>
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>
