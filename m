Return-Path: <linuxppc-dev+bounces-14533-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE2CC90FC9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Nov 2025 07:49:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dHkRb14sVz30B4;
	Fri, 28 Nov 2025 17:49:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1030"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764312555;
	cv=none; b=l+MelB1rvCsBdgEwp4fKcZONuspYBBSCZokjNN1Ceo0PQHAArJQpvXE8rhMMWnBfgc8luRLm9xAj7nZLvd55VSqz8/V1hF0gsgwIZzu+HsqkcHfXkNIFvTvgmkl9ukw7UA+1L06ixDhHRL5836T3Rj733LwnIVTKRr31m0+8CQFj6Bs7YytHNANM5J/ITN70fTVm7H7cWjXMtIjS5BxS9yMv8MuSsSL7fy9vrCuGjYX/QlRIbm86D9KYRS/ZJQEy567Qbwsy0+LARAm/iOrFJVDMDP8sSouzNSR53DPltRnIS9Iet7AkZfZqEDKV7oSUEwq4gpfTPP2dvdLJCDGq+A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764312555; c=relaxed/relaxed;
	bh=q3nBKbhWjGsI1f8A3Frg37H1KPv1WKKngUTmjZYjP6w=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=hrCqO2y+oMs4ITBu9w98Fm3TrZTaaR/YZMRjPJmNjlBVKA4/K+mhXJau6bxCQPnkW8xcmS90d7M9qYHqveUj/Qm0+lDQxYrkecF4GsqRaIdh0f6ehFj8f/PLMqedqJS91h7Mcs0cgrEb/EKkZOJ93VMudH1LKMLM0n4vVVmu7P8+8lN0njJzRfMWoteTz3c2EQ6rucaZedApB+S/333dXqSZRpmWfptUOvVgCo9U8JXvaNmgFt6VTThpPkFzbi26tlk8dYBEHHfXr+e748WmDcviZ+ezod8l1QqFtI5EzB2hzSCtMpPBJo3DPk518oXz7zrGe6/cUPq/k/cNF48BmQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Kx214RV9; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Kx214RV9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dHkRY3MWMz3069
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Nov 2025 17:49:12 +1100 (AEDT)
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-34372216275so1609131a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Nov 2025 22:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764312549; x=1764917349; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q3nBKbhWjGsI1f8A3Frg37H1KPv1WKKngUTmjZYjP6w=;
        b=Kx214RV9C8TMyKMR4zIUqrRMqa/CsJ9+ZqSMgV2oIVSCWk0hjS4InmHb2lCnf8g5XZ
         2LpzvZEdPax51ji0Y2+Rp93pQ4WPKbbgFa0M/s+QLoh6LQ9YSWFYR+lctp06iYd6mQvM
         eq/tbabpw3+RZYp4V7v+3fOop+fnuuF8+VPKM9ykjSgR+XYecMdLxm4TUDm+hbbunhVa
         Wy/pRht/8dI5mvojBlzuBupB8w7xrUjoWUVANcs1kVH/xtCGLy/gvgxT7uWwFwU+xvOQ
         8vJBtzT6RrJrbTucbqKsbD5rkccAo11fNtqi0fT5SMuutCeyz31u5gCyWKr/wEDIlfdj
         XUxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764312549; x=1764917349;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q3nBKbhWjGsI1f8A3Frg37H1KPv1WKKngUTmjZYjP6w=;
        b=xEKBX/3KbThH4v4eE8qcU1gu1xoURJ0cH4IvZa3AhglqybmSqRP838pyDJLQtrjUcv
         vdGvv5SAUzrZoBGIOjHjc36rpf38yB/r22B5VTZOODizVVkH8gFDC9NtCX+hUocVnpUD
         kCeNH8a7Kgt39Lpvk21lbBCm+5gTVH7c2/IIdpQaLaa+FQV4ZiNUQPBXu1QQYePN21Dz
         HDbzrHNk2gFKN5ncdbykzcbJirSI16hLsojqUg9ic3uOGsBO42QuHCgqJZyR7EbMvngL
         VH487gW+XXCp9HM8dmZJY/L/DUggKpmnZMkLr9SGxKvJHFolQDkEpj6wku6bm92QJfkj
         ZbHg==
X-Forwarded-Encrypted: i=1; AJvYcCWi5CsnjP58L2j32ZhauTgb6lgXtAPUh/91BNHvCQVRokKRfJTz9rbxOHQHNXnaVZLoER6EK0vJcyPSQto=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx+0DoFx7X952wdj5HVucTtW0BLRQMS5UiqlTXWVUNFpWie4Wzd
	kM8HPic9asHonNTPzGMaVcZZXxSJfFFhPIw+c5J8rau58GhmbHLqsjF8
X-Gm-Gg: ASbGncsjEz8LmxscPH8JqGdIa4vuecpY7RKPJOn+vyhA8Fl/uhuamE8yBRkysIoDO+T
	gqSNQVoStqEOz/CDPK0toF7SZ6FYV7EKaccXT1QSqno2wlQwC632xhoxStcquQ7/VDfUpK2fXlk
	TTsx8W5EdvZ/zGKJF2g7BdCbEM2tjwOQEU9BBTxpRvSfD3BqtWMdFVcR3jjS+txQ9zSEFLpCgYT
	zoXfZZqKFEMC1vcNg/bqf3DIxewcDu39Bi58dhIc0PCwoextv3uu8NGM8Mp/pPZE5WRIUpZjuLd
	GVM0r/iS1zL/XcVi9u/7vTJslSYPpmp3qvza8zAaudHl19/S3Xy4/NFq+ZJHjBpKdRCbQEb02hA
	syqAZ57VTX244p6Q4SR8Cbc0w2h/zgM0WE7Sb9BGoz+dN4NhXd1qQbDuNqlvZ/GdI5lkJQADcdf
	OrHl6CVg==
X-Google-Smtp-Source: AGHT+IG+VLt0S3DJUgOgmVzuijavKzJxJCzMRYjobHFYCx8VNooM1NPLy8P93aJjkuMvTTzJO3xJvg==
X-Received: by 2002:a17:90b:578c:b0:340:e4fb:130b with SMTP id 98e67ed59e1d1-34733e92f94mr26758791a91.14.1764312549468;
        Thu, 27 Nov 2025 22:49:09 -0800 (PST)
Received: from dw-tp ([49.207.234.175])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3476a7a4c12sm7680738a91.9.2025.11.27.22.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 22:49:08 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: "David Hildenbrand (Red Hat)" <david@kernel.org>, linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v1 0/2] powerpc/pseries/cmm: two smaller fixes
In-Reply-To: <557b5500-412a-4d26-8c4b-147c9a00d5fd@kernel.org>
Date: Fri, 28 Nov 2025 10:35:29 +0530
Message-ID: <87zf86n3vq.ritesh.list@gmail.com>
References: <20251021100606.148294-1-david@redhat.com> <557b5500-412a-4d26-8c4b-147c9a00d5fd@kernel.org>
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

> On 10/21/25 12:06, David Hildenbrand wrote:
>> Two smaller fixes identified while doing a bigger rework.
>> 
>> Compile-tested only as I don't have an easy way to test right now.
>> 
>> I would prefer for these patches to go through the MM tree as I will
>> be sending out a bigger version soon that is based on this series --
>> I split of the fixes from the other stuff.
>> 
>
> Ping,
>
> I tried to get CMM running again (using the simulation mode I introduced 
> a while back), but so far my attempts to get a reasonable powernv VM 
> booted in QEMU failed :(
>
> (e.g., Fedora qcow2 images use xfs, but the open powernv loader is based 
> on a 5.10 kernel without some mystical XFS feature ...)
>

Sorry, I missed seeing this earlier.

Do you have the link to simulation mode which you are referring above
please? So far I didn't find the support of this beyond Linux LPAR
(pseries), but maybe I missed it.

-ritesh

