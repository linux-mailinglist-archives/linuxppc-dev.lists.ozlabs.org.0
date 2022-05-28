Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 855D6536C35
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 May 2022 12:02:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L9HJv4Cg9z3c9C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 May 2022 20:02:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=J3xVbKzm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.52; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=J3xVbKzm;
	dkim-atps=neutral
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L9HJG1X9sz309K
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 May 2022 20:01:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1653732079;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=sbW/gFw34LfylgQ4q1IITyiYEDsJUEtGMqQj5XMQ+rM=;
    b=J3xVbKzmUnjEddXZZ3RK1LV/spy6udmegVw96XjfHY4nCqW7Mw/DkLScok06uohZcH
    Cw3yAJctbDs9honuBQvQWv0TS4Kw86+ViedONzQplnpH7cBjLWr4JIZSl2N1rm0/yJoc
    ih4Wok95qGhRpPXv6RifW1I6ZtXKL4KTruu1XwboqBHIX0n0OIBIfBjWoijI4a+xADdC
    lu9oVZnk1jT0dyZb7IquUrDglqSz3d3DE9xP2zIuSan9Ix7/AOtFblmoQyEt0F3AVqMa
    N9nZyPaHtt7asg3fwMpBnUq1VB8WT6/jJp4/57nB3A9RohgPxwqtuLAqBn52XGikW1E/
    ib6A==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBfio0GngadwjR6VFJ75I/3hsuT3TLPFiWDLPBCg=="
X-RZG-CLASS-ID: mo00
Received: from [IPV6:2a02:8109:8980:4474:4017:e56c:e898:2b8d]
    by smtp.strato.de (RZmta 47.45.0 AUTH)
    with ESMTPSA id 205ca1y4SA1IgL5
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 28 May 2022 12:01:18 +0200 (CEST)
Content-Type: multipart/mixed; boundary="------------zVsZdGeK2A7zrZ8Q9MgWrRH1"
Message-ID: <ea464a1d-407d-7a30-16f8-3efd32eca039@xenosoft.de>
Date: Sat, 28 May 2022 12:01:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [FSL P50x0] Keyboard and mouse don't work anymore after the
 devicetree updates for 5.19
Content-Language: de-DE
From: Christian Zigotzky <chzigotzky@xenosoft.de>
To: Rob Herring <robh@kernel.org>
References: <283c811b-27f7-64a8-8a67-11cf6c3a79cf@xenosoft.de>
 <2e1b72bd-ae44-19d1-5981-09f5c69759dc@csgroup.eu>
 <OSZPR01MB7019C5EC6E5CF5230600B283AAD89@OSZPR01MB7019.jpnprd01.prod.outlook.com>
 <8a2aa8a5-55b3-93e9-7428-867311f568e2@xenosoft.de>
 <OSZPR01MB7019313DCB5A79F91BE6D91CAAD89@OSZPR01MB7019.jpnprd01.prod.outlook.com>
 <9e8dd323-4a36-abb2-568d-fe1384b1579c@xenosoft.de>
 <CAL_JsqLN6bT=YhyRTVWU2WmG-htCujtCROQuK+gdMUHMSHVeaQ@mail.gmail.com>
 <f2945a3f-04c6-9685-3193-62d02e6453b8@xenosoft.de>
In-Reply-To: <f2945a3f-04c6-9685-3193-62d02e6453b8@xenosoft.de>
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
--------------zVsZdGeK2A7zrZ8Q9MgWrRH1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 28 May 2022 at 10:05 am, Christian Zigotzky wrote:
> On 27 May 2022 at 04:23 am, Rob Herring wrote:
>> The issue is in drivers/usb/host/fsl-mph-dr-of.c which copies the
>> resources to a child platform device. Can you try the following
>> change:
>>
>> diff --git a/drivers/usb/host/fsl-mph-dr-of.c 
>> b/drivers/usb/host/fsl-mph-dr-of.c
>> index 44a7e58a26e3..47d9b7be60da 100644
>> --- a/drivers/usb/host/fsl-mph-dr-of.c
>> +++ b/drivers/usb/host/fsl-mph-dr-of.c
>> @@ -80,8 +80,6 @@ static struct platform_device 
>> *fsl_usb2_device_register(
>>                                          const char *name, int id)
>>   {
>>          struct platform_device *pdev;
>> -       const struct resource *res = ofdev->resource;
>> -       unsigned int num = ofdev->num_resources;
>>          int retval;
>>
>>          pdev = platform_device_alloc(name, id);
>> @@ -106,11 +104,7 @@ static struct platform_device 
>> *fsl_usb2_device_register(
>>          if (retval)
>>                  goto error;
>>
>> -       if (num) {
>> -               retval = platform_device_add_resources(pdev, res, num);
>> -               if (retval)
>> -                       goto error;
>> -       }
>> +       pdev->dev.of_node = ofdev->dev.of_node;
>>
>>          retval = platform_device_add(pdev);
>>          if (retval)
> Hi Rob,
>
> Thanks a lot for your patch! :-)
>
> First attempt with the latest git kernel:
>
> patching file a/drivers/usb/host/fsl-mph-dr-of.c
> Hunk #1 FAILED at 80.
> Hunk #2 FAILED at 106.
> 2 out of 2 hunks FAILED -- saving rejects to file 
> a/drivers/usb/host/fsl-mph-dr-of.c.rej
>
> I created a new patch with your modifications. (see attachment)
>
> Unfortunately I can't test it. The git kernel doesn't compile currently.
>
> powerpc-linux-gnu-ld: net/rds/tcp_stats.o:(.bss+0x0): multiple 
> definition of `____cacheline_aligned'; init/version.o:(.bss+0x0): 
> first defined here
> powerpc-linux-gnu-ld: net/wireless/wext-spy.o:(.bss+0x0): multiple 
> definition of `____cacheline_aligned'; init/version.o:(.bss+0x0): 
> first defined here
> powerpc-linux-gnu-ld: net/wireless/wext-priv.o:(.bss+0x0): multiple 
> definition of `____cacheline_aligned'; init/version.o:(.bss+0x0): 
> first defined here
> powerpc-linux-gnu-ld: net/tipc/bcast.o:(.bss+0x0): multiple definition 
> of `____cacheline_aligned'; init/version.o:(.bss+0x0): first defined here
> powerpc-linux-gnu-ld: net/tipc/bearer.o:(.bss+0x0): multiple 
> definition of `____cacheline_aligned'; init/version.o:(.bss+0x0): 
> first defined here
> powerpc-linux-gnu-ld: net/tipc/core.o:(.bss+0x0): multiple definition 
> of `____cacheline_aligned'; init/version.o:(.bss+0x0): first defined here
> powerpc-linux-gnu-ld: net/tipc/link.o:(.bss+0x0): multiple definition 
> of `____cacheline_aligned'; init/version.o:(.bss+0x0): first defined here
> powerpc-linux-gnu-ld: net/tipc/discover.o:(.bss+0x0): multiple 
> definition of `____cacheline_aligned'; init/version.o:(.bss+0x0): 
> first defined here
> powerpc-linux-gnu-ld: net/tipc/msg.o:(.bss+0x0): multiple definition 
> of `____cacheline_aligned'; init/version.o:(.bss+0x0): first defined here
> powerpc-linux-gnu-ld: net/tipc/name_distr.o:(.bss+0x0): multiple 
> definition of `____cacheline_aligned'; init/version.o:(.bss+0x0): 
> first defined here
> powerpc-linux-gnu-ld: net/tipc/subscr.o:(.bss+0x0): multiple 
> definition of `____cacheline_aligned'; init/version.o:(.bss+0x0): 
> first defined here
> powerpc-linux-gnu-ld: net/tipc/name_table.o:(.bss+0x0): multiple 
> definition of `____cacheline_aligned'; init/version.o:(.bss+0x0): 
> first defined here
> powerpc-linux-gnu-ld: net/tipc/net.o:(.bss+0x0): multiple definition 
> of `____cacheline_aligned'; init/version.o:(.bss+0x0): first defined here
> powerpc-linux-gnu-ld: net/tipc/netlink.o:(.bss+0x0): multiple 
> definition of `____cacheline_aligned'; init/version.o:(.bss+0x0): 
> first defined here
> powerpc-linux-gnu-ld: net/tipc/netlink_compat.o:(.bss+0x0): multiple 
> definition of `____cacheline_aligned'; init/version.o:(.bss+0x0): 
> first defined here
> powerpc-linux-gnu-ld: net/tipc/node.o:(.bss+0x0): multiple definition 
> of `____cacheline_aligned'; init/version.o:(.bss+0x0): first defined here
> powerpc-linux-gnu-ld: net/tipc/eth_media.o:(.bss+0x0): multiple 
> definition of `____cacheline_aligned'; init/version.o:(.bss+0x0): 
> first defined here
> powerpc-linux-gnu-ld: net/tipc/topsrv.o:(.bss+0x0): multiple 
> definition of `____cacheline_aligned'; init/version.o:(.bss+0x0): 
> first defined here
> powerpc-linux-gnu-ld: net/tipc/group.o:(.bss+0x0): multiple definition 
> of `____cacheline_aligned'; init/version.o:(.bss+0x0): first defined here
> powerpc-linux-gnu-ld: net/tipc/trace.o:(.bss+0x0): multiple definition 
> of `____cacheline_aligned'; init/version.o:(.bss+0x0): first defined here
> powerpc-linux-gnu-ld: net/tipc/udp_media.o:(.bss+0x0): multiple 
> definition of `____cacheline_aligned'; init/version.o:(.bss+0x0): 
> first defined here
> powerpc-linux-gnu-ld: net/tipc/sysctl.o:(.bss+0x40): multiple 
> definition of `____cacheline_aligned'; init/version.o:(.bss+0x0): 
> first defined here
> powerpc-linux-gnu-ld: net/tipc/crypto.o:(.bss+0x0): multiple 
> definition of `____cacheline_aligned'; init/version.o:(.bss+0x0): 
> first defined here
> powerpc-linux-gnu-ld: net/tipc/diag.o:(.bss+0x0): multiple definition 
> of `____cacheline_aligned'; init/version.o:(.bss+0x0): first defined here
> powerpc-linux-gnu-ld: net/9p/trans_common.o:(.bss+0x0): multiple 
> definition of `____cacheline_aligned'; init/version.o:(.bss+0x0): 
> first defined here
> powerpc-linux-gnu-ld: net/9p/trans_virtio.o:(.bss+0x40): multiple 
> definition of `____cacheline_aligned'; init/version.o:(.bss+0x0): 
> first defined here
> powerpc-linux-gnu-ld: net/6lowpan/ndisc.o:(.bss+0x0): multiple 
> definition of `____cacheline_aligned'; init/version.o:(.bss+0x0): 
> first defined here
> powerpc-linux-gnu-ld: net/sysctl_net.o:(.bss+0x80): multiple 
> definition of `____cacheline_aligned'; init/version.o:(.bss+0x0): 
> first defined here
> make: *** [Makefile:1160: vmlinux] Error 1
>
> @All
> Could you please check the multiple definition of 
> `____cacheline_aligned'?
>
> Thanks,
> Christian
>
Fix at
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20220527112035.2842155-1-mpe@ellerman.id.au/

Christophe

------

Thank you for your hint. It compiles with the paca.patch.

@Rob
Unfortunately with your modifications I get a boot loop.

I compiled it also with the reverting patch (see attachment) and then it 
boots and works.

Thanks,
Christian

--------------zVsZdGeK2A7zrZ8Q9MgWrRH1
Content-Type: text/plain; charset=UTF-8; name="of.patch"
Content-Disposition: attachment; filename="of.patch"
Content-Transfer-Encoding: base64

LS0tIGEvZHJpdmVycy9vZi9wbGF0Zm9ybS5jCTIwMjItMDUtMjYgMTg6NDY6MTUuNTUxNjU2
MDI1ICswMjAwCisrKyBiL2RyaXZlcnMvb2YvcGxhdGZvcm0uYwkyMDIyLTA1LTIyIDIxOjUy
OjMxLjAwMDAwMDAwMCArMDIwMApAQCAtMTE0LDMxICsxMTQsMzUgQEAgc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqb2ZfZGV2aWNlX2FsbG9jKAogCQkJCSAgc3RydWN0IGRldmljZSAqcGFy
ZW50KQogewogCXN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKmRldjsKLQlpbnQgcmMsIGksIG51
bV9yZWcgPSAwOworCWludCByYywgaSwgbnVtX3JlZyA9IDAsIG51bV9pcnE7CiAJc3RydWN0
IHJlc291cmNlICpyZXMsIHRlbXBfcmVzOwogCiAJZGV2ID0gcGxhdGZvcm1fZGV2aWNlX2Fs
bG9jKCIiLCBQTEFURk9STV9ERVZJRF9OT05FKTsKIAlpZiAoIWRldikKIAkJcmV0dXJuIE5V
TEw7CiAKLQkvKiBjb3VudCB0aGUgaW8gcmVzb3VyY2VzICovCisJLyogY291bnQgdGhlIGlv
IGFuZCBpcnEgcmVzb3VyY2VzICovCiAJd2hpbGUgKG9mX2FkZHJlc3NfdG9fcmVzb3VyY2Uo
bnAsIG51bV9yZWcsICZ0ZW1wX3JlcykgPT0gMCkKIAkJbnVtX3JlZysrOworCW51bV9pcnEg
PSBvZl9pcnFfY291bnQobnApOwogCiAJLyogUG9wdWxhdGUgdGhlIHJlc291cmNlIHRhYmxl
ICovCi0JaWYgKG51bV9yZWcpIHsKLQkJcmVzID0ga2NhbGxvYyhudW1fcmVnLCBzaXplb2Yo
KnJlcyksIEdGUF9LRVJORUwpOworCWlmIChudW1faXJxIHx8IG51bV9yZWcpIHsKKwkJcmVz
ID0ga2NhbGxvYyhudW1faXJxICsgbnVtX3JlZywgc2l6ZW9mKCpyZXMpLCBHRlBfS0VSTkVM
KTsKIAkJaWYgKCFyZXMpIHsKIAkJCXBsYXRmb3JtX2RldmljZV9wdXQoZGV2KTsKIAkJCXJl
dHVybiBOVUxMOwogCQl9CiAKLQkJZGV2LT5udW1fcmVzb3VyY2VzID0gbnVtX3JlZzsKKwkJ
ZGV2LT5udW1fcmVzb3VyY2VzID0gbnVtX3JlZyArIG51bV9pcnE7CiAJCWRldi0+cmVzb3Vy
Y2UgPSByZXM7CiAJCWZvciAoaSA9IDA7IGkgPCBudW1fcmVnOyBpKyssIHJlcysrKSB7CiAJ
CQlyYyA9IG9mX2FkZHJlc3NfdG9fcmVzb3VyY2UobnAsIGksIHJlcyk7CiAJCQlXQVJOX09O
KHJjKTsKIAkJfQorCQlpZiAob2ZfaXJxX3RvX3Jlc291cmNlX3RhYmxlKG5wLCByZXMsIG51
bV9pcnEpICE9IG51bV9pcnEpCisJCQlwcl9kZWJ1Zygibm90IGFsbCBsZWdhY3kgSVJRIHJl
c291cmNlcyBtYXBwZWQgZm9yICVwT0ZuXG4iLAorCQkJCSBucCk7CiAJfQogCiAJZGV2LT5k
ZXYub2Zfbm9kZSA9IG9mX25vZGVfZ2V0KG5wKTsK

--------------zVsZdGeK2A7zrZ8Q9MgWrRH1--
