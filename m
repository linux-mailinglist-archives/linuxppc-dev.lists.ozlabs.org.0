Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9B028AC4F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Oct 2020 04:56:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C8jxX1NwPzDqt3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Oct 2020 13:56:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=wdc.com
 (client-ip=216.71.154.45; helo=esa6.hgst.iphmx.com;
 envelope-from=prvs=54744081d=damien.lemoal@wdc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=wdc.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=wdc.com header.i=@wdc.com header.a=rsa-sha256
 header.s=dkim.wdc.com header.b=NIk3Qs2P; 
 dkim=pass (1024-bit key;
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=bu3NZ6nE; 
 dkim-atps=neutral
X-Greylist: delayed 66 seconds by postgrey-1.36 at bilbo;
 Mon, 12 Oct 2020 13:31:35 AEDT
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C8jNl6MCSzDqTj;
 Mon, 12 Oct 2020 13:31:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1602469896; x=1634005896;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=B2H/dL/4Tk6ifO229+CDbwJhsi61Ae0kMhbusFZSfYA=;
 b=NIk3Qs2PZP2aKef62sUvh5LFRWHiVS3l6o0aKwWW/JcJSOAeiCPEyuh5
 dxpb/7Fh7hpXoe88AbifC1pChQqHjI24Hgf2Xi4Rwu/tFr/oTclnj/DBY
 QxpsUVGScLYKz0snpXiK7S+VRc7Qbui1wfHg4zF5bxQzJU58JSgst/C8e
 /GSB26i78gWnFKth7NK5RMLgAQ0PTTMxK5b0d82XewIAC+WHPeofyzdA5
 IF1AFZdMYJ/qxwJ21opmyUotYdSrK/n7VCon7qj9+LSjvzifeCRCpgZMW
 MX3sYYjE0ZJeO2/No1Z4Sr6Id1KpTozFU1UfM8tzm28DqZgEkfHz7a27o Q==;
IronPort-SDR: otNXfCl468GV2kaRfPMurNEzzb+5DTvHbKamj2s+8BDLocQWr4zuQ3M3i+IKAljLE0jNxd9VpM
 cO+rQZXBC3hCB4USGfnGA9ogfGdhVarakItuizW2Gy++p8Z+M6RlhT6/ZGAyh4Bb4soyndVApS
 t1CbgZ/xItk8xcO9aKd2ojIIDU+T0Z2LVw84K7kBp34/4Smmy1km93xm3x16vuxVWJ3+pskOv3
 siKun/r5wc2+puveLQmD3LIou+hiTE8AMRzhJ76wz/XN32b0xaH0DxtBNrPj7bQ2z+DqpFhCU+
 uec=
X-IronPort-AV: E=Sophos;i="5.77,365,1596470400"; d="scan'208";a="150813290"
Received: from mail-bn8nam12lp2169.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.169])
 by ob1.hgst.iphmx.com with ESMTP; 12 Oct 2020 10:30:21 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gx/LTHF9rvHW8Oe8ILITCqr1oekN0sSJJn9RkpcHF8rIin2//JVyW6AgAlQAeO/v1EowEo57pZXHLTZIAy/oh4sgxpcSGZDKN5oz0Qe5qPK5ALqfSLuBJmsV9AjLyCrQw4LfNvVHA5X/BDt9kKApbyWTlvE/mChWEAeK2jwUV+avUBnk6VOQeR5wnt5ri1PntjTXlIuGOC1C+wB/9l2juXZbCJp4Pz4p8f7Fz7xkvRrQ4+eJwlbmv6boTHlg5Kw8lXE/1AjnM4ZgS0AFsifxbxuSIjOVAxEndjwMb+y3JcGsuVp5FkLwRs65TutRE74FFvIf22sxhDPzR40XvIfT3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nSbIdboq5PT4g9q0YvKJz3kaJMX2RtABGp66gEoNwmc=;
 b=Kok+1aaGCiSZfqW1wmfB+kHe79JMm2f0m4TbxYf9iF9O5G/ZXp38pxI6FEhdVvJczC1oxUEx0BiWJ/jH1cJTKJ7qsq1BJbVSGcJTsAorroGNrYmYM+t+8l7Wbh5IWvJ0VGXdwladeVfJOpcoqinFt4xiAnbhaH0uGewPXN4kRMuNmUGT0t/etLda3IPoUpK7rFgAL7ObgaolOSF9YiV1tKcRYfXVoLRA9X+eXZQtAEs4qBuZHPYEZf91PR0dFaLSXlnkDhV3/6JNvTP1YcC6arSVI+ByCj2IBl8Uhj9qBZ+KZZJ487Embj0mtjbFITcETuHh+wrsFcIy0nDYldJobg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nSbIdboq5PT4g9q0YvKJz3kaJMX2RtABGp66gEoNwmc=;
 b=bu3NZ6nEIRGWvcX7BdK5F82a2Su5/ALOZX5mADuG3ixHeWl8vkyQlIEiI35HkhS1z2iLz2dIGt5v/ks6P0iyAim2GKOXOJDRdbUJuqpyR6LOJWHd5LzT+oOasYNyetl+MyoT9N0v8T1iC7HL9CruXmyPts3iLmme8nvBuhJdvlI=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by MN2PR04MB6928.namprd04.prod.outlook.com (2603:10b6:208:1e3::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.24; Mon, 12 Oct
 2020 02:30:19 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85%6]) with mapi id 15.20.3455.029; Mon, 12 Oct 2020
 02:30:19 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: "ira.weiny@intel.com" <ira.weiny@intel.com>, Andrew Morton
 <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski
 <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH RFC PKS/PMEM 26/58] fs/zonefs: Utilize new kmap_thread()
Thread-Topic: [PATCH RFC PKS/PMEM 26/58] fs/zonefs: Utilize new kmap_thread()
Thread-Index: AQHWnnW5LYLzak05pEGSI1gzotA84w==
Date: Mon, 12 Oct 2020 02:30:18 +0000
Message-ID: <BL0PR04MB65146627753E6A8125C30044E7070@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
 <20201009195033.3208459-27-ira.weiny@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:dbd:ddb3:86a4:b7da]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2d8e38c9-c661-47b4-955c-08d86e56c300
x-ms-traffictypediagnostic: MN2PR04MB6928:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR04MB69281462D64954D72F6383A1E7070@MN2PR04MB6928.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:2089;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nb7ZZkrOcnI45uzu82g63ZPDCw/m4UEa+T14BlRir04UDAmgqTKjBKFQ/1tq3q95aFreC/myPH7bQVuOZygHUtANTgMCUzT/Pyur4q2rkZgxQjgu2tK2/9wVp2h2SQ2PIehISfjlFkUmEohfWX26Cg+7Fw+ncYVUGCA3GBq/iNQrWxbeF5GIkE4ciKI2Ta+JMFg530FWmVV/3MNOdO5PIr93+nS5dgdzR8tDl4fNZNcda6K0U+RBmBhAF6G4PiHCwu4dLKAqHtEtpN1w+lsxrk7joY78vLDxPGvR8dOWqU93TlxExhLGaLZNWnYKeI3pA3QpzCWmAeR04Ul6/pWdYg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6514.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(346002)(136003)(376002)(366004)(8936002)(71200400001)(86362001)(186003)(91956017)(4326008)(66446008)(64756008)(66556008)(76116006)(7366002)(52536014)(8676002)(4744005)(5660300002)(33656002)(6506007)(7406005)(7416002)(478600001)(66946007)(66476007)(9686003)(53546011)(55016002)(7696005)(316002)(110136005)(54906003)(2906002)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: jjLBIa8rzP8PSUzUPRNNjZPO+F9m4B6rNx2BP5Hxn4hovZp8mG8VwNQRMnSFbWOz3vIBGGbrlwmZ2h/rrQ3LAnV478QA8TsJeEWgnROLCLR26e3M2EbbogZuJfrd8ZHepR6teHHrbin/rSSMJcyuivIccqO+Io91CjJtVLKGT+IxxyJeBxmaC3EM+JLu8Rm3Kx8m967TzWpRyeGTzqzgeKyG0yThTif6ugu1X+cS2L5ObX1F/fl2leT5khZ92kjaRHmV42QjfDSDQBRJ5T2sWkjLqL6qZdGMf2A7TG8LiEhWaSnE+PmptdxY4alKupBmftgWegPnh18eZ3klScKVzKqPJWtLa3seT93Q56fQAqIthA5+kX5qt7UatZBhg0gKm0KkBt+EXNCPEi6hfwJXTcKfMhrLXdmO4xo5z+sSfQStIvDc5rcmkS1pZ7oYknbDJlJtS3SQSqbBQQUJPafcSH0MKoCCaLHQYYEZElvKn9S/oXh/zKwEQ9/zN4tqic4ypaC6xgod9dW89WUn6IRtPbzsXwH70beu1D6sABibklUQzTXk4zAezxU4pLpXOEpjFmzQIZ8wo7n5pOvKphLu99Aqpkh/XR9us5YFAynE0SXyaG0lSyNOUkHX4czg41/a9jardublYq7n+2PgYlLtR3YEH/hKmOGAbSLFeveqJxrdOEFzmYAfv7w/UdGZFRYD9O0jto4jXaOrMeEBD/8QJw==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d8e38c9-c661-47b4-955c-08d86e56c300
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2020 02:30:18.8981 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FtNVgLbLUqLnCuOwFgwFyh+Wo2k/+4LOuBCyiRJEYABushz8+FxnNx4RRBUxLG0y9/lhxKLevLpPI63mq8apww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6928
X-Mailman-Approved-At: Mon, 12 Oct 2020 13:54:30 +1100
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
Cc: "linux-aio@kvack.org" <linux-aio@kvack.org>,
 "linux-efi@vger.kernel.org" <linux-efi@vger.kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "kexec@lists.infradead.org" <kexec@lists.infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "target-devel@vger.kernel.org" <target-devel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
 "drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>,
 Naohiro Aota <Naohiro.Aota@wdc.com>,
 "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
 "linux-nilfs@vger.kernel.org" <linux-nilfs@vger.kernel.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-afs@lists.infradead.org" <linux-afs@lists.infradead.org>,
 "cluster-devel@redhat.com" <cluster-devel@redhat.com>,
 "linux-cachefs@redhat.com" <linux-cachefs@redhat.com>,
 "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 Fenghua Yu <fenghua.yu@intel.com>,
 "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>,
 "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "ecryptfs@vger.kernel.org" <ecryptfs@vger.kernel.org>,
 "linux-erofs@lists.ozlabs.org" <linux-erofs@lists.ozlabs.org>,
 "reiserfs-devel@vger.kernel.org" <reiserfs-devel@vger.kernel.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-bcache@vger.kernel.org" <linux-bcache@vger.kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 "io-uring@vger.kernel.org" <io-uring@vger.kernel.org>,
 "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
 "linux-ntfs-dev@lists.sourceforge.net" <linux-ntfs-dev@lists.sourceforge.net>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2020/10/10 4:52, ira.weiny@intel.com wrote:=0A=
> From: Ira Weiny <ira.weiny@intel.com>=0A=
> =0A=
> The kmap() calls in this FS are localized to a single thread.  To avoid=
=0A=
> the over head of global PKRS updates use the new kmap_thread() call.=0A=
> =0A=
> Cc: Damien Le Moal <damien.lemoal@wdc.com>=0A=
> Cc: Naohiro Aota <naohiro.aota@wdc.com>=0A=
> Signed-off-by: Ira Weiny <ira.weiny@intel.com>=0A=
> ---=0A=
>  fs/zonefs/super.c | 4 ++--=0A=
>  1 file changed, 2 insertions(+), 2 deletions(-)=0A=
> =0A=
> diff --git a/fs/zonefs/super.c b/fs/zonefs/super.c=0A=
> index 8ec7c8f109d7..2fd6c86beee1 100644=0A=
> --- a/fs/zonefs/super.c=0A=
> +++ b/fs/zonefs/super.c=0A=
> @@ -1297,7 +1297,7 @@ static int zonefs_read_super(struct super_block *sb=
)=0A=
>  	if (ret)=0A=
>  		goto free_page;=0A=
>  =0A=
> -	super =3D kmap(page);=0A=
> +	super =3D kmap_thread(page);=0A=
>  =0A=
>  	ret =3D -EINVAL;=0A=
>  	if (le32_to_cpu(super->s_magic) !=3D ZONEFS_MAGIC)=0A=
> @@ -1349,7 +1349,7 @@ static int zonefs_read_super(struct super_block *sb=
)=0A=
>  	ret =3D 0;=0A=
>  =0A=
>  unmap:=0A=
> -	kunmap(page);=0A=
> +	kunmap_thread(page);=0A=
>  free_page:=0A=
>  	__free_page(page);=0A=
>  =0A=
> =0A=
=0A=
acked-by: Damien Le Moal <damien.lemoal@wdc.com>=0A=
=0A=
-- =0A=
Damien Le Moal=0A=
Western Digital Research=0A=
