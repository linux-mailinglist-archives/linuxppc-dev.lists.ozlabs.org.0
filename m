Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5483E22B0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Aug 2021 06:40:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ggt8L3jf6z3dCF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Aug 2021 14:40:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=ScQMvNjf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2e;
 helo=mail-yb1-xb2e.google.com; envelope-from=saravanak@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=ScQMvNjf; dkim-atps=neutral
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ggt7s3C0xz2yyv
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Aug 2021 14:40:24 +1000 (AEST)
Received: by mail-yb1-xb2e.google.com with SMTP id c137so12622389ybf.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Aug 2021 21:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H2ihiTBstu/ghfSxcs1f2+pQV6+vs2bf3Mboq2+GrYs=;
 b=ScQMvNjfYNJSGtjPrCNoRPznDc6d5pMej9Fqm+KRBn8h9amXskzkNXOuipENioI1rq
 /xS8PGVN/aV9AZYVzrwF27cERRrgSF5TDEoeBdgol4/o9JK7Dw5/t6S9KTwF8X/U3wmR
 EoVxxBkvxoJyneBURRl7jbEhutyp0m1JlD6MqZvB4GBDtaQHuf4tcHqUMCG9jdVd5jPx
 wR0HvMaoLS/KFeeOV5MMJm+xwN0TvzgrTtTgMy2Bb1UuH6kDiNbb4crnBddJSO7GTpGL
 w+YGSP7iSbTd2olgPr2U/2PrGSXPdrrBdbnJYtL4j7yISkbn+Xyx6nOirFw7evWXBqtc
 xyvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H2ihiTBstu/ghfSxcs1f2+pQV6+vs2bf3Mboq2+GrYs=;
 b=hZyZ0T4CAs7UcV+BvO8ioBS0Qfo2t9OCo0FHR1XPE3XQKAz+pMHFfmEOO8m2YpBHLg
 WhnB2QC3h4JalPcoNtv4zwUVU0JEGBt+fBIh/hwH1L8b7aJj3BJIFeracWBNKLz0VMeV
 q/h/7lL4wIXdrvJYJ10qf5dTmcnMQHPXcJvbXoMS1WYyKQyYWN0YBm4n+Our6jVNG5CC
 ml9N4RNdpxveavlzzsAnUNtdSXgdHK0ylIFwsgH7Rd8lKBp6QdcBLXzOlxU34BOA/FOM
 DCM9rB5t3eunbWd0E1wpKCPzUjDHbl2rt1lvjqTulW5MEYn54P3GwDipGd3B68/6MyTS
 tz9w==
X-Gm-Message-State: AOAM5325PwHKobfyUSazyoY4rMIVNX86G+6/ydsJg2j4IxZF6XO7W4OP
 WB8FuMeMZ3MvZ1UwhlQcYwEY4G+moYDGHZq5GatW8w==
X-Google-Smtp-Source: ABdhPJwwfzkphKrpb1Q7KfPDzSz4SSbIQ8eSjOWjUnLgCAhafTdZDlZKO6z/PKhjmUf+ShlBNIq223ptUqDafbp7E/Q=
X-Received: by 2002:a25:53c9:: with SMTP id h192mr9792706ybb.310.1628224819006; 
 Thu, 05 Aug 2021 21:40:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210803113538.560277-1-fido_max@inbox.ru>
 <CAGETcx8QC+AMXvmk4RB=LGp00QLVVX4uCeeruAjFnGq_irMh4Q@mail.gmail.com>
 <dff603dc-9038-71cb-bfcb-5abc24f17109@inbox.ru>
In-Reply-To: <dff603dc-9038-71cb-bfcb-5abc24f17109@inbox.ru>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 5 Aug 2021 21:39:42 -0700
Message-ID: <CAGETcx-evuv-A+A5v3-ubFZNvn_i+QSvg+tSW0OOgAd82-pytg@mail.gmail.com>
Subject: Re: [PATCH v4] soc: fsl: qe: convert QE interrupt controller to
 platform_device
To: Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="UTF-8"
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
Cc: kernel test robot <lkp@intel.com>, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, leoyang.li@nxp.com,
 Dan Carpenter <dan.carpenter@oracle.com>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, qiang.zhao@nxp.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 5, 2021 at 9:35 PM Maxim Kochetkov <fido_max@inbox.ru> wrote:
>
> 03.08.2021 20:51, Saravana Kannan wrote:
> >> So lets convert this driver to simple platform_device with probe().
> >> Also use platform_get_ and devm_ family function to get/allocate
> >> resources and drop unused .compatible = "qeic".
> > Yes, please!
>
> Should I totally drop { .type = "qeic"}, or keep?

Sorry for the confusion. My "Yes, please"!" was a show of support for
switching this to a proper platform driver. Not a response to that
specific question.

I didn't look at the code/DT close enough to know/care about the "type" part.

-Saravana
