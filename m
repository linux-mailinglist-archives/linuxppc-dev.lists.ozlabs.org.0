Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E85AF5C931
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2019 08:19:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dDbF1mBQzDqTL
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2019 16:19:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Kk22fyJZ"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dDYc4mq9zDqQ5
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2019 16:17:40 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id z75so7162044pgz.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Jul 2019 23:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=tahqKokLQSqrkRrE9L0X7qmXfUa77t7mVWb1xcT7Gyc=;
 b=Kk22fyJZ9Qt84T61s51H5DDQKrsscUoeSf9N0nnrFqSDXAV014z9uUqKklEz9YcOZR
 OIfhxDNSllxvlIGvfo8+gZbV+IRbmvOvcFnUIhWUVBI3ZqJl5+OBipY/6ku/g/qPb5nZ
 1O90iOP/W9SfP30iLgp22+IyeoNxxYVpyjMcYbhtMG7Myv/wpQRAAa522JiWAD8E5ax0
 wwYilcFKtvEQ3VZoG0wrOKGhmzN3Zxiu+BczbAZwRgVljL/4Q1krYixfZ7JgeanOBxW1
 VWFK9e6b2I/Z0Tc45dTK1i83bDppM28MYFMPcuae19Qt/0Xh3j1dU/O18IsrGfrRzyYH
 BEvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=tahqKokLQSqrkRrE9L0X7qmXfUa77t7mVWb1xcT7Gyc=;
 b=O4uadLsKf2yHxLp+slnw7B8JgZSKCX11qbaQ4RRoj+yOy0o3LNMttuD5l8P2g5nR61
 LObYSUlluviRyW8D+2ceJE9X/x6RYuRODfuABxxUpW3KdLcQAqaZ2VayS6TQrLSTKL2E
 US7sVUBjPA6xEQth4lrFJMYfpNZwAhxD8Za1VAGMlIfc/hdSn0ObeW8sQjEC1dCSMdWY
 X1G2ug7sxAxhEUzMXFzYI2SiVvtnXCWzP6/5ZdIpGFwGCe1eGr9mnasBUgAzAe6HDreV
 I45gtsN24uPDAefyQR+SU+vp5ZihCufjtQFaHgC8pGyojtGriOntrJ+A5YAFFXiA2Tjo
 71yA==
X-Gm-Message-State: APjAAAW5QlZ1CAUOOK7Vszvc7+O+kTseOsuyTCWASO4FU9Qg4r005HIc
 4E5MyQe7J8gVQhJGfBxlWwMEzEud
X-Google-Smtp-Source: APXvYqyN8gFEkHWarXFAtokUDkAUHbni1g/z+LIGRskwgKhvyDU2Ce6WQePGcmg2ONtuxcloW9Oqgg==
X-Received: by 2002:a65:63d1:: with SMTP id n17mr17756024pgv.382.1562048257221; 
 Mon, 01 Jul 2019 23:17:37 -0700 (PDT)
Received: from localhost ([175.45.73.101])
 by smtp.gmail.com with ESMTPSA id br18sm1196808pjb.20.2019.07.01.23.17.36
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 01 Jul 2019 23:17:36 -0700 (PDT)
Date: Tue, 02 Jul 2019 16:17:11 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [v2 09/12] powerpc/mce: Enable MCE notifiers in external modules
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Santosh Sivaraj
 <santosh@fossix.org>
References: <20190702051932.511-1-santosh@fossix.org>
 <20190702051932.511-10-santosh@fossix.org>
In-Reply-To: <20190702051932.511-10-santosh@fossix.org>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1562047959.5y756f60wn.astroid@bobo.none>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>,
 Chandan Rajendra <chandan@linux.vnet.ibm.com>,
 Reza Arbab <arbab@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Santosh Sivaraj's on July 2, 2019 3:19 pm:
> From: Reza Arbab <arbab@linux.ibm.com>
>=20
> Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
> ---
>  arch/powerpc/kernel/exceptions-64s.S | 6 ++++++
>  arch/powerpc/kernel/mce.c            | 2 ++
>  2 files changed, 8 insertions(+)
>=20
> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/e=
xceptions-64s.S
> index c83e38a403fd..311f1392a2ec 100644
> --- a/arch/powerpc/kernel/exceptions-64s.S
> +++ b/arch/powerpc/kernel/exceptions-64s.S
> @@ -458,6 +458,12 @@ EXC_COMMON_BEGIN(machine_check_handle_early)
>  	bl	machine_check_early
>  	std	r3,RESULT(r1)	/* Save result */
> =20
> +	/* Notifiers may be in a module, so enable virtual addressing. */
> +	mfmsr	r11
> +	ori	r11,r11,MSR_IR
> +	ori	r11,r11,MSR_DR
> +	mtmsr	r11

Can't do this, we could take a machine check somewhere the MMU is
not sane (in fact the guest early mce handling that was added recently
should not be enabling virtual mode either, which needs to be fixed).

Thanks,
Nick
=
