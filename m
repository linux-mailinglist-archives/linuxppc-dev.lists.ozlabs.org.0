Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7376505F8A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Apr 2022 00:00:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kj18C1w9Sz3bVN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Apr 2022 08:00:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=LTURonE5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=LTURonE5; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kj17c1qJTz2x9B
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Apr 2022 07:59:53 +1000 (AEST)
Received: by mail-pj1-x102d.google.com with SMTP id
 s14-20020a17090a880e00b001caaf6d3dd1so483873pjn.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Apr 2022 14:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=cLLWAAHArn9WgPwOUwNflPPJDgjsRY1O3bHGAhIDsQw=;
 b=LTURonE53ti9q/GT1aK7iRoPMpGAeCy1e4EeYMoQ5ND31pPzYRrBIuxOtS32aAiFM+
 1XHlY0ymuxtf7KP5zzxh8j9ip4/ZkYqKkInt8TY5JnA0taa6ag1p6HhrtkPYOmL/X1BS
 68H/ZEsyd88OXRqhJx4ed+KaxwMRzhvwF+Q30=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cLLWAAHArn9WgPwOUwNflPPJDgjsRY1O3bHGAhIDsQw=;
 b=YyvW/YttGlC5HmsSAN6d2hBk5tJNS4lUV1aNK3+FsMV1sFns1KWOG2DhLADy1jS6n5
 rHEY8QBKtDB4d3Q0yXCgJOCzQtmnIc3A8l0OZEjhhpa+7/uUFa7r2E/82bE3VViCk5Jq
 XEVrfeDe7mEVksbNN4xtExacXGmgZrAQ8EMwRFl9E5vIBwvFoMZoMcZS71EsjRbL7ChP
 eqTOFTLVRYDuIcencu3O8/Fm8wojcVHX3wtkQ5JEqttS45qLbHrM0o4H2OnfHBNMTrCL
 5FmCiEkiY/SIUefEZHtaFuiLZBcLqjJSBagAUZ7XLRfhiwnDvtkVp5JBIow/WUm53N5J
 Imtg==
X-Gm-Message-State: AOAM530oXk9qcCOIsdovNMeGPUZt9jblZY/dNdAKYIaOQRAC4QjGRTt4
 UX3R97eJspiwrkb9LmOkaUv6eQ==
X-Google-Smtp-Source: ABdhPJysM2kkydsu6S512r9sNHn81bBvZQZwemOKp8WmD7sADc0kfHvR6/TUHLqhcn1MQ99fL/O1Og==
X-Received: by 2002:a17:902:6bc2:b0:158:a26b:5884 with SMTP id
 m2-20020a1709026bc200b00158a26b5884mr12917161plt.38.1650319190427; 
 Mon, 18 Apr 2022 14:59:50 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 z15-20020a056a001d8f00b004fda37855ddsm12953099pfw.168.2022.04.18.14.59.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 14:59:50 -0700 (PDT)
Date: Mon, 18 Apr 2022 14:59:49 -0700
From: Kees Cook <keescook@chromium.org>
To: He Zhe <zhe.he@windriver.com>
Subject: Re: [PATCH RFC 2/8] arm64: stacktrace: Add arch_within_stack_frames
Message-ID: <202204181457.9DE190CE@keescook>
References: <20220418132217.1573072-1-zhe.he@windriver.com>
 <20220418132217.1573072-3-zhe.he@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220418132217.1573072-3-zhe.he@windriver.com>
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
Cc: mark.rutland@arm.com, linux-s390@vger.kernel.org, x86@kernel.org,
 hpa@zytor.com, alexander.shishkin@linux.intel.com, catalin.marinas@arm.com,
 dave.hansen@linux.intel.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, bp@alien8.de,
 svens@linux.ibm.com, jolsa@kernel.org, namhyung@kernel.org, tglx@linutronix.de,
 borntraeger@linux.ibm.com, will@kernel.org, linux-riscv@lists.infradead.org,
 paulus@samba.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 18, 2022 at 09:22:11PM +0800, He Zhe wrote:
> This function checks if the given address range crosses frame boundary.
> It is based on the existing x86 algorithm, but implemented via stacktrace.
> This can be tested by USERCOPY_STACK_FRAME_FROM and
> USERCOPY_STACK_FRAME_TO in lkdtm.

Hi,

Thanks for doing this implementation! One reason usercopy hardening
didn't persue doing a "full" stacktrace was because it seemed relatively
expensive. Did you do any usercopy-heavily workload testing to see if
there was a noticeable performance impact?

It would be nice to block the exposure of canaries and PAC bits, though,
so I'm not opposed, but I'd like to get a better sense of how "heavy"
this might be.

Thanks!

-Kees

-- 
Kees Cook
