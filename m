Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C63A9DD102
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2019 23:18:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46vzRY6ylxzDqsl
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Oct 2019 08:18:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46vqXX1DRSzDvHQ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Oct 2019 02:22:35 +1100 (AEDT)
Received: by verein.lst.de (Postfix, from userid 2407)
 id E74F668BFE; Fri, 18 Oct 2019 17:22:26 +0200 (CEST)
Date: Fri, 18 Oct 2019 17:22:26 +0200
From: Christoph Hellwig <hch@lst.de>
To: Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH v2 00/33] Kill pr_warning in the whole linux code
Message-ID: <20191018152226.GA32150@lst.de>
References: <20191018031710.41052-1-wangkefeng.wang@huawei.com>
 <20191018142626.vmbgclelw23h5pdn@pathway.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191018142626.vmbgclelw23h5pdn@pathway.suse.cz>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Sat, 19 Oct 2019 08:15:32 +1100
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Rich Felker <dalias@libc.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Palmer Dabbelt <palmer@sifive.com>, Alexei Starovoitov <ast@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, David Howells <dhowells@redhat.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 Frank Rowand <frowand.list@gmail.com>, Christoph Hellwig <hch@lst.de>,
 drbd-dev@lists.linbit.com, Song Liu <songliubraving@fb.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Daniel Borkmann <daniel@iogearbox.net>, Jiri Olsa <jolsa@redhat.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-afs@lists.infradead.org,
 Peter Zijlstra <peterz@infradead.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Darren Hart <dvhart@infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Len Brown <lenb@kernel.org>,
 Fenghua Yu <fenghua.yu@intel.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Robert Richter <rric@kernel.org>, Will Deacon <will@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Arnaldo Carvalho de Melo <acme@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Lars Ellenberg <lars.ellenberg@linbit.com>,
 linux-fbdev@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Andy Whitcroft <apw@canonical.com>, Takashi Iwai <tiwai@suse.com>,
 bpf@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 Karsten Keil <isdn@linux-pingi.de>, Tony Luck <tony.luck@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Sangbeom Kim <sbkim73@samsung.com>, Robin Murphy <robin.murphy@arm.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Martin KaFai Lau <kafai@fb.com>, Yonghong Song <yhs@fb.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 James Morse <james.morse@arm.com>, Corentin Chary <corentin.chary@gmail.com>,
 Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 Andy Shevchenko <andy@infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As I said before: please just send Linus a scripted conversion after
the next -rc1.  There is no point in creating all this churn.
