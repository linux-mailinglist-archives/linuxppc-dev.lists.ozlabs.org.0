Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E92418B11
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Sep 2021 22:50:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HHdFR33vsz3002
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Sep 2021 06:50:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=YNUKZmOz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::533;
 helo=mail-pg1-x533.google.com; envelope-from=rientjes@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=YNUKZmOz; dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HHdDl5VB6z2xtM
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Sep 2021 06:49:41 +1000 (AEST)
Received: by mail-pg1-x533.google.com with SMTP id x191so8861057pgd.9
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Sep 2021 13:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :mime-version; bh=1Xi2zI3xz++jAU4KL461gSjO8O02r5P5HLSbGNQJnPI=;
 b=YNUKZmOzFiHeJ2mJa7gvVYN7uN2TvfskQSN1D5sRVykhEQSaJ9ruR/0/YcZL/v6m+1
 ej1FfHbYG0ay7WCE+E3fA04decWx+gxNMJh/2AfKb1EJT5DQhro8je6KQpQGeHKkDbsI
 2Vo6bqf1guqWezlCcy2Pu6ROHYsiuxXT4kAlFIb+PM88X+oLVX6srxEMUnpVmYtptPL8
 WAOiHaRdS1eZovd/jq4qVEL92/LIrjngBpm8KGcaYFTn8I1F9IQaKEEHQjkczzN5zKka
 GwufIKM8VX78GbMlNVMgRK/KoB016OeVF3XuaLuGYvlJ152+ArnP4IkuG15uKtU0UehI
 POCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:mime-version;
 bh=1Xi2zI3xz++jAU4KL461gSjO8O02r5P5HLSbGNQJnPI=;
 b=xtRdPGM2P7znXZ6Pi+T68JT47C79jkn/2+35TokOhHKU0xCGZ8VloRl8qkUvzvltyZ
 Rc1UGGUaJJBXT+nI6Bc2QfSzQ2LAdPp8PQS1lm2jJYRftKRSWdySq6g6UFva2k7obr05
 krxIXB9YyK/Mr21RzPPqhR9Yzyzk8cWOqokiR03a/KqEgjgxpxCLSaBymVY4mhzyyt/L
 wV2LhbtSWgUIsDoNd+aqLhUE5mop9+1hX+sWMvh5n4Vchwy+dBPZv0oSF0GHq+hTzT+K
 YDSRVYRM10yELEBCSjaIJu+naza0bP6j/qBsBsfdf/PyUaNYG+qU1eJPuyFAFJRLg8io
 P4yQ==
X-Gm-Message-State: AOAM531QRP3G1S7b8czbDEWmIIKadREdmOMg0ZyHF1S5xsUKQ7+8/n4T
 ytRbYc/pMs82vqgA30RCfG1BzA==
X-Google-Smtp-Source: ABdhPJzndYH2uLj5kPrP3Kat7T50/IOEb8DNH7IWYo8ePwhsiil1vOxBGyaBm89cXY3NegHO0nVNfg==
X-Received: by 2002:a63:4457:: with SMTP id t23mr583580pgk.354.1632689377421; 
 Sun, 26 Sep 2021 13:49:37 -0700 (PDT)
Received: from [2620:15c:17:3:4d45:c2:971a:f134]
 ([2620:15c:17:3:4d45:c2:971a:f134])
 by smtp.gmail.com with ESMTPSA id q13sm6606060pfk.128.2021.09.26.13.49.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 13:49:36 -0700 (PDT)
Date: Sun, 26 Sep 2021 13:49:35 -0700 (PDT)
From: David Rientjes <rientjes@google.com>
To: Stephen Kitt <steve@sk2.org>
Subject: Re: [PATCH] mm: Remove HARDENED_USERCOPY_FALLBACK
In-Reply-To: <20210921061149.1091163-1-steve@sk2.org>
Message-ID: <d2dc495-98c8-9a5c-823f-bb1cd55a8d4@google.com>
References: <20210921061149.1091163-1-steve@sk2.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Kees Cook <keescook@chromium.org>, James Morris <jmorris@namei.org>,
 linux-kernel@vger.kernel.org, Pekka Enberg <penberg@kernel.org>,
 linux-mm@kvack.org, linux-security-module@vger.kernel.org,
 linux-hardening@vger.kernel.org, Christoph Lameter <cl@linux.com>,
 linuxppc-dev@lists.ozlabs.org, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 Vlastimil Babka <vbabka@suse.cz>, "Serge E . Hallyn" <serge@hallyn.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 21 Sep 2021, Stephen Kitt wrote:

> This has served its purpose and is no longer used. All usercopy
> violations appear to have been handled by now, any remaining
> instances (or new bugs) will cause copies to be rejected.
> 
> This isn't a direct revert of commit 2d891fbc3bb6 ("usercopy: Allow
> strict enforcement of whitelists"); since usercopy_fallback is
> effectively 0, the fallback handling is removed too.
> 
> This also removes the usercopy_fallback module parameter on
> slab_common.
> 
> Link: https://github.com/KSPP/linux/issues/153
> Signed-off-by: Stephen Kitt <steve@sk2.org>
> Suggested-by: Kees Cook <keescook@chromium.org>

Acked-by: David Rientjes <rientjes@google.com>
