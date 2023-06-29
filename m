Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2AE742B0F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 19:08:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=S/sZZKRq;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=S/sZZKRq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QsPz54Mqtz3bsP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jun 2023 03:08:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=S/sZZKRq;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=S/sZZKRq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=jsnitsel@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QsPxt0vNYz3byT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jun 2023 03:06:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688058412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A/N1q1JcWIXlbNgkIYZVnaEQ46bfA3UQYlq1BYT9Ptg=;
	b=S/sZZKRqgmiBX1MiRUQDeA27yHOfwUcFZQt6rVtz4QWeJPiBISlDzk2B/H/2zutQMGGC8w
	Vtf/WQyBsMvRJDa6Pe0aw7LZSDqn2O7G11n7e6Rb7pld/JxLsSjlxXiPysZkPekSpYchN/
	ZmjKgH/xM0OqBtYje837zMQMf8P00FY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688058412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A/N1q1JcWIXlbNgkIYZVnaEQ46bfA3UQYlq1BYT9Ptg=;
	b=S/sZZKRqgmiBX1MiRUQDeA27yHOfwUcFZQt6rVtz4QWeJPiBISlDzk2B/H/2zutQMGGC8w
	Vtf/WQyBsMvRJDa6Pe0aw7LZSDqn2O7G11n7e6Rb7pld/JxLsSjlxXiPysZkPekSpYchN/
	ZmjKgH/xM0OqBtYje837zMQMf8P00FY=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-342-CUrM31zGMDe9V428_arMIg-1; Thu, 29 Jun 2023 13:06:50 -0400
X-MC-Unique: CUrM31zGMDe9V428_arMIg-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-635e6c83d77so8368446d6.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jun 2023 10:06:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688058410; x=1690650410;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A/N1q1JcWIXlbNgkIYZVnaEQ46bfA3UQYlq1BYT9Ptg=;
        b=ULWXYhe3LDHXnvlCRJsH3mUNLGfCNr67kqPh6ikQONizOalOOjuKnq5HuufhwoVhk+
         /ziQT28yVhucQ4CeaqtDssdysKJYV6s8IZ5VYc8JLj5vCMlVm8K8nhY7eVVDT3taC2KW
         0aiLhELQ9HaaLT7A0QzB8swtV5d7IOjxrPQRKzC0mAlrLfYeatHKW4e6w+0EXkuSHvvU
         76qjw9jHiNGXTTp6moEHNaWLP1HKL9FuHp6IS8oM7zLXHaOXdI0aMco4DLuycZXk1T4o
         GMbGDMdg3dFJH6zfZLOFcmB0qeHUDeuEBbAuXtwr6amjDBgkqi/QWmhHgoZ5oHHN1bgb
         lHjA==
X-Gm-Message-State: ABy/qLZ9TiKtyd/VxR3kko35yHVPg28IqfzjWhxdmbdD2L68uE/fDJgH
	EOM3tl8pwuFDDeGRDO5Vvmi+hhGz3mAjJr9QOO5wk0ozhy52+Jzj8du4VBIaieOkGsNwiFKdor2
	fYY6geQLqoVW5YtGfnShZgrcttQ==
X-Received: by 2002:a05:6214:c62:b0:635:f412:6a70 with SMTP id t2-20020a0562140c6200b00635f4126a70mr201037qvj.47.1688058410033;
        Thu, 29 Jun 2023 10:06:50 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFZM+GVL4jbhfP9zasY2tqCDNztP4bkyURAOopcPQX4hdKl1OEm2B1JeATQ8vjOF5cd1WWHxw==
X-Received: by 2002:a05:6214:c62:b0:635:f412:6a70 with SMTP id t2-20020a0562140c6200b00635f4126a70mr201016qvj.47.1688058409582;
        Thu, 29 Jun 2023 10:06:49 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id z15-20020a0ce98f000000b006300ff90e71sm7197174qvn.122.2023.06.29.10.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 10:06:49 -0700 (PDT)
Date: Thu, 29 Jun 2023 10:06:47 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: "Limonciello, Mario" <mario.limonciello@amd.com>
Subject: Re: [6.4-rc6] Crash during a kexec operation
 (tpm_amd_is_rng_defective)
Message-ID: <c53ihvuesmymj2o5jyqz7gw7mvbrxjifmphuuhiux3qjabjnic@wcak4hfb77td>
References: <99B81401-DB46-49B9-B321-CF832B50CAC3@linux.ibm.com>
 <87o7lhfmoh.fsf@mail.lhotse>
 <CA0088E4-2851-4AFF-94F8-2A07C5CDA8D8@linux.ibm.com>
 <675a8893-429d-05be-b647-089b249c814c@leemhuis.info>
 <87o7l7oer1.fsf@mail.lhotse>
 <3f5a37f1-70e0-3dcf-3bd3-acc8a04e53ee@amd.com>
MIME-Version: 1.0
In-Reply-To: <3f5a37f1-70e0-3dcf-3bd3-acc8a04e53ee@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, jarkko@kernel.org, Sachin Sant <sachinp@linux.ibm.com>, linux-integrity@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 22, 2023 at 09:38:04AM -0500, Limonciello, Mario wrote:
> 
> On 6/22/2023 7:36 AM, Michael Ellerman wrote:
> > "Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info> writes:
> > > Hi, Thorsten here, the Linux kernel's regression tracker. Top-posting
> > > for once, to make this easily accessible to everyone.
> > > 
> > > As Linus will likely release 6.4 on this or the following Sunday a quick
> > > question: is there any hope this regression might be fixed any time
> > > soon?
> > No.
> > 
> > I have added the author of the commit to Cc, maybe they can help?
> > 
> > The immediate question is, is it expected for chip->ops to be NULL in
> > this path? Obviously on actual AMD systems that isn't the case,
> > otherwise the code would crash there. But is the fact that chip->ops is
> > NULL a bug in the ibmvtpm driver, or a possibility that has been
> > overlooked by the checking code.
> > 
> > cheers
> 
> All that code assumes that the TPM is still functional which
> seems not to be the case for your TPM.
> 
> This should fix it:
> 
> diff --git a/drivers/char/tpm/tpm-chip.c b/drivers/char/tpm/tpm-chip.c
> index 5be91591cb3b..7082b031741e 100644
> --- a/drivers/char/tpm/tpm-chip.c
> +++ b/drivers/char/tpm/tpm-chip.c
> @@ -525,6 +525,9 @@ static bool tpm_amd_is_rng_defective(struct tpm_chip
> *chip)
>         u64 version;
>         int ret;
> 
> +       if (!chip->ops)
> +               return false;
> +
>         if (!(chip->flags & TPM_CHIP_FLAG_TPM2))
>                 return false;


Should tpm_amd_is_rng_defective compile to nothing on non-x86 architectures? This code is all about
working around an issue with the AMD fTPM, right?

Regards,
Jerry

