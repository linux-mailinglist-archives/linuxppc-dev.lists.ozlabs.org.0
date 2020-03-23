Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3C718EE11
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 03:46:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48lzKW3FXmzDqqD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 13:46:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=kWawHgty; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48lzGY24tczDqTK
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 13:43:48 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id q3so2230149pff.13
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Mar 2020 19:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=MOACunLSHcOQCjixMhEvPlpaC3HUhXI3tiJDwHvuJeA=;
 b=kWawHgtyq+mpAuDut96HBTAI7Z0OK7XwYm2bl11GCjYlaaK4QFPR4ndk1H+0wnWEDL
 r+FbarhT6PJ0hdXIVEsyjLvHURcErBCzHMSvM4yKnz+AnyDmPEY1quoDj8z4ptwF41ra
 GqBjJMJlFV9nMKSeJkZM+02gfnE8SjzVC1Q0dXGWeoce7TDCbrXl2s7jjyRgQPNGQG/x
 xR8WbFmuwFQalI67JX+ltyemiaeudhOZ0v/hRSNA9V3bZttqCx1dqmTTz4dusl+WGTkK
 8CVGG2zipIX6a+R1ecx/U4TnRTROBgy3gh7wU67DgffCF3Y/VRil6qXFSqdlQT0VTGVf
 gc8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=MOACunLSHcOQCjixMhEvPlpaC3HUhXI3tiJDwHvuJeA=;
 b=S2NOahji0eZelJ4y+nuz8sdBlbbLhmOcu8Rt13meqS2KpaLpb6XmVn0yJr1goHIquD
 UlC+xE1HhdOw51w0ImZ5EGIcsO7p2mrEl2w7zfWVG2AvwJsKuwtfpbilATATVlopoKXE
 n5gGOtNZx+JGclFXQxKBr98vUSAwPL6q68pwnTfojsZVi985fZTKbulkUEg6VSRQHuAc
 K2QwA7JEcz/eyF5LrONqmG96MVotcJYgs7+wEiijdJzDNlulHcfaIBvTz/DWceGf6WS5
 epH1jRbOfc/lkn83niInCbLAESy8RmlxA8xf2zlNkD/PytYxivieKUVzK+ddEwOh6ZpH
 Yptw==
X-Gm-Message-State: ANhLgQ0cAAJQhfQ48ZEtRn+kV8FKAv2Y2sxJ5Xi9j2GP0d+jVwpGC5SY
 mmRWHzznRsGXTiBNVNwQo9E=
X-Google-Smtp-Source: ADFU+vssy5OxEk6JmNvO9krFqQUVHnHCzYfcUG2SzEBUjcry3sQjTdYT2hKOGlEBFfxr83U0Hi1YXA==
X-Received: by 2002:a62:1d1:: with SMTP id 200mr23037147pfb.8.1584931427024;
 Sun, 22 Mar 2020 19:43:47 -0700 (PDT)
Received: from localhost (14-202-190-183.tpgi.com.au. [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id d7sm11975957pfr.17.2020.03.22.19.43.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Mar 2020 19:43:46 -0700 (PDT)
Date: Mon, 23 Mar 2020 12:40:11 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v8 11/14] powerpc/vas: Do not use default credits for
 receive window
To: Haren Myneni <haren@linux.ibm.com>, mpe@ellerman.id.au
References: <1584598120.9256.15237.camel@hbabu-laptop>
 <1584598722.9256.15262.camel@hbabu-laptop>
In-Reply-To: <1584598722.9256.15262.camel@hbabu-laptop>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1584931140.88q80wx2at.astroid@bobo.none>
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
Cc: mikey@neuling.org, ajd@linux.ibm.com, hch@infradead.org, oohall@gmail.com,
 sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 herbert@gondor.apana.org.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Haren Myneni's on March 19, 2020 4:18 pm:
>=20
> System checkstops if RxFIFO overruns with more requests than the
> maximum possible number of CRBs allowed in FIFO at any time. So
> max credits value (rxattr.wcreds_max) is set and is passed to
> vas_rx_win_open() by the the driver.

This seems like it should be a bug fix or merged in the NX fault
window register patch or something.

Thanks,
Nick

=
