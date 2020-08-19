Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A6399249A4B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 12:25:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWkS30vCHzDqs2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 20:25:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=81.169.146.166;
 helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=I//xKByR; 
 dkim-atps=neutral
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [81.169.146.166])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWkPz5t3nzDqkW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 20:23:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1597832592;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=iot4F9NIeNJEKxo3vS94S+e9faKTbXdWR+AZlk71Fbw=;
 b=I//xKByRIDVq7AWSkp+uAKZ4ucJ1t4uMgf/NEHxAYirozS1Ls7Fdob/u4zc1nEMajT
 D0Zq0GfhPo+0EhxG7HzrurML8aDE9PSVNwh/qFOVRNztxXdzQilzg7hMMZr4sih5zYz5
 hMz1xVT0L4OVxWw8TPYyqxv7FFArPu0Q+02ZaCWDbuVb7TcsS3/0Bpz6SW8mSy5Dty3N
 CB4oexIVGq3jkT56m0dTEqSGC6e4cS+s9zX3GEFVKcJ4VNVj89mZz0YDrDFt0WW1Zeux
 Y/573EwI87iD1/mYTDC68CFJB9+dXFxvWtAkDceW9uuiPT9v90nwdC7tOOth6IY6mwNb
 LHHg==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHvJzedV4gJwhNnAyjUduDV+ZkOHUlEM0OPMli3OTXFzhrrfu"
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a01:598:d00a:a116:5430:18e8:3be9:8596]
 by smtp.strato.de (RZmta 46.10.7 AUTH)
 with ESMTPSA id Y04f7aw7JAMq0hZ
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 19 Aug 2020 12:22:52 +0200 (CEST)
Subject: Re: [Virtual ppce500] virtio_gpu virtio0: swiotlb buffer is full
To: Gerd Hoffmann <kraxel@redhat.com>
References: <87h7tb4zwp.fsf@linux.ibm.com>
 <E1C071A5-19D1-4493-B04A-4507A70D7848@xenosoft.de>
 <bc1975fb-23df-09c2-540a-c13b39ad56c5@xenosoft.de>
 <51482c70-1007-1202-9ed1-2d174c1e923f@xenosoft.de>
 <9688335c-d7d0-9eaa-22c6-511e708e0d2a@linux.ibm.com>
 <9805f81d-651d-d1a3-fd05-fb224a8c2031@xenosoft.de>
 <3162da18-462c-72b4-f8f0-eef896c6b162@xenosoft.de>
 <3eee8130-6913-49d2-2160-abf0bf17c44e@xenosoft.de>
 <20200818081830.d2a2cva4hd2jzwba@sirius.home.kraxel.org>
 <0f2434a5-edcf-e7d1-f6ae-7c912dc8d859@xenosoft.de>
 <20200819043515.saq6ey33q7p2uccz@sirius.home.kraxel.org>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <52a15836-4e95-089e-1683-416fdbb3fd19@xenosoft.de>
Date: Wed, 19 Aug 2020 12:22:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200819043515.saq6ey33q7p2uccz@sirius.home.kraxel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: de-DE
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
Cc: Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 daniel.vetter@ffwll.ch, =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 "kvm-ppc@vger.kernel.org" <kvm-ppc@vger.kernel.org>,
 gurchetansingh@chromium.org,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 mad skateman <madskateman@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 19 August 2020 at 06:35 am, Gerd Hoffmann wrote:
> On Tue, Aug 18, 2020 at 04:41:38PM +0200, Christian Zigotzky wrote:
>> Hello Gerd,
>>
>> I compiled a new kernel with the latest DRM misc updates today. The patch is
>> included in these updates.
>>
>> This kernel works with the VirtIO-GPU in a virtual e5500 QEMU/KVM HV machine
>> on my X5000.
>>
>> Unfortunately I can only use the VirtIO-GPU (Monitor: Red Hat, Inc. 8") with
>> a resolution of 640x480. If I set a higher resolution then the guest
>> disables the monitor.
>> I can use higher resolutions with the stable kernel 5.8 and the VirtIO-GPU.
>>
>> Please check the latest DRM updates.
> https://patchwork.freedesktop.org/patch/385980/
>
> (tests & reviews & acks are welcome)
>
> HTH,
>    Gerd
>
Hello Gerd,

I compiled a new RC1 with our patches today. With these patches, the 
VirtIO-GPU works without any problems. I can use higher resolutions again.

Screenshot of the RC1-3 with the VirtIO-GPU in a virtual e5500 QEMU/KVM 
HV machine on my X5000: 
https://i.pinimg.com/originals/4f/b0/14/4fb01476edd7abe6be1e1203a8e7e152.png

Thanks a lot for your help!

Cheers,
Christian
