Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1195F301BC0
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Jan 2021 13:08:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DNsGN1NQMzDr3f
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Jan 2021 23:08:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::530;
 helo=mail-pg1-x530.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=N1+Ohqsx; dkim-atps=neutral
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DNsBP5Y7yzDqlc
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Jan 2021 23:04:58 +1100 (AEDT)
Received: by mail-pg1-x530.google.com with SMTP id i5so7062285pgo.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Jan 2021 04:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=PDAPpKGJ0bTpmZBGx4ylhGlHNA52pbsxkqqZU/p/cQE=;
 b=N1+Ohqsxn1BBliytIL9FWntOw4uoZXJpJmq3olgCDZcMrsdKpIjBtCdm6Q1jifEvmr
 kKRew8+LLCRezG16J/ebB8KtQ7KiCQNFkVwXeQHonGKnLwdx3pnJMlwxY2i71MIQnrvP
 N7GzBDYqlDwotX3C5JSVYTSqBH27RoWQJCvMG1YSJ3wyEYf7e7HaRXmXDBYUFxJqIhwS
 DxWX5BCxSNBYX9fXe2SdS/Mr0od6c3/i0ZtOT4HHqZjK/UdnhKU6ngpKD+oQLnfiNCbl
 pxAyJlUgQ66A38zjsN/RzOC23VxklUz+MxZ8XqfVIleSePqQl3Kc32R5kKbWcavSe14h
 rbWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=PDAPpKGJ0bTpmZBGx4ylhGlHNA52pbsxkqqZU/p/cQE=;
 b=Abg312Q8nY3NFBEHC88ejO983EQuil314k5/3I7fJw5Stil9XRtApaUKIvq3dCtkxk
 +jI4kLp3jsNP7YmOGbXexmP9R1I4kQ/gRH5KxDgcXyl/seTcmA+PSsegF8F/TwW/Vn7D
 ofLxrsBTakWA1/F3UwKcaGofckn7Fqop65vkLDujGj9Sz+uZkWIkwdD8n5s/a/Cg9+K8
 KOPhK0t/B6eKMG4/nCoFyMyNvrveeAddsiQrFgahjk69FcW1mLxrB6DsE0X7qGAbH5J3
 nDGglYS7Trz76DHC7E4Ny46H2FrqJ+zzjc6ZqEn6D9Z/BGnpl4JdluIg3ogKc7IOowGk
 ICvQ==
X-Gm-Message-State: AOAM532GkWwqctxXF8f7i+y7EEDjZTHr75xcxGweXBKY1u1+AUbYX7PH
 loO87ZXE1WGyMCLeu2U7OMw=
X-Google-Smtp-Source: ABdhPJw0uJzRaMZJamLkCUg0NzjWJZ3f8wx59FYHNHPFfq58pfs7SdkANYAREpz+MFCRwlu/xnW1ig==
X-Received: by 2002:aa7:978e:0:b029:1bd:f965:66dd with SMTP id
 o14-20020aa7978e0000b02901bdf96566ddmr1977761pfp.46.1611489894337; 
 Sun, 24 Jan 2021 04:04:54 -0800 (PST)
Received: from localhost ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id 78sm10076194pfx.127.2021.01.24.04.04.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jan 2021 04:04:53 -0800 (PST)
Date: Sun, 24 Jan 2021 22:04:47 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v10 04/12] mm/ioremap: rename ioremap_*_range to
 vmap_*_range
To: Christoph Hellwig <hch@infradead.org>
References: <20210124082230.2118861-1-npiggin@gmail.com>
 <20210124082230.2118861-5-npiggin@gmail.com>
 <20210124113636.GD694255@infradead.org>
In-Reply-To: <20210124113636.GD694255@infradead.org>
MIME-Version: 1.0
Message-Id: <1611489705.hu96tutmbn.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-arch@vger.kernel.org, Ding Tianhong <dingtianhong@huawei.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Zefan Li <lizefan@huawei.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christoph Hellwig's message of January 24, 2021 9:36 pm:
> On Sun, Jan 24, 2021 at 06:22:22PM +1000, Nicholas Piggin wrote:
>> This will be used as a generic kernel virtual mapping function, so
>> re-name it in preparation.
>=20
> The new name looks ok, but shouldn't it also move to vmalloc.c with
> the more generic name and purpose?
>=20

Yes, I moved it in a later patch to make reviewing easier. Rename in=20
this one then the move patch is cut and paste.

Thanks,
Nick
