Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CE887A39
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2019 14:34:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 464l733n3NzDrCG
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2019 22:34:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 464l3J3DFrzDqP9
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Aug 2019 22:31:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 464l3F4BlGz9sP7;
 Fri,  9 Aug 2019 22:31:21 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: bugzilla-daemon@bugzilla.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Subject: Re: [Bug 204371] BUG kmalloc-4k (Tainted: G W ): Object padding
 overwritten
In-Reply-To: <bug-204371-206035-3TOBxXIdie@https.bugzilla.kernel.org/>
References: <bug-204371-206035@https.bugzilla.kernel.org/>
 <bug-204371-206035-3TOBxXIdie@https.bugzilla.kernel.org/>
Date: Fri, 09 Aug 2019 22:31:21 +1000
Message-ID: <8736iatt9i.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

bugzilla-daemon@bugzilla.kernel.org writes:
> https://bugzilla.kernel.org/show_bug.cgi?id=204371
>
> --- Comment #10 from David Sterba (dsterba@suse.com) ---
> In my case it happened on 5.3-rc3, with a strestest. The same machine has been
> running fstests periodically, with slab debug on, but there are no slab reports
> like that.
>
> [ 8516.870046] BUG kmalloc-4k (Not tainted): Poison overwritten                 
> [ 8516.875873]
> -----------------------------------------------------------------------------   
>
> [ 8516.885864] Disabling lock debugging due to kernel taint                     
> [ 8516.891312] INFO: 0x000000001c70c8c9-0x000000003cd1e164. First byte 0x16
> instead of 0x6b                                                                 
> [ 8516.899717] INFO: Allocated in btrfs_read_tree_root+0x46/0x120 [btrfs]
> age=1769 cpu=7 pid=8717                                                         
> [ 8516.908544]  __slab_alloc.isra.53+0x3e/0x70                                  
> [ 8516.912861]  kmem_cache_alloc_trace+0x1b0/0x330                              
> [ 8516.917581]  btrfs_read_tree_root+0x46/0x120 [btrfs]                         
> [ 8516.922737]  btrfs_read_fs_root+0xe/0x40 [btrfs]                             
> [ 8516.927552]  create_reloc_root+0x17f/0x2a0 [btrfs]                           
> [ 8516.932536]  btrfs_init_reloc_root+0x72/0xe0 [btrfs]                         
> [ 8516.937686]  record_root_in_trans+0xbb/0xf0 [btrfs]                          
> [ 8516.942750]  btrfs_record_root_in_trans+0x50/0x70 [btrfs]                    
> [ 8516.948340]  start_transaction+0xa1/0x550 [btrfs]                            
> [ 8516.953237]  __btrfs_prealloc_file_range+0xca/0x490 [btrfs]                  
> [ 8516.959003]  btrfs_prealloc_file_range+0x10/0x20 [btrfs]                     
> [ 8516.964509]  prealloc_file_extent_cluster+0x13e/0x2b0 [btrfs]                
> [ 8516.970447]  relocate_file_extent_cluster+0x8d/0x530 [btrfs]                 
> [ 8516.976305]  relocate_data_extent+0x80/0x110 [btrfs]                         
> [ 8516.981469]  relocate_block_group+0x473/0x720 [btrfs]                        
> [ 8516.986711]  btrfs_relocate_block_group+0x15f/0x2c0 [btrfs]                  

So this is looking more like it could be a btrfs bug, given you've both
hit it using btrfs but on different platforms.

cheers
