Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1DD845AD6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Feb 2024 16:04:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YxWq2WfD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TQhyg5l8wz3dKC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Feb 2024 02:04:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YxWq2WfD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=parri.andrea@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TQhxs0Wb5z3c7s
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Feb 2024 02:04:00 +1100 (AEDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-40fc352d2e2so1127785e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Feb 2024 07:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706799834; x=1707404634; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TQI82xkebwfzT3j+NbzdVCePUJoKXQTTgiIMRHd9tA0=;
        b=YxWq2WfDb8BlRyUh71JPJasq/ASU4lyxgRGt6Qehh3444gt90483tOPkf1DPKgCuh0
         TBRHwDMSXhbQBuCS496DvNLGtJn5yPpXn9qoEr73Ru2SaMDoMNGu7ns0zWz4ZPkT1W/j
         kjq7xS8bBs/I2dPXAJUXx7uAAMc7szBaeO//hUAQp+G3pTHYqEICVe/7aPhC6moRKvWV
         XgTINu+/FHM1yTEKR1PRbf8kRd6t6/KROHwVgNoUMbUOT+tGsyRURolLZVMlrnxKe1cd
         IBQ5CYv1lYy2bcKzbEOKmSyIQy8jOkxOmZ11So9KP73kYDVL3WDl9axLioLX/PyLeDXT
         3law==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706799834; x=1707404634;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TQI82xkebwfzT3j+NbzdVCePUJoKXQTTgiIMRHd9tA0=;
        b=SMkjG8iezBaTycd68DAoCDrWr5Un/6xkoFVBKRySOoc8tsg6uGPaO+LY8RqJ7OJ5LG
         OvJ8DouC/zNE9PDH8OIWOVAVWbhEx3HQeLoKq0Ly6EAjT5VDEPog4IGpsun6f1vR/SVg
         zcvyHuEzW9kB5dXDTcKYM4QdjkW9NkCOE3j93vLCvGtTVpaTs5bs3rYOVTq3zs/YPSBU
         oN1Xx4qlGfq7ECjCCjzI78K6opyc6tJq9xpBhFcAIBFBP2j86wJZdB+wIqJPQo8sN8bS
         B6f2+5I6QgRrJk4aEki6BOgU2ayV9KCevyHKdDKmWyqLWySOgaSahpt3fSUDS0Lijf7d
         e2IQ==
X-Gm-Message-State: AOJu0YwgZNbPGOPTfVLOMe5toMI4XZWBuiOGKi2f+n8fSfINRR7cFCd1
	5twTcgJv/VTvL7H8LBl18ZyCr5HC40agl5O84VAA3mJ/lFGze7tE
X-Google-Smtp-Source: AGHT+IHgq8VDz2gMVFec1rt9xa8alnLqg6m1IYYBrYWka6TlPpdIpPCK3IdQ6EOAmX4jWd4gg88q+A==
X-Received: by 2002:a05:600c:1c9b:b0:40e:f702:a304 with SMTP id k27-20020a05600c1c9b00b0040ef702a304mr3558063wms.32.1706799833416;
        Thu, 01 Feb 2024 07:03:53 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUDpgq0/uHUFP6DOMM/DOOgv6iaPTfvvlORJEtejjXG7NB3wNC7NPVgdP/a80SSBXcJjbaEEIyh+mqStaWE9ShiuHnhGiu0Ude3P4CSFQ3d+CGq9+DAjgcm1aQxefjN0mJjaRHu+d+pEnI81EDPulpbkTCKWAzVI1NQ2CjyFnruwvjT3XSCNT2xi8Rz/Pm9l+yrTYDvmZzT8WwkDZ4TJRCZL7qKJ7JE0w208ZTXS3EdwtHkyMVxRJFjaC6vmbIEV3KJHxW+9E8y6RugEGGGc+RAgrRS2/mcChzL72DvHvv09MdkNJ3SyGTtS/aWraB/umbXkoKBO3eu0iaPDyYl45cI7AIDf4cvnmpMVE36WXwBNDuS5C+dFi6826+JbRT5aVrMB/812NuBe36eW2blfMeKt3OBcyvpvyCF+9r1L742OlcdPyGlBCXjfCg1ZVYrnPqeTySi49U/aQRdxiXSjmMzo/VA+l2tLlv2iNnZdz/5YM0P8SL4ZrgKVPAT0fLShXJOKH7m6PpeKfu+0fpLDF8QTj1FESwPMhuWww/x2V1Ed9CIW4dUvtVF5d9pzMZaqIdpMFOCe6tTae1G15CtxUebt68+gSBiml4shJT3SMHsg1px/hmq3Vr8DBHs63fugiLnN0pAWPPBo3jKqA==
Received: from andrea ([31.189.34.185])
        by smtp.gmail.com with ESMTPSA id bk7-20020a0560001d8700b0033addbf2d2csm16043387wrb.9.2024.02.01.07.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 07:03:52 -0800 (PST)
Date: Thu, 1 Feb 2024 16:03:48 +0100
From: Andrea Parri <parri.andrea@gmail.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH RFC/RFT v2 4/4] riscv: Stop emitting preventive
 sfence.vma for new userspace mappings with Svvptc
Message-ID: <Zbuy1E7mz9Oui1Dl@andrea>
References: <20240131155929.169961-1-alexghiti@rivosinc.com>
 <20240131155929.169961-5-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240131155929.169961-5-alexghiti@rivosinc.com>
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
Cc: linux-riscv@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mm@kvack.org, Catalin Marinas <catalin.marinas@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Matt Evans <mev@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, Nicholas Piggin <npiggin@gmail.com>, Ved Shanbhogue <ved@rivosinc.com>, Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>, Dylan Jhong <dylan@andestech.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 31, 2024 at 04:59:29PM +0100, Alexandre Ghiti wrote:
> The preventive sfence.vma were emitted because new mappings must be made
> visible to the page table walker but Svvptc guarantees that xRET act as
> a fence, so no need to sfence.vma for the uarchs that implement this
> extension.

AFAIU, your first submission shows that you don't need that xRET property.
Similarly for other archs.  What was rationale behind this Svvptc change?


> This allows to drastically reduce the number of sfence.vma emitted:
> 
> * Ubuntu boot to login:
> Before: ~630k sfence.vma
> After:  ~200k sfence.vma
> 
> * ltp - mmapstress01
> Before: ~45k
> After:  ~6.3k
> 
> * lmbench - lat_pagefault
> Before: ~665k
> After:   832 (!)
> 
> * lmbench - lat_mmap
> Before: ~546k
> After:   718 (!)

This Svvptc seems to move/add the "burden" of the synchronization to xRET:
Perhaps integrate the above counts w/ the perf gains in the cover letter?

  Andrea
