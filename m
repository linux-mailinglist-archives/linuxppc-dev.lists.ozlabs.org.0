Return-Path: <linuxppc-dev+bounces-5302-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BBAA12A2D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2025 18:52:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YYD9f6GKSz2ypx;
	Thu, 16 Jan 2025 04:52:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736963574;
	cv=none; b=nABoEN6KylyVKhpV+nAfcPJ4vK1wfLzl3kBoDtIcl7oFZqpWpZEvVpn4a7x2b5S9BCz4Ct0ss0kZlO4Sb7gacpycyDKp34v/r8+mMoRWS9GHaY25Qz5daFuRsaxE3cQxKrrC/IXCZdy42zvEXciqGzzviEaTiXWSDyyiLJoD7TouHnP3MFq1oBAP7DZNEVRyabyXoCy0MXp9sHSLwZHaHV6s4PAWognI9SEZMiG8rLrG4LJQMnjOS6GDLr6Xj+Ir1e4jVnX1RFn+rnVpZ76CPAOlpq8o+dkAt9NIV4fm+KyqvU0Ev4zLlz0BZbjBo5uyc3WzMhNKqJVIrtp23HggAw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736963574; c=relaxed/relaxed;
	bh=HoxPdbGDiDXMZjZ2YzakPSB0m74gINsG6VFgtuazYj8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TKo91VJcqMKLx4Tn+HWhA1VOkki8BRNq3GYn/prVeUR/VhIuOd2PclkmMpzHKtlhALF01Kl0c0aamXDuOaKi9vDTKOoeOPh963Qskrd4WeKmqpq8HmVpMXdCutWF+N5ilp+5QKcIISctnKrSV8uixWRmkWUs/g6M8bLZXOMWoo41Tki4B/0lmR6l+tQz2cAgwFEcDJD36DuLgWR1zImJpp8xzWab4NTl6tnajqHHrklzgI4OeeshJvruL44fIdKQtPJarHr0EHDehUAXpwHn/hzelh/ZCGmKaDfD5MNb+n3gfpO9J8N4zy+4/W5jEUHZb+nWdir+n7jXwwrTROVqVA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=O59TkAiV; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=fzGlQJbE; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=O59TkAiV;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=fzGlQJbE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YYD9d1JV3z2yVv
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2025 04:52:53 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1736963561;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HoxPdbGDiDXMZjZ2YzakPSB0m74gINsG6VFgtuazYj8=;
	b=O59TkAiVIoh/kyWqt3sD2QUaiElCxlt4joNfsm5Vy47rl6VB5TFRsEG8yyBoGzvY2r/6mY
	lQrxl2KFOtZwXB8o2yGswqA28AwPR3ILexVj+8YMlHNoNTQyAqrecm5DQu43fEOAoeu1zB
	AUUJUV3mFLL/jKj4Q1eejS9vRnjN/1NreJFiVLN6lXCv97Xxmp1pRrzkdAR4+8k7oYySE3
	EjRlx3bwRLZ1kPZatpooq203bOQXFsUoJ5K9wvWgIoGkzYbbWPFekFpYB6FKtIibo4IGCl
	3qtrgWckX7984+Okk9ULQbx1KIxKVOK20qnnIXjJMWBsTxDlkgtJ8kE9XE9ROg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1736963561;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HoxPdbGDiDXMZjZ2YzakPSB0m74gINsG6VFgtuazYj8=;
	b=fzGlQJbELsuQf/TIokTn215dpIYwMgfAYRUXgXNteW1TJ/rfCFCi40yte9UtrzUzNBp68H
	ns68VXLDVpNCEbAA==
To: Joel Granados <joel.granados@kernel.org>, Thomas =?utf-8?Q?Wei=C3=9Fsc?=
 =?utf-8?Q?huh?=
 <linux@weissschuh.net>, Kees Cook <kees@kernel.org>, Luis Chamberlain
 <mcgrof@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-crypto@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-hyperv@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-raid@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-serial@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-aio@kvack.org, linux-fsdevel@vger.kernel.org, netfs@lists.linux.dev,
 codalist@coda.cs.cmu.edu, linux-mm@kvack.org, linux-nfs@vger.kernel.org,
 ocfs2-devel@lists.linux.dev, fsverity@lists.linux.dev,
 linux-xfs@vger.kernel.org, io-uring@vger.kernel.org, bpf@vger.kernel.org,
 kexec@lists.infradead.org, linux-trace-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-security-module@vger.kernel.org, keyrings@vger.kernel.org, Song Liu
 <song@kernel.org>, "Steven Rostedt (Google)" <rostedt@goodmis.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>, "Darrick J. Wong"
 <djwong@kernel.org>, Jani Nikula <jani.nikula@intel.com>, Corey Minyard
 <cminyard@mvista.com>, Joel Granados <joel.granados@kernel.org>
Subject: Re: [PATCH v2] treewide: const qualify ctl_tables where applicable
In-Reply-To: <20250110-jag-ctl_table_const-v2-1-0000e1663144@kernel.org>
References: <20250110-jag-ctl_table_const-v2-1-0000e1663144@kernel.org>
Date: Wed, 15 Jan 2025 18:52:40 +0100
Message-ID: <87jzawarrr.ffs@tglx>
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
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Jan 10 2025 at 15:16, Joel Granados wrote:
> sed:
>     sed --in-place \
>       -e "s/struct ctl_table .table = &uts_kern/const struct ctl_table *table = \&uts_kern/" \
>       kernel/utsname_sysctl.c
>
> Reviewed-by: Song Liu <song@kernel.org>
> Acked-by: Steven Rostedt (Google) <rostedt@goodmis.org> # for kernel/trace/
> Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com> # SCSI
> Reviewed-by: Darrick J. Wong <djwong@kernel.org> # xfs
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Acked-by: Corey Minyard <cminyard@mvista.com>
> Signed-off-by: Joel Granados <joel.granados@kernel.org>

Acked-by: Thomas Gleixner <tglx@linutronix.de>

