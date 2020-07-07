Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5865E21642E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 04:55:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B16W32tKczDqkX
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 12:55:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B16TR42LTzDqYp
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jul 2020 12:54:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=HyYZhLAP; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4B16TR2xVdz8tBp
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jul 2020 12:54:03 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4B16TR2c1Yz9sRk; Tue,  7 Jul 2020 12:54:03 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=HyYZhLAP; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4B16TQ6jrGz9sRK
 for <linuxppc-dev@ozlabs.org>; Tue,  7 Jul 2020 12:54:02 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id k4so1967394pld.12
 for <linuxppc-dev@ozlabs.org>; Mon, 06 Jul 2020 19:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=uL+u54kAN0vdigP3z+4QjbZ4X6Oq7pDJNkdTZIlJYJ4=;
 b=HyYZhLAPV/GbIMvVEvXnaysuK+pvXqXZMlpg2LhQm2tg6Kff2t5NOAkAliIMIvSRSW
 ne3kFud0soOOpwu5sJDBx29IsRgeMZJ/+/TIk14hHTtB7klyayK6z6FJC7A72N1zWOGM
 Vm2mdyPUQeYLf8NMb1t1uNPx5Fd2k/gsmYQg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=uL+u54kAN0vdigP3z+4QjbZ4X6Oq7pDJNkdTZIlJYJ4=;
 b=htWcojkVOoLq3bKDa1eCae+r49v+kyTDiiZztPnAYcrWf/f6AL3+nrGJMoiQ3unPeM
 4cDtn/whKw10LhYx5iBAWzLbcrxRXbIVybuITlohYkxdThJ/hn/pMFwe2InF6dBun7vd
 5ZLlNkDnrGuZLjOE4hxNFfSholTl0fNYqTPis0xBPtuIkXTaPYCMPP0mV0MuUsMmKCUI
 pcPKij0h1kZ0qXnUrvXQtjJasC7JXk96MGOWjXHtvUnoZZEqk0y31kn/DIodwEpJLiPj
 unC9LKQMUMEt8zcfq1Vp8rrkoXS/s7iBiSxpBufd2eHOYylLtGCC/BtGfcqdZU1ZHlw4
 U57A==
X-Gm-Message-State: AOAM5330yxVrrv7p8cUUBV1skVa/QxUCm+ppKwjgiGfk10n6dQkGZHgK
 U2uI2x2cer+wcB5ZScmCGhVGRQ==
X-Google-Smtp-Source: ABdhPJydTedQP0WCMt9r+mt/YvU9qMMT2g6MeCJlK1HVDrQjvQTz9fcC4hWG4HDltBMzOluGZFi8Yg==
X-Received: by 2002:a17:902:c181:: with SMTP id
 d1mr41865027pld.176.1594090439689; 
 Mon, 06 Jul 2020 19:53:59 -0700 (PDT)
Received: from localhost
 (2001-44b8-1113-6700-4ddf-cfaf-3be5-4008.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:4ddf:cfaf:3be5:4008])
 by smtp.gmail.com with ESMTPSA id s36sm20319480pgl.35.2020.07.06.19.53.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2020 19:53:58 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Nayna Jain <nayna@linux.ibm.com>, linuxppc-dev@ozlabs.org
Subject: Re: [PATCH] powerpc/pseries: detect secure and trusted boot state of
 the system.
In-Reply-To: <87a70c3wpj.fsf@dja-thinkpad.axtens.net>
References: <1593882535-21368-1-git-send-email-nayna@linux.ibm.com>
 <87a70c3wpj.fsf@dja-thinkpad.axtens.net>
Date: Tue, 07 Jul 2020 12:53:56 +1000
Message-ID: <875zb03uij.fsf@dja-thinkpad.axtens.net>
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
Cc: Nayna Jain <nayna@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Mimi Zohar <zohar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As a final extra note,

  https://github.com/daxtens/qemu/tree/pseries-secboot

is a qemu repository that fakes out the relevant properties if anyone
else wants to test this.

Also,

>  3-9 - enabled, OS-defined behaviour. In this patch we map all these
>        values to enabled and enforcing. Again I think this is the
>        appropriate thing to do.

this should read "enabled and enforcing, requirements are at the
discretion of the operating system". Apologies.

Regards,
Daniel

> ibm,trusted-boot isn't published by a current PowerVM LPAR but will be
> published in future. (Currently, trusted boot state is inferred by the
> presence or absense of a vTPM.) It's simply 1 = enabled, 0 = disabled.
>
> As for this patch specifically, with the very small nits below,
>
> Reviewed-by: Daniel Axtens <dja@axtens.net>
>
>> -	node = get_ppc_fw_sb_node();
>> -	enabled = of_property_read_bool(node, "os-secureboot-enforcing");
>> +	if (machine_is(powernv)) {
>> +		node = get_ppc_fw_sb_node();
>> +		enabled =
>> +		    of_property_read_bool(node, "os-secureboot-enforcing");
>> +		of_node_put(node);
>> +	}
>>  
>> -	of_node_put(node);
>> +	if (machine_is(pseries)) {
> Maybe this should be an else if?
>
>> +		secureboot = of_get_property(of_root, "ibm,secure-boot", NULL);
>> +		if (secureboot)
>> +			enabled = (*secureboot > 1) ? true : false;
>> +	}
>>  
>>  	pr_info("Secure boot mode %s\n", enabled ? "enabled" : "disabled");
>>  
>> @@ -38,11 +48,20 @@ bool is_ppc_trustedboot_enabled(void)
>>  {
>>  	struct device_node *node;
>>  	bool enabled = false;
>> +	const u32 *trustedboot;
>>  
>> -	node = get_ppc_fw_sb_node();
>> -	enabled = of_property_read_bool(node, "trusted-enabled");
>> +	if (machine_is(powernv)) {
>> +		node = get_ppc_fw_sb_node();
>> +		enabled = of_property_read_bool(node, "trusted-enabled");
>> +		of_node_put(node);
>> +	}
>>  
>> -	of_node_put(node);
>> +	if (machine_is(pseries)) {
> Likewise.
>> +		trustedboot =
>> +		    of_get_property(of_root, "ibm,trusted-boot", NULL);
>> +		if (trustedboot)
>> +			enabled = (*trustedboot > 0) ? true : false;
>
> Regards,
> Daniel
