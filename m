Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D3B20BBD5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 23:49:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49trB32ZLZzDqkc
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jun 2020 07:48:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=Pqzaouq9; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49tqmD626lzDqLR
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jun 2020 07:30:04 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id e18so5484528pgn.7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jun 2020 14:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+IN/dHrnSFJwCdsiVxf8dhkTYXziQPztMYyCGVl57TM=;
 b=Pqzaouq9BT4GE0gjlmD3L3Uoidh8l7ZS7+O86mF+FHQf7Fm27moUcW7Dod9X/TdcKT
 rT06Kwg1pQmk8zhRtK/5z5iRSdXzqfIs2K0BC0hqy21Vim6PSB7gW7XyFtjDu4LOB/bD
 RU8AX5Ebj622H1q2YqlUvFkcglwp2WcEqUoD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+IN/dHrnSFJwCdsiVxf8dhkTYXziQPztMYyCGVl57TM=;
 b=hLIq5672+neBwAgq4gW/EQaPvOSyBxR7vaDjvAyXOsXx5nf3ccaA4I66Yvpio7VNh5
 WManLq/2tsL5ARiBoWmSOSexAkbmEsFAzp6MSxf4517EInPlpxRgJ3RH76qXmQfI/9I9
 42aH/pVfTqhkXme7Ek8NpT7WKjv04FhKVF+xWTnd0DAKpsgDD9WNo6UVYwjOlyWxULdw
 grixZbBb/9MPGWsbnLCQs4lRkpZ/uLCrA1rM+El9JjMEHEC1j3CIEchVMWe1IrBew9sL
 sCsrvAtfyHYEZvCXZSVZ9V1y//sfzNUapiJzd3FspDIsnFMt4qJr45Qny86jutwm+4Vs
 B5Nw==
X-Gm-Message-State: AOAM532AjoJ8cYdp1cvvuBLnQy/R/yCsdHLX+dnS8cuwf8cuadRfs+HG
 gtqOk1mxkfgg4xOBpkw/gAoDBA==
X-Google-Smtp-Source: ABdhPJwffNZVFojpM9ARq7D+MFPkJd4phuspFIs1JaOLslJ57S8CfThHPaQNj4fP51cEdSRPJwcAjQ==
X-Received: by 2002:a62:8811:: with SMTP id l17mr4509571pfd.72.1593207002451; 
 Fri, 26 Jun 2020 14:30:02 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id a7sm12857762pjd.2.2020.06.26.14.30.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 14:30:01 -0700 (PDT)
Date: Fri, 26 Jun 2020 14:30:00 -0700
From: Kees Cook <keescook@chromium.org>
To: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH v5 06/12] arch: xtensa: add linker section for KUnit test
 suites
Message-ID: <202006261429.5F1A1F72BB@keescook>
References: <20200626210917.358969-1-brendanhiggins@google.com>
 <20200626210917.358969-7-brendanhiggins@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200626210917.358969-7-brendanhiggins@google.com>
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
Cc: linux-doc@vger.kernel.org, catalin.marinas@arm.com, jcmvbkbc@gmail.com,
 will@kernel.org, paulus@samba.org, linux-kselftest@vger.kernel.org,
 frowand.list@gmail.com, anton.ivanov@cambridgegreys.com,
 linux-arch@vger.kernel.org, richard@nod.at, rppt@linux.ibm.com,
 yzaikin@google.com, linux-xtensa@linux-xtensa.org, arnd@arndb.de,
 jdike@addtoit.com, linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 davidgow@google.com, skhan@linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org, kunit-dev@googlegroups.com,
 chris@zankel.net, monstr@monstr.eu, sboyd@kernel.org,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, mcgrof@kernel.org,
 alan.maguire@oracle.com, akpm@linux-foundation.org, logang@deltatee.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 26, 2020 at 02:09:11PM -0700, Brendan Higgins wrote:
> Add a linker section to xtensa where KUnit can put references to its
> test suites. This patch is an early step in transitioning to dispatching
> all KUnit tests from a centralized executor rather than having each as
> its own separate late_initcall.
> 
> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> ---
>  arch/xtensa/kernel/vmlinux.lds.S | 4 ++++

If you ever find yourself modifying multiple arch linker scripts for a
series, something has gone wrong. ;)

-- 
Kees Cook
