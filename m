Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8923914C46B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 02:31:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 486mD62sw1zDqMx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 12:31:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 486mBB0j4gzDqHF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 12:29:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=T2NCO5HQ; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 486mB86cDJz8sWP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 12:29:52 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 486mB85wGpz9sRR; Wed, 29 Jan 2020 12:29:52 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=T2NCO5HQ; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 486mB84BPrz9sNF
 for <linuxppc-dev@ozlabs.org>; Wed, 29 Jan 2020 12:29:52 +1100 (AEDT)
Received: by mail-pj1-x1041.google.com with SMTP id n96so1856394pjc.3
 for <linuxppc-dev@ozlabs.org>; Tue, 28 Jan 2020 17:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=6lJu1VFYQqWY0P/da0Qh4nG3YiU8vjaE6otsfdNV0Vw=;
 b=T2NCO5HQ27AQZGzWU1/pVHybJIAgtgk3BfLtngGHwdBoWLbfy1wgb9+XmrgbvEmCRi
 iXnCro6f2dt5W8PmrtCg/qLpROPkxqsyKUQXnubld2CV6sHgn7at8lDxnd5WhbLffh7r
 Pr5nVKt6CYgXXkqzgwUtAxR6dgUwHe+MEnZyM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=6lJu1VFYQqWY0P/da0Qh4nG3YiU8vjaE6otsfdNV0Vw=;
 b=KQPCioHmdEtIvPXXjgk8HsE79uRGwZ7NHejYWxywZwXd2+zmqs9oJirw/1BS9iQv95
 /tkztclfpymKGy+nvESMvS8mYr5GcoW1sXALECsZYKyph7qioHXIZw7/lxMWFAVvcCMm
 lZSVe258Fxyi+Ehz1DVtSE0FFwU7JsTFLTylencV0ZKR2PkL9tkCOjTqtuYURA3j2jk3
 9RuvujTtWmsZGWUGhIRTA4qE2N72aQK+Ky43r6qCVrt6z2etLVCeT5ZYolHk7bJzzyZ8
 K8On/HrBwmkLkTPq71rpzasoOu15gImTMxyDzgiUlL7N2Z9vrX+L1TAoqGEjZBJPJqHI
 UhgQ==
X-Gm-Message-State: APjAAAXNjk8WRySz3uBJQ8RwS1Zd695pGhpILcThZCtxqh1rl3946q42
 qFZIODhJEB27rT2Glk5xEF76Ww==
X-Google-Smtp-Source: APXvYqzZ1h1PquH1V6BzAbS5XHeWCS3SoOOekqnHpGswy42MXnWToM+9ZQu7JWZmGVHp/RTENAFKuw==
X-Received: by 2002:a17:902:ab82:: with SMTP id
 f2mr26783461plr.36.1580261389643; 
 Tue, 28 Jan 2020 17:29:49 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-c168-88f8-9a7c-29c1.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:c168:88f8:9a7c:29c1])
 by smtp.gmail.com with ESMTPSA id gx2sm157852pjb.18.2020.01.28.17.29.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2020 17:29:48 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: Joel Stanley <joel@jms.id.au>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 07/10] powerpc/configs/skiroot: Enable security features
In-Reply-To: <CACPK8XeXNb_9ftjtTKG2i6DbyFwWFAT4bPhQ0+6eR8i-1a5JrQ@mail.gmail.com>
References: <20200121043000.16212-1-mpe@ellerman.id.au>
 <20200121043000.16212-7-mpe@ellerman.id.au>
 <CACPK8XeXNb_9ftjtTKG2i6DbyFwWFAT4bPhQ0+6eR8i-1a5JrQ@mail.gmail.com>
Date: Wed, 29 Jan 2020 12:29:45 +1100
Message-ID: <877e1bjbhy.fsf@dja-thinkpad.axtens.net>
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
Cc: linuxppc-dev <linuxppc-dev@ozlabs.org>,
 Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Joel Stanley <joel@jms.id.au> writes:

> On Tue, 21 Jan 2020 at 04:30, Michael Ellerman <mpe@ellerman.id.au> wrote:
>>
>> From: Joel Stanley <joel@jms.id.au>
>>
>> This turns on HARDENED_USERCOPY with HARDENED_USERCOPY_PAGESPAN, and
>> FORTIFY_SOURCE.
>>
>> It also enables SECURITY_LOCKDOWN_LSM with _EARLY and
>> LOCK_DOWN_KERNEL_FORCE_INTEGRITY options enabled. This still allows
>> xmon to be used in read-only mode.
>>
>> MODULE_SIG is selected by lockdown, so it is still enabled.
>>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>> [mpe: Switch to lockdown integrity mode per oohal]
>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>
> I did some testing and with change we break kexec. As it's critical
> for this kernel to be able to kexec we need to set KEXEC_FILE=y if
> we're setting FORCE_INTEGRITY=y.
>
> I've tested your series with that modification made and userspace was
> once again able to kexec (with -s).

Has the changes that enable this landed in kexec-lite and petitboot yet?
I had to manually patch them when I was experimenting with it
recently...

Regards,
Daniel

>
> Cheers,
>
> Joel
>
>> ---
>>  arch/powerpc/configs/skiroot_defconfig | 11 ++++++++++-
>>  1 file changed, 10 insertions(+), 1 deletion(-)
>>
>> v2: Switch to lockdown integrity mode rather than confidentiality as noticed by
>> dja and discussed with jms and oohal.
>>
>> diff --git a/arch/powerpc/configs/skiroot_defconfig b/arch/powerpc/configs/skiroot_defconfig
>> index 24a210fe0049..93b478436a2b 100644
>> --- a/arch/powerpc/configs/skiroot_defconfig
>> +++ b/arch/powerpc/configs/skiroot_defconfig
>> @@ -49,7 +49,6 @@ CONFIG_JUMP_LABEL=y
>>  CONFIG_STRICT_KERNEL_RWX=y
>>  CONFIG_MODULES=y
>>  CONFIG_MODULE_UNLOAD=y
>> -CONFIG_MODULE_SIG=y
>>  CONFIG_MODULE_SIG_FORCE=y
>>  CONFIG_MODULE_SIG_SHA512=y
>>  CONFIG_PARTITION_ADVANCED=y
>> @@ -272,6 +271,16 @@ CONFIG_NLS_ASCII=y
>>  CONFIG_NLS_ISO8859_1=y
>>  CONFIG_NLS_UTF8=y
>>  CONFIG_ENCRYPTED_KEYS=y
>> +CONFIG_SECURITY=y
>> +CONFIG_HARDENED_USERCOPY=y
>> +# CONFIG_HARDENED_USERCOPY_FALLBACK is not set
>> +CONFIG_HARDENED_USERCOPY_PAGESPAN=y
>> +CONFIG_FORTIFY_SOURCE=y
>> +CONFIG_SECURITY_LOCKDOWN_LSM=y
>> +CONFIG_SECURITY_LOCKDOWN_LSM_EARLY=y
>> +CONFIG_LOCK_DOWN_KERNEL_FORCE_INTEGRITY=y
>> +# CONFIG_INTEGRITY is not set
>> +CONFIG_LSM="yama,loadpin,safesetid,integrity"
>>  # CONFIG_CRYPTO_HW is not set
>>  CONFIG_CRC16=y
>>  CONFIG_CRC_ITU_T=y
>> --
>> 2.21.1
>>
