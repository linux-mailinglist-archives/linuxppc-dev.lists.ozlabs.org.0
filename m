Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B83D24EC620
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Mar 2022 16:05:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KT7VZ4pSsz3c1L
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Mar 2022 01:05:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ef6F+hrx;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=R4xgioPB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.28; helo=smtp-out1.suse.de;
 envelope-from=osalvador@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=ef6F+hrx; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=R4xgioPB; 
 dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KT7Tx0swDz2xtJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Mar 2022 01:04:36 +1100 (AEDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6769C21613;
 Wed, 30 Mar 2022 14:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1648649074; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3HMcf6VpPdUtSHMVGDhdxTY9zIcILTXot1rIgQ5P1hw=;
 b=ef6F+hrxT7jsNU5wyGaDpWxZI/bcW+2pKvn+iRcd8z7sWGdhsLkagx60oPooXJve1pi+Y9
 FPnRPPjwFAghwQpOSMuNv4+areI5A0klDnvvC2Mqlz2k6gttuEgRDihl0sDgfC1IO224Vu
 OdzOSjrvy29y0MNdWyihG3F6s/zHGcY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1648649074;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3HMcf6VpPdUtSHMVGDhdxTY9zIcILTXot1rIgQ5P1hw=;
 b=R4xgioPBIA28fZdQiFSKgD2Pu95fR2in5TKCC19Wxsz5AkvxXc3d9MYefMe6NeZTcEqCeJ
 zLS3RNxUBQRlRQDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 09B9E13A60;
 Wed, 30 Mar 2022 14:04:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kboWO3FjRGJyagAAMHmgww
 (envelope-from <osalvador@suse.de>); Wed, 30 Mar 2022 14:04:33 +0000
Date: Wed, 30 Mar 2022 16:04:32 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc/numa: Handle partially initialized numa nodes
Message-ID: <YkRjcF61+nbIZfvJ@localhost.localdomain>
References: <20220330135123.1868197-1-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220330135123.1868197-1-srikar@linux.vnet.ibm.com>
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
Cc: Michal Hocko <mhocko@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>, linux-mm@kvack.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 30, 2022 at 07:21:23PM +0530, Srikar Dronamraju wrote:
> With commit 09f49dca570a ("mm: handle uninitialized numa nodes
> gracefully") NODE_DATA for even a memoryless/cpuless node is partially
> initialized at boot time.
> 
> Before onlining the node, current Powerpc code checks for NODE_DATA to
> be NULL. However since NODE_DATA is partially initialized, this check
> will end up always being false.
> 
> This causes hotplugging a CPU to a memoryless/cpuless node to fail.
> 
> Before adding CPUs
> $ numactl -H
> available: 1 nodes (4)
> node 4 cpus: 0 1 2 3 4 5 6 7
> node 4 size: 97372 MB
> node 4 free: 95545 MB
> node distances:
> node   4
> 4:  10
> 
> $ lparstat
> System Configuration
> type=Dedicated mode=Capped smt=8 lcpu=1 mem=99709440 kB cpus=0 ent=1.00
> 
> %user  %sys %wait    %idle    physc %entc lbusy   app  vcsw phint
> ----- ----- -----    -----    ----- ----- ----- ----- ----- -----
> 2.66  2.67  0.16    94.51     0.00  0.00  5.33  0.00 67749     0
> 
> After hotplugging 32 cores
> $ numactl -H
> node 4 cpus: 0 1 2 3 4 5 6 7 120 121 122 123 124 125 126 127 128 129 130
> 131 132 133 134 135 136 137 138 139 140 141 142 143 144 145 146 147 148
> 149 150 151 152 153 154 155 156 157 158 159 160 161 162 163 164 165 166
> 167 168 169 170 171 172 173 174 175
> node 4 size: 97372 MB
> node 4 free: 93636 MB
> node distances:
> node   4
> 4:  10
> 
> $ lparstat
> System Configuration
> type=Dedicated mode=Capped smt=8 lcpu=33 mem=99709440 kB cpus=0 ent=33.00
> 
> %user  %sys %wait    %idle    physc %entc lbusy   app  vcsw phint
> ----- ----- -----    -----    ----- ----- ----- ----- ----- -----
> 0.04  0.02  0.00    99.94     0.00  0.00  0.06  0.00 1128751     3
> 
> As we can see numactl is listing only 8 cores while lparstat is showing
> 33 cores.
> 
> Also dmesg is showing messages like:
> [ 2261.318350 ] BUG: arch topology borken
> [ 2261.318357 ]      the DIE domain not a subset of the NODE domain
> 
> Fixes: 09f49dca570a ("mm: handle uninitialized numa nodes gracefully")
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-mm@kvack.org
> Cc: Michal Hocko <mhocko@kernel.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Reported-by: Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>
> Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>

Acked-by: Oscar Salvador <osalvador@suse.de>

Thanks Srikar!

> ---
>  arch/powerpc/mm/numa.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> index b9b7fefbb64b..13022d734951 100644
> --- a/arch/powerpc/mm/numa.c
> +++ b/arch/powerpc/mm/numa.c
> @@ -1436,7 +1436,7 @@ int find_and_online_cpu_nid(int cpu)
>  	if (new_nid < 0 || !node_possible(new_nid))
>  		new_nid = first_online_node;
>  
> -	if (NODE_DATA(new_nid) == NULL) {
> +	if (!node_online(new_nid)) {
>  #ifdef CONFIG_MEMORY_HOTPLUG
>  		/*
>  		 * Need to ensure that NODE_DATA is initialized for a node from
> -- 
> 2.27.0
> 
> 

-- 
Oscar Salvador
SUSE Labs
