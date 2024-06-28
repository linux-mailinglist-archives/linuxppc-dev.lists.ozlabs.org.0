Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCD291C1F3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2024 17:01:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=he214686 header.b=Efo/JhDi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W9dt81Bccz3clL
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jun 2024 01:01:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=he214686 header.b=Efo/JhDi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=leemhuis.info (client-ip=80.237.130.52; helo=wp530.webpack.hosteurope.de; envelope-from=regressions@leemhuis.info; receiver=lists.ozlabs.org)
Received: from wp530.webpack.hosteurope.de (unknown [80.237.130.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W9dsQ03Nmz3cVH
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jun 2024 01:00:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:Reply-To:MIME-Version:Date:
	Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=c7Mw7OUBjwuJgW7MMo0ZIBNrqurcj/pKhW/s7eLGHTw=;
	t=1719586827; x=1720018827; b=Efo/JhDitV6O8m01okgvRMY/HI6I/p5riEXNsJnnhIjNLV4
	4FVfAEjTvjQOmtAt1w/3FMwTospoHJddXE9WbXkvXG0bjPvVYy/iOerr7wE4w6RLs1Cp86DjyvQIX
	jZu3kNuXICDiWHGI+O0HAIZG5k7lbXO33uDabZX8MXLqhiZqsjZFRV2uJlTBsYMhQ7DIoJxe4i3sA
	/j27w7aJMXBeZNgYXdx+NkJvU8JJzXFEmPlG6R7jGzf77FrZl/IU0Awz7nZ8QqhbQSojdXlpO6+2I
	L5Ic22XtGeKHLuBtBJRracL9BnxjytkUwvxIDRgs8Hm4FYKVPSXhd7a7ytsPQvRA==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sND59-00082p-6W; Fri, 28 Jun 2024 17:00:11 +0200
Message-ID: <55e8331d-4682-40df-9a1b-8a08dc5f6409@leemhuis.info>
Date: Fri, 28 Jun 2024 17:00:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tpm: ibmvtpm: Call tpm2_sessions_init() to initialize
 session support
To: jarkko@kernel.org
References: <20240617193408.1234365-1-stefanb@linux.ibm.com>
 <9e167f3e-cd81-45ab-bd34-939f516b05a4@linux.ibm.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <9e167f3e-cd81-45ab-bd34-939f516b05a4@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1719586827;e51fa58c;
X-HE-SMSGID: 1sND59-00082p-6W
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Linux kernel regressions list <regressions@lists.linux.dev>, linux-kernel@vger.kernel.org, naveen.n.rao@linux.ibm.com, linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[CCing the regression list]

On 20.06.24 00:34, Stefan Berger wrote:
> Jarkko,
>   are you ok with this patch?

Hmmm, hope I did not miss anythng, but looks like nothing happened for
about 10 days here. Hence:

Jarkko, looks like some feedback from your side really would help to
find a path to get this regression resolved before 6.10 is released.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

#regzbot poke

> On 6/17/24 15:34, Stefan Berger wrote:
>> Fix the following type of error message caused by a missing call to
>> tpm2_sessions_init() in the IBM vTPM driver:
>>
>> [    2.987131] tpm tpm0: tpm2_load_context: failed with a TPM error
>> 0x01C4
>> [    2.987140] ima: Error Communicating to TPM chip, result: -14
>>
>> Fixes: d2add27cf2b8 ("tpm: Add NULL primary creation")
>> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
>> ---
>>   drivers/char/tpm/tpm_ibmvtpm.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/char/tpm/tpm_ibmvtpm.c
>> b/drivers/char/tpm/tpm_ibmvtpm.c
>> index d3989b257f42..1e5b107d1f3b 100644
>> --- a/drivers/char/tpm/tpm_ibmvtpm.c
>> +++ b/drivers/char/tpm/tpm_ibmvtpm.c
>> @@ -698,6 +698,10 @@ static int tpm_ibmvtpm_probe(struct vio_dev
>> *vio_dev,
>>           rc = tpm2_get_cc_attrs_tbl(chip);
>>           if (rc)
>>               goto init_irq_cleanup;
>> +
>> +        rc = tpm2_sessions_init(chip);
>> +        if (rc)
>> +            goto init_irq_cleanup;
>>       }
>>         return tpm_chip_register(chip);
