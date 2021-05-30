Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C57A395141
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 May 2021 16:08:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FtKy52THZz30Bq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 May 2021 00:07:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=qnQLCirU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=r.bolshakov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=qnQLCirU; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FtKxd2zsNz2xfx
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 May 2021 00:07:33 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id DE812412E5;
 Sun, 30 May 2021 14:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1622383648;
 x=1624198049; bh=0IZCgUlLHX+G3/AJ9rVIa600Eqe8fDU7CQygMhOTG2s=; b=
 qnQLCirU8vuIRpmh2yGAm4NVfw10yWCg0e3EoF8kv6Yu5DCaDTNOHE258E+dQ1JP
 pnQmCe7fQZseu/j9ns9g4j36Oqg6V7buDZ5r63fBmIuiehTiEIW4C+S8/eIlSRDF
 qyQGlb3mTe30YBA3bCAZS1qsmG8xVz5EasOKdc9E794=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dbp0Ye_1WFHA; Sun, 30 May 2021 17:07:28 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 065BE4128A;
 Sun, 30 May 2021 17:07:24 +0300 (MSK)
Received: from localhost (172.22.1.233) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Sun, 30
 May 2021 17:07:24 +0300
Date: Sun, 30 May 2021 17:07:23 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] Revert "powerpc: Switch to relative jump labels"
Message-ID: <YLOcG55/gCNuMsBU@SPB-NB-133.local>
References: <20210528012943.23192-1-r.bolshakov@yadro.com>
 <87pmxah1h6.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87pmxah1h6.fsf@mpe.ellerman.id.au>
X-Originating-IP: [172.22.1.233]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux@yadro.com,
 Paul Mackerras <paulus@samba.org>, Anastasia Kovaleva <a.kovaleva@yadro.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, May 29, 2021 at 09:39:49AM +1000, Michael Ellerman wrote:
> Roman Bolshakov <r.bolshakov@yadro.com> writes:
> > This reverts commit b0b3b2c78ec075cec4721986a95abbbac8c3da4f.
> >
> > Otherwise, direct kernel boot with initramfs no longer works in QEMU.
> > It's broken in some bizarre way because a valid initramfs is not
> > recognized anymore:
> >
> >   Found initrd at 0xc000000001f70000:0xc000000003d61d64
> >   rootfs image is not initramfs (XZ-compressed data is corrupt); looks like an initrd
> >
> > The issue is observed on v5.13-rc3 if the kernel is built with
> > defconfig, GCC 7.5.0 and GNU ld 2.32.0.
> 
> Are you able to try a different compiler?

Hi Michael,

I've just tried GCC 9.3.1 and the result is the same.

The offending patch has assembly inlines, they typically go through
binutils/GAS and it might also be a case when older binutils doesn't
implement something properly (i've seen this on x86 and arm).

> I test booting qemu constantly, but I don't use GCC 7.5.
>
> And what qemu version are you using?
> 

QEMU 3.1.1, but I've also tried 6.0.50 (QEMU master, 62c0ac5041e913) and
it fails the same way.

> 
> I assume your initramfs is compressed with XZ? How large is it
> compressed?
> 

Yes, XZ. initramfs size is 30 MB (around 100 MB cpio size).

It's interesting that the issue doesn't happen if I pass initramfs from
host (11MB), then the initramfs can be recognized. It might be related
to initramfs size then and bigger initramfs that used to work no longer
work with v5.13-rc3.

So, I've created a small initramfs using only static busybox (2.7M
uncompressed, 960K compressed with xz). No error is produced and it
boots fine.

If I add a dummy file (11M off /dev/urandom) to the small busybox
initramfs, it boots and the init is started but I'm seeing the error:

  rootfs image is not initramfs (XZ-compressed data is corrupt); looks like an initrd

sha1sum of the file inside initramfs doesn't match sha1sum on the host.

  guest # sha1sum dummy
  407c347e671ddd00f69df12b3368048bad0ebf0c  dummy
  # QEMU: Terminated
  host $ sha1sum dummy
  ed8494b3eecab804960ceba2c497270eed0b0cd1  dummy

sha1sum is the same in the guest and on the host for 10M dummy file:

  guest # sha1sum dummy
  43855f7a772a28cce91da9eb8f86f53bc807631f  dummy
  # QEMU: Terminated
  host $ sha1sum dummy
  43855f7a772a28cce91da9eb8f86f53bc807631f  dummy

That might explain why bigger initramfs (or initramfs with bigger files)
doesn't boot - because some files might appear corrupted inside the guest.

Here're the sources of the initrd along with 11M dummy file:
  https://drive.yadro.com/s/W8HdbPnaKmPPwK4

I've compressed it with:
  $ find . 2>/dev/null | cpio -ocR 0:0 | xz  --check=crc32 > ../initrd-dummy.xz

Hope this helps,
Roman
