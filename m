Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F3F584ABD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 06:25:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LvDw1687pz3bd6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 14:25:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OrnREv4s;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com; envelope-from=kevin.tian@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OrnREv4s;
	dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LvDvC15LVz2xH5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jul 2022 14:24:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659068695; x=1690604695;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=4tFpJ5Oic2+KzOutXjlZLkI/6RH3RB8VGMcUt4B9GUA=;
  b=OrnREv4sEx2YN9mrdiEdnhrxoxuJHrVwwIq/EBzmWYQ/y0sFenm73U30
   7pFGMclZ/r0vFBM/D6FiwGCpKLU679UCn0rPB7rqrGxYUoUwmIJmozp1V
   v+w9sO2hp6uloV41BeyblilcaDDJ6cS2dlhSr824ln8AJW+waB/SOs579
   L7UGCkLAqfP2ibWP/XnvcDGveO/bYP4VYYqsHTC9t7QfVRF0SfXhpkDmh
   oTD2XAELsIzYhXq2buMIded+jUSzvHSrisEcbwdQUNkW0n9BrLeFhsZDi
   /3S3a/hM5kdhZhW1dnAaIJvhDH4GP0KQ2u5tyNwGYYy8lEmaWCK+plIFT
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10422"; a="374989689"
X-IronPort-AV: E=Sophos;i="5.93,200,1654585200"; 
   d="scan'208";a="374989689"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2022 21:24:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,200,1654585200"; 
   d="scan'208";a="604845549"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga007.fm.intel.com with ESMTP; 28 Jul 2022 21:24:45 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 28 Jul 2022 21:24:44 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Thu, 28 Jul 2022 21:24:44 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.106)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Thu, 28 Jul 2022 21:24:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=erPGVzL9a/l929oyqOV1KqgKY5JB5c16QflNs99zIo6p7NizIAyMI0U/mZ2OBhULwTTyHpzFtX7zQDXC2yHbxxQDDQ5CTzZ/jh1rRVim8YpukVsguDg1E2YuoRzRiZsnHBTeLrA9pStdzq2fylvfl3eZb1WVoE6hz3MIHqNHUOxe1upybzlbxmQ7h5yPC5RnrU4Sn6iWugN+CHmsYDp/L2CkVtSr8xEyMZQMEO6V4Tmb8B5p+0zGow50ToBwJKlA/acNoKbpgfWXNhYASDGZwvUg8UC9OXIendXLWM0n0IWf9S+DEYnHMTZU+zDN5MHZRsquVYi//Sp3gQVBhxKrJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4tFpJ5Oic2+KzOutXjlZLkI/6RH3RB8VGMcUt4B9GUA=;
 b=kF9pZw/KYK+9R03b2v/7/NcH3CwK2xz4EeZMgj+VDmPsMkJIUTw+Suhb+7drBxxWQ3jt+h3DPw5gOo03IfgAh+eyVk41NdB6TYAbx5TmLS7TZtBA2uXpPorJnDK2TdWE+GN6rBFOoHkUZXF5VKByH1ZfJU+2ntp1xCKKUXnCmAxc7L/4l6oilQ/B0fyqip7Z39YrqcZ4HtRQtJt8ioJalYvApjI+WSaW2csNmrXzZGp/HETARdk/V4v/RmYDo3T+75bW36adyGaJbYOU4h7JYM/J0CTaCySdfXpkrxKMPz7E5hJo9GZfJCHa/hm6GY779a/8TrHiwKHG/TzCCrxYpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by BN6PR11MB4066.namprd11.prod.outlook.com (2603:10b6:405:82::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Fri, 29 Jul
 2022 04:24:36 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::8435:5a99:1e28:b38c]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::8435:5a99:1e28:b38c%2]) with mapi id 15.20.5482.011; Fri, 29 Jul 2022
 04:24:36 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Oliver O'Halloran <oohall@gmail.com>
Subject: RE: [PATCH kernel] powerpc/iommu: Add iommu_ops to report
 capabilities and allow blocking domains
Thread-Topic: [PATCH kernel] powerpc/iommu: Add iommu_ops to report
 capabilities and allow blocking domains
Thread-Index: AQHYkgm2SLPFbZ1K7Emw8giwhTYMU61zAy8AgADn6ICAABqBgIAAC2DQgCCu2wCAAAjKAIAAAsCQgAANOQCAAAjeMA==
Date: Fri, 29 Jul 2022 04:24:36 +0000
Message-ID: <BN9PR11MB52766CDF5C0A96DF0575AADE8C999@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220707135552.3688927-1-aik@ozlabs.ru>
 <20220707151002.GB1705032@nvidia.com>
 <bb8f4c93-6cbc-0106-d4c1-1f3c0751fbba@ozlabs.ru>
 <bbe29694-66a3-275b-5a79-71237ad7388f@ozlabs.ru>
 <BN9PR11MB527690152FE449D26576D2FE8C829@BN9PR11MB5276.namprd11.prod.outlook.com>
 <300aa0fe-31c5-4ed2-d0a2-597c2c305f91@ozlabs.ru>
 <CAOSf1CHxkSxGXopT=9i3N9xUmj0=13J1V_M=or23ZamucXyu7w@mail.gmail.com>
 <BN9PR11MB527626B389A0F7A4AB19B6728C999@BN9PR11MB5276.namprd11.prod.outlook.com>
 <78db23aa-ff77-478e-efaa-058fe08765d9@ozlabs.ru>
In-Reply-To: <78db23aa-ff77-478e-efaa-058fe08765d9@ozlabs.ru>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e5667707-522e-4608-f052-08da711a3f0a
x-ms-traffictypediagnostic: BN6PR11MB4066:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vaMOqpFrIdIds1m1bld8RKCdp50CR0xSc/XBvIEC4nH0IGcJLpRmxrXp5y2Xd4TYLc2bj1oPT0cIZSaTAahWgZijtvILB3YZnXFlUcQpSHTZrhKDNIqgJ+WzqCd48MBj+FAZgHTDQ1EtK6AikS04Um6SfQac51Mm0j2TjBil3B9DgZkTyGEPvNpaGnQlQvOVxU1XPKwlDm6iWCDkdN/EE23GwKfZIMjMu6vmkQvYHNidDISSNgqt77BVbqcOvqcUXKTg2v/gf5MQ6MWfr+ADRNjNTh1ldd4tlHO2Nk4E9s5v07lqkPmb1aPVJOTy5i1n0NfiZW4a0kRhdJBkl+sn0lHn8NC5qNaxvM9HfLbvsTMYhQ0gZKhnbQj4PDcGqzB+nB8iUiYDbGpEIN/FuZt8sva1FWlomtCS65mUaOeqpgQirJfmkYkcB2EKEk5rvUPKqVP8AS5W+cW9MhERmZ/X1Rg5ZQ9C6dHtakbALIyJcizykgHU1a7TRaAvzSQsiJtjEvhLTmnmOZfbT/n2S37FBXW2jHAahYZdgJXO9fjZPqPjmnbIHI3I6FyuzRlv/F+wN849Itbokv9u/IfCnpN6vNbaApfILY5iB/lc8pIhu3HUFukoDk3cl9z5k3uIfh8mZbqj2ZUQk0VMY4KZl/JJSkJWBzMSaLvQhZdTWFm/ZEVvtOxXlx5AkMGsS9r6TRQAJ/mtF3BBZnX1SgPMOTRQ+lvgYn4ExWEsFAPm9U110B8FEsjYARj4Nt0iBUQoguvV4JEHrVkHFlY9esSgLLXRrpGVPIXZKYqDZIWwjPsqHwk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(396003)(39860400002)(366004)(346002)(376002)(66476007)(64756008)(66446008)(71200400001)(55016003)(41300700001)(2906002)(316002)(54906003)(33656002)(86362001)(478600001)(66946007)(110136005)(76116006)(66556008)(6506007)(7696005)(53546011)(186003)(38070700005)(26005)(82960400001)(9686003)(8936002)(52536014)(4326008)(8676002)(5660300002)(7416002)(38100700002)(122000001)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?THRDS3ZJZktCTEpWZHNpU20zUzBod0QwQUNHSXhpdEcrMUFwamJReXJTd0hU?=
 =?utf-8?B?NGUzOTdCNE4zYXlXaitSL0Z0NHJ2bjV1K1hUU2VvdFJEZ1A3T0hqY0JPc2Zx?=
 =?utf-8?B?WFpRZGl5MG04QjVlZDk2UWVHUTBFZEprSks5d0RCOEF0VU53Zmk0MW1zaURZ?=
 =?utf-8?B?MG5aZnBTMTVkU0hlUnNNZGprZitCVmt4eWdpeFh1YVhJcjhvVGMyVjF0eXB6?=
 =?utf-8?B?S3IrT0pVSlJheGNybnhkTGVrNTZQTVJ0MlFJMll3bkJDR09tMzltdGVRUUVY?=
 =?utf-8?B?d0JxZCs5UzJZN1BzSFhVNFJJYmlBRVZSK29tOXBuZ2ljS2hKSDV4akVORWR1?=
 =?utf-8?B?cTRxaW1rR3FOVHdRRm51ZXYrclAwQkNvcFhSM2FEK2tWTEJaOElxQ29uNENJ?=
 =?utf-8?B?MDE2aDFFK0d6cmxxZFh1UkNHTFRjVDdQeFJVYnpibEZhdDNZSk9IOWcwR0sw?=
 =?utf-8?B?dGFXZDJhOFkyVGFtYkJKZkVhU2l1c1ZpTHhZSmZCSlhJUy9EdlZhaVBlT2Nj?=
 =?utf-8?B?OEttdDh0OUZwbUR4WDdVRWNuSWNaSU5SQzEyWm8rSjdxMWZ4ZGllK0NMY2t3?=
 =?utf-8?B?cmxPVDJhOHEyRGpHYWpWUGRRamZIYVpnZ0M4Q1RDcFh1eTVPU2cvcFkwRHZB?=
 =?utf-8?B?WG81OWwwRCs5M2RPZklJeC91ZzBrcVBORUNqbng3SVJ3LzdhRzVZVVhFUHJZ?=
 =?utf-8?B?RjJFbG5HaXdSSW1ETXJuZ0lReUF5TWNGeDZ6Nll1YjJPTi96YU9Rc0pBZ3I3?=
 =?utf-8?B?dGFWbld2a0pUMjlvbjltalordHRNd20zZXkyTWVtckl0Tlo0NmZDZ1Y4UnZu?=
 =?utf-8?B?T2swVzIzSjVHc2ZjUmM3S2ZJVE9LQ3hVSmR5RmZScTJCM2s2Q0RUV1RLVVJJ?=
 =?utf-8?B?dmtQekdWYVg5QW9yL2QvSldSazNwVjJXUEhRTVN6azFRNm9paTBQYlRUY1hE?=
 =?utf-8?B?dHlGb1lvYzdpRWpDRkV4K1NjT3dnWU9LUDlEY21BVmxFTEU2VXAwaWpqcW5P?=
 =?utf-8?B?OVpUZUtwMHpoWlZLR3pRSk01T2pGT044eDVYRzAyQTR0MkFSQTZvWk5LWUdz?=
 =?utf-8?B?S0l4RFJ0c0xvb2xiakl5NDhjRDVIMGc2dVNnNGpTeUpGckZCWkhHWC9Dc1FG?=
 =?utf-8?B?K0xxNUNPU3R4aTQxNzVmVW1qOWwvcHI1U3ZYQUFwMjFzVzV0NDhobzBOS2Ur?=
 =?utf-8?B?WjU4T2VORUpBZkIvSUxWdHlwRy9YMmhKVEwrRFVYbUowcVd4RlI3d0FiU3dp?=
 =?utf-8?B?UHoxa1NEVGJBZEpEMGEwWWlGWWppN3ZFaU1HdjM4OTJNWStCWHZXcWlXQjJO?=
 =?utf-8?B?VmhVWlVyU01pMUo4TXAvTzVoS3UyK2NWNEpjRGd0K0tycnczNlB3d2RVcDYv?=
 =?utf-8?B?WkN0Q0ZRMDZVaGkydk9lRkF6elBGcEM3aWVWdy9jL3JoTmVpdWF6cWFqUWFX?=
 =?utf-8?B?MjBxTTJ5VGlUdEpFYXRRbk0vSVZmT0Q0NWx0blNmRUNYQ2txSTk4WkVoVzg2?=
 =?utf-8?B?VERrTWkvazFGNTAzSVFkemdFRStDMVlhQjh4VDJ1Qm4vY2lDWGZkdDM0QzBF?=
 =?utf-8?B?dXFZOS85cDlrZ0pjMThCUFkrR2I0ZkZlc0hmVU14UVA3Ui9OZHJSQlc4Ymd6?=
 =?utf-8?B?R01MR1lTdSt0cVQzdnpRSFdlbVhwU05kRjdJRlY0QVpWTnhvL2RPZE0rQ2hS?=
 =?utf-8?B?VG15d08yRUJJMU1RaTVTUXo5bW5XUmJTVlRpSE43b2QzeGxKckE0aFd1cTdw?=
 =?utf-8?B?S1VvUnAxRlJuOThtTkFBVEZMUW10U1dJQWx0dmNaWWtWUHAwL1lEeklxWmgv?=
 =?utf-8?B?MEJaUUdNNjA3TW51QnkveFgzeFhRSUora0xKenNhT2VxNkxTT1JXSkE1M0FB?=
 =?utf-8?B?TjFNRGcyZWN1bGMvZ3lKWW9qcmIzeEphRU9udWd2NGRxUFFxbi9GaVl6Zk9l?=
 =?utf-8?B?ejQ1OGVReVl5VENLNVdEM2hmNzAvVy9aSmMwV1JLclNlUlVXWkloekRGek5P?=
 =?utf-8?B?MkEzWnhOeUhCQkgveTVxKy9Ud2Ivdi9ac3pBd2V3TG96MmJva1J3aklHQ1Ar?=
 =?utf-8?B?dm1rSmRFNXpQY2I0NDQ1Si9lMko3RmhFMlV2d1JHemxaaGF4eGlBMS9EMDlQ?=
 =?utf-8?Q?ZzyM2rYb/PXwdq6HhFes6RIs4?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5667707-522e-4608-f052-08da711a3f0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2022 04:24:36.6491
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l3z+eJl4qOwIx3m6ILXVBkZq0nl3/K3wgh+rp/o06csc0CG7y0MXA1TzCaIQ3xtB4g4Z/fEGhIvUE4hGJwZf8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4066
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
Cc: "Rodel, Jorg" <jroedel@suse.de>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Fabiano Rosas <farosas@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Daniel Henrique Barboza <danielhb413@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, Murilo Opsfelder Araujo <muriloo@linux.ibm.com>, "kvm-ppc@vger.kernel.org" <kvm-ppc@vger.kernel.org>, Alex Williamson <alex.williamson@redhat.com>, Joel Stanley <joel@jms.id.au>, Jason Gunthorpe <jgg@nvidia.com>, Robin Murphy <robin.murphy@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PiBGcm9tOiBBbGV4ZXkgS2FyZGFzaGV2c2tpeSA8YWlrQG96bGFicy5ydT4NCj4gU2VudDogRnJp
ZGF5LCBKdWx5IDI5LCAyMDIyIDExOjUwIEFNDQo+IA0KPiANCj4gT24gMjkvMDcvMjAyMiAxMzox
MCwgVGlhbiwgS2V2aW4gd3JvdGU6DQo+ID4+IEZyb206IE9saXZlciBPJ0hhbGxvcmFuIDxvb2hh
bGxAZ21haWwuY29tPg0KPiA+PiBTZW50OiBGcmlkYXksIEp1bHkgMjksIDIwMjIgMTA6NTMgQU0N
Cj4gPj4NCj4gPj4gT24gRnJpLCBKdWwgMjksIDIwMjIgYXQgMTI6MjEgUE0gQWxleGV5IEthcmRh
c2hldnNraXkgPGFpa0BvemxhYnMucnU+DQo+IHdyb3RlOg0KPiA+Pj4NCj4gPj4+ICpzbmlwKg0K
PiA+Pj4NCj4gPj4+IEFib3V0IHRoaXMuIElmIGEgcGxhdGZvcm0gaGFzIGEgY29uY2VwdCBvZiBl
eHBsaWNpdCBETUEgd2luZG93cyAoMiBvcg0KPiA+Pj4gbW9yZSksIGlzIGl0IG9uZSBkb21haW4g
d2l0aCAyIHdpbmRvd3Mgb3IgMiBkb21haW5zIHdpdGggb25lIHdpbmRvdw0KPiA+PiBlYWNoPw0K
PiA+Pj4NCj4gPj4+IElmIGl0IGlzIDIgd2luZG93cywgaW9tbXVfZG9tYWluX29wcyBtaXNzZXMg
d2luZG93cyBtYW5pcHVsYXRpb24NCj4gPj4+IGNhbGxiYWNrcyAoSSB2YWd1ZWx5IHJlbWVtYmVy
IGl0IGJlaW5nIHRoZXJlIGZvciBlbWJlZGRlZCBQUEM2NCBidXQNCj4gPj4+IGNhbm5vdCBmaW5k
IGl0IHF1aWNrbHkpLg0KPiA+Pj4NCj4gPj4+IElmIGl0IGlzIDEgd2luZG93IHBlciBhIGRvbWFp
biwgdGhlbiBjYW4gYSBkZXZpY2UgYmUgYXR0YWNoZWQgdG8gMg0KPiA+Pj4gZG9tYWlucyBhdCBs
ZWFzdCBpbiB0aGVvcnkgKEkgc3VzcGVjdCBub3QpPw0KPiA+Pj4NCj4gPj4+IE9uIHNlcnZlciBQ
T1dFUiBDUFVzLCBlYWNoIERNQSB3aW5kb3cgaXMgYmFja2VkIGJ5IGFuIGluZGVwZW5kZW50DQo+
ID4+IElPTU1VDQo+ID4+PiBwYWdlIHRhYmxlLiAocmVtaW5kZXIpIEEgd2luZG93IGlzIGEgYnVz
IGFkZHJlc3MgcmFuZ2Ugd2hlcmUgZGV2aWNlcw0KPiBhcmUNCj4gPj4+IGFsbG93ZWQgdG8gRE1B
IHRvL2Zyb20gOykNCj4gPj4NCj4gPj4gSSd2ZSBhbHdheXMgdGhvdWdodCBvZiB3aW5kb3dzIGFz
IGJlaW5nIGVudHJpZXMgdG8gYSB0b3AtbGV2ZWwgImlvbW11DQo+ID4+IHBhZ2UgdGFibGUiIGZv
ciB0aGUgZGV2aWNlIC8gZG9tYWluLiBUaGUgZmFjdCBlYWNoIHdpbmRvdyBpcyBiYWNrZWQgYnkN
Cj4gPj4gYSBzZXBhcmF0ZSBJT01NVSBwYWdlIHRhYmxlIHNob3VsZG4ndCByZWFsbHkgYmUgcmVs
ZXZhbnQgb3V0c2lkZSB0aGUNCj4gPj4gYXJjaC9wbGF0Zm9ybS4NCj4gPg0KPiA+IFllcy4gVGhp
cyBpcyB3aGF0IHdhcyBhZ3JlZWQgd2hlbiBkaXNjdXNzaW5nIGhvdyB0byBpbnRlZ3JhdGUgaW9t
bXVmZA0KPiA+IHdpdGggUE9XRVIgWzFdLg0KPiA+DQo+ID4gT25lIGRvbWFpbiByZXByZXNlbnRz
IG9uZSBhZGRyZXNzIHNwYWNlLg0KPiA+DQo+ID4gV2luZG93cyBhcmUganVzdCBjb25zdHJhaW50
cyBvbiB0aGUgYWRkcmVzcyBzcGFjZSBmb3Igd2hhdCByYW5nZXMgY2FuDQo+ID4gYmUgbWFwcGVk
Lg0KPiA+DQo+ID4gaGF2aW5nIHR3byBwYWdlIHRhYmxlcyB1bmRlcmx5aW5nIGlzIGp1c3Qga2lu
ZCBvZiBQT1dFUiBzcGVjaWZpYyBmb3JtYXQuDQo+IA0KPiANCj4gSXQgaXMgYSBQT1dFUiBzcGVj
aWZpYyB0aGluZyB3aXRoIG9uZSBub3Qtc28tb2J2aW91cyBjb25zZXF1ZW5jZSBvZiBlYWNoDQo+
IHdpbmRvdyBoYXZpbmcgYW4gaW5kZXBlbmRlbnQgcGFnZSBzaXplIChmaXhlZCBhdCB0aGUgbW9t
ZW50IG9yIGNyZWF0aW9uKQ0KPiBhbmQgKG1vc3QgbGlrZWx5KSBkaWZmZXJlbnQgcGFnZSBzaXpl
LCBsaWtlLCA0SyB2cy4gMk0uDQo+IA0KPiANCg0KcGFnZSBzaXplIGlzIGFueXdheSBkZWNpZGVk
IGJ5IHRoZSBpb21tdSBkcml2ZXIuIFNhbWUgZm9yIG90aGVyIHZlbmRvcnMuDQp0aGUgY2FsbGVy
IChlLmcuIHZmaW8pIGp1c3QgdHJpZXMgdG8gbWFwIGFzIG1hbnkgY29udGlndW91cyBwYWdlcyBh
cw0KcG9zc2libGUgYnV0IGluIHRoZSBlbmQgaXQncyBpb21tdSBkcml2ZXIgdG8gZGVjaWRlIHRo
ZSBhY3R1YWwgc2l6ZS4NCg==
