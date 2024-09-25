Return-Path: <linuxppc-dev+bounces-1598-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8513198694E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Sep 2024 01:00:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XDXHy6zmpz2yLC;
	Thu, 26 Sep 2024 09:00:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727305214;
	cv=none; b=cwqYuk0VutjkFMYfS7QQ4hEMYGA9+qxFIGG+POsiX++oTf9sfSlqFtMVqGy10J9Io4Nxc9FG4TwRNqNAs7ITL+Q2x8irXFxd3s5W063zLse3+LuJ6fO2aqES3XLf/k3N9biFQ6R3VmoBVzK+E2JuDEqHYbgEMNUYMKvfMZ45XM27rvxjsjnD5Z6iOKW54FClUl0lVuKz9eYuDf2/XHuInTX6UI3IJgImGGyMP4HSz8YbRzTCBOevsMmBTyZXdxFsvpfxepakDDTcV87atn0iDrHCxmTn2aBd3zCLVX1JJzNbPbqqBkaUDms/beN8gIZ78F4cvYNkmwQu+TJSc0x2Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727305214; c=relaxed/relaxed;
	bh=Vl8E5j+ZmDbmKOpu44SNpmShgOamIMtl/ODRrZ2cGY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=moY49UR8fUiCO6ieWQzWEgbCBU/ryZCrf9Ve7XOYMTOfHREQJnh5OnhTuZ2jTPT4SB6sFZZeVtNLx+0QNt6D28gtHYrDYMxNWjKLpmaFmQ0krWgSlaLUd0BcKkSYK0iHvqq590VSUzOUW6CDTUWUXlPy7Xbs1y76hdIRMVmVN3daZtCvigxt3yYnGbtcDqzZJz9XIXs8hDgyVOKYZ0svD3Fz/FJ6bB5nDbF2tXwrCV+M1hQZ58a0rY4SdGDxVpgZJxL2hoqvIkJvg1HarEutTuR7bRss2CpB5OmU8lRiI1/Lcuv+cZCu24xnTeG2bbzju4/lCPmuXFlc42f+50We/Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=dYN1GAA/; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=samitolvanen@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=dYN1GAA/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=samitolvanen@google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XDXHy0f3sz2y71
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2024 09:00:13 +1000 (AEST)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2056aa5cefcso66135ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2024 16:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727305209; x=1727910009; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vl8E5j+ZmDbmKOpu44SNpmShgOamIMtl/ODRrZ2cGY4=;
        b=dYN1GAA/K3zHB1Nzw2dZ8IOETMMyQLEajLVTLO6/ph3wzYvPtI+/LwqpQ6MedjPA5E
         9CDhQ1XPucHFPewD3peCQNv2HMnvKSBh158uaUwP2F7b6Ywf7DcipzqwCf9bdGQYpC+4
         bNQkvotQXMw/YuHGegAwY/dyNfxgo5vtkqs+IM7PFScYMDcVVbkUBjCblvz5Zxa8uTRR
         o0ZIu69cx4RmxDf/o8MIYSWU0jdTSD2Qm1BrcYSQnkfoMJEOaAULW1K9tV9aYnUnVTI8
         fQse55Dq4KKns1Qzn/5kS+ODBmjCI/9NpPe5LU9jedXDcDkE/kDL0SIWFr6Kr6NLv23z
         aMtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727305209; x=1727910009;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vl8E5j+ZmDbmKOpu44SNpmShgOamIMtl/ODRrZ2cGY4=;
        b=iGTkI9SVxNUvt5crfEyi+Nq5C/8Mf91bcsXKWM3CcwjyoycKLDu3ePVI49bLZVPRn1
         YAsyjy+SZYgFT5pHHNRaWx/FTvQjSJiYDq3TlfzWbX47j+q6VHoF+Qvxl4/Ktdjw4gZb
         EuOR3xLggFEpqgKjMy5V8T5a0DRpUFYW0bTUzC50KCs8kq5EVkgsNnGQrjIXgbOqGuit
         V8DY2U5n/0cFs9WNHiLC7U4FD/DNkxFCUHCI5CY33AEHN2XP9ZbiTnCvSRXehGJuUyz1
         MgTaoTQd/UAAD3Wr6TnQOQk4KoVbl7y5Blmh0hrpMLZ6RHJxbFfRDURiCdtZBrJMJxM+
         NHvg==
X-Forwarded-Encrypted: i=1; AJvYcCUodwfJo3DnO3oFBhrR/QhOcXVZZWNN0TRJLgw1d8PrC0Jni23bEt3qffY35ygjRkBHRFviCBJVEmpkbP4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyFrbFYG/w5hzT4TdCdvA69cbbiPNqOdM0PT7iV7GZ2j2Jpbp/G
	8pasnFVp39a5SqW0DEWxEBxI7/cS9+nbYs/s8I/tWeBwbtwITGEq0ngcVli6Fg==
X-Google-Smtp-Source: AGHT+IFG1pBJvk67WuIMPqXmbr6qCgX/nanvp1+Hex9+YWAbxaQzu9KQp5bWrdANVwkkvt84iFfWmg==
X-Received: by 2002:a17:902:ec83:b0:206:a87c:2873 with SMTP id d9443c01a7336-20b202f1655mr563355ad.5.1727305208163;
        Wed, 25 Sep 2024 16:00:08 -0700 (PDT)
Received: from google.com (164.135.233.35.bc.googleusercontent.com. [35.233.135.164])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71afc8493cdsm3190227b3a.88.2024.09.25.16.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 16:00:07 -0700 (PDT)
Date: Wed, 25 Sep 2024 23:00:00 +0000
From: Sami Tolvanen <samitolvanen@google.com>
To: Matthew Maurer <mmaurer@google.com>
Cc: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org,
	gary@garyguo.net, mcgrof@kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Benjamin Gray <bgray@linux.ibm.com>,
	Naveen N Rao <naveen@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	neal@gompa.dev, marcan@marcan.st, j@jannau.net,
	asahi@lists.linux.dev, Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linuxppc-dev@lists.ozlabs.org, linux-modules@vger.kernel.org
Subject: Re: [PATCH v4 14/16] modules: Support extended MODVERSIONS info
Message-ID: <20240925230000.GA3176650@google.com>
References: <20240924212024.540574-1-mmaurer@google.com>
 <20240924212024.540574-15-mmaurer@google.com>
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
In-Reply-To: <20240924212024.540574-15-mmaurer@google.com>

Hi Matt,

On Tue, Sep 24, 2024 at 09:19:56PM +0000, Matthew Maurer wrote:
> +static void dedotify_ext_version_names(char *str_seq, unsigned long size)
> +{
> +	unsigned long out = 0;
> +	unsigned long in;
> +	char last = '\0';
> +
> +	for (in = 0; in < size; in++) {
> +		if (last == '\0')
> +			/* Skip one leading dot */
> +			if (str_seq[in] == '.')
> +				in++;

Thanks for addressing Michael's comment, this looks correct to me.

Nit: might be cleaner in a single if statement though:

	/* Skip one leading dot */
	if (last == '\0' && str_seq[in] == '.')
		in++;

> +void modversion_ext_start(const struct load_info *info,
> +			  struct modversion_info_ext *start)
> +{
> +	unsigned int crc_idx = info->index.vers_ext_crc;
> +	unsigned int name_idx = info->index.vers_ext_name;
> +	Elf_Shdr *sechdrs = info->sechdrs;
> +
> +	/*
> +	 * Both of these fields are needed for this to be useful
> +	 * Any future fields should be initialized to NULL if absent.
> +	 */
> +	if ((crc_idx == 0) || (name_idx == 0))
> +		start->remaining = 0;
> +
> +	start->crc = (const s32 *)sechdrs[crc_idx].sh_addr;
> +	start->name = (const char *)sechdrs[name_idx].sh_addr;
> +	start->remaining = sechdrs[crc_idx].sh_size / sizeof(*start->crc);
> +}

This looks unchanged from v3, so I think my comment from there
still applies:

https://lore.kernel.org/lkml/CABCJKufJK0WO92wnW09VTLqZk0ODxhuKQG=HbKE-va0urJU1Vg@mail.gmail.com/

Sami

