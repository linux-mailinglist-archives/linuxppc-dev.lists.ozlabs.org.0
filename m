Return-Path: <linuxppc-dev+bounces-3757-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC759E2E57
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2024 22:44:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2vLS72xfz2yDT;
	Wed,  4 Dec 2024 08:44:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::533"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733262256;
	cv=none; b=jyKZu059LkNiDAzxW4lrvYhOToo2XW78jZGgiq4wVfnl+IV+q1ufK7WADDODCbuEgSqvwRhXWJGpCvS3/R2UIjEM3FHkd4vmYahtSko7qjWqpdCBBj8gQEU7NpQhV7kFUTgvoYcQrotEliyzLiMkGL2zlWi0ghSvTEssChJkQ3z3Q4TnENmnRpm4FHwcxdwMS00p08I8GlCgV4iLCVWvQB+RSd7tTj9XOEQNjhjtQP3sDGcCQ85GnvwiT8gEDqmJmGTSMjM5iBw0IJXfMMegrVYIm8XrSRIMeVhrtzU5Y2WzkMIvwRnLqsa7lpu9pcSYnP6ASy+PAV2cvcnOyxdmPw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733262256; c=relaxed/relaxed;
	bh=ljDKfb9sr4GSKbj8U3a57Eoz3AQHjiB8wr4Im39gx8U=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CfVWmu4DCu3zLJmSDTzGPqJuJ2YzyNreIkrMDBCvdCFeL1fmrXKuRCa/HEC6HtTgDr1AG2IAVb2FnzaBesduRUooTUKoo+U8u4fN+Swq9bSDxxEJQwMKmFgjNKHCcL4jKAUF/aHVV4bfR7r0ZnZiq5plibduZ7qWhX2tp8r5Brk0qIRigIufYPfAA+pq5dbbGoEosOPEZ7vmdCsMM9m0ZJ/CvlQf80NRS3v3BCwJg+e2HxMOHFy7SH9ktU6pXOFFUgq/vEN4+EkHip1hI0vx61SFC/8sbkc2Ldf5T7qfnEUzXCJ9l12q9wSNWuBBzkeeuNz0GG75EniFkm2gd3SZRA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QPjTdsy5; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QPjTdsy5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2vLQ3C88z2yDS
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2024 08:44:13 +1100 (AEDT)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-7fbd9be84bdso4692674a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Dec 2024 13:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733262249; x=1733867049; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ljDKfb9sr4GSKbj8U3a57Eoz3AQHjiB8wr4Im39gx8U=;
        b=QPjTdsy5rpUgn47l7BAbGtATG9/MWHrQvkjRtuv7M+kfnGRBzLhlEEJkitUDFIlXsp
         DWCMuZOqLUn7ODEhQV5yHD4WU1UvufwI7Y6m8u+tmRiuO530oODVGcrukDLW2DaX++4Z
         BfC9P4/ek3+w/cQy+fE5I0MWIZi6PsszKs1lcD6HM6InAuVsWaQJf00bwpkvJ5E3SR+Z
         /fBv26CG9i4Scd3V2RAv9P2UbX1lE4LXRNbPU5ys94BYX3g56Vw00xAfyvwQiDWwM5mN
         qb6+aLaoCqoq1aodkeiwlbx4TngFvWDtfJw0w4QTZduewzSdBC1dy8qa4V8ReLMfOs9P
         QG8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733262249; x=1733867049;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ljDKfb9sr4GSKbj8U3a57Eoz3AQHjiB8wr4Im39gx8U=;
        b=I6M7VJFitFZ561EUqhT7udkdPzsUna/7Et1ItFUEQlzKO77qTG3gMYi++Kg8Yhzl+H
         Loi/1YwxjYEVok/oc/4bQXSSYTaH3MCvuW8/SzKtYga4fk3ZW3TKAYbESyvrysZRtQQw
         YraW+dJbm+HMrPvpcZjGcW/3i4B3CX+/cI2d00hR0Ik6LIVcPh7peR/j474lyiEuxZCE
         OXrAch8tXrmOA5Cqk+gpEuOwnIYmfWLuprUVZ5wnMsvhDkEJFXI93BAzWriQx4U202Ru
         F9oAD5oIDnsf0rP+5W23mGBsmh+o/u7T0Pdw1ExbWWIOzKg/1y17ZKSC0PIvR7TNwt7f
         cxyw==
X-Forwarded-Encrypted: i=1; AJvYcCXrvKZTtGRgax4RnGQ6f0GQ4cFqUY1C1bCXhXOmtDbl6qRrBDywoxpHrDZLuR0UdNA0WB5Wcz0Td/dz6Qw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy1/s1cNOtrPo+dNz68/UMPbufS+Yfk0QLX1MwlNkB+lvA68R+2
	w9SD4+GKsDgG2J78VbeqEvUzOlKSr6S1zbYKwB0W4r+yJ/+sm8Rd
X-Gm-Gg: ASbGncvguaqKLRT849RN0qV1z4UuSu/s0zVMlh9aKtYWbyA/tOdex/9ay+CzkYLaDRf
	i460XD2BLuglMRM3wSqdbHgKCWK4rMT7ucoiPqDGSOuKQx6xcA/V54ljtSh6bubBHuSR11sLzq3
	cylmFfzOogWsqN4vehGW8JJynjfw2YTRW6xiO2K2XsDSvSqvjFMuHLjVLGaAU4/vIxY3Y/2mRQA
	ZKes3G4xGE/kRlrbsJnNTu0u/1tU8zTs4zHFvvubYBKq1ZuOWEsyZwset/LDdNF8SFGYCAs7zL5
	xIm92/pVyNzOGtKNfHg=
X-Google-Smtp-Source: AGHT+IFkKVXpKdDqU1JOiYLT32y8HzR+6JWjbD0D1VlZfsvz/CBhh4C9EWoH2N5Ta4jbvXC4ggE9WA==
X-Received: by 2002:a05:6a20:748e:b0:1e0:d380:fe61 with SMTP id adf61e73a8af0-1e165413554mr6036490637.45.1733262249004;
        Tue, 03 Dec 2024 13:44:09 -0800 (PST)
Received: from DESKTOP-DUKSS9G. (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c2d3e28sm10242226a12.17.2024.12.03.13.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 13:44:08 -0800 (PST)
Message-ID: <674f7ba8.630a0220.3641c.1437@mx.google.com>
X-Google-Original-Message-ID: <Z097peujUb-WhU8f@DESKTOP-DUKSS9G.>
Date: Tue, 3 Dec 2024 13:44:05 -0800
From: Vishal Moola <vishal.moola@gmail.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>, Zi Yan <ziy@nvidia.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: Re: [PATCH RESEND v2 1/6] mm/page_isolation: don't pass gfp flags to
 isolate_single_pageblock()
References: <20241203094732.200195-1-david@redhat.com>
 <20241203094732.200195-2-david@redhat.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203094732.200195-2-david@redhat.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Dec 03, 2024 at 10:47:27AM +0100, David Hildenbrand wrote:
> The flags are no longer used, we can stop passing them to
> isolate_single_pageblock().
> 
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---

Reviewed-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

