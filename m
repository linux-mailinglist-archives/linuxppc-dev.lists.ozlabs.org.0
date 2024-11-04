Return-Path: <linuxppc-dev+bounces-2841-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 743E89BBC4C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2024 18:48:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XhzV51DGGz2yPS;
	Tue,  5 Nov 2024 04:48:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730742525;
	cv=none; b=QqNvS+P+rEcjkT32S/PD7U8RH5bMtg67LAEOFei7KMywq6TtlzLjGEC63qqc5tzs3MFeIcEICIZ0UzGM8HdHC36HOsMvjlQYOXfFLz2uGG4ovJXI94UlHAR0l5RwaKBoTZcmuFW3Cg0ppeWryjFyzhpMoqUdSb1MO0HZOaiEK4wumOdvq94QmW0lWWRnnXjG4vhEa4xK1GiSvy2w/WReSE7ePI1oFhwb0W62c9/UAeLoB+XTWUlRs4Q9sqQiuN/6VI4hAwqeB59oqG4bz1n/bzDnDPHTmyZx/0PB5ouGjVkjD0pKy6MgRPRVTJPGQNENlk5Wl0OpqvAuinzt+46Gww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730742525; c=relaxed/relaxed;
	bh=jOpQChbady85VjphGfbgQ0josSjOZ9BtFVZ3HbNMAFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O09zDU/A86Rmbq8GcOqu6GfwWmkwTZnoOaRClcOiK31v2YZ78hSC2FhO5dOlbWfT92Eb/qNCVO1mhmHUK0MGWlubtnYxZSA59LmS11omLPerywHPk6MNRdMaOt/VXns2GGI3gmKR25PP4xppzJAvUidPByxlvhwhbigtLqP66d8JX0/PgLflWU+gs1JsoSpnxK+V+B38sySc9x+bmZGWjslXsNBBOiZY4a9Vypc/7kgTMKn7g2OkEas7hJ30AGjG/7C/ZE97zgcmJKKS5F0nSH3pnTrwSWxxL3vw81fHwfF8fJZGeanqSP8quBg7kLwZq/zuo+e2moNQaaJqP8pWaA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RG0ZZ45e; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RG0ZZ45e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XhzV415h1z2yFD
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2024 04:48:44 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0EB5EA431F6;
	Mon,  4 Nov 2024 17:46:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1421C4CECE;
	Mon,  4 Nov 2024 17:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730742520;
	bh=kyMZ9fV6X+51trgRY65w1AUDjMP2XEnEX7GkvQFyuQo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RG0ZZ45eSLTeSuURvGHB3h65F9t7QbkI04hRi4PIn9RQya+KVuOq+cKYwcM7OIRag
	 ftffa9p0RPzhxKxbKbO1phJPPDnrPKDiu3Z4Itvr9Wls0R3DzSPdYDwIWB6GC4b2Kn
	 OEWSQb/cisXjv+NDzmcx6uuXNdVsmOSyH1jBzLk86RwIVvV7yoI0yJMI8N5O1tLxWZ
	 sqPAibypRsiDduXZx2vz4SdLoEWaYuAYo/l7nO/C5PoaF6LQixrBB1eQNUAosrKHye
	 /gCeCfoWgbjXS3QMM1TfccoGnuhihV/zkZVDdun5Dof7x1e0ZdWeQe1z6JZskIC3qV
	 2uU8b6EJ5uv3w==
Date: Mon, 4 Nov 2024 17:48:39 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org, x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v3 15/18] ext4: switch to using the crc32c library
Message-ID: <20241104174839.GA1049313@google.com>
References: <20241103223154.136127-1-ebiggers@kernel.org>
 <20241103223154.136127-16-ebiggers@kernel.org>
 <20241104155900.GH21832@frogsfrogsfrogs>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104155900.GH21832@frogsfrogsfrogs>
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Nov 04, 2024 at 07:59:00AM -0800, Darrick J. Wong wrote:
> Hmm.  Looking at your git branch (which was quite helpful to link to!) I
> think for XFS we don't need to change the crc32c() calls, and the only
> porting work that needs to be done is mirroring this Kconfig change?
> And that doesn't even need to be done until someone wants to get rid of
> CONFIG_LIBCRC32C, right?

That's correct, no porting work is required now.  'select LIBCRC32C' should be
replaced with 'select CRC32', but that can be done later.

> > @@ -3278,15 +3263,11 @@ extern void ext4_group_desc_csum_set(struct super_block *sb, __u32 group,
> >  extern int ext4_register_li_request(struct super_block *sb,
> >  				    ext4_group_t first_not_zeroed);
> >  
> >  static inline int ext4_has_metadata_csum(struct super_block *sb)
> >  {
> > -	WARN_ON_ONCE(ext4_has_feature_metadata_csum(sb) &&
> > -		     !EXT4_SB(sb)->s_chksum_driver);
> > -
> > -	return ext4_has_feature_metadata_csum(sb) &&
> > -	       (EXT4_SB(sb)->s_chksum_driver != NULL);
> > +	return ext4_has_feature_metadata_csum(sb);
> >  }
> 
> Nit: Someone might want to
> s/ext4_has_metadata_csum/ext4_has_feature_metadata_csum/ here to get rid
> of the confusingly named trivial helper.
> 

Yes, that should be done as a follow-up patch.

> Otherwise this logic looks ok to me, so
> Reviewed-by: Darrick J. Wong <djwong@kernel.org>
> 
> --D

Thanks,

- Eric

