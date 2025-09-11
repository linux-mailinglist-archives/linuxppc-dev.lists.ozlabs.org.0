Return-Path: <linuxppc-dev+bounces-12043-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 733C0B53E1D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Sep 2025 23:52:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNB9V0dmDz2yrZ;
	Fri, 12 Sep 2025 07:52:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757627533;
	cv=none; b=AvOqB/rk5WUQIdzDd/l7EQbfd3eBtWsj+YnTn3vU6YlC03+BQyvA7VnwiU7diQR+5gW9WpRshYR0Z44UcCyYbJtrJg9FePQuY++2MM1lHJJlDKJpjUz2AWil8/Rn9CJhh3nxRHNS9x4Tgqlm3xkjboXbXZoO+7pghDbcwU0KBBYSnpGMmxWdrfNfyJ6Rn3bSNUnbmzKZlMU0dIXWD+tOrjSi/3rrooHHfE/tTAYJXgmpj3po+fKZ03EV28fXIkCuDKfjyCQCdduIqIv9DsIgNMvtfz48bR3BY5HDLi09lYSOuY3tkMYK3ukszRRMi63P0I/WASbtoWDfFkATIOiVQg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757627533; c=relaxed/relaxed;
	bh=HCC2l5e6FSf+CmwH+t7zaiFzHJluzLyI3JzzK5xSQZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GMWSx/VX6maFn86gCAAH6Po14teZ4zELUHn8lefXhXwpYNQyDXEsNZe3bLhBVSEFPQA4y3H0AJUVNF8dhf92zwPVPrCvvPEb5AOrQCk2vTp5TFlgG19IUbtwbMjV2MIhMSL/DueuoXZgqO1/uspE6GPWdV40rTUEi6+kCYvNo08yWsHJISmPK0JQbGT+o3vPQuToVGapwKlOECq+3+DlkPumBNxg+JloMX0O91puC9/xjWRHIZpI9LHLns6ypvqOtW4BxWwZ5Brq0NnMUoXqXo7EzcNJ76reW1kkclnpnyeAuCSbCRTohPbq9I/ccBoLu2xX2i71zJz6ew4vjTW+PA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=fdyoA9Ra; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=briannorris@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=fdyoA9Ra;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=briannorris@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNB9S5YRgz2ykc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 07:52:11 +1000 (AEST)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-77269d19280so1215608b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Sep 2025 14:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757627529; x=1758232329; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HCC2l5e6FSf+CmwH+t7zaiFzHJluzLyI3JzzK5xSQZI=;
        b=fdyoA9Ra4Bd+mX+2BYa3XM/TsKKOxkwzICqKhjVx18AM4MKLfrLv44+OGTx1TvDEFa
         cSUIRPNKJlmi47YwZhMLSZAJ1RTuqkKxF7a6d7x6qr4PkbQ2zu1uVcIfYuSN52Gkh23M
         vr5Iib1ix4hs4KR6URx2vM72FDm33zOhhPixY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757627529; x=1758232329;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HCC2l5e6FSf+CmwH+t7zaiFzHJluzLyI3JzzK5xSQZI=;
        b=HKQIVXeIx8LnnkDltAE10+2oEJ5uGUT1ulKB7X5gxVNN/O5p9H2XBRE5fwK6d5JCMZ
         yhtlQMBt3Mjqa/RI8qh2zJMkqSSf5JywwczH3m0ZKWT6Bo5R9AHrTgxMQW4cK690w3Ob
         gRkYG6DNuIQQST4ohNDY12VISDKvauvCIcBNJkuo6U3JJl67ke1b3Tvk8zV9pO/7aJoj
         +nL8ASajBq/YFQ8D+pwIMfl4Dg+urqwm284B3GQ1MAj9zQFRNuHKZpTV5Ylun6A0Yzes
         pvXhTQ+FP7TfYOxHiybq/xjSxS2mU5/F97k5+dALFjgRbNyVE+Np+1p8mtTUHy08sG2G
         4NKg==
X-Forwarded-Encrypted: i=1; AJvYcCWFc+vZysPu8lmHp970Ez0A4dGxn9sMGMQY7wybcH4BPK650n0GzhEzjwkGncnDrX2Qr+sL4eaBbDdH+iE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwTYWeMP7wMYnp/ySK+htLSv9xxYd/g7i5V2U08v3o6Lc9LZ5S9
	v38uSRWdhKMr2LC1L44RXHj+JrrFWZSJ26U88tmOUhxkPyUryVGdNL3OnU0VKH44Dw==
X-Gm-Gg: ASbGnctbEGJuU7ValyManVLQ/V4l1SDxs+qcd+Cr5BPUrxAJrvJmnzOc5Cn1TvRbyl6
	0UENg7Egg2zHzh3ydwBJmSkmjbuqnp2HGsOgSVeatSeVprLYg5z20dwfpoR6fTtBbReuvAJi3sn
	4lNSV44E/uo2O5MPjKSVXFWH2gsVYMzZLnWzOYE1gLLa0WFM4qxT2ePr7+fZf0NCV1KSDsvaedC
	MahTElIky/m9VDPmRCWKREvNOMGnl+5r9MZOTVUQf2wefjNHtMLu0YaHtX4yciJSEmucXW/ax/S
	urdZZ4gRjvhmKMxNMkJyE2vTCc+aylsZ3J7h60ep7Ri/qJms3JaQA7AJZhzWSp5ZfzBFdO4OrNO
	U6UPO07PfPMfL1kPWj4NtZvjiIJTo78GnHED6/dpA4tYUoTAY8S+L38YWhDI=
X-Google-Smtp-Source: AGHT+IHb7w+bL2sibzRwFec3AsLqESlpAB7GfKe+XRbiM8MpDO4ZOEXOkV+dkAH3wE9LCWOv78D60g==
X-Received: by 2002:a05:6a00:2345:b0:772:63ba:127 with SMTP id d2e1a72fcca58-776121884a1mr929198b3a.24.1757627529148;
        Thu, 11 Sep 2025 14:52:09 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:6690:568:13de:b368])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-77607b18400sm3138359b3a.59.2025.09.11.14.52.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 14:52:08 -0700 (PDT)
Date: Thu, 11 Sep 2025 14:52:06 -0700
From: Brian Norris <briannorris@chromium.org>
To: Lukas Wunner <lukas@wunner.de>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Terry Bowman <terry.bowman@amd.com>,
	Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
	Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Linas Vepstas <linasvepstas@gmail.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver OHalloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org,
	linux-pci@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 0/4] PCI: Update error recovery documentation
Message-ID: <aMNEhqiJKK9NOreA@google.com>
References: <cover.1756451884.git.lukas@wunner.de>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1756451884.git.lukas@wunner.de>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Aug 29, 2025 at 09:25:00AM +0200, Lukas Wunner wrote:
> The documentation on PCIe Advanced Error Reporting hasn't kept up with
> code changes over the years.  This series seeks to remedy as many issues
> as I could find.
> 
> Previous commits touching the documentation either prefixed the subject
> with "Documentation: PCI:" or (when combined with code changes) "PCI/AER:"
> or "PCI/ERR:".  I chose the latter for brevity and to avoid mentioning
> "documentation" or "PCI" twice in the subject.  If anyone objects or
> finds other mistakes in these patches, please let me know.  Thanks!

Series looks good to my limited knowledge:

Reviewed-by: Brian Norris <briannorris@chromium.org>

