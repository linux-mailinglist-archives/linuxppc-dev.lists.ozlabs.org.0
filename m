Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB1D75F7C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jul 2019 09:06:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45w0WF0Z4JzDqQm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jul 2019 17:06:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.3.73; helo=eur03-am5-obe.outbound.protection.outlook.com;
 envelope-from=diana.craciun@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="M5UggdHJ"; 
 dkim-atps=neutral
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30073.outbound.protection.outlook.com [40.107.3.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45w0Sm6tDfzDqPK
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2019 17:04:37 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=in3P9loI2HM/DasnN/PUjhiXwuZRcYDr/DMhp1Ca8qqpiJ/UKujGDOhs0v89NqtOLjKEfVVIDlxSK0sAd+A+4pwhigphIGN0COpwt5KyUZZ1egVcKUrk9csSzPgviSQNa414HLvLZDYD1gXsX8HrOW28Rvw0+6z1pBuuFowCyfT5b6slGMzesI50FXkeVwmPNCMQZZDN9f2lLnyl3HOOLMD1eiOUOuYgPFP6Tc8FZOfcSOps+951ncKjYDW+iTgKVtG629TeR//ubUosV/tj4UIbkscxz6vtMu1/4+4iGKbiii/XR0AQITzv7wWSI7OO6Dk49/G6/48s1sAE/eQ3EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ihqVZlLNAhUY5mTR6ZiUtPGPS5aid2Ki/bYcV1tM0rY=;
 b=dqQBFaG1GqRanmbpnuK1JBY+/7vi6wzSGV8hiq54CLJWUZULSBcEqxX/Jk4/hCfK9GVzYa3gR+PvZ7MTaPkvlY50Z2FBFJsDoVpg162QESVBhYc6ARNJ1yR4yiBZTk5WIgqZ2C0S/mjnGvcPgv8HRcgBAIlnTl6xohV5Q8XiwGstbSNlHz9k8xV4nPKyoh264azFs6rdPpB/BMCnVHQYrelHrqRS4MxJGb9BGu+T90XD0azk5e06MXNwAW4sRIj8RZxbWkbHaCnTY+b8QAo2rBsnXPx0j/RsSmjwUeJWWDBEl/NWUQys/FhZPG34gId6kFl47DUK3XEqu2nlqcg+BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=nxp.com;dmarc=pass action=none header.from=nxp.com;dkim=pass
 header.d=nxp.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ihqVZlLNAhUY5mTR6ZiUtPGPS5aid2Ki/bYcV1tM0rY=;
 b=M5UggdHJbrVrcDych1TU+omfjPhm77eSPeQW4AYHHuEOd8cqfPWtdB64t72DmiPWUeqUH/YjsupMD54Uc5LhKScFxzIFBG/bm2RZGgtb2tq7Ix7Ds3Cg97C0J1LG/MGrdWf4NXXdSSf0LBzuAsKFucZhJLk6471ULrXMcBb9a6k=
Received: from VI1PR0401MB2463.eurprd04.prod.outlook.com (10.168.61.13) by
 VI1PR0401MB2317.eurprd04.prod.outlook.com (10.169.133.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Fri, 26 Jul 2019 07:04:31 +0000
Received: from VI1PR0401MB2463.eurprd04.prod.outlook.com
 ([fe80::98e7:5870:e0e0:6c7a]) by VI1PR0401MB2463.eurprd04.prod.outlook.com
 ([fe80::98e7:5870:e0e0:6c7a%7]) with mapi id 15.20.2094.013; Fri, 26 Jul 2019
 07:04:31 +0000
From: Diana Madalina Craciun <diana.craciun@nxp.com>
To: Jason Yan <yanaijie@huawei.com>, "mpe@ellerman.id.au"
 <mpe@ellerman.id.au>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>, "christophe.leroy@c-s.fr"
 <christophe.leroy@c-s.fr>, "benh@kernel.crashing.org"
 <benh@kernel.crashing.org>, "paulus@samba.org" <paulus@samba.org>,
 "npiggin@gmail.com" <npiggin@gmail.com>, "keescook@chromium.org"
 <keescook@chromium.org>, "kernel-hardening@lists.openwall.com"
 <kernel-hardening@lists.openwall.com>
Subject: Re: [RFC PATCH 00/10] implement KASLR for powerpc/fsl_booke/32
Thread-Topic: [RFC PATCH 00/10] implement KASLR for powerpc/fsl_booke/32
Thread-Index: AQHVPHQmPxsZ5ebrqkOb0IKUtKxd9g==
Date: Fri, 26 Jul 2019 07:04:31 +0000
Message-ID: <VI1PR0401MB24632CD6AB1C5EDCFF817705FFC00@VI1PR0401MB2463.eurprd04.prod.outlook.com>
References: <20190717080621.40424-1-yanaijie@huawei.com>
 <e6ad41bc-5d5a-cf3f-b308-e1863b4fef99@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=diana.craciun@nxp.com; 
x-originating-ip: [92.121.36.197]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a651a730-ed13-463e-11b4-08d7119781d9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR0401MB2317; 
x-ms-traffictypediagnostic: VI1PR0401MB2317:
x-microsoft-antispam-prvs: <VI1PR0401MB2317EFE7000D2A836F74576EFFC00@VI1PR0401MB2317.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 01106E96F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(396003)(39860400002)(346002)(366004)(136003)(376002)(189003)(199004)(53754006)(102836004)(66446008)(76116006)(91956017)(4326008)(33656002)(53546011)(86362001)(229853002)(6506007)(6436002)(7696005)(66066001)(186003)(7736002)(66946007)(71200400001)(476003)(256004)(446003)(55016002)(64756008)(2906002)(7416002)(99286004)(478600001)(14444005)(66556008)(81156014)(316002)(6116002)(66476007)(8676002)(110136005)(74316002)(81166006)(305945005)(68736007)(486006)(2501003)(5660300002)(54906003)(26005)(2201001)(14454004)(71190400001)(6246003)(3846002)(52536014)(8936002)(9686003)(76176011)(25786009)(53936002)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0401MB2317;
 H:VI1PR0401MB2463.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vmmXnKhBHQB3xChoDonEV578S+Vyo+bwpgGmRuWIc0b9Pfr7F2KruV7YjmIKf3s7G9uOuPeSzEci6bHyULke/nzNq1FWD3s5Hm/XFlK3Wk+W1onbuHwbkmiFx7srwyQ48VU635T5oSu4dem2BJ01ksM16WbHfLK5dBLoaLjaJVbf9+OC/mSRA3ITXt2YMzq0EWbtkEy7Kaj2FOeny7fmuiopEnMVxYhvhbyttxgClhYtdr9wQZt9N75wzAHqqZ35RI0H3e+zFhEpo8sEVjcI/bvgraOXdpV+5TohzIi8+a4Uxkjutuehc3Zf31b7b2kgDZxEHYinRm91JD11y1edlM4tHtYo6uTIdVWWOrKDb40mW9d9Coja+XKv4+YQt9BGVzZIZl/OKVhWOqDjSIzuVbXNxxwYRqsJMd0ExNlCoIE=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a651a730-ed13-463e-11b4-08d7119781d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2019 07:04:31.0433 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: diana.craciun@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2317
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
Cc: "wangkefeng.wang@huawei.com" <wangkefeng.wang@huawei.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "jingxiangfeng@huawei.com" <jingxiangfeng@huawei.com>,
 "thunder.leizhen@huawei.com" <thunder.leizhen@huawei.com>,
 "fanchengyang@huawei.com" <fanchengyang@huawei.com>,
 "yebin10@huawei.com" <yebin10@huawei.com>,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Jason,=0A=
=0A=
I have briefly tested yesterday on a P4080 board and did not see any=0A=
issues. I do not have much expertise on KASLR, but I will take a look=0A=
over the code.=0A=
=0A=
Regards,=0A=
Diana=0A=
=0A=
On 7/25/2019 10:16 AM, Jason Yan wrote:=0A=
> Hi all, any comments?=0A=
>=0A=
>=0A=
> On 2019/7/17 16:06, Jason Yan wrote:=0A=
>> This series implements KASLR for powerpc/fsl_booke/32, as a security=0A=
>> feature that deters exploit attempts relying on knowledge of the locatio=
n=0A=
>> of kernel internals.=0A=
>>=0A=
>> Since CONFIG_RELOCATABLE has already supported, what we need to do is=0A=
>> map or copy kernel to a proper place and relocate. Freescale Book-E=0A=
>> parts expect lowmem to be mapped by fixed TLB entries(TLB1). The TLB1=0A=
>> entries are not suitable to map the kernel directly in a randomized=0A=
>> region, so we chose to copy the kernel to a proper place and restart to=
=0A=
>> relocate.=0A=
>>=0A=
>> Entropy is derived from the banner and timer base, which will change eve=
ry=0A=
>> build and boot. This not so much safe so additionally the bootloader may=
=0A=
>> pass entropy via the /chosen/kaslr-seed node in device tree.=0A=
>>=0A=
>> We will use the first 512M of the low memory to randomize the kernel=0A=
>> image. The memory will be split in 64M zones. We will use the lower 8=0A=
>> bit of the entropy to decide the index of the 64M zone. Then we chose a=
=0A=
>> 16K aligned offset inside the 64M zone to put the kernel in.=0A=
>>=0A=
>>      KERNELBASE=0A=
>>=0A=
>>          |-->   64M   <--|=0A=
>>          |               |=0A=
>>          +---------------+    +----------------+---------------+=0A=
>>          |               |....|    |kernel|    |               |=0A=
>>          +---------------+    +----------------+---------------+=0A=
>>          |                         |=0A=
>>          |----->   offset    <-----|=0A=
>>=0A=
>>                                kimage_vaddr=0A=
>>=0A=
>> We also check if we will overlap with some areas like the dtb area, the=
=0A=
>> initrd area or the crashkernel area. If we cannot find a proper area,=0A=
>> kaslr will be disabled and boot from the original kernel.=0A=
>>=0A=
>> Jason Yan (10):=0A=
>>    powerpc: unify definition of M_IF_NEEDED=0A=
>>    powerpc: move memstart_addr and kernstart_addr to init-common.c=0A=
>>    powerpc: introduce kimage_vaddr to store the kernel base=0A=
>>    powerpc/fsl_booke/32: introduce create_tlb_entry() helper=0A=
>>    powerpc/fsl_booke/32: introduce reloc_kernel_entry() helper=0A=
>>    powerpc/fsl_booke/32: implement KASLR infrastructure=0A=
>>    powerpc/fsl_booke/32: randomize the kernel image offset=0A=
>>    powerpc/fsl_booke/kaslr: clear the original kernel if randomized=0A=
>>    powerpc/fsl_booke/kaslr: support nokaslr cmdline parameter=0A=
>>    powerpc/fsl_booke/kaslr: dump out kernel offset information on panic=
=0A=
>>=0A=
>>   arch/powerpc/Kconfig                          |  11 +=0A=
>>   arch/powerpc/include/asm/nohash/mmu-book3e.h  |  10 +=0A=
>>   arch/powerpc/include/asm/page.h               |   7 +=0A=
>>   arch/powerpc/kernel/Makefile                  |   1 +=0A=
>>   arch/powerpc/kernel/early_32.c                |   2 +-=0A=
>>   arch/powerpc/kernel/exceptions-64e.S          |  10 -=0A=
>>   arch/powerpc/kernel/fsl_booke_entry_mapping.S |  23 +-=0A=
>>   arch/powerpc/kernel/head_fsl_booke.S          |  61 ++-=0A=
>>   arch/powerpc/kernel/kaslr_booke.c             | 439 ++++++++++++++++++=
=0A=
>>   arch/powerpc/kernel/machine_kexec.c           |   1 +=0A=
>>   arch/powerpc/kernel/misc_64.S                 |   5 -=0A=
>>   arch/powerpc/kernel/setup-common.c            |  23 +=0A=
>>   arch/powerpc/mm/init-common.c                 |   7 +=0A=
>>   arch/powerpc/mm/init_32.c                     |   5 -=0A=
>>   arch/powerpc/mm/init_64.c                     |   5 -=0A=
>>   arch/powerpc/mm/mmu_decl.h                    |  10 +=0A=
>>   arch/powerpc/mm/nohash/fsl_booke.c            |   8 +-=0A=
>>   17 files changed, 580 insertions(+), 48 deletions(-)=0A=
>>   create mode 100644 arch/powerpc/kernel/kaslr_booke.c=0A=
>>=0A=
>=0A=
=0A=
