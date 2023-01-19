Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8459E672DD9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 02:12:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ny4NH1vnCz3fCq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 12:11:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=phIf6/oV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=phIf6/oV;
	dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ny4MK46n7z30DC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jan 2023 12:11:08 +1100 (AEDT)
Received: by mail-pj1-x1035.google.com with SMTP id s13-20020a17090a6e4d00b0022900843652so4334932pjm.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 17:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4a6gTHxnHocG3EOjYSvHjeImOH2TijHK1E3d9yPNEYQ=;
        b=phIf6/oVhIVYz4XdxQX6EJsCbt+WRAp+joMADi1BqdUXnenACCmvM2II1ts8tHedta
         IDVO7pOgGIdscv/FK7t7kuYHQP0eeD0MORf/nB+fvdPcBBaDPw/ESCWVqOifC05Tp1JK
         YU4F2vxmLV+QRAzlMoFVFvG61YOlBVnVR1tcPpzwgMWfdWIgVd/DPGjhQm3XTs1QEgv0
         S6g5EWoFMlwRDC4ZB8AsZkShd5wRa+xaSEBLvTtbH8HQHfVj5zFrT4JCrddUKED36PDS
         qvnjAFHJrEybbbXwEvkl3liIBAw/jN1EyGaCxAbn/m/f33Nq3i4s+r0FGjSkykMDrpN4
         CRyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4a6gTHxnHocG3EOjYSvHjeImOH2TijHK1E3d9yPNEYQ=;
        b=ndF4Kt8g5AQZSwp4zttVfXdJZl3QN9GRbNstNFwpT4sXoVJwBURgmEpT6IJkA6b4vw
         b6YIRnl+LQncga3Xv9mdO+d+KdUqFRamF4RuNd1vEVvD0WO1tKvSuoZRL4X2QxZmabkg
         elDQGkxKCwDfrpKaXFJX/NsKaUxhXgYPoLamq+hIFzYG6tpHSgr3/yNkG1twjpisw2bU
         HpCEm5VhDevkyui7NgjaebcPtCbEA0rxzvEV0ue0f0UsCxafmtCpKBGnqoavf4VsepRd
         UZSumaCaD+Pd7zrrZmZLRM0JI/6S6GvKSHWKHVIEE/10jcwgN0QS4KijiXg2Q4xdrw5d
         n6jQ==
X-Gm-Message-State: AFqh2krtlTlQ/+AnmChioyZpauEcyX6q7KRU2jyH67+XAiS4fkt0+/BL
	HGfqWzqqfKESOqoZsJVh4mg=
X-Google-Smtp-Source: AMrXdXuEr0AenQQTGRZxGOq8GuW0YuV9eCnOjJcK3F9GgIwX5FOJ0fljJqUR5ShuuHuaNrrsEqyxgQ==
X-Received: by 2002:a17:902:e5d2:b0:191:3808:14b0 with SMTP id u18-20020a170902e5d200b00191380814b0mr12887306plf.4.1674090666075;
        Wed, 18 Jan 2023 17:11:06 -0800 (PST)
Received: from localhost (193-116-102-45.tpgi.com.au. [193.116.102.45])
        by smtp.gmail.com with ESMTPSA id q13-20020a170902a3cd00b0018911ae9dfasm23675468plb.232.2023.01.18.17.11.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 17:11:05 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Jan 2023 11:10:58 +1000
Message-Id: <CPVRLZNI6WWQ.1AZVH3NCPCOYL@bobo>
Subject: Re: [PATCH v3 08/24] powerpc/secvar: Allow backend to populate
 static list of variable names
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Andrew Donnellan" <ajd@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-integrity@vger.kernel.org>
X-Mailer: aerc 0.13.0
References: <20230118061049.1006141-1-ajd@linux.ibm.com>
 <20230118061049.1006141-9-ajd@linux.ibm.com>
In-Reply-To: <20230118061049.1006141-9-ajd@linux.ibm.com>
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
> Currently, the list of variables is populated by calling
> secvar_ops->get_next() repeatedly, which is explicitly modelled on the
> OPAL API (including the keylen parameter).
>
> For the upcoming PLPKS backend, we have a static list of variable names.
> It is messy to fit that into get_next(), so instead, let the backend put
> a NULL-terminated array of variable names into secvar_ops->var_names,
> which will be used if get_next() is undefined.
>
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
> Signed-off-by: Russell Currey <ruscur@russell.cc>
>
> ---
>
> v3: New patch (ajd/mpe)
> ---
>  arch/powerpc/include/asm/secvar.h  |  4 ++
>  arch/powerpc/kernel/secvar-sysfs.c | 67 ++++++++++++++++++++----------
>  2 files changed, 50 insertions(+), 21 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/secvar.h b/arch/powerpc/include/asm=
/secvar.h
> index ebf95386d720..c8bee1834b54 100644
> --- a/arch/powerpc/include/asm/secvar.h
> +++ b/arch/powerpc/include/asm/secvar.h
> @@ -23,6 +23,10 @@ struct secvar_operations {
>  	ssize_t (*format)(char *buf);
>  	int (*max_size)(u64 *max_size);
>  	const struct attribute **config_attrs;
> +
> +	// NULL-terminated array of fixed variable names
> +	// Only used if get_next() isn't provided
> +	const char * const *var_names;

The other way you could go is provide a sysfs_init() ops call here,
and export the add_var as a library function that backends can use.

Thanks,
Nick
