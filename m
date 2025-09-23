Return-Path: <linuxppc-dev+bounces-12544-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21948B96FB9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Sep 2025 19:18:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cWRX34kPcz303F;
	Wed, 24 Sep 2025 03:18:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758647907;
	cv=none; b=eChrEN/yW4KxYJ4k/Bl1FSnozg9w7/5NVlpj66bv5RVIQPFPFRTfP2jk/zsfsJ2XeKXH8cDRRl/U+tAH/unCo2+ag3YFogD88cItMnPX5mPPqOqn6BOLfIf+QWjC4Jbq0ozzO8QxtUNBfq4NwHxFL4/87gMwaoDzjLF0CtojB25P/7JN6Ovbgr/BFpJf0nGDRoVzjcI2UKA6+doNkiZQ53HHduDzhxKwSB03FPC0rcoWpdxx3rCyOMdq8HZHUCCoz1JvwXf9gBjgJb4x5i5JPPUkSgNM+ZjmAYriMHrUPUt7g+5JsRitjTWp6hsp+reQvHebF670Eoo5sQ86OUFBnw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758647907; c=relaxed/relaxed;
	bh=CvIs1sC3Qq/UwE73WmiJURmY8QNLg7F9cxjFD4NAFr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kNFfGuQTSwKaFDN7WYpP7qOPGF6ozKrwqsxTFX30ETiuAbU6HoDg6I8MicgmBp7sLrtuH7jwqqKFZm9FW54CvshqPk6Qa9p5uKqFfnCsF4XJEeuKe5XaeurgpwYoMkgOV9mvRekSThVIdh2+hR622TmS+74TzDZChzrwkKsfKDbMQgd1e7HFLo3YJhIey1aKeZjx7tjr/0Kvt1kfU0mkZzfQDbzIHGm8xFpKNgXoQZdYwbR3fH4Oca/8RTLsAIsjIbFleAfjz+M5OmbGZRMFOPMymF73hDk/HzODmKyBqgy6EBi3x8jqgkAT3VG4J2hLNVhnfBTvWRNQJaL0t8HX0Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=g5Jqi9yu; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=g5Jqi9yu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cWRX24qVVz2yxN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Sep 2025 03:18:26 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4D74B447D6;
	Tue, 23 Sep 2025 17:18:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76194C4CEF5;
	Tue, 23 Sep 2025 17:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758647903;
	bh=1ANX/1Q+c1YQm6ycMdbCkLhJt5M0dGUVsHIE7DPPmR4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g5Jqi9yueMAnnH73toGC0xOJKxvg0qa4gga/SeRhYNDlfhLJMDwAYoyYF5OeZMllT
	 4wGYFwIT9tNhvxI7Fwmxeam4DFzzKoOpEvYF6KzT3sugNB9IZN5QFtnFbWNJKdyahQ
	 njhRkpS4V2fDEMCIbaKPb5Fvro/sH2PrgzN3QArdRquI6/hD8MqkvT+BpL3TaOekdf
	 ivzyZBCGcNieZxwvItwvCdr8sC9432gSLRdJ+Qt9NVztv9FJs9EoyOLvflbrcT7TLo
	 fCDKOXnJOo3pz8pFrFpZX02l/lSsNuJ1YSx2nfsXC1cIkAfhePf3pibh9dO8eHGKV8
	 GZaMzjVv7a/9Q==
Date: Tue, 23 Sep 2025 20:18:19 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Geoff Levand <geoff@infradead.org>, Helge Deller <deller@gmx.de>,
	Ingo Molnar <mingo@redhat.com>, iommu@lists.linux.dev,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Jason Wang <jasowang@redhat.com>, Juergen Gross <jgross@suse.com>,
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Matt Turner <mattst88@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	sparclinux@vger.kernel.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	virtualization@lists.linux.dev, x86@kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/9] alpha: Convert mapping routine to rely on physical
 address
Message-ID: <20250923171819.GM10800@unreal>
References: <cover.1758219786.git.leon@kernel.org>
 <0c64474985af55b1aa934b857808068a0e609c6e.1758219787.git.leon@kernel.org>
 <CA+=Fv5Q8dVUFVBh82mAe=fy3mV6mWtQT_0pBPLQwLNBt3f8E1g@mail.gmail.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+=Fv5Q8dVUFVBh82mAe=fy3mV6mWtQT_0pBPLQwLNBt3f8E1g@mail.gmail.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Sep 22, 2025 at 11:04:06PM +0200, Magnus Lindholm wrote:
> On Thu, Sep 18, 2025 at 8:45 PM Leon Romanovsky <leon@kernel.org> wrote:
> >
> > From: Leon Romanovsky <leonro@nvidia.com>
> >
> > Alpha doesn't need struct *page and can perform mapping based on
> > physical addresses. So convert it to implement new .map_phys callback.
> 
> 
> Hi,
> 
> SInce this patch affects the Alpha platform I got curious and decided to
> try it out. The patch series requires some preparatory patches. Leon
> provided me with links to his dmabuf-vfio branch, which had the
> patches (and some prerequisite stuff) applied already.
> 
> Based on the dmabuf-vfio branch,  I've built a kernel and tested it on
> my ES40 Alphaserver, the kernel booted fine but after a while of
> moderate filesystem load I started seeing some ext3/4 related error
> messages in the system logs. Rebooting with my old kernel into
> single user mode, I was able to recover the filesystem using fsck.
> Clearly this set of patches breaks things (at least on Alpha).

I will try to setup Alpha architecture in QEMU in following days, but
would like to ask first. Did you test alpha on clean v6.17-rc5 (without
my patches) as a reference?

Thanks

