Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E50CE35B211
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Apr 2021 08:56:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJ2hd6P23z3c1W
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Apr 2021 16:56:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=IK2K2KTC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::834;
 helo=mail-qt1-x834.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=IK2K2KTC; dkim-atps=neutral
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJ2h80RLBz2ywy
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Apr 2021 16:55:49 +1000 (AEST)
Received: by mail-qt1-x834.google.com with SMTP id f12so7565765qtf.2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Apr 2021 23:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=70M/iQVUNidswIAQUv9GYNm20KvHkN2/8VXgR1NpNf4=;
 b=IK2K2KTCYldNtTWnQ/7s3x75eW8Gw74TgDo55C1qLbzEkHKGZfWuuRtaSe/Fc6E+dI
 FduKdJN5AdKnqjEIfzymBDpybgJxkOC88rzZF9LLzOUroC9C97kksTayTaXKpt209nHy
 jpwqJSs3kZwI5e5QcVHHMQIDuKWcJeScUx7xQCgnYicYX/1SpAD62sAPy9LI+d595rz0
 5MwKj6yXb6gx28NK4Nb5zmIEX5PU2JAV54qsnC+C1p62zXhw2abV5OWzT3UowKAq7KGt
 7qPSL5whhVPcVgiAjhUhEjIUaF1JHOpAYnv138WIrpayC2UoCknHd1DwSKNpToVal5Rw
 OQHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=70M/iQVUNidswIAQUv9GYNm20KvHkN2/8VXgR1NpNf4=;
 b=dWjyUSp2kFcAg2TGVdFBiqqEE4deux2m83DZz27bhi6h2CNQ9ogpIwzKmDdn8ckNJN
 tWRgLXG548plWKA5RETjuPd5Paw3m/lp7MLvO/ZcdHng5pkW2JTgvYXUIkswX2P7G7Cs
 z3Z6CGQcdcxzasDpXkoMzZDIjdCDmpPveuHKaSiNpV3SXER79S8S85N/wmllOIVGawsU
 4DUUqk9hXcdQtp+o1wmV1oClZXusZeuv6kbxrMu5Zy4LquE/ERzeBEzr4zEg4RtPQjes
 9lPCmmZHORkcQSqa49YqOX3mxq3e53K+TceHmtu4RRkYzQML6mdFbdeez/8Lq9w5n6zD
 j5Zg==
X-Gm-Message-State: AOAM533CJvPnEiiwpR3kOP/NvjiDrWJAOv6Ygihla9XTf/fN4R8CYRx0
 6+6c+JAOO4DVJjmYdnmvP70=
X-Google-Smtp-Source: ABdhPJyxn9N3iZZd0CB1Y5/Ka99i7Bw9NMsh+4GnGJFy2TQIwzdSODJOXkV2EvHbcJb3y9o6hSzM1w==
X-Received: by 2002:ac8:5a42:: with SMTP id o2mr20964580qta.191.1618124145095; 
 Sat, 10 Apr 2021 23:55:45 -0700 (PDT)
Received: from li-908e0a4c-2250-11b2-a85c-f027e903211b.ibm.com
 ([2804:14c:482:7b04::1000])
 by smtp.gmail.com with ESMTPSA id 14sm5418457qkf.119.2021.04.10.23.55.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Apr 2021 23:55:44 -0700 (PDT)
Message-ID: <0921139e72c2ac186c8e718fbdec0a27af8caeaa.camel@gmail.com>
Subject: Re: [PATCH v2 05/14] powerpc/kernel/iommu: Add new
 iommu_table_in_use() helper
From: Leonardo Bras <leobras.c@gmail.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Michael Ellerman
 <mpe@ellerman.id.au>,  Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>, 
 Christophe Leroy <christophe.leroy@c-s.fr>, Thiago Jung Bauermann
 <bauerman@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>, Brian King
 <brking@linux.vnet.ibm.com>, Murilo Fossa Vicentini <muvic@linux.ibm.com>,
 David Dai <zdai@linux.vnet.ibm.com>
Date: Sun, 11 Apr 2021 03:55:39 -0300
In-Reply-To: <7af21a72-507b-42ce-77ad-d7fc377590d1@ozlabs.ru>
References: <20200911170738.82818-1-leobras.c@gmail.com>
 <20200911170738.82818-6-leobras.c@gmail.com>
 <7af21a72-507b-42ce-77ad-d7fc377590d1@ozlabs.ru>
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Alexey, thanks for the feedback!

On Tue, 2020-09-29 at 13:57 +1000, Alexey Kardashevskiy wrote:
> 
> On 12/09/2020 03:07, Leonardo Bras wrote:
> > diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
> > index ffb2637dc82b..c838da3d8f32 100644
> > --- a/arch/powerpc/kernel/iommu.c
> > +++ b/arch/powerpc/kernel/iommu.c
> > @@ -655,34 +655,21 @@ static void iommu_table_reserve_pages(struct iommu_table *tbl,
> >   	if (tbl->it_offset == 0)
> >   		set_bit(0, tbl->it_map);
> >   
> > 
> > 
> > 
> > +	/* Check if res_start..res_end is a valid range in the table */
> > +	if (res_start >= res_end || res_start < tbl->it_offset ||
> > +	    res_end > (tbl->it_offset + tbl->it_size)) {
> > +		tbl->it_reserved_start = tbl->it_offset;
> > +		tbl->it_reserved_end = tbl->it_offset;
> 
> 
> This silently ignores overlapped range of the reserved area and the 
> window which does not seem right.

Humm, that makes sense.
Would it be better to do something like this?

if (res_start < tbl->it_offset) 
	res_start = tbl->it_offset;

if (res_end > (tbl->it_offset + tbl->it_size))
	res_end = tbl->it_offset + tbl->it_size;

if (res_start >= res_end) {
	tbl->it_reserved_start = tbl->it_offset;
	tbl->it_reserved_end = tbl->it_offset;
	return;
}


> > +		return;
> > +	}
> > +
> >   	tbl->it_reserved_start = res_start;
> >   	tbl->it_reserved_end = res_end;

> >   -	/* Check if res_start..res_end isn't empty and overlaps the table */
> > -	if (res_start && res_end &&
> > -			(tbl->it_offset + tbl->it_size < res_start ||
> > -			 res_end < tbl->it_offset))
> > -		return;
> > -
> >   	for (i = tbl->it_reserved_start; i < tbl->it_reserved_end; ++i)
> >   		set_bit(i - tbl->it_offset, tbl->it_map);
> >   }
> > +bool iommu_table_in_use(struct iommu_table *tbl)
> > +{
> > +	unsigned long start = 0, end;
> > +
> > +	/* ignore reserved bit0 */
> > +	if (tbl->it_offset == 0)
> > +		start = 1;
> > +	end = tbl->it_reserved_start - tbl->it_offset;
> > +	if (find_next_bit(tbl->it_map, end, start) != end)
> > +		return true;
> > +
> > +	start = tbl->it_reserved_end - tbl->it_offset;
> > +	end = tbl->it_size;
> > +	return find_next_bit(tbl->it_map, end, start) != end;
> > +
> 
> Unnecessary empty line.

Sure, removing. 
Thanks!

