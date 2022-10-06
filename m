Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 615EF5F713A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Oct 2022 00:39:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mk5wL1zYdz3dyN
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Oct 2022 09:39:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=H/B1Gsir;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.88; helo=mga01.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=H/B1Gsir;
	dkim-atps=neutral
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mjs5h4qbYz2xJS
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Oct 2022 00:01:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665061304; x=1696597304;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ru6CnBvVhIEhYJCAeuuxpRt9HHeJLOxAuoa9BjBuh8k=;
  b=H/B1Gsiry+PpJLT0I0eNujMYVYupdWuDxkK9Yuwu4q4f2oX6f36aTmVz
   NANEUB1V5zGzHnYc41cxoPzwlz+DG6m6JimYdog4RSCXnVpQMV7+fly9v
   DjdvaxQlLQ3qGKdoLzjmQ52qJavnfNm0uFbuABUjcCBPlK7zzNlqanbyp
   5tp4u7ow3pWSGZ/UQipc49btsueTWPkIIi0h6xiP1mV6psqB3VEhPsRP8
   dP454AERjWdnqn/6OHruh+AHNSz9HC8YMGTaAmdsaf6G0nUx9+0xxzVXr
   X72dBnYTVeo3VgqVR638KuuWuT8Xlx2wyim0BPduyHYfGMi0mxaLSruXI
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10491"; a="329861785"
X-IronPort-AV: E=Sophos;i="5.95,163,1661842800"; 
   d="scan'208";a="329861785"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2022 06:01:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10491"; a="767139765"
X-IronPort-AV: E=Sophos;i="5.95,163,1661842800"; 
   d="scan'208";a="767139765"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP; 06 Oct 2022 06:01:22 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ogQUx-0039Oq-2J;
	Thu, 06 Oct 2022 16:01:11 +0300
Date: Thu, 6 Oct 2022 16:01:11 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [f2fs-dev] [PATCH v1 3/5] treewide: use get_random_u32() when
 possible
Message-ID: <Yz7Rl7BXamKQhRzH@smile.fi.intel.com>
References: <20221005214844.2699-1-Jason@zx2c4.com>
 <20221005214844.2699-4-Jason@zx2c4.com>
 <20221006084331.4bdktc2zlvbaszym@quack3>
 <Yz7LCyIAHC6l5mG9@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yz7LCyIAHC6l5mG9@zx2c4.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Approved-At: Fri, 07 Oct 2022 09:35:18 +1100
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
 @strlen.de>, "David S . Miller" <davem@davemloft.net>, Jon Maloy <jmaloy@redhat.com>, Anna Schumaker <anna@kernel.org>, Yehezkel Bernat <YehezkelShB@gmail.com>, Jeff Layton <jlayton@kernel.org>, Haoyue Xu <xuhaoyue1@hisilicon.com>, Heiner Kallweit <hkallweit1@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-nvme@lists.infradead.org, Michal Januszewski <spock@gentoo.org>, linux-mtd@lists.infradead.org, kasan-dev@googlegroups.com, Cong Wang <xiyou.wangcong@gmail.com>, Thomas Sailer <t.sailer@alumni.ethz.ch>, Ajay Singh <ajay.kathat@microchip.com>, Sagi Grimberg <sagi@grimberg.me>, Daniel Borkmann <daniel@iogearbox.net>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, linux-rdma@vger.kernel.org, lvs-devel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>, Ilya Dryomov <idryomov@gmail.com>, Paolo Abeni <pabeni@redhat.com>, Pablo Neira Ayuso <pablo@netfilter.org>, Marco El
 ver <elver@google.com>, Kees Cook <keescook@chromium.org>, Yury Norov <yury.norov@gmail.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, Hante Meuleman <hante.meuleman@broadcom.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Borislav Petkov <bp@alien8.de>, Keith Busch <kbusch@kernel.org>, ceph-devel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Franky Lin <franky.lin@broadcom.com>, linux-nfs@vger.kernel.org, linux-ext4@vger.kernel.org, Wenpeng Liang <liangwenpeng@huawei.com>, Neil Horman <nhorman@tuxdriver.com>, Xinming Hu <huxinming820@gmail.com>, linux-mmc@vger.kernel.org, Martin KaFai Lau <martin.lau@linux.dev>, linux-xfs@vger.kernel.org, Ying Xue <ying.xue@windriver.com>, Manish Rangankar <mrangankar@marvell.com>, Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>, Toke =?iso-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@toke.dk>, Jan Kara <jack@suse.cz>, linux-stm32@st-md-mailman.stormreply.com, Peter Zijlstra <peterz@infradead.org>, Ayush Sawal <ayush.saw
 al@chelsio.com>, KP Singh <kpsingh@kernel.org>, Amitkumar Karwar <amitkarwar@gmail.com>, linux-mm@kvack.org, Andreas Dilger <adilger.kernel@dilger.ca>, Akinobu Mita <akinobu.mita@gmail.com>, "H . Peter Anvin" <hpa@zytor.com>, Andreas Noever <andreas.noever@gmail.com>, Jiri Pirko <jiri@resnulli.us>, linux-f2fs-devel@lists.sourceforge.net, Jack Wang <jinpu.wang@ionos.com>, Steffen Klassert <steffen.klassert@secunet.com>, rds-devel@oss.oracle.com, Herbert Xu <herbert@gondor.apana.org.au>, linux-scsi@vger.kernel.org, dccp@vger.kernel.org, Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>, Jason Gunthorpe <jgg@ziepe.ca>, SHA-cyfmac-dev-list@infineon.com, Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, John Fastabend <john.fastabend@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, Michael Jamet <michael.jamet@intel.com>, Kalle Valo <kvalo@kernel.org>, Santosh 
 Shilimkar <santosh.shilimkar@oracle.com>, Jamal Hadi Salim <jhs@mojatatu.com>, linux-raid@vger.kernel.org, Thomas Graf <tgraf@suug.ch>, Hannes Reinecke <hare@suse.de>, Xiubo Li <xiubli@redhat.com>, Dmitry Vyukov <dvyukov@google.com>, Jens Axboe <axboe@kernel.dk>, cake@lists.bufferbloat.net, brcm80211-dev-list.pdl@broadcom.com, Yishai Hadas <yishaih@nvidia.com>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, netdev@vger.kernel.org, Vlad Yasevich <vyasevich@gmail.com>, Philipp Reisner <philipp.reisner@linbit.com>, Stephen Hemminger <stephen@networkplumber.org>, Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>, Vinod Koul <vkoul@kernel.org>, tipc-discussion@lists.sourceforge.net, dmaengine@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, Sungjong Seo <sj1557.seo@samsung.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 06, 2022 at 06:33:15AM -0600, Jason A. Donenfeld wrote:
> On Thu, Oct 06, 2022 at 10:43:31AM +0200, Jan Kara wrote:

...

> > The code here is effectively doing the
> > 
> > 	parent_group = prandom_u32_max(ngroups);
> > 
> > Similarly here we can use prandom_u32_max(ngroups) like:
> > 
> > 		if (qstr) {
> > 			...
> > 			parent_group = hinfo.hash % ngroups;
> > 		} else
> > 			parent_group = prandom_u32_max(ngroups);
> 
> Nice catch. I'll move these to patch #1.

I believe coccinelle is able to handle this kind of code as well, so Kees'
proposal to use it seems more plausible since it's less error prone and more
flexible / powerful.

-- 
With Best Regards,
Andy Shevchenko


