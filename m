Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C48333C98
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 13:25:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DwWWg0kZWz3d3P
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 23:25:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=roZtAoG9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035;
 helo=mail-pj1-x1035.google.com; envelope-from=amodra@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=roZtAoG9; dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DwWWD2WZdz30Gr
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Mar 2021 23:25:25 +1100 (AEDT)
Received: by mail-pj1-x1035.google.com with SMTP id w8so1529241pjf.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Mar 2021 04:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=OITK1H+UK4Dvfx6FimHtCUMdT0BddbFkzdVgUWzusJg=;
 b=roZtAoG9zy49lj4u/vGt+XptF3mYPCRZUvh+mn7XHIuTZ8NJAZVCYAfYewFsgdhie5
 LeqBKpo9hkL6Q8xKMWc9sNLE5YV9SGX1w02uXyb0kAEM/y8+u1TSEHTZhS0jY5c0qw8p
 MrjCw6P1gxnF0s6QB5+y79JC/L98Idbb29t2UgeeX3hIau2bWUY+2h1q8HYw6730CBf9
 74+V7KCTNyPWxJlP2Z+iMetYbUeJfz+ZidcOORCFE5Zkxhhhl8dAZIlW5NMsFqSkbd1+
 l7wh8en/5aYQE049tcVJav4fHaB//hvK9Gdpxi4sqESFcPm7TYE6vedCm3nkoyjOr4qn
 oYSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=OITK1H+UK4Dvfx6FimHtCUMdT0BddbFkzdVgUWzusJg=;
 b=Qg9Y82kk9GB0MsyHw8t5gxvUZWiAjkhmqhT2TIwpDqdPWnrMnTHUdra2xZy71BSuyn
 wuVasFAk/9pi8nHsgfj1mWAg7N9oG+zxYDJbnErDrFdw/zJJNss5zeTg20m+JEFevVfF
 zLsmwfNES2C7eM9ZAR2Kz0w6QHs1F+KiYpQPTXr/dIwCXBJSDL0QdKnByyZ6YcQQJD8f
 VDMpLuAXecCTfWBxf49C4L3alw2prLiFHlu1v+ih2M0Qdm92bingAoIFdahbFtD+zI86
 s9zkdVK8zlH/JSg07GO43lrA7Kw4olmu2BdJl1M6+OaLWiIIZjSwFeWS27RGBVf4t+Cx
 CK8Q==
X-Gm-Message-State: AOAM532o/kyhe/d2l53ErileX/HSRh+s3LDGj6V0DfXYwb5nF1qH3lx3
 jFEjq3lfe0olMnnXfWwpEis=
X-Google-Smtp-Source: ABdhPJw/TAUjDMUNDTJnoDC9Wk1eUW/Ved2jL7q1SqRiOQi1iOLRATD4AGseyZtjDKfShg0L0IJigQ==
X-Received: by 2002:a17:90b:4017:: with SMTP id
 ie23mr3439877pjb.118.1615379118034; 
 Wed, 10 Mar 2021 04:25:18 -0800 (PST)
Received: from bubble.grove.modra.org
 ([2406:3400:51d:8cc0:782f:891e:65a1:90c6])
 by smtp.gmail.com with ESMTPSA id y9sm7098679pja.50.2021.03.10.04.25.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 04:25:17 -0800 (PST)
Received: by bubble.grove.modra.org (Postfix, from userid 1000)
 id D23DA42528; Wed, 10 Mar 2021 22:55:13 +1030 (ACDT)
Date: Wed, 10 Mar 2021 22:55:13 +1030
From: Alan Modra <amodra@gmail.com>
To: Alexey Kardashevskiy <aik@linux.ibm.com>
Subject: Re: PowerPC64 future proof kernel toc, revised for lld
Message-ID: <20210310122513.GB29645@bubble.grove.modra.org>
References: <20210309045638.GI6042@bubble.grove.modra.org>
 <20210310034813.GM6042@bubble.grove.modra.org>
 <3c92968f-7c61-8d36-4001-91f8630de4b1@linux.ibm.com>
 <20210310050722.GN6042@bubble.grove.modra.org>
 <5aa60950-d93c-f700-3b0b-a01f947e8a22@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5aa60950-d93c-f700-3b0b-a01f947e8a22@linux.ibm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: alexey@au1.ibm.com, linuxppc-dev@lists.ozlabs.org, ellerman@au1.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 10, 2021 at 08:33:37PM +1100, Alexey Kardashevskiy wrote:
> One more question - the older version had a construct "DEFINED (.TOC.) ?
> .TOC. : ..." in case .TOC. is not defined (too old ld? too old gcc?) but the
> newer patch seems assuming it is always defined, when was it added? I have
> the same check in SLOF, for example, do I still need it?

.TOC. symbol support was first added 2012-11-06, so you need
binutils-2.24 or later to use .TOC. as a symbol.

-- 
Alan Modra
Australia Development Lab, IBM
