Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C607A55F0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Sep 2023 00:51:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=QrdMfrDT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RqKmW08FQz3cmG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Sep 2023 08:51:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=QrdMfrDT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f400:fe5a::614; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=michael.roth@amd.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20614.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5a::614])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RqCWl5NYgz2yq4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Sep 2023 04:10:24 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zv2h3OKQFvoe6TTN/8PO3vD/Owbu7UNfs+iIgPii41GL9jy/SR8ycX4K72sf0ZBzJaOENT+6OpDD2txPMYQCMUT5cnQ9Ax3l7TlvrIkT66uvbJ0gcTuzykV0s6xyr4Pe0FdEutsaIEOUZsfwzqIrmvPoGbpG7lGziHaf8Jx/BehL7kv+kFtEBNd92LyT4taT2oesQjDlv/p8vVU5jQ5rYnmCXtqOSkQDBrnLFYZrEPlw1mk9MzUuQmMNphGDiG7qPA4A6lN5dijJhSijWHvmFKuPxz5onwHq3fQvtGAqmpIuQt1AruFqsnDIkXMzxN3RMMzEdhtLPEEVUbCqV4bKPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ui00fgoUGuvv4efb1zdLO+78IhADs4VjQNoD9jVITVE=;
 b=WB1hkV3qU8mCLZv2srAiD9GNUmwPVjmAsqa4FPCFrWykgYzmVh/T/goLFUG2Ac+/2FRgtlOHTIdlcLycYMFk/uVLqjJy5FmbATrmUJaLAg6xLyk4I0MVOTzmrPvI/qUiFEQFehp2iJ0r1+kbQC6uSfFy7M50Yw6MX37ebfY284MC/uyfLGkZPPWQSyF0gZJcGb16LE5f+upoqOl0aFKVHC/ZaN8ToBV/mvAIgYJshjb4KdOQ7zzs49YoZ27Ke52/ki4RTpLA+DBXwhbmd2hwPuwYK/7J/1uzGGbU2Uwh5b7oRWrGJx+VfL2CTDmGWmFzgZR1VZgNW2+W1Qdja/Uqvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ui00fgoUGuvv4efb1zdLO+78IhADs4VjQNoD9jVITVE=;
 b=QrdMfrDTLfxAXeFz0An7O3CkZRQCeMQ2tsChY4Bmurmf9OViQP2lCVa5ldD3TWK+M9l28YMqqYCL+e/EeBRfo+VipZvv43W4T/T+sSh0yPJiwLYs8ARam4z0f0Nedwr5to+5PhRnd+GPpH52S6qecWB95aH7o45hnmza8NzAJ3U=
Received: from MN2PR15CA0012.namprd15.prod.outlook.com (2603:10b6:208:1b4::25)
 by BL3PR12MB6523.namprd12.prod.outlook.com (2603:10b6:208:3bf::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Mon, 18 Sep
 2023 18:09:59 +0000
Received: from MN1PEPF0000F0E5.namprd04.prod.outlook.com
 (2603:10b6:208:1b4:cafe::95) by MN2PR15CA0012.outlook.office365.com
 (2603:10b6:208:1b4::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26 via Frontend
 Transport; Mon, 18 Sep 2023 18:09:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0E5.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.20 via Frontend Transport; Mon, 18 Sep 2023 18:09:57 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 18 Sep
 2023 13:09:56 -0500
Date: Mon, 18 Sep 2023 13:07:54 -0500
From: Michael Roth <michael.roth@amd.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [RFC PATCH v12 10/33] KVM: Set the stage for handling only
 shared mappings in mmu_notifier events
Message-ID: <20230918180754.iomoaqnw75j3rrxb@amd.com>
References: <20230914015531.1419405-1-seanjc@google.com>
 <20230914015531.1419405-11-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230914015531.1419405-11-seanjc@google.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E5:EE_|BL3PR12MB6523:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fbb331e-c212-48f7-9870-08dbb87278e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	nubEhsrBRvQJ6oma/H/fezu40fl8JjosgGr2UV3f6xuzgQMloCWUp72moVwjS3pI5/Oj96YFIfM/WIGvT0yzDGpEpYVWuuXxNqepQhKPL6LTYGoZ06fmZQW3Ma7BiSzzibtevEJzgUzQexmNCGcPx+q8oITBnfWr2MVgIe6/s9tfwS/fp6Cqusz4StPVX/wq5qt9GPAk/QCfEaQibhFQ9GLX07vIQPE0U52iCZeSPdqMKzSN462deDp5f06n18eQTOQpOPMpVtCC4PI7518DU2mXUUwPT6kmBpLO6fm/gRYy9Mm07S9mGjb7vj82D2dROY+sIYL3Qe7pxzCEVRUEHdTI0zZ22eu1rPNE91uiF4EBfZVYbPlbfuiH2gnBDezUqFj2tvuRRKoorWpnE5HoI1e66yH5W/vm/v4ZDdXsEElxce6zNYCAXaBzp8Qs67VhfxNXA4weRBwnKse6Xgwe0UQrKNS0NRavXG4wmhbvQ/n+otdwmQAIEf4uXMLL3+/2LIFOZFIA4zsWxUxAleZBJ/a6zs9yxkm9OSgdZUpORNt4uXySWk5waQEf8YgGS6WKToleU0JNSpaKmnbolWHBGHwQfNhyEIK/iBhWZv0tFTkbmqWh0gQLCflo0mLoRVgL0Frg407g6sqSLdoLjZuwhHSkjKM9w44Xkv9RSqEU/0mASkrA1lH0e3wdFNWRQjtiSR21ng8CWyImExG7ezjf8vnSR74f4E/0Fjg02Q02YC5RulcqfRx9AaVQyVOjBU4tUHaaFX+KujOT9O2XOEVBWw==
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(136003)(346002)(376002)(451199024)(1800799009)(186009)(82310400011)(36840700001)(40470700004)(46966006)(4326008)(16526019)(26005)(40480700001)(426003)(336012)(2616005)(1076003)(40460700003)(8676002)(8936002)(83380400001)(356005)(82740400003)(2906002)(81166007)(36860700001)(36756003)(41300700001)(44832011)(86362001)(70586007)(70206006)(316002)(6916009)(54906003)(7416002)(7406005)(5660300002)(966005)(47076005)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2023 18:09:57.2580
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fbb331e-c212-48f7-9870-08dbb87278e2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	MN1PEPF0000F0E5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6523
X-Mailman-Approved-At: Tue, 19 Sep 2023 08:48:37 +1000
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku
 Yamahata <isaku.yamahata@gmail.com>, Paul Moore <paul@paul-moore.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, James Morris <jmorris@namei.org>, "Matthew Wilcox
 \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, "Serge E.
 Hallyn" <serge@hallyn.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Ackerley Tng <ackerleytng@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Isaku Yamahata <isaku.yamahata@intel.com>, Quentin Perret <qperret@google.com>, "Kalra, Ashish" <Ashish.Kalra@amd.com>, Liam Merwick <liam.merwick@oracle.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, linux-security-module@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 13, 2023 at 06:55:08PM -0700, Sean Christopherson wrote:
> Add flags to "struct kvm_gfn_range" to let notifier events target only
> shared and only private mappings, and write up the existing mmu_notifier
> events to be shared-only (private memory is never associated with a
> userspace virtual address, i.e. can't be reached via mmu_notifiers).
> 
> Add two flags so that KVM can handle the three possibilities (shared,
> private, and shared+private) without needing something like a tri-state
> enum.
> 
> Link: https://lore.kernel.org/all/ZJX0hk+KpQP0KUyB@google.com
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  include/linux/kvm_host.h | 2 ++
>  virt/kvm/kvm_main.c      | 7 +++++++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index d8c6ce6c8211..b5373cee2b08 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -263,6 +263,8 @@ struct kvm_gfn_range {
>  	gfn_t start;
>  	gfn_t end;
>  	union kvm_mmu_notifier_arg arg;
> +	bool only_private;
> +	bool only_shared;
>  	bool may_block;
>  };
>  bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range);
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 174de2789657..a41f8658dfe0 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -635,6 +635,13 @@ static __always_inline kvm_mn_ret_t __kvm_handle_hva_range(struct kvm *kvm,
>  			 * the second or later invocation of the handler).
>  			 */
>  			gfn_range.arg = range->arg;
> +
> +			/*
> +			 * HVA-based notifications aren't relevant to private
> +			 * mappings as they don't have a userspace mapping.
> +			 */
> +			gfn_range.only_private = false;
> +			gfn_range.only_shared = true;
>  			gfn_range.may_block = range->may_block;

Who is supposed to read only_private/only_shared? Is it supposed to be
plumbed onto arch code and handled specially there?

I ask because I see elsewhere you have:

    /*
     * If one or more memslots were found and thus zapped, notify arch code
     * that guest memory has been reclaimed.  This needs to be done *after*
     * dropping mmu_lock, as x86's reclaim path is slooooow.
     */
    if (__kvm_handle_hva_range(kvm, &hva_range).found_memslot)
            kvm_arch_guest_memory_reclaimed(kvm);

and if there are any MMU notifier events that touch HVAs, then
kvm_arch_guest_memory_reclaimed()->wbinvd_on_all_cpus() will get called,
which causes the performance issues for SEV and SNP that Ashish had brought
up. Technically that would only need to happen if there are GPAs in that
memslot that aren't currently backed by gmem pages (and then gmem could handle
its own wbinvd_on_all_cpus() (or maybe clflush per-page)). 

Actually, even if there are shared pages in the GPA range, the
kvm_arch_guest_memory_reclaimed()->wbinvd_on_all_cpus() can be skipped for
guests that only use gmem pages for private memory. Is that acceptable? Just
trying to figure out where this only_private/only_shared handling ties into
that (or if it's a separate thing entirely).

-Mike

>  
>  			/*
> -- 
> 2.42.0.283.g2d96d420d3-goog
> 
