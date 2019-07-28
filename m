Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCC778227
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 00:51:40 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45xdNT1shRzDqRw
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 08:51:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=wavecomp.com
 (client-ip=40.107.70.118; helo=nam04-sn1-obe.outbound.protection.outlook.com;
 envelope-from=pburton@wavecomp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=mips.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=wavecomp.com header.i=@wavecomp.com header.b="R26HwiPe";
 dkim-atps=neutral
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700118.outbound.protection.outlook.com [40.107.70.118])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45xdLf557QzDqQq
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jul 2019 08:50:02 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oLKmNkw5ACkjsvHmCaMJQ1lRGRvUswEAHWuGeaXhjxupaaJq3Q6PUuyCPE9vGXGkJvq+1EmsQYa9YazdmieohHXZcMu/KbXCmreD9b7oG/aLJuldvpKFNdv1BWQlQWhIDFr7eaIjOH3va/ozHDVYdKUx27rZ2E+kLOpjwEt1nfijep/PflzKHaShRPx0d3BhmHgnWgc2uF4Y4cKAw6p0/xTIBEY/neUZ6JGfL9Fi3nHCEQmyZVbtz0HBHsvyo4gi+Cc5cexPrw4DTRiq/62bNia16yOfLFCd+SZ1R0nTVZ8e4JD3Af7BQaz3slRCr3avS+rc75eRoCy5NueAXWO0Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1t+e0kdgV/QI2HfuepYYo8ALA2TOfk9UcfFB4PXRaNo=;
 b=kXmAlJpm4IDgFWMciKZdZczpaBawUxioXFZSLt38GDQ4jD5lu70jg9o8QYI/f/HVqPTcPWf7vH0ibdhKN5FryiJkd6hj1OXSurPEmOJwgFTPKVFr3dT5GZlVh4nZHBTD+ifvHBe147K5VEDcjNX7LZqA3ODuHJk0gqP3/t7gdAye6PIaekv7u/SkT/vfGHelN/yfgqLZfgrSY42q3eTFepQkUoZr6QEOHyomf9OOTD62xohkd1oTyw8a2ubWUdzqi7qaIeaspcli4R/QtXqR9q4MdIckRZGvLBAVC7sushTIvK4LEZaGWe8oI4gnvsbieOHG7MbPBBkuRc80DVZZtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=wavecomp.com;dmarc=pass action=none
 header.from=mips.com;dkim=pass header.d=mips.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1t+e0kdgV/QI2HfuepYYo8ALA2TOfk9UcfFB4PXRaNo=;
 b=R26HwiPeP8BQNG2RyotTltxCEtfBhBs5xSR+8GrJIOv8VafzqBgu6LAAnhi1leiK3c6wsekwlUtQJ7Txk5Uj/nO2epH9WJHj6HM0VK75OodvrCav2aVGLS/lzyx55gBlt3pW66lNwts0mf4bWXTaz9tuYAj8YIQ0I06v/A7HLoI=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1375.namprd22.prod.outlook.com (10.174.160.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Sun, 28 Jul 2019 22:49:55 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::105a:1595:b6ef:cbdf]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::105a:1595:b6ef:cbdf%4]) with mapi id 15.20.2115.005; Sun, 28 Jul 2019
 22:49:55 +0000
From: Paul Burton <paul.burton@mips.com>
To: Denis Efremov <efremov@linux.com>
Subject: Re: [EXTERNAL][PATCH 1/5] PCI: Convert pci_resource_to_user to a weak
 function
Thread-Topic: [EXTERNAL][PATCH 1/5] PCI: Convert pci_resource_to_user to a
 weak function
Thread-Index: AQHVRYJLuix0vLkFjkOXtfNq2O4qQKbgooWA
Date: Sun, 28 Jul 2019 22:49:55 +0000
Message-ID: <20190728224953.kezztdozc6k24ya3@pburton-laptop>
References: <20190728202213.15550-1-efremov@linux.com>
 <20190728202213.15550-2-efremov@linux.com>
In-Reply-To: <20190728202213.15550-2-efremov@linux.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR02CA0043.namprd02.prod.outlook.com
 (2603:10b6:a03:54::20) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [73.93.4.225]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a04180d2-8bc9-41d1-8562-08d713ade8bf
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR2201MB1375; 
x-ms-traffictypediagnostic: MWHPR2201MB1375:
x-microsoft-antispam-prvs: <MWHPR2201MB137543F7C0491F4E3EAFBFADC1C20@MWHPR2201MB1375.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:983;
x-forefront-prvs: 01128BA907
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(7916004)(366004)(346002)(376002)(136003)(39830400003)(396003)(199004)(189003)(66476007)(66556008)(71190400001)(66946007)(5660300002)(4326008)(71200400001)(76176011)(7416002)(6246003)(53936002)(256004)(6916009)(66446008)(64756008)(52116002)(99286004)(6116002)(25786009)(3846002)(66066001)(6512007)(9686003)(44832011)(305945005)(81156014)(6506007)(26005)(81166006)(316002)(478600001)(476003)(8676002)(186003)(68736007)(7736002)(229853002)(446003)(6436002)(8936002)(486006)(2906002)(33716001)(1076003)(102836004)(6486002)(54906003)(42882007)(11346002)(14454004)(386003)(58126008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR2201MB1375;
 H:MWHPR2201MB1277.namprd22.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LGoXH/hfZ2EmVxj3CUBqAL1sE0i9frxkLeyaAv11qd5O/T0Vpk5dzHcq5B69mWk9zzcZGjP8mgNYqnYgk8VqWacbSL5U1PAXFUuEUxznedrRjQwQV2vPSyfCz2/0ML4894jFWL5b9GgZoPlrjT7dZ8vyafd0q/MtN4sU7xDwnvr+Quk4JuTf2quk4QpWt+gytYlAgN9WF/xbO6KcK2SOv/ebCUzSDWbybST6lhuT065w+DYtU/sfa+9g9lrHpN+xqIVS7fcS0DGisdVV0uROM8JS2Q+vNtIMz2MBVoRQGNaWh0MilRwAmDP6FXuXef+RGu3NNUfdXp0HIPTnpe2WMds9niDVqNKpSlA+naW4VSVt+Y5txDN3lNRiB2e+jDH4pvj72xFpYjGeMDxphd52Bnfx5LUtHJxgrIr28bB8Na8=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A2F7F7783DF44944999686D51424D191@namprd22.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a04180d2-8bc9-41d1-8562-08d713ade8bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2019 22:49:55.3491 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1375
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
Cc: Michal Simek <monstr@monstr.eu>, James Hogan <jhogan@kernel.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 Ralf Baechle <ralf@linux-mips.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Bjorn Helgaas <bhelgaas@google.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Denis,

On Sun, Jul 28, 2019 at 11:22:09PM +0300, Denis Efremov wrote:
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 9e700d9f9f28..1a19d0151b0a 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -1870,25 +1870,13 @@ static inline const char *pci_name(const struct p=
ci_dev *pdev)
>  	return dev_name(&pdev->dev);
>  }
> =20
> -
>  /*
>   * Some archs don't want to expose struct resource to userland as-is
>   * in sysfs and /proc
>   */
> -#ifdef HAVE_ARCH_PCI_RESOURCE_TO_USER
> -void pci_resource_to_user(const struct pci_dev *dev, int bar,
> -			  const struct resource *rsrc,
> -			  resource_size_t *start, resource_size_t *end);
> -#else
> -static inline void pci_resource_to_user(const struct pci_dev *dev, int b=
ar,
> -		const struct resource *rsrc, resource_size_t *start,
> -		resource_size_t *end)
> -{
> -	*start =3D rsrc->start;
> -	*end =3D rsrc->end;
> -}
> -#endif /* HAVE_ARCH_PCI_RESOURCE_TO_USER */
> -
> +void __weak pci_resource_to_user(const struct pci_dev *dev, int bar,
> +				 const struct resource *rsrc,
> +				 resource_size_t *start, resource_size_t *end);
> =20
>  /*
>   * The world is not perfect and supplies us with broken PCI devices.

This is wrong - using __weak on the declaration in a header will cause
the weak attribute to be applied to all implementations too (presuming
the C files containing the implementations include the header). You then
get whichever impleentation the linker chooses, which isn't necessarily
the one you wanted.

checkpatch.pl should produce an error about this - see the
WEAK_DECLARATION error introduced in commit 619a908aa334 ("checkpatch:
add error on use of attribute((weak)) or __weak declarations").

Thanks,
    Paul
