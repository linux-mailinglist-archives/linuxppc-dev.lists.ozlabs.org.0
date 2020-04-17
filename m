Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8BF1AD925
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 10:53:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493VHl3bTczDrbB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 18:53:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.61;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=jasowang@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=CfNdQIXP; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=CfNdQIXP; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493VFQ36c2zDqDV
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 18:51:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587113495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uQwVoLWLfFbH6h152kN8CMNJtHnIpy94SgeEfTqCWgE=;
 b=CfNdQIXP+6j3FGXsL1WFUHxdLb1Dek+lY1gEGxUnQs6J2WygG5M2dgTacIEQD8s1UqRK4U
 Zh2SzEik/WVPfw4ogbMHwnysS1PTzfyvxcFYc+G2A2rUUVp8Knn+t3Mc5SHdSqd77K5CSJ
 7eYMORvrFzu51QMWxWYrMo6OVx+oulg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587113495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uQwVoLWLfFbH6h152kN8CMNJtHnIpy94SgeEfTqCWgE=;
 b=CfNdQIXP+6j3FGXsL1WFUHxdLb1Dek+lY1gEGxUnQs6J2WygG5M2dgTacIEQD8s1UqRK4U
 Zh2SzEik/WVPfw4ogbMHwnysS1PTzfyvxcFYc+G2A2rUUVp8Knn+t3Mc5SHdSqd77K5CSJ
 7eYMORvrFzu51QMWxWYrMo6OVx+oulg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-YshOpB4qNkaObaMFdM5aTw-1; Fri, 17 Apr 2020 04:51:31 -0400
X-MC-Unique: YshOpB4qNkaObaMFdM5aTw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5BFDADB20;
 Fri, 17 Apr 2020 08:51:29 +0000 (UTC)
Received: from [10.72.13.202] (ovpn-13-202.pek2.redhat.com [10.72.13.202])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2890E5DA2C;
 Fri, 17 Apr 2020 08:51:20 +0000 (UTC)
Subject: Re: [PATCH V2] vhost: do not enable VHOST_MENU by default
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200415024356.23751-1-jasowang@redhat.com>
 <20200416185426-mutt-send-email-mst@kernel.org>
 <b7e2deb7-cb64-b625-aeb4-760c7b28c0c8@redhat.com>
 <20200417022929-mutt-send-email-mst@kernel.org>
 <4274625d-6feb-81b6-5b0a-695229e7c33d@redhat.com>
 <20200417042912-mutt-send-email-mst@kernel.org>
 <fdb555a6-4b8d-15b6-0849-3fe0e0786038@redhat.com>
 <20200417044230-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <73843240-3040-655d-baa9-683341ed4786@redhat.com>
Date: Fri, 17 Apr 2020 16:51:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200417044230-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-s390@vger.kernel.org, tsbogend@alpha.franken.de, gor@linux.ibm.com,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org, heiko.carstens@de.ibm.com,
 linux-mips@vger.kernel.org, virtualization@lists.linux-foundation.org,
 borntraeger@de.ibm.com, geert@linux-m68k.org, netdev@vger.kernel.org,
 paulus@samba.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 2020/4/17 =E4=B8=8B=E5=8D=884:46, Michael S. Tsirkin wrote:
> On Fri, Apr 17, 2020 at 04:39:49PM +0800, Jason Wang wrote:
>> On 2020/4/17 =E4=B8=8B=E5=8D=884:29, Michael S. Tsirkin wrote:
>>> On Fri, Apr 17, 2020 at 03:36:52PM +0800, Jason Wang wrote:
>>>> On 2020/4/17 =E4=B8=8B=E5=8D=882:33, Michael S. Tsirkin wrote:
>>>>> On Fri, Apr 17, 2020 at 11:12:14AM +0800, Jason Wang wrote:
>>>>>> On 2020/4/17 =E4=B8=8A=E5=8D=886:55, Michael S. Tsirkin wrote:
>>>>>>> On Wed, Apr 15, 2020 at 10:43:56AM +0800, Jason Wang wrote:
>>>>>>>> We try to keep the defconfig untouched after decoupling CONFIG_V=
HOST
>>>>>>>> out of CONFIG_VIRTUALIZATION in commit 20c384f1ea1a
>>>>>>>> ("vhost: refine vhost and vringh kconfig") by enabling VHOST_MEN=
U by
>>>>>>>> default. Then the defconfigs can keep enabling CONFIG_VHOST_NET
>>>>>>>> without the caring of CONFIG_VHOST.
>>>>>>>>
>>>>>>>> But this will leave a "CONFIG_VHOST_MENU=3Dy" in all defconfigs =
and even
>>>>>>>> for the ones that doesn't want vhost. So it actually shifts the
>>>>>>>> burdens to the maintainers of all other to add "CONFIG_VHOST_MEN=
U is
>>>>>>>> not set". So this patch tries to enable CONFIG_VHOST explicitly =
in
>>>>>>>> defconfigs that enables CONFIG_VHOST_NET and CONFIG_VHOST_VSOCK.
>>>>>>>>
>>>>>>>> Acked-by: Christian Borntraeger<borntraeger@de.ibm.com>   (s390)
>>>>>>>> Acked-by: Michael Ellerman<mpe@ellerman.id.au>   (powerpc)
>>>>>>>> Cc: Thomas Bogendoerfer<tsbogend@alpha.franken.de>
>>>>>>>> Cc: Benjamin Herrenschmidt<benh@kernel.crashing.org>
>>>>>>>> Cc: Paul Mackerras<paulus@samba.org>
>>>>>>>> Cc: Michael Ellerman<mpe@ellerman.id.au>
>>>>>>>> Cc: Heiko Carstens<heiko.carstens@de.ibm.com>
>>>>>>>> Cc: Vasily Gorbik<gor@linux.ibm.com>
>>>>>>>> Cc: Christian Borntraeger<borntraeger@de.ibm.com>
>>>>>>>> Reported-by: Geert Uytterhoeven<geert@linux-m68k.org>
>>>>>>>> Signed-off-by: Jason Wang<jasowang@redhat.com>
>>>>>>> I rebased this on top of OABI fix since that
>>>>>>> seems more orgent to fix.
>>>>>>> Pushed to my vhost branch pls take a look and
>>>>>>> if possible test.
>>>>>>> Thanks!
>>>>>> I test this patch by generating the defconfigs that wants vhost_ne=
t or
>>>>>> vhost_vsock. All looks fine.
>>>>>>
>>>>>> But having CONFIG_VHOST_DPN=3Dy may end up with the similar situat=
ion that
>>>>>> this patch want to address.
>>>>>> Maybe we can let CONFIG_VHOST depends on !ARM || AEABI then add an=
other
>>>>>> menuconfig for VHOST_RING and do something similar?
>>>>>>
>>>>>> Thanks
>>>>> Sorry I don't understand. After this patch CONFIG_VHOST_DPN is just
>>>>> an internal variable for the OABI fix. I kept it separate
>>>>> so it's easy to revert for 5.8. Yes we could squash it into
>>>>> VHOST directly but I don't see how that changes logic at all.
>>>> Sorry for being unclear.
>>>>
>>>> I meant since it was enabled by default, "CONFIG_VHOST_DPN=3Dy" will=
 be left
>>>> in the defconfigs.
>>> But who cares?
>> FYI, please seehttps://www.spinics.net/lists/kvm/msg212685.html
> The complaint was not about the symbol IIUC.  It was that we caused
> everyone to build vhost unless they manually disabled it.


There could be some misunderstanding here. I thought it's somehow=20
similar: a CONFIG_VHOST_MENU=3Dy will be left in the defconfigs even if=20
CONFIG_VHOST is not set.

Thanks


>

