Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 593417CC17F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Oct 2023 13:06:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Y5xvBPJA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S8rlS1lPxz3vYF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Oct 2023 22:06:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Y5xvBPJA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=lstoakes@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S8rkb04Bmz2ygX
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Oct 2023 22:05:57 +1100 (AEDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4079ed65582so4099815e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Oct 2023 04:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697540751; x=1698145551; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AiUZq92UBxC15IpKeVPOwaCF2WD76dOx+OyrOjWWdV4=;
        b=Y5xvBPJAYpaCMCdQKBtOifBs37DBN+4BWwgV2Ug1+xiMGbjhIiGLlQNUrQBNlLPz6/
         AfxjbWYM87nCt9FV2Uz4o6kYAGPbcbt3DxoAd5d7h2OyMOxiviR7w/lTbIDdKW3Tyzk+
         sZYYecPlss2VSPfYduTeB7udyv4IRM+nnqh7e1lGuCLH9bz4jKcfClty11yu9Bv0CmKy
         eYCAHzYDvu0IgeAmmF8b/Yj9bl6WqDirlqR6UHEv4mvzk3lGUB5xrj/35ihp4eMhVMji
         rNNT38t1KYTe52ytVmK3sP/nESfzGSLwr/BdDKIWkb4bJBUKKTBMdYr9ELtCmflJpqkE
         na7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697540751; x=1698145551;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AiUZq92UBxC15IpKeVPOwaCF2WD76dOx+OyrOjWWdV4=;
        b=hTxMlxdu8LodWV0B5ehdCEwwEvmYW9t3GWaON1KLLA1OdWaGQzbwXa0XnBA0UgcZdO
         Dk9kfw/EFjHotDpbw7KUZ/1U2vGXSueHb5E5Vz8bdVTTJZLpX8SU7CtXDYXsuaERlrrg
         LjKfMO2d99BtbWSlk2FyJIpIJbn+XcTODMk9KcTraLNxB2iAdktnIAYVlpf8vuHIXhaU
         HNfhl8JmLhesKwiXuYh31njmKrWmE0hybAhawAiLnv4cAj6UURSeKN/3oYpHwnZqtPDK
         kk7V7IjtMcGRkQ1AGrPmUUZpv2iwXApoMaOgn5xBJ2/o2Fk5YM8NnEPP3Ew+B0jeWLv7
         uZuQ==
X-Gm-Message-State: AOJu0YxO4zZSQRaEW2eiTya3EnHhmdf24xVokMQuT6Km3B/R+GDHPYbK
	7cNwg/klZd1g6zlbVmXrcAU=
X-Google-Smtp-Source: AGHT+IH8r10O9qZ3UlDxUNvskTPcQQNlonwgioxQmDJv+zEZx4FHDGV2/5GTWzEwPptLNjzJCJzwOQ==
X-Received: by 2002:a05:600c:a01:b0:401:bdf9:c336 with SMTP id z1-20020a05600c0a0100b00401bdf9c336mr1601636wmp.27.1697540751352;
        Tue, 17 Oct 2023 04:05:51 -0700 (PDT)
Received: from localhost ([2a00:23c5:dc8c:8701:1663:9a35:5a7b:1d76])
        by smtp.gmail.com with ESMTPSA id t2-20020adfe442000000b0032dbf99bf4fsm1421171wrm.89.2023.10.17.04.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 04:05:50 -0700 (PDT)
Date: Tue, 17 Oct 2023 12:05:49 +0100
From: Lorenzo Stoakes <lstoakes@gmail.com>
To: Sachin Sant <sachinp@linux.ibm.com>
Subject: Re: [powerpc] Kernel crash while running LTP (bisected)
Message-ID: <84a6c480-f29b-4a73-bbb0-4908145dc4db@lucifer.local>
References: <81C9E2C1-DCC3-4DDD-8466-069893398B5B@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81C9E2C1-DCC3-4DDD-8466-069893398B5B@linux.ibm.com>
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
Cc: linux-mm@kvack.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 17, 2023 at 02:46:07PM +0530, Sachin Sant wrote:
> While running LTP tests (getpid02) on a Power10 server booted with
> 6.6.0-rc6-next-20231016 following crash was seen:
>
> [   76.386628] Kernel attempted to read user page (d8) - exploit attempt? (uid: 0)
> [   76.386649] BUG: Kernel NULL pointer dereference on read at 0x000000d8
> [   76.386653] Faulting instruction address: 0xc0000000004cda90
> [   76.386658] Oops: Kernel access of bad area, sig: 11 [#1]
[snip]
>
> Git bisect points to following patch
>
> commit 1db41d29b79ad271674081c752961edd064bbbac
>     mm: perform the mapping_map_writable() check after call_mmap()
>
> Reverting the patch allows the test to complete.
>
> - Sachin

Hi Sachin,

Thanks for the report but this was triggered in another test previously and
has been fixed already (apologies for the inconvenience!) see [0]. Andrew
took the -fix patch and applied to mm-unstable, this should wend its way to
-next in the meantime.

[0]:https://lore.kernel.org/all/c9eb4cc6-7db4-4c2b-838d-43a0b319a4f0@lucifer.local/
