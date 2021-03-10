Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A190A3334B5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 06:07:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DwKpF4K6dz3d9K
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 16:07:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=jLVKplXc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e;
 helo=mail-pf1-x42e.google.com; envelope-from=amodra@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=jLVKplXc; dkim-atps=neutral
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DwKns3bcLz3cKQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Mar 2021 16:07:29 +1100 (AEDT)
Received: by mail-pf1-x42e.google.com with SMTP id q204so11134362pfq.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Mar 2021 21:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=rXx5g+GDYePC+AM0lg3Ovb3zdgXaFFKbHFAzwfAO66s=;
 b=jLVKplXcqWXh+BS4x2qCgjxaMcXZUnpD8YDYPLxOx49a64i+yqI2qOcLEpaxrCMsNI
 dDMvI901byMGEFxe7IQUxTIPP8wdf0j+twbm88nZeO4ihG430UHDu04oV8Fcl635bCtX
 cChWbOefFtYFTwG+EwdgyuD0VgES27zarlhy5xo5dySEvXfC23F1YTeZYUjnVRPIssf+
 30eBj7XE6GgFkMe0b460vKrftD8ZeIGl2b/omdz4CfagFjDMUQ9bu1t2C4AISe0n8DTg
 r5nIHSzFhDWT0Ed/ZuFFkUUMR+RpmWkfqmo9ZimSgjgJk4NDIOd6BPJcBrHA+calYmxf
 +/Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=rXx5g+GDYePC+AM0lg3Ovb3zdgXaFFKbHFAzwfAO66s=;
 b=jUWM+mgy4b6do9C2vTzGJ83QZucd3wiw4kNvyHX3dXzvFDYd14FfwYIf3NJUHi6eBN
 79GlvwV6WITG4vWN3UFRCKNqZqCaD3MW2YDCTQVUIc100k/Sp5paFWAxNO4Y8KZsUKaY
 7Fqb4uA+WbOlrD5f0WlFVs2px788bMohzoewfcZsj0Ncknnsf79V9nCr2hqqn523FHab
 OfKXTGFVg+J2nZNNfBjW9bi5E/ETVma1Kgb/Vx/Qn9zW5J+GHzfrLVhQSb7VXLJMxvTw
 KFe5pR3xD4+x1hKCH/h/Z7FNrc3a55fDjoUBeGFEW4BFbyX8n+tjvl/aHq1OdNWqiH1C
 wAJg==
X-Gm-Message-State: AOAM5304ZNaWQV1V2eBpjzcuVOeS9vDdfwn235XlEC+rky/5TrAQ1zhx
 YqKpB6wXuSNWYu27QmNBoM4=
X-Google-Smtp-Source: ABdhPJyEA+v3X/TM+GuWBCgd8JtnnmHo5Q7h3dVW81ywxul0bMjs0qf71szL542nfbUV2hoRzDIbKQ==
X-Received: by 2002:a65:5bca:: with SMTP id o10mr1322710pgr.248.1615352847200; 
 Tue, 09 Mar 2021 21:07:27 -0800 (PST)
Received: from bubble.grove.modra.org
 ([2406:3400:51d:8cc0:782f:891e:65a1:90c6])
 by smtp.gmail.com with ESMTPSA id w18sm4410740pjh.19.2021.03.09.21.07.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 21:07:26 -0800 (PST)
Received: by bubble.grove.modra.org (Postfix, from userid 1000)
 id C44C9412D9; Wed, 10 Mar 2021 15:37:22 +1030 (ACDT)
Date: Wed, 10 Mar 2021 15:37:22 +1030
From: Alan Modra <amodra@gmail.com>
To: Alexey Kardashevskiy <aik@linux.ibm.com>
Subject: Re: PowerPC64 future proof kernel toc, revised for lld
Message-ID: <20210310050722.GN6042@bubble.grove.modra.org>
References: <20210309045638.GI6042@bubble.grove.modra.org>
 <20210310034813.GM6042@bubble.grove.modra.org>
 <3c92968f-7c61-8d36-4001-91f8630de4b1@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c92968f-7c61-8d36-4001-91f8630de4b1@linux.ibm.com>
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

On Wed, Mar 10, 2021 at 03:44:44PM +1100, Alexey Kardashevskiy wrote:
> For my own education, is .got for prom_init.o still generated by ld or gcc?

.got is generated by ld.

> In other words, should "objdump -D -s -j .got" ever dump .got for any .o
> file, like below?

No.  "objdump -r prom_init.o | grep GOT" will tell you whether
prom_init.o *may* cause ld to generate .got entries.  (Linker
optimisations or --gc-sections might remove the need for those .got
entries.)

> objdump: section '.got' mentioned in a -j option, but not found in any input
> file

Right, expected.

-- 
Alan Modra
Australia Development Lab, IBM
