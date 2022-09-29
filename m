Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B265EEB11
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Sep 2022 03:45:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MdGQR166Xz3c9g
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Sep 2022 11:45:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=mpaiQTLG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.107.243.78; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=mpaiQTLG;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2078.outbound.protection.outlook.com [40.107.243.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MdGPh2vK0z2xyB
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Sep 2022 11:44:36 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fy4aIQ+/kky2hE38yK9htOiOoNiE1Eh18FKVFUR+/mvnqGsUzDSOfbgfgbkdAUE4d2rFtkkyzXzstjNJlJIvssDZfO81/fI2fRn6JN2/OI711AzKnYObdb8aLXlwU5sD6Ss/bkZD4JXKVEtNiz0W9m6PDR9HNNuIeGiX6EYyAucsQdPbgsVaA79kbiCwkM1zOvDoeuYh9B56ULtAJfqlhLplHwg3zVWIgVIuS3FDMYDI66aKQ1Byui2Bt3OXa5rYp2Qx6E58vhDYvpAm9Cxux90mVrj9sQAM41C4+ZBakEziYZoSRq1f8YHe8/Ln1ghQCqLlVsraqgwKhIZW9DSDwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cRABUuKJfTb4OsZ43gTkQxTZu0uLEXlqApaqc9bI+bY=;
 b=eujQGorQy+lbvaCtICm2SNWDt5xT3V2jw+5PvZpWvcp2CzhRnFZl0e7GeWeullx2MUgG8dx+h31TO0j3ckaRMBVjHMSUJBCNNFzshIDqD3G09ozPGUPc5Edh1aoKy+iaBhlioW9hSQQEAE5SoVkcrlBGcJor3cFB9Tdf1TfqIfTgdaVw/Rmaww9WCxOGITL7xEmtyfMC2I1DMRb4uGYjCwk8u/DHDja6FZNX+QrlSH6Vp1J9dilyc7DPAFZdJd8TWtjshiFxqdQ2OkSK3rMl+EAWY0z6X0STVqVppJTCEDdwEx8yaSt+PtGMxidkZFzm387XA/qLmI3sYcCxe5yBVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cRABUuKJfTb4OsZ43gTkQxTZu0uLEXlqApaqc9bI+bY=;
 b=mpaiQTLGnGzo1sQGooycdVnzLALZbgoEnqQNK6IMhP5q8DTG5166h7vV13NPvLRiLEKI7W3YZbC1Dauo/xsfHJEoeOOf6SCcMulnNcK1wCXsTAupYHAetQXDjeqRlRe9icvpcMk+tmSjOgwAg63XSMkaGKc0K5jX4A+kDrMtT5fcwSf+3629xeFraI+lz2LngTLQgT5+nGTUwAqcbWyPzWpmwCfFaQvimKAnnzgfD328vRB3tNT3K3ZimuSpYRcb5Q9ASi91QmkMJi1+87fQcRghyQhrLZehPEJF8Rz/gnst/q6rou5qYsrDF140w5Pk5HjspokBCyr48jnDMO+DqA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by CH0PR12MB5106.namprd12.prod.outlook.com (2603:10b6:610:bd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.20; Thu, 29 Sep
 2022 01:44:16 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::4064:6c13:72e5:a936]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::4064:6c13:72e5:a936%5]) with mapi id 15.20.5654.026; Thu, 29 Sep 2022
 01:44:16 +0000
References: <cover.f15b25597fc3afd45b144df863eeca3b2c13f9f4.1664171943.git-series.apopple@nvidia.com>
 <af2ea89799b08e0a5e592df0da0dcb9a5bf8533b.1664171943.git-series.apopple@nvidia.com>
 <87fsgbf3gh.fsf@mpe.ellerman.id.au>
User-agent: mu4e 1.6.9; emacs 27.1
From: Alistair Popple <apopple@nvidia.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 1/7] mm/memory.c: Fix race when faulting a device
 private page
Date: Thu, 29 Sep 2022 11:40:32 +1000
In-reply-to: <87fsgbf3gh.fsf@mpe.ellerman.id.au>
Message-ID: <875yh7osye.fsf@nvdebian.thelocal>
Content-Type: text/plain
X-ClientProxiedBy: SY6PR01CA0078.ausprd01.prod.outlook.com
 (2603:10c6:10:110::11) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|CH0PR12MB5106:EE_
X-MS-Office365-Filtering-Correlation-Id: e82023d0-6226-43b8-c76d-08daa1bc1e11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	KuT60+mFX7oI0ZtDiI6EW5jflvs2Riiu1gvRxn4beQ+l5QugKfEhYSsxfKwSItmDdoz93LeS+ph3KtqsqTHJZbDvmibB+JEw4QDyVd/uSZo7s3uyQDCWnDFhJsBbzPSxYEOj7iRd0I0tvNT7SyqeY3dpDRO6hlwe09WGzG75jf225SQXh4RKeTpOjjQ8HIs/Ia8108cxldpNHNHo6SxWTwuiG/q+IoUeOLRe10RHp93H37xMDd3ST3yrrBYLqvKASGH8rzA8oMVeD2V18BnL++Jw/aDA3+73xVLOH1XFamyVQldsgbHrHQw7BzsdOKJRSGW6K0kM2nNCqazhbfnCLdCrSBxAMT7bKRf7NSz879rM3B2wD5m/otuktA+0hOIUNwxe3syhajBpe0Dx4EAVYQ3Ea/i1kItrRuvwPNJmNDbNnEo8riWs001WNNw6HExfkO8MzKjbS76XZQW2VJfX/3Doz7yh7DSFF4XPurPHPsQtw5WVSFCx3wlxs4RfU/ToD/AadS1K9W0sReFGpWjSnsnz5Yxd751fBeC056W5VtEZG2Oc3mHWeFfAqVtfEVajgRUWMoEl9EbhZ5+B7LPeNPXZDKEQoqn1evyfsLJ/Mscvl+y/79MhsBMDBByiN4EVAE3tHczUDeB66xAbl5b5z1tWzYVyOl+cw2DrCwqCDF+d6co3nVs7RAovKxDBr44BaGSxz0rh5Rrty/IhBcdphg==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(396003)(136003)(39860400002)(376002)(451199015)(9686003)(26005)(5660300002)(7416002)(41300700001)(6506007)(6666004)(8676002)(4326008)(38100700002)(6512007)(86362001)(83380400001)(186003)(2906002)(478600001)(54906003)(6486002)(6916009)(66476007)(8936002)(316002)(66946007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?ZLsjQMvroX3692nr4vs6euCOhsYvI0+5+C3uhflRIknhPheIMc4/dGYFMhmx?=
 =?us-ascii?Q?zPB4CMAP4fTQGkG93jcvLgSpBKDMed/Fd/R7z72BxCCXxyFHjy7HRkUn/m6i?=
 =?us-ascii?Q?2nnpioFqIa/mRSFe+fvyErEiOGkNSfQ99YTg5GrdsANSvQB2KttnbfyjcCP9?=
 =?us-ascii?Q?g6+njkk+g/vlSdXmRrHhJ3PJ3E/GuwCKostRJHG/PxvCSBmkzRMJbl/YV1DP?=
 =?us-ascii?Q?IPmVw48j+K2cSx5U2YVrosquvQTQ+O+cjSjndelSr11aG66tnELfryIqm6tc?=
 =?us-ascii?Q?kyY3+7QDdmCRRKoSiGheRwZqwezHfYfxxngwpm8mbtJBiXHJuzEYiLJcgNnx?=
 =?us-ascii?Q?Qsr3BnTZr++/iXJ5XY7NAoXnofMXuDiGnjSfLoIlIsXP4/3PBh40mfspSZDu?=
 =?us-ascii?Q?4Xf7AiEfKSa/regLuHeMTjHF5IZeyyJC9ogMUqUPvD/8cU/1ihfghF0q8Y8/?=
 =?us-ascii?Q?A9s8F/mjyKJV2c3HNWvPwDxh43VfPWnc6WXDeF4eAN19XTx33sWdfREf/P0H?=
 =?us-ascii?Q?RLyzWKBkACfHdCziqP1BT4dbyPt0sl5Rag6/PwsmOFJZcX4Oqp1Kc+v9EW6k?=
 =?us-ascii?Q?G81b8HQTiV/qGmqu88Yfa0IeXgnc344FJNqmbyy0zGEMpMcD0B8fBbEWXNwS?=
 =?us-ascii?Q?BSnptxkOsIxDRwc6H8dfIe/d+ggMnImDIK/cGmQnNrdnGC8F61J+5HAcGjXb?=
 =?us-ascii?Q?mRh19Am3jCURgBhKOdFau4ILtsdD2iU49kZEU+wb+gMot5OmX9q8OaXH7/I6?=
 =?us-ascii?Q?lcEt9Ig+SKn3+RV3tEasslo5nHaWizWQLLAOzyXRwkVoams3P956fIMm4+WS?=
 =?us-ascii?Q?DJwsxDg1ZV13HLgzXaN9y90hL3x2H4JT4oSujQqOYobtQWMnm85Tee+CEU6W?=
 =?us-ascii?Q?yheC6m0HyVIRVgLH8w/tVgf/KGoa5tIXWjeAKRxYrs+R0alHYj7DN+K8g4V0?=
 =?us-ascii?Q?VCJnxIIG30kz47bwzfMeT39XCf8FpHugyCryT0tr6EjQs6so1b95Jq48pDni?=
 =?us-ascii?Q?pgPA2tPQVq+GdHQPMxptJk3unYK0HNcaoR1uAAXTYcrGrYD/1TIfNABLRpgA?=
 =?us-ascii?Q?XAegzWld47hZXw6ZpVa0SU2KGnuiR8hh3sdsH45fXKwSJWpOhrmbZ37XyRoI?=
 =?us-ascii?Q?G+CwGJMCwT5uHJSF8Y6TScRHp9yMUHCH5pWYfnxnSPsXtZvzmJB0lahyV/UL?=
 =?us-ascii?Q?Ed1k4/SB3ASlofEM0Pf7V4p8nQj+YBuM2x04roS52JZ92E5OBAkDsC53jv6K?=
 =?us-ascii?Q?XoiIectsoEF1uoTB82smxuGyV2dcZAAdLG0bqT2kX8Efk8TMa9EFPG8lw+Q0?=
 =?us-ascii?Q?KszN2loighEnV78rUvvzEHgPSmV/lDzUhszYL5lU4krhiLZPNFUB0yqohBi5?=
 =?us-ascii?Q?LvDgw1MkdeVwmb48ULjOeaXbsuA/9IOT2f3TGwt0AQVzrnm45O6g0e1wMP7m?=
 =?us-ascii?Q?Upe/64rt+IDgoQmQO0AMvLDrNbp8OqSt8vuMlx5NIN0OtunpxCgvUwXRvLmk?=
 =?us-ascii?Q?pzF5J0/7BHECi9IlmoEqHU31aXeWDSYL/EZ4znihtkAqbA+TmzJErG4aPsFQ?=
 =?us-ascii?Q?0zWscIAhNSDUu1mFNRWueWO9cILrczkjJgOnp7SU?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e82023d0-6226-43b8-c76d-08daa1bc1e11
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 01:44:16.0657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: trBmO7349RJmQc3OQ8ygytOuPx62JiJUbdRBR/MSSEueeUm1EeDiVHeiStTuw5C/egOBT5NmiFrFi4wNSi7DZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5106
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
Cc: Alex Sierra <alex.sierra@amd.com>, Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-mm@kvack.org, amd-gfx@lists.freedesktop.org, "Matthew Wilcox
 \(Oracle\)" <willy@infradead.org>, Ben Skeggs <bskeggs@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, Ralph Campbell <rcampbell@nvidia.com>, Lyude Paul <lyude@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Nicholas Piggin <npiggin@gmail.com>, Dan Williams <dan.j.williams@intel.com>, Felix Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Michael Ellerman <mpe@ellerman.id.au> writes:

> Alistair Popple <apopple@nvidia.com> writes:
>> When the CPU tries to access a device private page the migrate_to_ram()
>> callback associated with the pgmap for the page is called. However no
>> reference is taken on the faulting page. Therefore a concurrent
>> migration of the device private page can free the page and possibly the
>> underlying pgmap. This results in a race which can crash the kernel due
>> to the migrate_to_ram() function pointer becoming invalid. It also means
>> drivers can't reliably read the zone_device_data field because the page
>> may have been freed with memunmap_pages().
>>
>> Close the race by getting a reference on the page while holding the ptl
>> to ensure it has not been freed. Unfortunately the elevated reference
>> count will cause the migration required to handle the fault to fail. To
>> avoid this failure pass the faulting page into the migrate_vma functions
>> so that if an elevated reference count is found it can be checked to see
>> if it's expected or not.
>>
>> Signed-off-by: Alistair Popple <apopple@nvidia.com>
>> ---
>>  arch/powerpc/kvm/book3s_hv_uvmem.c       | 15 ++++++-----
>>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 17 +++++++------
>>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.h |  2 +-
>>  drivers/gpu/drm/amd/amdkfd/kfd_svm.c     | 11 +++++---
>>  include/linux/migrate.h                  |  8 ++++++-
>>  lib/test_hmm.c                           |  7 ++---
>>  mm/memory.c                              | 16 +++++++++++-
>>  mm/migrate.c                             | 34 ++++++++++++++-----------
>>  mm/migrate_device.c                      | 18 +++++++++----
>>  9 files changed, 87 insertions(+), 41 deletions(-)
>>
>> diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
>> index 5980063..d4eacf4 100644
>> --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
>> +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
>> @@ -508,10 +508,10 @@ unsigned long kvmppc_h_svm_init_start(struct kvm *kvm)
>>  static int __kvmppc_svm_page_out(struct vm_area_struct *vma,
>>  		unsigned long start,
>>  		unsigned long end, unsigned long page_shift,
>> -		struct kvm *kvm, unsigned long gpa)
>> +		struct kvm *kvm, unsigned long gpa, struct page *fault_page)
>>  {
>>  	unsigned long src_pfn, dst_pfn = 0;
>> -	struct migrate_vma mig;
>> +	struct migrate_vma mig = { 0 };
>>  	struct page *dpage, *spage;
>>  	struct kvmppc_uvmem_page_pvt *pvt;
>>  	unsigned long pfn;
>> @@ -525,6 +525,7 @@ static int __kvmppc_svm_page_out(struct vm_area_struct *vma,
>>  	mig.dst = &dst_pfn;
>>  	mig.pgmap_owner = &kvmppc_uvmem_pgmap;
>>  	mig.flags = MIGRATE_VMA_SELECT_DEVICE_PRIVATE;
>> +	mig.fault_page = fault_page;
>>
>>  	/* The requested page is already paged-out, nothing to do */
>>  	if (!kvmppc_gfn_is_uvmem_pfn(gpa >> page_shift, kvm, NULL))
>> @@ -580,12 +581,14 @@ static int __kvmppc_svm_page_out(struct vm_area_struct *vma,
>>  static inline int kvmppc_svm_page_out(struct vm_area_struct *vma,
>>  				      unsigned long start, unsigned long end,
>>  				      unsigned long page_shift,
>> -				      struct kvm *kvm, unsigned long gpa)
>> +				      struct kvm *kvm, unsigned long gpa,
>> +				      struct page *fault_page)
>>  {
>>  	int ret;
>>
>>  	mutex_lock(&kvm->arch.uvmem_lock);
>> -	ret = __kvmppc_svm_page_out(vma, start, end, page_shift, kvm, gpa);
>> +	ret = __kvmppc_svm_page_out(vma, start, end, page_shift, kvm, gpa,
>> +				fault_page);
>>  	mutex_unlock(&kvm->arch.uvmem_lock);
>>
>>  	return ret;
>> @@ -736,7 +739,7 @@ static int kvmppc_svm_page_in(struct vm_area_struct *vma,
>>  		bool pagein)
>>  {
>>  	unsigned long src_pfn, dst_pfn = 0;
>> -	struct migrate_vma mig;
>> +	struct migrate_vma mig = { 0 };
>>  	struct page *spage;
>>  	unsigned long pfn;
>>  	struct page *dpage;
>> @@ -994,7 +997,7 @@ static vm_fault_t kvmppc_uvmem_migrate_to_ram(struct vm_fault *vmf)
>>
>>  	if (kvmppc_svm_page_out(vmf->vma, vmf->address,
>>  				vmf->address + PAGE_SIZE, PAGE_SHIFT,
>> -				pvt->kvm, pvt->gpa))
>> +				pvt->kvm, pvt->gpa, vmf->page))
>>  		return VM_FAULT_SIGBUS;
>>  	else
>>  		return 0;
>
> I don't have a UV test system, but as-is it doesn't even compile :)

Ugh, thanks. I did get as far as installing a PPC cross-compiler and
building a kernel. Apparently I did not get as far as enabling
CONFIG_PPC_UV :)

> kvmppc_svm_page_out() is called via some paths other than the
> migrate_to_ram callback.
>
> I think it's correct to just pass fault_page = NULL when it's not called
> from the migrate_to_ram callback?
>
> Incremental diff below.
>
> cheers
>
>
> diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
> index d4eacf410956..965c9e9e500b 100644
> --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
> +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
> @@ -637,7 +637,7 @@ void kvmppc_uvmem_drop_pages(const struct kvm_memory_slot *slot,
>  			pvt->remove_gfn = true;
>
>  			if (__kvmppc_svm_page_out(vma, addr, addr + PAGE_SIZE,
> -						  PAGE_SHIFT, kvm, pvt->gpa))
> +						  PAGE_SHIFT, kvm, pvt->gpa, NULL))
>  				pr_err("Can't page out gpa:0x%lx addr:0x%lx\n",
>  				       pvt->gpa, addr);
>  		} else {
> @@ -1068,7 +1068,7 @@ kvmppc_h_svm_page_out(struct kvm *kvm, unsigned long gpa,
>  	if (!vma || vma->vm_start > start || vma->vm_end < end)
>  		goto out;
>
> -	if (!kvmppc_svm_page_out(vma, start, end, page_shift, kvm, gpa))
> +	if (!kvmppc_svm_page_out(vma, start, end, page_shift, kvm, gpa, NULL))
>  		ret = H_SUCCESS;
>  out:
>  	mmap_read_unlock(kvm->mm);
