Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 214503AA93F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 04:57:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G56DR5Jh1z30J6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 12:57:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com header.b=cf0aBKtv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=yujie.liu@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=cf0aBKtv; dkim-atps=neutral
X-Greylist: delayed 64 seconds by postgrey-1.36 at boromir;
 Thu, 17 Jun 2021 12:39:54 AEST
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G55qt4ksqz300X
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 12:39:54 +1000 (AEST)
IronPort-SDR: bGrhvL8MX1c5iM9bhLqL7mNglsx46ujDLpoFYJENqRr386ak9yAbxlfy16dD4zbmfiuqVYa/eD
 PcgW63MZUoMg==
X-IronPort-AV: E=McAfee;i="6200,9189,10017"; a="270140767"
X-IronPort-AV: E=Sophos;i="5.83,278,1616482800"; d="scan'208";a="270140767"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2021 19:38:36 -0700
IronPort-SDR: lhBiv//Tv9ioNb9u6VqC8oG4T8s2PZLj3X7cUR8UuKeHZDKJVtMfmL7PIOMJLK9KSTTJnXcApg
 ML1acsvc59DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,278,1616482800"; d="scan'208";a="404789822"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga003.jf.intel.com with ESMTP; 16 Jun 2021 19:38:35 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Wed, 16 Jun 2021 19:38:35 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4
 via Frontend Transport; Wed, 16 Jun 2021 19:38:35 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.4; Wed, 16 Jun 2021 19:38:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W8vZx1v/SbjnP2P1OUZ8UHr4ec+a0RK8tPXyv1Gz2s9E6ZtPjVrdwlF0IYQbDmy2Y6+Tzcs4QvJaJPrqnX4Ob+4xcikcUo+impbJVo1qSsFytEehCkkcAbb9APTaWg7/A3XQFPBCG8TY/YfcpFrSJAvEbg797g/A9gS9HTDwPrGhpG8QprKU24e30lYv9DVIyYfWtSbFolHuFKuD9rg2dAVS5GFwKf38yWigu43X9nUCF5j8FMtFeUcGhtL7m9Zx+30xdhLJYWe/RWZsIXo16mz1bnxucgcSXhV2xBYJJc1RuRaJUVSz9/8YK1xNJ68Az6LYTmy7YfUP2ZYrr3tzpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JWZ2Q00lx0yEp6H8shyJ0o/cBuFAB/UXa2m2ve2EA58=;
 b=PYWp378TbxIZ8/xgXD/xV/j+JW8/afsbN1mwuSTsufdXLzpZGru9O+I9QHarIXuuANz9h+EYeedDVpbwy61PvNTlNWVFOa8JA0qinp2PqXXzVszdZvzlg+GGDpejTANzZmeyNJQD8vUJlgvUD/+AbfzdR6whuZZRQ8m5OxIG67DgQlh9Owm8tXNGa9f39tIyeItR7vPcWlRIzdmeRS1I4M948oe7GF2t8/4wOetoWI8Bu0Q3NF2LcpEGh04ZT0WvIy0A74BAaecC8I2yHJ9mTub59nUMNdnnd19jQzHOuDnD2kqMqkTIwiJf8nrkLHqWGdXpwBtxQrkwp4H4ZgclAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JWZ2Q00lx0yEp6H8shyJ0o/cBuFAB/UXa2m2ve2EA58=;
 b=cf0aBKtvVXlzChJ9hW6FPzljHPWBYqSBm24VOXWilAIMYA/JeR30Sk8wWOUsQvTH4VWRgXPd6RRZJUKfuqCf8OISgV7bYjihfpA+j3g+c/XcA/UiCnvHRqAttCIHoET1mfigyrj9TfT78Oi++9dGFjOnSxgMGqAz/6QUEsVKd0s=
Received: from SJ0PR11MB5598.namprd11.prod.outlook.com (2603:10b6:a03:304::12)
 by SJ0PR11MB5631.namprd11.prod.outlook.com (2603:10b6:a03:3ae::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Thu, 17 Jun
 2021 02:38:29 +0000
Received: from SJ0PR11MB5598.namprd11.prod.outlook.com
 ([fe80::e50f:8709:f404:8b4b]) by SJ0PR11MB5598.namprd11.prod.outlook.com
 ([fe80::e50f:8709:f404:8b4b%4]) with mapi id 15.20.4219.026; Thu, 17 Jun 2021
 02:38:29 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Subject: RE: [LKP] Re: [mm/mremap] ecf8443e51: vm-scalability.throughput
 -29.4% regression
Thread-Topic: [LKP] Re: [mm/mremap] ecf8443e51: vm-scalability.throughput
 -29.4% regression
Thread-Index: AQHXYTepcR+HlYYqpEa4J/tD6H7FD6sXfuvg
Date: Thu, 17 Jun 2021 02:38:29 +0000
Message-ID: <SJ0PR11MB5598DC21AC79E6D8D5F485FDFB0E9@SJ0PR11MB5598.namprd11.prod.outlook.com>
References: <20210614145536.GB28801@xsang-OptiPlex-9020>
 <a815a022-cf3e-fe4b-ee23-191523ed1980@linux.ibm.com>
In-Reply-To: <a815a022-cf3e-fe4b-ee23-191523ed1980@linux.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
authentication-results: linux.ibm.com; dkim=none (message not signed)
 header.d=none;linux.ibm.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.143.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 202b3847-2e7c-4403-7311-08d93138fdf6
x-ms-traffictypediagnostic: SJ0PR11MB5631:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR11MB5631AC1984D500B7770CB735FB0E9@SJ0PR11MB5631.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Yxz3hV5HXbj1KFnMuxB3T/vSyvKSTrD6jk2fSwEh2q7wMkx2Jk8a2c06vYoBowz2Nawt74xAxJcXwPcQhN8Unhs43x7CiORq8IbBj1oZCkQtn7QbVQB6XP57wvbTqB4dF6voZjINSu+RA+fVMQ2BWw1xFp3QpMrfzRs3CNLNpupkYdMFXFkgWiQqp5D8e8GeIAq0khzZc+4YRvnJsmJqwgAYjc0wgGX8tMrer8ekJqpgsfiupisG4vTobTX7UW//fJczHBh0MP++v//JVNSTJYpyIXKPEdZCcbaHJIkijjKwUnblAmRtCXpUaVPbyIdPmrNEFSDJFm5vyjkW6PS0w4SUUlYDQSvJSeoNTT7B98JsZ4idYijGZiis9spHlC+H6hq1yu6Ghiyy3Klv2crPnBaBEaeAjwurdJQOxKK9KE3ZlwOGAEDXqWHIUbkFTGpKPHVlrCKDgSlCY18kXlCNS/k1ATYq2joj1UrxvWvegQVm3JcRbNK6Cex/aCgEQ+M4JerCfellziQobWfMus6T8is311U3BjFl+BDitC7sgvM2ACShbcE8hbqdyyIXnNZM2vXXlJsicECU0bARUKnipsgg9iyBUvbTizcQB+sep1jBGHACy8lneUclq/4BFa8Tob6uXt4jTC0CiV8euynulUzWssVdFwjZoWLe79X9/6S3DkEHncUfQ/mBEHYmdwTyw6oWQGE2Tw7N9D1IT/w6JvYfM+o7BRmZnmGxmV3zSwj45eP1mbDuw2anHsQNihZndvN2K35N05QQUUn7zql1iQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5598.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(366004)(376002)(346002)(136003)(39860400002)(8936002)(71200400001)(107886003)(4326008)(186003)(38100700002)(8676002)(33656002)(122000001)(2906002)(26005)(55016002)(7416002)(316002)(966005)(54906003)(83380400001)(478600001)(66946007)(9686003)(7696005)(76116006)(53546011)(6506007)(86362001)(52536014)(5660300002)(66556008)(64756008)(66476007)(66446008)(6916009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Hzyn5zMxr+LXk4xofNY6w34yImXT+5MaZkoS2g/sKP73E5f97fwHrk9lJE?=
 =?iso-8859-1?Q?2ZSrVa4TmyCATKBywkchDOH89x0TJEKtaqtoO7ZYbJBhBXFgxJ68D9iqOG?=
 =?iso-8859-1?Q?w/OggI1fa1CRjegPm2a9sGeO3DN6QD4ZKLH3tTPlqBLK+jn7JvfPpICOE/?=
 =?iso-8859-1?Q?botJFq0abmgOe1gsOUmniHQYXo37vcraBIPgy1GdmrBFJ6G7wtY6YQTFwd?=
 =?iso-8859-1?Q?Xoq8H+GRGBpq8jnxGRtgh4hIgbm0BsSxGSzoaoiW9R6a5VJhs7nHXdIuZC?=
 =?iso-8859-1?Q?dlPjzzWER5eU5brZpT5TIEChk+1cGdo43tJBmA1Sfs4XCIQGU72QKppRUb?=
 =?iso-8859-1?Q?F/p8+o5/HfCViL/lAju9kCReDcCpYlSfAPsspOKvX1fdBe0Q/kHthTAdiS?=
 =?iso-8859-1?Q?7uoYxsYdVYMq5+2OtQlT6sltUl8YPe8B99++af+UjMA1q1hsn7xK2HAHyY?=
 =?iso-8859-1?Q?PgB2GKgqWBMTRe9JZj+LWK7/qiuqzQKwLkNrSSQIB9403SyZ0zg48hWS7H?=
 =?iso-8859-1?Q?Y+ylbg9rbVVUBhw9nRhrvHjdBgPxHZV5MkeJU1KfUfi+rOrt68ba/X3TaS?=
 =?iso-8859-1?Q?ATvR5E28OspZJxGpGrZUhLpY9hW3dbm8uLkz2b2yMv7ZP6mu33W6IE0vXk?=
 =?iso-8859-1?Q?IrP25BCj1pNq/36esbRQviPy/W05beBLPAiXlexnvzABp95eCQE7jO0PT4?=
 =?iso-8859-1?Q?g15fZ90jD9JYGQ8BrYBFkxFleIf9+vQ1rsMPiLeEwS9RsHC787jkmatQ4B?=
 =?iso-8859-1?Q?M/c/eE2dsDkyApRqYrZBWnPbwQBayXp5PR2zCw1mppb4iymfhSV7mObLA5?=
 =?iso-8859-1?Q?ZkwfIlU02xzvIalHN6jPrcTmztgGUjcUHHQ2K8Y2KWQx2x5pCoyiTGMCsw?=
 =?iso-8859-1?Q?0TkAOZV1R8f4PYbPuZmov6C4szGaJPVZ1Vnhx0WsExYHX7h/vNbQftoJI1?=
 =?iso-8859-1?Q?CDD8R/xC4KjGdOTn0Z9Z5S1eRZbQpQzD0PEuvCT8tPDydkgrRsfWnp1Whq?=
 =?iso-8859-1?Q?KXylZFOmj3/ZxFNQQz5T1AkCS/AO16P5XyJcykjfyVLUsbTi9Xt6ZJkR5Y?=
 =?iso-8859-1?Q?syfaCHZsO24h1+F3wd/ZuJPrNYzeLOji+ShJESZZL77qqVitIWQhOoqEam?=
 =?iso-8859-1?Q?RVjtlmBSiVIYf6QL40vC003xlW2N3dEAyPZbz6FcS/rRW/5LDB5w0m6TBt?=
 =?iso-8859-1?Q?Awaon5hBWpXHhN1jjU+ho44SZYf5oI6XAp4R0ntWufkU9e2GIQ4Sx7NKnU?=
 =?iso-8859-1?Q?isXLbgeS3jjZ/trp4f40R3+QiBekH8WutfV0aqc6xndIOrXofNoN+EgpR1?=
 =?iso-8859-1?Q?yWGHGB7QWMeImu3CDw+A6E+vBmaWs5+4MMGTPN6KVyuRheR216FSQprZr6?=
 =?iso-8859-1?Q?J4LfhMCCtT?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5598.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 202b3847-2e7c-4403-7311-08d93138fdf6
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2021 02:38:29.7297 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R95rQZbTRImgDtIAIzD6gnKN0TQXC3KY5qLAJkuB2+Lcb4Qv5WWIP9wzPuJP5EmAfIvN6IUZADkyl6cPWfKD0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5631
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Thu, 17 Jun 2021 12:57:15 +1000
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
Cc: lkp <lkp@intel.com>, "lkp@lists.01.org" <lkp@lists.01.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>, "npiggin@gmail.com" <npiggin@gmail.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "Sang,
 Oliver" <oliver.sang@intel.com>,
 "kaleshsingh@google.com" <kaleshsingh@google.com>,
 "joel@joelfernandes.org" <joel@joelfernandes.org>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> -----Original Message-----
> From: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> Sent: Tuesday, June 15, 2021 12:09 AM
> To: Sang, Oliver <oliver.sang@intel.com>
> Cc: lkp <lkp@intel.com>; LKML <linux-kernel@vger.kernel.org>; lkp@lists.0=
1.org; linux-mm@kvack.org; akpm@linux-foundation.org;
> mpe@ellerman.id.au; linuxppc-dev@lists.ozlabs.org; kaleshsingh@google.com=
; npiggin@gmail.com; joel@joelfernandes.org; Christophe
> Leroy <christophe.leroy@csgroup.eu>; Linus Torvalds <torvalds@linux-found=
ation.org>; Kirill A . Shutemov <kirill@shutemov.name>
> Subject: [LKP] Re: [mm/mremap] ecf8443e51: vm-scalability.throughput -29.=
4% regression
>=20
> On 6/14/21 8:25 PM, kernel test robot wrote:
> >
> >
> > Greeting,
> >
> > FYI, we noticed a -29.4% regression of vm-scalability.throughput due to=
 commit:
> >
> >
> > commit: ecf8443e51a862b261313c2319ab4e4aed9e6b7e ("[PATCH v7 02/11]
> > mm/mremap: Fix race between MOVE_PUD mremap and pageout")
> > url:
> > https://github.com/0day-ci/linux/commits/Aneesh-Kumar-K-V/Speedup-mrem
> > ap-on-ppc64/20210607-135424
> > base: https://git.kernel.org/cgit/linux/kernel/git/powerpc/linux.git
> > next
> >
> >
>=20
> We dropped that approach and is now using https://lore.kernel.org/linux-m=
m/20210610083549.386085-1-aneesh.kumar@linux.ibm.com
>=20
>=20
> Instead of pud lock we are now using rmap lock with mremap.
>=20
> Can you check with that series?

Hi Aneesh,

Could you please specify the base commit of the patch series?=20

We have applied new patch series(rmap lock with mremap) on commit 027f55e87=
c30 (tty: hvc: udbg_hvc: retry putc on -EAGAIN), and it shows no regression=
 after patch.
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D                         =20
compiler/cpufreq_governor/kconfig/nr_ssd/nr_task/rootfs/runtime/tbox_group/=
test/testcase/thp_defrag/thp_enabled/uco
de:                                                                        =
                                       =20
  gcc-9/performance/x86_64-rhel-8.3/1/8/debian-10.4-x86_64-20200603.cgz/300=
/lkp-csl-2ap1/swap-w-seq-mt/vm-scalabili
ty/always/never/0x4003006                                                  =
                                       =20
                                                                           =
                                       =20
commit:                                                                    =
                                       =20
  027f55e87c30 (tty: hvc: udbg_hvc: retry putc on -EAGAIN)        <---  pat=
ch's base commit     =20
  ecf8443e51a8 (mm/mremap: Fix race between MOVE_PUD mremap and pageout)   =
   <---  first bad commit =20
  57da7477067d  (fixup)    <---  apply patch on 027f55e87c30
                                                                           =
                                       =20
027f55e87c309427 ecf8443e51a862b261313c2319a 57da7477067dbe29247484eda0e   =
                                       =20
---------------- --------------------------- ---------------------------   =
                                       =20
         %stddev     %change         %stddev     %change         %stddev   =
                          =20
             \          |                \          |                \     =
                          =20
    371814 =B1  3%     -29.1%     263582 =B1  3%      -0.1%     371286 =B1 =
 2%  vm-scalability.median      =20


We also tried to apply patches on commit ecf8443e51a8 (mm/mremap: Fix race =
between MOVE_PUD mremap and pageout), and the regression increased to  -33.=
9%
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D                         =20
compiler/cpufreq_governor/kconfig/nr_ssd/nr_task/rootfs/runtime/tbox_group/=
test/testcase/thp_defrag/thp_enabled/uco
de:                                                                        =
                                       =20
  gcc-9/performance/x86_64-rhel-8.3/1/8/debian-10.4-x86_64-20200603.cgz/300=
/lkp-csl-2ap1/swap-w-seq-mt/vm-scalabili
ty/always/never/0x4003006                                                  =
                                       =20
                                                                           =
                                       =20
commit:                                                                    =
                                       =20
  5f80ee2fc08b (mm/mremap: Fix race between MOVE_PUD mremap and pageout)   =
   <--- first bad commit's parent                                          =
                  =20
  ecf8443e51a8 (mm/mremap: Fix race between MOVE_PMD mremap and pageout)   =
 <--- first bad commit                                                     =
      =20
  8ae369d45894 (fixup)      <--- apply patch on ecf8443e51a8
                                                                           =
                                       =20
5f80ee2fc08b3613 ecf8443e51a862b261313c2319a 8ae369d4589492c7f7198cd742d   =
                                       =20
---------------- --------------------------- ---------------------------   =
                                       =20
          %stddev     %change         %stddev     %change         %stddev  =
                                        =20
              \          |                \          |                \    =
                                        =20
     373210           -29.4%     263582 =B1  3%     -33.9%     246626 =B1  =
2%  vm-scalability.median                   =20

Thanks=20

> -aneesh
> _______________________________________________
> LKP mailing list -- lkp@lists.01.org
> To unsubscribe send an email to lkp-leave@lists.01.org
