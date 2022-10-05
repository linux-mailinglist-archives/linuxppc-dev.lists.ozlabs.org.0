Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9F05F5DA9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 02:24:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjXHX3XxVz3dsn
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 11:24:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=MyoLjpfr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=srs0=wwun=2g=zx2c4.com=jason@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=MyoLjpfr;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MjSsm2ygyz2xfV
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Oct 2022 08:50:04 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7F989B81F61;
	Wed,  5 Oct 2022 21:49:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4939AC43150;
	Wed,  5 Oct 2022 21:49:43 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="MyoLjpfr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1665006576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BHxPzZbPZr1j2h7LFCj0OfovuxJhDALGxfZLeORAP2c=;
	b=MyoLjpfrwBXDJF9+S5NNHB45HMY1t4TdP9Qenyw5bMRDhcNexzgzqqu5Aq0F32m4MVVv6U
	KtXB6pGlLhGWJHugYSUvXiaYJNoKHVYqjuPYmZCgcIKr5zBEddmmF/e0AqewxDURyBhZRY
	FJzxkkOjB0ZWcu2DPWHY5xT5HYh1H9U=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ce79751b (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Wed, 5 Oct 2022 21:49:36 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/5] treewide: use get_random_{u8,u16}() when possible
Date: Wed,  5 Oct 2022 23:48:41 +0200
Message-Id: <20221005214844.2699-3-Jason@zx2c4.com>
In-Reply-To: <20221005214844.2699-1-Jason@zx2c4.com>
References: <20221005214844.2699-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 06 Oct 2022 11:21:39 +1100
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
 Trond Myklebust <trond.myklebust@hammerspace.com>, linux-raid@vger.kernel.org, Neil Horman <nhorman@tuxdriver.com>, Hante Meuleman <hante.meuleman@broadcom.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, Michael Chan <michael.chan@broadcom.com>, Varun Prakash <varun@chelsio.com>, Chuck Lever <chuck.lever@oracle.com>, netfilter-devel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, Jiri Olsa <jolsa@kernel.org>, Jan Kara <jack@suse.com>, linux-fsdevel@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>, linux-media@vger.kernel.org, Claudiu Beznea <claudiu.beznea@microchip.com>, Sharvari Harisangam <sharvari.harisangam@nxp.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>, linux-doc@vger.kernel.org, linux-mmc@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, Song Liu <song@kernel.org>, Eric Dumazet <edumazet@google.com>, target-devel@vger.kernel.org, John Stultz <jstultz@google.com>, Stanislav Fomichev <sdf@google.com>, Gregory Gre
 enman <gregory.greenman@intel.com>, drbd-dev@lists.linbit.com, dev@openvswitch.org, Leon Romanovsky <leon@kernel.org>, Helge Deller <deller@gmx.de>, Hugh Dickins <hughd@google.com>, James Smart <james.smart@broadcom.com>, Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>, Pravin B Shelar <pshelar@ovn.org>, Julian Anastasov <ja@ssi.bg>, coreteam@netfilter.org, Veaceslav Falico <vfalico@gmail.com>, Yonghong Song <yhs@fb.com>, Namjae Jeon <linkinjeon@kernel.org>, linux-crypto@vger.kernel.org, Santosh Shilimkar <santosh.shilimkar@oracle.com>, Ganapathi Bhat <ganapathi017@gmail.com>, linux-actions@lists.infradead.org, Simon Horman <horms@verge.net.au>, Jaegeuk Kim <jaegeuk@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Hao Luo <haoluo@google.com>, Theodore Ts'o <tytso@mit.edu>, Stephen Boyd <sboyd@kernel.org>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Florian 
 Westphal <fw@strlen.de>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Jon Maloy <jmaloy@redhat.com>, Vlad Yasevich <vyasevich@gmail.com>, Anna Schumaker <anna@kernel.org>, Yehezkel Bernat <YehezkelShB@gmail.com>, Haoyue Xu <xuhaoyue1@hisilicon.com>, Heiner Kallweit <hkallweit1@gmail.com>, linux-wireless@vger.kernel.org, Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-fbdev@vger.kernel.org, linux-nvme@lists.infradead.org, Michal Januszewski <spock@gentoo.org>, linux-mtd@lists.infradead.org, kasan-dev@googlegroups.com, Cong Wang <xiyou.wangcong@gmail.com>, Thomas Sailer <t.sailer@alumni.ethz.ch>, Ajay Singh <ajay.kathat@microchip.com>, Xiubo Li <xiubli@redhat.com>, Sagi Grimberg <sagi@grimberg.me>, Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org, lvs-devel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>, Ilya Dryomov
  <idryomov@gmail.com>, Paolo Abeni <pabeni@redhat.com>, Pablo Neira Ayuso <pablo@netfilter.org>, Marco Elver <elver@google.com>, Kees Cook <keescook@chromium.org>, Yury Norov <yury.norov@gmail.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, Jamal Hadi Salim <jhs@mojatatu.com>, KP Singh <kpsingh@kernel.org>, Borislav Petkov <bp@alien8.de>, Keith Busch <kbusch@kernel.org>, Dan Williams <dan.j.williams@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Franky Lin <franky.lin@broadcom.com>, Arend van Spriel <aspriel@gmail.com>, linux-ext4@vger.kernel.org, Wenpeng Liang <liangwenpeng@huawei.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, Xinming Hu <huxinming820@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Jeff Layton <jlayton@kernel.org>, linux-xfs@vger.kernel.org, netdev@vger.kernel.org, Ying Xue <ying.xue@windriver.com>, Manish Rangankar <mrangankar@marvell.com>, "David S . Miller" <davem@davemloft.net>, =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <tok
 e@toke.dk>, Vignesh Raghavendra <vigneshr@ti.com>, Peter Zijlstra <peterz@infradead.org>, "H . Peter Anvin" <hpa@zytor.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Amitkumar Karwar <amitkarwar@gmail.com>, linux-mm@kvack.org, Andreas Dilger <adilger.kernel@dilger.ca>, Ayush Sawal <ayush.sawal@chelsio.com>, Andreas Noever <andreas.noever@gmail.com>, Jiri Pirko <jiri@resnulli.us>, linux-f2fs-devel@lists.sourceforge.net, Jack Wang <jinpu.wang@ionos.com>, Steffen Klassert <steffen.klassert@secunet.com>, rds-devel@oss.oracle.com, Herbert Xu <herbert@gondor.apana.org.au>, linux-scsi@vger.kernel.org, dccp@vger.kernel.org, Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>, Jaehoon Chung <jh80.chung@samsung.com>, Jason Gunthorpe <jgg@ziepe.ca>, SHA-cyfmac-dev-list@infineon.com, Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>, John Fastabend <john.fastabend@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Manivannan Sadhasivam <mani@ke
 rnel.org>, Michael Jamet <michael.jamet@intel.com>, Kalle Valo <kvalo@kernel.org>, Chao Yu <chao@kernel.org>, Akinobu Mita <akinobu.mita@gmail.com>, linux-block@vger.kernel.org, dmaengine@vger.kernel.org, Hannes Reinecke <hare@suse.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Dmitry Vyukov <dvyukov@google.com>, Jens Axboe <axboe@kernel.dk>, cake@lists.bufferbloat.net, brcm80211-dev-list.pdl@broadcom.com, Yishai Hadas <yishaih@nvidia.com>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, linuxppc-dev@lists.ozlabs.org, David Ahern <dsahern@kernel.org>, Philipp Reisner <philipp.reisner@linbit.com>, Stephen Hemminger <stephen@networkplumber.org>, =?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>, Vinod Koul <vkoul@kernel.org>, tipc-discussion@lists.sourceforge.net, Thomas Graf <tgraf@suug.ch>, Johannes Berg <johannes@sipsolutions.net>, Sungjong Seo <sj1557.seo@samsung.com>, Martin KaFai Lau <martin.lau@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rather than truncate a 32-bit value to a 16-bit value or an 8-bit value,
simply use the get_random_{u8,u16}() functions, which are faster than
wasting the additional bytes from a 32-bit value.

Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 crypto/testmgr.c                                          | 8 ++++----
 drivers/media/common/v4l2-tpg/v4l2-tpg-core.c             | 2 +-
 drivers/media/test-drivers/vivid/vivid-radio-rx.c         | 4 ++--
 .../net/ethernet/chelsio/inline_crypto/chtls/chtls_cm.c   | 2 +-
 drivers/net/hamradio/baycom_epp.c                         | 2 +-
 drivers/net/hamradio/hdlcdrv.c                            | 2 +-
 drivers/net/hamradio/yam.c                                | 2 +-
 drivers/net/wireguard/selftest/allowedips.c               | 4 ++--
 drivers/scsi/lpfc/lpfc_hbadisc.c                          | 6 +++---
 lib/test_vmalloc.c                                        | 2 +-
 net/dccp/ipv4.c                                           | 4 ++--
 net/ipv4/datagram.c                                       | 2 +-
 net/ipv4/ip_output.c                                      | 2 +-
 net/ipv4/tcp_ipv4.c                                       | 4 ++--
 net/mac80211/scan.c                                       | 2 +-
 net/netfilter/nf_nat_core.c                               | 4 ++--
 net/sched/sch_cake.c                                      | 6 +++---
 net/sched/sch_sfb.c                                       | 2 +-
 net/sctp/socket.c                                         | 2 +-
 19 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/crypto/testmgr.c b/crypto/testmgr.c
index be45217acde4..981c637fa2ed 100644
--- a/crypto/testmgr.c
+++ b/crypto/testmgr.c
@@ -927,7 +927,7 @@ static void generate_random_bytes(u8 *buf, size_t count)
 			b = 0xff;
 			break;
 		default:
-			b = (u8)prandom_u32();
+			b = get_random_u8();
 			break;
 		}
 		memset(buf, b, count);
@@ -935,8 +935,8 @@ static void generate_random_bytes(u8 *buf, size_t count)
 		break;
 	case 2:
 		/* Ascending or descending bytes, plus optional mutations */
-		increment = (u8)prandom_u32();
-		b = (u8)prandom_u32();
+		increment = get_random_u8();
+		b = get_random_u8();
 		for (i = 0; i < count; i++, b += increment)
 			buf[i] = b;
 		mutate_buffer(buf, count);
@@ -944,7 +944,7 @@ static void generate_random_bytes(u8 *buf, size_t count)
 	default:
 		/* Fully random bytes */
 		for (i = 0; i < count; i++)
-			buf[i] = (u8)prandom_u32();
+			buf[i] = get_random_u8();
 	}
 }
 
diff --git a/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c b/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
index 9b7bcdce6e44..303d02b1d71c 100644
--- a/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
+++ b/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
@@ -870,7 +870,7 @@ static void precalculate_color(struct tpg_data *tpg, int k)
 		g = tpg_colors[col].g;
 		b = tpg_colors[col].b;
 	} else if (tpg->pattern == TPG_PAT_NOISE) {
-		r = g = b = prandom_u32_max(256);
+		r = g = b = get_random_u8();
 	} else if (k == TPG_COLOR_RANDOM) {
 		r = g = b = tpg->qual_offset + prandom_u32_max(196);
 	} else if (k >= TPG_COLOR_RAMP) {
diff --git a/drivers/media/test-drivers/vivid/vivid-radio-rx.c b/drivers/media/test-drivers/vivid/vivid-radio-rx.c
index 232cab508f48..8bd09589fb15 100644
--- a/drivers/media/test-drivers/vivid/vivid-radio-rx.c
+++ b/drivers/media/test-drivers/vivid/vivid-radio-rx.c
@@ -104,8 +104,8 @@ ssize_t vivid_radio_rx_read(struct file *file, char __user *buf,
 				break;
 			case 2:
 				rds.block |= V4L2_RDS_BLOCK_ERROR;
-				rds.lsb = prandom_u32_max(256);
-				rds.msb = prandom_u32_max(256);
+				rds.lsb = get_random_u8();
+				rds.msb = get_random_u8();
 				break;
 			case 3: /* Skip block altogether */
 				if (i)
diff --git a/drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_cm.c b/drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_cm.c
index ddfe9208529a..ac452a0111a9 100644
--- a/drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_cm.c
+++ b/drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_cm.c
@@ -1467,7 +1467,7 @@ static void make_established(struct sock *sk, u32 snd_isn, unsigned int opt)
 	tp->write_seq = snd_isn;
 	tp->snd_nxt = snd_isn;
 	tp->snd_una = snd_isn;
-	inet_sk(sk)->inet_id = prandom_u32();
+	inet_sk(sk)->inet_id = get_random_u16();
 	assign_rxopt(sk, opt);
 
 	if (tp->rcv_wnd > (RCV_BUFSIZ_M << 10))
diff --git a/drivers/net/hamradio/baycom_epp.c b/drivers/net/hamradio/baycom_epp.c
index 7df78a721b04..791b4a53d69f 100644
--- a/drivers/net/hamradio/baycom_epp.c
+++ b/drivers/net/hamradio/baycom_epp.c
@@ -438,7 +438,7 @@ static int transmit(struct baycom_state *bc, int cnt, unsigned char stat)
 			if ((--bc->hdlctx.slotcnt) > 0)
 				return 0;
 			bc->hdlctx.slotcnt = bc->ch_params.slottime;
-			if (prandom_u32_max(256) > bc->ch_params.ppersist)
+			if (get_random_u8() > bc->ch_params.ppersist)
 				return 0;
 		}
 	}
diff --git a/drivers/net/hamradio/hdlcdrv.c b/drivers/net/hamradio/hdlcdrv.c
index 360d041a62c4..6c6f11d3d0aa 100644
--- a/drivers/net/hamradio/hdlcdrv.c
+++ b/drivers/net/hamradio/hdlcdrv.c
@@ -377,7 +377,7 @@ void hdlcdrv_arbitrate(struct net_device *dev, struct hdlcdrv_state *s)
 	if ((--s->hdlctx.slotcnt) > 0)
 		return;
 	s->hdlctx.slotcnt = s->ch_params.slottime;
-	if (prandom_u32_max(256) > s->ch_params.ppersist)
+	if (get_random_u8() > s->ch_params.ppersist)
 		return;
 	start_tx(dev, s);
 }
diff --git a/drivers/net/hamradio/yam.c b/drivers/net/hamradio/yam.c
index 97a6cc5c7ae8..2ed2f836f09a 100644
--- a/drivers/net/hamradio/yam.c
+++ b/drivers/net/hamradio/yam.c
@@ -626,7 +626,7 @@ static void yam_arbitrate(struct net_device *dev)
 	yp->slotcnt = yp->slot / 10;
 
 	/* is random > persist ? */
-	if (prandom_u32_max(256) > yp->pers)
+	if (get_random_u8() > yp->pers)
 		return;
 
 	yam_start_tx(dev, yp);
diff --git a/drivers/net/wireguard/selftest/allowedips.c b/drivers/net/wireguard/selftest/allowedips.c
index 41db10f9be49..dd897c0740a2 100644
--- a/drivers/net/wireguard/selftest/allowedips.c
+++ b/drivers/net/wireguard/selftest/allowedips.c
@@ -310,7 +310,7 @@ static __init bool randomized_test(void)
 			for (k = 0; k < 4; ++k)
 				mutated[k] = (mutated[k] & mutate_mask[k]) |
 					     (~mutate_mask[k] &
-					      prandom_u32_max(256));
+					      get_random_u8());
 			cidr = prandom_u32_max(32) + 1;
 			peer = peers[prandom_u32_max(NUM_PEERS)];
 			if (wg_allowedips_insert_v4(&t,
@@ -354,7 +354,7 @@ static __init bool randomized_test(void)
 			for (k = 0; k < 4; ++k)
 				mutated[k] = (mutated[k] & mutate_mask[k]) |
 					     (~mutate_mask[k] &
-					      prandom_u32_max(256));
+					      get_random_u8());
 			cidr = prandom_u32_max(128) + 1;
 			peer = peers[prandom_u32_max(NUM_PEERS)];
 			if (wg_allowedips_insert_v6(&t,
diff --git a/drivers/scsi/lpfc/lpfc_hbadisc.c b/drivers/scsi/lpfc/lpfc_hbadisc.c
index 2645def612e6..26d1779cb570 100644
--- a/drivers/scsi/lpfc/lpfc_hbadisc.c
+++ b/drivers/scsi/lpfc/lpfc_hbadisc.c
@@ -2150,8 +2150,8 @@ lpfc_check_pending_fcoe_event(struct lpfc_hba *phba, uint8_t unreg_fcf)
  * This function makes an running random selection decision on FCF record to
  * use through a sequence of @fcf_cnt eligible FCF records with equal
  * probability. To perform integer manunipulation of random numbers with
- * size unit32_t, the lower 16 bits of the 32-bit random number returned
- * from prandom_u32() are taken as the random random number generated.
+ * size unit32_t, a 16-bit random number returned from get_random_u16() is
+ * taken as the random random number generated.
  *
  * Returns true when outcome is for the newly read FCF record should be
  * chosen; otherwise, return false when outcome is for keeping the previously
@@ -2163,7 +2163,7 @@ lpfc_sli4_new_fcf_random_select(struct lpfc_hba *phba, uint32_t fcf_cnt)
 	uint32_t rand_num;
 
 	/* Get 16-bit uniform random number */
-	rand_num = 0xFFFF & prandom_u32();
+	rand_num = get_random_u16();
 
 	/* Decision with probability 1/fcf_cnt */
 	if ((fcf_cnt * rand_num) < 0xFFFF)
diff --git a/lib/test_vmalloc.c b/lib/test_vmalloc.c
index 56ffaa8dd3f6..0131ed2cd1bd 100644
--- a/lib/test_vmalloc.c
+++ b/lib/test_vmalloc.c
@@ -80,7 +80,7 @@ static int random_size_align_alloc_test(void)
 	int i;
 
 	for (i = 0; i < test_loop_count; i++) {
-		rnd = prandom_u32();
+		rnd = get_random_u8();
 
 		/*
 		 * Maximum 1024 pages, if PAGE_SIZE is 4096.
diff --git a/net/dccp/ipv4.c b/net/dccp/ipv4.c
index da6e3b20cd75..301799e7fa56 100644
--- a/net/dccp/ipv4.c
+++ b/net/dccp/ipv4.c
@@ -123,7 +123,7 @@ int dccp_v4_connect(struct sock *sk, struct sockaddr *uaddr, int addr_len)
 						    inet->inet_daddr,
 						    inet->inet_sport,
 						    inet->inet_dport);
-	inet->inet_id = prandom_u32();
+	inet->inet_id = get_random_u16();
 
 	err = dccp_connect(sk);
 	rt = NULL;
@@ -422,7 +422,7 @@ struct sock *dccp_v4_request_recv_sock(const struct sock *sk,
 	RCU_INIT_POINTER(newinet->inet_opt, rcu_dereference(ireq->ireq_opt));
 	newinet->mc_index  = inet_iif(skb);
 	newinet->mc_ttl	   = ip_hdr(skb)->ttl;
-	newinet->inet_id   = prandom_u32();
+	newinet->inet_id   = get_random_u16();
 
 	if (dst == NULL && (dst = inet_csk_route_child_sock(sk, newsk, req)) == NULL)
 		goto put_and_exit;
diff --git a/net/ipv4/datagram.c b/net/ipv4/datagram.c
index ffd57523331f..fefc5d855a66 100644
--- a/net/ipv4/datagram.c
+++ b/net/ipv4/datagram.c
@@ -71,7 +71,7 @@ int __ip4_datagram_connect(struct sock *sk, struct sockaddr *uaddr, int addr_len
 	reuseport_has_conns(sk, true);
 	sk->sk_state = TCP_ESTABLISHED;
 	sk_set_txhash(sk);
-	inet->inet_id = prandom_u32();
+	inet->inet_id = get_random_u16();
 
 	sk_dst_set(sk, &rt->dst);
 	err = 0;
diff --git a/net/ipv4/ip_output.c b/net/ipv4/ip_output.c
index 04e2034f2f8e..a4fbdbff14b3 100644
--- a/net/ipv4/ip_output.c
+++ b/net/ipv4/ip_output.c
@@ -172,7 +172,7 @@ int ip_build_and_send_pkt(struct sk_buff *skb, const struct sock *sk,
 		 * Avoid using the hashed IP ident generator.
 		 */
 		if (sk->sk_protocol == IPPROTO_TCP)
-			iph->id = (__force __be16)prandom_u32();
+			iph->id = (__force __be16)get_random_u16();
 		else
 			__ip_select_ident(net, iph, 1);
 	}
diff --git a/net/ipv4/tcp_ipv4.c b/net/ipv4/tcp_ipv4.c
index 5b019ba2b9d2..747752980983 100644
--- a/net/ipv4/tcp_ipv4.c
+++ b/net/ipv4/tcp_ipv4.c
@@ -303,7 +303,7 @@ int tcp_v4_connect(struct sock *sk, struct sockaddr *uaddr, int addr_len)
 						 inet->inet_daddr);
 	}
 
-	inet->inet_id = prandom_u32();
+	inet->inet_id = get_random_u16();
 
 	if (tcp_fastopen_defer_connect(sk, &err))
 		return err;
@@ -1523,7 +1523,7 @@ struct sock *tcp_v4_syn_recv_sock(const struct sock *sk, struct sk_buff *skb,
 	inet_csk(newsk)->icsk_ext_hdr_len = 0;
 	if (inet_opt)
 		inet_csk(newsk)->icsk_ext_hdr_len = inet_opt->opt.optlen;
-	newinet->inet_id = prandom_u32();
+	newinet->inet_id = get_random_u16();
 
 	/* Set ToS of the new socket based upon the value of incoming SYN.
 	 * ECT bits are set later in tcp_init_transfer().
diff --git a/net/mac80211/scan.c b/net/mac80211/scan.c
index c4f2aeb31da3..6cab549cc421 100644
--- a/net/mac80211/scan.c
+++ b/net/mac80211/scan.c
@@ -641,7 +641,7 @@ static void ieee80211_send_scan_probe_req(struct ieee80211_sub_if_data *sdata,
 		if (flags & IEEE80211_PROBE_FLAG_RANDOM_SN) {
 			struct ieee80211_hdr *hdr = (void *)skb->data;
 			struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
-			u16 sn = get_random_u32();
+			u16 sn = get_random_u16();
 
 			info->control.flags |= IEEE80211_TX_CTRL_NO_SEQNO;
 			hdr->seq_ctrl =
diff --git a/net/netfilter/nf_nat_core.c b/net/netfilter/nf_nat_core.c
index 7981be526f26..57c7686ac485 100644
--- a/net/netfilter/nf_nat_core.c
+++ b/net/netfilter/nf_nat_core.c
@@ -468,7 +468,7 @@ static void nf_nat_l4proto_unique_tuple(struct nf_conntrack_tuple *tuple,
 	if (range->flags & NF_NAT_RANGE_PROTO_OFFSET)
 		off = (ntohs(*keyptr) - ntohs(range->base_proto.all));
 	else
-		off = prandom_u32();
+		off = get_random_u16();
 
 	attempts = range_size;
 	if (attempts > max_attempts)
@@ -490,7 +490,7 @@ static void nf_nat_l4proto_unique_tuple(struct nf_conntrack_tuple *tuple,
 	if (attempts >= range_size || attempts < 16)
 		return;
 	attempts /= 2;
-	off = prandom_u32();
+	off = get_random_u16();
 	goto another_round;
 }
 
diff --git a/net/sched/sch_cake.c b/net/sched/sch_cake.c
index a43a58a73d09..637ef1757931 100644
--- a/net/sched/sch_cake.c
+++ b/net/sched/sch_cake.c
@@ -2092,11 +2092,11 @@ static struct sk_buff *cake_dequeue(struct Qdisc *sch)
 
 		WARN_ON(host_load > CAKE_QUEUES);
 
-		/* The shifted prandom_u32() is a way to apply dithering to
-		 * avoid accumulating roundoff errors
+		/* The get_random_u16() is a way to apply dithering to avoid
+		 * accumulating roundoff errors
 		 */
 		flow->deficit += (b->flow_quantum * quantum_div[host_load] +
-				  (prandom_u32() >> 16)) >> 16;
+				  get_random_u16()) >> 16;
 		list_move_tail(&flow->flowchain, &b->old_flows);
 
 		goto retry;
diff --git a/net/sched/sch_sfb.c b/net/sched/sch_sfb.c
index 2829455211f8..7eb70acb4d58 100644
--- a/net/sched/sch_sfb.c
+++ b/net/sched/sch_sfb.c
@@ -379,7 +379,7 @@ static int sfb_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 		goto enqueue;
 	}
 
-	r = prandom_u32() & SFB_MAX_PROB;
+	r = get_random_u16() & SFB_MAX_PROB;
 
 	if (unlikely(r < p_min)) {
 		if (unlikely(p_min > SFB_MAX_PROB / 2)) {
diff --git a/net/sctp/socket.c b/net/sctp/socket.c
index 1e354ba44960..83628c347744 100644
--- a/net/sctp/socket.c
+++ b/net/sctp/socket.c
@@ -9448,7 +9448,7 @@ void sctp_copy_sock(struct sock *newsk, struct sock *sk,
 	newinet->inet_rcv_saddr = inet->inet_rcv_saddr;
 	newinet->inet_dport = htons(asoc->peer.port);
 	newinet->pmtudisc = inet->pmtudisc;
-	newinet->inet_id = prandom_u32();
+	newinet->inet_id = get_random_u16();
 
 	newinet->uc_ttl = inet->uc_ttl;
 	newinet->mc_loop = 1;
-- 
2.37.3

