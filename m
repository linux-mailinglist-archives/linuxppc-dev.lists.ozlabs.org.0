Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 309494DC3EA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Mar 2022 11:24:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KK3D10tr1z3bTk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Mar 2022 21:24:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j80jfjzD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=chao.gao@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=j80jfjzD; dkim-atps=neutral
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KK1k6414Wz2xVq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Mar 2022 20:17:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647508622; x=1679044622;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=AgYkRzO8ksOYyWWAS/gpvfK0lt7Rzm9dkVzVmq0l0/w=;
 b=j80jfjzDnKaeZRHzhqXDl3+uE222vlVBy8KLJDlbiGZUX04wqJIZk17E
 rT6Dvxl7x7tE6HjzqHPO5kA9xqSu9nX+i6gqhOhtIktuTu20NbKqs61cF
 5PuS2VIpn1Hy5xmPqVfaVFItnszhOPtEVAqNeBFEHO7ehyxfpIntiIwOE
 46tks25UR1MUSYUvFcBQX9Cs27msdRGUDHKwuQH1zjbU75I1lvI29dUHo
 l48WbIuHN8DsQeeYf6rc9G1HYvFWrU9ExOEh6me4KYUFJRzMs4ZiboZ14
 BCvu+/lXaC5cH5VKqY3AK2t2ULkcM9Hz/CNrJg1jSsQa6jkJ7M92DqRIQ w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="320033055"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="320033055"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 02:15:57 -0700
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="557852602"
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.23])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 02:15:44 -0700
Date: Thu, 17 Mar 2022 17:15:41 +0800
From: Chao Gao <chao.gao@intel.com>
To: seanjc@google.com, maz@kernel.org, kvm@vger.kernel.org,
 pbonzini@redhat.com, kevin.tian@intel.com, tglx@linutronix.de
Subject: Re: [PATCH v4 0/6] Improve KVM's interaction with CPU hotplug
Message-ID: <20220317091539.GA7257@gao-cwp>
References: <20220216031528.92558-1-chao.gao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220216031528.92558-1-chao.gao@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Thu, 17 Mar 2022 21:24:01 +1100
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
Cc: Thomas Richter <tmricht@linux.ibm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 David Hildenbrand <david@redhat.com>,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 linux-mips@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Wanpeng Li <wanpengli@tencent.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>,
 kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org,
 Jia He <justin.he@arm.com>, Janosch Frank <frankja@linux.ibm.com>,
 Anup Patel <anup@brainfault.org>, Joerg Roedel <joro@8bytes.org>,
 Huacai Chen <chenhuacai@kernel.org>, linux-riscv@lists.infradead.org,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Ingo Molnar <mingo@redhat.com>, "Darrick J. Wong" <djwong@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Qi Liu <liuqi115@huawei.com>, Andrew Jones <drjones@redhat.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Heiko Carstens <hca@linux.ibm.com>,
 John Garry <john.garry@huawei.com>, Nicholas Piggin <npiggin@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, Eric Auger <eric.auger@redhat.com>,
 Tom Zanussi <tom.zanussi@linux.intel.com>, Borislav Petkov <bp@alien8.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@atishpatra.org>,
 Sumanth Korikkar <sumanthk@linux.ibm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 linux-arm-kernel@lists.infradead.org, Jim Mattson <jmattson@google.com>,
 Juergen Gross <jgross@suse.com>, Shaokun Zhang <zhangshaokun@hisilicon.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Hector Martin <marcan@marcan.st>, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, Bharata B Rao <bharata@linux.ibm.com>,
 James Morse <james.morse@arm.com>, Sven Schnelle <svens@linux.ibm.com>,
 kvm-riscv@lists.infradead.org, Vitaly Kuznetsov <vkuznets@redhat.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ping. Anyone can help to review this series (particularly patch 3-5)?

FYI, Sean gave his Reviewed-by to patch 1,2,5 and 6.
