Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E558B8086A2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 12:22:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=tg8NdadU;
	dkim=fail reason="signature verification failed" header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=eNkRt1wW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SmBgv33Ykz3cmg
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 22:22:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=tg8NdadU;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=eNkRt1wW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=jack@suse.cz; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sm7lx3xmjz30K6
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Dec 2023 20:10:37 +1100 (AEDT)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5B8831F897;
	Thu,  7 Dec 2023 09:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1701940224; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jXiKfid97FD5zi8RqmP75wazePMuM2Vj4JZ4H26JF/w=;
	b=tg8NdadUlk4VfBBiX/KnTc8KWn4/+I2eqU3OCsMmSGO5fGxGo+xFF7FC1+cL85+pnkxgh6
	+2Q+t+yvWpRrlmhVvY0iaqUjhOk6aDapKv8aWDgxXaeYBRQUq2bq9mHOv8yIv2mkt3uJBW
	DjcnaOKBqBG38BR6qn1JnsOv3SGRVLU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1701940224;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jXiKfid97FD5zi8RqmP75wazePMuM2Vj4JZ4H26JF/w=;
	b=eNkRt1wWHc2B/3UiJ7gBmgVmSJJtzZTtEviOYNX31SorNi0ot/Q0TzM7nhemVkTB8kzvHE
	aOrpBsXvOqOVy6BQ==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 34B3813907;
	Thu,  7 Dec 2023 09:10:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id w3HWDACMcWWqPwAAn2gu4w
	(envelope-from <jack@suse.cz>); Thu, 07 Dec 2023 09:10:24 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 7AF80A07C7; Thu,  7 Dec 2023 10:10:23 +0100 (CET)
Date: Thu, 7 Dec 2023 10:10:23 +0100
From: Jan Kara <jack@suse.cz>
To: Yury Norov <yury.norov@gmail.com>
Subject: Re: [PATCH v2 00/35] bitops: add atomic find_bit() operations
Message-ID: <20231207091023.kioii5mgmnphrvl4@quack3>
References: <20231203192422.539300-1-yury.norov@gmail.com>
 <20231204185101.ddmkvsr2xxsmoh2u@quack3>
 <ZXAFM2VZugdhM3oE@yury-ThinkPad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZXAFM2VZugdhM3oE@yury-ThinkPad>
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: **
X-Spam-Score: 2.70
X-Spamd-Result: default: False [2.70 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 TO_DN_SOME(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_GT_50(0.00)[100];
	 FREEMAIL_TO(0.00)[gmail.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FORGED_RECIPIENTS(2.00)[m:yury.norov@gmail.com,m:davem@davemloft.net,m:jejb@linux.ibm.com,m:haris.iqbal@ionos.com,m:akinobu.mita@gmail.com,m:akpm@linux-foundation.org,m:andersson@kernel.org,m:bp@alien8.de,m:brauner@kernel.org,m:dave.hansen@linux.intel.com,m:ecree.xilinx@gmail.com,m:edumazet@google.com,m:fenghua.yu@intel.com,m:geert@linux-m68k.org,m:gregory.greenman@intel.com,m:hughd@google.com,m:kuba@kernel.org,m:axboe@kernel.dk,m:jirislaby@kernel.org,m:kvalo@kernel.org,m:kgraul@linux.ibm.com,m:isdn@linux-pingi.de,m:keescook@chromium.org,m:leon@kernel.org,m:mark.rutland@arm.com,m:habetsm.xilinx@gmail.com,m:mchehab@kernel.org,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:peterz@infradead.org,m:dalias@libc.org,m:robh@kernel.org,m:robin.murphy@arm.com,m:seanjc@google.com,m:xueshuai@linux.alibaba.com,m:rostedt@goodmis.org,m:tsbogend@alpha.franken.de,m:tglx@linutronix.de,m:wenjia@linux.ibm.com,m:will@kernel.org,m:alsa-devel@alsa-project.org,m:linux-net-drivers@amd.com,m:mpi3mr-linuxdrv.pdl
 @broadcom.com,m:x86@kernel.org,m:mirsad.todorovac@alu.unizg.hr,m:willy@infradead.org,m:andriy.shevchenko@linux.intel.com,m:maxim.kuvyrkov@linaro.org,m:klimov.linux@gmail.com,m:bvanassche@acm.org,s:s.shtylyov@omp.ru];
	 BAYES_HAM(-0.00)[40.06%];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[wp.pl,xs4all.nl];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_MATCH_ENVRCPT_SOME(0.00)[];
	 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 MID_RHS_NOT_FQDN(0.50)[];
	 FREEMAIL_CC(0.00)[suse.cz,vger.kernel.org,davemloft.net,zytor.com,linux.ibm.com,microsoft.com,ionos.com,gmail.com,linux-foundation.org,kernel.org,alien8.de,nvidia.com,opensource.wdc.com,linux.intel.com,suse.de,google.com,intel.com,linux-m68k.org,linuxfoundation.org,xs4all.nl,redhat.com,perex.cz,ziepe.ca,kernel.dk,resnulli.us,linux-pingi.de,chromium.org,arm.com,ellerman.id.au,monstr.eu,suse.com,infradead.org,realtek.com,libc.org,linux.alibaba.com,wp.pl,goodmis.org,alpha.franken.de,linutronix.de,users.sourceforge.jp,marvell.com,alsa-project.org,lists.infradead.org,lists.linux.dev,lists.linux-m68k.org,amd.com,lists.ozlabs.org,broadcom.com,alu.unizg.hr,rasmusvillemoes.dk,linaro.org,acm.org,omp.ru];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[]
X-Spam-Flag: NO
X-Mailman-Approved-At: Thu, 07 Dec 2023 22:21:36 +1100
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
Cc: linux-sh@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, Hans Verkuil <hverkuil@xs4all.nl>, "Md. Haris Iqbal" <haris.iqbal@ionos.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Bart Van Assche <bvanassche@acm.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Jiri Pirko <jiri@resnulli.us>, Christian Brauner <brauner@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Alexey Klimov <klimov.linux@gmail.com>, Sergey Shtylyov <s.shtylyov@omp.ru>, Thomas Gleixner <tglx@linutronix.de>, Karsten Keil <isdn@linux-pingi.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, GR-QLogic-Storage-Upstream@marvell.com, Andrew Morton <akpm@linux-foundation.org>, Mark Rutland <mark.rutland@arm.com>, alsa-devel@alsa-project.org, Dave Hansen <dave.hansen@linux.intel.com>, Eric Dumazet <edumazet@google.com>, Gregory Greenman <gregory.greenman@intel.com>, linux-s390@vger.kernel.org, Valentin Schneider <vschneid@redhat
 .com>, Leon Romanovsky <leon@kernel.org>, Will Deacon <will@kernel.org>, mpi3mr-linuxdrv.pdl@broadcom.com, Hugh Dickins <hughd@google.com>, iommu@lists.linux.dev, Martin Habets <habetsm.xilinx@gmail.com>, linux-media@vger.kernel.org, Stanislaw Gruszka <stf_xl@wp.pl>, linux-arm-msm@vger.kernel.org, Wenjia Zhang <wenjia@linux.ibm.com>, linux-m68k@lists.linux-m68k.org, linux-arm-kernel@lists.infradead.org, Sean Christopherson <seanjc@google.com>, Oliver Neukum <oneukum@suse.com>, Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>, linux-pci@vger.kernel.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-hyperv@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, linux-rdma@vger.kernel.org, Damien Le Moal <damien.lemoal@opensource.wdc.com>, ath10k@lists.infradead.org, David Disseldorp <ddiss@suse.de>, Paolo Abeni <pabeni@redhat.com>, Fenghua Yu <fenghua.yu@intel.com>, Kees Cook <keescook@chromium.org>, "James E.J. Bot
 tomley" <jejb@linux.ibm.com>, Akinobu Mita <akinobu.mita@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, Borislav Petkov <bp@alien8.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Edward Cree <ecree.xilinx@gmail.com>, Shuai Xue <xueshuai@linux.alibaba.com>, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Rich Felker <dalias@libc.org>, Jan Kara <jack@suse.cz>, kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, Ping-Ke Shih <pkshih@realtek.com>, linux-scsi@vger.kernel.org, linux-net-drivers@amd.com, x86@kernel.org, Jason Gunthorpe <jgg@ziepe.ca>, Ingo Molnar <mingo@redhat.com>, linux-serial@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, Chaitanya Kulkarni <kch@nvidia.com>, Kalle Valo <kvalo@kernel.org>, linux-block@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, linux-sound@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.
 com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Jens Axboe <axboe@kernel.dk>, Michal Simek <monstr@monstr.eu>, Yoshinori Sato <ysato@users.sourceforge.jp>, linuxppc-dev@lists.ozlabs.org, Bjorn Andersson <andersson@kernel.org>, linux-mips@vger.kernel.org, linux-bluetooth@vger.kernel.org, dmaengine@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Robin Murphy <robin.murphy@arm.com>, Karsten Graul <kgraul@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue 05-12-23 21:22:59, Yury Norov wrote:
> On Mon, Dec 04, 2023 at 07:51:01PM +0100, Jan Kara wrote:
> > > This series is a result of discussion [1]. All find_bit() functions imply
> > > exclusive access to the bitmaps. However, KCSAN reports quite a number
> > > of warnings related to find_bit() API. Some of them are not pointing
> > > to real bugs because in many situations people intentionally allow
> > > concurrent bitmap operations.
> > > 
> > > If so, find_bit() can be annotated such that KCSAN will ignore it:
> > > 
> > >         bit = data_race(find_first_bit(bitmap, nbits));
> > 
> > No, this is not a correct thing to do. If concurrent bitmap changes can
> > happen, find_first_bit() as it is currently implemented isn't ever a safe
> > choice because it can call __ffs(0) which is dangerous as you properly note
> > above. I proposed adding READ_ONCE() into find_first_bit() / find_next_bit()
> > implementation to fix this issue but you disliked that. So other option we
> > have is adding find_first_bit() and find_next_bit() variants that take
> > volatile 'addr' and we have to use these in code like xas_find_chunk()
> > which cannot be converted to your new helpers.
> 
> Here is some examples when concurrent operations with plain find_bit()
> are acceptable:
> 
>  - two threads running find_*_bit(): safe wrt ffs(0) and returns correct
>    value, because underlying bitmap is unchanged;
>  - find_next_bit() in parallel with set or clear_bit(), when modifying
>    a bit prior to the start bit to search: safe and correct;
>  - find_first_bit() in parallel with set_bit(): safe, but may return wrong
>    bit number;
>  - find_first_zero_bit() in parallel with clear_bit(): same as above.
> 
> In last 2 cases find_bit() may not return a correct bit number, but
> it may be OK if caller requires any (not exactly first) set or clear
> bit, correspondingly.
> 
> In such cases, KCSAN may be safely silenced.

True - but these are special cases. In particular the case in xas_find_chunk()
is not any of these special cases. It is using find_next_bit() which is can
be racing with clear_bit(). So what are your plans for such usecase?

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
