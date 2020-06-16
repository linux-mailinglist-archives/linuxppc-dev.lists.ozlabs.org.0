Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E13361FB520
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 16:56:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49mWW40twmzDqZH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jun 2020 00:56:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=dsterba@suse.cz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.cz
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49mWKV2ytLzDqTJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jun 2020 00:48:22 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3F73AAAE8;
 Tue, 16 Jun 2020 14:48:18 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
 id 50CC9DA7C3; Tue, 16 Jun 2020 16:48:04 +0200 (CEST)
Date: Tue, 16 Jun 2020 16:48:04 +0200
From: David Sterba <dsterba@suse.cz>
To: Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v4 3/3] btrfs: Use kfree() in btrfs_ioctl_get_subvol_info()
Message-ID: <20200616144804.GD27795@twin.jikos.cz>
Mail-Followup-To: dsterba@suse.cz, Waiman Long <longman@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Howells <dhowells@redhat.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Joe Perches <joe@perches.com>, Matthew Wilcox <willy@infradead.org>,
 David Rientjes <rientjes@google.com>,
 Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 "Jason A . Donenfeld" <Jason@zx2c4.com>, linux-mm@kvack.org,
 keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-amlogic@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 virtualization@lists.linux-foundation.org, netdev@vger.kernel.org,
 linux-ppp@vger.kernel.org, wireguard@lists.zx2c4.com,
 linux-wireless@vger.kernel.org, devel@driverdev.osuosl.org,
 linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
 linux-btrfs@vger.kernel.org, linux-cifs@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, ecryptfs@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-bluetooth@vger.kernel.org,
 linux-wpan@vger.kernel.org, linux-sctp@vger.kernel.org,
 linux-nfs@vger.kernel.org, tipc-discussion@lists.sourceforge.net,
 linux-security-module@vger.kernel.org,
 linux-integrity@vger.kernel.org
References: <20200616015718.7812-1-longman@redhat.com>
 <20200616015718.7812-4-longman@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200616015718.7812-4-longman@redhat.com>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
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
Reply-To: dsterba@suse.cz
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>, Michal Hocko <mhocko@suse.com>,
 linux-btrfs@vger.kernel.org, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 David Sterba <dsterba@suse.cz>, David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org, linux-sctp@vger.kernel.org, keyrings@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-stm32@st-md-mailman.stormreply.com,
 devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
 linux-scsi@vger.kernel.org, James Morris <jmorris@namei.org>,
 Matthew Wilcox <willy@infradead.org>, linux-wpan@vger.kernel.org,
 David Rientjes <rientjes@google.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, linux-pm@vger.kernel.org,
 ecryptfs@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 virtualization@lists.linux-foundation.org, linux-integrity@vger.kernel.org,
 linux-nfs@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-security-module@vger.kernel.org,
 target-devel@vger.kernel.org, tipc-discussion@lists.sourceforge.net,
 linux-crypto@vger.kernel.org, Johannes Weiner <hannes@cmpxchg.org>,
 Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, netdev@vger.kernel.org,
 wireguard@lists.zx2c4.com, linux-ppp@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 15, 2020 at 09:57:18PM -0400, Waiman Long wrote:
> In btrfs_ioctl_get_subvol_info(), there is a classic case where kzalloc()
> was incorrectly paired with kzfree(). According to David Sterba, there
> isn't any sensitive information in the subvol_info that needs to be
> cleared before freeing. So kfree_sensitive() isn't really needed,
> use kfree() instead.
> 
> Reported-by: David Sterba <dsterba@suse.cz>
> Signed-off-by: Waiman Long <longman@redhat.com>
> ---
>  fs/btrfs/ioctl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/btrfs/ioctl.c b/fs/btrfs/ioctl.c
> index f1dd9e4271e9..e8f7c5f00894 100644
> --- a/fs/btrfs/ioctl.c
> +++ b/fs/btrfs/ioctl.c
> @@ -2692,7 +2692,7 @@ static int btrfs_ioctl_get_subvol_info(struct file *file, void __user *argp)
>  	btrfs_put_root(root);
>  out_free:
>  	btrfs_free_path(path);
> -	kfree_sensitive(subvol_info);
> +	kfree(subvol_info);

I would rather merge a patch doing to kzfree -> kfree instead of doing
the middle step to switch it to kfree_sensitive. If it would help
integration of your patchset I can push it to the next rc so there are
no kzfree left in the btrfs code. Treewide change like that can take
time so it would be one less problem to care about for you.
