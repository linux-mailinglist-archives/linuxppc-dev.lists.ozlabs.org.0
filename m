Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF4819D008
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 08:10:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tqKc2yblzDrhb
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 17:10:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Irbf//fW; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tqHv0VcTzDrTL
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 17:08:42 +1100 (AEDT)
Received: by mail-pj1-x1042.google.com with SMTP id q16so616626pje.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Apr 2020 23:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:date:in-reply-to:references:user-agent
 :mime-version:content-transfer-encoding;
 bh=S35RTR4j9wq3xd5fuf3gQV82uLTCYCWfTi1DhDzcL5c=;
 b=Irbf//fWjtPyCtoFYhbPuztO4zvGnAJ45Z9QM953NmryrzdR46aMIe8jgC3vcbFvoY
 /f4QNrDE2uQ5CQdNwi1WVnwbkp14hnZI5oa0uVB2aXlosJu1ymk0javhM5bcXCbHHHje
 SNYbOrNsxJ+agSb6YkawVdP6PwNCqatPH4wltR8u+FsXVgxZvRdkYW8JmCMvk7mZIddT
 HzfEAPxlXomKT7EPUlX3ZFnYQ6I6vgL5QTxaZ7sjbWQh/KjSMo3JsYjKRL4pVsYP4nxw
 zuE1GJQd2xz9jL1pNF7L+m9YWjITEqa4WDcgVzGNoRrCJzlIUyKBJLG4Ky1rtEQpBMCB
 YeYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=S35RTR4j9wq3xd5fuf3gQV82uLTCYCWfTi1DhDzcL5c=;
 b=VlCIa0gwvVm/c/B9pMsga9qLyQ55oNNjX7mGisSJOlATs4LOv675p0TrcMCBn+as7D
 9Bdb851RnnmpQN5gURe/BYahTrmQmrgYPO8nE2tZ7UvUGEuKN1CaGifgpj6E0PY63Lhi
 xA1P1OiV/QUu9xXm+j5tnqTpp48t9FJTZRvCQJENY9ak9x6Zw7KiACUQBSK6s3NLuM39
 hbgfyELuJT6O7wRXH5mvBQejguMwDeA11kznNt/FRVSEKSBxlL0TG4mqgknQsnlog5Ni
 c2XeeptpYlhbZ7rNcrPpVhVn7YKRg4Bu30X8NAt1t3F6IQujM/Dar9SN1/ag99IUrMcm
 UeOQ==
X-Gm-Message-State: AGi0PuYo0A/SSvlG1f6wtR8717r15LUX7jvE0BzbUMFG104ebp7CSX3h
 lgVegU+LeBFdPr+LoiRFuuvwekQQ
X-Google-Smtp-Source: APiQypJVOf/1J6jUIo6P0agoYMik49zf/coIsTsOtpQheQb+yzfwzFFPgxklGUk0EHf566LPo6klPA==
X-Received: by 2002:a17:90a:4d43:: with SMTP id
 l3mr7513311pjh.165.1585894118994; 
 Thu, 02 Apr 2020 23:08:38 -0700 (PDT)
Received: from 192-168-1-12.tpgi.com.au (220-245-129-32.tpgi.com.au.
 [220.245.129.32])
 by smtp.googlemail.com with ESMTPSA id h15sm5034933pfq.10.2020.04.02.23.08.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2020 23:08:38 -0700 (PDT)
Message-ID: <c7e81c27a6da9f7a4266cec9995b597bce4efc7b.camel@gmail.com>
Subject: Re: [PATCH 3/4] powerpc/eeh: Remove workaround from
 eeh_add_device_late()
From: Oliver O'Halloran <oohall@gmail.com>
To: Sam Bobroff <sbobroff@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Fri, 03 Apr 2020 17:08:32 +1100
In-Reply-To: <252491a9c3fb015383ac757220c5df43d168fe4e.1585544197.git.sbobroff@linux.ibm.com>
References: <cover.1585544197.git.sbobroff@linux.ibm.com>
 <252491a9c3fb015383ac757220c5df43d168fe4e.1585544197.git.sbobroff@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2020-03-30 at 15:56 +1100, Sam Bobroff wrote:
> When EEH device state was released asynchronously by the device
> release handler, it was possible for an outstanding reference to
> prevent it's release and it was necessary to work around that if a
> device was re-discovered at the same PCI location.

I think this is a bit misleading. The main situation where you'll hit
this hack is when recovering a device with a driver that doesn't
implement the error handling callbacks. In that case the device is
removed, reset, then re-probed by the PCI core, but we assume it's the
same physical device so the eeh_device state remains active.

If you actually changed the underlying device I suspect something bad
would happen.

> Now that the state is released synchronously that is no longer
> possible and the workaround is no longer necessary.

You could probably fold this into the previous patch, but eh. You could
probably fold this into the previous patch, but eh.

> Signed-off-by: Sam Bobroff <sbobroff@linux.ibm.com>
> ---
>  arch/powerpc/kernel/eeh.c | 23 +----------------------
>  1 file changed, 1 insertion(+), 22 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
> index c36c5a7db5ca..12c248a16527 100644
> --- a/arch/powerpc/kernel/eeh.c
> +++ b/arch/powerpc/kernel/eeh.c
> @@ -1206,28 +1206,7 @@ void eeh_add_device_late(struct pci_dev *dev)
>  		eeh_edev_dbg(edev, "Device already referenced!\n");
>  		return;
>  	}
> -
> -	/*
> -	 * The EEH cache might not be removed correctly because of
> -	 * unbalanced kref to the device during unplug time, which
> -	 * relies on pcibios_release_device(). So we have to remove
> -	 * that here explicitly.
> -	 */
> -	if (edev->pdev) {
> -		eeh_rmv_from_parent_pe(edev);
> -		eeh_addr_cache_rmv_dev(edev->pdev);
> -		eeh_sysfs_remove_device(edev->pdev);
> -
> -		/*
> -		 * We definitely should have the PCI device removed
> -		 * though it wasn't correctly. So we needn't call
> -		 * into error handler afterwards.
> -		 */
> -		edev->mode |= EEH_DEV_NO_HANDLER;
> -
> -		edev->pdev = NULL;
> -		dev->dev.archdata.edev = NULL;
> -	}
> +	WARN_ON_ONCE(edev->pdev);
>  
>  	if (eeh_has_flag(EEH_PROBE_MODE_DEV))
>  		eeh_ops->probe(pdn, NULL);

