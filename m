Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3F167B213
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jan 2023 12:56:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P22P53KzBz3fRf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jan 2023 22:56:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=l/hcCYqv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3rurqywykdosfheraotbbtyr.pbzyvahkccp-qriyvfgf.bmynof.bet@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=l/hcCYqv;
	dkim-atps=neutral
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P1y1Y1Ggvz308w
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jan 2023 19:39:12 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5028c723d28so131203047b3.15
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jan 2023 00:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=J7ancMifNNyjJiTof8bzSGdh+LvtuOAZ/yhUxoIZ6EY=;
        b=l/hcCYqvcIly8bHSP154OLa3geKFmW7WOJHtqW6QP0WOiQCkjUgO6NFBclTznfTfXd
         q/KZ4uqcFfz6e/A7WhMCPvMZlY7cpI5ZXPygAYrMACNGYIbdZdn2/wrvbiLbPFMi0EJU
         e2xhTpttA9V49soY/4kK5pbOiY/jtu7/UBbsL9M2oZElpThGo5ueYxij1daBdATn/U6J
         lFgz4QPoUTVqu2tO2Jv29c+EKfKlUr82uf6j5jrJG0K4kH7t4tXslYBl2iUfCiGyJg2L
         sa2ZzT9fi8Nbfwma/h4EwurZmwhJrp5hy3f2wiTWrdCgSBqaWH+IxEwCQ2mYpS41PmTz
         ZJ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J7ancMifNNyjJiTof8bzSGdh+LvtuOAZ/yhUxoIZ6EY=;
        b=KIPXmYsasgHW1Qdpd2SWwtRPsX77fdm+Pd0ysd+xejV228UZkHuSvlzr2b0EaqlF7D
         t9mrtGmM+StYgZCFFMoAdfmtfAsDpUpyIkapbr8H4fzIL3Dj/ZiJ9BZmdHPgH8ZDhhuc
         iL+sR8UOX1i3zQBf0KeArO1nRTbON7lYFaLbjZi5BtyefD7Ir/cuMKH4zwHfLl57sq49
         4QkoCPnVu+XUPSLSJy2J0hRaVL4fiJwKIlpZW6JmVLZms5GQYHvPxC3Qb4D+y5kbr9NK
         Fzh+HSMeD1iIUgp0WLtQi9nfkImKRPcRUIU4FSwamfK6RL7J76DTqgD1bJuVmGG0d5ki
         gGdQ==
X-Gm-Message-State: AFqh2kpcG97Q2Ahskkn9j8YREa3bS9Rz4UKrx7rYc5z2UKNFCPJOhslb
	xgx5zXDopFYgjXCBb4KcufJR33Zv0mc=
X-Google-Smtp-Source: AMrXdXslOvF1txeQ7QJk1q8MehIUDQnhzGgaj+Ckxm4gdtDkml40uAzU8COPOn8c5wwtHui85E8JZje3JZk=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:f7b0:20e8:ce66:f98])
 (user=surenb job=sendgmr) by 2002:a0d:ca88:0:b0:501:80db:3eca with SMTP id
 m130-20020a0dca88000000b0050180db3ecamr2010555ywd.100.1674635950405; Wed, 25
 Jan 2023 00:39:10 -0800 (PST)
Date: Wed, 25 Jan 2023 00:38:51 -0800
In-Reply-To: <20230125083851.27759-1-surenb@google.com>
Mime-Version: 1.0
References: <20230125083851.27759-1-surenb@google.com>
X-Mailer: git-send-email 2.39.1.405.gd4c25cc71f-goog
Message-ID: <20230125083851.27759-7-surenb@google.com>
Subject: [PATCH v2 6/6] mm: export dump_mm()
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: michel@lespinasse.org, nvdimm@lists.linux.dev, heiko@sntech.de, leewalsh@google.com, dri-devel@lists.freedesktop.org, perex@perex.cz, jglisse@google.com, arjunroy@google.com, m.szyprowski@samsung.com, linux-arch@vger.kernel.org, qianweili@huawei.com, linux-samsung-soc@vger.kernel.org, aneesh.kumar@linux.ibm.com, chenhuacai@kernel.org, kasan-dev@googlegroups.com, linux-acpi@vger.kernel.org, rientjes@google.com, xen-devel@lists.xenproject.org, devel@lists.orangefs.org, robdclark@gmail.com, minchan@google.com, robert.jarzmik@free.fr, linux-um@lists.infradead.org, etnaviv@lists.freedesktop.org, npiggin@gmail.com, alex.williamson@redhat.com, viro@zeniv.linux.org.uk, luto@kernel.org, gthelen@google.com, tglx@linutronix.de, ldufour@linux.ibm.com, surenb@google.com, linux-sgx@vger.kernel.org, martin.petersen@oracle.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-media@vger.k
 ernel.org, freedreno@lists.freedesktop.org, joelaf@google.com, linux-aio@kvack.org, linux-fbdev@vger.kernel.org, linux-ia64@vger.kernel.org, david@redhat.com, dave.hansen@linux.intel.com, virtualization@lists.linux-foundation.org, edumazet@google.com, target-devel@vger.kernel.org, punit.agrawal@bytedance.com, linux-s390@vger.kernel.org, dave@stgolabs.net, deller@gmx.de, hughd@google.com, andrii@kernel.org, patrik.r.jakobsson@gmail.com, linux-stm32@st-md-mailman.stormreply.com, linux-rockchip@lists.infradead.org, linux-graphics-maintainer@vmware.com, kernel-team@android.com, jayalk@intworks.biz, soheil@google.com, selinux@vger.kernel.org, linux-arm-msm@vger.kernel.org, mripard@kernel.org, shakeelb@google.com, haojian.zhuang@gmail.com, loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, tytso@mit.edu, nico@fluxnic.net, muchun.song@linux.dev, hjc@rock-chips.com, mcoquelin.stm32@gmail.com, tatashin@google.com, mike.kravetz@oracle.com, songliubraving@fb.com, jasowang@redhat.
 com, alsa-devel@alsa-project.org, peterx@redhat.com, linux-tegra@vger.kernel.org, kraxel@redhat.com, will@kernel.org, dmaengine@vger.kernel.org, bhe@redhat.com, miklos@szeredi.hu, linux-rdma@vger.kernel.org, linux-staging@lists.linux.dev, willy@infradead.org, gurua@google.com, dgilbert@interlog.com, xiang@kernel.org, pabeni@redhat.com, jejb@linux.ibm.com, quic_abhinavk@quicinc.com, bp@alien8.de, mchehab@kernel.org, linux-ext4@vger.kernel.org, tomba@kernel.org, hughlynch@google.com, sre@kernel.org, tfiga@chromium.org, linux-xfs@vger.kernel.org, zhangfei.gao@linaro.org, wangzhou1@hisilicon.com, netdev@vger.kernel.org, bpf@vger.kernel.org, linux-erofs@lists.ozlabs.org, davem@davemloft.net, mhocko@suse.com, kvm@vger.kernel.org, mst@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, alexandre.torgue@foss.st.com, dhowells@redhat.com, linux-mm@kvack.org, ray.huang@amd.com, adilger.kernel@dilger.ca, kuba@kernel.org, sparclinux@vger.kernel.org, airlied@gmail.com, anton.ivanov@cambridge
 greys.com, herbert@gondor.apana.org.au, linux-scsi@vger.kernel.org, richard@nod.at, x86@kernel.org, vkoul@kernel.org, mingo@redhat.com, axelrasmussen@google.com, intel-gfx@lists.freedesktop.org, daniel@ffwll.ch, paulmck@kernel.org, jannh@google.com, chao@kernel.org, maarten.lankhorst@linux.intel.com, liam.howlett@oracle.com, hdegoede@redhat.com, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, vbabka@suse.cz, dimitri.sivanich@hpe.com, amd-gfx@lists.freedesktop.org, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, yoshfuji@linux-ipv6.org, linuxppc-dev@lists.ozlabs.org, dsahern@kernel.org, kent.overstreet@linux.dev, kexec@lists.infradead.org, tiwai@suse.com, krzysztof.kozlowski@linaro.org, tzimmermann@suse.de, hannes@cmpxchg.org, dmitry.baryshkov@linaro.org, johannes@sipsolutions.net, mgorman@techsingularity.net, linux-accelerators@lists.ozlabs.org, l.stach@pengutronix.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

mmap_assert_write_locked() is used in vm_flags modifiers. Because
mmap_assert_write_locked() uses dump_mm() and vm_flags are sometimes
modified from from inside a module, it's necessary to export
dump_mm() function.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 mm/debug.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/debug.c b/mm/debug.c
index 9d3d893dc7f4..96d594e16292 100644
--- a/mm/debug.c
+++ b/mm/debug.c
@@ -215,6 +215,7 @@ void dump_mm(const struct mm_struct *mm)
 		mm->def_flags, &mm->def_flags
 	);
 }
+EXPORT_SYMBOL(dump_mm);
 
 static bool page_init_poisoning __read_mostly = true;
 
-- 
2.39.1

