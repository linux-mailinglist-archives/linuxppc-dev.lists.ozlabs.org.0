Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3A156B391
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Jul 2022 09:33:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LfQ4y6M12z3c4m
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Jul 2022 17:33:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Gaq1E02w;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com; envelope-from=kevin.tian@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Gaq1E02w;
	dkim-atps=neutral
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LfQ444G1Mz305v
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Jul 2022 17:33:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657265589; x=1688801589;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=aoIrHt21bIfFQVSASgYg77uUkOIFdwXybLqVKiUy6Qc=;
  b=Gaq1E02whhE+WU0ARjkCdK0W3nAYBk5jhYieQTKSHoS83/09h0EHkAGK
   K5W22G+a3QZiphKsU+IaRoYUmMHZKC5vFLtWutcMa67/LqT1jQn2sSnAv
   IrYrxK3zekeO61gT2Yz5HpSOwdzWoq+9SXVGm6dYcREelZdC+I0pNAbHA
   Uzq1fOn5LOcsMt5hsIPuyK3cz15GN5k1Rbldny83pGwzUOcu9MkKsvrX4
   zwE0v8whQvqMJsOn+Xg/2dbKvSLlMhnJIlJo5NpK15KA0n4N0bqJz0und
   u6YkxH882noCvLdRMWZUz4gtzjdu8OqjVToJlbgcos16q8Uvctu31Rr94
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="345907131"
X-IronPort-AV: E=Sophos;i="5.92,254,1650956400"; 
   d="scan'208";a="345907131"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2022 00:32:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,254,1650956400"; 
   d="scan'208";a="591486282"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga007.jf.intel.com with ESMTP; 08 Jul 2022 00:32:57 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 8 Jul 2022 00:32:57 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 8 Jul 2022 00:32:57 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 8 Jul 2022 00:32:57 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 8 Jul 2022 00:32:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fNFOlNsO/SKoBfNnNSU+3Pw+sfCepwuvtXz5EtQSayalwb0nBhG2aA/r54654TsTiQ1li+Vn+tAJjURicoSlsWsBkvTRM64XJigwTNKbusT27KrfkTZdpTbcyhVd/jL4AwiM5O6usSXmZaWj0J7LxJcdlNywmrRoOk+dZR7UmMV+chjrx4/lZV8c0dGlnYKzsoa047MwcmdXn4TFaOlP5u+rKNnKPqN01mj5pIw9sHYtGobPYoyWklOHnoLjJCiwCsPdAXbNCmL6Qr48tM2hwgNJLvrG0KHBa93d9ppKuhTNrwYuq+ODT+ovmM62MmzMzmVOs6JXBW6XBadrLrWhrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aoIrHt21bIfFQVSASgYg77uUkOIFdwXybLqVKiUy6Qc=;
 b=hrf3VwUl1BezUrvvOggV0a+L0eh3uw9X6xzd3hsXiXa8quMeMMjXhwcCA6/GWI/Y6vpwtm+vlFci625l5e8plikKlfW8Zef/Wz6pVDVZZtP9P1n0bcm2E66yUa8IsPLFc1GU2oW3DaQN/wbidcOCBrG9+VnUU5sYlaWzzO2OHYcOXLX3+i2MBzdy7XopP/ENuSnGYL8J62e/uZCffDxQ9gtA4OjTf/whNXcX5hbVLporDM0jTMbSwRm/oAlHzA4/ijkceUK6g+Lg0IC3+zXai1McgVgMBUS19BziBS8Y12LqP8rSlOgJP5XPii7oSYSfK9cOPivTT7AgZvTzXl11bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DM4PR11MB5503.namprd11.prod.outlook.com (2603:10b6:5:39f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Fri, 8 Jul
 2022 07:32:55 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::8435:5a99:1e28:b38c]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::8435:5a99:1e28:b38c%2]) with mapi id 15.20.5395.021; Fri, 8 Jul 2022
 07:32:55 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Jason Gunthorpe <jgg@nvidia.com>
Subject: RE: [PATCH kernel] powerpc/iommu: Add iommu_ops to report
 capabilities and allow blocking domains
Thread-Topic: [PATCH kernel] powerpc/iommu: Add iommu_ops to report
 capabilities and allow blocking domains
Thread-Index: AQHYkgm2SLPFbZ1K7Emw8giwhTYMU61zAy8AgADn6ICAABqBgIAAC2DQ
Date: Fri, 8 Jul 2022 07:32:55 +0000
Message-ID: <BN9PR11MB527690152FE449D26576D2FE8C829@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220707135552.3688927-1-aik@ozlabs.ru>
 <20220707151002.GB1705032@nvidia.com>
 <bb8f4c93-6cbc-0106-d4c1-1f3c0751fbba@ozlabs.ru>
 <bbe29694-66a3-275b-5a79-71237ad7388f@ozlabs.ru>
In-Reply-To: <bbe29694-66a3-275b-5a79-71237ad7388f@ozlabs.ru>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.500.17
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2ddd887b-948a-4ab0-4583-08da60b41316
x-ms-traffictypediagnostic: DM4PR11MB5503:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hj+cirv+1Rj9PXKSnfMyvOnsa916f2uDlSgEXF7TAk8Svb4bcD68xX/9OIGlRAFKDoL5iJbjr7nErRoOyIshdek69ManQwAYmjvst8MRsrza2/7C+dHosegbNARgR0QpdKl4X2sdwXU/BioVl5C9ozHVBduIhpL5qTr16O0mSzu6LShmtmFVo9VObJ1BL2+9Utmc1HN4ywif1Mlq0jIpnMrU/clAxNUN2sBEu/0f235X4sIKqLjlRwGqcmvnEiE+0Z96lJiuZ5kqAaXwibotKzYqFk1++lh7DJJVHwPf6hAfs45yuDT3gxg401u5MOtd/tD5lKTZYQbxiGdfehemxMrzfOG/9l/U7p/u+1xs604DokDEwlTb+WoCRRVaBUtKzxgEq3kWWoAbdr7tMMPcfrry7CSca19MXpsQCHjFuEtx7j49Cpn8baXs2ELFIiaxFjkbwDN7YFgthuY4b4NRQxqavQ6IcfS1ISydcacubj/mlwrS3nvKttwzEI2cCVp3wYExeIJsTRYmpjpOgzb7tFe7X4vLjTla2EFK1XxoL4cNHBfG8RgYeG5FTPjfKbIGaT5xCZ2SJ6Cspqzi7Mvfz/XTurEd8xD6rdLM065G1Jwf/EY+Y0d1EvfNigN8FaeR+DzQT7/zmFTrYKfGPODlisz/xuHIvW6Si9Z2TOeqft332LXRxabtLwA+9LNGWCN2NzIlUcDST9Rovzn+xPSUcf+2hM4B9r6ou22wF8wJ4JfN/wIWvT9FWtuKPC1stwNHt0FTQapP6UkiL6UeUZj3Lf/uAJr2XMCNkZUlUPbVc8c7naXKVpSsnN9Fqfz1TvqT
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(396003)(136003)(376002)(366004)(39860400002)(86362001)(7696005)(478600001)(52536014)(26005)(2906002)(6506007)(9686003)(8936002)(41300700001)(5660300002)(33656002)(53546011)(7416002)(38070700005)(122000001)(55016003)(186003)(66476007)(83380400001)(8676002)(38100700002)(76116006)(66556008)(82960400001)(71200400001)(64756008)(54906003)(316002)(66946007)(66446008)(4326008)(110136005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SkVCbWYrajdEeVk2NnZpNjc3SmtTeWxVQmZFQ2NSb3ZZYllQUWhoWWZNSlMz?=
 =?utf-8?B?cmI2S2lhM2g2dVBCODBNVURsNk1QQnNHNkJUSDVENnVKbGNrV2dQWEJodlBB?=
 =?utf-8?B?R2NBdW9pRmdHMGU3Tks4Nk02U2dyUzVQcnlua2FpWGFyN1RlTEczOWl1TVZE?=
 =?utf-8?B?SU1EeDJUaXBwNVlHQk1Ed0xvdCszY2ZkQytNZ0gxbXdPUVJGZk1rNFRXSmc4?=
 =?utf-8?B?cUl0MXZ1Y1dNdTRTZFcxU0RHaDA5UURqTE5vdC9JRlZVZjRZTGNESys2WWMx?=
 =?utf-8?B?UmNSWDUvRFBFR0FwaVljVS9TMFBYVUNMUFlaaFAvK1R0Y2gwVE5xOE4xem9L?=
 =?utf-8?B?NjBWek11K1drZUx6ZlNwK25YU094WGtpNlJrUWNaQUU2Q0orWXgzbmNoNStp?=
 =?utf-8?B?Y3RlTWI4R0RqVG5rdWZlTzJ0NkhzY2VwVnJUdEFVRVF6ZGdDbHlqR1d6NzE3?=
 =?utf-8?B?NkhQR1BuNUF3aGZNY0g5Um5ISlJBZC9sTWhEWkY2bzdEeHo4NmNNa1RNS09h?=
 =?utf-8?B?S2QyNS9UZzRTTmV3Z01NVUVDbDZnWnl1UEtEc2FJaUVGcDhuQVcxb2FzYjFs?=
 =?utf-8?B?czAxbXgyWmNJNzRlLzVWa2pFNU1VczF3b29JbStJZmFzYTVMY3NqWjFEWWpI?=
 =?utf-8?B?TnBBRWZ0RThsWUxvTXpjTlo3cGU1MzZJQU1URy9oUCtCSFV3cjQxU1hRU0xo?=
 =?utf-8?B?UGRUNlo1cWdOcllkMHVWTk9taGRXSFJ1VndDSjlzREtvUVdaU05GM3V2ZEpa?=
 =?utf-8?B?OEZsT3ZKNHBDTjFSVFp6RjZwT1d1WEpoN2dRQVBBNFlMaWs5NzZHWENIMUNG?=
 =?utf-8?B?blJKZW5qZWtmSEpTd1dpTDVoSm9KczN0ekVEM1F0L2YzWUlLT0VrNFBkRExV?=
 =?utf-8?B?aDJsTlJMb0MwcytFRmU2TlNldi8xYlBjYmI0MG1ZTzQxV1dpVnRZWFBrWkhu?=
 =?utf-8?B?RU8zVHU5M1FqZzYyNG9mY09pRnQ1MTh1U05zbVNqTDAxTFlUcjZyWWRXWHMz?=
 =?utf-8?B?amp3MU90T2dHMW1nQVIvUEcvTjJGbkEwVkw2aEVvaUk1OFZ3V2UvczJaZUVG?=
 =?utf-8?B?bG5WeUdrWWNneWJ3d1JMSm80L3NPM1VKOXVtL3dTcXl2MkNJNUk2UENDMjJl?=
 =?utf-8?B?djlPVDdoT3NHQllrb0FaQVlxR0hCcHZQZmFqa2piYzk0UWRGSzVPcWVPamJX?=
 =?utf-8?B?M1U2Z0ZURnRCbzM5S0wycEY1RlVKSzZqL3FTRzQvYWU5ekdSMk5QTEVsK3dH?=
 =?utf-8?B?MVI1WkxyRVVpWVpxNGNuNU9WMlRJL1JaTHZCYVBBaElrSkNTWmxLdEdnbWZR?=
 =?utf-8?B?Mnp1b3V3QmdyNE9tNVBhMndRcHRDN1d2cjlSZnphWUtVM3Bvdkh5NkdEUFND?=
 =?utf-8?B?U3B4VFo0REdQcWloekRvanlia3NTd25NZ1pVMHRUdVIvZVd5OXFybHVrTE5m?=
 =?utf-8?B?NzJKYm5Ec0YvWlZxNDlMRGJ5S0hjUmZwMTNHTUhkN2hTUEN4M28rYkNXbDJ3?=
 =?utf-8?B?c0dYajh0OFhBV3NZSEV1NFgvTkJkcEVMUzhZUEFoTnRnL2Vub2Z4TXg5Zmtx?=
 =?utf-8?B?WlFma0RVSkxWNTRMWTkzZExvYkNNbmpnMC84YW15QTlvalhwSnpkcFJpeXls?=
 =?utf-8?B?cVpnY3RwdW1CQU15N0NEeDVCWVZNWXBkYVc3N3B2ZStVR2ZIWi9PNjBBWnp3?=
 =?utf-8?B?R0RWMkNCZ1JVTnJpWGdTV3VJanZEKytyaGtiOXpwMW1QN1I0L2ZOa2VOTUlj?=
 =?utf-8?B?OFNacVR0cmdBbTI3eGF2L3NSMUxoNFAvSFF4MDdZWjhUOTNqSVBKb0pXaFlZ?=
 =?utf-8?B?QmdmZ1pQYTZKSlZzU3J3bXUzdUJ1WjUrSm5JQXQwaDR6djNrMHhMaTBIL01F?=
 =?utf-8?B?Unp3cXFSVnNyRitQbklyUEhLaVpvL0RTbSt2Sy9kNmQ0bkNKVXpnek9OYnlB?=
 =?utf-8?B?cnBLeTFlMzQvYm02MVFleWgwTEVaanBSd1dzd0ZMUjVkOTRlSEdIcHo2ZGNS?=
 =?utf-8?B?azY4cEdhcXdiZnVIK2QzOWlMRHNQUXBuWWVnaVBya0ZjL3lEZk4vQjltN2Jo?=
 =?utf-8?B?SlZiZjN4anA0NE1NSkFaUVhJdW9KbmY1UnpvWHhMM1Q3WkUrMzFiVjZMbElz?=
 =?utf-8?Q?UVX0hIUNxo/nlWvbDJqALj5sl?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ddd887b-948a-4ab0-4583-08da60b41316
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2022 07:32:55.6796
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qz4RI+WCNxTmfC2Ek16khNI1nXJumbIommzHRG93E1gR8HfDsYnJ2u1qG4bZNCsxDQzbcIMWrQ1I5OBDwarOPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5503
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
Cc: "Rodel, Jorg" <jroedel@suse.de>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Fabiano Rosas <farosas@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Daniel Henrique Barboza <danielhb413@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, Murilo
 Opsfelder Araujo <muriloo@linux.ibm.com>, "kvm-ppc@vger.kernel.org" <kvm-ppc@vger.kernel.org>, Alex
 Williamson <alex.williamson@redhat.com>, Oliver O'Halloran <oohall@gmail.com>, Joel Stanley <joel@jms.id.au>, Robin
 Murphy <robin.murphy@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PiBGcm9tOiBBbGV4ZXkgS2FyZGFzaGV2c2tpeSA8YWlrQG96bGFicy5ydT4NCj4gU2VudDogRnJp
ZGF5LCBKdWx5IDgsIDIwMjIgMjozNSBQTQ0KPiBPbiA3LzgvMjIgMTU6MDAsIEFsZXhleSBLYXJk
YXNoZXZza2l5IHdyb3RlOg0KPiA+DQo+ID4NCj4gPiBPbiA3LzgvMjIgMDE6MTAsIEphc29uIEd1
bnRob3JwZSB3cm90ZToNCj4gPj4gT24gVGh1LCBKdWwgMDcsIDIwMjIgYXQgMTE6NTU6NTJQTSAr
MTAwMCwgQWxleGV5IEthcmRhc2hldnNraXkgd3JvdGU6DQo+ID4+PiBIaXN0b3JpY2FsbHkgUFBD
NjQgbWFuYWdlZCB0byBhdm9pZCB1c2luZyBpb21tdV9vcHMuIFRoZSBWRklPIGRyaXZlcg0KPiA+
Pj4gdXNlcyBhIFNQQVBSIFRDRSBzdWItZHJpdmVyIGFuZCBhbGwgaW9tbXVfb3BzIHVzZXMgd2Vy
ZSBrZXB0IGluDQo+ID4+PiB0aGUgVHlwZTEgVkZJTyBkcml2ZXIuIFJlY2VudCBkZXZlbG9wbWVu
dCB0aG91Z2ggaGFzIGFkZGVkIGENCj4gY29oZXJlbmN5DQo+ID4+PiBjYXBhYmlsaXR5IGNoZWNr
IHRvIHRoZSBnZW5lcmljIHBhcnQgb2YgVkZJTyBhbmQgZXNzZW50aWFsbHkgZGlzYWJsZWQNCj4g
Pj4+IFZGSU8gb24gUFBDNjQ7IHRoZSBzaW1pbGFyIHN0b3J5IGFib3V0DQo+IGlvbW11X2dyb3Vw
X2RtYV9vd25lcl9jbGFpbWVkKCkuDQo+ID4+Pg0KPiA+Pj4gVGhpcyBhZGRzIGFuIGlvbW11X29w
cyBzdHViIHdoaWNoIHJlcG9ydHMgc3VwcG9ydCBmb3IgY2FjaGUNCj4gPj4+IGNvaGVyZW5jeS4g
QmVjYXVzZSBidXNfc2V0X2lvbW11KCkgdHJpZ2dlcnMgSU9NTVUgcHJvYmluZyBvZiBQQ0kNCj4g
Pj4+IGRldmljZXMsDQo+ID4+PiB0aGlzIHByb3ZpZGVzIG1pbmltdW0gY29kZSBmb3IgdGhlIHBy
b2JpbmcgdG8gbm90IGNyYXNoLg0KDQpzdGFsZSBjb21tZW50IHNpbmNlIHRoaXMgcGF0Y2ggZG9l
c24ndCB1c2UgYnVzX3NldF9pb21tdSgpIG5vdy4NCg0KPiA+Pj4gKw0KPiA+Pj4gK3N0YXRpYyBp
bnQgc3BhcHJfdGNlX2lvbW11X2F0dGFjaF9kZXYoc3RydWN0IGlvbW11X2RvbWFpbiAqZG9tLA0K
PiA+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3Qg
ZGV2aWNlICpkZXYpDQo+ID4+PiArew0KPiA+Pj4gK8KgwqDCoCByZXR1cm4gMDsNCj4gPj4+ICt9
DQo+ID4+DQo+ID4+IEl0IGlzIGltcG9ydGFudCB3aGVuIHRoaXMgcmV0dXJucyB0aGF0IHRoZSBp
b21tdSB0cmFuc2xhdGlvbiBpcyBhbGwNCj4gPj4gZW1wdGllZC4gVGhlcmUgc2hvdWxkIGJlIG5v
IGxlZnQgb3ZlciB0cmFuc2xhdGlvbnMgZnJvbSB0aGUgRE1BIEFQSSBhdA0KPiA+PiB0aGlzIHBv
aW50LiBJIGhhdmUgbm8gaWRlYSBob3cgcG93ZXIgd29ya3MgaW4gdGhpcyByZWdhcmQsIGJ1dCBp
dA0KPiA+PiBzaG91bGQgYmUgZXhwbGFpbmVkIHdoeSB0aGlzIGlzIHNhZmUgaW4gYSBjb21tZW50
IGF0IGEgbWluaW11bS4NCj4gPj4NCj4gPiAgPiBJdCB3aWxsIHR1cm4gaW50byBhIHNlY3VyaXR5
IHByb2JsZW0gdG8gYWxsb3cga2VybmVsIG1hcHBpbmdzIHRvIGxlYWsNCj4gPiAgPiBwYXN0IHRo
aXMgcG9pbnQuDQo+ID4gID4NCj4gPg0KPiA+IEkndmUgYWRkZWQgZm9yIHYyIGNoZWNraW5nIGZv
ciBubyB2YWxpZCBtYXBwaW5ncyBmb3IgYSBkZXZpY2UgKG9yLCBtb3JlDQo+ID4gcHJlY2lzZWx5
LCBpbiB0aGUgYXNzb2NpYXRlZCBpb21tdV9ncm91cCksIHRoaXMgZG9tYWluIGRvZXMgbm90IG5l
ZWQNCj4gPiBjaGVja2luZywgcmlnaHQ/DQo+IA0KPiANCj4gVWZmLCBub3QgdGhhdCBzaW1wbGUu
IExvb2tzIGxpa2Ugb25jZSBhIGRldmljZSBpcyBpbiBhIGdyb3VwLCBpdHMNCj4gZG1hX29wcyBp
cyBzZXQgdG8gaW9tbXVfZG1hX29wcyBhbmQgSU9NTVUgY29kZSBvd25zIERNQS4gSSBndWVzcw0K
PiB0aGVuDQo+IHRoZXJlIGlzIGEgd2F5IHRvIHNldCB0aG9zZSB0byBOVUxMIG9yIGRvIHNvbWV0
aGluZyBzaW1pbGFyIHRvIGxldA0KPiBkbWFfbWFwX2RpcmVjdCgpIGZyb20ga2VybmVsL2RtYS9t
YXBwaW5nLmMgcmV0dXJuICJ0cnVlIiwgaXMgbm90IHRoZXJlPw0KDQpkZXYtPmRtYV9vcHMgaXMg
TlVMTCBhcyBsb25nIGFzIHlvdSBkb24ndCBoYW5kbGUgRE1BIGRvbWFpbiB0eXBlDQpoZXJlIGFu
ZCBkb24ndCBjYWxsIGlvbW11X3NldHVwX2RtYV9vcHMoKS4NCg0KR2l2ZW4gdGhpcyBvbmx5IHN1
cHBvcnRzIGJsb2NraW5nIGRvbWFpbiB0aGVuIGFib3ZlIHNob3VsZCBiZSBpcnJlbGV2YW50Lg0K
DQo+IA0KPiBGb3Igbm93IEknbGwgYWRkIGEgY29tbWVudCBpbiBzcGFwcl90Y2VfaW9tbXVfYXR0
YWNoX2RldigpIHRoYXQgaXQgaXMNCj4gZmluZSB0byBkbyBub3RoaW5nIGFzIHRjZV9pb21tdV90
YWtlX293bmVyc2hpcCgpIGFuZA0KPiB0Y2VfaW9tbXVfdGFrZV9vd25lcnNoaXBfZGR3KCkgdGFr
ZSBjYXJlIG9mIG5vdCBoYXZpbmcgYWN0aXZlIERNQQ0KPiBtYXBwaW5ncy4gVGhhbmtzLA0KPiAN
Cj4gDQo+ID4NCj4gPiBJbiBnZW5lcmFsLCBpcyAiZG9tYWluIiBzb21ldGhpbmcgZnJvbSBoYXJk
d2FyZSBvciBpdCBpcyBhIHNvZnR3YXJlDQo+ID4gY29uY2VwdD8gVGhhbmtzLA0KPiA+DQoNCidk
b21haW4nIGlzIGEgc29mdHdhcmUgY29uY2VwdCB0byByZXByZXNlbnQgdGhlIGhhcmR3YXJlIEkv
TyBwYWdlDQp0YWJsZS4gQSBibG9ja2luZyBkb21haW4gbWVhbnMgYWxsIERNQXMgZnJvbSBhIGRl
dmljZSBhdHRhY2hlZCB0bw0KdGhpcyBkb21haW4gYXJlIGJsb2NrZWQvcmVqZWN0ZWQgKGVxdWl2
YWxlbnQgdG8gYW4gZW1wdHkgSS9PIHBhZ2UNCnRhYmxlKSwgdXN1YWxseSBlbmZvcmNlZCBpbiB0
aGUgLmF0dGFjaF9kZXYoKSBjYWxsYmFjay4gDQoNClllcywgYSBjb21tZW50IGZvciB3aHkgaGF2
aW5nIGEgTlVMTCAuYXR0YWNoX2RldigpIGlzIE9LIGlzIHdlbGNvbWVkLg0KDQpUaGFua3MNCktl
dmluDQo=
