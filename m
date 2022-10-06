Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E15705F663A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 14:40:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mjrch3kvCz3dt6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 23:40:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=boaVkmFe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=tiop=2h=zx2c4.com=jason@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=boaVkmFe;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MjrTR0r3dz2xb4
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Oct 2022 23:33:46 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4BD8A6189D;
	Thu,  6 Oct 2022 12:33:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84CC2C433D6;
	Thu,  6 Oct 2022 12:33:28 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="boaVkmFe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1665059607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PDyor0OPorRMVekuFSJiAglRmrxBh1riIl1rICqIsks=;
	b=boaVkmFeWj/P/2mwQH9q1gX7LNlMIfDuuF/jF0E1iusdkGap18NZ9sMOKKXCenUfGu1kBs
	OsFuQiM99GfLC9GZQ0iQjPl+iTbCo2UXzxz3nN8lhLRAzO97rrmctM7VRTQNz+DRBcdhZZ
	cSGHfymmDp55cC4uDg3E8k04jFUD4XI=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2c48390d (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Thu, 6 Oct 2022 12:33:26 +0000 (UTC)
Date: Thu, 6 Oct 2022 06:33:15 -0600
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Jan Kara <jack@suse.cz>
Subject: Re: [f2fs-dev] [PATCH v1 3/5] treewide: use get_random_u32() when
 possible
Message-ID: <Yz7LCyIAHC6l5mG9@zx2c4.com>
References: <20221005214844.2699-1-Jason@zx2c4.com>
 <20221005214844.2699-4-Jason@zx2c4.com>
 <20221006084331.4bdktc2zlvbaszym@quack3>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221006084331.4bdktc2zlvbaszym@quack3>
X-Mailman-Approved-At: Thu, 06 Oct 2022 23:38:28 +1100
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
Cc: Andrew Lunn <andrew@lunn.ch>, "Darrick J . Wong" <djwong@kernel.org>, linux-block@vger.kernel.org, Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, dri-devel@lists.freedesktop.org, Andrii Nakryiko <andrii@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, linux-sctp@vger.kernel.org, "Md . Haris Iqbal" <haris.iqbal@ionos.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Christoph Hellwig <hch@lst.de>, Andy Gospodarek <andy@greyhouse.net>, Sergey Matyukevich <geomatsi@gmail.com>, Rohit Maheshwari <rohitm@chelsio.com>, Jozsef Kadlecsik <kadlec@netfilter.org>, Nilesh Javali <njavali@marvell.com>, Jean-Paul Roubelat <jpr@f6fbb.org>, Dan Williams <dan.j.williams@intel.com>, Dick Kennedy <dick.kennedy@broadcom.com>, Jay Vosburgh <j.vosburgh@gmail.com>, Potnuri Bharat Teja <bharat@chelsio.com>, Vinay Kumar Yadav <vinay.yadav@chelsio.com>, Arend van Spriel <aspriel@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, Igor Mitsyanko <imitsyanko@quantenna.com>, Andy Lutomirski <luto@kernel.org>
 , linux-hams@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Trond Myklebust <trond.myklebust@hammerspace.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, Michael Chan <michael.chan@broadcom.com>, linux-kernel@vger.kernel.org, Varun Prakash <varun@chelsio.com>, David Ahern <dsahern@kernel.org>, Chuck Lever <chuck.lever@oracle.com>, netfilter-devel@vger.kernel.org, linux-crypto@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>, Jan Kara <jack@suse.com>, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Claudiu Beznea <claudiu.beznea@microchip.com>, Sharvari Harisangam <sharvari.harisangam@nxp.com>, linux-fbdev@vger.kernel.org, linux-doc@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>, linux-wireless@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, Song Liu <song@kernel.org>, Eric Dumazet <edumazet@google.com>, target-devel@vger.kernel.org, John Stultz <jst
 ultz@google.com>, Stanislav Fomichev <sdf@google.com>, Gregory Greenman <gregory.greenman@intel.com>, drbd-dev@lists.linbit.com, dev@openvswitch.org, Leon Romanovsky <leon@kernel.org>, Helge Deller <deller@gmx.de>, Hugh Dickins <hughd@google.com>, James Smart <james.smart@broadcom.com>, Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>, Pravin B Shelar <pshelar@ovn.org>, Julian Anastasov <ja@ssi.bg>, coreteam@netfilter.org, Veaceslav Falico <vfalico@gmail.com>, Yonghong Song <yhs@fb.com>, Namjae Jeon <linkinjeon@kernel.org>, linux-media@vger.kernel.org, Ganapathi Bhat <ganapathi017@gmail.com>, linux-actions@lists.infradead.org, Simon Horman <horms@verge.net.au>, Jaegeuk Kim <jaegeuk@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Lars Ellenberg <lars.ellenberg@linbit.com>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Hao Luo <haoluo@google.com>, Theodore Ts'o <tytso@mit.edu>, Stephen Boyd <sboyd@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Florian Westphal <fw
 @strlen.de>, "David S . Miller" <davem@davemloft.net>, Jon Maloy <jmaloy@redhat.com>, Anna Schumaker <anna@kernel.org>, Yehezkel Bernat <YehezkelShB@gmail.com>, Jeff Layton <jlayton@kernel.org>, Haoyue Xu <xuhaoyue1@hisilicon.com>, Heiner Kallweit <hkallweit1@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-nvme@lists.infradead.org, Michal Januszewski <spock@gentoo.org>, linux-mtd@lists.infradead.org, kasan-dev@googlegroups.com, Cong Wang <xiyou.wangcong@gmail.com>, Thomas Sailer <t.sailer@alumni.ethz.ch>, Ajay Singh <ajay.kathat@microchip.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Sagi Grimberg <sagi@grimberg.me>, Daniel Borkmann <daniel@iogearbox.net>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, linux-rdma@vger.kernel.org, lvs-devel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>, Ilya Dryomov <idryomov@gmail.com>, Paolo Abeni <pabeni@redhat.co
 m>, Pablo Neira Ayuso <pablo@netfilter.org>, Marco Elver <elver@google.com>, Kees Cook <keescook@chromium.org>, Yury Norov <yury.norov@gmail.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, Hante Meuleman <hante.meuleman@broadcom.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Borislav Petkov <bp@alien8.de>, Keith Busch <kbusch@kernel.org>, ceph-devel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Franky Lin <franky.lin@broadcom.com>, linux-nfs@vger.kernel.org, linux-ext4@vger.kernel.org, Wenpeng Liang <liangwenpeng@huawei.com>, Neil Horman <nhorman@tuxdriver.com>, Xinming Hu <huxinming820@gmail.com>, linux-mmc@vger.kernel.org, Martin KaFai Lau <martin.lau@linux.dev>, linux-xfs@vger.kernel.org, Ying Xue <ying.xue@windriver.com>, Manish Rangankar <mrangankar@marvell.com>, Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>, linux-stm32@st-md-mailman.stormreply.com, Peter Zijlstra <peterz@infradead.o
 rg>, Ayush Sawal <ayush.sawal@chelsio.com>, KP Singh <kpsingh@kernel.org>, Amitkumar Karwar <amitkarwar@gmail.com>, linux-mm@kvack.org, Andreas Dilger <adilger.kernel@dilger.ca>, Akinobu Mita <akinobu.mita@gmail.com>, "H . Peter Anvin" <hpa@zytor.com>, Andreas Noever <andreas.noever@gmail.com>, Jiri Pirko <jiri@resnulli.us>, linux-f2fs-devel@lists.sourceforge.net, Jack Wang <jinpu.wang@ionos.com>, Steffen Klassert <steffen.klassert@secunet.com>, rds-devel@oss.oracle.com, Herbert Xu <herbert@gondor.apana.org.au>, linux-scsi@vger.kernel.org, dccp@vger.kernel.org, Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>, Jason Gunthorpe <jgg@ziepe.ca>, SHA-cyfmac-dev-list@infineon.com, Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, John Fastabend <john.fastabend@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, Michael Jamet <michael.jamet@intel.com>, Kalle Valo <
 kvalo@kernel.org>, Santosh Shilimkar <santosh.shilimkar@oracle.com>, Jamal Hadi Salim <jhs@mojatatu.com>, linux-raid@vger.kernel.org, Thomas Graf <tgraf@suug.ch>, Hannes Reinecke <hare@suse.de>, Xiubo Li <xiubli@redhat.com>, Dmitry Vyukov <dvyukov@google.com>, Jens Axboe <axboe@kernel.dk>, cake@lists.bufferbloat.net, brcm80211-dev-list.pdl@broadcom.com, Yishai Hadas <yishaih@nvidia.com>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, netdev@vger.kernel.org, Vlad Yasevich <vyasevich@gmail.com>, Philipp Reisner <philipp.reisner@linbit.com>, Stephen Hemminger <stephen@networkplumber.org>, Christoph =?utf-8?Q?B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>, Vinod Koul <vkoul@kernel.org>, tipc-discussion@lists.sourceforge.net, dmaengine@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, Sungjong Seo <sj1557.seo@samsung.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 06, 2022 at 10:43:31AM +0200, Jan Kara wrote:
> The code here is effectively doing the
> 
> 	parent_group = prandom_u32_max(ngroups);
> 
> Similarly here we can use prandom_u32_max(ngroups) like:
> 
> 		if (qstr) {
> 			...
> 			parent_group = hinfo.hash % ngroups;
> 		} else
> 			parent_group = prandom_u32_max(ngroups);

Nice catch. I'll move these to patch #1.


> > diff --git a/fs/ext4/mmp.c b/fs/ext4/mmp.c
> > index 9af68a7ecdcf..588cb09c5291 100644
> > --- a/fs/ext4/mmp.c
> > +++ b/fs/ext4/mmp.c
> > @@ -265,7 +265,7 @@ static unsigned int mmp_new_seq(void)
> >  	u32 new_seq;
> >  
> >  	do {
> > -		new_seq = prandom_u32();
> > +		new_seq = get_random_u32();
> >  	} while (new_seq > EXT4_MMP_SEQ_MAX);
> 
> OK, here we again effectively implement prandom_u32_max(EXT4_MMP_SEQ_MAX + 1).
> Just presumably we didn't want to use modulo here because EXT4_MMP_SEQ_MAX
> is rather big and so the resulting 'new_seq' would be seriously
> non-uniform.

I'm not handling this during this patch set, but if in the course of
review we find enough places that want actually uniformly bounded
integers, I'll implement efficient rejection sampling to clean up these
cases, with something faster and general, and add a new function for it.
So far this is the first case to come up, but we'll probably eventually
find others. So I'll make note of this.

Jason
