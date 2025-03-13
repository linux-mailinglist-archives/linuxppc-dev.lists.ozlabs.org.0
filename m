Return-Path: <linuxppc-dev+bounces-6977-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A77EA5FAC4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Mar 2025 17:06:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDC6F55K0z305n;
	Fri, 14 Mar 2025 03:06:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741881973;
	cv=none; b=kvqiL2uJVX9AQjF4t8zTeJ3zLXrOFsww7lJxsL0pKt4brwlvQIvetrlUq9BbOYwTTPLj2Onh4SDHztZx0cFDxs8D2d0MYZCJ6Claz9BPw1yhCTNcNb+HZ7kmI5G8jX61dwOXr7epcLvViihm9tY3i5TwKUNuT3W/cd2CFGJRF6URDDZv40yB+fBObkZ7DZuZKyDmJn//2XM0vM+l0K3fsR+egFEYlW022ftL8cQ+NuTa1iUTg52zdZP7DTiDHHnnh6czgNtkPiCtM8QBVpUQ0Y59qAlbmiJpurneZqZoq0KWaldD+gkNHZLntVT/dit4Hk7OCu06+qY8YI82oylUGw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741881973; c=relaxed/relaxed;
	bh=3HZvPdaIqRtWzMsbUSWcLTIHwxLYbx+aQlE3dkPDF7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=magvrK0XHirl7FGNtaz65fX6IYvzEXPI46wAVFkQGaETXYgMo/iNUvxH+Ab4oSdPqWkWBi46zuQeyPdRjd5oMCpURM6MZw7lJod91rfntEUHeEXtzbh1zFmIig0/xSJIiWkHprwNHRNe09x1OivUESSnXqo5ioVLAsZUQDSxWJfzFExeP/CBYLImzFJEKY08Ek0hkt2yh9DB+a6TP+7hEmUDKUiHaR9RtF3MzFbYTSus3EZA6P3grIWO+QJkwnSkpXXroOWhsXDmmG8MFhxos6/W/MfK5D8TAr05Rjrg1xGVOQDGIFVb90K8qfO6ua/OexkNZrSIIUxzxgvMk1D0bA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=dLBfFiMS; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=dLBfFiMS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZDC692dk7z3048
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 03:06:08 +1100 (AEDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso10709025e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Mar 2025 09:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741881963; x=1742486763; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3HZvPdaIqRtWzMsbUSWcLTIHwxLYbx+aQlE3dkPDF7Q=;
        b=dLBfFiMSjPqG2rwVF1YI0x666AWagBsnJFXI7qUOxq4HpduWQjqhKFun83eZIohbUj
         7VzOxntG0dnGw2JldjSBVIhTijePwPzsNYKcMr/r+8ElOe6DCZVyY9oLN+BHeKyGsb4L
         zPEuo7vU1l428Hgl7BR41IsgdJZwFOepAo746/+NlRu6ZDfPsZT4fKfJIWs/u6EbEQsQ
         ZrgBB17zlOymP96rI78CwszVvqCm7L0YGqr1/TKB6Ut683Qk2NQKzXOgfSEHxBJj5xgz
         7eRvdByRGHjqWe86VGn/HK1qj59vx8iIAgJeZH+vSEtk0WgTETcrr1BS2nNJ7KHv7fRN
         fRoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741881963; x=1742486763;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3HZvPdaIqRtWzMsbUSWcLTIHwxLYbx+aQlE3dkPDF7Q=;
        b=aWx8BmIo6JaQx2KqDZGsrv3Q5LQRcq2+wfTh4fzboBwhfWAzhBNZDAiNJYgsydVfXy
         euxKgOb+PMQWdwmxtvykGEc+55dggJtjQrCxCgW9vg+0RPyKmii6AcX+X+ZoxrCVOoBF
         5ROyyf6UO5E954l8Hg7pYSCBxYGXnkod+D4CJw+L+aL6KPcGBeaA8MPFy587MYV6i/SJ
         AOXGOU1G/pJ8NxgIVZ2BAdhL9rIw+tgNL5j9OXfdGf85TwN7NQLnEZ5z4LVQiHqBnM7E
         y1JKODVK89pkBTAqRhJKzOHSdAYb+SzUNvvZP5f8o39+sFp0GyhayDCNrUKkPULhve1X
         cDbA==
X-Forwarded-Encrypted: i=1; AJvYcCVYVmDnwRfYEkByC4PohpzxoafFnygQ7zrYQcUDDljqT2L3BOq3s89xC8LQZtesmfhlkJlyC4G/hwkdxrM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxOv5X4h7yhUHfXOq1Q0AAHqieiWhaPRrzdp9toDx0bLXbYLwaq
	M23xN1+15jBlVMCfpGmyrGvlhZpoNH6hIG+wKkt68fkdFaQr5dn/1R3c0FOSSq4=
X-Gm-Gg: ASbGncvuI58hSLtoQf9Dxn1UFZ4pkBpDxMpgYNuAIXCjERetwtO97tIkRi0sNGn8QMM
	JuaZp4iqpyPRPJ5la21gtO2XVDU33/rhYqTF2EoDz5DS0k7FQHU4GroUutTyGuwfV+cFqe4zJtO
	Rx3NNPUtxwUlfEE1NGfTRbIlKQPaBy3jSTjgvWI+Q0LrgbnG1OGR5Y8UHMY8tD65+kVn0AzfMZI
	1OqsBJflxPs76e65UCW2cVQRfHyfyQPFLoRcAGbaKECSlEwllHUd2cHPGO/UoP4m/t/+8Px0XHg
	Vj5Fnj47HC9CWLfvAJ+k1Q9oEYSCrht4kjVn6I6ufJ7MiZFviflGxensbA==
X-Google-Smtp-Source: AGHT+IEQgvgSedwxIKGl9SiZ4df69QimUI+L/qJr9u7Y58J1gpKQcf9TTsptlOEMUHLXVau4Wsbqng==
X-Received: by 2002:a05:600c:1f81:b0:43c:f895:cb4e with SMTP id 5b1f17b1804b1-43d1d8cb061mr1985145e9.17.1741881963106;
        Thu, 13 Mar 2025 09:06:03 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d0a74cdedsm60150725e9.11.2025.03.13.09.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 09:06:02 -0700 (PDT)
Date: Thu, 13 Mar 2025 17:06:00 +0100
From: Petr Mladek <pmladek@suse.com>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Arpitha Raghunandan <98.arpi@gmail.com>,
	David Gow <davidgow@google.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linuxppc-dev@lists.ozlabs.org, workflows@vger.kernel.org
Subject: Re: [PATCH v6 0/3] printf: convert self-test to KUnit
Message-ID: <Z9MCaPagUM7KC26x@pathway.suse.cz>
References: <20250307-printf-kunit-convert-v6-0-4d85c361c241@gmail.com>
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
In-Reply-To: <20250307-printf-kunit-convert-v6-0-4d85c361c241@gmail.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri 2025-03-07 17:08:55, Tamir Duberstein wrote:
> This is one of just 3 remaining "Test Module" kselftests (the others
> being bitmap and scanf), the rest having been converted to KUnit.
> 
> I tested this using:
> 
> $ tools/testing/kunit/kunit.py run --arch arm64 --make_options LLVM=1 printf
> 
> I have also sent out a series converting scanf[0].
> 
> Link: https://lore.kernel.org/all/20250204-scanf-kunit-convert-v3-0-386d7c3ee714@gmail.com/T/#u [0]
> 
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

For the entire patchset:

Reviewed-by: Petr Mladek <pmladek@suse.com>
Tested-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr

