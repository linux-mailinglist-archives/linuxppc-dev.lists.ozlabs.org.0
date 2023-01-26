Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E3D67DC4E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 03:33:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P31p73M5Jz3fGf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 13:33:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OyaVsT5e;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OyaVsT5e;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2k9g64j6z3fC3;
	Fri, 27 Jan 2023 01:48:55 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E1F826183C;
	Thu, 26 Jan 2023 14:48:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05241C4339B;
	Thu, 26 Jan 2023 14:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674744532;
	bh=WNohoknU9nLfbwIXeO77neZ4yMyv64MASZK2UIAfOfc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OyaVsT5ePzTFS76R1FH5KLxOUgzscan6sLv55lgf+totKkalpj5P4hTJ0CFzpg2nB
	 FjnAcEI6WBL0tfwF/TTw8b+wwY6a9pfQDEoFaNDhDzv4Bx4E//TKL2HIis05iqFTqA
	 6cWnwUhcKJagQmydnhE9MWdKN98RZA7QH0/g2op6Qc+WX5kkWc6P8AxP1IQok4d4Iv
	 rC+rDq5bfpCpp87TX2zmlNbavkxhh4pjEZT5VQ1/5GQQQR5j3P3SiDxYUla0TLmDmY
	 tHoanGw9DWG+oAt/RnrhsxsQ7gltrsJN75kvWssUX4MOKayClNcjWM9UluK5fqquNs
	 P9OGQuC06AeFQ==
Date: Thu, 26 Jan 2023 16:48:04 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH v2 6/6] mm: export dump_mm()
Message-ID: <Y9KSpNJ4y0GMwkrW@kernel.org>
References: <20230125083851.27759-1-surenb@google.com>
 <20230125083851.27759-7-surenb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230125083851.27759-7-surenb@google.com>
X-Mailman-Approved-At: Fri, 27 Jan 2023 13:32:18 +1100
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
Cc: michel@lespinasse.org, nvdimm@lists.linux.dev, heiko@sntech.de, leewalsh@google.com, dri-devel@lists.freedesktop.org, perex@perex.cz, jglisse@google.com, arjunroy@google.com, m.szyprowski@samsung.com, linux-arch@vger.kernel.org, qianweili@huawei.com, linux-samsung-soc@vger.kernel.org, aneesh.kumar@linux.ibm.com, chenhuacai@kernel.org, kasan-dev@googlegroups.com, linux-acpi@vger.kernel.org, rientjes@google.com, xen-devel@lists.xenproject.org, devel@lists.orangefs.org, robdclark@gmail.com, minchan@google.com, robert.jarzmik@free.fr, linux-um@lists.infradead.org, etnaviv@lists.freedesktop.org, npiggin@gmail.com, alex.williamson@redhat.com, viro@zeniv.linux.org.uk, luto@kernel.org, gthelen@google.com, tglx@linutronix.de, ldufour@linux.ibm.com, linux-sgx@vger.kernel.org, martin.petersen@oracle.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org, linux-medi
 a@vger.kernel.org, freedreno@lists.freedesktop.org, joelaf@google.com, linux-aio@kvack.org, linux-fbdev@vger.kernel.org, linux-ia64@vger.kernel.org, david@redhat.com, dave.hansen@linux.intel.com, virtualization@lists.linux-foundation.org, edumazet@google.com, target-devel@vger.kernel.org, punit.agrawal@bytedance.com, linux-s390@vger.kernel.org, dave@stgolabs.net, deller@gmx.de, hughd@google.com, andrii@kernel.org, patrik.r.jakobsson@gmail.com, linux-stm32@st-md-mailman.stormreply.com, linux-rockchip@lists.infradead.org, linux-graphics-maintainer@vmware.com, kernel-team@android.com, jayalk@intworks.biz, soheil@google.com, selinux@vger.kernel.org, linux-arm-msm@vger.kernel.org, mripard@kernel.org, shakeelb@google.com, haojian.zhuang@gmail.com, loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, tytso@mit.edu, nico@fluxnic.net, muchun.song@linux.dev, hjc@rock-chips.com, mcoquelin.stm32@gmail.com, tatashin@google.com, mike.kravetz@oracle.com, songliubraving@fb.com, jasowang
 @redhat.com, alsa-devel@alsa-project.org, peterx@redhat.com, linux-tegra@vger.kernel.org, kraxel@redhat.com, will@kernel.org, dmaengine@vger.kernel.org, bhe@redhat.com, miklos@szeredi.hu, linux-rdma@vger.kernel.org, linux-staging@lists.linux.dev, willy@infradead.org, gurua@google.com, dgilbert@interlog.com, xiang@kernel.org, pabeni@redhat.com, jejb@linux.ibm.com, quic_abhinavk@quicinc.com, bp@alien8.de, mchehab@kernel.org, linux-ext4@vger.kernel.org, tomba@kernel.org, hughlynch@google.com, sre@kernel.org, tfiga@chromium.org, linux-xfs@vger.kernel.org, zhangfei.gao@linaro.org, wangzhou1@hisilicon.com, netdev@vger.kernel.org, bpf@vger.kernel.org, linux-erofs@lists.ozlabs.org, davem@davemloft.net, mhocko@suse.com, kvm@vger.kernel.org, mst@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, alexandre.torgue@foss.st.com, dhowells@redhat.com, linux-mm@kvack.org, ray.huang@amd.com, adilger.kernel@dilger.ca, kuba@kernel.org, sparclinux@vger.kernel.org, airlied@gmail.com, anton.ivanov@c
 ambridgegreys.com, herbert@gondor.apana.org.au, linux-scsi@vger.kernel.org, richard@nod.at, x86@kernel.org, vkoul@kernel.org, mingo@redhat.com, axelrasmussen@google.com, intel-gfx@lists.freedesktop.org, daniel@ffwll.ch, paulmck@kernel.org, jannh@google.com, chao@kernel.org, maarten.lankhorst@linux.intel.com, liam.howlett@oracle.com, hdegoede@redhat.com, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, vbabka@suse.cz, dimitri.sivanich@hpe.com, amd-gfx@lists.freedesktop.org, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, yoshfuji@linux-ipv6.org, linuxppc-dev@lists.ozlabs.org, dsahern@kernel.org, kent.overstreet@linux.dev, kexec@lists.infradead.org, tiwai@suse.com, krzysztof.kozlowski@linaro.org, tzimmermann@suse.de, hannes@cmpxchg.org, dmitry.baryshkov@linaro.org, johannes@sipsolutions.net, mgorman@techsingularity.net, linux-accelerators@lists.ozlabs.org, l.stach@pengutronix.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 25, 2023 at 12:38:51AM -0800, Suren Baghdasaryan wrote:
> mmap_assert_write_locked() is used in vm_flags modifiers. Because
> mmap_assert_write_locked() uses dump_mm() and vm_flags are sometimes
> modified from from inside a module, it's necessary to export
> dump_mm() function.
> 
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  mm/debug.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/mm/debug.c b/mm/debug.c
> index 9d3d893dc7f4..96d594e16292 100644
> --- a/mm/debug.c
> +++ b/mm/debug.c
> @@ -215,6 +215,7 @@ void dump_mm(const struct mm_struct *mm)
>  		mm->def_flags, &mm->def_flags
>  	);
>  }
> +EXPORT_SYMBOL(dump_mm);
>  
>  static bool page_init_poisoning __read_mostly = true;
>  
> -- 
> 2.39.1
> 
