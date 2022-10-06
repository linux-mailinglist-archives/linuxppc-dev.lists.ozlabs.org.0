Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBF85F6054
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 06:54:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjfHY1J3tz2xGv
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 15:54:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=FnhfzhzY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=keescook@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=FnhfzhzY;
	dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mjdwf4Cd4z304J
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Oct 2022 15:38:08 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id u24so636102plq.12
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Oct 2022 21:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=+S5GQGZ6/D/Mg+joUObE0SvwDFyqkvRT2sP5/5vRQvk=;
        b=FnhfzhzYXlNcl6IxqwADyyzc747mTy8MU4rkgJN+LmLi1BBuM+8meOEr2rKBNA5cdb
         UV5cg1R4d2Z6xBRg09lXiXAPPCtiRk0FnLoDXMxi1ZwCUSCYDye4OaZgSAusHDiISi0X
         vF5wP8hNjXz8Z2pcn3GjqjTxVus9QcfOT5k48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=+S5GQGZ6/D/Mg+joUObE0SvwDFyqkvRT2sP5/5vRQvk=;
        b=Mm1P77oBKkXLyXFxHPYMv70asrWOrZLI3LrYgZiDD1WrFyLF/rQA2UhC/UZIoMGavx
         7hVHaRDdi1CFFTAhU+m8rtpcgU7G3ZxJJ7F0V9jxnQFeu8+0VA5zRV/foKZACxe3mFi2
         JTiYIJOgff+xHjEsavvows+PjOhbiZ8a73zQMaUCFU+l+0Kza1cT5w+mvKafFSimZils
         iDIvZbjzk9WUBcySj7ZiaYYr/UCfJZo2kCDmNPFYkh4JSuTjmmQcCLimU/uiWULnIaEc
         dEhtiHmpsR2m5Iz766oNwVUsGcjAKWN+dJ9azYrbIISnxyXVBSn5H7GBOHU1ffYiLH0P
         Y0PQ==
X-Gm-Message-State: ACrzQf0XGea5QSOH66kfhcwNnaeBf0EFjE3m4jezxzedF6UvwGfFjf1t
	kXFLT7BOHXwWvMKmWKYJn+CjhA==
X-Google-Smtp-Source: AMsMyM5wQShENjZofrpCE9JXF1y8+Mj33eJ2Bpuqg3wBtAV3umQgBeXMs02cH4EGpzIndWjF3gW38w==
X-Received: by 2002:a17:902:db0a:b0:178:2636:b6de with SMTP id m10-20020a170902db0a00b001782636b6demr2822346plx.58.1665031085103;
        Wed, 05 Oct 2022 21:38:05 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id l18-20020a17090aaa9200b001fd8316db51sm1928521pjq.7.2022.10.05.21.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 21:38:03 -0700 (PDT)
Date: Wed, 5 Oct 2022 21:38:02 -0700
From: Kees Cook <keescook@chromium.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH v1 2/5] treewide: use get_random_{u8,u16}() when possible
Message-ID: <202210052126.B34A2C62@keescook>
References: <20221005214844.2699-1-Jason@zx2c4.com>
 <20221005214844.2699-3-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221005214844.2699-3-Jason@zx2c4.com>
X-Mailman-Approved-At: Thu, 06 Oct 2022 15:52:03 +1100
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
Cc: Andrew Lunn <andrew@lunn.ch>, "Darrick J . Wong" <djwong@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, dri-devel@lists.freedesktop.org, Andrii Nakryiko <andrii@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, linux-sctp@vger.kernel.org, "Md . Haris Iqbal" <haris.iqbal@ionos.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Christoph Hellwig <hch@lst.de>, Andy Gospodarek <andy@greyhouse.net>, Sergey Matyukevich <geomatsi@gmail.com>, Rohit Maheshwari <rohitm@chelsio.com>, ceph-devel@vger.kernel.org, Jozsef Kadlecsik <kadlec@netfilter.org>, Nilesh Javali <njavali@marvell.com>, Jean-Paul Roubelat <jpr@f6fbb.org>, Dick Kennedy <dick.kennedy@broadcom.com>, Jay Vosburgh <j.vosburgh@gmail.com>, Potnuri Bharat Teja <bharat@chelsio.com>, Vinay Kumar Yadav <vinay.yadav@chelsio.com>, linux-nfs@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Igor Mitsyanko <imitsyanko@quantenna.com>, Andy Lutomirski <luto@kernel.org>, linux-hams@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, 
 Trond Myklebust <trond.myklebust@hammerspace.com>, linux-raid@vger.kernel.org, Neil Horman <nhorman@tuxdriver.com>, Hante Meuleman <hante.meuleman@broadcom.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, Michael Chan <michael.chan@broadcom.com>, linux-kernel@vger.kernel.org, Varun Prakash <varun@chelsio.com>, Chuck Lever <chuck.lever@oracle.com>, netfilter-devel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, Jiri Olsa <jolsa@kernel.org>, Jan Kara <jack@suse.com>, linux-fsdevel@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>, linux-media@vger.kernel.org, Claudiu Beznea <claudiu.beznea@microchip.com>, Sharvari Harisangam <sharvari.harisangam@nxp.com>, linux-fbdev@vger.kernel.org, linux-doc@vger.kernel.org, linux-mmc@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, Song Liu <song@kernel.org>, Eric Dumazet <edumazet@google.com>, target-devel@vger.kernel.org, John Stultz <jstultz@google.com>, Stanislav Fomichev <sdf@googl
 e.com>, Gregory Greenman <gregory.greenman@intel.com>, drbd-dev@lists.linbit.com, dev@openvswitch.org, Leon Romanovsky <leon@kernel.org>, Helge Deller <deller@gmx.de>, Hugh Dickins <hughd@google.com>, James Smart <james.smart@broadcom.com>, Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>, Pravin B Shelar <pshelar@ovn.org>, Julian Anastasov <ja@ssi.bg>, coreteam@netfilter.org, Veaceslav Falico <vfalico@gmail.com>, Yonghong Song <yhs@fb.com>, Namjae Jeon <linkinjeon@kernel.org>, linux-crypto@vger.kernel.org, Santosh Shilimkar <santosh.shilimkar@oracle.com>, Ganapathi Bhat <ganapathi017@gmail.com>, linux-actions@lists.infradead.org, Simon Horman <horms@verge.net.au>, Jaegeuk Kim <jaegeuk@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Hao Luo <haoluo@google.com>, Theodore Ts'o <tytso@mit.edu>, Stephen Boyd <sboyd@kernel.org>, Dennis Dalessandro <dennis.dalessandro@cornelisnetw
 orks.com>, Florian Westphal <fw@strlen.de>, Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>, Jon Maloy <jmaloy@redhat.com>, Vlad Yasevich <vyasevich@gmail.com>, Anna Schumaker <anna@kernel.org>, Yehezkel Bernat <YehezkelShB@gmail.com>, Haoyue Xu <xuhaoyue1@hisilicon.com>, Heiner Kallweit <hkallweit1@gmail.com>, linux-wireless@vger.kernel.org, Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-nvme@lists.infradead.org, Michal Januszewski <spock@gentoo.org>, linux-mtd@lists.infradead.org, kasan-dev@googlegroups.com, Cong Wang <xiyou.wangcong@gmail.com>, Thomas Sailer <t.sailer@alumni.ethz.ch>, Ajay Singh <ajay.kathat@microchip.com>, Xiubo Li <xiubli@redhat.com>, Sagi Grimberg <sagi@grimberg.me>, Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org, lvs-devel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>, Ilya Dryomov <idryomov
 @gmail.com>, Paolo Abeni <pabeni@redhat.com>, Pablo Neira Ayuso <pablo@netfilter.org>, Marco Elver <elver@google.com>, Yury Norov <yury.norov@gmail.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, Jamal Hadi Salim <jhs@mojatatu.com>, KP Singh <kpsingh@kernel.org>, Borislav Petkov <bp@alien8.de>, Keith Busch <kbusch@kernel.org>, Dan Williams <dan.j.williams@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Franky Lin <franky.lin@broadcom.com>, Arend van Spriel <aspriel@gmail.com>, linux-ext4@vger.kernel.org, Wenpeng Liang <liangwenpeng@huawei.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, Xinming Hu <huxinming820@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Jeff Layton <jlayton@kernel.org>, linux-xfs@vger.kernel.org, netdev@vger.kernel.org, Ying Xue <ying.xue@windriver.com>, Manish Rangankar <mrangankar@marvell.com>, "David S . Miller" <davem@davemloft.net>, Toke =?iso-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@toke.dk>, Vignesh Raghavendra <vigneshr@ti.com
 >, Peter Zijlstra <peterz@infradead.org>, "H . Peter Anvin" <hpa@zytor.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Amitkumar Karwar <amitkarwar@gmail.com>, linux-mm@kvack.org, Andreas Dilger <adilger.kernel@dilger.ca>, Ayush Sawal <ayush.sawal@chelsio.com>, Andreas Noever <andreas.noever@gmail.com>, Jiri Pirko <jiri@resnulli.us>, linux-f2fs-devel@lists.sourceforge.net, Jack Wang <jinpu.wang@ionos.com>, Steffen Klassert <steffen.klassert@secunet.com>, rds-devel@oss.oracle.com, Herbert Xu <herbert@gondor.apana.org.au>, linux-scsi@vger.kernel.org, dccp@vger.kernel.org, Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>, Jaehoon Chung <jh80.chung@samsung.com>, Jason Gunthorpe <jgg@ziepe.ca>, SHA-cyfmac-dev-list@infineon.com, Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>, John Fastabend <john.fastabend@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, Michael Jamet <michael.jamet@intel.co
 m>, Kalle Valo <kvalo@kernel.org>, Chao Yu <chao@kernel.org>, Akinobu Mita <akinobu.mita@gmail.com>, linux-block@vger.kernel.org, dmaengine@vger.kernel.org, Hannes Reinecke <hare@suse.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Dmitry Vyukov <dvyukov@google.com>, Jens Axboe <axboe@kernel.dk>, cake@lists.bufferbloat.net, brcm80211-dev-list.pdl@broadcom.com, Yishai Hadas <yishaih@nvidia.com>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, linuxppc-dev@lists.ozlabs.org, David Ahern <dsahern@kernel.org>, Philipp Reisner <philipp.reisner@linbit.com>, Stephen Hemminger <stephen@networkplumber.org>, Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>, Vinod Koul <vkoul@kernel.org>, tipc-discussion@lists.sourceforge.net, Thomas Graf <tgraf@suug.ch>, Johannes Berg <johannes@sipsolutions.net>, Sungjong Seo <sj1557.seo@samsung.com>, Martin KaFai Lau <martin.lau@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 05, 2022 at 11:48:41PM +0200, Jason A. Donenfeld wrote:
> Rather than truncate a 32-bit value to a 16-bit value or an 8-bit value,
> simply use the get_random_{u8,u16}() functions, which are faster than
> wasting the additional bytes from a 32-bit value.
> 
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

Same question about "mechanism of transformation".

> diff --git a/drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_cm.c b/drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_cm.c
> index ddfe9208529a..ac452a0111a9 100644
> --- a/drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_cm.c
> +++ b/drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_cm.c
> @@ -1467,7 +1467,7 @@ static void make_established(struct sock *sk, u32 snd_isn, unsigned int opt)
>  	tp->write_seq = snd_isn;
>  	tp->snd_nxt = snd_isn;
>  	tp->snd_una = snd_isn;
> -	inet_sk(sk)->inet_id = prandom_u32();
> +	inet_sk(sk)->inet_id = get_random_u16();
>  	assign_rxopt(sk, opt);
>  
>  	if (tp->rcv_wnd > (RCV_BUFSIZ_M << 10))

This one I had to go look at -- inet_id is u16, so yeah. :)

> diff --git a/lib/test_vmalloc.c b/lib/test_vmalloc.c
> index 56ffaa8dd3f6..0131ed2cd1bd 100644
> --- a/lib/test_vmalloc.c
> +++ b/lib/test_vmalloc.c
> @@ -80,7 +80,7 @@ static int random_size_align_alloc_test(void)
>  	int i;
>  
>  	for (i = 0; i < test_loop_count; i++) {
> -		rnd = prandom_u32();
> +		rnd = get_random_u8();
>  
>  		/*
>  		 * Maximum 1024 pages, if PAGE_SIZE is 4096.

This wasn't obvious either, but it looks like it's because it never
consumes more than u8?

> diff --git a/net/netfilter/nf_nat_core.c b/net/netfilter/nf_nat_core.c
> index 7981be526f26..57c7686ac485 100644
> --- a/net/netfilter/nf_nat_core.c
> +++ b/net/netfilter/nf_nat_core.c
> @@ -468,7 +468,7 @@ static void nf_nat_l4proto_unique_tuple(struct nf_conntrack_tuple *tuple,
>  	if (range->flags & NF_NAT_RANGE_PROTO_OFFSET)
>  		off = (ntohs(*keyptr) - ntohs(range->base_proto.all));
>  	else
> -		off = prandom_u32();
> +		off = get_random_u16();
>  
>  	attempts = range_size;

Yup, u16 off;

> diff --git a/net/sched/sch_sfb.c b/net/sched/sch_sfb.c
> index 2829455211f8..7eb70acb4d58 100644
> --- a/net/sched/sch_sfb.c
> +++ b/net/sched/sch_sfb.c
> @@ -379,7 +379,7 @@ static int sfb_enqueue(struct sk_buff *skb, struct Qdisc *sch,
>  		goto enqueue;
>  	}
>  
> -	r = prandom_u32() & SFB_MAX_PROB;
> +	r = get_random_u16() & SFB_MAX_PROB;
>  
>  	if (unlikely(r < p_min)) {
>  		if (unlikely(p_min > SFB_MAX_PROB / 2)) {

include/uapi/linux/pkt_sched.h:#define SFB_MAX_PROB 0xFFFF

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
