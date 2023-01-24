Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3803C678F52
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 05:37:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P1Dhn0JSPz3c9V
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 15:37:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=W90qqbnL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=W90qqbnL;
	dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P1Dgp41qDz30RT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jan 2023 15:36:21 +1100 (AEDT)
Received: by mail-pj1-x102b.google.com with SMTP id lp10so10240179pjb.4
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jan 2023 20:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b8U31/JHK1SijUo9KNZPEWC0iXAuh3371iOKZ7pi7Bc=;
        b=W90qqbnL3dTHE2ye/e6FMaljY7HETG1lSjyj160P0TbMDriUzz1kKpEUmWDtWz4oEr
         wqi/vc9+WGKslLj1ar75bAKzXBjdBif4nE5AJIzEpCctiaurnH5iWGnjP0RZYNR/SEt3
         6PbuLYKU8VN0Coi0k29d/ZFZw8XQCf0fGBtaFrMj8SPawzghG/OTOCxz8MLe+zk3pJcq
         HusQm34LkSMgestXlQnlUjyix3VGKm5bTZo8ESfyXzK5hWB2VJQwEYl0QSgvnfff5SkN
         YEwLeMs2CZ7T6eE3EJdfZS8ak2uSeb931u3a9sQ9/x5/JZieGfr0czCT8JQZ8zOU3GwJ
         Y6+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b8U31/JHK1SijUo9KNZPEWC0iXAuh3371iOKZ7pi7Bc=;
        b=sMm9q8TpJMGKOKmRP/i1+m+4YvFHSO51B5HxtcfYz9qxdWJFB97X3KJwCYtOmE9DeC
         e/diNKknKAP3oZc4wLWFpzsG4Yof3jXmJGiYu+rqRRsNPkeX3ycpK2j9FiT16bq6Unmc
         OFc9VlnLKbMlkBP3hR97cCqk1o9hUbp7GGKngxFJj+sdoA8M1JGccTHxP9eot6xaCMNp
         q8OcJwvaiiBnOW5CKpY2HC85JuSJK2J8Xf0oX0Vgc4WVdihqXfvulUnmniNfCkxDIPTY
         +/1NXN4jzf/oHHCGh6h0rviU1sE2Q1kS0DFgGwjOUmpr9OvzEQynfiM889TPtrLy1pIr
         WYPQ==
X-Gm-Message-State: AFqh2kp3PfwdvqVwRh249Dx5G/EDC0O5sdTedhz5I97FWBrKShTzB9Cg
	G1ddo1H0lXamSwUm0ez923I=
X-Google-Smtp-Source: AMrXdXuD6RDsupccsQ917UGoQ9sV7IX7GmlnFerU/q/bSmCF+jS1YWw4T/NrOM9TzeECVLYeCUIWYA==
X-Received: by 2002:a17:902:f2c5:b0:194:b745:5eaf with SMTP id h5-20020a170902f2c500b00194b7455eafmr20974064plc.42.1674534978795;
        Mon, 23 Jan 2023 20:36:18 -0800 (PST)
Received: from localhost (121-44-64-35.tpgi.com.au. [121.44.64.35])
        by smtp.gmail.com with ESMTPSA id c1-20020a170902aa4100b001960441f604sm520307plr.277.2023.01.23.20.36.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 20:36:18 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Jan 2023 14:36:11 +1000
Message-Id: <CQ053TUZQIPP.1OHV7MVS4F4HT@bobo>
To: "Andrew Donnellan" <ajd@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-integrity@vger.kernel.org>
Subject: Re: [PATCH v4 21/24] powerpc/pseries: Pass PLPKS password on kexec
From: "Nicholas Piggin" <npiggin@gmail.com>
X-Mailer: aerc 0.13.0
References: <20230120074306.1326298-1-ajd@linux.ibm.com>
 <20230120074306.1326298-22-ajd@linux.ibm.com>
In-Reply-To: <20230120074306.1326298-22-ajd@linux.ibm.com>
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
Cc: gjoyce@linux.ibm.com, erichte@linux.ibm.com, gregkh@linuxfoundation.org, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, zohar@linux.ibm.com, sudhakar@linux.ibm.com, ruscur@russell.cc, joel@jms.id.au, bgray@linux.ibm.com, gcwilson@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri Jan 20, 2023 at 5:43 PM AEST, Andrew Donnellan wrote:
> From: Russell Currey <ruscur@russell.cc>
>
> Before interacting with the PLPKS, we ask the hypervisor to generate a
> password for the current boot, which is then required for most further
> PLPKS operations.
>
> If we kexec into a new kernel, the new kernel will try and fail to
> generate a new password, as the password has already been set.
>
> Pass the password through to the new kernel via the device tree, in
> /chosen/plpks-pw. Check for the presence of this property before trying

In /chosen/ibm,plpks-pw

> to generate a new password - if it exists, use the existing password and
> remove it from the device tree.
>
> Signed-off-by: Russell Currey <ruscur@russell.cc>
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
>
> ---
>
> v3: New patch
>
> v4: Fix compile when CONFIG_PSERIES_PLPKS=3Dn (snowpatch)
>
>     Fix error handling on fdt_path_offset() call (ruscur)
> ---
>  arch/powerpc/kexec/file_load_64.c      | 18 ++++++++++++++++++
>  arch/powerpc/platforms/pseries/plpks.c | 18 +++++++++++++++++-
>  2 files changed, 35 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_=
load_64.c
> index af8854f9eae3..0c9130af60cc 100644
> --- a/arch/powerpc/kexec/file_load_64.c
> +++ b/arch/powerpc/kexec/file_load_64.c
> @@ -27,6 +27,7 @@
>  #include <asm/kexec_ranges.h>
>  #include <asm/crashdump-ppc64.h>
>  #include <asm/prom.h>
> +#include <asm/plpks.h>
> =20
>  struct umem_info {
>  	u64 *buf;		/* data buffer for usable-memory property */
> @@ -1156,6 +1157,9 @@ int setup_new_fdt_ppc64(const struct kimage *image,=
 void *fdt,
>  {
>  	struct crash_mem *umem =3D NULL, *rmem =3D NULL;
>  	int i, nr_ranges, ret;
> +#ifdef CONFIG_PSERIES_PLPKS
> +	int chosen_offset;
> +#endif

Could put this in plpks_is_available and avoid an ifdef.

> =20
>  	/*
>  	 * Restrict memory usage for kdump kernel by setting up
> @@ -1230,6 +1234,20 @@ int setup_new_fdt_ppc64(const struct kimage *image=
, void *fdt,
>  		}
>  	}
> =20
> +#ifdef CONFIG_PSERIES_PLPKS
> +	// If we have PLPKS active, we need to provide the password
> +	if (plpks_is_available()) {
> +		chosen_offset =3D fdt_path_offset(fdt, "/chosen");
> +		if (chosen_offset < 0) {
> +			pr_err("Can't find chosen node: %s\n",
> +			       fdt_strerror(chosen_offset));
> +			goto out;
> +		}
> +		ret =3D fdt_setprop(fdt, chosen_offset, "ibm,plpks-pw",
> +				  plpks_get_password(), plpks_get_passwordlen());
> +	}
> +#endif // CONFIG_PSERIES_PLPKS

I think if you define plpks_get_password and plpks_get_passwordlen as
BUILD_BUG_ON when PLPKS is not configured and plpks_is_available as
false, you could remove the ifdef entirely.

> +
>  out:
>  	kfree(rmem);
>  	kfree(umem);
> diff --git a/arch/powerpc/platforms/pseries/plpks.c b/arch/powerpc/platfo=
rms/pseries/plpks.c
> index b3c7410a4f13..0350f10e1755 100644
> --- a/arch/powerpc/platforms/pseries/plpks.c
> +++ b/arch/powerpc/platforms/pseries/plpks.c
> @@ -16,6 +16,7 @@
>  #include <linux/slab.h>
>  #include <linux/string.h>
>  #include <linux/types.h>
> +#include <linux/of.h>
>  #include <asm/hvcall.h>
>  #include <asm/machdep.h>
>  #include <asm/plpks.h>
> @@ -126,7 +127,22 @@ static int plpks_gen_password(void)
>  {
>  	unsigned long retbuf[PLPAR_HCALL_BUFSIZE] =3D { 0 };
>  	u8 *password, consumer =3D PLPKS_OS_OWNER;
> -	int rc;
> +	struct property *prop;
> +	int rc, len;
> +
> +	// Before we generate the password, we may have been booted by kexec an=
d
> +	// provided with a previous password.  Check for that first.

So not really generating the password then. Should it be in a different
function the caller makes first?

> +	prop =3D of_find_property(of_chosen, "ibm,plpks-pw", &len);
> +	if (prop) {
> +		ospasswordlength =3D (u16)len;
> +		ospassword =3D kzalloc(ospasswordlength, GFP_KERNEL);
> +		if (!ospassword) {
> +			of_remove_property(of_chosen, prop);
> +			return -ENOMEM;
> +		}
> +		memcpy(ospassword, prop->value, len);
> +		return of_remove_property(of_chosen, prop);

Why do you remove the property afterward?

Thanks,
Nick
