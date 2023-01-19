Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA4C672DCE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 02:03:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ny4BZ4dDxz3c6V
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 12:03:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=AYtPSQ8/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=AYtPSQ8/;
	dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ny49g07Mfz3000
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jan 2023 12:02:46 +1100 (AEDT)
Received: by mail-pj1-x102e.google.com with SMTP id z4-20020a17090a170400b00226d331390cso297264pjd.5
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 17:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bzC0sU/N12ncEGDzD9fPcibOi5DmMLZMi0fdgF9XEqw=;
        b=AYtPSQ8/l89DagqqXtQI6yiVXSzsTcUBaQiMk2f1jiZyJ5ELiIGB0pZLTJnp8amdI2
         E9USP8ckmgFNAtbnEoOYYEmnUi5knwgQiQIsu+XBK87SrVt3G4Z7NEK00vhQjdlc4uAe
         cUWuQ9+EIWNEUEecO15jMDjh7K8C3W/p/vLOToGoVZwCyALXyYsxihbAnAW9nkojB1jD
         W4PyN1pMYXFeHmI2ySiO/3SOQnFtrWf3y7kddaOhygH3d8MNWuA//hY+i/Lb0SZ6YloL
         AS9FQBWer3V6rNXX0e0CrLQATvoZgKgHf3OyQiHAf0umnVjJScE+CMG+PuftHWcDfxSI
         KSeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bzC0sU/N12ncEGDzD9fPcibOi5DmMLZMi0fdgF9XEqw=;
        b=0oAWajLQhvd9yPFALMAFUTtG9We36OP1luqI5N71AgOSgjzr68K5zWSps06ciHHyAA
         ry9VuvJbSHrE/3TJf6p+gjC3NkvHv0qqI1tqyKK/OI5Tj/+tHGpP1MAqSmXhReTt5sgh
         S4Q4Mf7PRxJiXKUdSDcZAB8GUfkUV+dWTkVTtReQkTA/xRM7kIzGHNKqtbG+cShFXfz3
         N5ZSOC5vMR/DHvVnS0txqS1g6QqhayiHqRRSBqW91ryM5EXLfl1BheIl7M7WXQVHdmcH
         fqvgzszhzu4Vf/ruNaqt8dsZQ8guF59goiVTRkg7dacE5lxrigcYWB1UTgmbr9rpJVF5
         gNGg==
X-Gm-Message-State: AFqh2krZw8apir/dtUOrQd1i5S/IOneSHMhPO94TN+TFfqHsDxp6raeH
	E3ohreoOe7Fj40RwLTTQllkZsX/k+fo=
X-Google-Smtp-Source: AMrXdXt4gseTnAfOPrChP9m2wVf26VWcohagyq74svl8eO9K6vlv12wRtzJHCZkfmem+ShkJYon6sA==
X-Received: by 2002:a05:6a20:ba87:b0:af:8e92:3eeb with SMTP id fb7-20020a056a20ba8700b000af8e923eebmr9175136pzb.9.1674090163920;
        Wed, 18 Jan 2023 17:02:43 -0800 (PST)
Received: from localhost (193-116-102-45.tpgi.com.au. [193.116.102.45])
        by smtp.gmail.com with ESMTPSA id e3-20020a63f543000000b004cd2eebc551sm5414418pgk.62.2023.01.18.17.02.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 17:02:43 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Jan 2023 11:02:36 +1000
Message-Id: <CPVRFKZUFEFE.3IPS9CFR9KPD6@bobo>
Subject: Re: [PATCH v3 04/24] powerpc/secvar: Handle format string in the
 consumer
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Andrew Donnellan" <ajd@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-integrity@vger.kernel.org>
X-Mailer: aerc 0.13.0
References: <20230118061049.1006141-1-ajd@linux.ibm.com>
 <20230118061049.1006141-5-ajd@linux.ibm.com>
In-Reply-To: <20230118061049.1006141-5-ajd@linux.ibm.com>
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
> From: Russell Currey <ruscur@russell.cc>
>
> The code that handles the format string in secvar-sysfs.c is entirely
> OPAL specific, so create a new "format" op in secvar_operations to make
> the secvar code more generic.  No functional change.
>
> Signed-off-by: Russell Currey <ruscur@russell.cc>
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
>
> ---
>
> v2: Use sysfs_emit() instead of sprintf() (gregkh)
>
> v3: Enforce format string size limit (ruscur)
> ---
>  arch/powerpc/include/asm/secvar.h            |  3 +++
>  arch/powerpc/kernel/secvar-sysfs.c           | 23 ++++--------------
>  arch/powerpc/platforms/powernv/opal-secvar.c | 25 ++++++++++++++++++++
>  3 files changed, 33 insertions(+), 18 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/secvar.h b/arch/powerpc/include/asm=
/secvar.h
> index 07ba36f868a7..8b6475589120 100644
> --- a/arch/powerpc/include/asm/secvar.h
> +++ b/arch/powerpc/include/asm/secvar.h
> @@ -11,12 +11,15 @@
>  #include <linux/types.h>
>  #include <linux/errno.h>
> =20
> +#define SECVAR_MAX_FORMAT_LEN	30 // max length of string returned by ->f=
ormat()
> +
>  extern const struct secvar_operations *secvar_ops;
> =20
>  struct secvar_operations {
>  	int (*get)(const char *key, u64 key_len, u8 *data, u64 *data_size);
>  	int (*get_next)(const char *key, u64 *key_len, u64 keybufsize);
>  	int (*set)(const char *key, u64 key_len, u8 *data, u64 data_size);
> +	ssize_t (*format)(char *buf);

Maybe pass the buf size as an argument here? Which is a bit less error
prone and more flexible than finding the right #define for it.

Thanks,
Nick
