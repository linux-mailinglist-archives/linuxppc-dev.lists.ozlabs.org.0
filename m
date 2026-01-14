Return-Path: <linuxppc-dev+bounces-15734-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDDCD1F099
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jan 2026 14:20:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drmvB3H1rz2xT4;
	Thu, 15 Jan 2026 00:20:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::434"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768396822;
	cv=none; b=flD4kyncWKsrtetqgA99Qy2XrotFb7e2p5lUfVlg1IuQLk8fhZO1Jb3cirtVvZ/57D032T2lYOmFtMlazQxzyv1nRXueDdYwfjkbSMpLLYUUN2pGwo38+5rtuYYa3PZYWDrK8ik7l60OU/2sQo7nb0oym+R5krd3+q0EEjXOnbgEvSJkE5OGe72j8mmlO8oG0KY7lAK3DLGSHj/8QFsHQejtcxi1Zw5qzaaghgbd2/AneB/o7hXqdsIbScZXB8sFsghLrbX6gU66+pWoNEGeAWE5TqBtOOiJahneIoExNPgOvWjifoa73nqHqhs8oCLaOnmXUNqc7TpAIWRhj4t4Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768396822; c=relaxed/relaxed;
	bh=sWiGwjTB0ZEpbDkwRFO+MVJzM9uZpDrSFPQIlzRZfsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MCxHBp1jMqfAJpgPHUmae5EWdsakG3PIz4ecxMvzh4x+YKPp7ybZfmxOKB0wNQnsr2hLwnVh8rN0lcQtwN3PWJMyXbOOo+MMrlRj+hnWYHx1sNx/sckFkp7AMJtPgcC2/8OhvmId47wLxsN0CaiW1RtTFTQsFoIpTCHhzGtgPsh959kPNAEEBOWqVpCpiRfUOrfimlznUbwCCcg7zOyOZJ0Wdw3OmYYRVBDZQtkO3rMjqG6j9pPxdhs4dHo9sSDCKpAyodykZadl9TiVVG2oJ5Cv7BnAQgHfBrEtZ544RoB8OFj8z6/J7bVc9V+9Sbe1b67m+Z61RwfnnVG3t2Jvxg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=SClB3eYy; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=SClB3eYy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drmv91xpmz2xNT
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 00:20:20 +1100 (AEDT)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-43284ed32a0so4500612f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 05:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768396817; x=1769001617; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sWiGwjTB0ZEpbDkwRFO+MVJzM9uZpDrSFPQIlzRZfsU=;
        b=SClB3eYyvdaCataPT+1EYRz13ljgeRdunhNkQftNDppFn91WaIJciTbZlhMs/86Nv1
         sKd/pHEOvb0X1lXuBHVA6X1evnXLS4N8z00thtJCX9bcsDqUJS8Nnu71Obyyj79yTl9f
         vlVa/E5IL7A+TkgolhixV3Wugq/iAsumX1/nCTeqVl3+68HiZkDXe0CFEfkMPsLUBsR/
         D8jRgH2AXspO++6d5flBqBherm/3vdPQZFeCTgF44LVwRUbQpbxMbKk7H73HPtqH5A+s
         rb6kI27m0hIqdpcSZ44vvt+AR7iJ85xDVJUCQVxK3zLa2Hyr4wSHbHg6Xu5xAV4gQWDz
         EYQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768396817; x=1769001617;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sWiGwjTB0ZEpbDkwRFO+MVJzM9uZpDrSFPQIlzRZfsU=;
        b=alRL3D8aZwHiOPu3+g8IgvzAal3suaBMvKBFIFC4X7LVJ2ZZ77diYDZTGx2wAn+3un
         SxijBMX0xt5jDu6S/JNOCCgH+gOfdb0sbbTlJ6o9IfBMRnxAhm/+NsCnZTa7DOSA4h6o
         cXZYAmW0g9nM8qRWsj8L13P71mOVJAhNOk4JWRku3yFhD+G1vd3YD8E6y7N2X4CNCL9I
         EfvP7GFlVO4cLjOWPL0aV1xsFow5d+Eqstiu/F4wAvR3C5zZPyBkdWKZJQBHS2zCfL06
         DixSxhmcxlZCZdWsZZQq4gqWmRSu0jcCHR2rZ1631uD30HJGK4a+WuAX6wlHkByk+YDM
         44cQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtWU7VnwTejGNHJfpHIcTOuFadcAZv+cgNQf7ubJW/PCsPBOKKqZR7OKC9W3BA0F1QpoMVd2WjxPGGgRQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwgPSJae6O/WWSPraNP8859dWHqvziqzCksKc6oRVvhtJP23pLF
	IlK7G7LNA9HXIzU1wt7UDoXT4j9FxOgqYzoDB3FOwcmEMTQn0T77+qsPyc5pRQaJHAc=
X-Gm-Gg: AY/fxX5Q1VeuwXirFa79U258RNtU7G9zlJJv8PKzQ+iVEiQBUExSQ/1BvWTNs9QMApP
	eWMIIriN2s8HMvkIvFYcA+lH+5fbHB1+XfZLqBaS+eXCH5yhjj5GeUHsIYpI9Vy6zhtiFBSiNru
	FQD/4BmF2280VSfmuoJnbaZedDIsQbsNRrcD4j0ucAsqj6x+hcX8HCDrvIlhjFPYRiXArUOf52r
	UkHIMXuVnfRkjjMDKaLFJVr8J2A0zpKxpghSZtjGY4PSAC/ELBg7Q5uycIK900eyUGIXuE2bTxK
	9apo3+J1XG33oRJaUo2/peMdqpO3N2PXaQIc4H6CyysC6QL3m1QSAmCrHvWowhjqwUjfJElkxcb
	XMJQ4uXPzzZFZUQq6kC361XzG/qxrdnBm8T/0W4w38d7IHGd5L50OM6aSeYd4WP3MRPP9c/ejCy
	XezPqjpk6WekrEaA==
X-Received: by 2002:a05:6000:2511:b0:431:9b2:61c0 with SMTP id ffacd0b85a97d-4342d5b2ab9mr2581603f8f.24.1768396817421;
        Wed, 14 Jan 2026 05:20:17 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0dacd1sm49153435f8f.4.2026.01.14.05.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 05:20:16 -0800 (PST)
Date: Wed, 14 Jan 2026 14:20:14 +0100
From: Petr Mladek <pmladek@suse.com>
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Cc: Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jason Wessel <jason.wessel@windriver.com>,
	Daniel Thompson <danielt@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jiri Slaby <jirislaby@kernel.org>, Breno Leitao <leitao@debian.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Andreas Larsson <andreas@gaisler.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>,
	linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
	kgdb-bugreport@lists.sourceforge.net, linux-serial@vger.kernel.org,
	netdev@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 05/19] printk: Add more context to suspend/resume
 functions
Message-ID: <aWeYDoMsdBNkJEqO@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-5-21a291bcf197@suse.com>
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
In-Reply-To: <20251227-printk-cleanup-part3-v1-5-21a291bcf197@suse.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat 2025-12-27 09:16:12, Marcos Paulo de Souza wrote:
> The new comments clarifies from where the functions are supposed to be
> called.
> 
> Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>

The improved comments would have helped to understand the previous patch.
I would either merge it into the previous patch or switch the
ordering.

If this stays as a separate patch, feel free to use:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr

