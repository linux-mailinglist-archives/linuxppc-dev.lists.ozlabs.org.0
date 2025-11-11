Return-Path: <linuxppc-dev+bounces-14085-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90859C4CA9C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Nov 2025 10:30:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d5Lqb4FHjz30FP;
	Tue, 11 Nov 2025 20:30:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762853435;
	cv=none; b=StKHA9vVwbTlTVpFxQgLOmIdFrFwANcJwTd7Kz0BKSv0e4He/SmFPWvBGHcbkoDuFsSWpmONFGjm5tT/i7eCEeZC4iJpIGnRpY/s29O9nUL/UYaSx7QOt+EbuFYh+txI+uoG3YrNDXDFWjdWAQx06f40TEJqNdA/LJMKUKLenvZMAyWFdOjKrhyE6z+hP4l90yWmmQ3m0RkMgHKEFEW9if6NL69vpWGS7iT6L1gr2Ocj5lFSR6VZppScwbiZmLQL0Kg8C6biuEbwxLgqgzosxocBf5GRCzxekpfifh3LQupv/znlOV+PaXVrPzEZ0bdv9FhEsS2OYT8sXaXa8B8gDA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762853435; c=relaxed/relaxed;
	bh=3L2gHAiIh87Km6665M3lvvdrhNzA6zB+GULIQFa17Hk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F1LG01tMaxwYRURMUpolKtfCIOpaXe2D9HdZ1uVvtX2wXkaVQmrEKPpRx0WnDw+eYSXgfi1zBYQRdgVdnXR5CS1fSocs737n2MDtsFlD76ybjvzRWAT/5RKlrBve59B2J/z+9lil5KkBscbe6jt1YJndN4UqUEUmbJwdjmJG7uOfsDN7hcVinPjU8E2YRR/72jDzxRA7MXzHkq8XtyRk+Ibiv9bAfG0dBpBpXdiCvdaCcjGWVQYta1zCcAjopgEk1HjGe2sXOPhO7amapvjI1XLtca+VJbQEeAfY0n9ezy71cmjk8rd+dv2GB43LPaqXB98HiAqk/HFr8JbodO4wIQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Wel3RcIu; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=brauner@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Wel3RcIu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=brauner@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d5LqZ5cvJz30Dq
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Nov 2025 20:30:34 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8B496404C0;
	Tue, 11 Nov 2025 09:30:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B728C19421;
	Tue, 11 Nov 2025 09:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762853432;
	bh=FABYtlEqY2mS5o9frfhx1zgALjceFTO/BSa/J+igp2U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wel3RcIuS5j+o/v6AaFglHplRlVo9sjzdy86FsNvkTS5k7A/kuydEY9YQDtDQNrkU
	 1JCCFOApt8LXWbOxCeqS0vlhGpfcI0c8jf2RAsKomtysjY/RFbLTstpdKXu40yGTYn
	 FLxjdS45rZweVEmhZDxCWOTnPuYWbymg3w5CfiOvkb1Zp/DixWYVSWmBkR6D86LVRS
	 90pZQhDvDQUp5C//Nl5fU0nZLj6njdPQoX9etWjUUWT7zS1p8r3mKbTo7WJJiVw2Eh
	 1ZXIc9VtvUtautgBEOReKPpMqPkOF85M+AtRNgbRjY4ZeYjO80kCfOZdnWtEAjEE0Q
	 TQ0u/1s2TNihQ==
Date: Tue, 11 Nov 2025 10:30:22 +0100
From: Christian Brauner <brauner@kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: bot+bpf-ci@kernel.org, linux-fsdevel@vger.kernel.org, 
	torvalds@linux-foundation.org, jack@suse.cz, raven@themaw.net, miklos@szeredi.hu, 
	neil@brown.name, a.hindborg@kernel.org, linux-mm@kvack.org, 
	linux-efi@vger.kernel.org, ocfs2-devel@lists.linux.dev, kees@kernel.org, 
	rostedt@goodmis.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	paul@paul-moore.com, casey@schaufler-ca.com, linuxppc-dev@lists.ozlabs.org, 
	john.johansen@canonical.com, selinux@vger.kernel.org, borntraeger@linux.ibm.com, 
	bpf@vger.kernel.org, ast@kernel.org, andrii@kernel.org, daniel@iogearbox.net, 
	martin.lau@kernel.org, eddyz87@gmail.com, yonghong.song@linux.dev, clm@meta.com, 
	ihor.solodrai@linux.dev
Subject: Re: [PATCH v3 36/50] functionfs: switch to simple_remove_by_name()
Message-ID: <20251111-verelendung-unpolitisch-1bdcd153611e@brauner>
References: <20251111065520.2847791-37-viro@zeniv.linux.org.uk>
 <20754dba9be498daeda5fe856e7276c9c91c271999320ae32331adb25a47cd4f@mail.kernel.org>
 <20251111092244.GS2441659@ZenIV>
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
In-Reply-To: <20251111092244.GS2441659@ZenIV>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Nov 11, 2025 at 09:22:44AM +0000, Al Viro wrote:
> On Tue, Nov 11, 2025 at 07:53:16AM +0000, bot+bpf-ci@kernel.org wrote:
> 
> > When ffs_epfiles_create() calls ffs_epfiles_destroy(epfiles, i - 1) after
> > the first ffs_sb_create_file() call fails (when i=1), it passes count=0.
> > The initialization loop starts at i=1, so epfiles[0].ffs is never
> > initialized.
> 
> Incorrect.  The loop in question is

Are you aware that you're replying to a bot-generated email?

> 
> 	epfile = epfiles;
> 	for (i = 1; i <= count; ++i, ++epfile) {
> 		epfile->ffs = ffs;
> 		mutex_init(&epfile->mutex);
> 		mutex_init(&epfile->dmabufs_mutex);
> 		INIT_LIST_HEAD(&epfile->dmabufs);
> 		if (ffs->user_flags & FUNCTIONFS_VIRTUAL_ADDR)
> 			sprintf(epfile->name, "ep%02x", ffs->eps_addrmap[i]);
> 		else   
> 			sprintf(epfile->name, "ep%u", i);
> 		err = ffs_sb_create_file(ffs->sb, epfile->name,
> 					 epfile, &ffs_epfile_operations);
> 		if (err) {
> 			ffs_epfiles_destroy(epfiles, i - 1);
> 			return err;
> 		}
> 	}
> 
> and invariant maintained through the loop is epfile == epfiles + (i - 1).
> We start with i == 1 and epfile == epfiles, modify neither variable in
> the loop body and increment both i and epfile by the same amount in
> the step.
> 
> In other words, on the first pass through the loop we access epfiles[0],
> not epfiles[1].  Granted, the loop could've been more idiomatic, but
> it is actually correct.

