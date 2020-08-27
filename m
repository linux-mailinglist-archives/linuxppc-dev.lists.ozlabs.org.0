Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A7013254D2B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 20:36:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bcrzh6gGtzDqDx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Aug 2020 04:36:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::744;
 helo=mail-qk1-x744.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=mZz2oj0+; dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bcrxl1kxMzDqDf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Aug 2020 04:35:06 +1000 (AEST)
Received: by mail-qk1-x744.google.com with SMTP id p4so6908220qkf.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Aug 2020 11:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=mqA0EYRZVIwLWOqPk5pwlyc1YvuGeQHgSqHXghkkHnM=;
 b=mZz2oj0+wSsZMB0AWjnl+4qg8AhwmYO4kdO1S60jA8VA3SBzIiwO3DH3P5DsCLfbaa
 aQs1elgpTpBsZseoNPTY/AZaVTY7vIgMvIhNZ+1QtULPTEn0KylF7zheYoJ+puMkl8Mt
 ufCfQRHenD51rHnaB23BlMLXUYyH1DlRDWAjroZ2m5zP/wD4LcZ5wpO/auvaaHxCi5Ch
 yQWFXlgwLYFQ8P+w2G5PI067IALkO+LAD8kpVSi+FtmjLFzXgHPOBD7KYZYQwh0WcZRQ
 pEmv2Uzcgf9zARFWxLOCDa1uLo9FQlQI11Gg/N4RVXc3RV0sQNt4XeSM2K19tWa0i7gf
 heAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=mqA0EYRZVIwLWOqPk5pwlyc1YvuGeQHgSqHXghkkHnM=;
 b=XSVQCZf5x/r2tAKFxEpJdVtBsD2EX5HeHI2dbJ2LoUTWl7typZQYXSLIhHiw2voIoS
 Xw78FEFz8yDXV/oyz58wo2U9XerCMmOj/LmqHuzTm/VyfrELOoGHPhoA+FmZrCWGWvx5
 KTrLIkRAfqKwannmTzAxAKDvYDtqqO7OtOWG8vGXLg0zwaj/SNxJSuze63MeKyl8RUzr
 ZPfxsiGFCG9ckkSewEOBR5OGDNpxf9SYoFDYSdTuCIvaMBRMatw9h9ZzeC00WC19GN03
 e+eXkgVjjA6Jm5Vwr7Vmc6Qp3F9Q0tATO/shPvnueJBo+rpDAf44QIM42Hk0Ru/txdqi
 aO+w==
X-Gm-Message-State: AOAM530/QAZ54IOIYXUtwMlAHRQ7lB+4wEmCNl24i+b3UOqJoY/GeYnE
 ls40b9ICHivBVVh5PNCv5p4=
X-Google-Smtp-Source: ABdhPJy5fetU3wuT21/nV4z+TpEhx5H+HcuTSDouRqF/O4+AAPbFy3jvsqMy+FFVvSUXwetLcnug7A==
X-Received: by 2002:a37:7407:: with SMTP id p7mr20410109qkc.350.1598553303218; 
 Thu, 27 Aug 2020 11:35:03 -0700 (PDT)
Received: from LeoBras ([2804:14d:8084:8e41:9b0d:571e:a65:b5d8])
 by smtp.gmail.com with ESMTPSA id k38sm2464453qtc.88.2020.08.27.11.34.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 11:35:02 -0700 (PDT)
Message-ID: <5f26d433abcde7cd3b4da705742e17ca6c0f0f0b.camel@gmail.com>
Subject: Re: [PATCH v1 04/10] powerpc/kernel/iommu: Add new
 iommu_table_in_use() helper
From: Leonardo Bras <leobras.c@gmail.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Michael Ellerman
 <mpe@ellerman.id.au>,  Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Christophe Leroy
 <christophe.leroy@c-s.fr>,  Joel Stanley <joel@jms.id.au>, Thiago Jung
 Bauermann <bauerman@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>,  Brian
 King <brking@linux.vnet.ibm.com>, Murilo Fossa Vicentini
 <muvic@linux.ibm.com>, David Dai <zdai@linux.vnet.ibm.com>
Date: Thu, 27 Aug 2020 15:34:55 -0300
In-Reply-To: <e7d0e85c-c4c4-ad1d-899a-72d4fbd92852@ozlabs.ru>
References: <20200817234033.442511-1-leobras.c@gmail.com>
 <20200817234033.442511-5-leobras.c@gmail.com>
 <e7d0e85c-c4c4-ad1d-899a-72d4fbd92852@ozlabs.ru>
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 2020-08-22 at 20:34 +1000, Alexey Kardashevskiy wrote:
> > +
> > +	/*ignore reserved bit0*/
> 
> s/ignore reserved bit0/ ignore reserved bit0 /  (add spaces)

Fixed

> > +	if (tbl->it_offset == 0)
> > +		p1_start = 1;
> > +
> > +	/* Check if reserved memory is valid*/
> 
> A missing space here.

Fixed

> 
> > +	if (tbl->it_reserved_start >= tbl->it_offset &&
> > +	    tbl->it_reserved_start <= (tbl->it_offset + tbl->it_size) &&
> > +	    tbl->it_reserved_end   >= tbl->it_offset &&
> > +	    tbl->it_reserved_end   <= (tbl->it_offset + tbl->it_size)) {
> 
> Uff. What if tbl->it_reserved_end is bigger than tbl->it_offset +
> tbl->it_size?
> 
> The reserved area is to preserve MMIO32 so it is for it_offset==0 only
> and the boundaries are checked in the only callsite, and it is unlikely
> to change soon or ever.
> 
> Rather that bothering with fixing that, may be just add (did not test):
> 
> if (WARN_ON((
> (tbl->it_reserved_start || tbl->it_reserved_end) && (it_offset != 0))
> (tbl->it_reserved_start > it_offset && tbl->it_reserved_end < it_offset
> + it_size) && (it_offset == 0)) )
>  return true;
> 
> Or simply always look for it_offset..it_reserved_start and
> it_reserved_end..it_offset+it_size and if there is no reserved area,
> initialize it_reserved_start=it_reserved_end=it_offset so the first
> it_offset..it_reserved_start becomes a no-op.

The problem here is that the values of it_reserved_{start,end} are not
necessarily valid. I mean, on iommu_table_reserve_pages() the values
are stored however they are given (bit reserving is done only if they
are valid). 

Having a it_reserved_{start,end} value outside the valid ranges would
cause find_next_bit() to run over memory outside the bitmap.
Even if the those values are < tbl->it_offset, the resulting
subtraction on unsigned would cause it to become a big value and run
over memory outside the bitmap.

But I think you are right. That is not the place to check if the
reserved values are valid. It should just trust them here.
I intent to change iommu_table_reserve_pages() to only store the
parameters in it_reserved_{start,end} if they are in the range, and or
it_offset in both of them if they are not.

What do you think?

Thanks for the feedback!
Leonardo Bras



