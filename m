Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A1A67DF9A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 10:00:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P3BPd10Y4z3fK5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 20:00:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WVav3P/B;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::30; helo=mail-oa1-x30.google.com; envelope-from=leobras.c@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WVav3P/B;
	dkim-atps=neutral
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com [IPv6:2001:4860:4864:20::30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P3BNj61Rpz3bk8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 20:00:03 +1100 (AEDT)
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-15f64f2791dso5618020fac.7
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 01:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=v2hSS8RRNEiKdXNBkoxjOlqOIzTHsfUutd2F8KxRjVc=;
        b=WVav3P/BvZwERU61cqc+7WHLADxXI6Tj/8iSeHsbhXgEBenzqZfMA2OUsIrJqHgBO3
         tJX0kaY3lVVp69kxaCKuAStXjnE8aa3byUFIWDBAwHZLF502pb5/vjbCRsSgcr1l9lMO
         NMwxf9XmbOJLjgKtXdgeQ5OTcuVfP+R6jBzvHR4x5P92BuF+0e76jDE+O7JLvg1WiVOo
         9nIrRwlBiftTcCDT0J///SDIAoMeyHLDRIoCT4heiUt5NPg1w/OJb31ahWZqzCeynNTS
         ryl2vqbWClwoW2t6RCdEIYJGY7eIyAHE3SIgC4znxi+F8efCPt3wQmzKXfF1xIuXhr70
         61oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v2hSS8RRNEiKdXNBkoxjOlqOIzTHsfUutd2F8KxRjVc=;
        b=fm+UCPjx2HaKMw0wj3m0orGH9zzlmUnVWZLDwl64Qp926YvYdEiXr5d4umJWlXVc5Q
         EfFHYMcRuEELGaVIz6IXtuGaVWX1YaTA9IFi2El2OyWnQ3+8JlSIguxXQ+VJLBFmkSvR
         EfGfWVH9wnfdMQhHv1g+724777URtqMt2fb/q2qOtefc7h3mREM9b4NenqTbDrNehEpQ
         U5H++ZMI20ftkhpfEd2Ub6l1fhoVVEM5vFs/l1S4jeWQSNsdvBeCsHucuIZ3K0rMZjLt
         vn3FFLZly14bfZghBzIzBeZG/S83XRhuexMgZBRpkMZXDKI88NDBFeAGurfulmHYrxWg
         YXyg==
X-Gm-Message-State: AO0yUKUn8Q4EXlyJoSqOKcdMWjEVZAiScBKrRWYSJRdO2vMtuFDs1EjD
	p7TsB81viSsZWqBNY5vhrcfj23EVm6Y=
X-Google-Smtp-Source: AK7set/Oq/TjWQdc/27dKCTsZKI2wNCpnXcEMh20i3ydhU6PDEL1mXztICP70raZMnAJsFQIeTWfKg==
X-Received: by 2002:a05:6870:c08f:b0:163:6d5d:5125 with SMTP id c15-20020a056870c08f00b001636d5d5125mr773029oad.19.1674810000160;
        Fri, 27 Jan 2023 01:00:00 -0800 (PST)
Received: from ?IPv6:2804:1b3:a800:6912:c477:c73a:cf7c:3a27? ([2804:1b3:a800:6912:c477:c73a:cf7c:3a27])
        by smtp.gmail.com with ESMTPSA id w19-20020a9d77d3000000b00661b46cc26bsm1519319otl.9.2023.01.27.00.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 00:59:59 -0800 (PST)
Message-ID: <190942891d616be7fcc3f5c5ed41f035f29c4521.camel@gmail.com>
Subject: Re: [PATCH] powerpc/rtas: Replace one-element arrays with flexible
 arrays
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Fri, 27 Jan 2023 05:59:56 -0300
In-Reply-To: <20230127085023.271674-1-ajd@linux.ibm.com>
References: <20230127085023.271674-1-ajd@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.2 
MIME-Version: 1.0
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linux-hardening@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2023-01-27 at 19:50 +1100, Andrew Donnellan wrote:
> Using a one-element array as a fake flexible array is deprecated.
>=20
> Replace the one-element flexible arrays in rtas-types.h with C99 standard
> flexible array members instead.
>=20
> This helps us move towards enabling -fstrict-flex-arrays=3D3 in future.
>=20
> Found using scripts/coccinelle/misc/flexible_array.cocci.
>=20
> Cc: Nathan Lynch <nathanl@linux.ibm.com>
> Cc: Leonardo Bras <leobras.c@gmail.com>
> Cc: linux-hardening@vger.kernel.org
> Link: https://github.com/KSPP/linux/issues/21
> Link: https://github.com/KSPP/linux/issues/79
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/rtas-types.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/rtas-types.h b/arch/powerpc/include=
/asm/rtas-types.h
> index 8df6235d64d1..40ec03a05c0b 100644
> --- a/arch/powerpc/include/asm/rtas-types.h
> +++ b/arch/powerpc/include/asm/rtas-types.h
> @@ -44,7 +44,7 @@ struct rtas_error_log {
>  	 */
>  	u8		byte3;			/* General event or error*/
>  	__be32		extended_log_length;	/* length in bytes */
> -	unsigned char	buffer[1];		/* Start of extended log */
> +	unsigned char	buffer[];		/* Start of extended log */
>  						/* Variable length.      */
>  };
> =20
> @@ -85,7 +85,7 @@ struct rtas_ext_event_log_v6 {
>  					/* that defines the format for	*/
>  					/* the vendor specific log type	*/
>  	/* Byte 16-end of log */
> -	u8 vendor_log[1];		/* Start of vendor specific log	*/
> +	u8 vendor_log[];		/* Start of vendor specific log	*/
>  					/* Variable length.		*/
>  };
> =20

LGTM.

FWIW:
Reviewed-by: Leonardo Bras <leobras.c@gmail.com>
