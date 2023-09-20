Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B0D7A8B8A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Sep 2023 20:20:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=sihvanFb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RrRdp001mz3cJl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Sep 2023 04:19:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=sihvanFb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e89::605; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on20605.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e89::605])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RrRcs731yz3c2k
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Sep 2023 04:19:07 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nlw2mcU3zX9QDYO49IGntlEHfQh+eRyePFjjXHOJJkbnLlaJmk0t1fgGUpdfI2UPYXhoFqNa7vibbMB2Ec5p3Zt2grgeLzz+oyroQC+erOTYjDca1KYgymS6yI4yYUGdIr3xTNJtGgErPIygndxRoMvXERhmaoJ9UxkDTupFHcbLz+AUfZVSYWupPSzXpC94+4T/X2XFW55zN5v04uq36MVgIuRQFDuZTsM2vcNvroN2KbW+OtsJ6BYAz/N3FM1YXCCs0fs+iZ9HtbtT1ZQwAngbpPX/IyeZvcacBq+UxoUQeu7Q/3EHcdghkd6COU/i3Xr/rw8rSy/p1kLX+ujEKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ONOlYSkAUskXnG8NC46lJLrDYInndfas+vsGNRsOjTI=;
 b=YxMijU/aqelR2DIzbnyjJdJp7J1MkyyMaLFd4YELs1xjo77+WdQJuPPqATtdwRPDOBOwSz0UWq/imFScQh1Mtn3F1vMDLdE+2bhw/wNN5BxOMu1yOkiokQ5L8S3myQsOH3pEByYmVbSf5NZqhLcDFmiE/2F+KO90fNy3a/5Da62R5ZPSPpiafaPy7uFEWYKZyBrxGCv7a6Znm3mEqs7Mm6BQf6bdAEjOfNFbcK/HZ+HSDV1Ea6O1DAx755yYKkLGatWL1I8IY/VzcQMXSG7QvhL5C7/kcIlmvlz8dOnxLMWFbc2HMS6T2lksmRJF4IU2oXQwK5zh+RuSU7pfx1hBpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ONOlYSkAUskXnG8NC46lJLrDYInndfas+vsGNRsOjTI=;
 b=sihvanFbZ+t21Tthz59Wrmtsbp7M4/0nUugl9n3HiEmsAYWcZZLIQGrkfqgjEzvKhi4qtKyXfAaC+9ulNUfH9jndhpA+njIvdN2ywsPsTGAa4cCS8tbCQnoNK0AQhgxrns9Icp3eurRPU/YRiSyXdksgG2EmBhlOiHkVkHx+Bxg3seCjeL9FDK5tXYc2eymPGCbnmRHsqDzn4Gt4AFSlFW47VRbNtTHSWS1J3Vu/2kaO6qA+fRR6d8KEEoo5Qz42C3IiUGVCz57AMHqopXG2w68NQRjOQJig2xSvvsZchoTHKdlR8QgbaDWLWhUwSPDyPTxCYzV8mIcxlu5FXiWykQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CY8PR12MB7414.namprd12.prod.outlook.com (2603:10b6:930:5e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.30; Wed, 20 Sep
 2023 18:18:43 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::faf:4cd0:ae27:1073]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::faf:4cd0:ae27:1073%6]) with mapi id 15.20.6792.026; Wed, 20 Sep 2023
 18:18:42 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	James Morse <james.morse@arm.com>,
	kvm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Marc Zyngier <maz@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Will Deacon <will@kernel.org>,
	x86@kernel.org,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH rc] kvm: Prevent compiling virt/kvm/vfio.c unless VFIO is selected
Date: Wed, 20 Sep 2023 15:18:40 -0300
Message-ID: <0-v1-08396538817d+13c5-vfio_kvm_kconfig_jgg@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YT4PR01CA0300.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10e::25) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CY8PR12MB7414:EE_
X-MS-Office365-Filtering-Correlation-Id: cb035663-8985-448a-aac4-08dbba060580
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	akF1jWMmrhSXHr/nsWp/EZ/tVQWxt9lE5f43rKIjziO2r6hG5/tZAWR8boelX5U+vVKfhUBeXdjmv3R7iXrcyco4sgzyEABMx6mbcczePsBxCVlkZIcHk2W5URUlEQGN36H0jjJr9CVRGHGvQoud29BWMl4lQCt2DlTLfik6mXB27jiV9ZXGaF+lQKUy+x9H6vhKyf6DMM1Dc+ZxHjrB2q3BBlyy9nhd9M3Gb6g4dx6X/i2vs2q0h6jsyGnMZCDk1lLWZq3q7f0Ua5hEbWrEc0y3uMZaz/8K1vKC2YvKM0VnaWo93emH+kDfeYFqeyOz5+SOk4Ufxgaz8+pN3kT8UC53baJIjsLTRS1Y5JHlLlEO1mJdaA4aV5QL3c8c7UkFJEvi+o1jY3jB5qUiQqfYa+YFC6IM00wXfDPp5zv8ZHFZYXhsdsPUdCcneaNPxIwMEG4XDz8HZTO9P6+43ciKuZOkyiw5MRGCxUpPnlcipdXAHa1Q3syNZnis2tSUxr5s1ruHdfHBFRVfJ4ZnbnaIwiuv1Q5qJ2f7IJkHaorwCzazkWyTrRGWgkVOlhb5dlOFHFBHVkdqi3pGIkdSXTcpyG4O30C3J6t3Vz25Iu9VO5NCSzYWsBJfVVwT92JeJ+fiSo9NmV1Tua+LaIIppeAB7fzKaZfMWmKwPju8E0hhmc4swNDIBiWeV1KIA/Kvkgeo1T9n+ljdJHhmfata16hc/g==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(39860400002)(376002)(366004)(396003)(1800799009)(186009)(451199024)(478600001)(6486002)(6506007)(966005)(6512007)(83380400001)(2616005)(2906002)(26005)(66476007)(7406005)(7416002)(66946007)(66556008)(316002)(41300700001)(8676002)(110136005)(5660300002)(8936002)(36756003)(86362001)(921005)(38100700002)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?omifWeHF9snkGB0ePFj2C3Emw2SGA5w+eKF72AXi27yKyjnxu3qQxbu9aw6G?=
 =?us-ascii?Q?/gfDTRcQ4+r27/DGqehcr0jFjigqzCtdHijHB8Z4HmINI0ndpS8A3pagINTG?=
 =?us-ascii?Q?Z0AyQx8oyM1DMBTcFJCGyRWEjq9YiRYWmYGktWbUt4DVSanoXpKHZeJU0RpA?=
 =?us-ascii?Q?vILQsqtG2xioZi4coPoFtDHhPhXdmDBtHdTVrPZE9c44Y0K4fdnb4rWveqEq?=
 =?us-ascii?Q?dZFo6iUJlEmTPjv6A7QwiD7FvDL+63D+ERuG8geMvJB0WvaVEyE6H4ULY3rN?=
 =?us-ascii?Q?CzZneVI5GdHrhzDkh2HBgqd2FO5AfEfNmXLV+9EROtkdxI8l2kw642SV0Szm?=
 =?us-ascii?Q?nXFBQQXAOWrPq0CQF7bH7HVNS2t5/z3Ejiq7vJgxwwbRiSi0pEPalpU3vLs+?=
 =?us-ascii?Q?jtZ8ky+4F30N3rIwVxucQO4WABCquNpAjEGuT+D4TDvQ0ChMuNbg/JWQInmS?=
 =?us-ascii?Q?UY0GUi9ffHILmQG/XHrZjEZiKxXELKnLM8mtg8bRjyvUqWdpmQJUbPpUHfhK?=
 =?us-ascii?Q?PTkzfT3V2i2A48j0mO+aMOwdmkt6LiWPrlCj3WT7DkzQTEPkYh3L/3B76EWo?=
 =?us-ascii?Q?R4mBBzAOZp/b0Irp9KMR7gKnyKs5eT64+AVJquGFsE2z1cmg1fKA0jk9cihL?=
 =?us-ascii?Q?EyPD/RRa8ZFmw+Dg8DcmWy8uqriei5HWynqRb5cQ6aVnNo7lCq6js2Pzefox?=
 =?us-ascii?Q?nQE4Rja5O3IifKBby6p6mo8Ca8MpJ3ZLYTVONgrNM8xZdwJ/qr/oRhznCQgb?=
 =?us-ascii?Q?OssKEqmvOO+v99jElAifturubFntRDoVA3HPZ0ZySJ8l1t8AAmwIL09VtUb2?=
 =?us-ascii?Q?1eKpRsNjgjJnFNVC7LYKJjCkCMlhZj/beRrnDfpQ19Qa/xKcbl163nY+cbuN?=
 =?us-ascii?Q?WgHLlcwBjsJm+FGp/OzRKeA/7kLBhz66HhmsRhweD7LOgzA5hmqA6kuNx9zj?=
 =?us-ascii?Q?KTlyoMvI+3ij7g5o1J1gBReiGEv1Aky9Zyxo8bqO3rFeto/5AK65Zgmv9rMT?=
 =?us-ascii?Q?nzepuIJjnEqUcYzWYexnO/bC0Nm6axSXQPI43I+beobJzgTtx1VqnX7iOnf7?=
 =?us-ascii?Q?NZiOYByDTytHmXj6CqHwfJwYXklBQec0rZWmKmiF1hxa1Fd4HDcRFdNMmnJt?=
 =?us-ascii?Q?7UAQuJ3ZppJTA/7qzs3kLFL/K/phzhpNuPwNx2lhDIPNEx0vZtw7yyHJGTdV?=
 =?us-ascii?Q?rhT6xCBQVWJTWSUDN5pbtg/ZxBEtr5zIXLnqMKd1CPs3/IlKTWXVZI730FuQ?=
 =?us-ascii?Q?DNmG3f6S8daH279SVcbKtrzEBNhaXbdq63lZ4JRVgzQK+HUxK6gJY/DCbvyS?=
 =?us-ascii?Q?l5IH7PPf+juC+8pSUaVt5SON3RIZtqra9AqRH1dw5h4s7aCoN28R7fQ8uSqs?=
 =?us-ascii?Q?b7hU0UigyNtggh53LvI76sha0dm3WzpDwbfDBXsyYexxaieZoZ9vC7SYFkfh?=
 =?us-ascii?Q?L4sR+cwkp0JIpESK4rqzFULLV3aTCNcfmuFUvBqp8IIvfRZecG74v0zIDqqF?=
 =?us-ascii?Q?ZdIS+OiJk7RqnebcdNCCp8BRJEVE7k0Tfb1gYSkIpZjW5j7rYVsdYUhdivct?=
 =?us-ascii?Q?5zZjZaqgqlHofHiqhwhXYMJLSa+8me7Yol70nRby?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb035663-8985-448a-aac4-08dbba060580
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 18:18:42.8925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: opa3BNPFW9b76Wi03pf5tKZfjHJZL6BqnrC6sg4ffm/GrFagxKLYWeMnD5u0i4Tl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7414
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There are a bunch of reported randconfig failures now because of this,
something like:

>> arch/powerpc/kvm/../../../virt/kvm/vfio.c:89:7: warning: attribute declaration must precede definition [-Wignored-attributes]
           fn = symbol_get(vfio_file_iommu_group);
                ^
   include/linux/module.h:805:60: note: expanded from macro 'symbol_get'
   #define symbol_get(x) ({ extern typeof(x) x __attribute__((weak,visibility("hidden"))); &(x); })

It happens because the arch forces KVM_VFIO without knowing if VFIO is
even enabled.

Split the kconfig so the arch selects the usual HAVE_KVM_ARCH_VFIO and
then KVM_VFIO is only enabled if the arch wants it and VFIO is turned on.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202308251949.5IiaV0sz-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202309030741.82aLACDG-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202309110914.QLH0LU6L-lkp@intel.com/
Cc: Nick Desaulniers <ndesaulniers@google.com>
Fixes: c1cce6d079b8 ("vfio: Compile vfio_group infrastructure optionally")
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 arch/arm64/kvm/Kconfig   | 2 +-
 arch/powerpc/kvm/Kconfig | 2 +-
 arch/s390/kvm/Kconfig    | 2 +-
 arch/x86/kvm/Kconfig     | 2 +-
 virt/kvm/Kconfig         | 7 ++++++-
 5 files changed, 10 insertions(+), 5 deletions(-)

Sean's large series will also address this:

https://lore.kernel.org/kvm/20230916003118.2540661-7-seanjc@google.com/

I don't know if it is sever enough to fix in the rc cycle, but here is the
patch.

diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
index 83c1e09be42e5b..7c43eaea51ce05 100644
--- a/arch/arm64/kvm/Kconfig
+++ b/arch/arm64/kvm/Kconfig
@@ -28,7 +28,7 @@ menuconfig KVM
 	select KVM_MMIO
 	select KVM_GENERIC_DIRTYLOG_READ_PROTECT
 	select KVM_XFER_TO_GUEST_WORK
-	select KVM_VFIO
+	select HAVE_KVM_ARCH_VFIO
 	select HAVE_KVM_EVENTFD
 	select HAVE_KVM_IRQFD
 	select HAVE_KVM_DIRTY_RING_ACQ_REL
diff --git a/arch/powerpc/kvm/Kconfig b/arch/powerpc/kvm/Kconfig
index 902611954200df..b64824e4cbc1eb 100644
--- a/arch/powerpc/kvm/Kconfig
+++ b/arch/powerpc/kvm/Kconfig
@@ -22,7 +22,7 @@ config KVM
 	select PREEMPT_NOTIFIERS
 	select HAVE_KVM_EVENTFD
 	select HAVE_KVM_VCPU_ASYNC_IOCTL
-	select KVM_VFIO
+	select HAVE_KVM_ARCH_VFIO
 	select IRQ_BYPASS_MANAGER
 	select HAVE_KVM_IRQ_BYPASS
 	select INTERVAL_TREE
diff --git a/arch/s390/kvm/Kconfig b/arch/s390/kvm/Kconfig
index 45fdf2a9b2e326..d206ad3a777d5d 100644
--- a/arch/s390/kvm/Kconfig
+++ b/arch/s390/kvm/Kconfig
@@ -31,7 +31,7 @@ config KVM
 	select HAVE_KVM_IRQ_ROUTING
 	select HAVE_KVM_INVALID_WAKEUPS
 	select HAVE_KVM_NO_POLL
-	select KVM_VFIO
+	select HAVE_KVM_ARCH_VFIO
 	select INTERVAL_TREE
 	select MMU_NOTIFIER
 	help
diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
index ed90f148140dfe..8e70e693f90e30 100644
--- a/arch/x86/kvm/Kconfig
+++ b/arch/x86/kvm/Kconfig
@@ -45,7 +45,7 @@ config KVM
 	select HAVE_KVM_NO_POLL
 	select KVM_XFER_TO_GUEST_WORK
 	select KVM_GENERIC_DIRTYLOG_READ_PROTECT
-	select KVM_VFIO
+	select HAVE_KVM_ARCH_VFIO
 	select INTERVAL_TREE
 	select HAVE_KVM_PM_NOTIFIER if PM
 	select KVM_GENERIC_HARDWARE_ENABLING
diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
index 484d0873061ca5..0bf34809e1bbfe 100644
--- a/virt/kvm/Kconfig
+++ b/virt/kvm/Kconfig
@@ -59,9 +59,14 @@ config HAVE_KVM_MSI
 config HAVE_KVM_CPU_RELAX_INTERCEPT
        bool
 
-config KVM_VFIO
+config HAVE_KVM_ARCH_VFIO
        bool
 
+config KVM_VFIO
+       def_bool y
+       depends on HAVE_KVM_ARCH_VFIO
+       depends on VFIO
+
 config HAVE_KVM_INVALID_WAKEUPS
        bool
 

base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
-- 
2.42.0

