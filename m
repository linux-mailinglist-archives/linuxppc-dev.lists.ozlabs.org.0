Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17513B9FE6
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Sep 2019 00:40:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46bQWq2zZQzDqS0
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Sep 2019 08:40:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=wavecomp.com
 (client-ip=40.107.82.119; helo=nam01-sn1-obe.outbound.protection.outlook.com;
 envelope-from=pburton@wavecomp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=mips.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=wavecomp.com header.i=@wavecomp.com header.b="K7ermjlQ";
 dkim-atps=neutral
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820119.outbound.protection.outlook.com [40.107.82.119])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46bQTv5VfjzDqRD
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Sep 2019 08:38:26 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YUPKa2XIQU3CKBsDhQJuBOulbySgERnC/dHgspkO35kXXWYP5hFXl8rrmCwcKC9c/r+0sAYo2QBHR3FWmne5y36TiazMmvE7qDGx9AqkW8i5VFdW4vNBH7skdHZZgnRylXtDJNut1nhWiaWXX2VqBAO8nQUXbDa4bB0OondefoYEJ37QByj0nqghLA7v/mPAUxYKMrm52brpGMxnjza9al5yynhejdcucwogoNWq7/fXrbZKZhS+x1VBkfXmBg4gLbadr5K4tSiV/6iwGgeNKQmSRM7HnYFqxHF+HbX0OvtINBMYs/qOHGGyKTfYp7exkvy06NfA/dIcoFz0k24ovQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L9izpD/ryLuzEcwzg1kMcbhkehUFL7wWEAmTsrt0N28=;
 b=mKX2/x81J5gn0RiFagg3VbsgmuFOArWfdmN+WgodA3GM8fdVrM+Jii62Tys0oHimWsqDjGxkg81082UfuYWd/DlxbGc32B4RtXSjXrNWU0TqTrEgTjfJvWPLXOcb6E0rW+zZzJLDXHLvkQ2sRjq5gjTEDNuSED0pJoDnHg7m/mf1qO7VQI7TuQW8peIRoQzwqarEfcj4aYlaaaJgOqfwH4ZYTP4gY7cCtAxY3ik35Jbkaxn8KZi0bua3TCx75WKuyaCVrZq3tuifopl4PbDY2Hc5qXV9u/xcL2n8wacXsAk5vgqDx7v9Brf+mdWhhR+1s/Fx6lD7dcAW0nb2fZmJCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L9izpD/ryLuzEcwzg1kMcbhkehUFL7wWEAmTsrt0N28=;
 b=K7ermjlQQVh8BagZGqzjRSyxs7GLzWNn8yIZ3f747Wl0b31DRFYDQ7NSu18on3+aWFTrDhZ5uS5rzBsjeG88ITYxtmHnZ2ZMzhyZrrBs5m9zUWbzECid+0Juw6uBTXCFYEDDaIqdwDZ64mU5tgqTa9cgT98KTY/QFOMgngf0whI=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1069.namprd22.prod.outlook.com (10.174.169.143) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.23; Sat, 21 Sep 2019 22:38:21 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f9e8:5e8c:7194:fad3]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f9e8:5e8c:7194:fad3%11]) with mapi id 15.20.2284.009; Sat, 21 Sep
 2019 22:38:20 +0000
From: Paul Burton <paul.burton@mips.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Subject: Re: [PATCH v6] numa: make node_to_cpumask_map() NUMA_NO_NODE aware
Thread-Topic: [PATCH v6] numa: make node_to_cpumask_map() NUMA_NO_NODE aware
Thread-Index: AQHVcM1E3OExh6Dm4EaURcTDKoN+5g==
Date: Sat, 21 Sep 2019 22:38:20 +0000
Message-ID: <20190921223818.sodqc2ui7mpt7ig5@pburton-laptop>
References: <1568724534-146242-1-git-send-email-linyunsheng@huawei.com>
In-Reply-To: <1568724534-146242-1-git-send-email-linyunsheng@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR01CA0001.prod.exchangelabs.com (2603:10b6:a02:80::14)
 To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2601:646:8a00:9810:9d6:9cca:ff8c:efe0]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e58461b5-57fe-4223-7139-08d73ee466f1
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MWHPR2201MB1069; 
x-ms-traffictypediagnostic: MWHPR2201MB1069:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MWHPR2201MB1069FF471FFB9A31A7CC92D0C18B0@MWHPR2201MB1069.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0167DB5752
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(7916004)(136003)(39830400003)(366004)(346002)(376002)(396003)(199004)(189003)(2906002)(6916009)(305945005)(6246003)(229853002)(66446008)(66556008)(5660300002)(76176011)(6306002)(58126008)(316002)(6512007)(1076003)(9686003)(486006)(33716001)(6436002)(54906003)(66946007)(7736002)(6486002)(25786009)(386003)(476003)(81156014)(7406005)(7366002)(6506007)(64756008)(44832011)(8936002)(186003)(42882007)(102836004)(11346002)(14454004)(66476007)(71190400001)(6116002)(4326008)(478600001)(99286004)(8676002)(7416002)(966005)(256004)(71200400001)(46003)(446003)(14444005)(52116002)(81166006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR2201MB1069;
 H:MWHPR2201MB1277.namprd22.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2Pxq8bNS6vT/DNeJXDMFaCQax5rgDXKTyZuF2+v81k03fJ9apaRx8mxIldhE75lGync6bAkMV8yKskg+YKb9UFTeGdgW8BlaQy00gLq5sjJYBFiW/cl8U67fpene2NldgNUct+YYTYJewGIDgV+rn/CtNox+e9gT5BWB4rPSd2kq3l8RXknz12OKts+NGPiTkiPUhlHchjYut2jotuZVsMY//RiDOCYgkOnoTGuOSYmgnIix1Qu5yAHDS3/rjFH9UGkdThGA9vM0miTXEhUXIm9JuF/zOKT+p0+DcGbAn8MFWgwD2GVjcFoLePOiev+rjhO2w7F3QBOkNRomxVPU46juwuHmnuBR5qLQjRG/phH/8wksK8UycIqSpEE04TG82vhuey9ec2PogcMnb/cyu3fTkJVG7H5NI6Ojk7M9Wmo=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C0F92E7E454C4E4D837BAD8FDCCDF73E@namprd22.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e58461b5-57fe-4223-7139-08d73ee466f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2019 22:38:20.0527 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: clpi5vx0C5+Ocrh0DDl5Q5UCJDzDlN0GwBDyxv0BsBy61Eswze6TzJJsXsk460jSexOnOa50klOjsJEZhjjXtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1069
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
Cc: "dalias@libc.org" <dalias@libc.org>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "heiko.carstens@de.ibm.com" <heiko.carstens@de.ibm.com>,
 "jiaxun.yang@flygoat.com" <jiaxun.yang@flygoat.com>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "mwb@linux.vnet.ibm.com" <mwb@linux.vnet.ibm.com>,
 "paulus@samba.org" <paulus@samba.org>, "hpa@zytor.com" <hpa@zytor.com>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "chenhc@lemote.com" <chenhc@lemote.com>, "will@kernel.org" <will@kernel.org>,
 "cai@lca.pw" <cai@lca.pw>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "ysato@users.sourceforge.jp" <ysato@users.sourceforge.jp>,
 "x86@kernel.org" <x86@kernel.org>, "rppt@linux.ibm.com" <rppt@linux.ibm.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "dledford@redhat.com" <dledford@redhat.com>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "jeffrey.t.kirsher@intel.com" <jeffrey.t.kirsher@intel.com>,
 "jhogan@kernel.org" <jhogan@kernel.org>,
 "mattst88@gmail.com" <mattst88@gmail.com>,
 "len.brown@intel.com" <len.brown@intel.com>,
 "gor@linux.ibm.com" <gor@linux.ibm.com>,
 "anshuman.khandual@arm.com" <anshuman.khandual@arm.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "bp@alien8.de" <bp@alien8.de>, "luto@kernel.org" <luto@kernel.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "mhocko@kernel.org" <mhocko@kernel.org>,
 "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "rth@twiddle.net" <rth@twiddle.net>, "axboe@kernel.dk" <axboe@kernel.dk>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ralf@linux-mips.org" <ralf@linux-mips.org>,
 "tbogendoerfer@suse.de" <tbogendoerfer@suse.de>,
 "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
 "rafael@kernel.org" <rafael@kernel.org>,
 "ink@jurassic.park.msu.ru" <ink@jurassic.park.msu.ru>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 "davem@davemloft.net" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Yunsheng,

On Tue, Sep 17, 2019 at 08:48:54PM +0800, Yunsheng Lin wrote:
> When passing the return value of dev_to_node() to cpumask_of_node()
> without checking if the device's node id is NUMA_NO_NODE, there is
> global-out-of-bounds detected by KASAN.
>=20
> From the discussion [1], NUMA_NO_NODE really means no node affinity,
> which also means all cpus should be usable. So the cpumask_of_node()
> should always return all cpus online when user passes the node id as
> NUMA_NO_NODE, just like similar semantic that page allocator handles
> NUMA_NO_NODE.
>=20
> But we cannot really copy the page allocator logic. Simply because the
> page allocator doesn't enforce the near node affinity. It just picks it
> up as a preferred node but then it is free to fallback to any other numa
> node. This is not the case here and node_to_cpumask_map will only restric=
t
> to the particular node's cpus which would have really non deterministic
> behavior depending on where the code is executed. So in fact we really
> want to return cpu_online_mask for NUMA_NO_NODE.
>=20
> Also there is a debugging version of node_to_cpumask_map() for x86 and
> arm64, which is only used when CONFIG_DEBUG_PER_CPU_MAPS is defined, this
> patch changes it to handle NUMA_NO_NODE as normal node_to_cpumask_map().
>=20
> [1] https://lore.kernel.org/patchwork/patch/1125789/
> Signed-off-by: Yunsheng Lin <linyunsheng@huawei.com>
> Suggested-by: Michal Hocko <mhocko@kernel.org>
> Acked-by: Michal Hocko <mhocko@suse.com>

If you end up sending another revision then I think it would be worth
replacing -1 with NUMA_NO_NODE in
arch/mips/include/asm/mach-ip27/topology.h for consistency, but in any
case:

    Acked-by: Paul Burton <paul.burton@mips.com> # MIPS bits

Thanks,
    Paul

> ---
> V6: Drop the cpu_all_mask -> cpu_online_mask change for it seems a
>     little controversial, may need deeper investigation, and rebased
>     on the latest linux-next.
> V5: Drop unsigned "fix" change for x86/arm64, and change comment log
>     according to Michal's comment.
> V4: Have all these changes in a single patch.
> V3: Change to only handle NUMA_NO_NODE, and return cpu_online_mask
>     for NUMA_NO_NODE case, and change the commit log to better justify
>     the change.
> V2: make the node id checking change to other arches too.
> ---
>  arch/arm64/include/asm/numa.h                    | 3 +++
>  arch/arm64/mm/numa.c                             | 3 +++
>  arch/mips/include/asm/mach-loongson64/topology.h | 4 +++-
>  arch/s390/include/asm/topology.h                 | 3 +++
>  arch/x86/include/asm/topology.h                  | 3 +++
>  arch/x86/mm/numa.c                               | 3 +++
>  6 files changed, 18 insertions(+), 1 deletion(-)
