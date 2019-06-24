Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B781C50019
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2019 05:14:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45XDt36lLDzDqTd
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2019 13:14:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="EyXw59q2"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45XDrD3MmQzDqM9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2019 13:12:59 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id cl9so6025352plb.10
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Jun 2019 20:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:user-agent
 :message-id:content-transfer-encoding;
 bh=BEvFqNe777Q/K8PaK7/7Bw58FJRW96XS2nwtDxe0BE4=;
 b=EyXw59q2+HTuKoKBfA1PF/PHkuMzQH0+ZpS5SdLBW9LaBQXGVS9GVHRsPO3dlz+ocW
 iwHvEsdZ3CqSQSNAkl4Ja1DPAQZjc0ALFPsmJL6o1O2904+PE1zLV5HSN70tVtIo9KlX
 eYAN9Qg7w+6b6ykkQ51C8y/uyRmsknmAyYlZZ/otFZ6ChDU0byzt3cRmC3l73NzBtsd3
 VmwewhMSB1kFxX+z2pFzFp5BiAd4/VIXqtQVBvZKatHgd7uVcHlTrzTa9Y6SdjqWEc3E
 DzrRzl3FhspTkxrScLh42YwPK3LXfQwXO72a4w8YhlZWTQEE1ZJk2Mp34SJflkTNBSLB
 eQdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=BEvFqNe777Q/K8PaK7/7Bw58FJRW96XS2nwtDxe0BE4=;
 b=NLmFyI95zzp1lX1Z/4OjSBIy1a/ARgLCtn3n1+/uuwXteweTY/9gyP8NdJZLBc5xgT
 CtO2iv6WKBILZqqVfGguaAAv4I8gsBBvJDXprjSuSt4m9vMR4qKypO97dcflEzfDwKi7
 4xgMD5nndd5zQtHzCKuxqU9bAbuH9LOTNZ9PPoK82vp8PxalAim6j1Y9i34kpmcoSFPb
 NPWSlvcDBCHEJZiHIVdlgowukf6o8kXo8RmTH3KQ39+F/2Er64KUCeGc6OStHaqAKGcu
 XuYHNF94FZ7AuhHHlaSauxTvcRx9HYr0YKnBhL+rpXExqNmHavXDIBVudD3gtZiL9oCp
 50bA==
X-Gm-Message-State: APjAAAUKY69u47+XzVtImyM9aufcFrb45XvGjvVt695K3bk0f/xT7RMJ
 y7LaHZr4pW3GAJElvn32PV0WWAWM
X-Google-Smtp-Source: APXvYqxvZs8V9F3V4bcEywUhmDJMS8p9gGiT0JS3Roi0nDNDBL8gJ2RCTf4bp5GWvhFgTCZmBbdxoA==
X-Received: by 2002:a17:902:8f93:: with SMTP id
 z19mr58087065plo.97.1561345974489; 
 Sun, 23 Jun 2019 20:12:54 -0700 (PDT)
Received: from localhost ([1.129.240.37])
 by smtp.gmail.com with ESMTPSA id f11sm10078024pga.59.2019.06.23.20.12.52
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 23 Jun 2019 20:12:53 -0700 (PDT)
Date: Mon, 24 Jun 2019 13:12:08 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 2/3] powerpc/64s/radix: ioremap use ioremap_page_range
To: Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev@lists.ozlabs.org
References: <20190610030818.17965-1-npiggin@gmail.com>
 <20190610030818.17965-2-npiggin@gmail.com>
 <1a9a36aa-f2bb-1ce8-78d5-ddf24e336078@c-s.fr>
 <1560915874.eudrz3r20a.astroid@bobo.none>
 <19abe0c7-9d58-73f9-d1e9-118e95a7961c@c-s.fr>
In-Reply-To: <19abe0c7-9d58-73f9-d1e9-118e95a7961c@c-s.fr>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1561338208.fzkdxt4wa2.astroid@bobo.none>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy's on June 20, 2019 2:25 am:
>=20
>=20
> Le 19/06/2019 =C3=A0 05:59, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Christophe Leroy's on June 11, 2019 4:46 pm:
>>>
>>>
>>> Le 10/06/2019 =C3=A0 05:08, Nicholas Piggin a =C3=A9crit=C2=A0:
>> I would like to remove the early ioremap or make it into its own
>> function. Re-implement map_kernel_page with ioremap_page_range,
>> allow page tables that don't use slab to avoid the early check,
>> unbolt the hptes mapped in early boot, etc.
>=20
> Getting early ioremap out of the picture is a very good idea, it will=20
> help making things more common between all platform types. Today we face=20
> the fact that PPC32 allocates early io from the top of memory while=20
> PPC64 allocates it from the bottom of memory.
>=20
> Any idea on how to proceed ?

I have to have a bit better look at other arches and our platform=20
code. Without having looked closely at all the details, I would hope=20
we could use GENERIC_EARLY_IOREMAP without too much pain.

Thanks,
Nick

=
