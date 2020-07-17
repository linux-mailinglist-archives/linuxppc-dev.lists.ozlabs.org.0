Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 521AE223334
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 07:59:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B7L7B4C54zDrMK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 15:59:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B7L5L3Rd4zDrKj
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jul 2020 15:58:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=qu8JISPQ; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4B7L5K53lBz8tD8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jul 2020 15:58:13 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4B7L5K3gqyz9sRW; Fri, 17 Jul 2020 15:58:13 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2a00:1450:4864:20::441;
 helo=mail-wr1-x441.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=qu8JISPQ; dkim-atps=neutral
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4B7L5K2rRvz9sRR
 for <linuxppc-dev@ozlabs.org>; Fri, 17 Jul 2020 15:58:13 +1000 (AEST)
Received: by mail-wr1-x441.google.com with SMTP id j4so9698009wrp.10
 for <linuxppc-dev@ozlabs.org>; Thu, 16 Jul 2020 22:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version:content-transfer-encoding;
 bh=y+sfitwB9RQXaHMyhrlOuoxQi7jIpz91CNFJlZFY97c=;
 b=qu8JISPQkUB+/IPHcl7tm++fpzdju53pbghz0M3vQRg3INR1HbX2hwy6yUQtMYS64+
 Q1kS18Kh+E0JPqarrQf9TgLpRss2QNRjGGdLKafs4z0MQ0aQsYMUIc+T6GJQcoecm++G
 1VIo7+n5BELKEg6j1MrNrovTgKRBY4PLAUr8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=y+sfitwB9RQXaHMyhrlOuoxQi7jIpz91CNFJlZFY97c=;
 b=cfIDkzX/gVveLu2gvpsN/tirNVrcNfhCBFVPgJ8B7uPjV7Nm9ORte4ulMwi6RyUIfq
 MLi4z4iBfA0Ez2uSz9qFEJevY76YJ9RazTnvqZqG7xvq2Kuy4Hj1jPBD+Vpeq7s4tqo0
 b5V/ZfNfAnS8MDpQ315JIhwLf7MSVNwAbddq4WxZklJAn8UY6JXLn9h4jZTdAU6fAJQn
 9rGwFSWulw8NC9TMc1+et3scVcQQVFNpQbgF/miTh2QX7E78aR497sPZZhvLIameW1zB
 2/vB2MrCyROyUsPekpFCOeowISCLH4eWlwhZpQvYFSL11tCulCbQat1tP5wQNYsttSFw
 ZAmQ==
X-Gm-Message-State: AOAM530IF7RNvcwHCrB43U6i+gIdzqpuopM/fLNYHyQ/eLyEVrnD2THh
 iLKCrInlPAqIIgfTXsHKCp431g==
X-Google-Smtp-Source: ABdhPJy+tMl3Mc4bvC023mYG8ty1ClwLPLvia450TWxXXjtuL1Pi3mo4227XLeRNv+QHyYzCwL72eA==
X-Received: by 2002:adf:ef8a:: with SMTP id d10mr8433221wro.126.1594965487346; 
 Thu, 16 Jul 2020 22:58:07 -0700 (PDT)
Received: from localhost
 (2001-44b8-111e-5c00-d401-59e4-6cf2-294a.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:d401:59e4:6cf2:294a])
 by smtp.gmail.com with ESMTPSA id j4sm13167679wrp.51.2020.07.16.22.58.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 22:58:06 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>, Nayna Jain
 <nayna@linux.ibm.com>
Subject: Re: [PATCH v3] powerpc/pseries: detect secure and trusted boot state
 of the system.
In-Reply-To: <20200716081337.GB32107@kitsune.suse.cz>
References: <1594813921-12425-1-git-send-email-nayna@linux.ibm.com>
 <20200716081337.GB32107@kitsune.suse.cz>
Date: Fri, 17 Jul 2020 15:58:01 +1000
Message-ID: <87pn8uu1hy.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linuxppc-dev@ozlabs.org, linux-kernel@vger.kernel.org,
 Mimi Zohar <zohar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michal Such=C3=A1nek <msuchanek@suse.de> writes:

> On Wed, Jul 15, 2020 at 07:52:01AM -0400, Nayna Jain wrote:
>> The device-tree property to check secure and trusted boot state is
>> different for guests(pseries) compared to baremetal(powernv).
>>=20
>> This patch updates the existing is_ppc_secureboot_enabled() and
>> is_ppc_trustedboot_enabled() functions to add support for pseries.
>>=20
>> The secureboot and trustedboot state are exposed via device-tree propert=
y:
>> /proc/device-tree/ibm,secure-boot and /proc/device-tree/ibm,trusted-boot
>>=20
>> The values of ibm,secure-boot under pseries are interpreted as:
>                                       ^^^
>>=20
>> 0 - Disabled
>> 1 - Enabled in Log-only mode. This patch interprets this value as
>> disabled, since audit mode is currently not supported for Linux.
>> 2 - Enabled and enforced.
>> 3-9 - Enabled and enforcing; requirements are at the discretion of the
>> operating system.
>>=20
>> The values of ibm,trusted-boot under pseries are interpreted as:
>                                        ^^^
> These two should be different I suppose?

I'm not quite sure what you mean? They'll be documented in a future
revision of the PAPR, once I get my act together and submit the
relevant internal paperwork.

Daniel
>
> Thanks
>
> Michal
>> 0 - Disabled
>> 1 - Enabled
>>=20
>> Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
>> Reviewed-by: Daniel Axtens <dja@axtens.net>
>> ---
>> v3:
>> * fixed double check. Thanks Daniel for noticing it.
>> * updated patch description.
>>=20
>> v2:
>> * included Michael Ellerman's feedback.
>> * added Daniel Axtens's Reviewed-by.
>>=20
>>  arch/powerpc/kernel/secure_boot.c | 19 +++++++++++++++++--
>>  1 file changed, 17 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/arch/powerpc/kernel/secure_boot.c b/arch/powerpc/kernel/sec=
ure_boot.c
>> index 4b982324d368..118bcb5f79c4 100644
>> --- a/arch/powerpc/kernel/secure_boot.c
>> +++ b/arch/powerpc/kernel/secure_boot.c
>> @@ -6,6 +6,7 @@
>>  #include <linux/types.h>
>>  #include <linux/of.h>
>>  #include <asm/secure_boot.h>
>> +#include <asm/machdep.h>
>>=20=20
>>  static struct device_node *get_ppc_fw_sb_node(void)
>>  {
>> @@ -23,12 +24,19 @@ bool is_ppc_secureboot_enabled(void)
>>  {
>>  	struct device_node *node;
>>  	bool enabled =3D false;
>> +	u32 secureboot;
>>=20=20
>>  	node =3D get_ppc_fw_sb_node();
>>  	enabled =3D of_property_read_bool(node, "os-secureboot-enforcing");
>> -
>>  	of_node_put(node);
>>=20=20
>> +	if (enabled)
>> +		goto out;
>> +
>> +	if (!of_property_read_u32(of_root, "ibm,secure-boot", &secureboot))
>> +		enabled =3D (secureboot > 1);
>> +
>> +out:
>>  	pr_info("Secure boot mode %s\n", enabled ? "enabled" : "disabled");
>>=20=20
>>  	return enabled;
>> @@ -38,12 +46,19 @@ bool is_ppc_trustedboot_enabled(void)
>>  {
>>  	struct device_node *node;
>>  	bool enabled =3D false;
>> +	u32 trustedboot;
>>=20=20
>>  	node =3D get_ppc_fw_sb_node();
>>  	enabled =3D of_property_read_bool(node, "trusted-enabled");
>> -
>>  	of_node_put(node);
>>=20=20
>> +	if (enabled)
>> +		goto out;
>> +
>> +	if (!of_property_read_u32(of_root, "ibm,trusted-boot", &trustedboot))
>> +		enabled =3D (trustedboot > 0);
>> +
>> +out:
>>  	pr_info("Trusted boot mode %s\n", enabled ? "enabled" : "disabled");
>>=20=20
>>  	return enabled;
>> --=20
>> 2.26.2
>>=20
