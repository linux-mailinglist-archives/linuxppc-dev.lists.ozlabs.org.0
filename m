Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FEE1043B3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 19:53:03 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47JBf13x13zDqv3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Nov 2019 05:52:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="BCDJYM3f";
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47JBc62mT8zDqs1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Nov 2019 05:51:15 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id az9so174178plb.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 10:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mn+nCBQ8MjgT+fYEd4BfZVfrpR1Vy2KWBRbsCtWJECg=;
 b=BCDJYM3fK8xymWgfzI2Qds6ZpSjZqAQlDES//MqsDNY8WXRgBmOUZpFTAH9Md4r542
 LsmIYpY+/sDVEbSoqoninE1aCmWqcg5LO40xEtapuYot+yixhXxJzhEFSwSWKrzCynOI
 AVqG7XDEBLzLHS+GJOLPKetMcG0ympwwaM/Z4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mn+nCBQ8MjgT+fYEd4BfZVfrpR1Vy2KWBRbsCtWJECg=;
 b=KGI2o5I/QxxMSiBag+CgJ5bUI9d/LOsW7npk+NK68RmErwpsgerI7FqhTAzXmkNADy
 EurdZhO9TdGD7v1EwfbWNV+5oM16gGF/3okjs496V/L0b1g3hkry33wb+vgdiA3tsz9+
 jfVXGTjhLxp+sofEbZpJjqFgVAAStpTxBUqe0UvfM+GdCh0NlU0SnppfRrV9t/+JBmre
 IqyLuC0DMmHg3wY1tkX2VRS5uIO29AgZ8cg4wzSEbX/EYC+HKd6xzcaN7/hJWUw0cudn
 YPGw5I3KME1FteO4eCXRtkd/xva6NvxQv3NyX3OEIwwpwPmTQ81uO1deNFQ6dibANKln
 PZ3Q==
X-Gm-Message-State: APjAAAXKIQ4tL91bzCiVMbNjwxV3ZeQDbRsaFohGbuMWKM/arRNUWFWp
 a9SattBD+jGBbkMODY6YjdXpyw==
X-Google-Smtp-Source: APXvYqzFi23pyUkvMFe0Ie/Eu60vm+BM13HMViW37nMsXp1BESp6LP52/K0Kga/co6nHh+jfQ8PYqQ==
X-Received: by 2002:a17:902:7c04:: with SMTP id x4mr4547952pll.0.1574275872166; 
 Wed, 20 Nov 2019 10:51:12 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id t15sm31526082pgb.0.2019.11.20.10.51.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2019 10:51:11 -0800 (PST)
Date: Wed, 20 Nov 2019 10:51:10 -0800
From: Kees Cook <keescook@chromium.org>
To: Jason Yan <yanaijie@huawei.com>
Subject: Re: [PATCH 0/6] implement KASLR for powerpc/fsl_booke/64
Message-ID: <201911201050.9182A9DC@keescook>
References: <20191115093209.26434-1-yanaijie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191115093209.26434-1-yanaijie@huawei.com>
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
Cc: oss@buserror.net, kernel-hardening@lists.openwall.com,
 linux-kernel@vger.kernel.org, npiggin@gmail.com, diana.craciun@nxp.com,
 paulus@samba.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 15, 2019 at 05:32:03PM +0800, Jason Yan wrote:
> This is a try to implement KASLR for Freescale BookE64 which is based on
> my earlier implementation for Freescale BookE32:
> https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=131718

Whee! :) I've updated https://github.com/KSPP/linux/issues/3 with a link
to this current series.

-- 
Kees Cook
