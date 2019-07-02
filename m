Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B84255C97A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2019 08:44:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dF8N3xQLzDqLB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2019 16:44:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="ixay1ENs"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dF5h3q63zDqTM
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2019 16:42:00 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id w10so7181341pgj.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Jul 2019 23:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:subject:in-reply-to:references:date:message-id:mime-version;
 bh=VllA444fA+IMTOuucX0RWTw5+Gd3nGtcoSafDpytoc8=;
 b=ixay1ENsQxIz8b0Oqnw81FNr/mBW8ls/RfjpJoWFgstLlXRZGtYYGNInYX2lPNyjXQ
 JNNrb1H1NNx1K50VYxs63NkFtQoHIOQ+yweyq1kY2xGbyrVDMSZkhvMGhiihhD5Csg3I
 2z4DCqbQ01W8cevyO77KWcD7qvLrovmOx5ryo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=VllA444fA+IMTOuucX0RWTw5+Gd3nGtcoSafDpytoc8=;
 b=Glu8xELmwTAltxhzEsE/QzRv6M67SUmVyGf+UVJMN9+kzwa3Unpt8l8u0YevssQYvr
 y1mi6dc/56eMn5ra3CUxsnKg51D5PNdZhKlAG3vOmoG84Qo16FfJEJBx9mFCGZpm97I4
 wB3ghvHjttCTaL+f1Z3dGxz1AXn5g45ILe37yVT3SjsEIdfiaQHLA19qmyDepKaOwGmJ
 CwS6y6HRHwbCbV4o5OGIycIcnqr75AwJadOkpfNibIgaQr2GdIGySpUnHSQCmwbL/TOs
 31eH42kNHpa0lDW1iwfqabPvphGmCfz+fdn9Jdz7WXEq7LFAsfmRV+DLmiNdZbN9o46h
 qL/w==
X-Gm-Message-State: APjAAAXmRb2XqLDra+9uyv03dc22jvvx+ChC6+GLe4/UmVM8/Ay3rwvF
 7YYcOPKqDbUI2NVtZXkxPYzB+2bd
X-Google-Smtp-Source: APXvYqwUhLUpC8CLW3ASNixgpGs2Rb8E8RuLEcsPVv73a8JFhN25W2KAm9jzo0ESfdbj5yX1QNPFpg==
X-Received: by 2002:a17:90a:cb8e:: with SMTP id
 a14mr3711041pju.124.1562049717197; 
 Mon, 01 Jul 2019 23:41:57 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id f186sm13074359pfb.5.2019.07.01.23.41.55
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 01 Jul 2019 23:41:56 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/configs: Disable /dev/port in skiroot defconfig
In-Reply-To: <87r27escsi.fsf@concordia.ellerman.id.au>
References: <20190627053008.29315-1-dja@axtens.net>
 <87r27escsi.fsf@concordia.ellerman.id.au>
Date: Tue, 02 Jul 2019 16:41:51 +1000
Message-ID: <87y31h0wgg.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
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

Michael Ellerman <mpe@ellerman.id.au> writes:

> Daniel Axtens <dja@axtens.net> writes:
>> While reviewing lockdown patches, I discovered that we still enable
>> /dev/port (CONFIG_DEVPORT) in skiroot.
>>
>> We don't need it. Deselect CONFIG_DEVPORT for skiroot.
>
> Why don't we need it? :)

I should have explained this better :)

/dev/port is used for old x86 style IO accesses.

It's set up in drivers/char/mem.c, and is only created if
arch_has_dev_port() returns true. Per arch/powerpc/include/asm/io.h, on
PPC64 with PCI, this is only true if there's a legacy ISA bridge.

Even if a system has a legacy ISA bridge installed, we have no business
accessing it in skiroot.

Regards,
Daniel
>
> cheers
>
>> diff --git a/arch/powerpc/configs/skiroot_defconfig b/arch/powerpc/configs/skiroot_defconfig
>> index 5ba131c30f6b..b2e8f37156eb 100644
>> --- a/arch/powerpc/configs/skiroot_defconfig
>> +++ b/arch/powerpc/configs/skiroot_defconfig
>> @@ -212,6 +212,7 @@ CONFIG_IPMI_WATCHDOG=y
>>  CONFIG_HW_RANDOM=y
>>  CONFIG_TCG_TPM=y
>>  CONFIG_TCG_TIS_I2C_NUVOTON=y
>> +# CONFIG_DEVPORT is not set
>>  CONFIG_I2C=y
>>  # CONFIG_I2C_COMPAT is not set
>>  CONFIG_I2C_CHARDEV=y
>> -- 
>> 2.20.1
