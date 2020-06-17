Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3DC1FD650
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jun 2020 22:45:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49nHC86VcdzDqxW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 06:45:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.166.66; helo=mail-io1-f66.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49nH8f1GB9zDqwr
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jun 2020 06:43:29 +1000 (AEST)
Received: by mail-io1-f66.google.com with SMTP id o5so4509922iow.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jun 2020 13:43:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=emJpJjtrMEqB2UXVQWJGyVmpIt4i0tBG2sjF9wqyg6s=;
 b=M6cFuv/ZeZGk29S4BczXlG0m6Xi27ElQr/Dg3mHmSD1F2fDgysjbiH67Q2rIrxeWqo
 xjDF6Lg1cKLHZEuXR7laSxfgSh12OBQ6EIUzHGQGqsd0n/F7ZM7su1qAxyDwjotOojxC
 CmVjZYC5bKz9j7pyaZRV+uBk0WIoOD1K3/cAulQ90XgdVbUl6hL+HAWvhjbTdrcp6anj
 iEVotv4sOVNe2XsMrGSJ/wJeGhCOaifTdRBl3sjekFyLBS22vANx08TUbOBHt+8QCiqy
 1CbCTuBQn/lp27rrzXmOF840/ZRo8kU+rCMGuG/gKkjjrABccngTe8z8aoGrWbxBOh5Z
 Dzdg==
X-Gm-Message-State: AOAM532f62TqeZ813pZrWizTijguI5knPAq5CZIDC5Ptl/HevPzc6jQu
 5y7awGBFqjZvFYrLCVUVXA==
X-Google-Smtp-Source: ABdhPJx6D38aHYbkc7/7zEd9UCiEIZ/iKJdovV7uWe+2O6ZR5TDlocKXFkMaZH8WNeCz6fnzzMumHw==
X-Received: by 2002:a5d:9d03:: with SMTP id j3mr1328409ioj.176.1592426606820; 
 Wed, 17 Jun 2020 13:43:26 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id c20sm499812iot.33.2020.06.17.13.43.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 13:43:26 -0700 (PDT)
Received: (nullmailer pid 2766741 invoked by uid 1000);
 Wed, 17 Jun 2020 20:43:24 -0000
Date: Wed, 17 Jun 2020 14:43:24 -0600
From: Rob Herring <robh@kernel.org>
To: Prakhar Srivastava <prsriva@linux.microsoft.com>
Subject: Re: [v1 PATCH 2/2] Add Documentation regarding the ima-kexec-buffer
 node in the chosen node documentation
Message-ID: <20200617204324.GA2740878@bogus>
References: <20200607233323.22375-1-prsriva@linux.microsoft.com>
 <20200607233323.22375-3-prsriva@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200607233323.22375-3-prsriva@linux.microsoft.com>
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
Cc: kstewart@linuxfoundation.org, mark.rutland@arm.com,
 gregkh@linuxfoundation.org, bhsharma@redhat.com, tao.li@vivo.com,
 zohar@linux.ibm.com, paulus@samba.org, vincenzo.frascino@arm.com,
 will@kernel.org, nramas@linux.microsoft.com, frowand.list@gmail.com,
 masahiroy@kernel.org, jmorris@namei.org, takahiro.akashi@linaro.org,
 linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
 serge@hallyn.com, devicetree@vger.kernel.org, pasha.tatashin@soleen.com,
 hsinyi@chromium.org, tusharsu@linux.microsoft.com, tglx@linutronix.de,
 allison@lohutok.net, christophe.leroy@c-s.fr, mbrugger@suse.com,
 balajib@linux.microsoft.com, dmitry.kasatkin@gmail.com,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 james.morse@arm.com, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Jun 07, 2020 at 04:33:23PM -0700, Prakhar Srivastava wrote:
> Add Documentation regarding the ima-kexec-buffer node in
>  the chosen node documentation

Run 'git log --oneline Documentation/devicetree/bindings/chosen.txt' and 
write $subject using the dominate format used.

For the commit message, answer why you need the change, not what the 
change is. I can read the diff for that.

>  
> Signed-off-by: Prakhar Srivastava <prsriva@linux.microsoft.com>
> ---
>  Documentation/devicetree/bindings/chosen.txt | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)

This file has moved to a schema here[1]. You need to update it.

> 
> diff --git a/Documentation/devicetree/bindings/chosen.txt b/Documentation/devicetree/bindings/chosen.txt
> index 45e79172a646..a15f70c007ef 100644
> --- a/Documentation/devicetree/bindings/chosen.txt
> +++ b/Documentation/devicetree/bindings/chosen.txt
> @@ -135,3 +135,20 @@ e.g.
>  		linux,initrd-end = <0x82800000>;
>  	};
>  };
> +
> +linux,ima-kexec-buffer
> +----------------------
> +
> +This property(currently used by powerpc, arm64) holds the memory range,
> +the address and the size, of the IMA measurement logs that are being carried
> +over to the kexec session.

What's IMA? 

> +
> +/ {
> +	chosen {
> +		linux,ima-kexec-buffer = <0x9 0x82000000 0x0 0x00008000>;
> +	};
> +};
> +
> +This porperty does not represent real hardware, but the memory allocated for

typo

> +carrying the IMA measurement logs. The address and the suze are expressed in

typo

> +#address-cells and #size-cells, respectively of the root node.
> -- 
> 2.25.1
> 


[1] https://github.com/devicetree-org/dt-schema/blob/master/schemas/chosen.yaml

