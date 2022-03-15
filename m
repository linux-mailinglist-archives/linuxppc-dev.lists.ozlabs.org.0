Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AF71B4DA463
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Mar 2022 22:12:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KJ5j04N7tz3bTB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Mar 2022 08:12:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ccua9gHU;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ccua9gHU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.129.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=jpoimboe@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=ccua9gHU; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=ccua9gHU; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KJ5hF22w8z2xDD
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Mar 2022 08:12:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647378727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eAf5AEBeFqncM2mZPk7z8DJiDJfh3mMRBEhEpcF9DSI=;
 b=ccua9gHUibTG8i0wIwyncYTsAaeyhC3N5P1eUR3qPaBmQ7TSbDF/kkjnb9xrqQvdtlsCmm
 iTKeAvLtCybiedE50GvB6fLgWiQJN5pfwEfAjXv9FAeQdRm9GyfnBEdcR4dAG/PM/gLXHY
 cezw89lNtfsGNyeejaUoqVK9z4xJtsg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647378727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eAf5AEBeFqncM2mZPk7z8DJiDJfh3mMRBEhEpcF9DSI=;
 b=ccua9gHUibTG8i0wIwyncYTsAaeyhC3N5P1eUR3qPaBmQ7TSbDF/kkjnb9xrqQvdtlsCmm
 iTKeAvLtCybiedE50GvB6fLgWiQJN5pfwEfAjXv9FAeQdRm9GyfnBEdcR4dAG/PM/gLXHY
 cezw89lNtfsGNyeejaUoqVK9z4xJtsg=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-75-8KVkEcATO9qRLAWlXFoedQ-1; Tue, 15 Mar 2022 17:12:02 -0400
X-MC-Unique: 8KVkEcATO9qRLAWlXFoedQ-1
Received: by mail-qv1-f71.google.com with SMTP id
 33-20020a0c8024000000b0043d17ffb0bdso384479qva.18
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Mar 2022 14:12:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eAf5AEBeFqncM2mZPk7z8DJiDJfh3mMRBEhEpcF9DSI=;
 b=QocYqVGHg8VCo2LqHiaKIOMxXR/DpQkNcSwkZ8SAFfME3bBDUIlyBqBLfsmePGkROd
 tC8jXeJxyhDXpWJZ66q5GwWFnnAuRVyb7WYchsOHscki0f2/vDg9gSOGzC0NsUPFK4a4
 N0WnkFytx7WZIBpANPxn2Q5FPHrI2ORGEpwG9eGsnQXsWN+njYYrJwZzM2SLmn13pcqe
 O0VRR4mD6JVWpPwx4FalWh4lVN8BRj1y7++y1d6b9PFVTtHoQKbqHRU+ZQCLxSCWsotD
 H1cPjEB250Oa1NDVZ4VKdlsbFUmU/+NiuN4Oy+Ntt1YTiIs3yF3exYxLPWs/pBIF59Ec
 jyZQ==
X-Gm-Message-State: AOAM532SiL/oKhGm70B7dVpHLcYfq7oiezxwWtaw/UP/d0J3GYOdttnY
 gtQPogZQOZGhW38U2YtFm+aoJOEhF67xyJ1mJyLoDlOkthvCcbvGGfQvQh4+OuKaK11ou1B4mMV
 fYPBFz7rkDzWWh48W/lPGtDDQIw==
X-Received: by 2002:ac8:7f86:0:b0:2e1:b6b3:2ca4 with SMTP id
 z6-20020ac87f86000000b002e1b6b32ca4mr20712869qtj.127.1647378722279; 
 Tue, 15 Mar 2022 14:12:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3tiPn9/YdA516P6OSNiW8pKYq75gkw7DPVujILQFkg1ot6rPcBGlIsHytrLXTxkev21udzg==
X-Received: by 2002:ac8:7f86:0:b0:2e1:b6b3:2ca4 with SMTP id
 z6-20020ac87f86000000b002e1b6b32ca4mr20712854qtj.127.1647378722001; 
 Tue, 15 Mar 2022 14:12:02 -0700 (PDT)
Received: from treble ([2600:1700:6e32:6c00::48])
 by smtp.gmail.com with ESMTPSA id
 z6-20020ae9c106000000b0067d3b9ef387sm18807qki.28.2022.03.15.14.12.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 14:12:01 -0700 (PDT)
Date: Tue, 15 Mar 2022 14:11:58 -0700
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] static_call: Don't make __static_call_return0 static
Message-ID: <20220315211158.kymtyh2nv4xj7ite@treble>
References: <b301796066e4fdd45c50c9e202d36a43688eb78e.1647242388.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
In-Reply-To: <b301796066e4fdd45c50c9e202d36a43688eb78e.1647242388.git.christophe.leroy@csgroup.eu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jpoimboe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Cc: Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Jason Baron <jbaron@akamai.com>, linuxppc-dev@lists.ozlabs.org,
 Ard Biesheuvel <ardb@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 14, 2022 at 08:21:30AM +0100, Christophe Leroy wrote:
> System.map shows that vmlinux contains several instances of
> __static_call_return0():
> 
> 	c0004fc0 t __static_call_return0
> 	c0011518 t __static_call_return0
> 	c00d8160 t __static_call_return0
> 
> arch_static_call_transform() uses the middle one to check whether we are
> setting a call to __static_call_return0 or not:
> 
> 	c0011520 <arch_static_call_transform>:
> 	c0011520:       3d 20 c0 01     lis     r9,-16383	<== r9 =  0xc001 << 16
> 	c0011524:       39 29 15 18     addi    r9,r9,5400	<== r9 += 0x1518
> 	c0011528:       7c 05 48 00     cmpw    r5,r9		<== r9 has value 0xc0011518 here
> 
> So if static_call_update() is called with one of the other instances of
> __static_call_return0(), arch_static_call_transform() won't recognise it.
> 
> In order to work properly, global single instance of __static_call_return0() is required.
> 
> Fixes: 3f2a8fc4b15d ("static_call/x86: Add __static_call_return0()")
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Acked-by: Josh Poimboeuf <jpoimboe@redhat.com>

-- 
Josh

