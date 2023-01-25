Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 351A467B221
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jan 2023 13:00:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P22V50hzvz3fVC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jan 2023 23:00:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=r0FIat4k;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2001:67c:2178:6::1c; helo=smtp-out1.suse.de; envelope-from=mhocko@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=r0FIat4k;
	dkim-atps=neutral
X-Greylist: delayed 2202 seconds by postgrey-1.36 at boromir; Wed, 25 Jan 2023 20:38:59 AEDT
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P1zLW5KsKz2ywn;
	Wed, 25 Jan 2023 20:38:58 +1100 (AEDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8ADEB21C7D;
	Wed, 25 Jan 2023 09:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1674639534; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rlC3v8G7Qltb7/sMWGykfElAbj3RZvreU88MtZ+OLHM=;
	b=r0FIat4kOE8WovOTP3LWhacl5M3EjQXhF3aBT5cBj3FuQ5I+yJMTY0cq7QTmO7SFPDQv6O
	tRrm4BhOZHjZFNfq3BxFKWYU7SqtAc8zTE0tqhcCiP6BOgQ+ipP6+yjGZBzFWwz4Mee2C0
	GFF6IKS/BdrV8Bwlj7T9ur543veHKvk=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 446411358F;
	Wed, 25 Jan 2023 09:38:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id jLUjEK740GMsIAAAMHmgww
	(envelope-from <mhocko@suse.com>); Wed, 25 Jan 2023 09:38:54 +0000
Date: Wed, 25 Jan 2023 10:38:53 +0100
From: Michal Hocko <mhocko@suse.com>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH v2 4/6] mm: replace vma->vm_flags indirect modification
 in ksm_madvise
Message-ID: <Y9D4rWEsajV/WfNx@dhcp22.suse.cz>
References: <20230125083851.27759-1-surenb@google.com>
 <20230125083851.27759-5-surenb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230125083851.27759-5-surenb@google.com>
X-Mailman-Approved-At: Wed, 25 Jan 2023 22:50:29 +1100
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
 @redhat.com, alsa-devel@alsa-project.org, peterx@redhat.com, linux-tegra@vger.kernel.org, kraxel@redhat.com, will@kernel.org, dmaengine@vger.kernel.org, bhe@redhat.com, miklos@szeredi.hu, linux-rdma@vger.kernel.org, linux-staging@lists.linux.dev, willy@infradead.org, gurua@google.com, dgilbert@interlog.com, xiang@kernel.org, pabeni@redhat.com, jejb@linux.ibm.com, quic_abhinavk@quicinc.com, bp@alien8.de, mchehab@kernel.org, linux-ext4@vger.kernel.org, tomba@kernel.org, hughlynch@google.com, sre@kernel.org, tfiga@chromium.org, linux-xfs@vger.kernel.org, zhangfei.gao@linaro.org, wangzhou1@hisilicon.com, netdev@vger.kernel.org, bpf@vger.kernel.org, linux-erofs@lists.ozlabs.org, davem@davemloft.net, kvm@vger.kernel.org, mst@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, alexandre.torgue@foss.st.com, dhowells@redhat.com, linux-mm@kvack.org, ray.huang@amd.com, adilger.kernel@dilger.ca, kuba@kernel.org, sparclinux@vger.kernel.org, airlied@gmail.com, anton.ivanov@cambridgegreys.com
 , herbert@gondor.apana.org.au, linux-scsi@vger.kernel.org, richard@nod.at, x86@kernel.org, vkoul@kernel.org, mingo@redhat.com, axelrasmussen@google.com, intel-gfx@lists.freedesktop.org, daniel@ffwll.ch, paulmck@kernel.org, jannh@google.com, chao@kernel.org, maarten.lankhorst@linux.intel.com, liam.howlett@oracle.com, hdegoede@redhat.com, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, vbabka@suse.cz, dimitri.sivanich@hpe.com, amd-gfx@lists.freedesktop.org, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, yoshfuji@linux-ipv6.org, linuxppc-dev@lists.ozlabs.org, dsahern@kernel.org, kent.overstreet@linux.dev, kexec@lists.infradead.org, tiwai@suse.com, krzysztof.kozlowski@linaro.org, tzimmermann@suse.de, hannes@cmpxchg.org, dmitry.baryshkov@linaro.org, johannes@sipsolutions.net, mgorman@techsingularity.net, linux-accelerators@lists.ozlabs.org, l.stach@pengutronix.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed 25-01-23 00:38:49, Suren Baghdasaryan wrote:
> Replace indirect modifications to vma->vm_flags with calls to modifier
> functions to be able to track flag changes and to keep vma locking
> correctness. Add a BUG_ON check in ksm_madvise() to catch indirect
> vm_flags modification attempts.

Those BUG_ONs scream to much IMHO. KSM is an MM internal code so I
gueess we should be willing to trust it.

> Signed-off-by: Suren Baghdasaryan <surenb@google.com>

Acked-by: Michal Hocko <mhocko@suse.com>
-- 
Michal Hocko
SUSE Labs
