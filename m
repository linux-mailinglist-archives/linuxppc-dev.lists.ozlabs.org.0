Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 222C9672DCA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 02:00:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ny46j09Zsz3ch7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 12:00:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gz85+iNW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gz85+iNW;
	dkim-atps=neutral
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ny45n1wKJz3000
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jan 2023 11:59:23 +1100 (AEDT)
Received: by mail-pg1-x52d.google.com with SMTP id s67so307524pgs.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 16:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JU+eYoCUYw7OUrQ34xBj/dGRvIDzcpEGZXWLrE7d4zs=;
        b=gz85+iNW2Y3eSbshAzxzfhFFiBk15RBYYo/Ta22Cx4vNnkGWBnv61NxZF0xrGZP/fd
         LaA+Uf5VWLMzLkiJwEDaP+bh/zwItSGvisR/Thh89Far9EXZssVWqeAuRqKLyJDhEbsS
         0hKFQw82MizFDTA6gDKiyiDOV8HssxWG11Fpukyy+wzf1SYfVnThV1z0P09wr6ipx1ay
         Npfy77cwwQ0eVt3CVdE5V+dLlYjXpFFF2wZE6VS6drERmj0Q0+PTz2kCBZww/gkVSAdQ
         Q+zi/+JSxaCsY/rnBk+T4KC9GpATG5f/5XlGEWFkk6KWqlwFAxPAWCAVAONGF2ADFCJc
         tRXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JU+eYoCUYw7OUrQ34xBj/dGRvIDzcpEGZXWLrE7d4zs=;
        b=Lps9z/D+HMWPXfTmGP1iVsEMwRVHlIpv4Ep1J1zIiCKw4GkW3Ia4yr08oyskJqq5XN
         MgcFtEwDN8kJgskNbEz+bec4DrhC90yF6DImcjSTNpxTzbkf8fioQJTyEOilpHPYhrMA
         NIQEdoS+r57sUrRhtW7tdWb0GEfuz4iMulEK920TGazjSTKxst5EN+ZSp4VX8ShYeOfh
         joHG730rl5uRK4g4tYgnkLYTo/zRfIgDwIW3jxxJcT2P2LWGGJBXSPTalgh60w0s5AJw
         AdBL2tRQBE7deymE14wjRyFH3aUmdVTURO1iW+p9D13a1IDY7ntB8QB47HtqFxBkQ7n6
         RW5A==
X-Gm-Message-State: AFqh2kp79OSrehO1LnJci8xxmEsso70d8t6zWOqvgJRj7dqh1sBW00Ry
	JgUJAsyejeE4hwVKZ1x55PE=
X-Google-Smtp-Source: AMrXdXucjHz8FZFT/NIriPu9GE/0b4TrRV4+MCEE7H0qbs59fRDHyGXP1sClacAUrp2o7QCsUMenpg==
X-Received: by 2002:a05:6a00:4207:b0:580:eeae:e4ba with SMTP id cd7-20020a056a00420700b00580eeaee4bamr10242724pfb.4.1674089960161;
        Wed, 18 Jan 2023 16:59:20 -0800 (PST)
Received: from localhost (193-116-102-45.tpgi.com.au. [193.116.102.45])
        by smtp.gmail.com with ESMTPSA id 134-20020a62148c000000b0056bc30e618dsm22728931pfu.38.2023.01.18.16.59.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 16:59:19 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Jan 2023 10:59:12 +1000
Message-Id: <CPVRCZ8Z84K4.337F5K1N7RCRS@bobo>
To: "Andrew Donnellan" <ajd@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-integrity@vger.kernel.org>
Subject: Re: [PATCH v3 02/24] powerpc/secvar: WARN_ON_ONCE() if multiple
 secvar ops are set
From: "Nicholas Piggin" <npiggin@gmail.com>
X-Mailer: aerc 0.13.0
References: <20230118061049.1006141-1-ajd@linux.ibm.com>
 <20230118061049.1006141-3-ajd@linux.ibm.com>
In-Reply-To: <20230118061049.1006141-3-ajd@linux.ibm.com>
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
> The secvar code only supports one consumer at a time.
>
> Multiple consumers aren't possible at this point in time, but we'd want
> it to be obvious if it ever could happen.
>
> Signed-off-by: Russell Currey <ruscur@russell.cc>
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
> ---
>  arch/powerpc/kernel/secvar-ops.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/kernel/secvar-ops.c b/arch/powerpc/kernel/secva=
r-ops.c
> index 6a29777d6a2d..aa1b2adc2710 100644
> --- a/arch/powerpc/kernel/secvar-ops.c
> +++ b/arch/powerpc/kernel/secvar-ops.c
> @@ -8,10 +8,12 @@
> =20
>  #include <linux/cache.h>
>  #include <asm/secvar.h>
> +#include <asm/bug.h>
> =20
> -const struct secvar_operations *secvar_ops __ro_after_init;
> +const struct secvar_operations *secvar_ops __ro_after_init =3D NULL;
> =20
>  void set_secvar_ops(const struct secvar_operations *ops)
>  {
> +	WARN_ON_ONCE(secvar_ops);
>  	secvar_ops =3D ops;

You could make it return error here and two line patch in the caller to
handle the error and then things wouldn't get corrupted.

Thanks,
Nick
