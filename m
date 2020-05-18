Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 512E51D7913
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 15:00:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49QfJS3KdqzDqgd
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 23:00:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=samsung.com (client-ip=210.118.77.11;
 helo=mailout1.w1.samsung.com; envelope-from=b.zolnierkie@samsung.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256
 header.s=mail20170921 header.b=X13oMF5E; 
 dkim-atps=neutral
X-Greylist: delayed 562 seconds by postgrey-1.36 at bilbo;
 Mon, 18 May 2020 22:58:11 AEST
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49QfFb5fNFzDqVZ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 May 2020 22:58:08 +1000 (AEST)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200518124840euoutp019cd09704ee6cf8d1779e313b3c54b567~QID5d1kXN0078200782euoutp01v
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 May 2020 12:48:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200518124840euoutp019cd09704ee6cf8d1779e313b3c54b567~QID5d1kXN0078200782euoutp01v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1589806120;
 bh=ozCAjtJX3BvoMJPBa6yqxWWHN4bFmHrB/2QSdZDm/Jo=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=X13oMF5EHiBph/3B8diQpq9Qw1b5ohFrYEQkG42Y7BPTm6jtEo/j6QVFm3OGUt+e5
 pAQQeCq3J3V2ZAOnsZfbsJCWp8y4UBOlIwlR1U4HGRpcqrFnwQ/E6SUCXTF7QO9YzE
 ulv0jVs3wR77qgtJ52dBLgQ+KlykNZ8D1JqQ88GE=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200518124840eucas1p2ddc7d93fa30433a206302d06b7ebf55a~QID5PkBRS3273332733eucas1p2C;
 Mon, 18 May 2020 12:48:40 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 08.64.60679.72482CE5; Mon, 18
 May 2020 13:48:39 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200518124839eucas1p21eb2b756b94e68c1d27b0950f1436d21~QID4jpeeD3242532425eucas1p2D;
 Mon, 18 May 2020 12:48:39 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200518124839eusmtrp24948f0dbf59c559d1a730aca4698ab91~QID4i5TKu0856008560eusmtrp2p;
 Mon, 18 May 2020 12:48:39 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-c8-5ec28427a28e
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 64.0C.08375.72482CE5; Mon, 18
 May 2020 13:48:39 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200518124839eusmtip18e935c65d42d3e18d06df6ab7f0d8324~QID4E3z5y1014510145eusmtip1D;
 Mon, 18 May 2020 12:48:39 +0000 (GMT)
Subject: Re: [PATCH v2 2/2] powerpc/configs: replace deprecated riva/nvidia
 with nouveau
To: Emil Velikov <emil.l.velikov@gmail.com>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <3bd8fb59-2a91-64d7-bef9-d5f717c49bfb@samsung.com>
Date: Mon, 18 May 2020 14:48:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CACvgo53uWVmhwon4+Fn5=_4HPXSciqNrf1MSJjt1kA3G2wyECw@mail.gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNKsWRmVeSWpSXmKPExsWy7djPc7rqLYfiDCZts7H42f2FzeJDUyuz
 xZWv79ks9ly9x2Rxou8Dq8Xv7/9YLbY0HGKzWHNkMbsDh8eilw0sHjtn3WX36HnTwupxv/s4
 k8f5GQsZPebu6mP0+LxJLoA9issmJTUnsyy1SN8ugSvj7aFpjAU/JCt+vP/D2MA4X7SLkZND
 QsBE4u+nX4xdjFwcQgIrGCWaVh+Gcr4wSkx9PpcJwvnMKPHk/F02mJYDD/8yQySWM0oc2PmV
 HcJ5C9SyaQUTSJWwQJREw8nNjCC2iIC2xPSHc8A6mAW2MkncubYPbBSbgJXExPZVYEW8AnYS
 x6fOB4pzcLAIqEr8mKwCEhYViJD49OAwK0SJoMTJmU9YQGxOgUCJZ+enge1iFhCXuPVkPpQt
 L7H9LcQuCYFz7BKfp59nhjjbReLwouOMELawxKvjW9ghbBmJ/zvnM0E0rGOU+NvxAqp7O6PE
 8sn/oJ62lrhz7hfYdcwCmhLrd+lDhB0l9s7fzggSlhDgk7jxVhDiCD6JSdumM0OEeSU62oQg
 qtUkNizbwAaztmvnSuYJjEqzkLw2C8k7s5C8Mwth7wJGllWM4qmlxbnpqcVGeanlesWJucWl
 eel6yfm5mxiBSer0v+NfdjDu+pN0iFGAg1GJhzch/1CcEGtiWXFl7iFGCQ5mJRHeyM/74oR4
 UxIrq1KL8uOLSnNSiw8xSnOwKInzGi96GSskkJ5YkpqdmlqQWgSTZeLglGpg9LO5dDZro35I
 U9XeKf5NllxLVdx3c+13VHyXxctm3nr86y4fjaWiT0MfXlLtf2doUvmDp3n+vu0H+Vl5Lu58
 nu0tdsMqVur63W1upZccp5Ts+HXce+6do49r9sV9mF6//1lXqaAUT3eC2+SfeXuaXLg3OG24
 xfnPUdli5rzmqheTlr04utPtmRJLcUaioRZzUXEiAM/n2OlOAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRmVeSWpSXmKPExsVy+t/xu7rqLYfiDI7fU7P42f2FzeJDUyuz
 xZWv79ks9ly9x2Rxou8Dq8Xv7/9YLbY0HGKzWHNkMbsDh8eilw0sHjtn3WX36HnTwupxv/s4
 k8f5GQsZPebu6mP0+LxJLoA9Ss+mKL+0JFUhI7+4xFYp2tDCSM/Q0kLPyMRSz9DYPNbKyFRJ
 384mJTUnsyy1SN8uQS/j7aFpjAU/JCt+vP/D2MA4X7SLkZNDQsBE4sDDv8wgtpDAUkaJ9X/N
 uxg5gOIyEsfXl0GUCEv8udbF1sXIBVTymlFi3t79bCAJYYEoiYaTmxlBbBEBbYnpD+cwgxQx
 C+xkkui+1sEM0bGNSeLYpV9MIFVsAlYSE9tXgXXwCthJHJ86nw1kG4uAqsSPySogYVGBCInD
 O2ZBlQhKnJz5hAXE5hQIlHh2fhrYGGYBdYk/8y4xQ9jiEreezIeKy0tsfzuHeQKj0Cwk7bOQ
 tMxC0jILScsCRpZVjCKppcW56bnFhnrFibnFpXnpesn5uZsYgRG57djPzTsYL20MPsQowMGo
 xMObkH8oTog1say4MvcQowQHs5IIb+TnfXFCvCmJlVWpRfnxRaU5qcWHGE2BfpvILCWanA9M
 Fnkl8YamhuYWlobmxubGZhZK4rwdAgdjhATSE0tSs1NTC1KLYPqYODilGhjjnBnUuY15XYNb
 BO7nfmLb+XRn64RfzYv/OB3K8e6t4mD99+nVkRVTpKd/8T3H+MroVXzxjQY+XYkN92x4Gmpz
 Pi3l7Zl/hqmya8sC1bm2ZxOKeD8zFXrnX0ltXrfrZcr9fw3/KmyTL2zKvpo0RV7SIlQ9vnPN
 bb4nC77tzF+/PjUqiS/4aY8SS3FGoqEWc1FxIgAycUL23gIAAA==
X-CMS-MailID: 20200518124839eucas1p21eb2b756b94e68c1d27b0950f1436d21
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200518112226eucas1p1aa59db1e75cf0f91454b8714c828444c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200518112226eucas1p1aa59db1e75cf0f91454b8714c828444c
References: <20200517220524.4036334-1-emil.l.velikov@gmail.com>
 <20200517220524.4036334-2-emil.l.velikov@gmail.com>
 <87d071aedu.fsf@mpe.ellerman.id.au>
 <CGME20200518112226eucas1p1aa59db1e75cf0f91454b8714c828444c@eucas1p1.samsung.com>
 <CACvgo53uWVmhwon4+Fn5=_4HPXSciqNrf1MSJjt1kA3G2wyECw@mail.gmail.com>
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
Cc: linux-fbdev <linux-fbdev@vger.kernel.org>,
 Antonino Daplas <adaplas@gmail.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 5/18/20 1:19 PM, Emil Velikov wrote:
> Hi Michael,
> 
> On Mon, 18 May 2020 at 08:30, Michael Ellerman <mpe@ellerman.id.au> wrote:
>>
>> Emil Velikov <emil.l.velikov@gmail.com> writes:
>>> As mentioned in earlier commit, the riva and nvidia fbdev drivers have
>>> seen no love over the years, are short on features and overall below par
>>>
>>> Users are encouraged to switch to the nouveau drm driver instead.
>>>
>>> v2: Split configs to separate patch, enable nouveau (Bartlomiej)
>>>
>>> Cc: Antonino Daplas <adaplas@gmail.com>
>>> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
>>> Cc: linux-fbdev@vger.kernel.org
>>> Cc: dri-devel@lists.freedesktop.org
>>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>>> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>>> Cc: Paul Mackerras <paulus@samba.org>
>>> Cc: linuxppc-dev@lists.ozlabs.org
>>> Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
>>> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch> (v1)
>>> ---
>>> Hi all unless, there are objections I would prefer to merge this via
>>> the drm tree.
>>
>> Have you tested that the resulting kernels work on the relevant
>> hardware?
>>
> Sadly, no I haven't. I'm updating the defconfigs as requested by the
> fbdev maintainer.

I've just noticed that v1 (patch #1/1) & v2 (patch #1/2) lack
Cc: to powerpc Maintainers so they cannot see the context of
changes in this patch.

Also you've proposed v1 yourself and it has already contained
modifications to defconfigs (removal of setting the config
options for the old drivers) in addition to marking the old
drivers as BROKEN.

It now turns out that v1 has also never been tested. :(

Please don't submit untested patches without marking them
as such.

>> The old drivers may be crufty but they presumably have been tested by
>> people and at least somewhat work.
>>
>> So I'd be inclined to leave the defconfigs alone until someone can test
>> that the new driver works at all.

@Michael:

Fully agreed. I would also like you to review/ack patch #1/2:

https://lore.kernel.org/dri-devel/20200517220524.4036334-1-emil.l.velikov@gmail.com/

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> Works for me.
> 
>> I gave it a quick spin on a G5 I have access to and dmesg has a bunch of
>> errors in it (see below). I can't actually tell if the display is
>> working because the machine is remote, and I can't go and check it at
>> the moment because the office is closed.
>>
> 
>>From what I can see, there seems to be three bits:
>  - attempted out-of-bound attempts to read the vbios
> Genuine concern or noise? Likely using the bios from open firmware,
> check any of the other options - see NvBios in [1]
>  - cannot figure out the timer input frequency
> No idea
>  - the TV1 EDID is empty
> Is there an actual TV connected to the device, check with another cable
> 
> Regardless of the patches, reporting [2] the above would be a nice move.
> 
> Thanks
> Emil
> [1] https://protect2.fireeye.com/url?k=d6cf7004-8b548c67-d6cefb4b-0cc47a31cdbc-7c3b251c170ed483&q=1&u=https%3A%2F%2Fnouveau.freedesktop.org%2Fwiki%2FKernelModuleParameters%2F
> [2] https://gitlab.freedesktop.org/xorg/driver/xf86-video-nouveau/-/issues
