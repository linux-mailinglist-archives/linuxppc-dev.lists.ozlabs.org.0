Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A301E3A5EF3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Jun 2021 11:13:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3Qj036Fnz3023
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Jun 2021 19:13:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WJ3tpnBE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::329;
 helo=mail-wm1-x329.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=WJ3tpnBE; dkim-atps=neutral
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3QhT6CmNz2xv8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Jun 2021 19:12:39 +1000 (AEST)
Received: by mail-wm1-x329.google.com with SMTP id
 3-20020a05600c0243b029019f2f9b2b8aso12337580wmj.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Jun 2021 02:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=rE75OEJmRkiphAQgbNylsb5lS5RCqZ1mYOeIVhrqISM=;
 b=WJ3tpnBEfeWF0/kH/8/+lrientdHvkK3PS68x9IVO1JQSI80J/yHCOlh0IsPbvC/8I
 H0oKk58f/d6u3mGdZ2I/4JFU3VQ2jKNlcURVirhImT8qQwO27j7UMg7n5cRpDhbFAsyQ
 WBz2vIXdJr/L4A2hYljUyPHoDdib7yk46Od391zO0go6EhSbJu3Y6C4IzuOvABo9TAbI
 /83Z3taXs2o1IXw819dLQ/mlByGgjGKTGFkeSdOU3y2TKYg9IZzZCsM1JN/W82BQ1B1f
 6OiNDqPfBkF6xDlf64u8nG44qMNItoXaIvR5myFDxxc3/D1ojcgDLFi3DMjLazEXA89W
 1llg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=rE75OEJmRkiphAQgbNylsb5lS5RCqZ1mYOeIVhrqISM=;
 b=Myztj5ksxUmu2kcdtwFq1TZgq/m5/4G/AyWk/CJFCt7WFgPabNJBcBVtQpkpoGzKew
 9bXZHmirVxNaF0gOMcNTrsKTxGYnY4mtbnLt1ODuAhbQXN3wb2I/U6kS5SgiT1d6MSEm
 f7wAZlqj5IJeNYDGieWZ2XeGHOFyuex27XdROtUONPYlXOGsbh+a8h4ndee2VQTLB5wv
 /r+b2XvwdpMfLNijtjFD1r6RbDnZwCCXgOIf7reJTj0spxZvQaUlcqMnOTXSsSix8J41
 DIpQeScqh4Y0CZosfkViGFWtzP9m+uA2Q/2T+52CowGhXDvIoF6fOYb0sWLvb42UU/Nc
 sN/A==
X-Gm-Message-State: AOAM5328+6Vj1S8weWaynB5QHtNQfIBLWXIMDbWyTLFHWYUUSjF/PbsE
 LN/1DnJu5ag0qg4jHrFUyTpOdw==
X-Google-Smtp-Source: ABdhPJxMA2/SLYA8c9iSQV5GCW8IQfyxI5XFtS2VihpYEMDIJhKH2AYMV290kDl3xx9dJ+TgccNGSg==
X-Received: by 2002:a1c:dcc3:: with SMTP id t186mr15902760wmg.23.1623661951291; 
 Mon, 14 Jun 2021 02:12:31 -0700 (PDT)
Received: from dell ([91.110.221.200])
 by smtp.gmail.com with ESMTPSA id k16sm12442514wmr.42.2021.06.14.02.12.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 02:12:30 -0700 (PDT)
Date: Mon, 14 Jun 2021 10:12:28 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 00/21] Rid W=1 warnings from IDE
Message-ID: <20210614091228.GB5285@dell>
References: <20210602101722.2276638-1-lee.jones@linaro.org>
 <YL3YMGl9kmtv55B/@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YL3YMGl9kmtv55B/@infradead.org>
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
Cc: linux-ide@vger.kernel.org, Mike Waychison <crlf@sun.com>,
 Paul Mackerras <paulus@samba.org>,
 "Christopher J. Reimer" <reimer@doe.carleton.ca>, Tim Hockin <thockin@sun.com>,
 Erik Andersen <andersee@debian.org>, Alan Cox <alan@lxorguk.ukuu.org.uk>,
 CJ <cjtsai@ali.com.tw>, Sergei Shtylyov <sshtylyov@ru.mvista.com>,
 Duncan Laurie <void@sun.com>, Scott Snyder <snyder@fnald0.fnal.gov>,
 Gadi Oxman <gadio@netvision.net.il>, Andre Hedrick <andre@linux-ide.org>,
 Christian Brunner <chb@muc.de>, Jens Axboe <axboe@suse.de>,
 or <source@mvista.com>, Benoit Poulot-Cazajous <poulot@chorus.fr>,
 Robert Bringman <rob@mars.trion.com>, linux-kernel@vger.kernel.org,
 Clear Zhang <Clear.Zhang@ali.com.tw>, Mark Lord <mlord@pobox.com>,
 Adrian Sun <a.sun@sun.com>, Frank Tiernan <frankt@promise.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 07 Jun 2021, Christoph Hellwig wrote:

> Please don't touch this code as it is about to be removed entirely.

Do you have an ETA for this work?

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
