Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3122787869B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Mar 2024 18:48:14 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VxeYfgbj;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VxeYfgbj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TtklJ0C8fz3dWS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 04:48:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VxeYfgbj;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VxeYfgbj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=jsnitsel@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TtkkW1wWgz3c5P
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Mar 2024 04:47:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710179244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e3tUcIlJ5o5Hs/7+gdyglVV0O0xMiKwtCqd2APcSMtU=;
	b=VxeYfgbjeaUv8qJUXQ9akg6u+C20gJxR4AnEFAlpm0a2nvyETktWd9Ej378DEarPSYIFuh
	SV1yDLT6qEmGsmSvpWYuuM9difEZrm3ievpVEDVoIGr/3C1CT+V8HWOubF7yN0rDELPsiv
	c50SnaYj0KwlCTimqWNT4QZ3cD0MlNc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710179244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e3tUcIlJ5o5Hs/7+gdyglVV0O0xMiKwtCqd2APcSMtU=;
	b=VxeYfgbjeaUv8qJUXQ9akg6u+C20gJxR4AnEFAlpm0a2nvyETktWd9Ej378DEarPSYIFuh
	SV1yDLT6qEmGsmSvpWYuuM9difEZrm3ievpVEDVoIGr/3C1CT+V8HWOubF7yN0rDELPsiv
	c50SnaYj0KwlCTimqWNT4QZ3cD0MlNc=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-466-ntuB6YWEOh278Uu7ByPpSA-1; Mon, 11 Mar 2024 13:47:22 -0400
X-MC-Unique: ntuB6YWEOh278Uu7ByPpSA-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-690b861a1c0so38402866d6.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Mar 2024 10:47:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710179241; x=1710784041;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e3tUcIlJ5o5Hs/7+gdyglVV0O0xMiKwtCqd2APcSMtU=;
        b=ZuSDk/PdiE9AyIh5pUFtZScdFYbxqGhp6ZtG7Jo2p39oUci9LrDF6SO42K0oOCXC/j
         TaGU8mI3EiCKlSsGepNTcQNuj8bfD3iH3H0/z8WOTN4FSVo4nzl/fMWIArJzyuuy3fLK
         u5yy/DJnCzvuVu/jQe7YdYhHQpqaO4zmQLDwDM53U9CGS8xCqKtiNGf/4ziUKijZxbag
         ujN5Dco9xQa8w6WlLjzelpiBKltS3G6txPuMg7JyrAOaDdV0O9mGlMujQK2VdEox4xHw
         HvIfH2jAmR9BDr/s8pwDPtWYlcLhLT4XWr53ygWgW7ZZ6a8EusExFOmTaZw66JZ4nj3X
         vYog==
X-Forwarded-Encrypted: i=1; AJvYcCWkwoBHXJvBm0KRkikUZ3CxW0cd2BWi3OAc7TIVfoZmWwq6Mi23kuWVBXr6OAO+zk9MIDV+YPhM037vEl2CKDqY3jJpRVCsJxU3GiHwxA==
X-Gm-Message-State: AOJu0YwQb4jTpHDC2yPe3mFQifzZWLxsBAiIUeNnX/HpZ9Bec3vlEYPg
	gQFxvkQplwfnjKUYiyXR9oJtU3ujdbG4gvp8GZhkbEeIe9x7rJQ0d9W5/eLALuwSeLPjyJNaQuF
	kb7Oc9/mLfMoY/Eh/aqgWPC9wL8sEHi4DSZ4S8ycnexU569GPrZCwQB+ZjpKPRMI=
X-Received: by 2002:a05:6214:247:b0:690:db88:9eb with SMTP id k7-20020a056214024700b00690db8809ebmr1672461qvt.50.1710179241537;
        Mon, 11 Mar 2024 10:47:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKkd3g/GU6B6xqvPUivb+7iFgK8i45ZkaZeEfZReIDlgxd3Q+6lkyFcUHq8gFduAC17Jv0uw==
X-Received: by 2002:a05:6214:247:b0:690:db88:9eb with SMTP id k7-20020a056214024700b00690db8809ebmr1672446qvt.50.1710179241228;
        Mon, 11 Mar 2024 10:47:21 -0700 (PDT)
Received: from localhost (ip70-163-216-141.ph.ph.cox.net. [70.163.216.141])
        by smtp.gmail.com with ESMTPSA id n13-20020a0cfbcd000000b00690bb839b5bsm2842551qvp.135.2024.03.11.10.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 10:47:20 -0700 (PDT)
Date: Mon, 11 Mar 2024 10:47:19 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Stefan Berger <stefanb@linux.ibm.com>
Subject: Re: [RFC PATCH v2 1/3] powerpc/prom_init: Replace
 linux,sml-base/sml-size with linux,sml-log
Message-ID: <s2a42qzx4pp7fvgde4p5t7pcwsop4wlm266e2gdgr2gb5y77cn@udrmavhiwqoo>
References: <20240311132030.1103122-1-stefanb@linux.ibm.com>
 <20240311132030.1103122-2-stefanb@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20240311132030.1103122-2-stefanb@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: devicetree@vger.kernel.org, rnsastry@linux.ibm.com, linux-kernel@vger.kernel.org, jarkko@kernel.org, linux-integrity@vger.kernel.org, viparash@in.ibm.com, linuxppc-dev@lists.ozlabs.org, peterhuewe@gmx.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 11, 2024 at 09:20:28AM -0400, Stefan Berger wrote:
> linux,sml-base holds the address of a buffer with the TPM log. This
> buffer may become invalid after a kexec. To avoid accessing an invalid
> address or corrupted buffer, embed the whole TPM log in the device tree
> property linux,sml-log. This helps to protect the log since it is
> properly carried across a kexec soft reboot with both of the kexec
> syscalls.
> 
> Avoid having the firmware ingest the whole TPM log when calling
> prom_setprop but only create the linux,sml-log property as a place holder.
> Insert the actual TPM log during the tree flattening phase.
> 
> Fixes: 4a727429abec ("PPC64: Add support for instantiating SML from Open Firmware")
> Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> ---
>  arch/powerpc/kernel/prom_init.c | 27 +++++++++++++++++++--------
>  1 file changed, 19 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
> index e67effdba85c..6f7ca72013c2 100644
> --- a/arch/powerpc/kernel/prom_init.c
> +++ b/arch/powerpc/kernel/prom_init.c
> @@ -211,6 +211,8 @@ static cell_t __prombss regbuf[1024];
>  
>  static bool  __prombss rtas_has_query_cpu_stopped;
>  
> +static u64 __prombss sml_base;
> +static u32 __prombss sml_size;

Should inside an #ifdef CONFIG_PPC64 since prom_instantiate_sml() is?

>  
>  /*
>   * Error results ... some OF calls will return "-1" on error, some
> @@ -1954,17 +1956,15 @@ static void __init prom_instantiate_sml(void)
>  	}
>  	prom_printf(" done\n");
>  
> -	reserve_mem(base, size);
> -
> -	prom_setprop(ibmvtpm_node, "/vdevice/vtpm", "linux,sml-base",
> -		     &base, sizeof(base));
> -	prom_setprop(ibmvtpm_node, "/vdevice/vtpm", "linux,sml-size",
> -		     &size, sizeof(size));
> -
> -	prom_debug("sml base     = 0x%llx\n", base);
> +	/* Add property now, defer adding log to tree flattening phase */
> +	prom_setprop(ibmvtpm_node, "/vdevice/vtpm", "linux,sml-log",
> +		     NULL, 0);
>  	prom_debug("sml size     = 0x%x\n", size);
>  
>  	prom_debug("prom_instantiate_sml: end...\n");
> +
> +	sml_base = base;
> +	sml_size = size;
>  }
>  
>  /*
> @@ -2645,6 +2645,17 @@ static void __init scan_dt_build_struct(phandle node, unsigned long *mem_start,
>  		}
>  		prev_name = sstart + soff;
>  
> +		if (!prom_strcmp("linux,sml-log", pname)) {
> +			/* push property head */
> +			dt_push_token(OF_DT_PROP, mem_start, mem_end);
> +			dt_push_token(sml_size, mem_start, mem_end);
> +			dt_push_token(soff, mem_start, mem_end);
> +			/* push property content */
> +			valp = make_room(mem_start, mem_end, sml_size, 1);
> +			memcpy(valp, (void *)sml_base, sml_size);
> +			*mem_start = ALIGN(*mem_start, 4);
> +			continue;
> +		}

Same question as above.

Regards,
Jerry

>  		/* get length */
>  		l = call_prom("getproplen", 2, 1, node, pname);
>  
> -- 
> 2.43.0
> 

