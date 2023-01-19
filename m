Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE602672DE6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 02:14:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ny4QZ4W1Lz3fCX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 12:13:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=iedPpwf5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=iedPpwf5;
	dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ny4Pg1ksWz2x9L
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jan 2023 12:13:09 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id 20so870272plo.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 17:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=trQ8wPDdZRnOhR09mO+bG/KeF7fjbj/nqEQErtarT5c=;
        b=iedPpwf5nA+2keWvD77tT1QHT2acngdr0fxuAbMcmef4fExDwXZU8yzdvJCxhpT2ym
         mq2SWTKZN8VkEL1mCgymWRb/aODT6vdXJ2OhQNWKI1eQMQeVnu3gz0WFxHYMFwydsOjx
         2/W05BJEfDQjIy3JZXoaQCcJhjrfYpJmuh5iFYvhHXr3Z6jgbchYnFCzBsxcCdNTZdeF
         uB7Dnjl5+7QtYFW8tfqC74mpu8BS5VZCJNZ7LytWzt3Rim3m0WZ1iAd21BhwhZQX3KDt
         ouzBsmDpWRIvzUVq3beb+KIenmmnAf6jNHWJNN+pMiHLw6aKFM2vJbFS5VRKj2iaFoNL
         WXSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=trQ8wPDdZRnOhR09mO+bG/KeF7fjbj/nqEQErtarT5c=;
        b=e6mFDrOWju7BDOjO4LlY1M3dJUwBOuOyZvTILDiotPH/hg0kgwEjUCxioQmLU2xPTd
         a44NgQbCK7m53CZw/DAE9HrTSSdNXnUuY0pjkdcnRrAYxgJs52E8ohcnDBKbZRIpzOJI
         MtJWRmBwu/zWZQLU85F04n8BgGFYblQcro/CJi7s5jgujp8TlVo702z9V1ORJA4JdwQa
         LUTI8vLB7hywUzzaXg8Lpuk21G/bWStUxeHga5mZUGEe69s3pAD7VISatz43mBvSKi1B
         UQ/CLO3QHQ6j7yhlgY2+fGIu1ZqdKTOJAwfJYNTYfnOuzIIyYuKd4aw4H53WSjCRLiMZ
         fBQw==
X-Gm-Message-State: AFqh2krMNOdOVJjb9jYre68ZNTwJ9VoLlQVHlzOrN18oCkN1lJo7qCJz
	Y/tPImvEW/lAY8F3QVPxSiRL1oW8jS0=
X-Google-Smtp-Source: AMrXdXsFGIbounHZJ2Dj4H4446MRSLS+KlWWG8txSiLuHDvKJ/U3YrT2y5kFsBYYfzOil7tpMtE/pg==
X-Received: by 2002:a17:902:a9c5:b0:194:60c3:482f with SMTP id b5-20020a170902a9c500b0019460c3482fmr23642700plr.26.1674090787240;
        Wed, 18 Jan 2023 17:13:07 -0800 (PST)
Received: from localhost (193-116-102-45.tpgi.com.au. [193.116.102.45])
        by smtp.gmail.com with ESMTPSA id y8-20020a17090322c800b00186f0f59c85sm2511649plg.235.2023.01.18.17.13.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 17:13:06 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Jan 2023 11:12:57 +1000
Message-Id: <CPVRNHVV9L6U.34DQEC4B6NB51@bobo>
Subject: Re: [PATCH v3 16/24] powerpc/pseries: Implement signed update for
 PLPKS objects
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Andrew Donnellan" <ajd@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-integrity@vger.kernel.org>
X-Mailer: aerc 0.13.0
References: <20230118061049.1006141-1-ajd@linux.ibm.com>
 <20230118061049.1006141-17-ajd@linux.ibm.com>
In-Reply-To: <20230118061049.1006141-17-ajd@linux.ibm.com>
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
Cc: gjoyce@linux.ibm.com, erichte@linux.ibm.com, gregkh@linuxfoundation.org, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, zohar@linux.ibm.com, sudhakar@linux.ibm.com, bgray@linux.ibm.com, gcwilson@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed Jan 18, 2023 at 4:10 PM AEST, Andrew Donnellan wrote:
> From: Nayna Jain <nayna@linux.ibm.com>
>
> The Platform Keystore provides a signed update interface which can be use=
d
> to create, replace or append to certain variables in the PKS in a secure
> fashion, with the hypervisor requiring that the update be signed using th=
e
> Platform Key.
>
> Implement an interface to the H_PKS_SIGNED_UPDATE hcall in the plpks
> driver to allow signed updates to PKS objects.
>
> (The plpks driver doesn't need to do any cryptography or otherwise handle
> the actual signed variable contents - that will be handled by userspace
> tooling.)
>
> Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
> [ajd: split patch, add timeout handling and misc cleanups]
> Co-developed-by: Andrew Donnellan <ajd@linux.ibm.com>
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
> Signed-off-by: Russell Currey <ruscur@russell.cc>
>
> ---
>
> v3: Merge plpks fixes and signed update series with secvar series
>
>     Fix error code handling in plpks_confirm_object_flushed() (ruscur)
>
>     Pass plpks_var struct to plpks_signed_update_var() by reference (mpe)
>
>     Consistent constant naming scheme (ruscur)
> ---
>  arch/powerpc/include/asm/hvcall.h      |  3 +-
>  arch/powerpc/include/asm/plpks.h       |  5 ++
>  arch/powerpc/platforms/pseries/plpks.c | 71 ++++++++++++++++++++++++--
>  3 files changed, 73 insertions(+), 6 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm=
/hvcall.h
> index 95fd7f9485d5..33b26c0cb69b 100644
> --- a/arch/powerpc/include/asm/hvcall.h
> +++ b/arch/powerpc/include/asm/hvcall.h
> @@ -336,7 +336,8 @@
>  #define H_SCM_FLUSH		0x44C
>  #define H_GET_ENERGY_SCALE_INFO	0x450
>  #define H_WATCHDOG		0x45C
> -#define MAX_HCALL_OPCODE	H_WATCHDOG
> +#define H_PKS_SIGNED_UPDATE	0x454
> +#define MAX_HCALL_OPCODE	H_PKS_SIGNED_UPDATE

^ Bad rebase.

Thanks,
Nick
