Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FD635D486
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Apr 2021 02:54:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FK6ZB3dYkz3c0k
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Apr 2021 10:54:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=ne0SSryQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=srs0=hh6k=jk=gmail.com=oohall@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ne0SSryQ; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FK6Yk45Gmz30D7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Apr 2021 10:54:01 +1000 (AEST)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by ozlabs.org (Postfix) with ESMTP id 4FK6Yd0gQrz9sW8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Apr 2021 10:53:57 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4FK6Yd0TRHz9sWX; Tue, 13 Apr 2021 10:53:57 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::829;
 helo=mail-qt1-x829.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ne0SSryQ; dkim-atps=neutral
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4FK6Yc70nWz9sW8
 for <linuxppc-dev@ozlabs.org>; Tue, 13 Apr 2021 10:53:55 +1000 (AEST)
Received: by mail-qt1-x829.google.com with SMTP id j7so11511844qtx.5
 for <linuxppc-dev@ozlabs.org>; Mon, 12 Apr 2021 17:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7+G5ztQszCN2u7CMf/hH/Cu7szVvqC9NSfVBk6tQ/jQ=;
 b=ne0SSryQdxdO331TAMynBGaxD4dsUab9TbnfkgWxdvJo8HhaZKo49Hp/OnOb4FL0Rp
 owbtd0Ft56cU3Q51Re7I4pYhmpnIHiOCfQPuS4Nrc4cPgaOzEPsn45yN2+k4CYAAVBMB
 hxS4WL66W0OIl/XbB/vo0csowdBLxwsWHlPYXj2uFJUuBB1DqB/qmt4NE+3+uqAro1Ce
 NgWwouEPART/vPZxNJzB71EMaPWBzeHeovU6/qsl+1ivHRau1pOAzPT1DVjgmoXyegPk
 ZqLaqIE0XxPC2wy5IpPqhCLwxxndheOHDlMRlt5tC1x6Y1SO2KFMUG7IzXya+z+8upmF
 IbQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7+G5ztQszCN2u7CMf/hH/Cu7szVvqC9NSfVBk6tQ/jQ=;
 b=hHKqvWidEOyKgO1N1k2Kk4EL9yLHd7Njx0TOVd4Rfiy0BFMPD3v3Wze4vLEgTJd+JK
 3AFtUct+/ssjKcXs5u+1410/t3P8/nSwo/Crq1C5Wq6NRBbHRpQIqhXD69I+qZwK6YOt
 OOGVir2hNWyEjhuhP2gGyszyZtHecaRa/IixP25ocdhvAb/h8Az3EQXI20SOkvItD/R0
 ka3J67eJn8HV2ik3uSTL9aQuJALQAIfbRhvMPIyp4M2bbiwvDKuiU7aiehZ0CJ6Qm29A
 hdpVGHKVy4hqsE9iDn8yj029fhDEyvf2mo00KuUHCpiYxAk+THJ94Jgyy1jEarDdrPq/
 YWpA==
X-Gm-Message-State: AOAM531zj2ixInB+2uUkvjETE4YbkSCLMTi7xllld3qKDexNOQV863ef
 RBN196gh+GiR5TGjGqazp1RqSh/JCeB7naV0RYY=
X-Google-Smtp-Source: ABdhPJw1lrRzj9tsypZ8YqAMY91dodrQenT0xfmw5E3znDxT93l6yAvi1fAE+VFLLUlzh/1n6L4fqpt53SYuTtW0+C8=
X-Received: by 2002:a05:622a:c4:: with SMTP id
 p4mr27807435qtw.240.1618275230060; 
 Mon, 12 Apr 2021 17:53:50 -0700 (PDT)
MIME-Version: 1.0
References: <161821396263.48361.2796709239866588652.stgit@jupiter>
In-Reply-To: <161821396263.48361.2796709239866588652.stgit@jupiter>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Tue, 13 Apr 2021 10:53:39 +1000
Message-ID: <CAOSf1CG3oYCnWx+gV3VgYzkQJTvVEeMGDyKjMAQRdH8w23C2QA@mail.gmail.com>
Subject: Re: [PATCH v2] powerpc/eeh: Fix EEH handling for hugepages in ioremap
 space.
To: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linuxppc-dev <linuxppc-dev@ozlabs.org>, stable <stable@vger.kernel.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 12, 2021 at 5:52 PM Mahesh Salgaonkar <mahesh@linux.ibm.com> wrote:
>
> During the EEH MMIO error checking, the current implementation fails to map
> the (virtual) MMIO address back to the pci device on radix with hugepage
> mappings for I/O. This results into failure to dispatch EEH event with no
> recovery even when EEH capability has been enabled on the device.
>
> eeh_check_failure(token)                # token = virtual MMIO address
>   addr = eeh_token_to_phys(token);
>   edev = eeh_addr_cache_get_dev(addr);
>   if (!edev)
>         return 0;
>   eeh_dev_check_failure(edev);  <= Dispatch the EEH event
>
> In case of hugepage mappings, eeh_token_to_phys() has a bug in virt -> phys
> translation that results in wrong physical address, which is then passed to
> eeh_addr_cache_get_dev() to match it against cached pci I/O address ranges
> to get to a PCI device. Hence, it fails to find a match and the EEH event
> never gets dispatched leaving the device in failed state.
>
> The commit 33439620680be ("powerpc/eeh: Handle hugepages in ioremap space")
> introduced following logic to translate virt to phys for hugepage mappings:
>
> eeh_token_to_phys():
> +       pa = pte_pfn(*ptep);
> +
> +       /* On radix we can do hugepage mappings for io, so handle that */
> +       if (hugepage_shift) {
> +               pa <<= hugepage_shift;                  <= This is wrong
> +               pa |= token & ((1ul << hugepage_shift) - 1);
> +       }

I think I vaguely remember thinking "is this right?" at the time.
Apparently not!

Reviewed-by: Oliver O'Halloran <oohall@gmail.com>


It would probably be a good idea to add a debugfs interface to help
with testing the address translation. Maybe something like:

echo <mmio addr> > /sys/kernel/debug/powerpc/eeh_addr_check

Then in the kernel:

struct resource *r = lookup_resource(mmio_addr);
void *virt = ioremap_resource(r);
ret = eeh_check_failure(virt);
iounmap(virt)

return ret;

A little tedious, but then you can write a selftest :)

Oliver
