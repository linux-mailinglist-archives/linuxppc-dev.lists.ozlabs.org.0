Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F91A50FA3B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Apr 2022 12:22:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KndH53Lv5z3bqC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Apr 2022 20:22:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=landley-net.20210112.gappssmtp.com header.i=@landley-net.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=xZxVRlug;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=landley.net
 (client-ip=2001:4860:4864:20::33; helo=mail-oa1-x33.google.com;
 envelope-from=rob@landley.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=landley-net.20210112.gappssmtp.com
 header.i=@landley-net.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=xZxVRlug; dkim-atps=neutral
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KndGL6Nchz2yKQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Apr 2022 20:21:44 +1000 (AEST)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-e67799d278so15092574fac.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Apr 2022 03:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=landley-net.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:from
 :subject; bh=swUPsKc/pwqBDO9lDmxtWnVm5IJoOS2AI+Dr5ugvfoQ=;
 b=xZxVRlugQnJS/osrae6IJEbCY6kVm0Dle+i2o60lGmQM9C248dQr5ySqJt6wcoA/k8
 FSr0f0wrFYh3W3lFrqxrsh5VRVphNoxNX7ToC8EdNRYze+wjon/ZLKEg85bjEnhuSZza
 XRCvvfXF0x3UX/Wtc5QRX7rWzue/KVtm4WnnP49c/lhPKOrcnn8fk8t9GKyNS/9rl/hn
 vtDmqfT1lyykc2QtBbvppyu2bWooIb2UC93vDSS5SeSDgZIym94SYCmvtlerS6wadIsY
 400PTE0KwOtvVL1TslYr3eLFJ+Vp8ImEc647zHBrfTNQwIe6OImtd5FKnrvwuua0Dukq
 MRAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:from:subject;
 bh=swUPsKc/pwqBDO9lDmxtWnVm5IJoOS2AI+Dr5ugvfoQ=;
 b=fGquPUTe/0Ajr23goU61i6gl4EmKkqKZ7ORgbTq02k1NXyQ9jMm0y2Fwgp/5B1D7FV
 H/Ome8ktPIZ9RvFbGNCSWrKECaDUUK0krQBXT8+mCEuO98ehhEqMjjL4Hr3fCFW6HuYl
 lMEGMBDTp7MRjJom+kO59rTrsc0w5r+jJJEzIUPrGWolAZsQkvGH9ZTHFtzm5k2V79Yp
 P1WXdEkGgSt+k21/M3iUmsJzxoByuKnFzt8mV7bLYVBrKNfH3i2jfaRItzS6mBXRZFsC
 Y8BR+ibHYwtmjex0TE8c7C9mXoILYNzZ8sVU5YBekEWwB13TFDFYbN2Ab3QT17AJCYcJ
 vCsQ==
X-Gm-Message-State: AOAM530ecyjLlNL0LWwoZHFmUnMD0QkiZO0k15TvfRS1gm+tGq5xX7T0
 jyFcUwCoxhwPze2sNWidfFf8tlnq8JeDsw==
X-Google-Smtp-Source: ABdhPJw+4NZIiEWnkZ+KtePGzuhq48vLdqaX0dxUmsn1Ie4jSfOPBRRXZq10Aq0gh9SH4V7hFHBt5w==
X-Received: by 2002:a05:6870:568b:b0:e6:77a4:a9ec with SMTP id
 p11-20020a056870568b00b000e677a4a9ecmr10289378oao.229.1650968499292; 
 Tue, 26 Apr 2022 03:21:39 -0700 (PDT)
Received: from ?IPV6:2607:fb90:e61d:17a9:e0cb:10ff:fe07:aadd?
 ([2607:fb90:e61d:17a9:e0cb:10ff:fe07:aadd])
 by smtp.gmail.com with ESMTPSA id
 j5-20020a4a7505000000b0033a47bb6a74sm5406454ooc.47.2022.04.26.03.21.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 03:21:38 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------3RrziJahsD2N8UeCJzJKwSHw"
Message-ID: <74b9755a-4b5d-56b1-86f5-0c5c7688845a@landley.net>
Date: Tue, 26 Apr 2022 05:26:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-US
To: QEMU Developers <qemu-devel@nongnu.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
From: Rob Landley <rob@landley.net>
Subject: serial hang in qemu-system-ppc64 -M pseries
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------3RrziJahsD2N8UeCJzJKwSHw
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

When I cut and paste 80-ish characters of text into the Linux serial console, it
reads 16 characters and stops. When I hit space, it reads another 16 characters,
and if I keep at it will eventually catch up without losing data. If I type,
every character shows up immediately.

(On other qemu targets and kernels I can cut and paste an entire uuencoded
binary and it goes through just fine in one go, but this target hangs with big
pastes until I hit keys.)

Is this a qemu-side bug, or a kernel-side bug?

Kernel config attached (linux 5.18-rc3 or thereabouts), qemu invocation is:

qemu-system-ppc64 -M pseries -vga none -nographic -no-reboot -m 256 -kernel
vmlinux -initrd powerpc64leroot.cpio.gz -append "panic=1 HOST=powerpc64le
console=hvc0"

Rob
--------------3RrziJahsD2N8UeCJzJKwSHw
Content-Type: application/gzip; name="linux-fullconfig.gz"
Content-Disposition: attachment; filename="linux-fullconfig.gz"
Content-Transfer-Encoding: base64

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

--------------3RrziJahsD2N8UeCJzJKwSHw--
