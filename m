Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D01851AD7BB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 09:47:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493SqD2Tf3zDrfb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 17:47:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.120;
 helo=us-smtp-1.mimecast.com; envelope-from=jasowang@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=eTKyP+NX; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=eTKyP+NX; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493Sbb1dkqzDrbK
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 17:37:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587109031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jaBkf60z6Ucgd4MtXh8B5Z8TuNHfL0rGLFOOLfFygBo=;
 b=eTKyP+NXMG3bpX2Nv6S0dWcQ1PBTD3IwZdmQ0zx/pZQ8M0fIk35IZSVbK5DAvbMWxSRqOc
 9W3HYDdlDdlFJkKarYbx9HtxNvZT5w01ZmJK/gVSYdxXHRAXBRhs9oMPfoQQMhHyzuzAS1
 c6zAqR2ZS40hk9BahZvx5OL3gAPo62k=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587109031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jaBkf60z6Ucgd4MtXh8B5Z8TuNHfL0rGLFOOLfFygBo=;
 b=eTKyP+NXMG3bpX2Nv6S0dWcQ1PBTD3IwZdmQ0zx/pZQ8M0fIk35IZSVbK5DAvbMWxSRqOc
 9W3HYDdlDdlFJkKarYbx9HtxNvZT5w01ZmJK/gVSYdxXHRAXBRhs9oMPfoQQMhHyzuzAS1
 c6zAqR2ZS40hk9BahZvx5OL3gAPo62k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-Oz42WgarOu2KCxpJlj-H3w-1; Fri, 17 Apr 2020 03:37:05 -0400
X-MC-Unique: Oz42WgarOu2KCxpJlj-H3w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 932298017F6;
 Fri, 17 Apr 2020 07:37:02 +0000 (UTC)
Received: from [10.72.13.202] (ovpn-13-202.pek2.redhat.com [10.72.13.202])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1D94860BE0;
 Fri, 17 Apr 2020 07:36:53 +0000 (UTC)
Subject: Re: [PATCH V2] vhost: do not enable VHOST_MENU by default
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200415024356.23751-1-jasowang@redhat.com>
 <20200416185426-mutt-send-email-mst@kernel.org>
 <b7e2deb7-cb64-b625-aeb4-760c7b28c0c8@redhat.com>
 <20200417022929-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <4274625d-6feb-81b6-5b0a-695229e7c33d@redhat.com>
Date: Fri, 17 Apr 2020 15:36:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200417022929-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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


On 2020/4/17 =E4=B8=8B=E5=8D=882:33, Michael S. Tsirkin wrote:
> On Fri, Apr 17, 2020 at 11:12:14AM +0800, Jason Wang wrote:
>> On 2020/4/17 =E4=B8=8A=E5=8D=886:55, Michael S. Tsirkin wrote:
>>> On Wed, Apr 15, 2020 at 10:43:56AM +0800, Jason Wang wrote:
>>>> We try to keep the defconfig untouched after decoupling CONFIG_VHOST
>>>> out of CONFIG_VIRTUALIZATION in commit 20c384f1ea1a
>>>> ("vhost: refine vhost and vringh kconfig") by enabling VHOST_MENU by
>>>> default. Then the defconfigs can keep enabling CONFIG_VHOST_NET
>>>> without the caring of CONFIG_VHOST.
>>>>
>>>> But this will leave a "CONFIG_VHOST_MENU=3Dy" in all defconfigs and =
even
>>>> for the ones that doesn't want vhost. So it actually shifts the
>>>> burdens to the maintainers of all other to add "CONFIG_VHOST_MENU is
>>>> not set". So this patch tries to enable CONFIG_VHOST explicitly in
>>>> defconfigs that enables CONFIG_VHOST_NET and CONFIG_VHOST_VSOCK.
>>>>
>>>> Acked-by: Christian Borntraeger<borntraeger@de.ibm.com>  (s390)
>>>> Acked-by: Michael Ellerman<mpe@ellerman.id.au>  (powerpc)
>>>> Cc: Thomas Bogendoerfer<tsbogend@alpha.franken.de>
>>>> Cc: Benjamin Herrenschmidt<benh@kernel.crashing.org>
>>>> Cc: Paul Mackerras<paulus@samba.org>
>>>> Cc: Michael Ellerman<mpe@ellerman.id.au>
>>>> Cc: Heiko Carstens<heiko.carstens@de.ibm.com>
>>>> Cc: Vasily Gorbik<gor@linux.ibm.com>
>>>> Cc: Christian Borntraeger<borntraeger@de.ibm.com>
>>>> Reported-by: Geert Uytterhoeven<geert@linux-m68k.org>
>>>> Signed-off-by: Jason Wang<jasowang@redhat.com>
>>> I rebased this on top of OABI fix since that
>>> seems more orgent to fix.
>>> Pushed to my vhost branch pls take a look and
>>> if possible test.
>>> Thanks!
>>
>> I test this patch by generating the defconfigs that wants vhost_net or
>> vhost_vsock. All looks fine.
>>
>> But having CONFIG_VHOST_DPN=3Dy may end up with the similar situation =
that
>> this patch want to address.
>> Maybe we can let CONFIG_VHOST depends on !ARM || AEABI then add anothe=
r
>> menuconfig for VHOST_RING and do something similar?
>>
>> Thanks
> Sorry I don't understand. After this patch CONFIG_VHOST_DPN is just
> an internal variable for the OABI fix. I kept it separate
> so it's easy to revert for 5.8. Yes we could squash it into
> VHOST directly but I don't see how that changes logic at all.


Sorry for being unclear.

I meant since it was enabled by default, "CONFIG_VHOST_DPN=3Dy" will be=20
left in the defconfigs. This requires the arch maintainers to add=20
"CONFIG_VHOST_VDPN is not set". (Geert complains about this)

Thanks


>

