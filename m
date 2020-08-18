Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B6220248398
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 13:10:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BW7Vm4VyTzDqcN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 21:10:24 +1000 (AEST)
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
 header.s=strato-dkim-0002 header.b=JWfke7Hk; 
 dkim-atps=neutral
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [81.169.146.166])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BW7T112hLzDqDQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Aug 2020 21:08:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1597748925;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=koJFguAnm5m7Yf22e906vapRRMCc7tRf8L4mLRereyM=;
 b=JWfke7Hk2QxlsR+HbNdzHfeKsJ9drrROfzazYPBts71MgCdV9vwGwQRpl7g0//MHSF
 GfqllEZKqDwG0GiJ4WZz/sD4EyLweEYIoXbSA5WiRgo1hp6EQXVslL/6psu3GVCPDe0Q
 W0nrbsLl4WSmeuYKqbUNcgZhcM180JCTK8Wpaz04MAJrY7UQDYb+WgFENcPFGMMk0xhS
 aR1uI3ZVten8tZ6RrhUWr40DpbNyAu0ZuQtkcrV/SbVoH7owSA92wBJJZj5nz+81/ezb
 Ix4hmifjHYVFCTxt0PyZVKme20V2VH1MtL0ZxFk0l+EtvUM6Spe27d471tR18SdWNiJ9
 +NVQ==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHvJzedV4hp0hM3BukOMWh+LViYiuzXqVlZzVo7xSI73ElHU="
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a01:598:b10d:7054:8ddd:9a9:703b:cd26]
 by smtp.strato.de (RZmta 46.10.5 AUTH)
 with ESMTPSA id 60686ew7IB8Sqqz
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 18 Aug 2020 13:08:28 +0200 (CEST)
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
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <56faac9f-49e8-2f0b-6cd5-f8e589db4c8c@xenosoft.de>
Date: Tue, 18 Aug 2020 13:08:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200818081830.d2a2cva4hd2jzwba@sirius.home.kraxel.org>
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
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 mad skateman <madskateman@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 18 August 2020 at 10:18 am, Gerd Hoffmann wrote:
> On Mon, Aug 17, 2020 at 11:19:58AM +0200, Christian Zigotzky wrote:
>> Hello
>>
>> I compiled the RC1 of kernel 5.9 today. Unfortunately the issue with the
>> VirtIO-GPU (see below) still exists. Therefore we still need the patch (see
>> below) for using the VirtIO-GPU in a virtual e5500 PPC64 QEMU machine.
> It is fixed in drm-misc-next (commit 51c3b0cc32d2e17581fce5b487ee95bbe9e8270a).
>
> Will cherry-pick into drm-misc-fixes once the branch is 5.9-based, which
> in turn should bring it to 5.9-rc2 or -rc3.
>
> take care,
>    Gerd
>
Thank you!
