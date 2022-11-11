Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 702A3625021
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Nov 2022 03:26:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N7jJ72cbbz3chb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Nov 2022 13:26:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PWTZZynK;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PWTZZynK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=coxu@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PWTZZynK;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PWTZZynK;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N7jH75gdGz2yRS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Nov 2022 13:25:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668133532;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WaG6D9NPul5lwMcNCuIe3sGhugQZUKvnrKFJmGoro3c=;
	b=PWTZZynKGvfUR+JqAZVPOYCA2ZWbXYR3k49Prqqfk4ZoNFNUmD+lz54BXhMMCezCS6Cb69
	pBcffh+pcDKt1wpNpRgvUns8fT7jSGgCdRZDHhfJNBa34AhNJEAvmPp6ytexH0GSEsgVxa
	qeTLvdloFXhwus9Nks8QNylQy/L0bGk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668133532;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WaG6D9NPul5lwMcNCuIe3sGhugQZUKvnrKFJmGoro3c=;
	b=PWTZZynKGvfUR+JqAZVPOYCA2ZWbXYR3k49Prqqfk4ZoNFNUmD+lz54BXhMMCezCS6Cb69
	pBcffh+pcDKt1wpNpRgvUns8fT7jSGgCdRZDHhfJNBa34AhNJEAvmPp6ytexH0GSEsgVxa
	qeTLvdloFXhwus9Nks8QNylQy/L0bGk=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-463-Ddv4PEV3NW2igu-sk4EBhA-1; Thu, 10 Nov 2022 21:25:31 -0500
X-MC-Unique: Ddv4PEV3NW2igu-sk4EBhA-1
Received: by mail-pj1-f69.google.com with SMTP id q93-20020a17090a1b6600b0021311ab9082so2038946pjq.7
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 18:25:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WaG6D9NPul5lwMcNCuIe3sGhugQZUKvnrKFJmGoro3c=;
        b=Hsj+m0vM3A4bPskJSzhKrxA3XFaIDCguhvDO10D+HS3QWkTlCT6WME59csywrndClm
         uRFNOUYMFDeYR2r9szhUcFNi28VQNFfeIaL5+B8mE/GDSN09I7LhLaLmy5ZO2cTZDXdE
         Z3hElvhXs/rr0VXIWtPWqyfghbDgz9n2C5O6ego9kjNVlsZLXp7xdY8f5SHWXvZC0wsA
         y7CVWEfsx98ClaRIeJFMMoyY7NJQWNMg2sJZ58kdjJX5BnzY0dH2PGTBr+cAjx1ZwQry
         /Y2p9siV0EqZTqsgqhH1y7L/SbJIfisSNU9EC0JyAodCYQQob9pTVxMrIBZ1PvPrN9Yn
         HyLg==
X-Gm-Message-State: ANoB5pmn1fVAStGlRLqE8xy6nylBmmHkoWLORhb+GX4ocWqxmFyQluYQ
	H54MaUc5bOJshka8COge+0l1fTxpoqrMCUyIfj7aWHd4i+mYBnowh9gz6t+MBPO1oXvsdFYkLTm
	nFzklD7PXdNYLBJJuNlaVm9sUQQ==
X-Received: by 2002:a17:902:f811:b0:187:19c4:373a with SMTP id ix17-20020a170902f81100b0018719c4373amr321315plb.163.1668133529853;
        Thu, 10 Nov 2022 18:25:29 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5JE5CicYQ2l/VDcgKu1A3Opx/g/1lm/7vpkfRaW5I/+bVsxwi+MrsKOPNQCArSCBYFvx9qNQ==
X-Received: by 2002:a17:902:f811:b0:187:19c4:373a with SMTP id ix17-20020a170902f81100b0018719c4373amr321304plb.163.1668133529575;
        Thu, 10 Nov 2022 18:25:29 -0800 (PST)
Received: from localhost ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id w8-20020a1709026f0800b0018544ad1e8esm358845plk.238.2022.11.10.18.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 18:25:28 -0800 (PST)
Date: Fri, 11 Nov 2022 10:21:43 +0800
From: Coiby Xu <coxu@redhat.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v8 0/4] tpm: Preserve TPM measurement log across kexec
 (ppc64)
Message-ID: <20221111022143.xvpi3pfwwrw4qda2@Rk>
References: <20220901214610.768645-1-stefanb@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20220901214610.768645-1-stefanb@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
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
Cc: devicetree@vger.kernel.org, Baoquan He <bhe@redhat.com>, nayna@linux.ibm.com, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, nasastry@in.ibm.com, linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

Could the PowerPC tree take this patch set which resolves a
PowerVM/KVM-specific issue?

On Thu, Sep 01, 2022 at 05:46:06PM -0400, Stefan Berger wrote:
>The of-tree subsystem does not currently preserve the IBM vTPM 1.2 and
>vTPM 2.0 measurement logs across a kexec on PowerVM and PowerKVM. This
>series fixes this for the kexec_file_load() syscall using the flattened
>device tree (fdt) to carry the TPM measurement log's buffer across kexec.
>
>   Stefan
>
>v8:
> - Added Jarkko's, Coiby's, and Rob's tags
> - Rebase on v6.0-rc3 that absorbed 2 already upstreamed patches
>
>v7:
> - Added Nageswara's Tested-by tags
> - Added back original comment to inline function and removed Jarkko's R-b tag
>
>v6:
> - Add __init to get_kexec_buffer as suggested by Jonathan
> - Fixed issue detected by kernel test robot
>
>v5:
> - Rebased on 1 more patch that would otherwise create merge conflicts
>
>v4:
> - Rebased on 2 patches that would otherwise create merge conflicts;
>   posting these patches in this series with several tags removed so
>   krobot can test the series already
> - Changes to individual patches documented in patch descripitons
>
>v3:
> - Moved TPM Open Firmware related function to drivers/char/tpm/eventlog/tpm_of.c
>
>v2:
> - rearranged patches
> - fixed compilation issues for x86
>
>Palmer Dabbelt (1):
>  drivers: of: kexec ima: Support 32-bit platforms
>
>Stefan Berger (3):
>  tpm: of: Make of-tree specific function commonly available
>  of: kexec: Refactor IMA buffer related functions to make them reusable
>  tpm/kexec: Duplicate TPM measurement log in of-tree for kexec
>
> drivers/char/tpm/eventlog/of.c |  31 +--
> drivers/of/kexec.c             | 336 ++++++++++++++++++++++++++++-----
> include/linux/kexec.h          |   6 +
> include/linux/of.h             |   9 +-
> include/linux/tpm.h            |  36 ++++
> kernel/kexec_file.c            |   6 +
> 6 files changed, 346 insertions(+), 78 deletions(-)
>
>
>base-commit: b90cb1053190353cc30f0fef0ef1f378ccc063c5
>-- 
>2.35.1
>

-- 
Best regards,
Coiby

