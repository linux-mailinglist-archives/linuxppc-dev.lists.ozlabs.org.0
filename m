Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 98240224D4A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jul 2020 19:18:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B8F871xl3zDrNH
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Jul 2020 03:18:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ZmYPJrBU; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B8F6T31NFzDqwN
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Jul 2020 03:17:19 +1000 (AEST)
Received: by mail-pj1-x1043.google.com with SMTP id gc9so7984296pjb.2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jul 2020 10:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=x9/2xXqwMMIu02V9Vx1i6FLVJT0HyPCTnfOosfXOgaE=;
 b=ZmYPJrBUjNKjox4NeljunjKcZnnBt381R+Y3talOfWMy350/GqtfWzR+C/0U5VL655
 43SRvWcRjhK+5Mi/BEiOLCbTWf5Wu3G0hqZx5KPtfn9E9IaCJrMMnl1XyxSh79vSFcTP
 9VzUagMa36hnuLwHjTAbCOQVNEhkEmV77yV2LB2WouQ4ecnWJgVJLGETFa/ElAHeUE26
 H3xABIR+F8PswuSXDNENHnFy7B0XnW4QvowXg3TbSNg7vyhZpX5UClydnK2haFsnP93g
 Cuhmw3SsOEyFckbVyg+1uV7gl9N3cZNy7um3aP+3k0UuqKO3wktU0eGUMav8D9677/6p
 8seg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=x9/2xXqwMMIu02V9Vx1i6FLVJT0HyPCTnfOosfXOgaE=;
 b=jeOjimSPDYZo9Ur13a/hIdN7a1RKejAalCGgwT76IH+fJ6kCHpUTZ72ca39ZU68Je6
 KuVbI1x/nakd5GaxC0zhQi/cp4y5EdF1QqcnB292cm2j7vprVgX6zIo4Hyxfd1HdcLpi
 aUxsOqivuyQ6Vu4ohWV+b9r2RXQAM6Je6kykPO6dnRX1CEb/MgIwDIaxZpMTsPXpfCJ1
 ovvY9BbmEX87o0Uz022YLakcqW6w+gVoc6pJuBaE1foP8pd46YW8Jje2/V15dGdso1uI
 OSpUfIblivWC64O0uANAi23ajkU6aMwWLBM07NqSRqXfKaeEY1ejZ5fDDAIpNV7fAIWd
 qCjA==
X-Gm-Message-State: AOAM53287M6fWFB2+BA9DdEcwpDidC0V1TCwtUIyeF3XpgrFKizpXXzx
 zSNIV+hfa/CgY1b7NgQ7mBM=
X-Google-Smtp-Source: ABdhPJzA3RY/xQJRaNa31hOIDeekxbCxvMbScjxAzsMkHADaeWF07zK6Wn7kuGT9XTzSZOBRC47OSA==
X-Received: by 2002:a17:90b:24a:: with SMTP id
 fz10mr15055235pjb.36.1595092636134; 
 Sat, 18 Jul 2020 10:17:16 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id d18sm6080726pjv.25.2020.07.18.10.17.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 18 Jul 2020 10:17:15 -0700 (PDT)
Date: Sat, 18 Jul 2020 10:17:14 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 3/5] dma-mapping: make support for dma ops optional
Message-ID: <20200718171714.GA237687@roeck-us.net>
References: <20200708152449.316476-1-hch@lst.de>
 <20200708152449.316476-4-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200708152449.316476-4-hch@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Daniel Borkmann <daniel@iogearbox.net>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Jesper Dangaard Brouer <brouer@redhat.com>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 08, 2020 at 05:24:47PM +0200, Christoph Hellwig wrote:
> Avoid the overhead of the dma ops support for tiny builds that only
> use the direct mapping.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

For ppc:pmac32_defconfig and other configurations, this patch results in:

Error log:
drivers/macintosh/macio_asic.c: In function 'macio_add_one_device':
drivers/macintosh/macio_asic.c:393:16: error: 'struct device' has no member named 'dma_ops'
  393 |  dev->ofdev.dev.dma_ops = chip->lbus.pdev->dev.dma_ops;
      |                ^
drivers/macintosh/macio_asic.c:393:47: error: 'struct device' has no member named 'dma_ops'
  393 |  dev->ofdev.dev.dma_ops = chip->lbus.pdev->dev.dma_ops;
      |                                               ^

Bisect log attached.

Guenter

---
# bad: [aab7ee9f8ff0110bfcd594b33dc33748dc1baf46] Add linux-next specific files for 20200717
# good: [11ba468877bb23f28956a35e896356252d63c983] Linux 5.8-rc5
git bisect start 'HEAD' 'v5.8-rc5'
# bad: [4d55a7a1298d197755c1a0f4512f56917e938a83] Merge remote-tracking branch 'crypto/master'
git bisect bad 4d55a7a1298d197755c1a0f4512f56917e938a83
# bad: [49485850238eb3fc72aac951e47e33e367aafbab] Merge remote-tracking branch 'hid/for-next'
git bisect bad 49485850238eb3fc72aac951e47e33e367aafbab
# bad: [4406fe306759d700f2b2aa8adf890a7d7ef064ae] Merge remote-tracking branch 'tegra/for-next'
git bisect bad 4406fe306759d700f2b2aa8adf890a7d7ef064ae
# bad: [27f18f0e00ed1f15ee55d479216c874561b6b70a] Merge remote-tracking branch 'arm-soc/for-next'
git bisect bad 27f18f0e00ed1f15ee55d479216c874561b6b70a
# good: [a23a793b03f465cf2222fa29e7f81d732a6f6fdf] Merge remote-tracking branch 'usb-chipidea-fixes/ci-for-usb-stable'
git bisect good a23a793b03f465cf2222fa29e7f81d732a6f6fdf
# good: [05d94a2de41e8d9840d9749d553febdcf99cb0e5] Merge branch 'arm/drivers' into for-next
git bisect good 05d94a2de41e8d9840d9749d553febdcf99cb0e5
# good: [5fef5dc17f097794288acb098ccc80eb91142bf4] Merge branch 'for-next/mte' into for-next/core
git bisect good 5fef5dc17f097794288acb098ccc80eb91142bf4
# good: [3c7f84b2248457030a903813e4af71d80141d663] Merge remote-tracking branch 'fpga-fixes/fixes'
git bisect good 3c7f84b2248457030a903813e4af71d80141d663
# bad: [88ff79e455afa3ac90739da27e24f655a965e3cf] Merge remote-tracking branch 'dma-mapping/for-next'
git bisect bad 88ff79e455afa3ac90739da27e24f655a965e3cf
# good: [7c4d50d4973b40c53ef6c592b41b0473127e6762] kbuild: do not export LDFLAGS_vmlinux
git bisect good 7c4d50d4973b40c53ef6c592b41b0473127e6762
# good: [c45db534668104ed5112ed371526db6096ac5742] Merge remote-tracking branch 'kbuild/for-next'
git bisect good c45db534668104ed5112ed371526db6096ac5742
# bad: [249542813648f7a278895ad25674d3e147f49ad6] dma-mapping: make support for dma ops optional
git bisect bad 249542813648f7a278895ad25674d3e147f49ad6
# good: [b4174173005972f8f6497883d08d87e0aba1b604] dma-mapping: inline the fast path dma-direct calls
git bisect good b4174173005972f8f6497883d08d87e0aba1b604
# first bad commit: [249542813648f7a278895ad25674d3e147f49ad6] dma-mapping: make support for dma ops optional
