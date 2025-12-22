Return-Path: <linuxppc-dev+bounces-14931-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C662CD49E0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Dec 2025 04:19:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dZNft2jgfz2xpt;
	Mon, 22 Dec 2025 14:19:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766373590;
	cv=none; b=MIJFq2eYDcOSldUG1EwEc0NDJ0CjHQKKqUfZvvlyFuza1iyhPcR1XUipk5i7uW+kIZ/kVWXSmfl8YvlWLTiBQltxa9Y+hYWpKkf1FAMytk3B91Lc9MgybCgVtJKsixxbDXvVEIqwOxoJsGoLwpCa3146+cRKOjdIsKIRmNdbXKy+5PuKEGZFA3amxyfV5EPZm6KKXy099ybjcHOAKroQtGWvD3dz2XfY2z0qnNFCduLF0sIRL3Yqo/j1mUBu9C8VOOUSOSeMbstgHbQ42nwyxKa6cK20Pa8D0tDMtrN78Sodz9ddTb4Q5fWP3Qe3P08Ja8Jn1gdjruN6iBPbnaVbCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766373590; c=relaxed/relaxed;
	bh=dSEX9YgmDGq6W//WwbZ+YmPko80Tijktgs830EHMcng=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=J/U+pEpAIlE7Ya63O9OrkCItzoOBtXcg7CXTJdqGSYvh/lSzfW6goRrNhhocBDx10809yLY8UC0vVwsKG78mfpC3I58rwV7gtt3uS/ZWgUzpW8ZeoSi0Kau80bF/xyD5aySHXiJQ48ykaUOiwPeCNLjCwmm4cLKDsCTjPd+ALM7kLDVS7p2oWAJHWY3Vt+BWxpem69Yz9EqjXfH2EE+CZVaWKIVxRqwVCa5b56qW1xWY6dfUCUpjNAZBjJHE4GaVioIegc/s7RfN3Xe4u9d1gWoNAumoTy5mvrwAcAkxdLWgB47/U6INjKyes5RTDj/fZdnVpWNVypPX6vd5VT3Gwg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IoBFrxf7; dkim-atps=neutral; spf=pass (client-ip=209.85.214.182; helo=mail-pl1-f182.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IoBFrxf7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.214.182; helo=mail-pl1-f182.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dZNfr3gwjz2xSX
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Dec 2025 14:19:47 +1100 (AEDT)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a2ea96930cso38408115ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Dec 2025 19:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766373525; x=1766978325; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dSEX9YgmDGq6W//WwbZ+YmPko80Tijktgs830EHMcng=;
        b=IoBFrxf7yx9fpGcRcJP7jeEokeVQ8/Z0pPPIvgo2P25rtOwckG416zG3IuJ4R8llGt
         mEc6o3TyPYQtm+IR3/5nSqyWqWanm0F0/hP9p1hQCH09A9daCFDM5AoTb+Cc2rEVpKOl
         gHVHhiUxuuUAzuGsK2DKMFuKUpt80zdPB8sb/kJgHdzd09nHLtomBV3vjzdCrKOJwLcK
         iUHI1juhOVLD27jmGLQ7KekAU/d6dE72ozGunvqUBTghVCNkVAPbOlb4SaYspTnAqz6L
         BHVOQ094MkQmlWI8ADBlf0v9tHoN9dyYpRwiEuOZJWRdHJYASjY9T6XL6MJxECRC+X5h
         kC2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766373525; x=1766978325;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dSEX9YgmDGq6W//WwbZ+YmPko80Tijktgs830EHMcng=;
        b=edJiTlkUFQYRaK/dR4nirsfC/8mS+8td4YzUn+/wF1VpIGfMCUwvZNvir9wthzD667
         OlmvUnEuCQxOWpVFT1wNyJKmUwxDFO8WlaQEjXaZG2joiXBWGJI09DaWBZsikrWPSqwX
         Cj74xmR0AxCpHkLQM/D/uqWJUk01o5wT86mK3WzUXY3RobTMMu8lEro89C0Aw2b2iseE
         TTe6333BZ1+nQJH5zXWfNNm1vLf21kCdAALQOgMDOJB6M25X4oMs+mFfvLx5mmI+lKgl
         UOdP5vGvzrpXWqZIxfaDwiPUrEUIbYtx8vfB6Z6q1RGVVc0GmlWd6TMBxJ57ij9uyEWz
         7auw==
X-Forwarded-Encrypted: i=1; AJvYcCVH5OgPxiRySeSaUzkFjJompDmwXSUdjiyYJF7MJ3q8ke1FddGQZHwQw4Xn1nqSzyec9v6iZY26KvPim/k=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw+2PeOGsaRUt2QCY51Zh/olazviwoirrm3+UU0qEFwx9A0NDN5
	gjLOd99TmmfkH0vDjGDvptO+GQV8fgnNhYIwqj+9wFXbWiPR1i/5tbdd
X-Gm-Gg: AY/fxX7KRjNJsYAEQM9qHXoYblsdaxUSt4Me1CGq+Jr9OqvEXN7532N9fQ1KsgRjpMN
	GgYGYASDrgd7RV6uUb+7yrItnTah5Q2/9Ud5gthba9h9GrUWUTZuCrJANb1s68/JSiBYEIkfWgI
	wWpbumlMCkJ7pJNFxLNDK0jD+tc23+cziGCpDC1jFBau8q2dg6EXe/SokpM/FLFfPkiyhA0ePPg
	nRqMamhue5hZuK1978y/aIpHsQjklwkU9RjnwemQ2+oIw4os8o8411b5fHV20sQeQh8s1kT8i2d
	YJgRRj+MnNmxak5dEMAE/7TouF9eWcqPdR2DAOoaKEGnY6mLYXTFLpj2VFL80XpWxsPFl2A/aFE
	bxrPbaeHHT2xNHS3otT2ZWc93yEDbrrzmtxhTVh2qmIx66UVZadugHA24RmZrVSbq55RU+wINq2
	Er+rw=
X-Google-Smtp-Source: AGHT+IE25cnCTvyNKTbDCfkrMSOXNApuJseJLU6aD26Xlbt6oCT43145DxEBaionq8+6wAvphhVpBg==
X-Received: by 2002:a17:902:d488:b0:29f:2b8a:d3d with SMTP id d9443c01a7336-2a2f2202ccamr90870945ad.4.1766373524799;
        Sun, 21 Dec 2025 19:18:44 -0800 (PST)
Received: from dw-tp ([171.76.84.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d5d863sm79699845ad.80.2025.12.21.19.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 19:18:44 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: "David Hildenbrand (Red Hat)" <david@kernel.org>, Sourabh Jain <sourabhjain@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Borislav Petkov <bp@alien8.de>, Christophe Leroy <christophe.leroy@csgroup.eu>, Heiko Carstens <hca@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, x86@kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] mm/hugetlb: ignore hugepage kernel args if hugepages are unsupported
In-Reply-To: <655cc605-2ce1-4ccb-8cc0-a0a31a9c89fd@kernel.org>
Date: Mon, 22 Dec 2025 08:42:25 +0530
Message-ID: <87fr93ky5i.ritesh.list@gmail.com>
References: <20251221053611.441251-1-sourabhjain@linux.ibm.com> <87a4zcml36.ritesh.list@gmail.com> <655cc605-2ce1-4ccb-8cc0-a0a31a9c89fd@kernel.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
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

>> Coming back to the fixes tag. I did mention a bit of a history [2] of
>> whatever I could find while reviewing this patch. I am not sure whether
>> you have looked into the links shared in that email or not. Here [2]:
>> 
>> [2]: https://lore.kernel.org/linuxppc-dev/875xa3ksz9.ritesh.list@gmail.com/
>> 
>> Where I am coming from is.. The current patch is acutally a partial
>> revert of the patch mentioned in the fixes tag. That means if this patch
>> gets applied to the older stable kernels, it would end up bringing the
>> same problem back, which the "Fixes" tagged patch is fixing in the 1st
>> place, isnt' it? See this discussion [3]...
>> 
>> [3]: https://lore.kernel.org/all/b1f04f9f-fa46-c2a0-7693-4a0679d2a1ee@oracle.com/T/#m0eee87b458d93559426b8b0e78dc6ebcd26ad3ae
>> 
>> ... So, IMO - the right fixes tag, if we have to add, it should be the
>> patch which moved the hpage_shift initialization to happen early i.e. in
>> mmu_early_init_devtree. That would be this patch [4]:
>> 
>> [4]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2354ad252b66695be02f4acd18e37bf6264f0464
>> 
>> Now, it's not really that the patch [4] had any issue as such. But it
>> seems like, that the current fix can only be applied after patch [4] is
>> taken.
>> 
>> Do we agree?
> I think we should document all that in the cover letter, an describe 
> that this partial revert is only possible after [4],

Yes, I agree. Let's add the above details in the commit msg.

> and that that must 
> be considered when attempting any kind of stable backports.

Sure. I would prefer if we change the Fixes tag to the one which I
pointed in above [4] (with explaination in the commit msg). However I am
still ok if we would like to retain the existing fixes tag and show [4]
as a dependency.


-ritesh

