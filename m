Return-Path: <linuxppc-dev+bounces-14225-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 743F4C66625
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Nov 2025 23:04:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d9MGx1NkVz2yvM;
	Tue, 18 Nov 2025 09:04:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763417081;
	cv=none; b=eyRH5eLGbMmzLAnQelTZbeXHtDGzvTBUQuazSsoUAeCzQmleCPiveHC93k5NEQ6fv4Tb+qPxtt8wqAU6BJNKYUtGaFE8X67vtrCuQ1kQEtkl2aGMie2O7pm8beTyRzQJPQgrVxLCq0ec6Kr3NW+VzER461irhOWP6Pfx5WkxodcnIyBVcp0s6QVoL1t+m5RWU+3pCvsFtmxKY/WQkpqD94M4sMGyPzsK3nQgEMV+QtMPFZcJghIXGirecS+ZKDxgu42syC+w8QJE5X3pjcc5c3TgSZkQ9y3aP/SsKXUtF8ARIDrb7saWI0jLuHFXmlxdYkK/bwAEqh2C2Z7sHR/nDA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763417081; c=relaxed/relaxed;
	bh=x4vYLxHITOk7FY5Vha316u1XPKmx4CmxosD+41s+PrI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dsOCb8rGjkmWh4VJ+y3a1AWrxcCRMzBeRjUBzfroh5qUfmYOL/XlUqiR9pYmaIVcnVZHr4aLzZigLelNxFOgh/WzeQw3N/itfIcOlfl8GlBGeRoPFZlLYQHwj3xVZsjj/CWJXjv7vWvGi905/cS/VQfCAxSdTtt0mEH+uRUctdLsboRNyX0unYSWNcCqMiPwsPpJAfG3vj0b6pYn3YBTo9931nQNu9Fg8EJn9MfBZWZDC2RrukflouUecajoQR9x5m0sdS0xwDnS8HBB2z+9sqfnulM/F89PK6b+43hFIyG25KnnvV5BKkBweJUkc3O/fJFpWXn9KjigreEzspVixQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=bommFxq7; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=bommFxq7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d9MGs3SYrz2ypY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Nov 2025 09:04:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=x4vYLxHITOk7FY5Vha316u1XPKmx4CmxosD+41s+PrI=; b=bommFxq7sliAeyjvLPQEoXoIVd
	pKa5o1Yb4IZq/+Xwuf716utrTFwG+e1EsNxYWcpzPTbdpHRsyC+gnwvbW2CxCuCIULA7mQDMxwK5/
	AD9OstpSMVU2Lx+nYqPNClApquHbL/pPqjnm6CSLnpit0oArJLDk/9tAqD/lIMvZ5qr2Fe2hFo0DW
	O1QvQUtGp8okxdB0iNSpx11sF0WGBhQtqqPRzaeS3gnJrqxtzofIHkzHybBV0AkLPLWQ3z6hODug1
	LIuAWXCkHx6YuL1QuzIbhbKRobQAT7Rzt9v5JNZjbJHnm8L2IAhzA7JyTKsGV5a7GQI7nzes/1y1g
	a0CeNx3Q==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL7KZ-00000007Jyi-1gmT;
	Mon, 17 Nov 2025 22:04:15 +0000
Date: Mon, 17 Nov 2025 22:04:15 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: bot+bpf-ci@kernel.org, linux-fsdevel@vger.kernel.org,
	torvalds@linux-foundation.org, brauner@kernel.org, jack@suse.cz,
	raven@themaw.net, miklos@szeredi.hu, neil@brown.name,
	a.hindborg@kernel.org, linux-mm@kvack.org,
	linux-efi@vger.kernel.org, ocfs2-devel@lists.linux.dev,
	kees@kernel.org, rostedt@goodmis.org, linux-usb@vger.kernel.org,
	paul@paul-moore.com, casey@schaufler-ca.com,
	linuxppc-dev@lists.ozlabs.org, john.johansen@canonical.com,
	selinux@vger.kernel.org, borntraeger@linux.ibm.com,
	bpf@vger.kernel.org, ast@kernel.org, andrii@kernel.org,
	daniel@iogearbox.net, martin.lau@kernel.org, eddyz87@gmail.com,
	yonghong.song@linux.dev, ihor.solodrai@linux.dev,
	Chris Mason <clm@meta.com>
Subject: Re: [functionfs] mainline UAF (was Re: [PATCH v3 36/50] functionfs:
 switch to simple_remove_by_name())
Message-ID: <20251117220415.GB2441659@ZenIV>
References: <20251111065520.2847791-37-viro@zeniv.linux.org.uk>
 <20754dba9be498daeda5fe856e7276c9c91c271999320ae32331adb25a47cd4f@mail.kernel.org>
 <20251111092244.GS2441659@ZenIV>
 <e6b90909-fdd7-4c4d-b96e-df27ea9f39c4@meta.com>
 <20251113092636.GX2441659@ZenIV>
 <2025111316-cornfield-sphinx-ba89@gregkh>
 <20251114074614.GY2441659@ZenIV>
 <2025111555-spoon-backslid-8d1f@gregkh>
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
In-Reply-To: <2025111555-spoon-backslid-8d1f@gregkh>
Sender: Al Viro <viro@ftp.linux.org.uk>
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_NONE autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, Nov 15, 2025 at 08:21:34AM -0500, Greg Kroah-Hartman wrote:

> Ugh, messy.  But yes, this does look better, thanks for that.  Want me
> to take it through the USB tree, or will you take it through one of
> yours? (I don't remember what started this thread...)

See #work.functionfs in my tree - that patch carved up + fix for UAF
on uncancelled scheduled work.  Individual patches in followups.
If you have problems with that series, please say so.  Otherwise
I'm merging it with #work.persistence (with #36 in there updated as
posted)...

