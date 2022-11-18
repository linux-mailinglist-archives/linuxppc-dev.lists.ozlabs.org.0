Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 741E362EE8F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Nov 2022 08:41:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ND7xv1xcHz3cKW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Nov 2022 18:41:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SB8DcceI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com; envelope-from=kevin.tian@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SB8DcceI;
	dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ND7ww6nZgz3bjQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 18:40:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668757217; x=1700293217;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Citel6HyNQHt48ukVUDnIEl9QkUxRAgq/IkpddkmkwY=;
  b=SB8DcceIHWrDpoG7KdZtA7JDHFAkBHwj89cISoGYCraE7L6/Kp9+CcEE
   9rgeqcpGFCKJxnjhY0EVPKTUzeNMBYwntpEa6mVKFiMb8XG5V+bhOwFTs
   Ea7GNYtFxVplYjPDMcmrjeYBiCIxf4hCDKULcKJFDTao6XFHyO95/Kjzv
   E8oGbm/DAKrrprzYj42d3X57sSAIstQUq9xqrHI3rWtGrllWn7vsaJqjF
   lVpHUjZVzW8bFGJTXc9ehlpp2BYFnEDx3dlq5SlnXhXt1SIJuahxpNKQf
   ubDbN5Gi8RrA28E5RuE+b0t1Lr+YL8gcLePMvSdrW30tkpZGAo4x9NNZk
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="399365077"
X-IronPort-AV: E=Sophos;i="5.96,173,1665471600"; 
   d="scan'208";a="399365077"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2022 23:40:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="671233971"
X-IronPort-AV: E=Sophos;i="5.96,173,1665471600"; 
   d="scan'208";a="671233971"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga008.jf.intel.com with ESMTP; 17 Nov 2022 23:40:13 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 17 Nov 2022 23:40:13 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 17 Nov 2022 23:40:13 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 17 Nov 2022 23:40:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MqYcBxu5Mkbl36dQe+HqvS9HUZxo55/Kavh0h0MDWUfPoy3Hd4Qdq1uyEzuQnmQrofwRMYGl8dHGnAoQbDaxCICE0wadfZ3ZNu5W2B8CKk7jEJOff92r+SQjyewRaT2b7vSAxhXe2Sgo0Hc2IFxb8AcU2oLlUU21gZRrUi2l9CvQ1rebBfDhBwBtEB/cYQbjoU3qMJScvRekH9M3VQiWAc9bX/jZWQe8VcQi1+h+XkHjE7ocNApKGISc65Ha7KYYmc6FuLo6A7hqjGyUxC1ZnZkp+l+5tctB7jJ6pCWVFaHXXnkeB/R/lmI2ubLmx7m7btnn35SDaO4piUsFf2JZNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R+Da7tpCmtXA1XY+7UmlYBZHZsppseJyRTTtDN6Kpzk=;
 b=mJ+8Iujm/o/fDhxZRapQgfA34P6/TXTdOHnHUN2uAMvz8/J/jRCpLwtXoGe9SnFhTijT2/0yMpJ+1VM+AUaKHnvVJQQgCNb0mQHKaaXs0tiaW7i0O37+H1RtBZDP2b/7CxiL0cGWff7+PfSG7/q9T3PYM8LqTNzplJCQ4d4TGV8H8rrp90XtnIrh+Oz1T5qa7TxoJJbM5qzPI3CaMhI4oZGYV3nT/gmLSfx+TSbJsdBHyjzFUaKTHJ3QJSEdzf6UCzZxkYPuCQdRPxYnWjUiAyi/GcJ1eoCMw7wmX/I+BblZpspAMiHb06EiD6J3JJnmp126CKu0sD09pp82k4slbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by SJ0PR11MB6576.namprd11.prod.outlook.com (2603:10b6:a03:478::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Fri, 18 Nov
 2022 07:40:06 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::9929:858c:3d20:9489]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::9929:858c:3d20:9489%4]) with mapi id 15.20.5813.019; Fri, 18 Nov 2022
 07:40:06 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Subject: RE: [patch 00/39] genirq, PCI/MSI: Support for per device MSI and
 PCI/IMS - Part 1 cleanups
Thread-Topic: [patch 00/39] genirq, PCI/MSI: Support for per device MSI and
 PCI/IMS - Part 1 cleanups
Thread-Index: AQHY9dUd//4IwYgyckilRdIEBndJ/65EVfgw
Date: Fri, 18 Nov 2022 07:40:06 +0000
Message-ID: <BN9PR11MB5276D4ED4AF3CAD095250ADF8C099@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20221111120501.026511281@linutronix.de>
In-Reply-To: <20221111120501.026511281@linutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|SJ0PR11MB6576:EE_
x-ms-office365-filtering-correlation-id: 79b88d64-5dd0-4a8a-deac-08dac9381c9c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UfPvzFB2icmgKNKhWFocWna6paAUrg6Al7S0rHNAhqwueC1bhH2lidHExNDjVLTWSnBaxN50bR9sdWJt7Z5ZXGfX5UW7S00dyxsJgMfjyD1tWSbMZxkDEOHZm/j9VfvtQeDUks9pNL0TZ8I2r4b9UH0mJSSDA6MerMkSZpQNQxGOPvwbu+dUvuPFVva270cwxch0K/j6LvJ4WVIGMZKIueWDo7CFaHjNYRagk3Wh0KafB5KSKjSnoyrIUJ7jLNlGoNJCFFxxLtyCS7mKXe/qnJOmCjx/DB7iQTGJZgS3uI7Q6kAea5PTFRl3EIXMP7vcmFdphiu0ndsi/L/ZJqZWu3CoW6WF1DMAuYmhOqV4LovqTRQFJwdCR7QMX/NcRYJLwsxX0PdUE1QV7W/LX7eByKAhxOO9QWYXrfkK+Wnv9Y0yOdOpXYnBnIqE49L5274xR/R0jNacFxu3bjf8tpCTFKNB0YF487FsmoPFcWV3uBQNOXnnVcO5KFpoQgGWl9QL+0Ez+B6ceYcqXQNxNEpbQm+sXg5tuob8wM/CpulW4UOWUQCXVYmZwgCWUOa9L0dKEDLqaoQ7DFGm5gPOYh5Qmks2W8OtcihA73PEA/vk3cQXTzcF0bvt0/q91nf0vgfE1E8LwAWfLWOoGR+piSghmdifU31N3jjvb4Xpv/+ZgeiSstGYIECE7rf9lkP5vJLeZCgLYwdy3IA3rhKks6qpSw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(376002)(136003)(39860400002)(366004)(346002)(451199015)(8676002)(478600001)(4326008)(64756008)(186003)(76116006)(66446008)(66556008)(66476007)(66946007)(52536014)(122000001)(5660300002)(82960400001)(86362001)(38100700002)(7416002)(54906003)(316002)(41300700001)(4744005)(8936002)(33656002)(110136005)(9686003)(6506007)(7696005)(2906002)(107886003)(71200400001)(55016003)(26005)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TsxfQWJlr0jejqBxzNJGYDEXcWxeKNKr/WwSxPUAJab5ebPttvEuJZmNwspo?=
 =?us-ascii?Q?Tj2ftCJhbVArE52CESoJ+YfNLw+APpRA2Ls3lRRKj0l6kePPr+e4MDRtCxPK?=
 =?us-ascii?Q?N8IvKhZVhHJ631OmLfpl1sGsZwRUodyUgeHofY4DMSFZrK8V7Q8UBi6GwEMJ?=
 =?us-ascii?Q?RbT1gjG6DcCQ9PULyzArFoeuzDdbgIhVYNA/iEbkWjFR6DkJuutumWGWVr8q?=
 =?us-ascii?Q?hiqZUttNkByKbQKjHLa9z6jps0igWXQ0SzEWx8DaIqT68K598R8VrJvmKWQx?=
 =?us-ascii?Q?8h2le5xMN01m1CVLOTliiKbSCe/cd0dQG0wxIqrUilouRSFnckCUXpPYNlF4?=
 =?us-ascii?Q?/ejAKj/61qSkvogwT1lyjFH8JKNolejMxnEQLr9fVuB7aBYRY+ZsexMZaEkK?=
 =?us-ascii?Q?eEv+gvy8GOmK7ZUBkCNjebVCyvViERaN2ZEC4luAFQ5zkxfj6gublkcXMT6J?=
 =?us-ascii?Q?LMzR+KqhyVRN3oFj9WWQScIfv3UFZInMR2g93TSnyvO+O+Bdytp2YoKSmhCl?=
 =?us-ascii?Q?6+JhvKEBQW4PeiaBTkwtbib+EMTHEbHCtoTV345W6u2+P4CABrg3fPXXfu0q?=
 =?us-ascii?Q?SZFXsuQf9yVvap6VTMPNZcb221ajXMxAG6Wx4ErcFjqPJRHYObCowAZgp744?=
 =?us-ascii?Q?XL+H5recwkREk/O3KE8Vn0PR+EdHYPdYk1ZIDdLU5EsZq8oRmIAVvhE6wLLk?=
 =?us-ascii?Q?zkL4T/te1a3HA7YDV4/xjJ9r6V2EqfxNKN9wAoXFR2ryHsMBKuAyWuvCCilO?=
 =?us-ascii?Q?PyxUR/f8v5zAe92txbdGjwi5TjZIr2knr43NTPHyZmp6G07AbCy8uaDl3eQt?=
 =?us-ascii?Q?StHJ/dhtpifJowzRDA5NlhXLBihecrKvjXRYNiFcGJtcMdjqe/a40Xr8RrT5?=
 =?us-ascii?Q?jn9U7h/q45hqivctTDvhPqY4rbnhuyD1LxSKv12yKyN+k8WQOQX/QOyiZcOc?=
 =?us-ascii?Q?AW+wWmblODwIDf+ut+zCrO3jmIua8lZZSZApjzBcg/cezhgCcey3lpr/IZkU?=
 =?us-ascii?Q?a849w/LwYdRzDcAqHtums17nhdf+BCPtiloqFoz/PUV7YIFVxE5FieokW/Og?=
 =?us-ascii?Q?PSKI3syvQiEO2b7fuvg51kL2Tnuo9XWQqgFgMl67CM7a5jadccXCTNOVJQqv?=
 =?us-ascii?Q?qNdHYMG9+3ogedj7gwm1EKSRFk0TRdzF8sVP2tfcMo+CWV31pV4KQePsmlP9?=
 =?us-ascii?Q?FJTXRoUqfuIPLJJ6gTt5Wtnjc+JrIJX1Ds/tegBbWv4tMqssYPKDqYNXSSFL?=
 =?us-ascii?Q?7dfxOTXlUvcAiHPV5Rb5vLYKIsY5AhQpYWHP9WR1kdSbXE5+M0yVwQsTT40Y?=
 =?us-ascii?Q?Cp7WWX/R0C9ZV0pwQwwr/zZR5ZFnaWhC11mCRRUj3xQeDCTLifYVQ/gl1IqU?=
 =?us-ascii?Q?xTx66+4WKf5AR5B0je9eq4MZ7wh/CSS3SE9OIMI3smAdla7qZQsOB0QajHWB?=
 =?us-ascii?Q?+iKq2BQyglHVGMGGhNDQtNQzTwemYFC0FZM6WUcpVamzNQYS2OxaA9HWuF7P?=
 =?us-ascii?Q?w3Z5z5YR2EVUnSupfGopdg4305HvfA+yMOKuEBrlJcKre5m7L5DBZUjbQbGC?=
 =?us-ascii?Q?N3CIDV2zYOexGyeKhAbpHCxLSiksJH6n3oYqI/fa?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79b88d64-5dd0-4a8a-deac-08dac9381c9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2022 07:40:06.1584
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: owmF78Fjttp5uEruLG7oUTZ7zb4EhhoUwnG+80PwdCc+0OVMtqGSwaMLgqOXT0cViy+nbb1vsn6SV4sQpcikSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6576
X-OriginatorOrg: intel.com
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
Cc: Logan Gunthorpe <logang@deltatee.com>, Allen Hubbe <allenbh@gmail.com>, Lorenzo
 Pieralisi <lorenzo.pieralisi@arm.com>, "Jiang, Dave" <dave.jiang@intel.com>, "Raj, Ashok" <ashok.raj@intel.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Joerg Roedel <joro@8bytes.org>, "x86@kernel.org" <x86@kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "Chatre, Reinette" <reinette.chatre@intel.com>, Alex Williamson <alex.williamson@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, Marc Zyngier <maz@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, "Williams, Dan J" <dan.j.williams@intel.com>, Jon Mason <jdmason@kudzu.us>, Will
 Deacon <will@kernel.org>, "Ahmed S. Darwish" <darwi@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> From: Thomas Gleixner <tglx@linutronix.de>
> Sent: Friday, November 11, 2022 9:54 PM
>=20
> Enough of history and theory. Here comes part 1:
>=20
> This is just a cleanup and a reorganisation of the PCI/MSI code which
> became quite an unreadable mess over time. There is no intentional
> functional change in this series.
>=20
> It's just a separate step to make the subsequent changes in the
> infrastructure easier both to implement and to review.
>=20
> Thanks,
>=20
> 	tglx

The entire series looks good to me except a couple nits replied in
individual patches:

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
