Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1076463BD1F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 10:41:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NLy6B691Pz3bPL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 20:41:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=g6teJcRA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=g6teJcRA;
	dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NLy5C52CZz2yxQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Nov 2022 20:41:02 +1100 (AEDT)
Received: by mail-pj1-x1030.google.com with SMTP id b11so12134713pjp.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Nov 2022 01:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q5g+tj/yKi8alTc9Rxu5SEVWr3VUBDIneqMcER2WZKw=;
        b=g6teJcRAW3MiT9Fz2oIVH0UoNZzL5F3a0q7x4tqE0P3i+DqXDmyuJAscXZICSoCefc
         kfNclBMQnIUY/byKelKOI6P+6EiqkQuex+z/yDC3shcbPZn3WMycsGc1sMEwtsRYIYJk
         C/38LRhns64qVDg381vmjCfY30wH19emVODRRXD3WPCW8zpOztPWQ9ttFB3T8lBgXxvM
         rrBN9QxcXZNaWiVN6QNtFIOrTOCXXMI7Zf1hCqw4NZ/ElcohPCJzqWo7v/oniEMJhSgz
         xB4byAADPxV4phHlrfgusQPbwfoy5itked2wikRPOKznVlWa8eBM5xwAovG9y9mAbbqz
         uw1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q5g+tj/yKi8alTc9Rxu5SEVWr3VUBDIneqMcER2WZKw=;
        b=2yeCRdconE1s+f0CbLEJYOhin6Zp2EuV1EOoC/oj/LtMy9a6Nz76ACTtkNZt3Ke7C5
         SR8Hc/32LBgx4Q35fCJv4HOhC6mRS+F0in4WTjVyb4jn+AJ3jOq1XBV0RM0ka3bLA+vy
         x5bdQJrfAsbBgCFUJGeuOJ9//g8rVnEAOrTGjFmyh5h4Q3RR0CrkQ114IVaA4SJpCuqG
         jB5p0H9DdWxBkXfeaGkGM5sH7w6LgqPa9Atg8zxyYWolMEoKwnG1nXdZfzytvIuiahhj
         HNZL0AZs+jwNLcvl2CF9t//1/a8EaFnm2Is3fmU9XUelT+DyWOt59vgviMISHLkGMJLY
         dwfA==
X-Gm-Message-State: ANoB5pllSWhGlscn47WmCMEpJlvELv66hkqG+VdhxSYRPOuSggCkToHS
	rqmGfgROP/hB9HiRAVurfss=
X-Google-Smtp-Source: AA0mqf6FY88K6axRN8AyDkDfoFh75Jd16MnoFtU3D39r8k3m8ERoJwtVTeqU0hzVFmCAj/WcXvMAkw==
X-Received: by 2002:a17:902:8b89:b0:188:77a7:eb4 with SMTP id ay9-20020a1709028b8900b0018877a70eb4mr36684185plb.32.1669714858348;
        Tue, 29 Nov 2022 01:40:58 -0800 (PST)
Received: from localhost (193-116-112-94.tpgi.com.au. [193.116.112.94])
        by smtp.gmail.com with ESMTPSA id u13-20020a170902e80d00b00189947bd9f7sm2263658plg.50.2022.11.29.01.40.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Nov 2022 01:40:57 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Nov 2022 19:40:53 +1000
Message-Id: <COOOIMD7QY99.Z9IEKFIG9P44@bobo>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Rohan McLure" <rmclure@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v4 2/7] powerpc/64: Add interrupt register sanitisation
 macros
X-Mailer: aerc 0.13.0
References: <20221129044354.1836018-1-rmclure@linux.ibm.com>
 <20221129044354.1836018-2-rmclure@linux.ibm.com>
In-Reply-To: <20221129044354.1836018-2-rmclure@linux.ibm.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue Nov 29, 2022 at 2:43 PM AEST, Rohan McLure wrote:
> Include in asm/ppc_asm.h macros to be used in multiple successive
> patches to implement zeroising architected registers in interrupt
> handlers. Registers will be sanitised in this fashion in future patches
> to reduce the speculation influence of user-controlled register values.
> These mitigations will be configurable through the
> CONFIG_INTERRUPT_SANITIZE_REGISTERS Kconfig option.
>
> Included are macros for conditionally zeroising registers and restoring
> as required with the mitigation enabled. With the mitigation disabled,
> non-volatiles must be restored on demand at separate locations to
> those required by the mitigation.
>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>

Thanks. You might just call them SANITIZE_NVGPRS() etc if it's not
functionally important that they're zero. But I don't mind long names
too much.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> ---
> v4: New patch
> ---
>  arch/powerpc/include/asm/ppc_asm.h | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/as=
m/ppc_asm.h
> index 753a2757bcd4..272b2795c36a 100644
> --- a/arch/powerpc/include/asm/ppc_asm.h
> +++ b/arch/powerpc/include/asm/ppc_asm.h
> @@ -74,6 +74,23 @@
>  #define SAVE_GPR(n, base)		SAVE_GPRS(n, n, base)
>  #define REST_GPR(n, base)		REST_GPRS(n, n, base)
> =20
> +/* macros for handling user register sanitisation */
> +#ifdef CONFIG_INTERRUPT_SANITIZE_REGISTERS
> +#define SANITIZE_ZEROIZE_SYSCALL_GPRS()		ZEROIZE_GPR(0);		\
> +						ZEROIZE_GPRS(5, 12);	\
> +						ZEROIZE_NVGPRS()
> +#define SANITIZE_ZEROIZE_INTERRUPT_NVGPRS()	ZEROIZE_NVGPRS()
> +#define SANITIZE_ZEROIZE_NVGPRS()		ZEROIZE_NVGPRS()
> +#define SANITIZE_RESTORE_NVGPRS()		REST_NVGPRS(r1)
> +#define HANDLER_RESTORE_NVGPRS()
> +#else
> +#define SANITIZE_ZEROIZE_INTERRUPT_NVGPRS()
> +#define SANITIZE_ZEROIZE_SYSCALL_GPRS()
> +#define SANITIZE_ZEROIZE_NVGPRS()
> +#define SANITIZE_RESTORE_NVGPRS()
> +#define HANDLER_RESTORE_NVGPRS()		REST_NVGPRS(r1)
> +#endif /* CONFIG_INTERRUPT_SANITIZE_REGISTERS */
> +
>  #define SAVE_FPR(n, base)	stfd	n,8*TS_FPRWIDTH*(n)(base)
>  #define SAVE_2FPRS(n, base)	SAVE_FPR(n, base); SAVE_FPR(n+1, base)
>  #define SAVE_4FPRS(n, base)	SAVE_2FPRS(n, base); SAVE_2FPRS(n+2, base)
> --=20
> 2.37.2

