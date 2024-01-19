Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B9E832309
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jan 2024 02:36:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pnmxjqCf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TGMfT0SRSz3by2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jan 2024 12:36:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pnmxjqCf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=djwong@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TGMdZ0vFcz30Pp
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jan 2024 12:36:02 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 117B7B81A94;
	Fri, 19 Jan 2024 01:35:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61ACAC433C7;
	Fri, 19 Jan 2024 01:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705628157;
	bh=/ZfBCWmKyNYBScnBAqemNsyShCkWcxOBncpAtpEWVpQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pnmxjqCfMbdtcQd4B/aZ9FYiMlXjDpLoOG5if9v8CV8fFE2+Ckq1ZKGT0saqx8VE3
	 Rl6gCUzJVaF2ufyuLQR0lu9WDrcW/buZCPitTWDfs+vLE2xDRz79W2O1L9JINJyUnU
	 LimS0XUSQ7FgR3fXW/L6sGaPlbZRCQCJ8StLrTXPe98HbBJNw63HKKyXv2cHcaPtyK
	 HA3yD/hG61bInR4Iqp7+mVZ4WMxLmOm/sTYxhup5HfgNhCjUWE3E6TWYvU2A6FafCQ
	 +ksYWfTKzyTWFQJhNsqh96iha2FSaWOrUd5D2shSOi50ilKgXEJNSLAXRF7NyT+1Jl
	 +xspb4K52Rtxg==
Date: Thu, 18 Jan 2024 17:35:56 -0800
From: "Darrick J. Wong" <djwong@kernel.org>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Subject: Re: [RFC PATCH 2/3] fs: remove duplicate ifdefs
Message-ID: <20240119013556.GT674499@frogsfrogsfrogs>
References: <20240118080326.13137-1-sshegde@linux.ibm.com>
 <20240118080326.13137-3-sshegde@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240118080326.13137-3-sshegde@linux.ibm.com>
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
Cc: linux-ntfs-dev@lists.sourceforge.net, linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org, peterz@infradead.org, linuxppc-dev@lists.ozlabs.org, mingo@kernel.org, anton@tuxera.com, chandan.babu@oracle.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 18, 2024 at 01:33:25PM +0530, Shrikanth Hegde wrote:
> when a ifdef is used in the below manner, second one could be considered as
> duplicate.
> 
> ifdef DEFINE_A
> ...code block...
> ifdef DEFINE_A
> ...code block...
> endif
> ...code block...
> endif
> 
> There are few places in fs code where above pattern was seen.
> No functional change is intended here. It only aims to improve code
> readability.
> 
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
>  fs/ntfs/inode.c    | 2 --
>  fs/xfs/xfs_sysfs.c | 4 ----
>  2 files changed, 6 deletions(-)
> 
> diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
> index aba1e22db4e9..d2c8622d53d1 100644
> --- a/fs/ntfs/inode.c
> +++ b/fs/ntfs/inode.c
> @@ -2859,11 +2859,9 @@ int ntfs_truncate(struct inode *vi)
>   *
>   * See ntfs_truncate() description above for details.
>   */
> -#ifdef NTFS_RW
>  void ntfs_truncate_vfs(struct inode *vi) {
>  	ntfs_truncate(vi);
>  }
> -#endif
> 
>  /**
>   * ntfs_setattr - called from notify_change() when an attribute is being changed
> diff --git a/fs/xfs/xfs_sysfs.c b/fs/xfs/xfs_sysfs.c
> index 17485666b672..d2391eec37fe 100644
> --- a/fs/xfs/xfs_sysfs.c
> +++ b/fs/xfs/xfs_sysfs.c
> @@ -193,7 +193,6 @@ always_cow_show(
>  }
>  XFS_SYSFS_ATTR_RW(always_cow);
> 
> -#ifdef DEBUG
>  /*
>   * Override how many threads the parallel work queue is allowed to create.
>   * This has to be a debug-only global (instead of an errortag) because one of
> @@ -260,7 +259,6 @@ larp_show(
>  	return snprintf(buf, PAGE_SIZE, "%d\n", xfs_globals.larp);
>  }
>  XFS_SYSFS_ATTR_RW(larp);
> -#endif /* DEBUG */
> 
>  STATIC ssize_t
>  bload_leaf_slack_store(
> @@ -319,10 +317,8 @@ static struct attribute *xfs_dbg_attrs[] = {
>  	ATTR_LIST(log_recovery_delay),
>  	ATTR_LIST(mount_delay),
>  	ATTR_LIST(always_cow),
> -#ifdef DEBUG
>  	ATTR_LIST(pwork_threads),
>  	ATTR_LIST(larp),
> -#endif

The xfs part seems fine to me bcause I think some bot already
complained about this...

Reviewed-by: Darrick J. Wong <djwong@kernel.org>

--D

>  	ATTR_LIST(bload_leaf_slack),
>  	ATTR_LIST(bload_node_slack),
>  	NULL,
> --
> 2.39.3
> 
> 
