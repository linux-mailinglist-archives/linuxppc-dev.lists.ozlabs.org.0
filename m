Return-Path: <linuxppc-dev+bounces-1526-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A6197E5E9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Sep 2024 08:17:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XBt873CJlz2xHY;
	Mon, 23 Sep 2024 16:17:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727057767;
	cv=none; b=Sb/RJY4OrxBmOGxUoTem+MZ1nvq0W8orYvb6XJLYFLZTCDas79S46UtF/NnCjzUIXzn/wjyich2DkhrT0pnG7YDLNBWZbVtqLeQxQ5Gk72320bzCmXbpqPshyyf3HTGvCj7n8hUXY0IoJd2tYE19AoP4mUqY3qRyxrmyyGNSvwL7vbtBSXDxeg+i+SqAAID2u9k9PrAj4iIatQzvChsztc73Q3qR8C28oK6Un4YGJaUPAvgBie8H5CFtsPCMDCGXBLc/J55Uo3h6hPs1FoqbIwPrJBICaFgS64nFoLH4hk7mV9UilzQGL8h2YnsqTLJo68JSITmPQB7Pl0S2X642Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727057767; c=relaxed/relaxed;
	bh=iasbysCenz7uyGomAHZxudZeL78s012Zo7N6U1Pe6Yk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FLpKUK+LdfbHXyQ/CYOYRjP+6LLacnObhIuZCLW3i7zziZb2CkCnKJrpvNoI0Io3Ms1YFRA2W0FAZ1G4WhrBig0/xoODDnftT15hbsM5q1wp4BEKUoRaCoj8Qf5Yuz0wFWG/KzuVNbrNV9gNRph5fqSuiw/h6DzAe+xMSp5iizswPdC5KXAX2xR7W66F/J4bmgy2k5SX8tSK3H3LIccLkREBqSbC/jNjcgtCXzXpF/IgBGmXj60ZJ69OanMou+2VO8eBtmtsdEGrgZdVhIwc+qsGPuMNB38PPJDiL634XysncCX2r1yJYem4+lwQRrjFzV6lXTB6sffk3J6xhejHlw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=BudgCiXc; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com; envelope-from=senozhatsky@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=BudgCiXc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com; envelope-from=senozhatsky@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XBmnM1m7Mz2xPL
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Sep 2024 12:16:05 +1000 (AEST)
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-7ae3d7222d4so3203788a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Sep 2024 19:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727057762; x=1727662562; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iasbysCenz7uyGomAHZxudZeL78s012Zo7N6U1Pe6Yk=;
        b=BudgCiXcq45OGuErJzZ0Ixd7lf+CtwPc2W6+4DjkjOfb5PbX7BGa4XJE/lu0xU+cQC
         qA2tZoHG2XkLnSbGY2Nf5LZzQDstUHbaiy+mK2EBTKMH4UxQT/mjynL+crCEvEfGQNGu
         IKGjxI5dDYESWJ2/byHK/wti+yprc0Mq6dhbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727057762; x=1727662562;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iasbysCenz7uyGomAHZxudZeL78s012Zo7N6U1Pe6Yk=;
        b=AuM832fQow9DG6oo/YDzjUOIeXoNXx/yT3SkQAihWUCl9IEeBZYkWYkjHsgOaQX02z
         giGW8058wQesNT/QXTn9QpUGuOvr6mhtEpmzRD69tKeprTqQcRMntjMA05IC6UqAvBWh
         eMjwOEbK+m4RzIm+eZaf89EcEIerpwNbXM3rFXAHc/KcqewcYYRKBNZoe1FOIPSwpCUI
         Y67pU9EtyPCSAaGfhwUHMxa60JvSmKtshXxTRSdGxWh29Ta6E/VWFRvCrWm4ujeisS+P
         pKeFwQIoUPT6mhLRKdC+1l4Qe2kOVO1oDRiGen4Tv1NrHpaMv/ABcfb/7f5DdeRn3Fjw
         Iivg==
X-Forwarded-Encrypted: i=1; AJvYcCUnLsGZBwdyQCO85cL4lKTHSNko6yxf5HEuZxH4TAZP2SCsFQPS6YfUg5m19pL+fAuzhFeiNLl4RvMttOo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyb6MLKa9rreGAozf+cQMkc0YikN5VuVKuPR6zkwrPHgNK/QgY9
	7n0m/mOpX/+q0UmlCef0LXd1UdY7iZZay7dn9Zg6ROa80+SEu7tD3Tm5yqXq4A==
X-Google-Smtp-Source: AGHT+IEVFNeMkz/rQnZtNMOkdI7qq6A51lL3WpTLQ0ItCoFcML/fGuk1r4Dc3g5VZuRpkYNgUCKSEw==
X-Received: by 2002:a05:6a20:c89c:b0:1cf:55e:f893 with SMTP id adf61e73a8af0-1d30a9be5ddmr13234422637.36.1727057762370;
        Sun, 22 Sep 2024 19:16:02 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:3e10:9e7e:65b4:e016])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db4999cddasm14510674a12.76.2024.09.22.19.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Sep 2024 19:16:01 -0700 (PDT)
Date: Mon, 23 Sep 2024 11:15:57 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	senozhatsky@chromium.org, akpm@linux-foundation.org,
	minchan@kernel.org, terrelln@fb.com, sfr@canb.auug.org.au
Subject: Re: [Bug][Git-Bisect][6.11.0-next-20240917]BUG: Unable to handle
 kernel data access on read at 0xc00c020000013d88
Message-ID: <20240923021557.GA38742@google.com>
References: <57130e48-dbb6-4047-a8c7-ebf5aaea93f4@linux.vnet.ibm.com>
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
In-Reply-To: <57130e48-dbb6-4047-a8c7-ebf5aaea93f4@linux.vnet.ibm.com>

Hi,

On (24/09/22 22:23), Venkat Rao Bagalkote wrote:
> Greetings!!!
> 
> I am observing Kernel OOPs on PowerPC system, while running LTP Test case.
> 
> [11472.962838] BUG: Unable to handle kernel data access on read at
> 0xc00c020000013d88
> [11472.962846] Faulting instruction address: 0xc00000000055e2c0
[..]
> [11472.963005] NIP [c00000000055e2c0] kfree+0x60/0x468
> [11472.963013] LR [c008000004e02838] zram_destroy_comps+0x5c/0xa4 [zram]
> [11472.963020] Call Trace:
> [11472.963023] [c0000005da817b30] [c00000051f580440] 0xc00000051f580440
> (unreliable)
> [11472.963028] [c0000005da817ba0] [c008000004e02838]
> zram_destroy_comps+0x5c/0xa4 [zram]
> [11472.963034] [c0000005da817bd0] [c008000004e02d24]
> zram_reset_device+0x178/0x250 [zram]
> [11472.963040] [c0000005da817c20] [c008000004e031e0] reset_store+0xd0/0x174
> [zram]
> [11472.963046] [c0000005da817c80] [c000000000a85874]
> dev_attr_store+0x34/0x50
> [11472.963052] [c0000005da817ca0] [c00000000070e7a4]
> sysfs_kf_write+0x64/0x78
> [11472.963060] [c0000005da817cc0] [c00000000070d2a8]
> kernfs_fop_write_iter+0x1b0/0x290
> [11472.963066] [c0000005da817d10] [c000000000604868] vfs_write+0x38c/0x488
> [11472.963071] [c0000005da817dc0] [c000000000604c98] ksys_write+0x84/0x140

Can you post the script that you run?

