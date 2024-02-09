Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD9484EF6F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 04:37:44 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cRULODUr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TWKLG4Wrtz3dBy
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 14:37:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cRULODUr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::2e; helo=mail-oa1-x2e.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TWKK62NqJz3cK4
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Feb 2024 14:36:42 +1100 (AEDT)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-21920f89441so254257fac.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Feb 2024 19:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707449799; x=1708054599; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/itS1zlRQa0W3X3/sboV32WQE3hhCFnyF3AvCEPNz88=;
        b=cRULODUrUQDYQmwsCwPoWZ/j3FgqXZN9DbQFRlQQhVboBWOeUcXNIwSQVX1FNp5ZJC
         lV1vDgsVvoNxDYfm7wpcxg3u5T5btthfDM1M8EpJMU78wZDeCaDJwaIxNzq++jBbKV4f
         oVL+hf2MNZTcyD0cdnhupmRc67MBlWM0mmRrRQOGz1mmTyCsObnp/xh/Nf+Wcy7ug33D
         IV9g6ugxQyhC0V/FJa0AqQ9+DDIfIEG6A8uVFGeN3p+0A/05AHlQa1qM9jvfshow5E1V
         FGLfZvwnJDfu195CN+Bomq+Orv9c7aOw08gOSNwsJwncotfv6jMjf4TOY6bedK/9pBMC
         0bKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707449799; x=1708054599;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/itS1zlRQa0W3X3/sboV32WQE3hhCFnyF3AvCEPNz88=;
        b=OdgvEfy3P06ru+KI/dAmdlkydupE0C51wI6/9GeJG129x92KkHH8G22VkKRp/cZhPm
         XKgb5GOWixJtp4JRThw8QZVEnLz0JRpEtPqYpkSIFUzNVBd6Zv2ha6DRFEba9iXS3f51
         V8wWzNKkbkdt2xrgomsiHIiDmnOXU9EYxLyfnVmimxnEoEOr7Sg2ZnExVaK9U5cRuCBX
         r4VnHyWI9g9bulqoxy+LJEQwhJKgpogT8wkveQCkH4h32cXxkDLR521AV8zFTEfMz81R
         mUkHsi0imOi/9CFCTqIxCYZEmLf6BMma6jpm0sVtfCu4r6jkD6VltDJtmky0oWXWk2vZ
         oRyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWm0gPegvYqcV9xgLnmkJzuxNveRnXfQOVVVJ3Xc1raCdmfue+NUi73zw3pEvaj4FWBgMTQFcR5Mg46ACxIgBBT1SrGF0868PKfG6HGBA==
X-Gm-Message-State: AOJu0YxIakEJUUNC6aQuVfqowJazzEn0AyWvRjT7qGg9NFx+nnkE7R7q
	8/nw77bzZvWMBZ6HXZNNiUSb407JoPkl95Eru4A85a7emgpW0A4a
X-Google-Smtp-Source: AGHT+IHl8GUTEq19JX8rNakjtBooH2UQnSMTKMAdjpPRY1T5Xru1ViOiNvOAzZ4u6IoQKt0Lx5+MOg==
X-Received: by 2002:a05:6870:65ab:b0:214:b6dd:39bf with SMTP id fp43-20020a05687065ab00b00214b6dd39bfmr461789oab.36.1707449799564;
        Thu, 08 Feb 2024 19:36:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVzaoBX89atdTx3Ru9rswKCpcVDpsh2nyN0T4awqFq6gzK94W2ss1uMZjRJHSZK7vrjOiQkrZj52tD+vUCmqUeGodzRxejsp8X/azn9FqlEG6j8ZJ8H/TmUOt/oj1sNTByt2U2MVyeGF9wcLax4Yq7SpXHnrQ1oARRNmP9uvM4iNUbH7xWrnFTudD/OjWnYMg61/z8lw8pDgMR+rxilBi+LT6UxSSodwiQ956rSB1ItdL71fc0JYGCzMCGVktuFR9KLClnfD+LG6G5k
Received: from localhost ([1.146.65.44])
        by smtp.gmail.com with ESMTPSA id r16-20020a63e510000000b005dc36279d6dsm618997pgh.73.2024.02.08.19.36.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Feb 2024 19:36:39 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Feb 2024 13:36:33 +1000
Message-Id: <CZ08FQE70OVJ.397UJ8KZ89BC4@wheely>
Subject: Re: [PATCH v2 3/5] s390/vtime: remove unused
 __ARCH_HAS_VTIME_TASK_SWITCH leftover
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Alexander Gordeev" <agordeev@linux.ibm.com>, "Frederic Weisbecker"
 <frederic@kernel.org>, "Ingo Molnar" <mingo@kernel.org>, "Michael Ellerman"
 <mpe@ellerman.id.au>, "Heiko Carstens" <hca@linux.ibm.com>, "Vasily Gorbik"
 <gor@linux.ibm.com>
X-Mailer: aerc 0.15.2
References: <cover.1707422448.git.agordeev@linux.ibm.com>
 <2fcc4503851ef7cbb6106ba6706179605b7449fd.1707422448.git.agordeev@linux.ibm.com>
In-Reply-To: <2fcc4503851ef7cbb6106ba6706179605b7449fd.1707422448.git.agordeev@linux.ibm.com>
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
Cc: linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri Feb 9, 2024 at 6:15 AM AEST, Alexander Gordeev wrote:
> __ARCH_HAS_VTIME_TASK_SWITCH macro is not used anymore.

... but for benefit of patchwork if you decide to keep them
apart

Acked-by: Nicholas Piggin <npiggin@gmail.com>

>
> Reviewed-by: Frederic Weisbecker <frederic@kernel.org>
> Acked-by: Heiko Carstens <hca@linux.ibm.com>
> Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
> ---
>  arch/s390/include/asm/vtime.h | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/s390/include/asm/vtime.h b/arch/s390/include/asm/vtime.=
h
> index fe17e448c0c5..561c91c1a87c 100644
> --- a/arch/s390/include/asm/vtime.h
> +++ b/arch/s390/include/asm/vtime.h
> @@ -2,8 +2,6 @@
>  #ifndef _S390_VTIME_H
>  #define _S390_VTIME_H
> =20
> -#define __ARCH_HAS_VTIME_TASK_SWITCH
> -
>  static inline void update_timer_sys(void)
>  {
>  	S390_lowcore.system_timer +=3D S390_lowcore.last_update_timer - S390_lo=
wcore.exit_timer;

