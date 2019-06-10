Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 697793B7C5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jun 2019 16:51:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Mx112CrqzDqQ3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 00:51:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="X5g0JAvd"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Mwvq5mYVzDqPG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 00:47:19 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id cl9so3744509plb.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jun 2019 07:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=Wq53+njaY8Nizg87bnJv9I6awFz838NRdQghS0a7fkM=;
 b=X5g0JAvdV1k6T8yY6ZUvrcraWM4yMrG/lxJCK+nAqRLcZyfzQtXY4ZbYz6fOYHWy3n
 Ou8dcJ4J6pIL1UEocGoC4sPgamfUWIHesWmZ8UX6rEWSdzt9ISIcx9cBiIgBO1pLSbDQ
 bhOBx/V93amqxNh29DiYEna/vlDWwPNSH0HP8kuGzL0W2dnDnjJk1o+mR2xDI146xllb
 CGKw3KHTmadPXuq8gLrXsXWVk8oNjiQOOuOZXkERDlgP23OsxNnnrUkyJ5sqo3VO0K3v
 NviZJEwFJwnWh80oqJu8/n12fYX46vxiYKwSmmxCyHZAabHAJNThB0WoxME22CohL67N
 7IJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=Wq53+njaY8Nizg87bnJv9I6awFz838NRdQghS0a7fkM=;
 b=S0v66Obug6BOe9dyzdfKeXf56nJ9L3rmmztODsyKDG+DukdloQm6uwzw+GbjhU7rSG
 7jXj6A+li6+OB5gudd4xJ811OLBIyJB8qHfxi2oC5Pg++1ORLxcZxxnyt3Hu1aOKMLbg
 2ZUwwxBlOqFfk9vohZm2D4K14WOkHW96kkBYx2aWVhQPTbG5Gd/MLNYUTxvhrKVT6Wo7
 +L7/m6dJBvfdJwrmFC0qwoyysMXyulRsECQ0Pbyr7OzUQOQrz4DRoGdsY8z1auxeZjRI
 F1TNowLZHc7l0puBL+usEpxrVWNBennkLl/2f6AQ1ULJErvTUoIC4XXsJ9fgicasBtJo
 q8CQ==
X-Gm-Message-State: APjAAAV2eQfspkiU6e5AYdC6mU01mkZImyUcoUjdkODLk/nq8lzKTfht
 t/1yk6hN1sSICfKsCiOA7CY=
X-Google-Smtp-Source: APXvYqzO+K5a5izxxRmZJDOMMeEKbiwUXCm3sWfTX0ai2WfHFHXOFTxBzy4ayjR/yFM/5mp8uqkfJw==
X-Received: by 2002:a17:902:8f81:: with SMTP id
 z1mr4934200plo.290.1560178036097; 
 Mon, 10 Jun 2019 07:47:16 -0700 (PDT)
Received: from localhost (60-241-56-246.tpgi.com.au. [60.241.56.246])
 by smtp.gmail.com with ESMTPSA id p68sm4145337pfb.80.2019.06.10.07.47.14
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 10 Jun 2019 07:47:15 -0700 (PDT)
Date: Tue, 11 Jun 2019 00:44:49 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 4/4] mm/vmalloc: Hugepage vmalloc mappings
To: Mark Rutland <mark.rutland@arm.com>
References: <20190610043838.27916-1-npiggin@gmail.com>
 <20190610043838.27916-4-npiggin@gmail.com>
 <20190610141036.GA16989@lakrids.cambridge.arm.com>
In-Reply-To: <20190610141036.GA16989@lakrids.cambridge.arm.com>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1560177786.t6c5cn5hw4.astroid@bobo.none>
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Mark Rutland's on June 11, 2019 12:10 am:
> Hi,
>=20
> On Mon, Jun 10, 2019 at 02:38:38PM +1000, Nicholas Piggin wrote:
>> For platforms that define HAVE_ARCH_HUGE_VMAP, have vmap allow vmalloc t=
o
>> allocate huge pages and map them
>>=20
>> This brings dTLB misses for linux kernel tree `git diff` from 45,000 to
>> 8,000 on a Kaby Lake KVM guest with 8MB dentry hash and mitigations=3Dof=
f
>> (performance is in the noise, under 1% difference, page tables are likel=
y
>> to be well cached for this workload). Similar numbers are seen on POWER9=
.
>=20
> Do you happen to know which vmalloc mappings these get used for in the
> above case? Where do we see vmalloc mappings that large?

Large module vmalloc could be subject to huge mappings.

> I'm worried as to how this would interact with the set_memory_*()
> functions, as on arm64 those can only operate on page-granular mappings.
> Those may need fixing up to handle huge mappings; certainly if the above
> is all for modules.

Good point, that looks like it would break on arm64 at least. I'll
work on it. We may have to make this opt in beyond HUGE_VMAP.

Thanks,
Nick
=
