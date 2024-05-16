Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF458C79AE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2024 17:48:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=c/2Q+N1d;
	dkim=fail reason="signature verification failed" header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=FVqCAeJ3;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=NzJEOyRg;
	dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=UCdB6xDN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VgDz23Q2Kz3ft8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2024 01:48:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=c/2Q+N1d;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=FVqCAeJ3;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=NzJEOyRg;
	dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=UCdB6xDN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de; envelope-from=dsterba@suse.cz; receiver=lists.ozlabs.org)
X-Greylist: delayed 528 seconds by postgrey-1.37 at boromir; Fri, 17 May 2024 01:48:06 AEST
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VgDyG48t5z3flf
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2024 01:48:05 +1000 (AEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5A39F34B83;
	Thu, 16 May 2024 15:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1715873941;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ljb6iEdJgsES4YgAa+ABFGeaYU8BOkPNGhpZeJJA+Wo=;
	b=c/2Q+N1dkaved4rxJ9+tgDhlTJe03v3OzUeTIVVomtDlnsSoYvAzbI7t32WimCGbnSfY/8
	urAAUngq4LpGGb7E8W3hx/YicoFHfXgnGO7+9CUqABK4lhuetDIQq4SznZNZMwZmCt9SGG
	+dk30/JHXZeNo1+LX2HDZZFfKRG601U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1715873941;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ljb6iEdJgsES4YgAa+ABFGeaYU8BOkPNGhpZeJJA+Wo=;
	b=FVqCAeJ3M7TxQyL1og5veAbgfTe9qn7V7nEGNgeQAtEyn2ZJgOVKS1KCIb48Sjcuwqp7wL
	SmLF2ajeoevQiHCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1715873940;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ljb6iEdJgsES4YgAa+ABFGeaYU8BOkPNGhpZeJJA+Wo=;
	b=NzJEOyRgsy22iK7fykjrnuqY4IgZwezv17pI46JJFLp2ynAgO5Zc8Ie+lz5yCDZniODdeq
	6jqCVqpXhEB+h0l5HA9vxMR3MpcB56X+SJQP2S+EsJLi/1qeu9qeb3RJI8iAL/gZkJTDXb
	ZfrRx/5dcbRw/BXyhmoCRcnbYmdTVAo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1715873940;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ljb6iEdJgsES4YgAa+ABFGeaYU8BOkPNGhpZeJJA+Wo=;
	b=UCdB6xDNIMRsO3HA5tu2S4282E0WZoxkVklicNH/IkQyFGX8APG1bimeH/j0Lp60gNYZXr
	rz7wl1dPx0I0u2Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 36F6E13991;
	Thu, 16 May 2024 15:39:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id seAlDZQoRmZeCAAAD6G6ig
	(envelope-from <dsterba@suse.cz>); Thu, 16 May 2024 15:39:00 +0000
Date: Thu, 16 May 2024 17:38:54 +0200
From: David Sterba <dsterba@suse.cz>
To: syzbot <syzbot+adec8406ad17413d4c06@syzkaller.appspotmail.com>
Subject: Re: [syzbot] WARNING in btrfs_free_reserved_data_space_noquota
Message-ID: <20240516153854.GE4449@suse.cz>
References: <000000000000fac82605ee97fb72@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000000000000fac82605ee97fb72@google.com>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Spam-Level: 
X-Spamd-Result: default: False [-1.50 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=2325e409a9a893e1];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	HAS_REPLYTO(0.30)[dsterba@suse.cz];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[adec8406ad17413d4c06];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[csgroup.eu,fb.com,suse.com,toxicpanda.com,vger.kernel.org,lists.ozlabs.org,ellerman.id.au,gmail.com,kernel.org,googlegroups.com,zte.com.cn];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,syzkaller.appspot.com:url]
X-Spam-Score: -1.50
X-Spam-Flag: NO
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
Cc: shuah@kernel.org, syzkaller-bugs@googlegroups.com, josef@toxicpanda.com, linux-kernel@vger.kernel.org, clm@fb.com, npiggin@gmail.com, linux-kselftest@vger.kernel.org, ye.xingchen@zte.com.cn, dsterba@suse.com, linuxppc-dev@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 29, 2022 at 12:43:38AM -0800, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    b7b275e60bcd Linux 6.1-rc7
> git tree:       upstream
> console+strace: https://syzkaller.appspot.com/x/log.txt?x=158a7b73880000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=2325e409a9a893e1
> dashboard link: https://syzkaller.appspot.com/bug?extid=adec8406ad17413d4c06
> compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=169ccb75880000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17bf7153880000
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/525233126d34/disk-b7b275e6.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/e8299bf41400/vmlinux-b7b275e6.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/eebf691dbf6f/bzImage-b7b275e6.xz
> mounted in repro: https://storage.googleapis.com/syzbot-assets/5423c2d2ad62/mount_0.gz
> 
> The issue was bisected to:
> 
> commit c814bf958926ff45a9c1e899bd001006ab6cfbae
> Author: ye xingchen <ye.xingchen@zte.com.cn>
> Date:   Tue Aug 16 10:51:06 2022 +0000
> 
>     powerpc/selftests: Use timersub() for gettimeofday()
> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=118c3d03880000
> final oops:     https://syzkaller.appspot.com/x/report.txt?x=138c3d03880000
> console output: https://syzkaller.appspot.com/x/log.txt?x=158c3d03880000
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+adec8406ad17413d4c06@syzkaller.appspotmail.com
> Fixes: c814bf958926 ("powerpc/selftests: Use timersub() for gettimeofday()")
> 
> RDX: 0000000000000001 RSI: 0000000020000280 RDI: 0000000000000005
> RBP: 00007ffd32e91c70 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000008000000 R11: 0000000000000246 R12: 0000000000000006
> R13: 00007ffd32e91cb0 R14: 00007ffd32e91c90 R15: 0000000000000006
>  </TASK>
> ------------[ cut here ]------------
> WARNING: CPU: 1 PID: 3764 at fs/btrfs/space-info.h:122 btrfs_space_info_free_bytes_may_use fs/btrfs/space-info.h:154 [inline]
> WARNING: CPU: 1 PID: 3764 at fs/btrfs/space-info.h:122 btrfs_free_reserved_data_space_noquota+0x219/0x2b0 fs/btrfs/delalloc-space.c:179

Most likely fixed by 9e65bfca24cf1d ("btrfs: fix
qgroup_free_reserved_data int overflow"), it's an 32bit type overflow
that can cause various accounting errors, the function names match the
context.

#syz fix: btrfs: fix qgroup_free_reserved_data int overflow
