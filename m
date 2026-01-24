Return-Path: <linuxppc-dev+bounces-16254-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MipF4cQdGnF1wAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16254-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jan 2026 01:21:27 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7257BA82
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jan 2026 01:21:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dyb7m0Dq0z2yFh;
	Sat, 24 Jan 2026 11:21:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769214083;
	cv=none; b=TeqodFIbylv81d8RhAFluUxlarKGAoLi00gnSXq9y9Ge2nZ+TDY0we0dTzCGB00XUyV1AR+IlXCrQu14R9Hb7MQfyK/dlFqZaBaMzWHiq7iqzrXF97ircnbbTlLpgPTOVBKzVikAPgbf9G8obrVA/XpZ5GqxREL1cPqCKRkp8OKMdf9KVgKkzmmIVB+CAR44HjlfAW7oszGySsV/jJChqZ5GVTE0Up6+MXojSUaUvlVX/RcOlkO7bPatXZ7iZKRVbohuTlz7xfEckC5kRN4jOmEcRneHUPE+Q86zapTMk+ZGblgQsd6kkiRqVGLOjJCe/aGF2hvOiBXguHGyD+cviQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769214083; c=relaxed/relaxed;
	bh=xhgLPiYR6xEsxXnQ/SeaMjXXghHvMuOe7YsndhfrobA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=FJsM/moj7Gd2ah+IN40qyi/cA1V7KsyseLgt2xPMHTX9IvYBT+JH7t/dflR0WJmLCUv3GgjgH3aAq2z6SbdwMO+EW+zc1g6elUyD/O1lBNHFxVJzpHXh6mP91mjMXHH/egcMkeIioJ+SoKcpg9dzH2kYjvfMQ14Z+tSTMUnDqi3zA1BzJGYDo5J3Wo+DqWGOZUdaVPBKKFIA5CpyU8D1RoqNtXAuhFhyTEDMHIKm05N+2RDPQiUbrIrtSqQLrC1cmMomTls0T3zL0h3kxeDLIp/32GInUmDn/X7pgR2Fq3los5q7AyysP8giZ0+a/BZWhh98vavpBhxiHWX4RFaBYg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Nh1jvGaU; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Nh1jvGaU; dkim-atps=neutral; spf=temperror (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=coxu@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Nh1jvGaU;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Nh1jvGaU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=temperror (SPF Temporary Error: DNS Timeout) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=coxu@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dyb7k21TTz2x9M
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Jan 2026 11:21:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769214057;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xhgLPiYR6xEsxXnQ/SeaMjXXghHvMuOe7YsndhfrobA=;
	b=Nh1jvGaUjRm0atvydNlFFcW0SGiWwOYFpOdTr4FsomtL9qdYU+lsoKPYZQ/oTEFfdVlIFN
	N+bjUvd+u6NUv4R012H2KaeQ6qtKfPv98GcgZHcSau+9q456oOuIes5Ywj7Z67w+zv8VdE
	jxe3YXmMkcgTLM5xpkflhgGfV4Frk5c=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769214057;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xhgLPiYR6xEsxXnQ/SeaMjXXghHvMuOe7YsndhfrobA=;
	b=Nh1jvGaUjRm0atvydNlFFcW0SGiWwOYFpOdTr4FsomtL9qdYU+lsoKPYZQ/oTEFfdVlIFN
	N+bjUvd+u6NUv4R012H2KaeQ6qtKfPv98GcgZHcSau+9q456oOuIes5Ywj7Z67w+zv8VdE
	jxe3YXmMkcgTLM5xpkflhgGfV4Frk5c=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-142-sX_cGJgLMNS5K8kQ7feH-Q-1; Fri, 23 Jan 2026 19:20:55 -0500
X-MC-Unique: sX_cGJgLMNS5K8kQ7feH-Q-1
X-Mimecast-MFC-AGG-ID: sX_cGJgLMNS5K8kQ7feH-Q_1769214054
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a76f2d7744so23237545ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jan 2026 16:20:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769214054; x=1769818854;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xhgLPiYR6xEsxXnQ/SeaMjXXghHvMuOe7YsndhfrobA=;
        b=qzW+vBgtAGaJViRtRTxTPJ0CqHImSb8VeiofJIFXQ1Mo19Qp4lkGBjauVrP/hQPsyS
         sZlKNUcUqaQHIdOcAVFZvSEeKub/HABZxjNyRxtHLirqA1XW8J/+AJITW3wGtwHDD0k8
         ywXTlfiVtnrxt3wdYpl8C5GUxAwTyjKyxidJqZ7ZLnPnGAqT6LKUzl4Y+Hryf1c2pv4g
         u+weacp4BHAYJiFThB9nWfcGWaTMqQr2ETVKa9Na3AtO1ux1rJEvX1jCrH66WqpJVLlU
         ct8Zd9jivrznEYtHFyd+dnaCzCooF+ALYe6rUlIcX+0/I8gI4uHnUkYkHXiJ+hEZOqev
         x9Nw==
X-Forwarded-Encrypted: i=1; AJvYcCVXHrB1mZ/5F9sNRpgS2eV11Ki/FxMLtS+hiZctn6C02QdCttqPbqox9k6qM+rqqmttiHWP1x38PIOqtQ4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxQ6CbV0nqHrB9zhJ4Ob9gPrq7vOQmg1kO3hQDgylmMx/DYiwsY
	nmk317eVACMbL0DveeOjkgu7QeyTteAwsAeIrezvHLBbhilSd6/bsYHAlJmhf2wDJKRIt/1TT8/
	gjnZjaKWGyCZdG7YRQEw4vl4TBBEqDMX4YVtSOcvGNR0mYO4WvuycL/7b6Brq5jN98kw=
X-Gm-Gg: AZuq6aLMNm5srMw4inU74QqM0lrhucEx+RQLIXsQMJPDaQEiogK8xl5dQD7Om8+6BRa
	Sg9OtuLdUTPwySfTJJMXGyKbzAD3yM3UYchPIx/HFBtSmJjG8WX8ecba+DCCKwhw7CLwJIivBKK
	dsvYmpv9UN1OSApEhe17ovD2NPAa/AdQvDKzLww/2BcIAOYUo2ROBdOa6OIsncniMyytH9bV1cR
	OlUr6tNEIm8MpodEqh9u5MvLYKQKvKLQ1ABWkrnmwoCZKDk894OJu9T4WB57zol2F3BnGRbZFOn
	R5kKigyqSAGhLrxRkIMF8jYKb5kVbX8zf0B76Nv0NsXnTwC8QOaP/jRTWDZmmJYKt8jvXyGPKdO
	k
X-Received: by 2002:a17:902:e54d:b0:2a7:682b:50ac with SMTP id d9443c01a7336-2a7fe625118mr44257365ad.28.1769214054347;
        Fri, 23 Jan 2026 16:20:54 -0800 (PST)
X-Received: by 2002:a17:902:e54d:b0:2a7:682b:50ac with SMTP id d9443c01a7336-2a7fe625118mr44257045ad.28.1769214053812;
        Fri, 23 Jan 2026 16:20:53 -0800 (PST)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802faf6f9sm29695045ad.71.2026.01.23.16.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 16:20:53 -0800 (PST)
Date: Sat, 24 Jan 2026 08:18:46 +0800
From: Coiby Xu <coxu@redhat.com>
To: Ard Biesheuvel <ardb@kernel.org>, Mimi Zohar <zohar@linux.ibm.com>
Cc: Dave Hansen <dave.hansen@intel.com>, linux-integrity@vger.kernel.org, 
	Heiko Carstens <hca@linux.ibm.com>, Roberto Sassu <roberto.sassu@huaweicloud.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, 
	Roberto Sassu <roberto.sassu@huawei.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, 
	Eric Snowberg <eric.snowberg@oracle.com>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, 
	"moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)" <linuxppc-dev@lists.ozlabs.org>, "open list:S390 ARCHITECTURE" <linux-s390@vger.kernel.org>, 
	"open list:EXTENSIBLE FIRMWARE INTERFACE (EFI)" <linux-efi@vger.kernel.org>, 
	"open list:SECURITY SUBSYSTEM" <linux-security-module@vger.kernel.org>, "open list:KEYS/KEYRINGS_INTEGRITY" <keyrings@vger.kernel.org>
Subject: Re: [PATCH 1/3] integrity: Make arch_ima_get_secureboot
 integrity-wide
Message-ID: <aXQN-ZNhT5olbf6X@Rk>
References: <20260115004328.194142-2-coxu@redhat.com>
 <CAMj1kXFXNo1-pMbo-VZrjQ3TYe1tufebrLr_avL12A0nHMSGnA@mail.gmail.com>
 <8bfa859ed3a4f1cf0db0ab64d8c1c3b24684582a.camel@linux.ibm.com>
 <CAMj1kXHsJNZoUEnbD1y=v4Ftuv9d2c08VckRV7ru4k4P83vZbQ@mail.gmail.com>
 <97b69bc79a5d9246f7a399510908c7b95b2e95e7.camel@linux.ibm.com>
 <CAMj1kXGx4ebaK87W7k0SNUNQnO9+=z1nmYxXC7retmp3OqRRFg@mail.gmail.com>
 <ac5e5e45c12e9b0bda19807e60b06057d74be0b3.camel@linux.ibm.com>
 <aW2i3yacr5TvWU-m@Rk>
 <1a0b6e5601a673a81f8823de0815f92b7afbeb60.camel@linux.ibm.com>
 <CAMj1kXFBMSEdRL8FotASbQO3dcfNG0bpp9Vnm5JPn-yjyDr=GA@mail.gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <CAMj1kXFBMSEdRL8FotASbQO3dcfNG0bpp9Vnm5JPn-yjyDr=GA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VxgygnQraub_aSK27bbTMplUYtJe69szPY2opXullv0_1769214054
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16254-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ardb@kernel.org,m:zohar@linux.ibm.com,m:dave.hansen@intel.com,m:linux-integrity@vger.kernel.org,m:hca@linux.ibm.com,m:roberto.sassu@huaweicloud.com,m:catalin.marinas@arm.com,m:will@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:tglx@linutronix.de,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:roberto.sassu@huawei.com,m:dmitry.kasatkin@gmail.com,m:eric.snowberg@oracle.com,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:jarkko@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-s390@vger.kernel.org,m:linux-efi@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:keyrings@vger.kernel.org,m:dmitrykasatkin@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[coxu@redhat.com,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[36];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[intel.com,vger.kernel.org,linux.ibm.com,huaweicloud.com,arm.com,kernel.org,ellerman.id.au,gmail.com,linutronix.de,redhat.com,alien8.de,linux.intel.com,zytor.com,huawei.com,oracle.com,paul-moore.com,namei.org,hallyn.com,lists.infradead.org,lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[coxu@redhat.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 7A7257BA82
X-Rspamd-Action: no action

On Wed, Jan 21, 2026 at 05:25:39PM +0100, Ard Biesheuvel wrote:
>On Wed, 21 Jan 2026 at 16:41, Mimi Zohar <zohar@linux.ibm.com> wrote:
>>
>> On Mon, 2026-01-19 at 12:04 +0800, Coiby Xu wrote:
>>
>> > diff --git a/security/integrity/ima/Kconfig b/security/integrity/ima/Kconfig
>> > index 976e75f9b9ba..5dce572192d6 100644
>> > --- a/security/integrity/ima/Kconfig
>> > +++ b/security/integrity/ima/Kconfig
>> > @@ -311,6 +311,7 @@ config IMA_QUEUE_EARLY_BOOT_KEYS
>> >   config IMA_SECURE_AND_OR_TRUSTED_BOOT
>> >          bool
>> >          depends on IMA_ARCH_POLICY
>> > +       depends on INTEGRITY_SECURE_BOOT
>> >
>> >
>> > Another idea is make a tree-wide arch_get_secureboot i.e. to move
>> > current arch_ima_get_secureboot code to arch-specific secure boot
>> > implementation. By this way, there will no need for a new Kconfig option
>> > INTEGRITY_SECURE_BOOT. But I'm not sure if there is any unforeseen
>> > concern.
>>
>> Originally basing IMA policy on the secure boot mode was an exception.  As long
>> as making it public isn't an issue any longer, this sounds to me.  Ard, Dave, do
>> you have any issues with replacing arch_ima_get_secureboot() with
>> arch_get_secureboot()?
>
>I don't see an issue with that. If there is a legitimate need to
>determine this even if IMA is not enabled, then this makes sense.

Thanks for the confirmation! Here's the updated patch
https://github.com/coiby/linux/commit/c222c1d08d90ef1ec85ef81ece90afc9efde7937.patch

If there is no objection, I'll send v2.

-- 
Best regards,
Coiby


