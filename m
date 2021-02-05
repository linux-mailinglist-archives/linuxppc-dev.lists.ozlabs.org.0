Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A530D3108B0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 11:08:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DXB2t33sDzDwmt
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 21:08:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=tnco=hh=linuxfoundation.org=gregkh@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=MbIfqWAX; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DX9zR2p0KzDwg6
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Feb 2021 21:05:55 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DE67964FF1;
 Fri,  5 Feb 2021 10:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1612519551;
 bh=bs0XNM8gkt3RASjOhVZFNWk8DM7IhwKfz2bXsbWngbY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MbIfqWAXQsPNyAuKIieIdtVLPMHJ4NI+F0LTN+UJt9FrMnXbzvB3pKdCfS/t5MwSl
 AK9Nuslo3MM1WLO3kiQenPY8+z6owyOWKcAu6jPwAgua3mIbi4ZH5luM6FwFl61tsH
 qTu+hDP9uUVP1Zduw88mqpxLB8Okw811bmSy6tMU=
Date: Fri, 5 Feb 2021 11:05:48 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Subject: Re: [PATCH v2 2/2] ima: Free IMA measurement buffer after kexec
 syscall
Message-ID: <YB0YfGxfQPV2BqeO@kroah.com>
References: <20210204174951.25771-1-nramas@linux.microsoft.com>
 <20210204174951.25771-2-nramas@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210204174951.25771-2-nramas@linux.microsoft.com>
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
Cc: sashal@kernel.org, dmitry.kasatkin@gmail.com, linux-kernel@vger.kernel.org,
 zohar@linux.ibm.com, tyhicks@linux.microsoft.com, ebiederm@xmission.com,
 linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 04, 2021 at 09:49:51AM -0800, Lakshmi Ramasubramanian wrote:
> IMA allocates kernel virtual memory to carry forward the measurement
> list, from the current kernel to the next kernel on kexec system call,
> in ima_add_kexec_buffer() function.  This buffer is not freed before
> completing the kexec system call resulting in memory leak.
> 
> Add ima_buffer field in "struct kimage" to store the virtual address
> of the buffer allocated for the IMA measurement list.
> Free the memory allocated for the IMA measurement list in
> kimage_file_post_load_cleanup() function.
> 
> Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
> Suggested-by: Tyler Hicks <tyhicks@linux.microsoft.com>
> Reviewed-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
> Reviewed-by: Tyler Hicks <tyhicks@linux.microsoft.com>
> Fixes: 7b8589cc29e7 ("ima: on soft reboot, save the measurement list")
> ---
>  include/linux/kexec.h              | 5 +++++
>  kernel/kexec_file.c                | 5 +++++
>  security/integrity/ima/ima_kexec.c | 2 ++
>  3 files changed, 12 insertions(+)

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>
