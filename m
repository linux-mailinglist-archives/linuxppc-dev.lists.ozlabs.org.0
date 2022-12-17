Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D953064F6B3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Dec 2022 02:12:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NYnxf54F5z3cHs
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Dec 2022 12:12:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=rammhold-de.20210112.gappssmtp.com header.i=@rammhold-de.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=OTXV3ptG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rammhold.de (client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com; envelope-from=andreas@rammhold.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rammhold-de.20210112.gappssmtp.com header.i=@rammhold-de.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=OTXV3ptG;
	dkim-atps=neutral
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NYnHR3Y2yz2yRV
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Dec 2022 11:42:24 +1100 (AEDT)
Received: by mail-ed1-x52d.google.com with SMTP id v8so5874000edi.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Dec 2022 16:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rammhold-de.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:references:in-reply-to:subject:mime-version:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=1QFKv2TWTiAAUJtUNn93KfAKVJcdR7iRnXXIRoZLyMw=;
        b=OTXV3ptGWNYqx2UGC2rImTpDTUqU+wDZrKWBdy/UNAoeJvPRPrVSz1tG1jGOl8Ce3e
         s6M+0zp3iE/xPvJ46gLuHDMM+X+dYn3oSIIkuoF8AqAxuwdnMf3jhdxb358LL+YJDcfS
         dZ7iY559N/VzN10NYUT2zpg7KukATI1WYLCO3n8YoWy1L2Vv1QLCrv12PzmH3hpdw7+S
         rHWJyzzNPFxdyh5dz4Jy/tuCgfdBOqEUZVKTu3jNQXrzZT20P3EidtaaPA+3wqG2iGvD
         h5s1tkyGIxQOWmtZwzxznuihpx9A3d7YWy8DoYbCcGpmaMmXppEFilwGAndn5ZPfW9CD
         gezQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:references:in-reply-to:subject:mime-version:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1QFKv2TWTiAAUJtUNn93KfAKVJcdR7iRnXXIRoZLyMw=;
        b=W8QzAoQkUSkmJCTHG9AVkoSnvvRZLdA+OcU6TBNizemgsZnBFYFdtXXTKPivXU7jv9
         Ifq7RxWLUHeIftEvJ0A7XjkQpY+Jy9frpUAR3lwKrhzxVg+vSa47PyKw6IKPGZ1zSgPz
         XRAkHU9Cw2uO4w0nGTs4t58ylm4UJDZiYz4UF2q+p4AX7UUzXsU2qt7bGzBq1qrOC2oF
         r7NCFkFivOlXlGc8oIq8yRsCQV5CvsxfRD/wDbty/gMGl2cSVcJsLw6tbkVWf5umtfd+
         qWu8tH9+Yzt53G7JbYrzF1gd1a13RqH5eNMEMGmfWZuxNrbH6QuMR0zRe5ko2lpadgY6
         gj2Q==
X-Gm-Message-State: AFqh2kry9podWJ/zhYaKa/7EMOn2Dko6UbmVGquYvE3Koi9hK6laaGW1
	8EQeP+vfytNKOtsymJXosJQCRA==
X-Google-Smtp-Source: AMrXdXuEXjxQv82egRwfXB6YAxYwW32Z33izAMO7cRGkThTOjWfh0A7Qji8VV9ypvbxJ6Vi/3fflkA==
X-Received: by 2002:a50:ed81:0:b0:477:ff25:867a with SMTP id h1-20020a50ed81000000b00477ff25867amr97915edr.12.1671237736873;
        Fri, 16 Dec 2022 16:42:16 -0800 (PST)
Received: from localhost ([2a00:e67:3f2:a:8c01:9c4e:459b:314f])
        by smtp.gmail.com with ESMTPSA id j9-20020a1709066dc900b007ad84cf1346sm1379556ejt.110.2022.12.16.16.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 16:42:15 -0800 (PST)
From: Andreas Rammhold <andreas@rammhold.de>
To: Rob Herring <robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [PATCH v4] of/fdt: Rework early_init_dt_scan_memory() to call
 directly
In-Reply-To: <20211215150102.1303588-1-robh@kernel.org>
References: <20211215150102.1303588-1-robh@kernel.org>
Date: Sat, 17 Dec 2022 01:42:14 +0100
Message-ID: <87bko2x3mh.fsf@rammhold.de>
X-Mailman-Approved-At: Sat, 17 Dec 2022 12:10:59 +1100
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
Cc: devicetree@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Frank Rowand <frowand.list@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>, John Crispin <john@phrozen.org>, linuxppc-dev@lists.ozlabs.org, Frank Rowand <frank.rowand@sony.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Hi,

I've just debugged an issue that I traced down to this commit.

My mt7621 based board relies on the soc_info.mem_detect function for
memblock init which is never being called again with this patch being
applied.

The code in the original patch as well was on 6.0 doesn't allow any of
the other (fallback?) memory initialization code to run as
early_init_dt_scan_memory() always returns 0.

Was this an oversight in the implementation or are some follow-up
patches missing? Perhaps the code just has to return a different
value when it has found some blocks of memory that should be used?


Andi
