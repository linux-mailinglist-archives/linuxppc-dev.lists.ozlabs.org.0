Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22AE849677C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 22:42:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JgXsW6qxsz3cJl
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jan 2022 08:42:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=J8dzxpak;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=J8dzxpak;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=rfontana@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=J8dzxpak; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=J8dzxpak; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JgS8k252Gz2yg5
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jan 2022 05:10:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642788606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rqh1++d+JY4BasdGg/7RHLKqtDDn+ODlJo6mE4WZL2o=;
 b=J8dzxpak8tVna2XhOunhEShqBvQLxpf075uUER+GUOH1IgLc3Huh5BtCSeOuLGUJ1w5KX2
 mCMuk824y1KL7XPZabXncVymcujGFSQB1qFbRp1LsLlK9k8vd5bwU3oPdRD9HLBREBAgGY
 00pNEPB+A6n4Ye4Iu3lOZra9Izhta+Y=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642788606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rqh1++d+JY4BasdGg/7RHLKqtDDn+ODlJo6mE4WZL2o=;
 b=J8dzxpak8tVna2XhOunhEShqBvQLxpf075uUER+GUOH1IgLc3Huh5BtCSeOuLGUJ1w5KX2
 mCMuk824y1KL7XPZabXncVymcujGFSQB1qFbRp1LsLlK9k8vd5bwU3oPdRD9HLBREBAgGY
 00pNEPB+A6n4Ye4Iu3lOZra9Izhta+Y=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-38-kx0bW69zNgGgfp1IGn3Fbw-1; Fri, 21 Jan 2022 13:10:03 -0500
X-MC-Unique: kx0bW69zNgGgfp1IGn3Fbw-1
Received: by mail-ua1-f71.google.com with SMTP id
 v10-20020ab036ca000000b003068cf1e17bso6052441uau.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jan 2022 10:10:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rqh1++d+JY4BasdGg/7RHLKqtDDn+ODlJo6mE4WZL2o=;
 b=2ZMfTUctjmECm1/erqqpyWic+MG6Neui1QD4woFQYJQQf/jkGy5np4dVsRHQY0D3Bt
 2C7NyIGrUOV0F8T7IsxuMZSrk980Fu1aIe/bIoT613GkSr5ElijSDvNAtKSmVymwyfo2
 nWeOJ4GYlfzLtHHDjh7qbXLS3hzyYgU84P7y4x+VXVPv2cpTizvwX0bmx7LFCtOb8m28
 VAjiFlZWwu4EW5QRO/lpupVlyelZN7gYcAsIremYaYb4DfJYK0stcv4MZih77MdTC1Y8
 RtRTwtwOgdFHL7lt3je+GgHhuzqr7R6BZioqgIrctNLCAMtQgK/V5XYWeLGhOk/xC3He
 +rgQ==
X-Gm-Message-State: AOAM532t0+rJFT927SOLrgi+Xb2K41ZtPxBAeqTSsYiJIpuyn0xefDZy
 zL7nUEm9Ii9JSfx0HJetKkGnsiJa3eR62f+fL97d6FU+7ZH0hQH6dSrgDKcS7Lk3w4CtTVd3+tF
 IuGRoRtmrvxION7u4uVO9DzNlDdcHn/eV5iBtFtuZcw==
X-Received: by 2002:a67:c911:: with SMTP id w17mr2052003vsk.23.1642788602589; 
 Fri, 21 Jan 2022 10:10:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzIcdTU8wiDW6QlfD7iXb6wp73IfAqgwR1iqWVlTAgtLeEudcV3iLG/Aae+NYvTZGwrcZ+6r/lnRcWIx3JHH+o=
X-Received: by 2002:a67:c911:: with SMTP id w17mr2051986vsk.23.1642788602329; 
 Fri, 21 Jan 2022 10:10:02 -0800 (PST)
MIME-Version: 1.0
References: <d2c52284244d6dcb3472d2041abe43b456d116df.1642762977.git.christophe.leroy@csgroup.eu>
In-Reply-To: <d2c52284244d6dcb3472d2041abe43b456d116df.1642762977.git.christophe.leroy@csgroup.eu>
From: Richard Fontana <rfontana@redhat.com>
Date: Fri, 21 Jan 2022 13:09:51 -0500
Message-ID: <CAC1cPGwb9eM=0VWiZx+G909Jt7a7=yx1CnVJ=kaFJfn4qxNWPw@mail.gmail.com>
Subject: Re: [PATCH v3] powerpc: Add missing SPDX license identifiers
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rfontana@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 22 Jan 2022 08:40:28 +1100
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 "linux-spdx@vger.kernel.org" <linux-spdx@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jan 21, 2022 at 6:03 AM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> Several files are missing SPDX license identifiers.
>
> Following files are given the following SPDX identifier based on the comments in the top of the file:
>
>         include/asm/epapr_hcalls.h:/* SPDX-License-Identifier: GPL-2.0+ OR BSD */
>         include/asm/fsl_hcalls.h:/* SPDX-License-Identifier: GPL-2.0+ OR BSD */

"BSD" is not a defined SPDX identifier. I believe what you want here
is "BSD-3-Clause" (see: https://spdx.org/licenses/BSD-3-Clause.html)

Richard

