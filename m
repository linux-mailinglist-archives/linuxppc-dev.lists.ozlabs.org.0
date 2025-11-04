Return-Path: <linuxppc-dev+bounces-13710-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B6114C2EDC2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 04 Nov 2025 02:44:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d0rpD43qgz2yr9;
	Tue,  4 Nov 2025 12:43:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762220628;
	cv=none; b=C/obxZQEIB4fFyqtfudYwGpAS5V5K7D2c/GOVruTZlrIt8q7I8lQr20DB/crk746lKNwqQ2ilgAJEp2eV4PiTYcbNSjG032yqytcJpTFFkXOmekTvMcPKy4qtidBoMdRK5Gacvk7Wi9C1rk+7OwrBiwS4zpCU8Xm8lNf6GBsmCm6e8ewcDFkA+2lCCMPZ+g5jq+h1qToT759OK2Ktlyw05jfBVKNKlmTvX7VDyePVI0yuyahMvPyDQDDkj363CXzbHVY+9chgn0TpSX4gGPlyS8vc6LWgTqqFoHtPj/c8XhuHSNe/Te7vCf+AqSjaeKNstMiKlvMpG1Qh0OQRiD4wg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762220628; c=relaxed/relaxed;
	bh=R/dyn6nmohhI4MmC9nR9yAqBB4AN045O0WH/mgI5Uck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nA0JipdGY1oGEujdpD1etI5G9p6fLNZ2aZELgzYkRi6C/Od3hc5muPwnuOaFfQe8Fa/bhkbgGB8u+wGPdXGuI5/YcGyyspEMkzyFq262J15gc/PoPb9Gp8INJ2XAaz91zf5zIkJNJ9lPCNqMBz43C6N8H199j0ckMUwTrDg3yRbpp2L5NW8FakIYc2BsYrqNFwUYCibtz09dY9lFLsn+gkoIOR9T87xh9OPdBun/2fhwfybH+RlBIV/1ShmYGpIvFqK4ogucI4hI6zBRd5U5NFX9ozSr9g3oqa+aefhD0XqScdWiyWscW3Pw3+9/BUVvgLgb+CcrM7oNYes5EZ6huQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dY6b2MM6; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dY6b2MM6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d0rpC4X1nz2yFV
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Nov 2025 12:43:47 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 389A940707;
	Tue,  4 Nov 2025 01:43:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0699BC4CEFD;
	Tue,  4 Nov 2025 01:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762220625;
	bh=BX0tUVsyY8ldvnds1/e/y6kgPKJqlyj2E8lWQ44dxfo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dY6b2MM6lvQesY8UEelJfXc71chFYKuoyIOZKssRUSMQJxDm9jXPKotxE9/ABbFPu
	 XdSerDYLKzYzDqDQ6JtxN3d5froEQfTFFz5xPdBJiYV5fi7EtRoBao1e6KRqYwr3AY
	 4WLnVKWA2sLfmr9+9HcGjMrprpXu64yk6i9qhfJk1xH3AdHuzSaP7REg2SZctZwFBT
	 ziPcYiFBzusRmwzHTOosUeYKOg4gg5R34YL/8ezSb/+A5pYwNrmsMmzydnbJ1FjVaF
	 jXaQc0pHgng9HvscIjQuljf8jrhjAvtPL5qfzHDAlZO3QJ8dh49y79v1EdVD6oFICv
	 aPXmbZutFbm5Q==
Date: Mon, 3 Nov 2025 17:43:44 -0800
From: Kees Cook <kees@kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org, torvalds@linux-foundation.org,
	brauner@kernel.org, jack@suse.cz, raven@themaw.net,
	miklos@szeredi.hu, neil@brown.name, a.hindborg@kernel.org,
	linux-mm@kvack.org, linux-efi@vger.kernel.org,
	ocfs2-devel@lists.linux.dev, rostedt@goodmis.org,
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	paul@paul-moore.com, casey@schaufler-ca.com,
	linuxppc-dev@lists.ozlabs.org, john.johansen@canonical.com,
	selinux@vger.kernel.org, borntraeger@linux.ibm.com,
	bpf@vger.kernel.org
Subject: Re: [PATCH v2 18/50] convert pstore
Message-ID: <202511031743.3F127F8@keescook>
References: <20251028004614.393374-1-viro@zeniv.linux.org.uk>
 <20251028004614.393374-19-viro@zeniv.linux.org.uk>
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
In-Reply-To: <20251028004614.393374-19-viro@zeniv.linux.org.uk>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Oct 28, 2025 at 12:45:37AM +0000, Al Viro wrote:
> object creation by d_alloc_name()+d_add() in pstore_mkfile(), removal -
> via normal VFS codepaths (with ->unlink() using simple_unlink()) or
> in pstore_put_backend_records() via locked_recursive_removal()
> 
> Replace d_add() with d_make_persistent()+dput() - that's what really
> happens there.  The reference that goes into record->dentry is valid
> only until the unlink (and explicitly cleared by pstore_unlink()).
> 
> Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>

Thanks for the refactoring!

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook

