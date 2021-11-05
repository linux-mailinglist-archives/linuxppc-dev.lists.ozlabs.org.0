Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7FF44626E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 11:56:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hly9w70HYz307W
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 21:56:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=EFNE6b2w;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::633;
 helo=mail-pl1-x633.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=EFNE6b2w; dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hly9D4LCxz2yQw
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Nov 2021 21:55:59 +1100 (AEDT)
Received: by mail-pl1-x633.google.com with SMTP id u11so10863134plf.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Nov 2021 03:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=7fdsM52daXciJqnyU5/OzVCaVhDKnkuUr417/ZYsvNw=;
 b=EFNE6b2w+3luKQ+85xyK/0sEBmwzOUa7Vv/yzXOCuyMM+atPYW4qW18bcKfqFUct38
 P7fjJPzHA2fblddnmcuJCjTHn+yrLSk2tgPRRg7axeQ0wcS/yhzxV+smfQI3wRzP9EOd
 VmB9G17c2IpvCQYT9NzttCjp42sdLKog7sNIQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=7fdsM52daXciJqnyU5/OzVCaVhDKnkuUr417/ZYsvNw=;
 b=jdHMW4OqFCn33+5iYbXknkUxeAKbwWyY8PjQrWY9fi8J3QOv/FhQqZJhibwTsZgX7H
 bGeV6TUUz8fNRzk5fXyWouAASI9yB0wD/0B0IzKTkGkHuF3iYqUhOg1jNw1FxvxSWPz7
 epuqAvixNK52nDlJ04FIx/fEq4pnuPEg8oKkPQQWDNCXCa/GNDhysKjzASe39b03l9yf
 PEHHJRDgh3q/6ksLtDMWSu+X9WqAn7l6rWeuPMKxcKN3JkJoWCnyZNoiam8PnoL6Ua4i
 xG/2ciZp0wZNAXyaZvRan0dpTz57lbaDRPtuRLVjtGCmLea8bE9z5WqEeQP5tW+uow6p
 u/mw==
X-Gm-Message-State: AOAM532t4KOJDsCXd15B57UkW+QM1N1umFDjgBvSRPzC1vRJZOPVYRhz
 PGzCUKh80ycRCj3PZyhJKtqC/g==
X-Google-Smtp-Source: ABdhPJwCTOEks/HqEB3MsjkY3hl6kqZcTdp01TkyVsdwZ6RzuTp6/FHOriFqQpl7OvwI6sbG3UD4OA==
X-Received: by 2002:a17:90a:bb14:: with SMTP id
 u20mr20557433pjr.139.1636109756579; 
 Fri, 05 Nov 2021 03:55:56 -0700 (PDT)
Received: from localhost ([2001:4479:e000:e400:c94c:529e:ffcd:fff0])
 by smtp.gmail.com with ESMTPSA id q6sm7423217pfk.115.2021.11.05.03.55.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Nov 2021 03:55:56 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Michal Suchanek <msuchanek@suse.de>, keyrings@vger.kernel.org
Subject: Re: [PATCH 0/3] KEXEC_SIG with appended signature
In-Reply-To: <cover.1635948742.git.msuchanek@suse.de>
References: <cover.1635948742.git.msuchanek@suse.de>
Date: Fri, 05 Nov 2021 21:55:52 +1100
Message-ID: <87czneeurr.fsf@dja-thinkpad.axtens.net>
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
Cc: Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Rob Herring <robh@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Frank van der Linden <fllinden@amazon.com>, Jessica Yu <jeyu@kernel.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Michal Suchanek <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michal Suchanek <msuchanek@suse.de> writes:

> S390 uses appended signature for kernel but implements the check
> separately from module loader.
>
> Support for secure boot on powerpc with appended signature is planned -
> grub patches submitted upstream but not yet merged.

Power Non-Virtualised / OpenPower already supports secure boot via kexec
with signature verification via IMA. I think you have now sent a
follow-up series that merges some of the IMA implementation, I just
wanted to make sure it was clear that we actually already have support
for this in the kernel, it's just grub that is getting new support.

> This is an attempt at unified appended signature verification.

I am always in favour of fewer reimplementations of the same feature in
the kernel :)

Regards,
Daniel

>
> Thanks
>
> Michal
>
> Michal Suchanek (3):
>   s390/kexec_file: Don't opencode appended signature verification.
>   module: strip the signature marker in the verification function.
>   powerpc/kexec_file: Add KEXEC_SIG support.
>
>  arch/powerpc/Kconfig                  | 11 +++++++
>  arch/powerpc/kexec/elf_64.c           | 14 +++++++++
>  arch/s390/kernel/machine_kexec_file.c | 42 +++------------------------
>  include/linux/verification.h          |  3 ++
>  kernel/module-internal.h              |  2 --
>  kernel/module.c                       | 11 +++----
>  kernel/module_signing.c               | 32 ++++++++++++++------
>  7 files changed, 59 insertions(+), 56 deletions(-)
>
> -- 
> 2.31.1
