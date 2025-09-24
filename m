Return-Path: <linuxppc-dev+bounces-12562-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B3398B9B187
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Sep 2025 19:42:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cX4154cV4z306S;
	Thu, 25 Sep 2025 03:42:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758733022;
	cv=none; b=jSbwuwepSEiENcGaruiclPhSJNXwBancSKkLp+7fhHoi7qq1fI5l5FWfGEsjog4uIXp6ChEfz6oCCH9w1DvtFXrcjhd3mOSuBSxvUAJZivUeZ7PZI8MSYm5H4hT8IttDgZ4EqbGxSiIrIhiWO6z1BT8LzG1pxrA3Vn5nMTaIFtWGortpyETQ1NKLiarW2rg8l1/9z6QK5Jp+1kb3ZZaU25+tHCGvxDrkBxeMD/OUy8h+ZRcPR3ERByJ+zDOXCfm1R0EkUBcgbh1Nb+WwN6VJu6p//Yuf+Xf8aT5cGIXRQspMXFCgPqwR8qL+JNgrCoq6Xks0/1LlYnWAt8SjiftChA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758733022; c=relaxed/relaxed;
	bh=wItarYwJVipfmi89AjibX164xiYQ1sw1xgqIMHATn9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IECj4ISocZazjxomJRhC5r/Waz3fuxaX/OUbEit13xyXp3h/tsNm7Od3UdtjQGJjD3mHIdyQKh8meqEnM2FgM9VyPUQrX8lfEkbJZd2sQ2t8lzTRRlhhaLYc82Mcll85TIe2xA4nZ9MfO+R6m8oiAdNaVNU8IpANqnoLj4J2cqpNK3IU+0X+sHAxd2yUUq9M4B+GpRJ/g/2jsQM01czSb87+6a1Cf3RPsYjLq7LAA5ulzPfqgYljhD2uAP87hGrDSZXUpNTtg59fIFfg65BL47bVOPdkBod8ng4v6XoHe2ZQepqLhVOpppWCxVrYUY1w+q2mOMSDRjFLfeJZAYruWg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=evilplan.org; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=jlbec@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=evilplan.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=jlbec@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cX30l43WZz2yqP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Sep 2025 02:56:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=wItarYwJVipfmi89AjibX164xiYQ1sw1xgqIMHATn9c=; b=ADQuNtgDqCh42nShQdrRdwoDNL
	naHjDqhRxe/feBE3gx7YI+GF3SiATwjEKGTxF5HTe/Rd8zeJIPmiziHcLoJCArwg1LMjkST8yjMX2
	ICMQXn/VCEHj9XYcI5uyQ+z2vU1vDXRjgolv9kx1bsRE24R9kbKPxdEuZwyofsQb1h+8kmqDxmSvE
	RFGVyb/ITBh0FNHHuxEIh9mQxZOJejY+vTU5rnl3xDxkQaIqjkZC/dq692Uo/WRCE5uDVByN675eh
	qEjeBUgMKKK9qemuFENVjEtRnyWVd9FbPVfb+wYmBC8z4RcHVsS9yZrtq+r6BEE1D0owQ3AOE/asm
	tCqspHew==;
Received: from jlbec by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1SnC-00000008hCv-35Ks;
	Wed, 24 Sep 2025 16:56:34 +0000
Date: Wed, 24 Sep 2025 09:56:30 -0700
From: Joel Becker <jlbec@evilplan.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org, torvalds@linux-foundation.org,
	brauner@kernel.org, jack@suse.cz, raven@themaw.net,
	miklos@szeredi.hu, a.hindborg@kernel.org, linux-mm@kvack.org,
	linux-efi@vger.kernel.org, ocfs2-devel@lists.linux.dev,
	kees@kernel.org, rostedt@goodmis.org, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org, paul@paul-moore.com,
	casey@schaufler-ca.com, linuxppc-dev@lists.ozlabs.org,
	borntraeger@linux.ibm.com
Subject: Re: [PATCH 08/39] configfs, securityfs: kill_litter_super() not
 needed
Message-ID: <aNQivg5O_Rx3WxlG@google.com>
Mail-Followup-To: Al Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel@vger.kernel.org, torvalds@linux-foundation.org,
	brauner@kernel.org, jack@suse.cz, raven@themaw.net,
	miklos@szeredi.hu, a.hindborg@kernel.org, linux-mm@kvack.org,
	linux-efi@vger.kernel.org, ocfs2-devel@lists.linux.dev,
	kees@kernel.org, rostedt@goodmis.org, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org, paul@paul-moore.com,
	casey@schaufler-ca.com, linuxppc-dev@lists.ozlabs.org,
	borntraeger@linux.ibm.com
References: <20250920074156.GK39973@ZenIV>
 <20250920074759.3564072-1-viro@zeniv.linux.org.uk>
 <20250920074759.3564072-8-viro@zeniv.linux.org.uk>
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
In-Reply-To: <20250920074759.3564072-8-viro@zeniv.linux.org.uk>
X-Burt-Line: Trees are cool.
X-Red-Smith: Ninety feet between bases is perhaps as close as man has ever
 come to perfection.
Sender: Joel Becker <jlbec@ftp.linux.org.uk>
X-Spam-Status: No, score=0.2 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Reviewed-by: Joel Becker <jlbec@evilplan.org>

On Sat, Sep 20, 2025 at 08:47:27AM +0100, Al Viro wrote:
> These are guaranteed to be empty by the time they are shut down;
> both are single-instance and there is an internal mount maintained
> for as long as there is any contents.
> 
> Both have that internal mount pinned by every object in root.
> 
> In other words, kill_litter_super() boils down to kill_anon_super()
> for those.
> 
> Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
> ---
>  fs/configfs/mount.c | 2 +-
>  security/inode.c    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/configfs/mount.c b/fs/configfs/mount.c
> index 740f18b60c9d..fa66e25f0d75 100644
> --- a/fs/configfs/mount.c
> +++ b/fs/configfs/mount.c
> @@ -116,7 +116,7 @@ static struct file_system_type configfs_fs_type = {
>  	.owner		= THIS_MODULE,
>  	.name		= "configfs",
>  	.init_fs_context = configfs_init_fs_context,
> -	.kill_sb	= kill_litter_super,
> +	.kill_sb	= kill_anon_super,
>  };
>  MODULE_ALIAS_FS("configfs");
>  
> diff --git a/security/inode.c b/security/inode.c
> index 43382ef8896e..bf7b5e2e6955 100644
> --- a/security/inode.c
> +++ b/security/inode.c
> @@ -70,7 +70,7 @@ static struct file_system_type fs_type = {
>  	.owner =	THIS_MODULE,
>  	.name =		"securityfs",
>  	.init_fs_context = securityfs_init_fs_context,
> -	.kill_sb =	kill_litter_super,
> +	.kill_sb =	kill_anon_super,
>  };
>  
>  /**
> -- 
> 2.47.3
> 
> 

-- 

The Graham Corollary:

	The longer a socially-moderated news website exists, the
	probability of an old Paul Graham link appearing at the top
	approaches certainty.

			http://www.jlbec.org/
			jlbec@evilplan.org

