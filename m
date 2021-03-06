Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CAD32FCF6
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Mar 2021 21:00:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DtFpF0jL5z3dJc
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Mar 2021 07:00:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=merlin.20170209 header.b=ceIvwhha;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=178.238.156.107; helo=merlin.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Received: from merlin.infradead.org (merlin.infradead.org [178.238.156.107])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DtFng0FrYz30Nx
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Mar 2021 07:00:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Message-ID:From:CC:To:Subject:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
 Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=bVEadx5XUyga2+3JVanlGM60Y2Rfk62e/HFKwSxTExU=; b=ceIvwhhav+M1uUnFOKoZGnbexg
 W1nHPwkf+MxykeLakwYq+ezYl+N9JXfFPEL1bcEngpvNMKr1hj8XPLI83AlBSHGZ6ntgbmI3iJyT6
 Mh9Ti3q6QNbFJiWWb2U6DrrCCUNfa6ouq+4Td/lt/hDO4hmcbDa13yb2MW+wniYwxTq8O7SIXHl7d
 WfFqXluL8mkde4IjVXbm/GkMnqc+wnXuUIPPDNetxO0DcdzhSTiwFMAuEk2XJL8fe/XNa7yxtkwZl
 duabVyoh0prdN/vWcla8xW9FkCAKrgwz76d1AaDge8csI9X1IuNmpDfvkrxxcT213nKBGkn6AQrgK
 R7CI6xnQ==;
Received: from [104.129.198.225] (helo=[100.124.44.209])
 by merlin.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lId5H-000Ga2-7Q; Sat, 06 Mar 2021 19:59:32 +0000
Date: Sat, 06 Mar 2021 11:44:33 -0800
User-Agent: K-9 Mail for Android
In-Reply-To: <87lfb5sthg.fsf@mpe.ellerman.id.au>
References: <20210302082811.8671-1-rdunlap@infradead.org>
 <87lfb5sthg.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] powerpc: iommu: fix build when neither PCI or IBMVIO is
 set
To: Michael Ellerman <mpe@ellerman.id.au>,linux-kernel@vger.kernel.org
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <3954705C-2B4C-436A-8902-494240662491@infradead.org>
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
Cc: linuxppc-dev@lists.ozlabs.org, kernel test robot <lkp@intel.com>,
 Anton Blanchard <anton@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On March 2, 2021 3:08:43 AM PST, Michael Ellerman <mpe@ellerman=2Eid=2Eau> =
wrote:
>Randy Dunlap <rdunlap@infradead=2Eorg> writes:
>> When neither CONFIG_PCI nor CONFIG_IBMVIO is enabled:
>>
>> =2E=2E/arch/powerpc/kernel/iommu=2Ec:178:30: error:
>'fail_iommu_bus_notifier' defined but not used
>[-Werror=3Dunused-variable]
>>   178 | static struct notifier_block fail_iommu_bus_notifier =3D {
>>
>> If only that struct is bounded by 2 #if defined() phrases (PCI &&
>IBMVIO):
>>
>> =2E=2E/arch/powerpc/kernel/iommu=2Ec:162:12: error: 'fail_iommu_bus_not=
ify'
>defined but not used [-Werror=3Dunused-function]
>>   162 | static int fail_iommu_bus_notify(struct notifier_block *nb,
>>
>> If that function is also guarded by 2 #if defined() phrases:
>>
>> In file included from =2E=2E/include/linux/dma-mapping=2Eh:7,
>>                  from =2E=2E/arch/powerpc/kernel/iommu=2Ec:19:
>> =2E=2E/include/linux/device=2Eh:131:26: error: 'dev_attr_fail_iommu'
>defined but not used [-Werror=3Dunused-variable]
>>   131 |  struct device_attribute dev_attr_##_name =3D __ATTR_RW(_name)
>> =2E=2E/arch/powerpc/kernel/iommu=2Ec:160:8: note: in expansion of macro
>'DEVICE_ATTR_RW'
>>   160 | static DEVICE_ATTR_RW(fail_iommu);
>>
>> and the snowball continues to grow=2E
>> Next I got this one:
>>
>> =2E=2E/arch/powerpc/kernel/iommu=2Ec: In function 'iommu_range_alloc':
>> =2E=2E/arch/powerpc/kernel/iommu=2Ec:234:6: error: implicit declaration=
 of
>function 'should_fail_iommu'; did you mean 'should_failslab'?
>[-Werror=3Dimplicit-function-declaration]
>>   234 |  if (should_fail_iommu(dev))
>>
>> and
>>
>> =2E=2E/arch/powerpc/kernel/iommu=2Ec: In function 'should_fail_iommu':
>> =2E=2E/arch/powerpc/kernel/iommu=2Ec:122:50: error: 'fail_iommu' undecl=
ared
>(first use in this function)
>>   122 |  return dev->archdata=2Efail_iommu && should_fail(&fail_iommu,
>1);
>>
>> So combine CONFIG_FAIL_IOMMU && (CONFIG_PCI || CONFIG_IBMVIO)
>> to decide on building some of this code/data=2E
>
>Couldn't we just make FAIL_IOMMU depend on PCI || IBMVIO?
>
>cheers

Yes, I thought of that about 5 seconds after hitting Send=2E But I can't d=
o it just now -- am away from computer=2E


--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E
