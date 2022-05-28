Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8F8536B8E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 May 2022 10:06:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L9Dl44zmWz3bqR
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 May 2022 18:06:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=YC6A5Lns;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.53; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=YC6A5Lns;
	dkim-atps=neutral
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L9DkM6MRbz302S
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 May 2022 18:05:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1653725111;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=vhGwfA5FjXV3/bkFwfAXQFrpRJdXup/M32Fjq4ZU9Cs=;
    b=YC6A5Lns1cUZU0tT4DLP8tli9O6aZX2wpkTqjfxkiKuKFzLuA1INmuC/yYDN+e9iny
    jcuJ4yfuHcQxNf3g9J6yjxvEwGL//SwjQYR2pMVLezeWpVmOhbcCfIpf1sG32PFS9trE
    KL0Y0jHxnNl3QmPz2d3HSSF5GnMieQfK4XxDS8TQyw49ideX3O6xsLilwYoa85a7Jb4K
    qOLPYeIxRuUzW+8qc+GeDjyh7IECMedRkmw3tbUC7zEnGmvWRhQ7AIqv5A4bgEMItMLo
    xCtmaP3i9fNb+Km0PYWxZdwICSPzuQQ0q8bMFXUT83q96sxQsd8bvA4AdYkF7sMQd5pr
    Zeow==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBfio0GngadwjR6VFJ75I/3hsuT3TLPFiWDLPBCg=="
X-RZG-CLASS-ID: mo00
Received: from [IPV6:2a02:8109:8980:4474:4017:e56c:e898:2b8d]
    by smtp.strato.de (RZmta 47.45.0 AUTH)
    with ESMTPSA id 205ca1y4S85AgBV
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 28 May 2022 10:05:10 +0200 (CEST)
Content-Type: multipart/mixed; boundary="------------VT6F2zBl8Zl4Tl0Z9Jm1dy02"
Message-ID: <f2945a3f-04c6-9685-3193-62d02e6453b8@xenosoft.de>
Date: Sat, 28 May 2022 10:05:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [FSL P50x0] Keyboard and mouse don't work anymore after the
 devicetree updates for 5.19
Content-Language: de-DE
To: Rob Herring <robh@kernel.org>
References: <283c811b-27f7-64a8-8a67-11cf6c3a79cf@xenosoft.de>
 <2e1b72bd-ae44-19d1-5981-09f5c69759dc@csgroup.eu>
 <OSZPR01MB7019C5EC6E5CF5230600B283AAD89@OSZPR01MB7019.jpnprd01.prod.outlook.com>
 <8a2aa8a5-55b3-93e9-7428-867311f568e2@xenosoft.de>
 <OSZPR01MB7019313DCB5A79F91BE6D91CAAD89@OSZPR01MB7019.jpnprd01.prod.outlook.com>
 <9e8dd323-4a36-abb2-568d-fe1384b1579c@xenosoft.de>
 <CAL_JsqLN6bT=YhyRTVWU2WmG-htCujtCROQuK+gdMUHMSHVeaQ@mail.gmail.com>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
In-Reply-To: <CAL_JsqLN6bT=YhyRTVWU2WmG-htCujtCROQuK+gdMUHMSHVeaQ@mail.gmail.com>
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
Cc: Darren Stevens <darren@stevens-zone.net>, mad skateman <madskateman@gmail.com>, Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------VT6F2zBl8Zl4Tl0Z9Jm1dy02
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27 May 2022 at 04:23 am, Rob Herring wrote:
> The issue is in drivers/usb/host/fsl-mph-dr-of.c which copies the
> resources to a child platform device. Can you try the following
> change:
>
> diff --git a/drivers/usb/host/fsl-mph-dr-of.c b/drivers/usb/host/fsl-mph-dr-of.c
> index 44a7e58a26e3..47d9b7be60da 100644
> --- a/drivers/usb/host/fsl-mph-dr-of.c
> +++ b/drivers/usb/host/fsl-mph-dr-of.c
> @@ -80,8 +80,6 @@ static struct platform_device *fsl_usb2_device_register(
>                                          const char *name, int id)
>   {
>          struct platform_device *pdev;
> -       const struct resource *res = ofdev->resource;
> -       unsigned int num = ofdev->num_resources;
>          int retval;
>
>          pdev = platform_device_alloc(name, id);
> @@ -106,11 +104,7 @@ static struct platform_device *fsl_usb2_device_register(
>          if (retval)
>                  goto error;
>
> -       if (num) {
> -               retval = platform_device_add_resources(pdev, res, num);
> -               if (retval)
> -                       goto error;
> -       }
> +       pdev->dev.of_node = ofdev->dev.of_node;
>
>          retval = platform_device_add(pdev);
>          if (retval)
Hi Rob,

Thanks a lot for your patch! :-)

First attempt with the latest git kernel:

patching file a/drivers/usb/host/fsl-mph-dr-of.c
Hunk #1 FAILED at 80.
Hunk #2 FAILED at 106.
2 out of 2 hunks FAILED -- saving rejects to file 
a/drivers/usb/host/fsl-mph-dr-of.c.rej

I created a new patch with your modifications. (see attachment)

Unfortunately I can't test it. The git kernel doesn't compile currently.

powerpc-linux-gnu-ld: net/rds/tcp_stats.o:(.bss+0x0): multiple 
definition of `____cacheline_aligned'; init/version.o:(.bss+0x0): first 
defined here
powerpc-linux-gnu-ld: net/wireless/wext-spy.o:(.bss+0x0): multiple 
definition of `____cacheline_aligned'; init/version.o:(.bss+0x0): first 
defined here
powerpc-linux-gnu-ld: net/wireless/wext-priv.o:(.bss+0x0): multiple 
definition of `____cacheline_aligned'; init/version.o:(.bss+0x0): first 
defined here
powerpc-linux-gnu-ld: net/tipc/bcast.o:(.bss+0x0): multiple definition 
of `____cacheline_aligned'; init/version.o:(.bss+0x0): first defined here
powerpc-linux-gnu-ld: net/tipc/bearer.o:(.bss+0x0): multiple definition 
of `____cacheline_aligned'; init/version.o:(.bss+0x0): first defined here
powerpc-linux-gnu-ld: net/tipc/core.o:(.bss+0x0): multiple definition of 
`____cacheline_aligned'; init/version.o:(.bss+0x0): first defined here
powerpc-linux-gnu-ld: net/tipc/link.o:(.bss+0x0): multiple definition of 
`____cacheline_aligned'; init/version.o:(.bss+0x0): first defined here
powerpc-linux-gnu-ld: net/tipc/discover.o:(.bss+0x0): multiple 
definition of `____cacheline_aligned'; init/version.o:(.bss+0x0): first 
defined here
powerpc-linux-gnu-ld: net/tipc/msg.o:(.bss+0x0): multiple definition of 
`____cacheline_aligned'; init/version.o:(.bss+0x0): first defined here
powerpc-linux-gnu-ld: net/tipc/name_distr.o:(.bss+0x0): multiple 
definition of `____cacheline_aligned'; init/version.o:(.bss+0x0): first 
defined here
powerpc-linux-gnu-ld: net/tipc/subscr.o:(.bss+0x0): multiple definition 
of `____cacheline_aligned'; init/version.o:(.bss+0x0): first defined here
powerpc-linux-gnu-ld: net/tipc/name_table.o:(.bss+0x0): multiple 
definition of `____cacheline_aligned'; init/version.o:(.bss+0x0): first 
defined here
powerpc-linux-gnu-ld: net/tipc/net.o:(.bss+0x0): multiple definition of 
`____cacheline_aligned'; init/version.o:(.bss+0x0): first defined here
powerpc-linux-gnu-ld: net/tipc/netlink.o:(.bss+0x0): multiple definition 
of `____cacheline_aligned'; init/version.o:(.bss+0x0): first defined here
powerpc-linux-gnu-ld: net/tipc/netlink_compat.o:(.bss+0x0): multiple 
definition of `____cacheline_aligned'; init/version.o:(.bss+0x0): first 
defined here
powerpc-linux-gnu-ld: net/tipc/node.o:(.bss+0x0): multiple definition of 
`____cacheline_aligned'; init/version.o:(.bss+0x0): first defined here
powerpc-linux-gnu-ld: net/tipc/eth_media.o:(.bss+0x0): multiple 
definition of `____cacheline_aligned'; init/version.o:(.bss+0x0): first 
defined here
powerpc-linux-gnu-ld: net/tipc/topsrv.o:(.bss+0x0): multiple definition 
of `____cacheline_aligned'; init/version.o:(.bss+0x0): first defined here
powerpc-linux-gnu-ld: net/tipc/group.o:(.bss+0x0): multiple definition 
of `____cacheline_aligned'; init/version.o:(.bss+0x0): first defined here
powerpc-linux-gnu-ld: net/tipc/trace.o:(.bss+0x0): multiple definition 
of `____cacheline_aligned'; init/version.o:(.bss+0x0): first defined here
powerpc-linux-gnu-ld: net/tipc/udp_media.o:(.bss+0x0): multiple 
definition of `____cacheline_aligned'; init/version.o:(.bss+0x0): first 
defined here
powerpc-linux-gnu-ld: net/tipc/sysctl.o:(.bss+0x40): multiple definition 
of `____cacheline_aligned'; init/version.o:(.bss+0x0): first defined here
powerpc-linux-gnu-ld: net/tipc/crypto.o:(.bss+0x0): multiple definition 
of `____cacheline_aligned'; init/version.o:(.bss+0x0): first defined here
powerpc-linux-gnu-ld: net/tipc/diag.o:(.bss+0x0): multiple definition of 
`____cacheline_aligned'; init/version.o:(.bss+0x0): first defined here
powerpc-linux-gnu-ld: net/9p/trans_common.o:(.bss+0x0): multiple 
definition of `____cacheline_aligned'; init/version.o:(.bss+0x0): first 
defined here
powerpc-linux-gnu-ld: net/9p/trans_virtio.o:(.bss+0x40): multiple 
definition of `____cacheline_aligned'; init/version.o:(.bss+0x0): first 
defined here
powerpc-linux-gnu-ld: net/6lowpan/ndisc.o:(.bss+0x0): multiple 
definition of `____cacheline_aligned'; init/version.o:(.bss+0x0): first 
defined here
powerpc-linux-gnu-ld: net/sysctl_net.o:(.bss+0x80): multiple definition 
of `____cacheline_aligned'; init/version.o:(.bss+0x0): first defined here
make: *** [Makefile:1160: vmlinux] Error 1

@All
Could you please check the multiple definition of `____cacheline_aligned'?

Thanks,
Christian


--------------VT6F2zBl8Zl4Tl0Z9Jm1dy02
Content-Type: text/plain; charset=UTF-8; name="fsl-mph-dr-of.patch"
Content-Disposition: attachment; filename="fsl-mph-dr-of.patch"
Content-Transfer-Encoding: base64

LS0tIGEvZHJpdmVycy91c2IvaG9zdC9mc2wtbXBoLWRyLW9mLmMJMjAyMi0wNS0yOCAwOTox
MDoyNi43OTc2ODg0MjIgKzAyMDAKKysrIGIvZHJpdmVycy91c2IvaG9zdC9mc2wtbXBoLWRy
LW9mLmMJMjAyMi0wNS0yOCAwOToxNTowMS42Njg1OTQ4MDkgKzAyMDAKQEAgLTgwLDggKzgw
LDYgQEAgc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKmZzbF91c2IyXwogCQkJCQlj
b25zdCBjaGFyICpuYW1lLCBpbnQgaWQpCiB7CiAJc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldjsKLQljb25zdCBzdHJ1Y3QgcmVzb3VyY2UgKnJlcyA9IG9mZGV2LT5yZXNvdXJjZTsK
LQl1bnNpZ25lZCBpbnQgbnVtID0gb2ZkZXYtPm51bV9yZXNvdXJjZXM7CiAJaW50IHJldHZh
bDsKIAogCXBkZXYgPSBwbGF0Zm9ybV9kZXZpY2VfYWxsb2MobmFtZSwgaWQpOwpAQCAtMTA2
LDExICsxMDQsNyBAQCBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RldmljZSAqZnNsX3VzYjJf
CiAJaWYgKHJldHZhbCkKIAkJZ290byBlcnJvcjsKIAotCWlmIChudW0pIHsKLQkJcmV0dmFs
ID0gcGxhdGZvcm1fZGV2aWNlX2FkZF9yZXNvdXJjZXMocGRldiwgcmVzLCBudW0pOwotCQlp
ZiAocmV0dmFsKQotCQkJZ290byBlcnJvcjsKLQl9CisJcGRldi0+ZGV2Lm9mX25vZGUgPSBv
ZmRldi0+ZGV2Lm9mX25vZGU7CiAKIAlyZXR2YWwgPSBwbGF0Zm9ybV9kZXZpY2VfYWRkKHBk
ZXYpOwogCWlmIChyZXR2YWwpCg==

--------------VT6F2zBl8Zl4Tl0Z9Jm1dy02--
