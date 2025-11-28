Return-Path: <linuxppc-dev+bounces-14542-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B1BC91B2A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Nov 2025 11:44:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dHqgK0PB3z2yrg;
	Fri, 28 Nov 2025 21:44:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1031"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764326684;
	cv=none; b=NopKLY5av3mhPoCXsr8MNFw1SG0fhJYFcYhTu/JZlhK7mebk532DpSoeDeSlZOJ2LR/Ys8vL4tKBWlrZaEi8AMgwv0f0IGMP789K0xSx4F+434gSMel4KSevGVaxv9ySVtTlGUrzXFoqZKCCM/1nVGDOyP0RXDMBnKgZf99wNJbp/f14k5VoJuUVcoC/cu6P/cD7WthoWZoQCQU2OKyrRm1FfPPfsGSVB19M3MXLXyMWsKOf5/i0OIwPrbbgsMHPeGDqcAXbT9FjVrqt4guGPhLzZyE65oGh/X8typjdNF2lFS/mI7J6uQLgQyJXNBiLtIJ/wwxjJ+fsvOkWH23teg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764326684; c=relaxed/relaxed;
	bh=/3UNOdECGML4434dXSC9vT4570MnbL2LpUQEqXY2+FM=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=Mc6JuZCn/e+8vfGjGFHS5B3F6lrIerP3mJelnCjfAFzw2Y1IyPWt523l8OGtsxvIxWYiTzQfsM0p5+ztjbsjNkf0+/D3Iz5njXtDhWM+V3bUnWiUweO9Sm8XVxT3+USu81aO8NqIt9oERwpZ2DaE4eBBV2k0Lqpp1F/zqFLFVxABDAobYn5t3Pyn6yDipCi6CpDfnoqz8eYThDQtPZPHYjLLn3GCch2fFLXohSxDO1KgIPi199QgBnWWnF1ahz+/4zwVK/OpAnqLswCM6bf1t/WPzFvbAeuDwzyvkvtQGLxVvEeTAe4Q49TGUAfT7ZaVM8hqFNenyodsw5tzl8Vz9Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Vuc7evv2; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Vuc7evv2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dHqgH35Jxz2yFs
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Nov 2025 21:44:42 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-343ff854297so2246838a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Nov 2025 02:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764326679; x=1764931479; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/3UNOdECGML4434dXSC9vT4570MnbL2LpUQEqXY2+FM=;
        b=Vuc7evv2ZKXH89Z8eTfQbi/sIsWknEpZi8y1y5Ogz2O0mcq2XCx48njlZxiIfaw1lR
         /uBKc/sAMJlUMhGp3r4wB4C3iXHP1adocnTy8ZtJ4Fr/AWDX4NdTKP6hvK8+qCVjcgA3
         ZYv/eTeTETHasX0Qjt1uqOfTN5uEwYf/2z6dSnyzxCdCda7C6fsLtbuQocXxwEJwaHGH
         RlmuIOpm9Yk9IkaZce+LSBOuO2KavovJFs+TLOUWTbbeimrVnDSWzkpaPj4S0Debn1m2
         Vwb78w6WoLmaJIgAjEe8/QAYokhKqwVUDw3Sq0BJ1RkY0GAH+E3X1rKQfLvNWE9R4ng7
         JhzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764326679; x=1764931479;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/3UNOdECGML4434dXSC9vT4570MnbL2LpUQEqXY2+FM=;
        b=Mkz4IkSXPz+13xXMwPI61cpEdomT0+dV4MoK1lrf3QKYTonfC3+r/nXVO+4x51eqEy
         /KYUfSKNXDBCWhSivsnSLbqo7Bi0KtQM//S4/ypK2ZGePfdiNcAwcEDOg4WS7oXJUUfc
         d0LuxF4Wcx2an0EpNapJJDiNhFWVBXlPYL6JcY/3WF+cJnexCKoqV70Qj1dbGJftr6yZ
         tIMfCXhOfzrhWBAIl/Hb/9nd4rNVY1X2uzlgFyPB6AqA3YDODt4qhZXqA0kldfnkGoLu
         BPZPbzrUX3mh0Kv/R2Omyn7CP/1hWocR8V0xt/T7S5MEcUN1Lla3z95j4zy+LSSwCEFc
         DfFw==
X-Forwarded-Encrypted: i=1; AJvYcCU2PW0hehCJEL76A223S9y5b/ZQ6jScqYxFD/aDFK6Lm5tyvmY0/AbcdHr0Hk2Qw5p4ir5g7KsxFtesi9c=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzICwlznp6Ks/I+KXi+tzeqgrRCU7Ezz5edUUQ6A/yveN47JBPa
	9aAM451S9v2DYVqzETZ8dq9LqH87j2QF/hQWeN0BZasTfJMfbK7jHqRN
X-Gm-Gg: ASbGncvrTdTA5b6KOgkpaausUY0DmFpb0OC+q1nGbeKVupfV0Q4UexLgkH0P4Cenfhd
	9fbGfoQ3iqL+ujYeRUgERaNUIt889pHQFqjEIUt4VIdJe3QBN0KWMgioR/Gb3vOwVu7YB6mfRfx
	7Ca5GigJsWloegoLVRyt+YCTkmiWbKuChhzsZhUMarvH8xX0TIjAO8wNsVSZtu62FyTSffB+B4u
	DMEB9SVRn8iZqGsYORcmK+WMt7EqfR8aBDCR/aTkYjH7vceDGXU8e0k1sx6BtZssI+yFCBoIpHw
	ID65OzUtt8bnjf1J4V7zJhV4yIaSIfz5nssYCsP9UggpTBVj98fseGdqjg/VsbUGZ3ZN+eUdZ4f
	ROcIxjVF7vrqUh+B8/8QsJGmFV21kkALpPwS3UA4wN/6nGqVK8v2FUVtHxbQR3c3DUjYbreXqZr
	EGU34uUA==
X-Google-Smtp-Source: AGHT+IHySGrEhslcddiDsWyGiuUGKUH3oJsCwwn3sNjphn+JRsycDU0fK9T8rv64Q7YwDQvk+pmHog==
X-Received: by 2002:a17:90b:48c5:b0:345:badf:f1b7 with SMTP id 98e67ed59e1d1-34733f3eb64mr25904802a91.28.1764326679392;
        Fri, 28 Nov 2025 02:44:39 -0800 (PST)
Received: from dw-tp ([49.207.234.175])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3476a7a4c12sm8416592a91.9.2025.11.28.02.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 02:44:38 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: "David Hildenbrand (Red Hat)" <david@kernel.org>, linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v1 0/2] powerpc/pseries/cmm: two smaller fixes
In-Reply-To: <189ac734-b194-4b52-9752-18d8c0b71377@kernel.org>
Date: Fri, 28 Nov 2025 16:10:47 +0530
Message-ID: <87tsyemocw.ritesh.list@gmail.com>
References: <20251021100606.148294-1-david@redhat.com> <557b5500-412a-4d26-8c4b-147c9a00d5fd@kernel.org> <87zf86n3vq.ritesh.list@gmail.com> <3cc7d401-c77c-4ac8-abb8-c264fbd9aaf0@kernel.org> <87y0nqmwaz.ritesh.list@gmail.com> <a3bb0e8e-72c9-4a9c-b347-e899ae29b289@kernel.org> <189ac734-b194-4b52-9752-18d8c0b71377@kernel.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list

"David Hildenbrand (Red Hat)" <david@kernel.org> writes:

>>>
>>> Right. Let me give it a try first with pseries Qemu. Otherwise I have an
>>> access to pseries LPAR too. I can verify it there.
>> 
>> Ah, now I realize my problem: I tried with Fedora 43 in a powerpc VM but
>> the modprobe didn't do anything.
>> 
>> Looking again:
>> 
>> # grep CONFIG_CMM /boot/config-6.17.1-300.fc43.ppc64le
>> CONFIG_CMM=y
>> 
>> So modprob'ing won't do as the module is built in.
>
> Right, so doing "cmm.simulate=1" on the cmdline in a Fedora 43 VMs 
> properly creates the CMM device.
>

Right verifying using simulate mode is very straightforward. Thanks for that!
So.. using various random echo X > simulate_loan_target_kb on a VM...

~# cat /proc/vmstat |grep balloon
nr_balloon_pages 16
balloon_inflate 1638
balloon_deflate 1622
balloon_migrate 4

-ritesh

