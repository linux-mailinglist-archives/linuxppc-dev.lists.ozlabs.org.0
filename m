Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E0F41A439
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Sep 2021 02:28:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HJL380WQ5z2ymb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Sep 2021 10:28:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=V2LwPj5O;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435;
 helo=mail-pf1-x435.google.com; envelope-from=carlojpisani@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=V2LwPj5O; dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HJL2T75D4z2yLZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Sep 2021 10:28:16 +1000 (AEST)
Received: by mail-pf1-x435.google.com with SMTP id w19so17377181pfn.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Sep 2021 17:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o+O2oP5PBbznVkw0kl68S5JiNk8ZSLPfew9HvyuC3qQ=;
 b=V2LwPj5OjmEykE/J8mpGwB3g6M8zqXcDWBz8WFdrLoO8byKAaHYH3fMOwLkhxiXRJG
 RO3dF8L90Gf6EBILqHOO+rCFlKMfa0cgUI0yzZ3QU/JaCZ9Atlf3b74N/mugYxy1x5nc
 u8X368N0dlzYThZhclBdU9RVZ2XHzNC+yjVS6GnjJngBcFhKuzkItoCt7CaTqi2+RPvX
 T0UmPsdQzo6Lk6D2aOslQjBcNEtfKlGf1e6y7W6CxlBM2ioyJStlkCnWCqH/ObOAkI3E
 DkocQVeJ95OAdSrnOqEKaKTuoxHy1FVBiXb1KYndV6mScg8YyhiSi0KZ6uk9OHBtucr+
 t9Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o+O2oP5PBbznVkw0kl68S5JiNk8ZSLPfew9HvyuC3qQ=;
 b=ggiW9+ltlj/ts+pFDdnPPknzV8KVgOwiTOaHa5wYgRNnlCI15mvxIWA3+4LPqMk3Pb
 mxLfunvvY70W3E3zgnWgxKAFNQriRiAhkksbf7N5zpRTlrVzV5ioiFdA28kr+m3P5xSL
 3mF+rOR0/k+Jc6QiBy3lVvPYe6D95UP9BdYGqAxbYcnrZ3CAmf7dPhuJxP1jCjEe3xke
 f6LreyFAFcPTC0Oq0dgWY+gOp52dxzgjoeqnHS2TugdXRE2NCCR+QQlTrgkiGJva+q1n
 Ona9Vcx9kj5h3pKj9sq4zyGTNbh0I0LAjnJz2aY7m5MaIwAbA16JuCYNayO/E/6GSe86
 Ekbg==
X-Gm-Message-State: AOAM5305dGFunIejNWBkPGPbRsugXbTukafYLI4vPd4EURg7vMegEi1S
 03jE2sd0vQQlZt6xZOOLKrDnNEsB5dwKj5K4C9E=
X-Google-Smtp-Source: ABdhPJxSCcDudnZ/+5WIuzEmPKPUoKlC6lTU3Z+rEE6Rm37qyw+RQ8l7Bf18BVazv/iZ8xQ108XU36x/dOmuDRAjb2o=
X-Received: by 2002:a05:6a00:78d:b0:447:3496:a301 with SMTP id
 g13-20020a056a00078d00b004473496a301mr2795810pfu.68.1632788893309; Mon, 27
 Sep 2021 17:28:13 -0700 (PDT)
MIME-Version: 1.0
References: <e2b142ad4a44535d5aa81b0c00c5f05f312f9097.1632738876.git.christophe.leroy@csgroup.eu>
 <87mtnx1rhr.fsf@mpe.ellerman.id.au>
In-Reply-To: <87mtnx1rhr.fsf@mpe.ellerman.id.au>
From: cp <carlojpisani@gmail.com>
Date: Tue, 28 Sep 2021 02:28:02 +0200
Message-ID: <CA+QBN9Bci34_t5wKqEMck29MGM6fti=hMQ0w2zt9AEaCS0f7yg@mail.gmail.com>
Subject: Re: [PATCH] powerpc/40x: Map 32Mbytes of memory at startup
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> I guess we're not expecting systems with less than 32MB, so making it
> unconditional is OK?

hi
it's not 32MB of total physical ram, but rather using 32MB of the
total physical ram to correctly boot a kernel bigger than 8MB.

The problem is complex:
- u-boot loads things at 0x0200.0000 (in my case)
- then cuboot copies the kernel to 0x0090.0000, and appends the flat
device tree to the end of kernel
- then cuboot copies again the kernel to 0x0000.0000, and invokes head.S

at this point head.S needs to initialize the virtual memory, and needs
to have 32MB mapped in order to correctly gets the flat device tree

if the kernel is smaller than 8MB, then cuboot copies it to
0x0080.0000, and head.S only need to have 16MB mapped in order to gets
the flat device tree

Cheers
