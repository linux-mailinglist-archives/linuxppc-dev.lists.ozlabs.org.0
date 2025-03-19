Return-Path: <linuxppc-dev+bounces-7211-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC187A6894C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Mar 2025 11:20:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZHl8Q0yb0z2yrs;
	Wed, 19 Mar 2025 21:20:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742379622;
	cv=none; b=korDj855M0Epx4LD39WMnDm3oXLgcBm4zniHpGgmefKJyip238PjP6dUREeeGXQTv+stAokRsQOpe/l31RRN2nYgJnro3ymk43QYOzFumlUixZGuEtsuTgU0RIHIiAc50wZRgfMKlENzTOxuvaLGMIwdBzZoQEOagowUE11LeM5VBC1oGuS49n8yJzB0l+Ap75Xt8t1WlRGAjxleQUiy1mk1RvRGxNO+1XC4UQr45/MgzPNnpuZktlcYIWuwBW+vBX5n5JScMKl7GG7vF9WBvGKwqwmVHH4sre0l41EeFJj8d/i5VVhAlEtqZnd46E7wMJ3hhMspkw6RB+SashTGnA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742379622; c=relaxed/relaxed;
	bh=ZWxtYxkS3ZmfTDBR3Ubow/eGPhpGRxs9B2tOpbPHly4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L9wGLS0+jUNKZPxm5gZdOQlaI2H92NKo9OnYC8ysFksW9VWb21OHEeGUmkG+782rsaV6qW4TEsicJCLbEbmlGEtgdzMc7Z5wA8YxHKt2etd6Z21OM663iwnsCBW2oDhEsV/5szDTqJ3rYK5MlCw6Pm6qHvUiJPf7B1FgKDqjZGZCR2he2ifBBCFRxRFZf75tQ7WjabId7sid5Ec8hq128BEcAyQ/BuROlzn5O4UNsrVzraL2hxXOXJOeRULf0/pNSX6/Xzdv9bzX9p6tp1QgdkgjhDd1qQqxSa3+CF+ZXnDB5eCD8NIV3AizCRbwWs7m0J4FM4MQ/ps83ZZxm4coaw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Gn9a7zMJ; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com; envelope-from=dan.carpenter@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Gn9a7zMJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com; envelope-from=dan.carpenter@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZHl8N5T1kz2yrp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Mar 2025 21:20:19 +1100 (AEDT)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3912e96c8e8so4290209f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Mar 2025 03:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742379616; x=1742984416; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZWxtYxkS3ZmfTDBR3Ubow/eGPhpGRxs9B2tOpbPHly4=;
        b=Gn9a7zMJ3qZnpOCQ0O3cyP4jCppuZ3TuLoQxkhvouuoCpEwGZ+LwzHCMnYXE73Erqy
         AX6h47wSr61J6p0fkg14OpKdA86Y56kS0FuJRju+d69RglLWwsAonTUphEs3mGR9aERs
         r4UnuLWrI9isNOiQpLf5YDbErS03mpHWUCoTKOZY674OoCYNgZYrgBucqH6PCrlYEZ9g
         8KHZDkPq+Ar0Z882r+UadQlUqafB3xY6cmyLCWgGgqwm4r6OwxZ1fUEsYdLQ0+FUoV70
         ITKC1g8Cyz6Zc4MrnWgWLk5FvKegCes0qIt8mx7/6f3HWLvOXvHIU7GHgdDw30ZGQLLi
         qZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742379616; x=1742984416;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZWxtYxkS3ZmfTDBR3Ubow/eGPhpGRxs9B2tOpbPHly4=;
        b=S7psJnWzHV7qu0FOtuTD3MQcx/h8DS6FFaQXfOITEH43Kd+7AvgACcb+MEB8GZ6S32
         vBzz+ptiTD0ohoxchlNucyjpJOKLkBneC3HF7RbagBqy8ju/V1tAJLMXD/ls4EOtxIan
         C8sV6ERIRtnZObTKAcB7lWti+aawwLEWHyKx1+HlcHg+WIzgMto/5FgXGHQNzsCV8VN5
         CqclrmKZOeJxAfln4dAsTpwEWNxsdpQJe2LPyavnkrxznnkLIwYd9Uq2P3ohEzRfZ6j8
         vUT66lZ72HVHWWPWYvUa7tRG9GLjomljMHxhTP7LZiixdbvkGiE1hn7WOTId8oy/tQJ4
         WPSg==
X-Forwarded-Encrypted: i=1; AJvYcCWfp111nGLTleQQKG3SxKmYiVeaH37WKEZ1JZYKfPmqj1UFs+I09joogqtHKqBJm0OBsW7qlsmNEsTo1ug=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxFz6j4EIqTAMnDvzQKb+zKlW1H3LfzJ+Oh4Z1mXVxIKnpfTK+E
	L1eqjVEEnSz01btnCoh1DkL7HET8twnDQACbQ+cdbU0zXqW9ttxNUHx5zcJoILU=
X-Gm-Gg: ASbGncs5aaosTguAG1cr5PWM2/amk/I9OnF+VhMrZFZjhM9OvTCEFAd7IWNq7N1LhtM
	HLN0RQpgj6ptW6R4ki+kMIJb7XzRyyBunq6stktJL+I2SUe9VBjXAtS35+m6XqBtbQ/e07ksPTb
	TVf0RD3Wsn/PgO6N4EocQtfrttZk/gMZ3OAkrcthSC/U5lsbUZdL9PUKv4zPi8f7xzq+32PKfzG
	VD7G+BR/w4FDmrwLPGtpsdheo7V27sqhy6DfB5QE6XZ7UCe1wYvwNjqQ0FPB+P0b7fCKiEQ2LqV
	qOoQL435C3jU+Jd1xhPgUSEwD7KINqLZ/DhV1KUm15bOfEKvjA==
X-Google-Smtp-Source: AGHT+IHjcG6/IeV2BOfDblPqcpvGjw3L7kajd7hg9EDti/4DwNoU0L0nZRG8X9Tat0FLH2nt55nwLg==
X-Received: by 2002:a05:6000:1541:b0:390:e655:f998 with SMTP id ffacd0b85a97d-399739ca2a8mr1441536f8f.26.1742379615798;
        Wed, 19 Mar 2025 03:20:15 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-395c7df3506sm21189338f8f.11.2025.03.19.03.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 03:20:15 -0700 (PDT)
Date: Wed, 19 Mar 2025 13:20:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Will Deacon <will@kernel.org>,
	Alessandro Carminati <acarmina@redhat.com>,
	linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Kees Cook <keescook@chromium.org>,
	Daniel Diaz <daniel.diaz@linaro.org>,
	David Gow <davidgow@google.com>,
	Arthur Grillo <arthurgrillo@riseup.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Maxime Ripard <mripard@kernel.org>,
	Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Guenter Roeck <linux@roeck-us.net>,
	Alessandro Carminati <alessandro.carminati@gmail.com>,
	Jani Nikula <jani.nikula@intel.com>,
	dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, loongarch@lists.linux.dev, x86@kernel.org,
	Linux Kernel Functional Testing <lkft@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v4 07/14] arm64: Add support for suppressing warning
 backtraces
Message-ID: <fc197abf-e65a-439f-9d35-83f4665519f3@stanley.mountain>
References: <20250313114329.284104-1-acarmina@redhat.com>
 <20250313114329.284104-8-acarmina@redhat.com>
 <20250313122503.GA7438@willie-the-truck>
 <CAGegRW5r3V2-_44-X353vS-GZwDYG=SVwc6MzSGE8GdFQuFoKA@mail.gmail.com>
 <20250318155946.GC13829@willie-the-truck>
 <a64bf821-ea90-4fd9-92ec-13bf7b7a3067@csgroup.eu>
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
In-Reply-To: <a64bf821-ea90-4fd9-92ec-13bf7b7a3067@csgroup.eu>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Mar 19, 2025 at 09:05:27AM +0100, Christophe Leroy wrote:
> 
> Doesn't sparse and/or checkpatch complain about 0 being used in lieu of NULL
> ?

Sparse does have a "Using plain integer as NULL pointer" warning, yes.

I can't apply this patchset and I haven't been following the conversation
closely (plus I'm pretty stupid as well) so I'm not sure if it will
trigger here...

regards,
dan carpenter


