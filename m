Return-Path: <linuxppc-dev+bounces-1533-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EACEF97EE08
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Sep 2024 17:23:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XC6G74wjNz2yQl;
	Tue, 24 Sep 2024 01:23:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::432"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727105023;
	cv=none; b=XUtItQJZh9QXAXgVcga+aH+xWTWjGX1eJYPrShR2igxmpaDGNbrBaWGX93vHt/TUFeZ/W4PBSPevLpbFrC/HlK4WFEwQWhiyLJoTFBWVawC5tMWnID8iJ2lNEdwnJHZlreBwG2Tc/s/v9YohuSEZDM41Ol2phvrAFGCN5LaM51BOWAUbOGugKQN10nryFgkgfBmDw6UybyicSJrBUllz9ECr/KweXyx31wivrgFqx1hhBC+BpiVIX9OKF4Wd8EE7Z9RJBXe+I7/3O1Hg1XOeYq3N5USwQi8MgcqTz3GlY+D8qdyKHeLLwxXy8ZmxMp12BnbD3WJ2mpJWzg0seXyFUw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727105023; c=relaxed/relaxed;
	bh=SRbHlAUD8+zFJXZcm/RxNEmbJtnDlqGFSqJp0i/pnEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CaEv1+vtjey9V7f9MxLyh7/Jf5ReUMG/RqMvpnAsdW9BTRVEAyqxapgOOHczca+UkPCRoG/GooxuaxK/37rBtrZLR5PKLWThI/hzItbQeUSqnJdRM+ez2XDLYT2TrscMvXhNHc+8fBHuwg+SCqc0nFhIYsP2VnEln3uG0dugxE1LLgZpZhqIUtCFItootDd+1FNzE3mg5173vfsxoEDU6bTKepWw6heLqL/fyWO0l+pw99RzJqiYLfenomT9WsWHsDzSBW7oTLIWW9+Z0DBIlPrrj+sizfY5LKu9TFB04IvsW5BLxq0I1MSqZJQNgUc1PzV6NO0HIsJH3I+c0pk9HQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=VvdAY9l/; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=senozhatsky@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=VvdAY9l/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=senozhatsky@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XC6G674RMz2yPq
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2024 01:23:40 +1000 (AEST)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-718e3c98b5aso3172378b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Sep 2024 08:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727105018; x=1727709818; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SRbHlAUD8+zFJXZcm/RxNEmbJtnDlqGFSqJp0i/pnEU=;
        b=VvdAY9l/UODQPEBnUyKeFF9GDogv3f1m1VAp/MFdtQRib1ffxuuBDJ71MOLT5eCVb1
         ZU+u75l0MM4orDMNKKgSsoFdkz0rI3tCo3dgg6S/GE51WV0mGy951BdX1agd4FhntUvO
         bLvgWJBwaQKcs5KtNjnPw1CdNlmtW60GXfbIQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727105018; x=1727709818;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SRbHlAUD8+zFJXZcm/RxNEmbJtnDlqGFSqJp0i/pnEU=;
        b=K0bhFDXdHL/906ekAnk8CIrGHASWhuCVIBbsufEV7vYguDa5dheuG9F8TrpK7LJ1z/
         UzSKF1wr2YREyXuwmpuUCfbgW9OP6GhHKdgkCcR8XJ1C32cvY/ZYNeb7QPbE/8SdUjqC
         23aJUQuEfAsAVRDehqg4RbJErNuxLixeIR0xs4IJY28JPTmDhlcCJrqT2JWmDDPPrRLY
         FneuBzibKV1FHXAeW4GfKH/KYuIgPvYgcO42k+Pz9PIFzSx3ARAvUCwuKOGDBMhj2Qxb
         DVPLMivZhsJhgRlr1YmnrDCGtKNY32XriaGryqFanM3UvYUumw2oRey0DjGi3phr7J+B
         XMnw==
X-Forwarded-Encrypted: i=1; AJvYcCUSMaVCs6fBwVOi2NN/IWplQ8YWz14qhel+/iRyvcQ0p2iGXmCwKEOf7dis8spw884qhPfmNPXgtTczeNk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxErQO3HRw6TbfhQ4lzQ/OoCW6cADtMqHyqWW9Ub9oSYzHWNI3l
	GfB4DXl+hstGa5AgG4RRFI2injqiEx2P/bcLFX32gafuBBhK2j4YmRt9wuMDrQ==
X-Google-Smtp-Source: AGHT+IEoqLYJOZjRKTpWHHQA/7YZunca0vmEGaKX7nwVC1pccwb3zqQkHK24skxuscdAt5DSm8gq5Q==
X-Received: by 2002:a05:6a21:e85:b0:1cf:4ea4:178 with SMTP id adf61e73a8af0-1d30c9e55ccmr14680839637.14.1727105018358;
        Mon, 23 Sep 2024 08:23:38 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:fd63:e1cf:ea96:b4b0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944abb60dsm13975913b3a.70.2024.09.23.08.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 08:23:37 -0700 (PDT)
Date: Tue, 24 Sep 2024 00:23:33 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	akpm@linux-foundation.org, minchan@kernel.org, terrelln@fb.com,
	sfr@canb.auug.org.au
Subject: Re: [Bug][Git-Bisect][6.11.0-next-20240917]BUG: Unable to handle
 kernel data access on read at 0xc00c020000013d88
Message-ID: <20240923152333.GB38742@google.com>
References: <57130e48-dbb6-4047-a8c7-ebf5aaea93f4@linux.vnet.ibm.com>
 <20240923021557.GA38742@google.com>
 <03a55b4b-eb45-4187-9de6-ef06f8176d05@linux.vnet.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <03a55b4b-eb45-4187-9de6-ef06f8176d05@linux.vnet.ibm.com>

Hi,

On (24/09/23 11:06), Venkat Rao Bagalkote wrote:
> Hello,
> 
> Below is the TC, I was running.
> 
> https://github.com/avocado-framework-tests/avocado-misc-tests/blob/master/generic/ltp.py

Out of curiosity, does this [1] patch fix the issue for you?

[1] https://lore.kernel.org/all/20240923080211.820185-1-andrej.skvortzov@gmail.com/

