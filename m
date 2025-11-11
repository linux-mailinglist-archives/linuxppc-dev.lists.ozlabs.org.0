Return-Path: <linuxppc-dev+bounces-14084-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A77C4C9F4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Nov 2025 10:23:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d5Lfp4rHNz30M0;
	Tue, 11 Nov 2025 20:22:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762852978;
	cv=none; b=fiikFQHotY2DF9V0ZTvX99Gbe7UCBvT6wXWeX1aSeXDVbh88XJks92G3ICoq/mjZGLB8VsJcORDpp1mfNGpJHmuv55w+jJqAGX4QbqFd28TFIoRZoZ5OtlLgo3hI4cQD2aieHacX2Dm61ps4PLNAnDp5cEstCTIERIwEzR0ASR/PmCl/vLtz7nuRJxB/w2pc50lLqnXzS/PEGVrhOLcjlTdUHiOlA3KpxsJBVVa+8ecqDoSDTW6I+re4HivzY8rB/qo8pGnD7o3nttVX4R8ArKh/0uab0nGLVGEewHmwXf65felimaiP8Cg3L4HYvfeWwE5KE2CNzxAWtaibnOTHMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762852978; c=relaxed/relaxed;
	bh=bCwfGiKgiQS98umgjWmA+KBFsrU1nv1bSQtZVL8GWA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oU2n8VIR0aXd2/pbql48kQkdogKipitLvDbT8xv+06qdWJxL6KmwAQkMpXyL9MO0y6lXQ/Ta1rOEVgUaBM8DIk0B922vgw5AWBtqvQQKlGcBzZC7ytiiOWpnyWNg1zQ1EYqP5aDEJdHrmC7T3wQnm0Ty2pyDXcYbhd1akVdUdZrfWMHpTf/bTume2g1gA691L8Hz0f+49WVDyc9MNqJRoTbExwBDV0pMs3pvF4SfPwhvr3IdTddxyO4Pg0VNUuJWa7TgGu7NpUdYACv/YNuE73sctZmCQBCBPTLOfpgANV+ADIdFvGJCzkW7Uiq2k0ABm2ip/Sb4CTehcFmnzbP/Tg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=Ctp6Ovrm; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=Ctp6Ovrm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d5Lfn47xGz302V
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Nov 2025 20:22:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=bCwfGiKgiQS98umgjWmA+KBFsrU1nv1bSQtZVL8GWA8=; b=Ctp6OvrmDlcVhrBE/X7ZoCQ3Mm
	Xi1Kuu3v9A9ck3YoCXmK1op9I0Yetdw8qK2AI5vba1hMAaukWnfiIROdNGM8k5hNagIn8U6f/DbXc
	7SZCLXg+DPFvAEv7YeV+N51icIvjvJ4BA9fxzcVndktupx8dikc0ru0OeO7NEL1neFlRBRclduioP
	+A1kk/KvWFGGdvC4O13Hn/THru23xl8DN4aVx/jxZMA3LSZjPRX+yCV6jcDqkkisGDgxSNnWutSwz
	Dcn0UUwFkqHJ9NqIOreSg8eqyHMhfZXRsou5CfivhK1+HdjFA+eAI2Bchqrs8kQSodD9NTx+AIU8l
	Ejvj79bw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIkaK-0000000EqIA-1xuT;
	Tue, 11 Nov 2025 09:22:44 +0000
Date: Tue, 11 Nov 2025 09:22:44 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: bot+bpf-ci@kernel.org
Cc: linux-fsdevel@vger.kernel.org, torvalds@linux-foundation.org,
	brauner@kernel.org, jack@suse.cz, raven@themaw.net,
	miklos@szeredi.hu, neil@brown.name, a.hindborg@kernel.org,
	linux-mm@kvack.org, linux-efi@vger.kernel.org,
	ocfs2-devel@lists.linux.dev, kees@kernel.org, rostedt@goodmis.org,
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	paul@paul-moore.com, casey@schaufler-ca.com,
	linuxppc-dev@lists.ozlabs.org, john.johansen@canonical.com,
	selinux@vger.kernel.org, borntraeger@linux.ibm.com,
	bpf@vger.kernel.org, ast@kernel.org, andrii@kernel.org,
	daniel@iogearbox.net, martin.lau@kernel.org, eddyz87@gmail.com,
	yonghong.song@linux.dev, clm@meta.com, ihor.solodrai@linux.dev
Subject: Re: [PATCH v3 36/50] functionfs: switch to simple_remove_by_name()
Message-ID: <20251111092244.GS2441659@ZenIV>
References: <20251111065520.2847791-37-viro@zeniv.linux.org.uk>
 <20754dba9be498daeda5fe856e7276c9c91c271999320ae32331adb25a47cd4f@mail.kernel.org>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20754dba9be498daeda5fe856e7276c9c91c271999320ae32331adb25a47cd4f@mail.kernel.org>
Sender: Al Viro <viro@ftp.linux.org.uk>
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_NONE autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Nov 11, 2025 at 07:53:16AM +0000, bot+bpf-ci@kernel.org wrote:

> When ffs_epfiles_create() calls ffs_epfiles_destroy(epfiles, i - 1) after
> the first ffs_sb_create_file() call fails (when i=1), it passes count=0.
> The initialization loop starts at i=1, so epfiles[0].ffs is never
> initialized.

Incorrect.  The loop in question is

	epfile = epfiles;
	for (i = 1; i <= count; ++i, ++epfile) {
		epfile->ffs = ffs;
		mutex_init(&epfile->mutex);
		mutex_init(&epfile->dmabufs_mutex);
		INIT_LIST_HEAD(&epfile->dmabufs);
		if (ffs->user_flags & FUNCTIONFS_VIRTUAL_ADDR)
			sprintf(epfile->name, "ep%02x", ffs->eps_addrmap[i]);
		else   
			sprintf(epfile->name, "ep%u", i);
		err = ffs_sb_create_file(ffs->sb, epfile->name,
					 epfile, &ffs_epfile_operations);
		if (err) {
			ffs_epfiles_destroy(epfiles, i - 1);
			return err;
		}
	}

and invariant maintained through the loop is epfile == epfiles + (i - 1).
We start with i == 1 and epfile == epfiles, modify neither variable in
the loop body and increment both i and epfile by the same amount in
the step.

In other words, on the first pass through the loop we access epfiles[0],
not epfiles[1].  Granted, the loop could've been more idiomatic, but
it is actually correct.

