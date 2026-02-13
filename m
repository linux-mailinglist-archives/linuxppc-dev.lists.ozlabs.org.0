Return-Path: <linuxppc-dev+bounces-16859-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qC0gCiWWjmm8DAEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16859-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Feb 2026 04:10:29 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B85132919
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Feb 2026 04:10:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fBxxY2dkXz2yY0;
	Fri, 13 Feb 2026 14:10:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770952225;
	cv=none; b=jjq/tbA/176Bf3pis8DgMMsbcuRWe0n3N4M17JAapGpxAW8wpoWfyTHW2/LfrRJuf3vd/lC97kLBU9nM0WHBRnWa4gdhpstBmxop+jidsjz3ObIcdv6U5GDQ/YjmwKHDGNRgAb36Z8ZLEvW6QLeW42Jjiotfvj0tbYjiBT3yZgCsaeNHyxbN1XIcg6SU1SEz2OGpQGzs2AGf4cI4sm0csxRt0yg9tuCRmDRA/gvrsPJfO+MtIrriwiyNDaztGDHufnSqIshp48EV2ldJJOyDlp5qpw57NabMLGOdztAE8uFaak29EErc2XNImqQpPIdGeJ9/D57PbvpFteuHB02upw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770952225; c=relaxed/relaxed;
	bh=P78RENVYqtBrXiPd84cUvPiHnkgGJOrq+jEIxq84kb8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=OeHtrDqIAwQLx9ZruT2eJ7Hy1GhQGcAK5OnULaLC3YvAIhDxgxuEJeu+R8MPVQe59nuyuiQhlrYLTpYEAVn1M9tAb0Z+9nbij4QdceeXFjKKmEGlgUZxgIHENPU9Hx6Ip1NQ9zL2Lq7XvfK1Oxnt4DAiiy0lMG9uNU/uv9aIiuOCleXzWl12kFnWFxbGke78o7p9X6F11dcLtHe9vaLD4HZ4rZVQji4Ti8tz6hModbQPDc9eRjtPQpnSvkQpikvk2pP2oZ4ersOpl3iV8jnonW6fxBZ1Is9vb3wi0rBdxLeFRvMYKB2HKy8DsU+RXIsOjKGI/YHHcIZ4cwTfwcDOUA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UqncZvbj; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=pjw@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UqncZvbj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=pjw@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fBxxX2mN0z2xlx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Feb 2026 14:10:24 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 71CDE44481;
	Fri, 13 Feb 2026 03:10:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52C7CC2BC87;
	Fri, 13 Feb 2026 03:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770952221;
	bh=DlVfwlabE/UrECF6UV6WXsGt9/oBuJ/GsD7QC77Cks8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=UqncZvbj0SmNgh6HQ/8D5uoY1GFs2E42UQc+n7sxEIeVzpQSz2IMx9zVWyz7j4P7+
	 tfOiJuyBxCrBsc2bAheTKpm+HdgmlfqnLuZA8ABBgI8BB4Lb7+u/ibAQCcDmZLMtyq
	 Dq96qaThsOFsKMLtIO2NcWVBj+w9FzkKz/VUtZt1faNqiV0NkWWQW2B8WwY9y04Gcd
	 aYQgjkp6ysc/U+JYrKXXYSXRfOItiv0ulvtW6qVQy79wnnzFOinDd0RjM46o52YLFs
	 e8YKvqJaZE43RDWwzJya1N+H3cjiEt8a6WCf6LJlnzNFusrJSTRdUBupc/JwHn7iy/
	 2DRGVckeUTNTA==
Date: Thu, 12 Feb 2026 20:10:16 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
cc: corbet@lwn.net, skhan@linuxfoundation.org, catalin.marinas@arm.com, 
    will@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, 
    maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
    chleroy@kernel.org, pjw@kernel.org, palmer@dabbelt.com, 
    aou@eecs.berkeley.edu, alex@ghiti.fr, tglx@kernel.org, mingo@redhat.com, 
    bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
    akpm@linux-foundation.org, bhe@redhat.com, vgoyal@redhat.com, 
    dyoung@redhat.com, rdunlap@infradead.org, kees@kernel.org, 
    elver@google.com, paulmck@kernel.org, arnd@arndb.de, fvdl@google.com, 
    thuth@redhat.com, ardb@kernel.org, leitao@debian.org, rppt@kernel.org, 
    osandov@fb.com, cfsworks@gmail.com, sourabhjain@linux.ibm.com, 
    ryan.roberts@arm.com, tangyouling@kylinos.cn, eajames@linux.ibm.com, 
    hbathini@linux.ibm.com, ritesh.list@gmail.com, songshuaishuai@tinylab.org, 
    bjorn@rivosinc.com, samuel.holland@sifive.com, kevin.brodsky@arm.com, 
    junhui.liu@pigmoral.tech, vishal.moola@gmail.com, dwmw@amazon.co.uk, 
    pbonzini@redhat.com, kai.huang@intel.com, ubizjak@gmail.com, 
    coxu@redhat.com, fuqiang.wang@easystack.cn, liaoyuanhong@vivo.com, 
    brgerst@gmail.com, jbohac@suse.cz, x86@kernel.org, 
    linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
    linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
    kexec@lists.infradead.org
Subject: Re: [PATCH v5 4/4] riscv: kexec: Add support for crashkernel CMA
 reservation
In-Reply-To: <20260212101001.343158-5-ruanjinjie@huawei.com>
Message-ID: <97c57b38-2970-bdd7-2303-6de9a5c14d14@kernel.org>
References: <20260212101001.343158-1-ruanjinjie@huawei.com> <20260212101001.343158-5-ruanjinjie@huawei.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16859-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ruanjinjie@huawei.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:catalin.marinas@arm.com,m:will@kernel.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:akpm@linux-foundation.org,m:bhe@redhat.com,m:vgoyal@redhat.com,m:dyoung@redhat.com,m:rdunlap@infradead.org,m:kees@kernel.org,m:elver@google.com,m:paulmck@kernel.org,m:arnd@arndb.de,m:fvdl@google.com,m:thuth@redhat.com,m:ardb@kernel.org,m:leitao@debian.org,m:rppt@kernel.org,m:osandov@fb.com,m:cfsworks@gmail.com,m:sourabhjain@linux.ibm.com,m:ryan.roberts@arm.com,m:tangyouling@kylinos.cn,m:eajames@linux.ibm.com,m:hbathini@linux.ibm.com,m:ritesh.list@gmail.com,m:songshuaishuai@tinylab.org,m:bjorn@rivosinc.com,m:samuel.holland@sifive.com,m:kevin.brodsky
 @arm.com,m:junhui.liu@pigmoral.tech,m:vishal.moola@gmail.com,m:dwmw@amazon.co.uk,m:pbonzini@redhat.com,m:kai.huang@intel.com,m:ubizjak@gmail.com,m:coxu@redhat.com,m:fuqiang.wang@easystack.cn,m:liaoyuanhong@vivo.com,m:brgerst@gmail.com,m:jbohac@suse.cz,m:x86@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:kexec@lists.infradead.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[lwn.net,linuxfoundation.org,arm.com,kernel.org,xen0n.name,linux.ibm.com,ellerman.id.au,gmail.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,linux-foundation.org,infradead.org,google.com,arndb.de,debian.org,fb.com,kylinos.cn,tinylab.org,rivosinc.com,sifive.com,pigmoral.tech,amazon.co.uk,intel.com,easystack.cn,vivo.com,suse.cz,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[pjw@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_GT_50(0.00)[65];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pjw@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:email]
X-Rspamd-Queue-Id: 04B85132919
X-Rspamd-Action: no action

On Thu, 12 Feb 2026, Jinjie Ruan wrote:

> Commit 35c18f2933c5 ("Add a new optional ",cma" suffix to the
> crashkernel= command line option") and commit ab475510e042 ("kdump:
> implement reserve_crashkernel_cma") added CMA support for kdump
> crashkernel reservation. This allows the kernel to dynamically allocate
> contiguous memory for crash dumping when needed, rather than permanently
> reserving a fixed region at boot time.
> 
> So extend crashkernel CMA reservation support to riscv. The following
> changes are made to enable CMA reservation:
> 
> - Parse and obtain the CMA reservation size along with other crashkernel
>   parameters.
> - Call reserve_crashkernel_cma() to allocate the CMA region for kdump.
> - Include the CMA-reserved ranges for kdump kernel to use.
> - Exclude the CMA-reserved ranges from the crash kernel memory to
>   prevent them from being exported through /proc/vmcore, which is already
>   done in the crash core.
> 
> Update kernel-parameters.txt to document CMA support for crashkernel on
> riscv architecture.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Looks reasonable.  If the plan is to have the kdump maintainers merge 
this, then:

Acked-by: Paul Walmsley <pjw@kernel.org> # arch/riscv


- Paul

