Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5607E287E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Nov 2023 16:17:22 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qMMyAp8P;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SPFMN4nhhz3cPK
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Nov 2023 02:17:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qMMyAp8P;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=brauner@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SPFLV4nvqz2xdh
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Nov 2023 02:16:33 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 750E260DDA;
	Mon,  6 Nov 2023 15:16:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC322C433C8;
	Mon,  6 Nov 2023 15:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699283789;
	bh=zDZFduCEDJmeuVjp8rHp1YK3z18DtyX3wrd2wnaF+Bs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qMMyAp8P8d1YZR+ToLbBSMxg7E0h+nAM09J8k36AJrgWT3pLgMKJv3rUJwYZoBC+5
	 /7HcfewbvKZBV+XxkAhBXKfAMpJI5v88gc4Hx8N8Z+ws3elm72tPTVmOM+mru/Ax7o
	 hgKcBnrkjrOwDRP6ZT7ROB1Yw66jbjLQJ8E14gCmpX61VhuiBziDh0K7mRiqlcqPKr
	 f2Apj/1uFkrm0Y9QqXxL4Y0uZAXlZ2WeCIdMR3xorlstgRMc5NC4/sI8S+JkZDghFD
	 iwus793QJkToU2FLLBik2jgcjMG6YyKIg5FBdgreEw23GWddN78m4uMrF2NWf2K1cn
	 BhSHwanj5lm1w==
Date: Mon, 6 Nov 2023 16:16:16 +0100
From: Christian Brauner <brauner@kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 14/34] fs: Rename anon_inode_getfile_secure() and
 anon_inode_getfd_secure()
Message-ID: <20231106-kondor-anfahren-23157efabaef@brauner>
References: <20231105163040.14904-1-pbonzini@redhat.com>
 <20231105163040.14904-15-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231105163040.14904-15-pbonzini@redhat.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Quentin Perret <qperret@google.com>, Sean Christopherson <seanjc@google.com>, 
 linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, David Matlack <dmatlack@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Liam Merwick <liam.merwick@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Nov 05, 2023 at 05:30:17PM +0100, Paolo Bonzini wrote:
> The call to the inode_init_security_anon() LSM hook is not the sole
> reason to use anon_inode_getfile_secure() or anon_inode_getfd_secure().
> For example, the functions also allow one to create a file with non-zero
> size, without needing a full-blown filesystem.  In this case, you don't
> need a "secure" version, just unique inodes; the current name of the
> functions is confusing and does not explain well the difference with
> the more "standard" anon_inode_getfile() and anon_inode_getfd().
> 
> Of course, there is another side of the coin; neither io_uring nor
> userfaultfd strictly speaking need distinct inodes, and it is not
> that clear anymore that anon_inode_create_get{file,fd}() allow the LSM
> to intercept and block the inode's creation.  If one was so inclined,
> anon_inode_getfile_secure() and anon_inode_getfd_secure() could be kept,
> using the shared inode or a new one depending on CONFIG_SECURITY.
> However, this is probably overkill, and potentially a cause of bugs in
> different configurations.  Therefore, just add a comment to io_uring
> and userfaultfd explaining the choice of the function.
> 
> While at it, remove the export for what is now anon_inode_create_getfd().
> There is no in-tree module that uses it, and the old name is gone anyway.

That's great, thanks.

> If anybody actually needs the symbol, they can ask or they can just use
> anon_inode_create_getfile(), which will be exported very soon for use
> in KVM.
> 
> Suggested-by: Christian Brauner <brauner@kernel.org>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---

Looks good to me,
Reviewed-by: Christian Brauner <brauner@kernel.org>
