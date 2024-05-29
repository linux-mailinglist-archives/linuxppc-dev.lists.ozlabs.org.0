Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id D0B928D344E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2024 12:17:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=PWB6DBi5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vq4rv1yRSz88hD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2024 20:10:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=PWB6DBi5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Too many DNS lookups) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=osalvador@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vq4r96rsxz88T2
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2024 20:10:01 +1000 (AEST)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-42011507a54so4254465e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2024 03:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716977398; x=1717582198; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1FTKNsuia3RWpQHnWn/8QDl0FBPSRwXXETwGl7wxFKo=;
        b=PWB6DBi529DBnO1eIkadB/reTeEZJB+Dxti0PpOdCU7kdaYD9xZSIJv+WWBQp7O+SS
         wG3yPTlDfPeRSKocScA7+BDlhGuRAeCkP8Io0I0UsKr6SfUzYjBu/X6wNfLtcPmp7MrW
         8VdMRaFszCbod069qyIWrxzLExbDRhUrMe9H2+YQPBvKxfXJ0uNcZrRJ2VLxRxgarxx0
         9qgYXiEKeJ5ppQQSCiqglrRSuMR/XsZv1YnsrJlscRxp3vQUBjg2DPt0EC0sAR1MoDO+
         vavixmMhAfDigyQvND2A0R04bIr8M6FyIoWjlBLdRhPxZv/xl7CpzRYF0Z5saYVx1DT6
         JlIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716977398; x=1717582198;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1FTKNsuia3RWpQHnWn/8QDl0FBPSRwXXETwGl7wxFKo=;
        b=gUmYecwo31gNib4wkPUq/mW4riKpolb33dJcEj9LyULAIHsGTp7lDcu+/ARS0+pY4E
         YZ7aaHki8d4LQa8E4fZEW3/sOqNJBLp1hmSRnudebOub4F0OpBnTAa1gNB+b+qQ/ILrV
         8wX8Yesf4e2737ODpTGUceiT96PkkAhbNEIBqmtnjbNN2iZN2LbDeKpBVH9cilMCUYXZ
         U7vPW8gICSz3D/Qqyc0Grt65C1eWvLrKmcZhmhWiGuOo13D3q2QQmjOt3FuzkLEoXZuC
         a4ee9SuUdpbsMbLqUe1pRZwEwziXNZqYvywCHsZ2QSNbKHbPvW3EVW8tcljHIGMOx4IF
         9jnw==
X-Forwarded-Encrypted: i=1; AJvYcCWYfHNjAvZPwzRYQN+3RQxo2mUlY9bicy708bceWJ1RSDa4mNupq17QNwDhNJhOXcom3SHrTTi0oZ0Ciqd38odnAXmsTdOYe5tztjsPUQ==
X-Gm-Message-State: AOJu0Yx0XVq69JSBLNfjW8+YK5qYaF84eZnn45MQwtBo42gOOMcY6JC/
	OoMtYOFFoe6lJLvuHKmxSGAuCfmvB0+3UT5bVt/m05zmQGSUbZ3TWY9VOMb/f5M=
X-Google-Smtp-Source: AGHT+IH9bfmSIStk/91xm8BYd9HX9NO21rvFMlN/xg/x0L9tsKc+sRpjBrjeX+ypNPkNr6P9URfuKg==
X-Received: by 2002:a05:600c:4fd1:b0:41b:d6ca:eefa with SMTP id 5b1f17b1804b1-42122b01e91mr13915835e9.16.1716977398527;
        Wed, 29 May 2024 03:09:58 -0700 (PDT)
Received: from localhost.localdomain (62.83.84.125.dyn.user.ono.com. [62.83.84.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42122299300sm26362175e9.42.2024.05.29.03.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 03:09:58 -0700 (PDT)
From: Oscar Salvador <osalvador@suse.com>
X-Google-Original-From: Oscar Salvador <osalvador@suse.de>
Date: Wed, 29 May 2024 12:09:56 +0200
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [RFC PATCH v4 12/16] powerpc/e500: Encode hugepage size in PTE
 bits
Message-ID: <Zlb-9DNmRzIYRdJO@localhost.localdomain>
References: <cover.1716815901.git.christophe.leroy@csgroup.eu>
 <10eae3c6815e3aba5f624af92321948e4684c95a.1716815901.git.christophe.leroy@csgroup.eu>
 <Zlbh5Bwsx7WqEEWr@localhost.localdomain>
 <3cf95f5e-cc8b-4417-a3fa-80dc3b24ac63@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3cf95f5e-cc8b-4417-a3fa-80dc3b24ac63@csgroup.eu>
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

On Wed, May 29, 2024 at 09:49:48AM +0000, Christophe Leroy wrote:
> Doesn't really matter if it's PUD or PMD at this point. On a 32 bits 
> kernel it will be all PMD while on a 64 bits kernel it is both PMD and PUD.
> 
> At the time being (as implemented with hugepd), Linux support 4M, 16M, 
> 64M, 256M and 1G (Shifts 22, 24, 26, 28, 30)
> 
> The hardware supports the following page sizes, and encodes them on 4 
> bits allthough it is not directly a shift. Maybe it would be better to 
> use that encoding after all:

I think so.

> 
> 0001 4 Kbytes (Shift 12)
> 0010 16 Kbytes (Shift 14)
> 0011 64 Kbytes (Shift 16)
> 0100 256 Kbytes (Shift 18)
> 0101 1 Mbyte (Shift 20)
> 0110 4 Mbytes (Shift 22)
> 0111 16 Mbytes (Shift 24)
> 1000 64 Mbytes (Shift 26)
> 1001 256 Mbytes (Shift 28)
> 1010 1 Gbyte (e500v2 only) (Shift 30)
> 1011 4 Gbytes (e500v2 only) (Shift 32)

You say hugehages start at 2MB (shift 21), but you say that the smallest hugepage
Linux support is 4MB (shift 22).?


-- 
Oscar Salvador
SUSE Labs
