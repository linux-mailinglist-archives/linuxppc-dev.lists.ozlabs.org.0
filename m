Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEF8A451F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Aug 2019 17:48:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46LLNd2JSfzDr63
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Sep 2019 01:48:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=wavecomp.com
 (client-ip=40.107.71.135; helo=nam05-by2-obe.outbound.protection.outlook.com;
 envelope-from=pburton@wavecomp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=mips.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=wavecomp.com header.i=@wavecomp.com header.b="eKHn+yAW";
 dkim-atps=neutral
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710135.outbound.protection.outlook.com [40.107.71.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46LLKf30TYzDqSD
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  1 Sep 2019 01:45:57 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RyYs4o44TNRmVutHuH68IDY288Mk/AeqGB+1g4YP9fnr12OasmGYQll1NM5vcvEMuS7M7KpzCJNGGUAs3HG0v56qNw2HsCw2r6XW0tv+6Rb1azAU/mHBe1/rS3Ds86VSDRSB9VJ3IYDW2j/iWVv1/25COlIwtTefSNsw4luplcCcPONEvO6qlAXGVAD94uahWVGn3YJzK7ifuLfgv5O6t/4AaPQqpRxAJaVzwJJDJTpklHhq2Nr/DAWvjkneEXAM70WrCOV0Sc3h0ZShfNeKHCFsIdAjMfnWc6B+pdhWPabBy7l+7BizRZKt+Fzp6UdkvbBcgUAlVjdouTJ5HfAlPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MxjQOGRj0dXObYq4fZk6vavomkd675FEVilCfIypSyI=;
 b=WeUqGx0SdptEQtdT8Dui0sBRrkyWISufyGJrDM7YcOKaaQxI0gA4oYyiX6/6Xt9BrktrJjU1jVWhM5NbxwAJStggT1AjyJXbBogQZIfddHDa8FFrxyTmHflKGe++tQoGfNOB/cOQz2sWEsb96F93wjGkNevmQeT1zx3ACV+QhT5Saj0knyY9385Z5DHMf6z9WYuYKJyO810CBF5aryQdNjoQeJSZ8nKr3Xo1b1HXj3XCzH/KvseL6HMQlD7XUPVh6iO5iDK/iihm+dypn+JPyq2nq+A/j1Eww3XrLgQ8LC4m8ydSRD4uYBxiA2dPnhthNXrD3Xok9GdaGyhj/Tzc7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MxjQOGRj0dXObYq4fZk6vavomkd675FEVilCfIypSyI=;
 b=eKHn+yAWHFCQ4/nw8QCk3tuEskvjOpIsJqnJp88pwuBwpLFiPNr+WkSbuFctOHQL9rEwYetf0kdx6YUZkW04hQ08z6oHLBABvu65xiKXSO9lktApoXS1df0l65B0Tlvx+roPOeiLLn6zVrmRnVetmhMMoocaIBEzxQVt/W1CmdA=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1087.namprd22.prod.outlook.com (10.174.169.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.20; Sat, 31 Aug 2019 15:45:53 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f9e8:5e8c:7194:fad3]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f9e8:5e8c:7194:fad3%11]) with mapi id 15.20.2220.013; Sat, 31 Aug
 2019 15:45:53 +0000
From: Paul Burton <paul.burton@mips.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Subject: Re: [PATCH v2 8/9] mips: numa: check the node id consistently for
 mips ip27
Thread-Topic: [PATCH v2 8/9] mips: numa: check the node id consistently for
 mips ip27
Thread-Index: AQHVYBMrEGdL2TsIz0WmkCz/eLDvgg==
Date: Sat, 31 Aug 2019 15:45:52 +0000
Message-ID: <20190831154547.qzh6j4jwg5o5y4db@pburton-laptop>
References: <1567231103-13237-1-git-send-email-linyunsheng@huawei.com>
 <1567231103-13237-9-git-send-email-linyunsheng@huawei.com>
In-Reply-To: <1567231103-13237-9-git-send-email-linyunsheng@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LNXP123CA0005.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::17) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [78.144.179.23]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 257b9333-7e01-4ec4-1e4d-08d72e2a4dce
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MWHPR2201MB1087; 
x-ms-traffictypediagnostic: MWHPR2201MB1087:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MWHPR2201MB10878CA9A9A195AD6BAA2A77C1BC0@MWHPR2201MB1087.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 014617085B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(7916004)(346002)(396003)(136003)(376002)(366004)(39840400004)(189003)(199004)(446003)(26005)(71190400001)(71200400001)(14454004)(66066001)(316002)(7406005)(6512007)(33716001)(54906003)(7736002)(58126008)(99286004)(6436002)(305945005)(256004)(6306002)(53936002)(52116002)(7416002)(9686003)(81156014)(81166006)(6916009)(478600001)(8936002)(8676002)(66476007)(386003)(6506007)(76176011)(6116002)(5660300002)(1076003)(476003)(44832011)(66946007)(3846002)(966005)(6486002)(186003)(4326008)(229853002)(64756008)(11346002)(25786009)(2906002)(6246003)(66446008)(486006)(66556008)(42882007)(102836004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR2201MB1087;
 H:MWHPR2201MB1277.namprd22.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uoAdCCSidX1K6RB1UNyf9gCDWGzGORUOdyQQ2IjDYyCD68PWWbPT4v2yiv2ufQCElAl6EdwoLAJjCtX5q43oVqKt/S23l0XEmPH3PLn7ap3rD1mgE2cIGf/tEleI3PS9vOZn4K7R+FP/uriQ8I7ITHng8VjJpM4761O1IVYo+HYFMbX1M3/fYiNqezgdo6h6fd0hOdoQK7BSYs5L2XmmCEtSuGJ/43cuMPX1du3Rez4B4udjKTaaPc5mV+nNyze7gSnYVXm1038Ia2T6rW+GJbCuIXaLv9eOHb2VBvu7krvlkgBms/2oL9O5PM/S0mg5KY97xSMcL2m+LqnUa7ZcvkgMPOG/qgCaBziCeOM8XO3YvXhEEhWGKm/Cs6ocTBsEv9rLQZ8wdIaN/ozBY4Z9jLZb0ZI8c59UODZCaXWeKo4=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8A415B3B62888046BC791500970CB9FB@namprd22.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 257b9333-7e01-4ec4-1e4d-08d72e2a4dce
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2019 15:45:52.8880 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vu2qChMP5+WQAI7xRGv86M09DLSXJXCRtisN/RZSULWEKMjgTyOQVh9k5znrlSacuHrejyfX1AE9arQZI6IyZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1087
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
 "linuxarm@huawei.com" <linuxarm@huawei.com>,
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
 "nfont@linux.vnet.ibm.com" <nfont@linux.vnet.ibm.com>,
 "mattst88@gmail.com" <mattst88@gmail.com>,
 "len.brown@intel.com" <len.brown@intel.com>,
 "gor@linux.ibm.com" <gor@linux.ibm.com>,
 "anshuman.khandual@arm.com" <anshuman.khandual@arm.com>,
 "bp@alien8.de" <bp@alien8.de>, "luto@kernel.org" <luto@kernel.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "rth@twiddle.net" <rth@twiddle.net>, "axboe@kernel.dk" <axboe@kernel.dk>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ralf@linux-mips.org" <ralf@linux-mips.org>,
 "tbogendoerfer@suse.de" <tbogendoerfer@suse.de>,
 "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
 "ink@jurassic.park.msu.ru" <ink@jurassic.park.msu.ru>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 "davem@davemloft.net" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Yunsheng,

On Sat, Aug 31, 2019 at 01:58:22PM +0800, Yunsheng Lin wrote:
> According to Section 6.2.14 from ACPI spec 6.3 [1], the setting
> of proximity domain is optional, as below:
>=20
> This optional object is used to describe proximity domain
> associations within a machine. _PXM evaluates to an integer
> that identifies a device as belonging to a Proximity Domain
> defined in the System Resource Affinity Table (SRAT).
>=20
> Since mips ip27 uses hub_data instead of node_to_cpumask_map,
> this patch checks node id with the below case before returning
> &hub_data(node)->h_cpus:
> 1. if node_id >=3D MAX_COMPACT_NODES, return cpu_none_mask
> 2. if node_id < 0, return cpu_online_mask
> 3. if hub_data(node) is NULL, return cpu_online_mask
>=20
> [1] https://uefi.org/sites/default/files/resources/ACPI_6_3_final_Jan30.p=
df

Similar to David's comment on the sparc patch, these systems don't use
ACPI so I don't see from your commit message why this change would be
relevant.

This same comment applies to patch 9 too.

Thanks,
    Paul

>=20
> Signed-off-by: Yunsheng Lin <linyunsheng@huawei.com>
> ---
>  arch/mips/include/asm/mach-ip27/topology.h | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/mips/include/asm/mach-ip27/topology.h b/arch/mips/inclu=
de/asm/mach-ip27/topology.h
> index 965f079..914a55a 100644
> --- a/arch/mips/include/asm/mach-ip27/topology.h
> +++ b/arch/mips/include/asm/mach-ip27/topology.h
> @@ -15,9 +15,18 @@ struct cpuinfo_ip27 {
>  extern struct cpuinfo_ip27 sn_cpu_info[NR_CPUS];
> =20
>  #define cpu_to_node(cpu)	(sn_cpu_info[(cpu)].p_nodeid)
> -#define cpumask_of_node(node)	((node) =3D=3D -1 ?				\
> -				 cpu_all_mask :				\
> -				 &hub_data(node)->h_cpus)
> +
> +static inline const struct cpumask *cpumask_of_node(int node)
> +{
> +	if (node >=3D MAX_COMPACT_NODES)
> +		return cpu_none_mask;
> +
> +	if (node < 0 || !hub_data(node))
> +		return cpu_online_mask;
> +
> +	return &hub_data(node)->h_cpus;
> +}
> +
>  struct pci_bus;
>  extern int pcibus_to_node(struct pci_bus *);
> =20
> --=20
> 2.8.1
>=20
