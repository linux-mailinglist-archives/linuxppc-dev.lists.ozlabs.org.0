Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 2F42D8D3484
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2024 12:26:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=IkhzoYHD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vq4zs5W4cz3fpd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2024 20:16:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=IkhzoYHD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Too many DNS lookups) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=osalvador@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vq4z875fPz87xd
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2024 20:16:03 +1000 (AEST)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4211a86f124so15854465e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2024 03:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716977760; x=1717582560; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4x27AVMz0iSl17rfIwR6hT5YsDwoPYx2gnD792TvxbI=;
        b=IkhzoYHDm1Knss4rmEPr4UdZXZRCn2wnWPkhMC/dk8+wh3s+rEm9y4CxvmiFdzvAQt
         t+3ubibB7zqQKH84ir50aCtkF3SxTqc3+1V7zMcZZoqGixO0FA+N1d5LLVLxoHpWGm99
         h5ii1TGK6CBQKj6N0pEs1+KpmeyL70hGl1BjbP5G581gyIEmp6kJ2s1K1CVwJSU/T29x
         0cHv4Xlb/hRRlE8H3dLkfgGGvW7ZLHbjA3SI71+/3WCsKQuJmG4jv8w7xXpsA9NJnP1C
         SbP3ujiNTSbvAfDlFlpWr4lWWVR6WE5fHp0GdHmYOnIVkPTAJ+33NH+R6ZUmSTnyqM7K
         uXuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716977760; x=1717582560;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4x27AVMz0iSl17rfIwR6hT5YsDwoPYx2gnD792TvxbI=;
        b=o3BLAlATcOlYu2McR8mRCwTxVQp6B0yT8VKuwCEq/XPjndLVWeFZh/QT1fTnCT0ikt
         RPcA1Lkh6KsCbpipe1ALQJEx9MOSqySra/i3ChjkPzRLosypr6sMxJ+en4W/tpX+kLPW
         MplsFEUvUp+W9eAQ9TZDSrJ5l1Ze4hy+AmW6PFhEhvBIv3NyXkBdF2obh8B1Vd4QFXrR
         MIFs+oG5yJauYd17q1YMEj7CI/TRGmzUc9L77AHrA2CHxDGWSZ1TE8P0H3gPFY73I3ok
         ZucUMX/+mQs10ktnSTNq3SOsASIUrtzKwGBHE4+oimBmh1CPfLoxsOvVcy+YRpwqEoGm
         5ScA==
X-Forwarded-Encrypted: i=1; AJvYcCXZHx5qB85novrhDjbzLA5xbejwvrwcBqN8RNeLFUh/Lkw2Powy128l0sJXpo4KiyTKtrtJCPBbxEWc0UWzPuOJxQwFG92Q5+vPmMwneg==
X-Gm-Message-State: AOJu0YzHQWWYET2k+6n53F0jykkNXTZGxA3Y2tsph+wu3qBqcUodFBmh
	90iMk2aCpB+11w5oe1vhRmNg9SsN5j0Y98hI4Y1Qksp/T51vFUsUHhnPL5HdmeY=
X-Google-Smtp-Source: AGHT+IHqM8vBSZQLQX11IaWlIhjemGFoCG5dMTyPcAeygvinoSDY4HDbiRu9hgo9s7sf/V/iTTF9Zw==
X-Received: by 2002:a7b:cb16:0:b0:418:e04b:ee63 with SMTP id 5b1f17b1804b1-42108a21421mr117679005e9.36.1716977759946;
        Wed, 29 May 2024 03:15:59 -0700 (PDT)
Received: from localhost.localdomain (62.83.84.125.dyn.user.ono.com. [62.83.84.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4211e43e8easm54635895e9.16.2024.05.29.03.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 03:15:59 -0700 (PDT)
From: Oscar Salvador <osalvador@suse.com>
X-Google-Original-From: Oscar Salvador <osalvador@suse.de>
Date: Wed, 29 May 2024 12:15:57 +0200
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [RFC PATCH v4 12/16] powerpc/e500: Encode hugepage size in PTE
 bits
Message-ID: <ZlcAXTMBSMt69ulX@localhost.localdomain>
References: <cover.1716815901.git.christophe.leroy@csgroup.eu>
 <10eae3c6815e3aba5f624af92321948e4684c95a.1716815901.git.christophe.leroy@csgroup.eu>
 <Zlbh5Bwsx7WqEEWr@localhost.localdomain>
 <3cf95f5e-cc8b-4417-a3fa-80dc3b24ac63@csgroup.eu>
 <Zlb-9DNmRzIYRdJO@localhost.localdomain>
 <3186e950-fbf8-42c4-9eed-9564c8374019@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3186e950-fbf8-42c4-9eed-9564c8374019@csgroup.eu>
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
Cc: Oscar Salvador <osalvador@suse.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Peter Xu <peterx@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 29, 2024 at 10:14:15AM +0000, Christophe Leroy wrote:
> 
> 
> Le 29/05/2024 à 12:09, Oscar Salvador a écrit :
> > On Wed, May 29, 2024 at 09:49:48AM +0000, Christophe Leroy wrote:
> >> Doesn't really matter if it's PUD or PMD at this point. On a 32 bits
> >> kernel it will be all PMD while on a 64 bits kernel it is both PMD and PUD.
> >>
> >> At the time being (as implemented with hugepd), Linux support 4M, 16M,
> >> 64M, 256M and 1G (Shifts 22, 24, 26, 28, 30)
> >>
> >> The hardware supports the following page sizes, and encodes them on 4
> >> bits allthough it is not directly a shift. Maybe it would be better to
> >> use that encoding after all:
> > 
> > I think so.
> > 
> >>
> >> 0001 4 Kbytes (Shift 12)
> >> 0010 16 Kbytes (Shift 14)
> >> 0011 64 Kbytes (Shift 16)
> >> 0100 256 Kbytes (Shift 18)
> >> 0101 1 Mbyte (Shift 20)
> >> 0110 4 Mbytes (Shift 22)
> >> 0111 16 Mbytes (Shift 24)
> >> 1000 64 Mbytes (Shift 26)
> >> 1001 256 Mbytes (Shift 28)
> >> 1010 1 Gbyte (e500v2 only) (Shift 30)
> >> 1011 4 Gbytes (e500v2 only) (Shift 32)
> > 
> > You say hugehages start at 2MB (shift 21), but you say that the smallest hugepage
> > Linux support is 4MB (shift 22).?
> > 
> > 
> 
> No I say PMD_SIZE is 2MB on e500 with 64 bits PTE and at the time being 
> Linux powerpc implementation for e500 supports sizes 4M, 16M, 64M, 256M 
> and 1G.

Got it. I got confused.


-- 
Oscar Salvador
SUSE Labs
