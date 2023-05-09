Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7434D6FCA4F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 17:33:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QG2J21twgz3fQ8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 01:33:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=FMLxTBr+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=htejun@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=FMLxTBr+;
	dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QG2H76ZLNz3fKx
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 May 2023 01:33:07 +1000 (AEST)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6438d95f447so4178539b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 May 2023 08:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683646385; x=1686238385;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i7WJkpzGGE6V0xVNeJVOJY0t5blLhcdTlZlbB7BS+gc=;
        b=FMLxTBr+wd5rAK2nIKeykMToZJkUULXyulEWPfS6JYiK1UgR5o2h3w26z+Yp5/E1dr
         bDqh6NUr1VibilmFjm0izLQlHS7O3u2QFaPLG8TDdue+dxViTl4cFiDPcodggspN4syC
         0Jm5BWCsqs8t8xiPv8URVb3gGxjyDJE1h8qhQgkRNUUk5CFvN/6jMHeYjjnf+R5yfbCy
         v1/v7D3FsFSTef9YGbO+6gzivSoPl9Osoj5hd77kSs5lZbAUkusRsi+f3KewpSPOUIWl
         54LKKqInJG5+r4xX4y4CRd2skQp449TLmyTxz3UyHCpou2UndeaOOtJ1PVDJuQ/b9ImG
         H1wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683646385; x=1686238385;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i7WJkpzGGE6V0xVNeJVOJY0t5blLhcdTlZlbB7BS+gc=;
        b=jBKXrndJqwl7QjHvksBjNUvWdJeG1FDxe25gZsUTwY1U2224OQt1vyEssJ+vmd0/f7
         q3TiRazu/bVfS8Lsoq2k74rYIEYlg2hTJ5cXJPbEGLalMKmpXqnmcnnMX8cIi0QytRdb
         +QdskP6TP/Oxy8QwiZx5vKiyNljN+V5Ws4451xH70HQFtzME5xBAnmN9vB3nDTWK2c0Z
         dwfJJAr0qHBGssg3ix/OVMVkTn9dI5h62GBswcGZ1TksZa9gHscgaiT/bxZ1heMK8oNv
         RMCBDtuS8po/mKx1Ij0VNpjipG/MFyXYv0CJgDq5gexuppLfkGWz0Gp5gDEAKhHuTjMx
         YXvA==
X-Gm-Message-State: AC+VfDxTsnjex7tm8B+75i04AzQrRNvPlYP1Zvis6xf3HpO6V0NtdOJC
	B5UqlB9o46w/1Ij1zbJVSjQ=
X-Google-Smtp-Source: ACHHUZ74rXgHLVMBYI8vEBAiCwf0n8BlFeTay98rF3Y8zTkmdIFPU6Z4y3sKE+ysJMc+3elFYvlBmA==
X-Received: by 2002:a05:6a00:9a7:b0:638:7c22:6fd with SMTP id u39-20020a056a0009a700b006387c2206fdmr21606404pfg.1.1683646384720;
        Tue, 09 May 2023 08:33:04 -0700 (PDT)
Received: from localhost (2603-800c-1a02-1bae-a7fa-157f-969a-4cde.res6.spectrum.com. [2603:800c:1a02:1bae:a7fa:157f:969a:4cde])
        by smtp.gmail.com with ESMTPSA id p24-20020a62ab18000000b0063b5776b073sm1908446pff.117.2023.05.09.08.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 08:33:04 -0700 (PDT)
Date: Tue, 9 May 2023 05:33:02 -1000
From: Tejun Heo <tj@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: linux-next: boot warning
Message-ID: <ZFpnroBw-tJnyDbF@slm.duckdns.org>
References: <20230509122440.418068cb@canb.auug.org.au>
 <87mt2ex9oo.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87mt2ex9oo.fsf@mail.lhotse>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "Martin K. Petersen" <martin.petersen@oracle.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, James Bottomley <James.Bottomley@hansenpartnership.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 09, 2023 at 05:09:43PM +1000, Michael Ellerman wrote:
> Stephen Rothwell <sfr@canb.auug.org.au> writes:
> > Hi all,
> >
> > Today's qemu test boot (powerpc pseries_le_defconfig) produced this
> > warning:
> >
> > [    2.048588][    T1] ipr: IBM Power RAID SCSI Device Driver version: 2.6.4 (March 14, 2017)
> > [    2.051560][    T1] ------------[ cut here ]------------
> > [    2.052297][    T1] WARNING: CPU: 0 PID: 1 at kernel/workqueue.c:5925 workqueue_sysfs_register+0x20/0x1f0
> 
> Caused by 59709bb84c22 scsi: Use alloc_ordered_workqueue() to create ordered workqueues.

The patch is already dropped. It was applied only for a short window
yesterday. Should be okay now.

Thanks.

-- 
tejun
