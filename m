Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC457DF79B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Nov 2023 17:25:30 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ciKD3Sqq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SLq3r28mDz2xdp
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Nov 2023 03:25:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ciKD3Sqq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=brauner@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SLq300mZHz3cR9
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Nov 2023 03:24:44 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2668ACE2132;
	Thu,  2 Nov 2023 16:24:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFBABC433C8;
	Thu,  2 Nov 2023 16:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698942279;
	bh=1oyVMjQI7OXHCUtZSgK71uJyeSsja11PK2zu0Sgh3ck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ciKD3SqqJbMFjIcI6bCCYkwFV34fiO2ArRgF5fXcYKuOaGXb4Wyi9zozkY1GPacll
	 Wb4+rsmrOAiUFpUvVmXoDHyclytLXtYqrhZkU0PpNpIyYDeZGFKHZDDWtqHWW99OuO
	 qo3jhEw/diJ1a/cjqpth3wyK9LJTK2A2KbT6VwEC/UhcdzfCTDR5j8l+p9MS2DAQxb
	 LzKQyThoycm/wTmhlnVYtsizofoKOqeGHL2Li2UrkzPUXr3zUUph4Dx0xK0JakNnV7
	 d57GUWFGv9wIfjooWNbwoPxilLaGhd+yLjY93dOc3Y/tHVaznNMcGB6moDDpowdxsF
	 zbisHCIeWrzQg==
Date: Thu, 2 Nov 2023 17:24:27 +0100
From: Christian Brauner <brauner@kernel.org>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH v13 15/35] fs: Export anon_inode_getfile_secure() for use
 by KVM
Message-ID: <20231102-freihalten-vorsah-fdd68051b005@brauner>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-16-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231027182217.3615211-16-seanjc@google.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Quentin Perret <qperret@google.com>, Liam Merwick <liam.merwick@oracle.com>, l
 inux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, David Matlack <dmatlack@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 27, 2023 at 11:21:57AM -0700, Sean Christopherson wrote:
> Export anon_inode_getfile_secure() so that it can be used by KVM to create
> and manage file-based guest memory without need a fullblow filesystem.
> The "standard" anon_inode_getfd() doesn't work for KVM's use case as KVM
> needs a unique inode for each file, e.g. to be able to independently
> manage the size and lifecycle of a given file.
> 
> Note, KVM doesn't need a "secure" version, just unique inodes, i.e. ignore
> the name.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---

Before we enshrine this misleading name let's rename this to:

create_anon_inode_getfile()

I don't claim it's a great name but it's better than *_secure() which is
very confusing. So just:

struct file *create_anon_inode_getfile(const char *name,
                                       const struct file_operations *fops,
                                       void *priv, int flags)

May also just remove that context_inode argument from the exported
function. The only other caller is io_uring. And neither it nor this
patchset need the context_inode thing afaict. Merge conflict risk is
extremely low so carrying that as part of this patchset is fine and
shouldn't cause huge issues for you.
