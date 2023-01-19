Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF85672DFC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 02:18:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ny4X6619Pz3fDQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 12:18:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=O5M4vcD4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=O5M4vcD4;
	dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ny4WC5PfKz30CT
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jan 2023 12:17:58 +1100 (AEDT)
Received: by mail-pf1-x42b.google.com with SMTP id w2so321118pfc.11
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 17:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4qvSylj76pkjJK0liJzUPIoE16nX8cS6scNFJeg8uss=;
        b=O5M4vcD4Xd6NlKslWlR4eDnUdGeq4ovEo0+vMwvb8XIHogfL5rfP//GQVWFgt0mgPc
         XwQMTdggmDrbYWl8JeTk/1F6Mi6UqPGZnNI3rntnGaCNPozvnQtZ4HlkUiFERuAQuI63
         Gb5gS6Wl2ASjTAG78Ihvrr68wo6jDgXUXcSsdvVQV1N7F3lXMOU05hhGJqBGGocXOeGj
         5ohvftx7sulbxTkM7Mn3JYO5SqNFn828fTp1wgY9F4fin1E710xq6p1fPpgc3HvJQYv6
         TZ7AQPl5H+nEV/KsWXOx3eeMDME++GtVAyJ0Ra/ns1LPxdxnxQvsFOnBW+Cvdbj5Fdve
         1D+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4qvSylj76pkjJK0liJzUPIoE16nX8cS6scNFJeg8uss=;
        b=Ghwl/Z7DZas2sUGjPcZ0e7uKVmPoa9oc8Bqa4tZXE+ShmkiDDIliSdQNLspEugs2TH
         JHTWMgUON7aEj4DH9FH/X8YunHmWLQH4d3WiA2NmJR+9w1umRzrIbaCVNAiRJeqq1Hew
         jpyCKSfGwOfl8r+TZe5L9QMmcj5vvHYHo1/xOdcaM2jVYDsPptP5G6Ts/X6Lhs1FsVcY
         H0+r/3TqIQpgR46QSDEe6dwgSHGA+CBzgqMty9CpCBEiMU0v0WwzdxqIXh0T5BHH25pZ
         nd+yMGiU1yTqTiihssBW4Hvy1onT5fKQ6htplJXjYv7cVL6woB8nzaVbJTeh2/+ecWHB
         aB0w==
X-Gm-Message-State: AFqh2koEJDQ8mN79cLh7ilDqjh8HlWKp+cdgrvQ2+mWgPahcawf8yYT+
	ZjxxfGWVulehydyjLx0+IEYLDdyK7Cw=
X-Google-Smtp-Source: AMrXdXvuftfAEVkHFKNo/wDV5xp7EjIbGUCEj2qZ0VaidNV7nooG4/Xwhn7ZX3U38U3XBhaAHwkioA==
X-Received: by 2002:aa7:9399:0:b0:58d:272a:52a0 with SMTP id t25-20020aa79399000000b0058d272a52a0mr8120300pfe.32.1674091076111;
        Wed, 18 Jan 2023 17:17:56 -0800 (PST)
Received: from localhost (193-116-102-45.tpgi.com.au. [193.116.102.45])
        by smtp.gmail.com with ESMTPSA id f24-20020aa79698000000b0058bc60dd98dsm8788019pfk.23.2023.01.18.17.17.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 17:17:55 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Jan 2023 11:17:49 +1000
Message-Id: <CPVRR82TD4YN.2330YD9C5FHMQ@bobo>
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
>  };
> =20
>  #ifdef CONFIG_PPC_SECURE_BOOT
> diff --git a/arch/powerpc/kernel/secvar-sysfs.c b/arch/powerpc/kernel/sec=
var-sysfs.c
> index 462cacc0ca60..d3858eedd72c 100644
> --- a/arch/powerpc/kernel/secvar-sysfs.c
> +++ b/arch/powerpc/kernel/secvar-sysfs.c
> @@ -21,26 +21,13 @@ static struct kset *secvar_kset;
>  static ssize_t format_show(struct kobject *kobj, struct kobj_attribute *=
attr,
>  			   char *buf)
>  {
> -	ssize_t rc =3D 0;
> -	struct device_node *node;
> -	const char *format;
> -
> -	node =3D of_find_compatible_node(NULL, NULL, "ibm,secvar-backend");
> -	if (!of_device_is_available(node)) {
> -		rc =3D -ENODEV;
> -		goto out;
> -	}
> +	char tmp[SECVAR_MAX_FORMAT_LEN];
> +	ssize_t len =3D secvar_ops->format(tmp);
> =20
> -	rc =3D of_property_read_string(node, "format", &format);
> -	if (rc)
> -		goto out;
> +	if (len <=3D 0)
> +		return -EIO;

AFAIKS this does have a functional change, it loses the return value.
Why not return len if it is < 0, and -EIO if len =3D=3D 0?

Thanks,
Nick
