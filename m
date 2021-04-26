Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DB35F36BB2A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Apr 2021 23:25:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FTdGy6Mltz301J
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Apr 2021 07:25:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.53; helo=mail-ot1-f53.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FTdGc3KPgz2yR4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Apr 2021 07:25:26 +1000 (AEST)
Received: by mail-ot1-f53.google.com with SMTP id
 f75-20020a9d03d10000b0290280def9ab76so48384143otf.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Apr 2021 14:25:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=if+kpOrEBMc7EsjeYPdnBYrLSadizKO99PTh1HWp/+w=;
 b=GZEcN8sl+n6/iHDATKEM5n31kS9UT2AhTEh7XRp03Qxr93bOXBAyVoIE7diHXN+PKP
 WSn9odmYwmxXEG/u88pcLRTmqAdfouU9EBEY+X0P+BcMcx8nzw3Gcr+KSTsXtvJ/wq1a
 V0IvfNCUm77nOXwhoLbiX1BnOIrr+pchleCiMSKsEw8SBisMnY9D38VmoRPF1HXTESaa
 Lyk9anGycGzgtgOFgQDGnzeqhr4Vy9r3vp/G+u0ei3hGS9Z18xGEgqL7N2Hg5upa3KI/
 5fKz3rlASa1DjhAdQDmYU+Qj8TLkfL2kgq/iS/eQe1argMdd/Ci8XM10XoaHWMTCljw+
 Wfxw==
X-Gm-Message-State: AOAM5304zz4wmT2yzWnAs3fPJL8WVCO4evsyhosLVxvuB3eEZLzhXgON
 t/PNu5JFMEsar3ci2VPYJg==
X-Google-Smtp-Source: ABdhPJytQsNTWy1y3O3rVhWawKgoMbsNBLoMOI596n65aAt19DCMYv0gC0X7OPoXraB6/B6TdKT2Yw==
X-Received: by 2002:a9d:4616:: with SMTP id y22mr6630504ote.250.1619472322465; 
 Mon, 26 Apr 2021 14:25:22 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id p2sm227792ool.15.2021.04.26.14.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 14:25:21 -0700 (PDT)
Received: (nullmailer pid 4112837 invoked by uid 1000);
 Mon, 26 Apr 2021 21:25:20 -0000
Date: Mon, 26 Apr 2021 16:25:20 -0500
From: Rob Herring <robh@kernel.org>
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Subject: Re: [PATCH v2 1/2] powerpc: Free fdt on error in elf64_load()
Message-ID: <20210426212520.GA4112479@robh.at.kernel.org>
References: <20210421163610.23775-1-nramas@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210421163610.23775-1-nramas@linux.microsoft.com>
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
Cc: devicetree@vger.kernel.org, kbuild-all@lists.01.org, lkp@intel.com,
 bauerman@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 dan.carpenter@oracle.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 21 Apr 2021 09:36:09 -0700, Lakshmi Ramasubramanian wrote:
> There are a few "goto out;" statements before the local variable "fdt"
> is initialized through the call to of_kexec_alloc_and_setup_fdt() in
> elf64_load().  This will result in an uninitialized "fdt" being passed
> to kvfree() in this function if there is an error before the call to
> of_kexec_alloc_and_setup_fdt().
> 
> If there is any error after fdt is allocated, but before it is
> saved in the arch specific kimage struct, free the fdt.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
> ---
>  arch/powerpc/kexec/elf_64.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
> 

Applied, thanks!
