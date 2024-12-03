Return-Path: <linuxppc-dev+bounces-3758-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1B29E2E5A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2024 22:45:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2vMG2C1Bz2yF0;
	Wed,  4 Dec 2024 08:44:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733262298;
	cv=none; b=XAo9jSiHa8ZE04+bq4ECSlRiiPmsdH/moax8EsLEdWntE8vvRC6PyWPXmowusbPr4bKvpw5LxVGWzoPX9ALA65SNVZ6lMiTDb/yJLXd60aEDJ2+otDBEuDkZzDSr2u1O/pzEj03lmYdkj9t91PJbe5X09NPJNBOI5iNQhSYoA9uwEvwcppne6qZYgwFRb+S7sVc9gBm3lNIZZFZ8PpPfcbzbFtye9xvK4zfncqgpsGzvWRPZCdJBhCEr364otybR+s5zqGhVZ4ABiDVZqBBK5TzwnhXsWFin4cgPvBY16YHXOZKVS1QStIPLbrsFj9+UFVmB2iplnRjzm238541GSA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733262298; c=relaxed/relaxed;
	bh=xf5vjKYPPx2Ac8Z/x2a1sc7L/LY/sKKwAb+DY+th8Eo=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jCFHANgCR1pds/tSei4hpZgIDmSqfROB+9TUA17PmdpxMioHleJoSNt6GHXu6k4Pd6f77+YsAEGTyBI48IOLNHeC5U41hTLrr6m2ZqlWiFKDVwfjz7EgkCdlh7mbVodl42dCQVriZc+AdgpygwWY6WHDDeuVNXSJF9l5oWBQNBnXR+woAZQUFUKXSgWg2NPRyg7hIVFLdls9Vb5VZ2oSDaNeITfFd4psn2p7hRR5qfwzRNTHqzQsi6mAouvH9dy+xFWibIrzikGQhGYaYjfk8Ly9wymY1fgQy/zLurnXaxkOAYcT0ySj1CghYxV/0bjSODhiwVAS7STOVxudE4XE0Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YWvDFQ+8; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YWvDFQ+8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2vMF2tZwz2yDS
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2024 08:44:57 +1100 (AEDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-21577f65bdeso1938165ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Dec 2024 13:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733262295; x=1733867095; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xf5vjKYPPx2Ac8Z/x2a1sc7L/LY/sKKwAb+DY+th8Eo=;
        b=YWvDFQ+8zM1PNr1LoW9uvt2WnVesexigp7+ZZeSm/hdZapyZrxLKXK0gh7LOPYHDe4
         2Mj8iRPK9K3GfeHYTKhm6x3A628DT7ZID8dTxnk+FVIFpLFO6GHJNLs0ugdnfJgekLkx
         MNP5R7f2uiJ6HEj3iWiX3ylc3sPgWllxlLDeoSwV8Pt7cA7ydGRXb6K9hpBdJdcmoGav
         rzwqgq3VTa5acXjnYT4LidS1a+QPgp5Lf1706p71rUr6GbAItMVnx6DiQZ56p84grVXU
         K6TGbWLwiphqvNDzDJPZ6ldupGvhm/E1/RXShlB847TopP/v+zJcOTiJVjCYmF8VVnmo
         MaeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733262295; x=1733867095;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xf5vjKYPPx2Ac8Z/x2a1sc7L/LY/sKKwAb+DY+th8Eo=;
        b=jKJbHXmWepa8e0dsACb2lx54dL6meKJy5VqztJ9dgp4XkHbVf2dzG+UUaX9MkiMy/L
         l+XPZ1dIp7dpFgt0pEIQpJkuG+dG2UFcxYy/ij56k3XOEefDo67O0t1ge3Zl/B1Vv8yV
         o7ku3ppvJezqQRaCaC591WMViLstO9camYIasYAfuNHX8XF+DNGvidMTB4Pjyfa8UYKC
         Gna+SNg/t1dSAtnbV7KRg3z2byvsIpTp3hYMhj2h3urMV4KMoOICUV7rMaGBnpJcWIVk
         a5s9r95KS5bAXgpBQtyxkSAk+ufMWP26AtAkGsF3bcU5pYxIx/j2+mPdv1e9S17YRSuv
         vc1A==
X-Forwarded-Encrypted: i=1; AJvYcCWCwgBcVV4IkAj4Ih68jGqmvt6KJz/tj1FQQdcEJjTieRkZZkoUv6wsMKAjdMhLfz1JsMOXijyAsC5rW5A=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyo4ABrttoVu3t3uI3ipHpbnXlC4RBIhYL6WIAj7/pSc1VfFDSy
	oNxOYw7iH1Tj2momDVTx6Z2hrlZMPfEQCmVqyHBFWvWpvbXvj/CG
X-Gm-Gg: ASbGncuCu6HILgNEF0llDV/cHQbs4AaLYtvqqNrLRh9GNT5qzMtZJ7G5PQ1BlEKu5HC
	u7/OUD9Y0iDgN5JKsy+vrSmetRLtmd5BAwXPzk+eFjG39Q+MjciXEO7oug4cvqMDHoPbUusbILi
	MHyEEEVDns81R7Ul8YdLOT8zwdoMNCnob5LZUim4ITafiPKNbx2DiT9nouu7gaV4VQT/u0bRtYV
	d6+5RE0RYjSxg+Uac0p6y4+550PZJqOoCJA7BQyFoGsTesG9yx4JiGL1aT7K+gcZSKhKJPcBLsB
	Q5lPglNaBxHj0Bp7yJY=
X-Google-Smtp-Source: AGHT+IGXAzBoLsm4nq9TP7u0h5KWxHe0yGv+SK4jcpVhgiu/OjXsXaNSNLM4ROUlCD58SwZxgHirjA==
X-Received: by 2002:a17:902:e743:b0:215:6c5f:d142 with SMTP id d9443c01a7336-215be5fd2f8mr54723325ad.20.1733262294783;
        Tue, 03 Dec 2024 13:44:54 -0800 (PST)
Received: from DESKTOP-DUKSS9G. (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21530753d15sm92216385ad.52.2024.12.03.13.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 13:44:54 -0800 (PST)
Message-ID: <674f7bd6.170a0220.72078.c192@mx.google.com>
X-Google-Original-Message-ID: <Z09701IR1DF4sp3V@DESKTOP-DUKSS9G.>
Date: Tue, 3 Dec 2024 13:44:51 -0800
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
Subject: Re: [PATCH RESEND v2 2/6] mm/page_isolation: don't pass gfp flags to
 start_isolate_page_range()
References: <20241203094732.200195-1-david@redhat.com>
 <20241203094732.200195-3-david@redhat.com>
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
In-Reply-To: <20241203094732.200195-3-david@redhat.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Dec 03, 2024 at 10:47:28AM +0100, David Hildenbrand wrote:
> The parameter is unused, so let's stop passing it.
> 
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

