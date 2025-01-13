Return-Path: <linuxppc-dev+bounces-5162-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 212C8A0BC1E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 16:33:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWxB05MnLz3cYQ;
	Tue, 14 Jan 2025 02:33:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736782424;
	cv=none; b=bGXtCgUNlR+OTdGE/klww2VI6GmzcIeZeh96HaAbuJptdZw30sgdLyE9GtY0NusGBlQH7t94LlceirS7LYlDuAlaTqBLoO8kMIchzXXJG4086gUawXZDb9GhkYmxBHPWLa4iE2o5hq4Ffa2OLG9WPcys4zLWoBTtOOkud7I6ryUlBUzN37fOZxbU9jo/wPde8pUkxCCKbRJxvzZqLTmxeBCIbZexX8JuAKFIWtBL8i/ufhngUq/fPkMWnlaxg9V/QXNa7+ymw9jAqAIpRcKdSYynXrjnIUFw/XHULEUjvQ4C/G3T/PxjqSFia7TDOOAsQ3LBIdNdshmKXgQjfVyCjw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736782424; c=relaxed/relaxed;
	bh=nS0VW7OpusrmvoM1qKliuIyxx2VelfJHJPe+7ERDfnk=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=hz3HdIE5FgFyvckxvszx3HepwwS113N03xQqllcx2rQ3cVi2EJjpSFrP7XB61enk64BcjibV33kbFC5aCz98zQbxWgT8j9FEyuZlqEDsyVXEQIJNk1Put8hMDNouk1Mw4z91n3RAuAXwFE+fOMLaRBzX80gDXl62gYWusKDeK6dbb4On+z+7IYWsQuRCO00ym65kq8a9i4f6ss0p3FMOMXOFG+duNfTuGqrS3cr9IKTSdKUZS6eP/g0rSKdtoGSFJmnFSqt3HIMV8RI+nwgKVvYi0Tgm7E4Lhz4G0feEJf3tvdAmvVBe+jeyxcZhDODXIhIgwArcuGzRB4Vg90KfVA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ss8cpixk; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ss8cpixk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YWx9z0mQvz3cWB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 02:33:42 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2164b662090so73870075ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 07:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736782415; x=1737387215; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nS0VW7OpusrmvoM1qKliuIyxx2VelfJHJPe+7ERDfnk=;
        b=Ss8cpixkhVxIMgaUY8Sk46+GxNjc/89mW3qRBsg5D6l083VGxVQHpHiGx7BwkE34P3
         NbkFXK5FE9uCaBKjmV3VGt1afqIzQ/Vc31SVfkJNVvHCzvPCHrhZcj0Gy1gkOfqqYWqE
         GI5SE6PUhbHP2MpPeiLU7hz8ntv7anjVxruhlcjk3lCuX8DnWNK0KITB9ENnYgSw9E/c
         IGH1mTBiD7Ji35N8B5r3nFFYpjTN1emnwZFt8GXQB0TzCgbV9OiFRGOzl6ZNme6Oj21E
         /7L1ERiuLg7B0hiFp/6DHSZywUZxM8v8brsaWESCrq3k8BT6z1861iBZ1kw1n5OnBD8c
         0u0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736782415; x=1737387215;
        h=references:message-id:date:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nS0VW7OpusrmvoM1qKliuIyxx2VelfJHJPe+7ERDfnk=;
        b=hT/zRDBvEgOZdycqePGwyVfGPjx30XHjVVLyk2J9iKN4RTGXdjp+S6MzJ8SK3BWiK2
         2lrFpImEXA9RPHfA/VBplKI4mp4QBgGFY8XdyUmGgEguEKGuLO/FRHVw8RHdvj2ZFCc4
         FXYQcJhHmAzCAy6iX19pL7EXgYMsyNKpBQxJ6YH4D9kSSdB+lPlt4/uvKxFcDFBEYpiH
         w9lSmtsTJI9yaUHw6kwD4nmuKSoUta9enfGPKLJ3VTNRkhDMeFz16eqZkHp6mkASegIW
         PePRJTDIWY3hjOlyEbmV8urZ7VcvgE7yqgrsK3frKdwMUgIH2l5Fo//Tut4rldc22R4O
         Y77g==
X-Forwarded-Encrypted: i=1; AJvYcCUJurqGeZ6x4krUYake59cy3YgaOduHAY8zm6Ysb+1DsERV0bwKV4Lnh0N2jk7YvjOCm+jlLHjsc88bslE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzSM6kufPP8km4lD6JtLS41TIJr8K+QaCOk7ufANQZ0IktrivzA
	a9JiGaFzWWgJA+yNb/t5a6B/F9L7BrkE/Hs+QJQ7SD5nllJFvGVc
X-Gm-Gg: ASbGnctBT5muSuLpJ8BPTnEPLoIlZXJOSBG+SBWmfETcWEq+/y2ew6V6K1ub1N7XoUG
	Sa+3IEADC3xjjG7c2dyOWIHi4lPJjpZVPDQu0jd+VWQhIqIoY+o5fu0OmBX11Ot3ldtAa8LFPsY
	DptDdPsJev+vxZVOhCGkWULza1oyd0+gWzYVJLH4VMrXZF81GzoAEnOiYiFmmro9s/qULPXXXzy
	kTlDdOH87OIx8xfr+GaYd6yo+SnsrKf+ElkmcXSEfdfC8Kx
X-Google-Smtp-Source: AGHT+IFPqNgyn5QTfzD6MCfqvWw0Y/BlmXEY4FXRiNw3UKd4U8IM3kOvttZByuZ+r1aCmyFZbJ+JCA==
X-Received: by 2002:a17:902:db0a:b0:212:996:3536 with SMTP id d9443c01a7336-21a83f4b11bmr357643555ad.10.1736782415029;
        Mon, 13 Jan 2025 07:33:35 -0800 (PST)
Received: from dw-tp ([171.76.81.42])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f21a04dsm55322025ad.151.2025.01.13.07.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 07:33:34 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Thorsten Blum <thorsten.blum@linux.dev>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, Bjorn Helgaas <bhelgaas@google.com>, "Aneesh Kumar K.V (IBM)" <aneesh.kumar@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>, Baoquan He <bhe@redhat.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fadump: Use str_yes_no() helper in fadump_show_config()
In-Reply-To: <20241230214142.952706-2-thorsten.blum@linux.dev>
Date: Mon, 13 Jan 2025 20:39:53 +0530
Message-ID: <87ikqivjge.fsf@gmail.com>
References: <20241230214142.952706-2-thorsten.blum@linux.dev>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>

Thorsten Blum <thorsten.blum@linux.dev> writes:

> Remove hard-coded strings by using the str_yes_no() helper function.
>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  arch/powerpc/kernel/fadump.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)


In fadump.c file we have implicit include of string_choices.h i.e. 

    include/linux/seq_file.h -> linux/string_helpers.h -> linux/string_choices.h 

Directly having string_choices include could be better. 
    #include <linux/string_choices.h>

However no hard preferences. The patch functionally looks correct to me. 

Please feel free to add - 
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>


>
> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
> index 4b371c738213..8c531533dd3e 100644
> --- a/arch/powerpc/kernel/fadump.c
> +++ b/arch/powerpc/kernel/fadump.c
> @@ -289,10 +289,8 @@ static void __init fadump_show_config(void)
>  	if (!fw_dump.fadump_supported)
>  		return;
>  
> -	pr_debug("Fadump enabled    : %s\n",
> -				(fw_dump.fadump_enabled ? "yes" : "no"));
> -	pr_debug("Dump Active       : %s\n",
> -				(fw_dump.dump_active ? "yes" : "no"));
> +	pr_debug("Fadump enabled    : %s\n", str_yes_no(fw_dump.fadump_enabled));
> +	pr_debug("Dump Active       : %s\n", str_yes_no(fw_dump.dump_active));
>  	pr_debug("Dump section sizes:\n");
>  	pr_debug("    CPU state data size: %lx\n", fw_dump.cpu_state_data_size);
>  	pr_debug("    HPTE region size   : %lx\n", fw_dump.hpte_region_size);
> -- 
> 2.47.1

